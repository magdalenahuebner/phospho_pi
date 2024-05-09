# Libraries
import os
import pandas as pd
import multiprocessing
import tempfile
from multiprocessing import Manager
from functools import partial

from src.models import build_model as build
from src.models import model_schemata as schema
from src.models import parameter_learning as lfi

# INFERENCE

# Infer values for ONE sample in a dataset
def infer_example(model, output_file, query, evidence=[], mode='marginal', model_out=None):
    # remove queries from script
    if model_out is None:
        build.remove_queries(model = model)
    build.insert_statements(model, query, location = '%% QUERIES', model_out=model_out)
    if len(evidence) > 0:
        if model_out is None:
            build.remove_evidence(model = model)
            build.insert_statements(model, evidence, location = '%% EVIDENCE', model_out=model_out)
        else:
            build.insert_statements(model_out, evidence, location = '%% EVIDENCE', model_out=model_out)
    
    if model_out is None:
        model_out = model
    # run inference
    if mode == 'marginal':
        cmd = f'problog {model_out} -o {output_file} -k ddnnf -v'
    elif mode == 'mpe':
        cmd = f'problog mpe {model_out} -o {output_file} -v'
    print(f'Inferring data ({query})...')
    print(cmd)
    os.system(cmd)
    print(f'Finished inference ({query})...')

# Infer values for all samples in a dataset
def infer_mpe(model, queries, output_file, evidence=[]):
    
    inferred_data = {}
    
    # Ensure evidence is a list of the same length as queries or empty
    if len(evidence) == 0:
        evidence = [[]] * len(queries)

    for query, evidence in zip(queries, evidence):
        # if singel query, convert to list
        if type(query) == str:
            query = [query]
        if type(evidence) == str:
            evidence = [evidence]
        print(query)
        # infer values for ONE sample
        infer_example(model, output_file, query, evidence, mode='mpe')

       # converting inference result to facts
        inferred_example = mpe_file_to_dict(output_file)
        
        inferred_data = build.merge_dictionary(inferred_data, inferred_example)
        inferred_data = {k:v for k,v in inferred_data.items() if not v.empty}

    return inferred_data

# Infer values for all samples in a dataset
def infer_marginf(model, queries, output_file, evidence=[]):
    
    inferred_data = {}

    # Ensure evidence is a list of the same length as queries or empty
    if len(evidence) == 0:
        evidence = [[]] * len(queries)
    
    count = 1
    for query, evidence in zip(queries, evidence):
        # if singel query, convert to list
        if type(query) == str:
            query = [query]
        if type(evidence) == str:
            evidence = [evidence]
        print(query)
        print(f'{count}/{len(queries)}')
        count += 1
        # infer values for ONE sample
        infer_example(model, output_file, query, evidence, mode='marginal')

       # converting inference result to facts
        inferred_example = marginf_file_to_dict(output_file)

        inferred_data = build.merge_dictionary(inferred_data, inferred_example)
        inferred_data = {k:v for k,v in inferred_data.items() if not v is None}

    return inferred_data

import multiprocessing
import os
import tempfile

def infer_example_parallel(model, output_dir, query, evidence, mode='marginal'):
    # Generate unique temporary file names based on the query
    with tempfile.NamedTemporaryFile(prefix="inference_log_", suffix=".txt", dir=output_dir, delete=False) as temp_file:
        output_file = temp_file.name
    with tempfile.NamedTemporaryFile(prefix="model_out_", suffix=".pl", dir=output_dir, delete=False) as temp_file:
        model_out = temp_file.name

    infer_example(model, output_file, query, evidence, mode, model_out=model_out)

    # Clean up the temporary files
    os.remove(model_out)

    return output_file

def infer_marginf_parallel(model, queries, output_dir, evidence=[], max_cores=None):
    output_files = []  # Store the paths to the output files

    # Ensure evidence is a list of the same length as queries or empty
    if len(evidence) == 0:
        evidence = [[]] * len(queries)

    # Calculate the number of processes to create based on max_cores
    num_processes = max_cores if max_cores is not None else multiprocessing.cpu_count()

    pool = multiprocessing.Pool(processes=num_processes)  # Create a multiprocessing pool

    count = 1
    for query, evidence in zip(queries, evidence):
        if type(query) == str:
            query = [query]
        if type(evidence) == str:
            evidence = [evidence]
        print(query)
        print(f'{count}/{len(queries)}')
        count += 1
        # Use the multiprocessing pool to run infer_example_parallel in parallel
        output_file = pool.apply_async(
            infer_example_parallel, args=(model, output_dir, query, evidence, 'marginal')
        )
        output_files.append(output_file)

    # Close the pool and wait for all processes to complete
    pool.close()
    pool.join()

    # Now that all processes have completed, read and merge the results from the files
    inferred_data = {}
    for output_file in output_files:
        output_file = output_file.get()  # Get the actual output file path
        inferred_example = marginf_file_to_dict(output_file)
        inferred_data = build.merge_dictionary(inferred_data, inferred_example)
        inferred_data = {k:v for k,v in inferred_data.items() if not v is None}
        # inferred_data.update(inferred_example)
        os.remove(output_file)  # Clean up the temporary output file

    return inferred_data


# FROM AND TO FILES

# Read in result file from sampling, mpe, etc. and convert to dictionary of facts sorted by predicate
def mpe_file_to_dict(file):
    # reading in result from sampling, inference, mpe, etc.
    data = pd.read_table(file, header=None)[0].tolist()
    if 'error' in data[0]:
        return {}
    
    # converting mpe result to facts
    data = [f'{i}.' for i in data if not i.startswith('\\')]

    predicate_classes = schema.PredicateStructure.__subclasses__()
    facts_dict = {}
    for pclass in predicate_classes:
        pname = pclass.predicate_name
        facts_dict[pname] = build.statements_to_df(data, pclass, build.FactTemplate)

    return facts_dict

