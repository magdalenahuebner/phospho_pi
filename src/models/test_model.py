# Libraries
import pandas as pd
import os

from sklearn.metrics import classification_report, cohen_kappa_score
from sklearn import preprocessing

from pathlib import Path

from src.models import build_model, predict_model
from src.visualization import visualize


# Loading data from files
def get_data(path_to_data):

    paths = dict()
    paths['indir'] = path_to_data
    paths['activity'] = paths['indir'] + 'activity.txt' # activity\w*\.txt
    paths['fold_change'] = paths['indir'] + 'fold_change.txt'
    paths['occupancy'] = paths['indir'] + 'occupancy.txt'

    data = dict()
    for key, value in paths.items():
        if Path(value).is_file():
            data[key] = pd.read_table(value, header=None)[0].tolist()

    return data


# Remove target variable from test data
def remove_targets(data, targets = []):
    # remove target variables to get predictors only
    predictors = list(data.keys() - set(targets))
    # subsetting data
    data = {key: data[key] for key in predictors}

    return data


# Comparing predicted to 'true' facts (generates confusion matrix and performance report)
def pred_vs_true(facts_pred, facts_true, target, outpath):
    pred_df = build_model.facts_to_df(facts_pred)
    true_df = build_model.facts_to_df(facts_true)
    # generate dataframe to compare y_pred and y_true
    merge_on = build_model.get_structure(target, 'merge_on')
    y = build_model.get_structure(target, 'y')
    compare_df = pd.merge(pred_df, true_df, on=merge_on, how = 'inner', suffixes=('_pred', '_true'))
    y_pred = compare_df[f'{y}_pred']
    y_true = compare_df[f'{y}_true']
    # plot confusion matrix
    visualize.plot_cm(y_pred, y_true, xlabel = f'{y}_pred ({len(facts_pred)})', ylabel = f'{y}_true ({len(facts_true)})', value_labels = ['inc', 'baseline', 'dec'], path = outpath, title_suffix = target)
    visualize.plot_cm(y_pred, y_true, xlabel = f'{y}_pred ({len(facts_pred)})', ylabel = f'{y}_true ({len(facts_true)})', value_labels = ['inc', 'baseline', 'dec'], path = outpath, title_suffix = target, normalize='all')
    # generate classification report
    report = classification_report(y_true = y_true, y_pred = y_pred, output_dict=True)
    report['coverage'] = len(facts_pred) / len(facts_true)
    report['n_pred'] = len(facts_pred)
    report['accuracy_norm'] = report['accuracy'] * report['coverage']
    df = pd.DataFrame(report).transpose()
    df.to_csv(f'{outpath}report_{target}.csv')

    return compare_df, report


# Comparing two features to each other (generates confusion matrix and cohen_kappa_score)
def ft1_vs_ft2(facts_ft1, facts_ft2, ft1, ft2, outpath, suffix = ''):
    ft1_df = build_model.facts_to_df(facts_ft1)
    ft2_df = build_model.facts_to_df(facts_ft2)
    # generate dataframe to compare ft1 and ft2
    merge_on = build_model.get_structure(ft1, 'merge_on')
    y1 = build_model.get_structure(ft1, 'y')
    y2 = build_model.get_structure(ft2, 'y')
    compare_df = pd.merge(ft1_df, ft2_df, on=merge_on, how = 'inner')
    y_ft1 = compare_df[y1]
    y_ft2 = compare_df[y2]
    # plot confusion matrix
    visualize.plot_cm(y_ft1, y_ft2, xlabel = y1, ylabel = y2, value_labels = ['inc', 'baseline', 'dec'], path = outpath, title_suffix = f'{ft1}_vs_{ft2}{suffix}')
    visualize.plot_cm(y_ft1, y_ft2, xlabel = y1, ylabel = y2, value_labels = ['inc', 'baseline', 'dec'], path = outpath, title_suffix = f'{ft1}_vs_{ft2}{suffix}', normalize='all')

    agreement = cohen_kappa_score(y_ft1, y_ft2)

    return compare_df, agreement


# Comparing various features to each other (generates confusion matrix for different contrasts)
def feature_comparison(facts_dict, contrasts, outpath):
    compare_df = dict()
    agreement = dict()
    for c in contrasts:
        if all(value in c for value in ['occupancy', 'modification']):
            facts_ft1 = facts_dict['occupancy']
            ft2_df = build_model.facts_to_df(facts_dict['modification'])
            enzymes = list(set(ft2_df['enzyme']))
            for e in enzymes:
                cname = f'occupancy_vs_modification_{e}'
                facts_ft2 = ft2_df.loc[ft2_df['enzyme'] == e, 'fact'].tolist()
                compare_df[cname], agreement[cname] = ft1_vs_ft2(facts_ft1, facts_ft2, 'occupancy', 'modification', outpath, suffix = f'_{e}')
        else:
            ft1 = c[0]
            ft2 = c[1]
            cname = f'{ft1}_vs_{ft2}'
            compare_df[cname], agreement[cname] = ft1_vs_ft2(facts_dict[ft1], facts_dict[ft2], ft1, ft2, outpath)

    df = pd.DataFrame.from_dict(agreement, orient='index').transpose()
    df.to_csv(f'{outpath}agreement.csv')

    return compare_df, agreement


