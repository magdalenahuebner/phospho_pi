# Libraries
import pandas as pd
import numpy as np
import os

from pathlib import Path

from src.models import build_model, predict_model


# Loading data from files
def get_data(path_to_data):

    paths = dict()
    paths['indir'] = path_to_data
    paths['activity'] = paths['indir'] + 'activity.txt'
    paths['fold_change'] = paths['indir'] + 'fold_change.txt'
    #paths['occupancy'] = paths['indir'] + 'occupancy.txt'
    #paths['modification'] = paths['indir'] + 'modification.txt'

    data = dict()
    for key, value in paths.items():
        if Path(value).is_file():
            data[key] = pd.read_table(value, header=None)[0].tolist()

    return data


# Sampling
def sample_data(model, sampling_model, PATH_TO_MODEL, PATH_TO_DATA, n_samples):
    # generating sampling script containing n samples
    sampling_script = f'{PATH_TO_MODEL}{model}_sampling_n{n_samples}.pl'
    build_model.add_samples(model_in = sampling_model, model_out = sampling_script, n_samples = n_samples)
    # sampling data
    sampling_result = f'{PATH_TO_DATA}sampled_data.txt'
    cmd = f'problog sample {sampling_script} -N 1 -s 612 -o {sampling_result}'
    print('Sampling data...')
    os.system(cmd)
    print('Finished sampling...')
    # converting sampling result to facts
    sampled_data = predict_model.results_file_to_dict(sampling_result, mpe=False)
    
    return sampled_data


# OLD VERSION: multiple examples (evidence) and queries at the same time

# def generate_inference_script(inference_template, PATH_TO_MODEL, n_samples, sampled_data:dict):
#     # generating inference script containing sampled data
#     inference_script = f'{PATH_TO_MODEL}infer_n{n_samples}.pl'
#     build_model.add_samples(model_in = inference_template, model_out = inference_script, n_samples = n_samples)
#     build_model.add_evidence(model_in = inference_script, model_out = inference_script, facts_dict = sampled_data)

#     return inference_script


# def infer_data(inference_template, PATH_TO_MODEL, PATH_TO_DATA, n_samples, sampled_data:dict):
#     # generating inference script containing sampled data
#     inference_script = generate_inference_script(inference_template, PATH_TO_MODEL, n_samples, sampled_data)
#     #  inferring remaining data
#     inference_result = f'{PATH_TO_DATA}inferred_data.txt'
#     cmd = f'problog mpe {inference_script} -o {inference_result}'
#     print('Inferring data...')
#     os.system(cmd)
#     print('Finished inference...')
#     # converting inference result to facts
#     inferred_data = predict_model.results_file_to_dict(inference_result, mpe=True)

#     return inferred_data


# Inference
def infer_example(inference_script, inference_result, sample, targets=[]):
    # remove queries from script
    build_model.remove_queries(model_in = inference_script, model_out = inference_script)
    #  inferring remaining data
    query = predict_model.define_query(sample = sample, targets = targets)
    build_model.insert_queries(inference_script, inference_script, queries_dict = query)
    cmd = f'problog mpe {inference_script} -o {inference_result}'
    print(f'Inferring data ({sample})...')
    os.system(cmd)
    print(f'Finished inference ({sample})...')    


def infer_data(inference_template, inference_script, facts_dict:dict, PATH_TO_PREDICT, targets=[], infer_from='evidence'):
    
    samples=build_model.get_samples(facts_dict)

    # generating inference script containing sampled data as FACTS
    if infer_from == 'facts':
        build_model.add_facts(model_in = inference_template, model_out = inference_script, facts_dict = facts_dict)

    inference_result = f'{PATH_TO_PREDICT}inferred_example.txt'
    inferred_data = {}

    for s in samples:
        # generating inference script containing sampled data as EVIDENCE
        if infer_from == 'evidence':
            examples = build_model.sort_by_sample(facts_dict)
            example = examples[s]
            build_model.remove_evidence(model_in = inference_template, model_out = inference_script)
            build_model.insert_evidence(model_in = inference_script, model_out = inference_script, facts_dict = example)

        # infer values for ONE sample
        infer_example(inference_script, inference_result, sample = s, targets=targets)
        # converting inference result to facts
        inferred_example = predict_model.results_file_to_dict(inference_result, mpe=True)
        inferred_data = build_model.merge_dictionary(inferred_data, inferred_example)

    return inferred_data


# Mutate data
def mutate_facts(facts_lst:list, frac = 0.2, sample_seed=612, value_seed=612, enzymes=[]):
    predicate = build_model.get_predicate_name(facts_lst)
    mutate = build_model.get_structure(predicate, 'y')

    df = build_model.facts_to_df(facts_lst)
    df = df.sort_values(by=['sample'])
    df_sample = df.copy()
    if predicate in ['activity', 'modification']:
        df_sample = df.sort_values(by=['sample', 'enzyme'])
        if len(enzymes) > 0:
            df_sample = df_sample[df_sample['enzyme'].isin(enzymes)]

    df_sampled = df_sample.sample(frac=frac, replace=False, random_state=sample_seed) # ad random state to arguments so can decide whether same sample mutated or not?
    df_mutate = df_sampled.copy()
    values = list(set(df_sample[mutate]))
    for v in values:
        m = df_sampled[mutate].eq(v)
        np.random.seed(value_seed)
        df_mutate.loc[m, mutate] = np.random.choice(list(set(values) - {v}), size=m.sum())

    df.update(df_mutate)
    df = df.drop(columns=['fact'])

    facts_mutated = build_model.df_to_facts(df, predicate)

    return facts_mutated


# Generate incomplete data
def remove_facts(facts_lst:list, frac = 0.2, sample_seed=612):
    predicate = build_model.get_predicate_name(facts_lst)
    df = build_model.facts_to_df(facts_lst)
    df = df.sort_values(by=['sample'])
    if predicate in ['activity', 'modification']:
        df = df.sort_values(by=['sample', 'enzyme'])
    remove_n = round(len(df.index) * frac)
    np.random.seed(sample_seed)
    drop_indices = np.random.choice(df.index, remove_n, replace=False)
    df = df.drop(drop_indices)
    df = df.drop(columns=['fact'])
    facts = build_model.df_to_facts(df, predicate)

    return facts


def main(model, n_samples, sampling_model, inference_model, targets=[], infer_from='facts', suffix=''):

    # models
    PATH_TO_MODEL = f'models/synthetic_data/'
    inference_script = f'{PATH_TO_MODEL}{model}_inference{suffix}.pl'

    # synthetic data
    PATH_TO_DATA = f'data/processed/synthetic_data/{model}/n{n_samples}/'

    if not os.path.exists(PATH_TO_MODEL):
        os.makedirs(PATH_TO_MODEL)

    if not os.path.exists(PATH_TO_DATA):
        os.makedirs(PATH_TO_DATA)

    # generating synthetic data - part 1 (SAMPLING)
    sampled_data = sample_data(model, sampling_model, PATH_TO_MODEL, PATH_TO_DATA, n_samples)
    # generating synthetic data - part 2 (INFERENCE)
    inferred_data = predict_model.infer_data(inference_model, inference_script, sampled_data, PATH_TO_DATA, targets=targets, infer_from=infer_from, mode='mpe')
    # merging predicates
    data = sampled_data | inferred_data
    # saving data to files
    build_model.write_predicate_files(data, PATH_TO_DATA)

    return data


if __name__ == "__main__":

    main()