# Read in result file from inference and convert to dictionary of facts sorted by predicate
def marginf_file_to_dict(file):
    # reading in result from inference
    data = pd.read_table(file, header=None, sep=':')

    # function
    data.columns = ['fact', 'probability']
    data['fact'] = data['fact'].str.strip()
    # splitting data into predicates
    predicate_classes = schema.PredicateStructure.__subclasses__()
    data_dict = {}
    for pclass in predicate_classes:
        pname = pclass.predicate_name
        data_dict[pname] = lfi.learned_parameters_to_df(pname, data)
    #     data_dict[pname] = build.statements_to_df(data['fact'], pclass, build.FactTemplate, keep_fact=True)

    # inference_dict = {}
    # for predicate in data_dict.keys():
    #     df = pd.merge(data_dict[predicate], data, on = 'fact', how = 'left')
    #     inference_dict[predicate] = df.copy()
            
    return data_dict


# MISC UTILS

# Generate queries for all samples in a dataset (singe predicate) add more options e.g pst
def generate_queries(predicate_class, sample_ids=[], phosphosites=[], enzymes=[]):
    predicate = predicate_class()
    if len(phosphosites) > 0:
        queries = []
        for s in sample_ids:
            for p in phosphosites:
                predicate.add_samples(samples=[s])
                predicate.add_phosphosites(phosphosites=[p])
                query_generator = build.ProblogStatementGenerator(predicate)
                queries = queries + query_generator.generate_queries()
    elif len(enzymes) > 0:
        queries = []
        for s in sample_ids:
            for e in enzymes:
                predicate.add_samples(samples=[s])
                predicate.add_enzymes(enzymes=[e])
                query_generator = build.ProblogStatementGenerator(predicate)
                queries = queries + query_generator.generate_queries()            
    else:    
        predicate.add_samples(samples=sample_ids)
        query_generator = build.ProblogStatementGenerator(predicate)
        queries = query_generator.generate_queries()

    return queries

# Generate queries for all samples in a dataset (multiple predicates)
def generate_queries_by_sample(sample_ids, queries):
    predicate_classes = schema.PredicateStructure.__subclasses__()
    queries_by_sample = []

    for sample_id in sample_ids:
        combined_query = []
        for pclass in predicate_classes:
            pname = pclass.predicate_name
            if pname in queries:
                predicate = pclass()
                predicate.add_samples(samples=[sample_id])
                query_generator = build.ProblogStatementGenerator(predicate)
                query = query_generator.generate_queries()
                combined_query.extend(query)
        queries_by_sample.append(combined_query)

    return queries_by_sample

# Generate queries for individual entities in a dataset (multiple predicates)
def generate_queries_by_entity(sample_ids, queries, phosphosites=[]):
    predicate_classes = schema.PredicateStructure.__subclasses__()
    queries_by_entity = []

    for sample_id in sample_ids:
        combined_query_s = []  # Initialize outside the loop for sample IDs
        for p in phosphosites:
            combined_query_p = []
            for pclass in predicate_classes:
                pname = pclass.predicate_name
                if pname in queries:
                    if 'sample' in pclass.arguments:
                        predicate = pclass()
                        predicate.add_samples(samples=[sample_id])
                        if 'phosphosite' in pclass.arguments and len(phosphosites) > 0:
                            predicate.add_phosphosites(phosphosites=[p])
                        query_generator = build.ProblogStatementGenerator(predicate)
                        query = query_generator.generate_queries()
                        combined_query_p.extend(query)
            combined_query_s.append(combined_query_p)
        queries_by_entity.append(combined_query_s)

    return queries_by_entity


def prep_experiments_for_auc(result_dict, y_true, result_type='e_activity', y_true_type='e_ksea', threshold=0):
    
    analysis_dict = {}  # Initialize an empty dictionary to store the analysis results
    # Iterate over experiments (exp1 to exp7)
    for exp_key in result_dict.keys():
        df1 = lfi.compare_jsd_predicates(y_true, result_dict[exp_key][result_type], pred1=f'{y_true_type}', pred2=f'{result_type}')
        df2 = lfi.compare_maxcat_predicates(y_true, result_dict[exp_key][result_type], pred1=f'{y_true_type}', pred2=f'{result_type}')
        
        # Merge dataframes as before
        shared_cols = list(set(df1.columns) & set(df2.columns))
        analysis = pd.merge(df1, df2, on=shared_cols, how='outer')
        
        analysis_auc = analysis.loc[analysis['prob'] >= threshold, [f'max_category_{y_true_type}', f'p_dec_{result_type}', f'p_inc_{result_type}']].copy()

        # Extract relevant columns
        analysis_auc = analysis_auc[[f'max_category_{y_true_type}', f'p_dec_{result_type}', f'p_inc_{result_type}']]
        analysis_auc.rename(columns={f'max_category_{y_true_type}': 'true_y', f'p_dec_{result_type}': 'p_dec', f'p_inc_{result_type}': 'p_inc'}, inplace=True)
        
        # Create one-hot encoding for true_y
        analysis_auc = pd.get_dummies(analysis_auc, columns=['true_y'], prefix=['true_y'])
        y_onehot_test = analysis_auc[['true_y_p_dec', 'true_y_p_inc']].values
        y_score = analysis_auc[['p_dec', 'p_inc']].values
        
        # Create an analysis dictionary for the experiment
        analysis_dict[exp_key] = {
            'analysis_dataframe': analysis,
            'y_onehot_test': y_onehot_test,
            'y_score': y_score
        }
        
    return analysis_dict