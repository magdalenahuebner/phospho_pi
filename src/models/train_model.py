# Libraries
import pandas as pd
import random
import os

from pathlib import Path

from src.models import build_model, predict_model


# Loading data from files
def get_data(path_to_data):

    paths = dict()
    paths['indir'] = path_to_data
    paths['activity'] = paths['indir'] + 'activity.txt'
    paths['fold_change'] = paths['indir'] + 'fold_change.txt'
    paths['occupancy'] = paths['indir'] + 'occupancy.txt'
    #paths['modification'] = paths['indir'] + 'modification.txt'

    data = dict()
    for key, value in paths.items():
        if Path(value).is_file():
            data[key] = pd.read_table(value, header=None)[0].tolist()

    return data


# Loading prior knowledge from files
def get_pk(path_to_data):

    paths = dict()
    paths['indir'] = path_to_data
    paths['enzyme'] = paths['indir'] + 'enzyme.txt'
    paths['phosphosite'] = paths['indir'] + 'phosphosite.txt'
    paths['interaction'] = paths['indir'] + 'interaction.txt'
    paths['enz_class'] = paths['indir'] + 'enz_class.txt'

    data = dict()
    for key, value in paths.items():
        if Path(value).is_file():
            data[key] = pd.read_table(value, header=None)[0].tolist()

    return data


# Splitting data into train/test set
def split_data_by_sample(facts_lst, training = 0.8):

    facts_dict = build_model.sort_by_sample(facts_lst)
    n_train = round(len(facts_dict) * training)
    
    all_keys = list(facts_dict)
    all_keys.sort()
    random.seed(612)
    keys = random.sample(all_keys, n_train)
    
    train_set = []
    [train_set.extend(facts_dict[k]) for k in keys]
    test_set = []
    [test_set.extend(facts_dict[k]) for k in set(facts_dict) - set(keys)]

    return train_set, test_set


def infer_occupancy(model, path_to_data, pk_dict, mode='mpe'):
    inference_template = f'models/templates/{model}_inference.pl'
    inference_model = f'{path_to_data}infer_occupancy.pl'
    build_model.add_pk(inference_template, inference_model, pk_dict)
    data = get_data(path_to_data)
    activities = {'activity': data['activity']}
    inferred_data = predict_model.infer_data(inference_model, inference_model, activities, path_to_data, targets=['occupancy'], infer_from='facts', mode=mode)

    if mode == 'inference':
        [inferred_data['occupancy'].to_csv(f'{path_to_data}{predicate}_inference.csv') for predicate in inferred_data.keys()]
        pred_dict = inferred_data.copy()
        inferred_data = predict_model.get_mpe_from_inference(pred_dict)

    # write to file
    build_model.write_predicate_files(inferred_data, path_to_data)

    return pred_dict


def main(experiment, path_to_data, model_template, training = 0.8, max_iter = 500, evidence = [], facts = [], init_occupancy = 'expected', interactions = [], suffix = ''):

    DIRECTORY = f'./models/{experiment}/'

    if not os.path.exists(DIRECTORY):
        os.makedirs(DIRECTORY)

    # loading data
    data = get_data(path_to_data)

    # initalising occupancy
    if init_occupancy == 'fc':
        data['occupancy'] = data['fold_change']
        data['occupancy'] = [fact.replace('fold_change', 'occupancy') for fact in data['occupancy']]
    
    # merging data
    facts_lst = []
    [facts_lst.extend(value) for value in data.values()]

    # splitting data
    if training == 1:
        train_set = facts_lst.copy()
        test_set = []
    else:
        print('Splitting data...')
        train_set, test_set = split_data_by_sample(facts_lst = facts_lst, training = training)

    # writing train/test data to files
    print('Writing data to files...')
    build_model.write_predicate_files(train_set, f'{DIRECTORY}training{suffix}/') # change, but need to change read data function to regex first
    build_model.write_predicate_files(test_set, f'{DIRECTORY}testing{suffix}/')
    # writing evidence to file
    train_set = build_model.sort_by_predicate(train_set)
    print('Writing evidence to file...')
    build_model.write_evidence_file(train_set, f'{DIRECTORY}evidence{suffix}.pl', evidence = evidence)

    if len(interactions) > 0:
        model_lfi = f'{DIRECTORY}model{suffix}.pl'
        build_model.remove_facts(model_in = model_template, model_out = model_lfi, facts_dict = interactions)
        build_model.add_facts(model_lfi, model_lfi, interactions)
        model_template = model_lfi

    if len(facts) > 0:
        model_lfi = f'{DIRECTORY}model{suffix}.pl'
        facts_dict = {key: train_set[key] for key in facts}
        build_model.remove_facts(model_in = model_template, model_out = model_lfi, facts_dict = facts_dict)
        build_model.add_facts(model_lfi, model_lfi, facts_dict)
        model_template = model_lfi

    # learning from interpretation
    print('Starting LFI...')
    cmd = f'problog lfi {model_template} {DIRECTORY}evidence{suffix}.pl -O {DIRECTORY}model_trained{suffix}.pl --normalize -k sdd -v -n {max_iter}'
    print(cmd)
    os.system(cmd)


if __name__ == "__main__":

    main()