# Generating confusion matrix of features
def feature_correlation(facts_dict, outpath):
    for predicate, facts in facts_dict.items():
        facts_dict[predicate] = build_model.facts_to_df(facts)
        facts_dict[predicate] = facts_dict[predicate].drop('fact', axis=1)
        if 'enzyme' in facts_dict[predicate].columns:
            y = build_model.get_structure(predicate, 'y')
            facts_dict[predicate] = facts_dict[predicate].pivot(index='sample',
                                                                columns='enzyme',
                                                                values=y).add_prefix(f'{y}_').rename_axis(None, axis=1).reset_index()
    merged_df = pd.concat(objs=(iDF.set_index('sample') for iDF in tuple(facts_dict.values())), axis=1, join='inner').reset_index()
    merged_df = merged_df.loc[:,~merged_df.columns.duplicated()]
    merged_df = merged_df.drop(['sample', 'phosphosite'], axis=1)
        
    le = preprocessing.LabelEncoder()

    merged_df = merged_df.stack(dropna=False).to_frame().apply(le.fit_transform)[0].unstack()
    merged_dict = merged_df.to_dict('list')
    visualize.plot_ftcorr(merged_dict, outpath)

    return facts_dict


def main(experiment, path_to_data, path_to_truth, model_trained, targets = [], test_on = 'testing', compare = 'testing', mode = 'mpe'):

    DIRECTORY = f'./models/{experiment}/'
    PATH_TO_PREDICT = f'{DIRECTORY}predictions/'
    model_testing = f'{DIRECTORY}test_on_{test_on}.pl'

    if not os.path.exists(f'{DIRECTORY}/predictions'):
        os.makedirs(f'{DIRECTORY}/predictions')

    # loading data
    data = get_data(path_to_data)
    data = remove_targets(data, targets = targets)
    
    # making predictions with mpe
    if mode == 'mpe':
        pred_dict = predict_model.infer_data(inference_model = model_trained, inference_script = model_testing, facts_dict = data, PATH_TO_PREDICT = PATH_TO_PREDICT, targets=targets, infer_from='facts', mode='mpe')

    # making predictions with inference
    elif mode == 'inference':
        inference_dict = predict_model.infer_data(inference_model = model_trained, inference_script = model_testing, facts_dict = data, PATH_TO_PREDICT = PATH_TO_PREDICT, targets=targets, infer_from='facts', mode='inference')
        pred_dict = predict_model.get_mpe_from_inference(inference_dict)

    build_model.write_predicate_files(pred_dict, PATH_TO_PREDICT, suffix = f'_{test_on}')

    ### ANALYSIS

    if 'occupancy' and 'interaction' not in pred_dict:

        test_results = {'compare_df': None, 'report': None, 'feature_df': None, 'agreement': None, 'data_dict': None}
        print('Unable to predict occupancy...')

        return test_results


    REPORTS = f'./reports/figures/{experiment}/testing/{test_on}_vs_{compare}/'

    if not os.path.exists(REPORTS):
        os.makedirs(REPORTS)

    compare_df = dict()
    report = dict()

    for target in targets:
        
        # loading true values
        if os.path.isfile(f'{path_to_truth}{target}.txt'):
            facts_true = pd.read_table(f'{path_to_truth}{target}.txt', header=None)[0].tolist()   

            # pred vs true
            compare_df[target], report[target] = pred_vs_true(pred_dict[target], facts_true, target = target, outpath = REPORTS)
    
    # feature comparison
    data_dict = data | pred_dict
    contrasts = [['occupancy', 'fold_change'], ['activity', 'modification'], ['modification', 'occupancy']]
    ftcomp_df, agreement = feature_comparison(facts_dict = data_dict, contrasts = contrasts, outpath = REPORTS)
    feature_df = feature_correlation(facts_dict = data_dict, outpath = REPORTS)
    compare_df = compare_df | ftcomp_df

    test_results = {'compare_df': compare_df, 'report': report, 'feature_df': feature_df, 'agreement': agreement, 'data_dict': data_dict}

    return test_results


if __name__ == "__main__":

    main()