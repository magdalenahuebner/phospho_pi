# Libraries
import os
import re
import random
import pandas as pd


### PREDICATE ARCHITECTURE

# Extract predicate name
def get_predicate_name(facts_lst:list):
    # defining a regex pattern
    pattern = r'(\w+)\((.*?)\)'
    # getting the predicate name in each element using regex
    predicate = re.search(pattern, facts_lst[0])[1]

    return predicate


# Extract architecture of predicates contained in model
def get_structure(predicate, value='columns'):
    structure = dict()
    structure['activity'] = {'columns': ['enzyme', 'sample', 'dA'], 'merge_on': ['enzyme', 'sample'], 'y': 'dA'}
    structure['fold_change'] = {'columns': ['phosphosite', 'sample', 'fc'], 'merge_on': ['phosphosite', 'sample'], 'y': 'fc'}
    structure['modification'] = {'columns': ['enzyme', 'phosphosite', 'sample', 'dM'], 'merge_on': ['enzyme', 'phosphosite', 'sample'], 'y': 'dM'}
    structure['occupancy'] = {'columns': ['phosphosite', 'sample', 'dO'], 'merge_on': ['phosphosite', 'sample'], 'y': 'dO'}
    structure['interaction'] = {'columns': ['enzyme', 'phosphosite'], 'merge_on': ['enzyme', 'phosphosite']}

    return structure[predicate].get(value)


# Extract names of samples 
def get_samples(facts_dict:dict):
    # converting data to facts list
    facts_lst = []
    [facts_lst.extend(value) for key, value in facts_dict.items()]
    # extracting sample names
    samples = sort_by_sample(facts_lst).keys()

    return list(samples)


### ADDING TO MODEL

## Samples

# Add n facts in the format 'sample(s#).' to ProbLog model, where n is the number of samples to be generated for the synthetic data
def add_samples(model_in, model_out, n_samples=10):

    inputfile = open(model_in, 'r').readlines()
    write_file = open(model_out,'w')

    for line in inputfile:
        write_file.write(line)
    
    write_file.write(f'\n\n%%% Samples\n\n')
    
    for n in range(n_samples):
        new_line = 'sample(s%s).' %(n+1)        
        write_file.write(new_line + '\n') 
    write_file.close()


## Prior Knowledge

# Append prior knowledge at the end of the ProbLog model
def add_pk(model_in, model_out, facts_dict):

    if not isinstance(facts_dict, dict):
        facts_dict = sort_by_predicate(facts_dict)

    inputfile = open(model_in, 'r').readlines()
    write_file = open(model_out,'w')

    for line in inputfile:
        write_file.write(line)
    
    write_file.write(f'\n\n%%% Prior Knowledge\n')
    
    for predicate, facts in facts_dict.items():
        write_file.write(f'\n% {predicate}\n')
        for fact in facts:
            write_file.write(fact + '\n')
    write_file.close()


## Facts

# Remove facts from ProbLog model
def remove_facts(model_in, model_out, facts_dict):

    if not isinstance(facts_dict, dict):
        facts_dict = sort_by_predicate(facts_dict)

    inputfile = open(model_in, 'r').readlines()
    write_file = open(model_out,'w')

    for line in inputfile:
        if not any(f'::{predicate}' in line or line.startswith(predicate) for predicate in facts_dict.keys()):
            write_file.write(line)
    write_file.close()


# Append facts at the end of the ProbLog model
def add_facts(model_in, model_out, facts_dict):

    if not isinstance(facts_dict, dict):
        facts_dict = sort_by_predicate(facts_dict)

    inputfile = open(model_in, 'r').readlines()
    write_file = open(model_out,'w')

    for line in inputfile:
        write_file.write(line)
    
    write_file.write(f'\n\n%%% Additional Facts\n')
    
    for predicate, facts in facts_dict.items():
        write_file.write(f'\n% {predicate}\n')
        for fact in facts:
            write_file.write(fact + '\n')
    write_file.close()


def add_prob1_to_facts(model_in, model_out, predicates = []):

    inputfile = open(model_in, 'r').readlines()
    write_file = open(model_out,'w')

    for line in inputfile:
        if line.startswith(tuple(predicates)):
            write_file.write(f'1.0::{line}')
        else:
            write_file.write(line)



## Evidence

# Append evidence at the end of the ProbLog model
def add_evidence(model_in, model_out, facts_dict:dict):

    if not isinstance(facts_dict, dict):
        facts_dict = sort_by_predicate(facts_dict)

    inputfile = open(model_in, 'r').readlines()
    write_file = open(model_out,'w')

    for line in inputfile:
        write_file.write(line)
    
    write_file.write(f'\n\n%%% Evidence\n')
    
    for predicate, facts in facts_dict.items():
        evidence = facts_to_evidence(facts)
        write_file.write(f'\n% {predicate}\n')
        for fact in evidence:
            write_file.write(fact + '\n')
    write_file.close()


## Queries

# Remove queries from ProbLog model
def remove_queries(model_in, model_out):

    inputfile = open(model_in, 'r').readlines()
    write_file = open(model_out,'w')

    for line in inputfile:
        if not (line.startswith('query')):
            write_file.write(line)
    write_file.close()


# Append queries at the end of the ProbLog model
def add_queries(model_in, model_out, queries_dict:dict):

    inputfile = open(model_in, 'r').readlines()
    write_file = open(model_out,'w')

    for line in inputfile:
        write_file.write(line)
    
    write_file.write(f'\n\n%%% Queries\n')
    
    for queries in queries_dict.values():
        for query in queries:
            write_file.write('\n' + query)
    write_file.close()


