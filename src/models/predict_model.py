import pandas as pd
import numpy as np
import os

from src.models import build_model, test_model


### WRITING QUERIES

# Define queries for testing
def define_query(sample:str, targets = []):
    # defining query templates
    queries = dict()
    queries['activity'] = f'query(activity(E,SAMPLE,_dA)).'
    queries['fold_change'] = f'query(fold_change(P,SAMPLE,_fc)).'
    queries['occupancy'] = f'query(occupancy(P,SAMPLE,_dO)).'
    queries['modification'] = f'query(modification(E,P,SAMPLE,_dM)).'
    queries['interaction'] = f'query(interaction(E,P)).'

    # filling in template with samples
    for q in targets:
        queries[q] = [queries[q].replace('SAMPLE', sample)]
    # removing irrelevant queries
    queries = {key: queries[key] for key in targets}

    return queries


# Define queries for testing
def define_queries(samples:list, targets = []):
    # defining query templates
    queries = dict()
    # filling in template with samples
    for s in samples:
        query = define_query(sample=s, targets=targets)
        queries = build_model.merge_dictionary(queries, query)

    return queries


### READING IN RESULTS

# Read in result file from sampling, mpe, etc. and convert to dictionary of facts sorted by predicate
def results_file_to_dict(file, mpe=False):
    # reading in result from sampling, inference, mpe, etc.
    data = pd.read_table(file, header=None)[0].tolist()
    if 'error' in data[0]:
        return {}
    
    # converting mpe result to facts
    if mpe:
        data = [f'{i}.' for i in data if not i.startswith('\\')]
    # splitting data into predicates
    facts_dict = build_model.sort_by_predicate(data)
        
    return facts_dict


# Read in result file from inference and convert to dictionary of facts sorted by predicate
def inference_file_to_dict(file):
    # reading in result from inference
    data = pd.read_table(file, header=None, sep=':')
    # function
    data.columns = ['fact', 'dob']
    data['fact'] = data['fact'].str.strip()
    # splitting data into predicates
    data_dict = build_model.sort_by_predicate(data['fact'].to_list())

    inference_dict = {}
    for predicate in data_dict.keys():
        df = build_model.facts_to_df(data_dict[predicate])
        df = pd.merge(df, data, on = 'fact', how = 'left')
        columns = build_model.get_structure(predicate=predicate, value='merge_on')
        df['dob_norm'] = df['dob'].div(df.groupby(columns)['dob'].transform('sum'))
        # returning fact with maximum probability
        idx = df.groupby(columns)['dob_norm'].transform(max) == df['dob_norm']
        df.loc[idx, 'dob_max'] = True
        df['dob_max'] = df['dob_max'].fillna(False).reset_index(drop=True)
        inference_dict[predicate] = df.copy()
            
    return inference_dict


def get_mpe_from_inference(inference_dict):

    mpe_dict = {}
    for predicate, df in inference_dict.items():
        p_max = df['dob_max']
        df_max = df[p_max]  # select dop_max = True rows
        columns = build_model.get_structure(predicate=predicate, value='merge_on')
        df_max = df_max[~df_max.duplicated(columns, keep=False)]  # drop duplicates (maybe need later)
        mpe_dict[predicate] = df_max['fact'].tolist()
    
    return mpe_dict


### INFERENCE

def infer_example(inference_script, inference_result, sample, targets=[], mode='inference'):
    # remove queries from script
    build_model.remove_queries(model_in = inference_script, model_out = inference_script)
    #  inferring remaining data
    query = define_query(sample = sample, targets = targets)
    build_model.insert_queries(inference_script, inference_script, queries_dict = query)
    if mode == 'inference':
        cmd = f'problog {inference_script} -o {inference_result}'
    elif mode == 'mpe':
        cmd = f'problog mpe {inference_script} -o {inference_result}'
    print(f'Inferring data ({sample})...')
    print(cmd)
    os.system(cmd)
    print(f'Finished inference ({sample})...')    


def infer_data(inference_model, inference_script, facts_dict:dict, PATH_TO_PREDICT, targets=[], infer_from='evidence', mode='inference'):
    
    samples_lst=build_model.get_samples(facts_dict)
    examples = build_model.sort_by_sample(facts_dict)

    # generating inference script containing sampled data as FACTS
    if infer_from == 'facts':
        build_model.remove_facts(model_in = inference_model, model_out = inference_script, facts_dict = facts_dict)
        build_model.add_prob1_to_facts(model_in = inference_script, model_out = inference_script, predicates = ['modification'])
        build_model.add_facts(model_in = inference_script, model_out = inference_script, facts_dict = facts_dict)

    inference_result = f'{PATH_TO_PREDICT}inferred_example.txt'
    inferred_data = {}

    for s in samples_lst:
        # generating inference script containing sampled data as EVIDENCE
        if infer_from == 'evidence':
            example = examples[s]
            build_model.add_evidence(model_in = inference_model, model_out = inference_script, facts_dict = example)

        # infer values for ONE sample
        infer_example(inference_script, inference_result, sample = s, targets=targets, mode = mode)

        if mode == 'mpe':
            # converting inference result to facts
            inferred_example = results_file_to_dict(inference_result, mpe=True)
        # if with probabilities: new function, will be dict with dfs rather than lists
        elif mode == 'inference':
            inferred_example = inference_file_to_dict(inference_result)

        inferred_data = build_model.merge_dictionary(inferred_data, inferred_example)

    return inferred_data


def main(experiment, path_to_data, model_trained, targets = [], infer_from='evidence', mode='inference', suffix = ''):

    DIRECTORY = f'./models/{experiment}/'
    PATH_TO_PREDICT = f'{DIRECTORY}predictions/'
    model_testing = f'{DIRECTORY}make_predictions.pl'

    if not os.path.exists(f'{DIRECTORY}/predictions'):
        os.makedirs(f'{DIRECTORY}/predictions')

    # loading data
    data = test_model.get_data(path_to_data) # change later, make more generic
    data = test_model.remove_targets(data, targets = targets) # change later, make more generic
    
    # making predictions with mpe
    pred_dict = infer_data(inference_model = model_trained, inference_script = model_testing, facts_dict = data, PATH_TO_PREDICT = PATH_TO_PREDICT, targets=targets, infer_from=infer_from, mode=mode)
    
    # write to file
    [pred_dict[predicate].to_csv(f'{PATH_TO_PREDICT}{predicate}_inference{suffix}.csv') for predicate in pred_dict.keys()]

    return pred_dict


if __name__ == "__main__":

    main()