# Add queries to queries section of ProbLog model
def insert_queries(model_in, model_out, queries_dict:dict):

    inputfile = open(model_in, 'r').readlines()
    write_file = open(model_out,'w')
    
    query_present = False
    for line in inputfile:
        write_file.write(line)
        if '%%% Queries' in line:
            for queries in queries_dict.values():
                for query in queries:
                    write_file.write('\n' + query)
            query_present = True
    write_file.close()

    if query_present == False:
        add_queries(model_in, model_out, queries_dict)


### CONVERSIONS

## Lists to Lists (LL)

# Convert facts to evidence
def facts_to_evidence(facts_lst:list):
    evidence_lst = []
    for fact in facts_lst:
        fact = fact.strip('.')
        evidence_lst.append(f'evidence({fact}).')
    
    return evidence_lst


## Dictonaries to Lists (DL)

# Convert dictionary of lists to one big list
def dict_to_list(dict_of_lsts:dict):
    
    lst = []
    [lst.extend(dict_of_lsts[k]) for k in dict_of_lsts.keys()]

    return lst


## Dictionaries to Dictionary (DD)

# Merge two dictionaries into one dictionary by key and concatenate values to list
def merge_dictionary(dict_1, dict_2):
    dict_3 = {**dict_1, **dict_2}
    for key, value in dict_3.items():
        if key in dict_1 and key in dict_2:
            if isinstance(value, list):
                dict_3[key] = value + dict_1[key]
            elif isinstance(value, pd.DataFrame):
                dict_3[key] = pd.concat([value, dict_1[key]])

    return dict_3


## Lists to Dictionaries (LD)

# Convert list of tuples to dictonary and group by first element (e.g. sample)
def tuples_to_dict(lst):

    dict = {}

    for key, value in lst:
        #initialising empty list if key doesn't exist
        if key not in dict:
            dict[key] = []
        # now we know that the key always exists
        dict[key].append(value)
        dict[key].sort()

    return dict


# Sort list of facts by sample number s#
def sort_by_sample(facts_lst:list):

    if not isinstance(facts_lst, list):
        facts_lst = dict_to_list(facts_lst)

    # defining a regex pattern to match the s value
    pattern = r'\w+\([\w,\s,",\(,\)]*,([\w,"]*),[\w,\s]*\).'
    # getting the sample number in each element using regex
    sample_number = [re.search(pattern, elem)[1] for elem in facts_lst]
    # labelling facts with sample names
    labelled_facts = tuple(zip(sample_number, facts_lst))
    # sorting the list based on the s values
    facts_dict = tuples_to_dict(labelled_facts)

    return facts_dict


# Sort list of facts by predicate
def sort_by_predicate(facts_lst:list):
    # defining a regex pattern to match the predicate
    pattern = r'(\w+)\([\w,\s,",\(,\)]*\)'
    # getting the predicate name in each element using regex
    predicate = [re.search(pattern, elem)[1] for elem in facts_lst]
    # labelling facts with predicate names
    labelled_facts = tuple(zip(predicate, facts_lst))
    # sorting the list based on the predicate name
    facts_dict = tuples_to_dict(labelled_facts)

    return facts_dict


## Dataframes (D)

# Convert facts (of one predicate type) to dataframe
def facts_to_df(facts_lst:list):
    # getting the predicate name using regex
    predicate = get_predicate_name(facts_lst)
    # defining a regex pattern
    pattern = r'\((.*)\)'
    # pattern = r'\((.*?)\)'
    # separating arguments using regex
    select = [re.search(pattern, elem)[1].split(',') for elem in facts_lst]
    # one argument per dataframe column
    df = pd.DataFrame(select, columns = get_structure(predicate, 'columns'))
    df['fact'] = facts_lst

    return df


# Convert dataframe (of one predicate type) to list of facts
def df_to_facts(df, predicate, p_col=None):
    facts_lst = []
    for _, row in df.iterrows():
        x = ','.join(row)
        fact = f'{predicate}({x}).'
        if p_col is not None:
            p = row[p_col]
            fact = f'{p}::{fact}'
        facts_lst.append(fact)
        
    return facts_lst


### WRITING TO / READING FROM FILES

# Write evidence to file
def write_evidence_file(facts_dict, file, evidence = []):

    if not isinstance(facts_dict, dict):
        facts_dict = sort_by_predicate(facts_dict)

    facts_dict = {key: facts_dict[key] for key in evidence}
    facts_lst = dict_to_list(facts_dict)

    # grouping the elements by sample name
    facts_dict = sort_by_sample(facts_lst)
    # writing the grouped facts to a file, separated by a dashed line
    with open(file, 'w') as f:
        for sample in facts_dict.values():
            sample = facts_to_evidence(sample)
            f.write('\n'.join(str(fact) for fact in sample))
            f.write('\n----------\n')


# Group facts by predicate names and write to separate files
def write_predicate_files(facts_dict, path, suffix = ''):

    if not os.path.exists(path):
        os.makedirs(path)
    
    if not isinstance(facts_dict, dict):
        # grouping the elements by predicate name
        facts_dict = sort_by_predicate(facts_dict)

    # writing the grouped facts to separate files
    for predicate, facts in facts_dict.items():
        facts.sort()
        with open(f'{path}{predicate}{suffix}.txt', 'w') as f:
            for fact in facts:
                f.write(f'{fact}\n')
