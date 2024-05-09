# Libraries
import pandas as pd
import numpy as np
import os
import re

from src.models import build_model as build
from src.models import model_schemata as schema


# FROM AND TO FILES

# Analyse the log file from parameter learning and extract relevant information
def extract_mle_info_from_log_file(input_file_path):
    # Initialize an empty dictionary to store the extracted information
    info_dict = {}

    # Initialize empty lists to store iteration and score data
    iterations = []
    scores = []

    # Open the text file for reading
    with open(input_file_path, 'r') as file:
        lines = file.readlines()

    # Iterate through each line in the file
    for line in lines:
        # Split each line into words based on spaces
        words = line.strip().split()

        # Check if the line contains relevant information
        if len(words) >= 3:
            if words[0] == "[INFO]" and words[1] == "Iteration":
                # Extract the current iteration number
                current_iteration = int(words[2])
                iterations.append(current_iteration)
            elif words[0] == "[INFO]" and words[1] == "Score" and words[3] == "iteration":
                # Extract the score after the current iteration
                current_score = float(words[-1])
                scores.append(current_score)

            elif words[0] == "[INFO]" and words[1] == "Number" and words[3] == "examples:":
                # Extract the number of examples
                num_examples = int(words[-1])

                # Store the number of examples in the dictionary
                info_dict["Number of Examples"] = num_examples

            elif words[0] == "[INFO]" and words[1] == "Compile" and words[2] == "time:":
                # Extract the compile time
                compile_time = float(words[-1])

                # Store the compile time in the dictionary
                info_dict["Compile Time"] = compile_time

            elif words[0] == "[INFO]" and words[1] == "Evaluation" and words[2] == "time:":
                # Extract the evaluation time
                evaluation_time = float(words[-1])

                # Store the evaluation time in the dictionary
                info_dict["Evaluation Time"] = evaluation_time

    # Create a DataFrame from the extracted iteration and score data
    df = pd.DataFrame({'Iteration': iterations, 'Score': scores})

    # Store the DataFrame in the dictionary
    info_dict['MLE scores'] = df

    info_dict['Iterations to convergence'] = len(iterations)
    
    if 'evaluation_time' in locals():
        info_dict['Time per iteration'] = evaluation_time / len(iterations)

    return info_dict


def extract_weights_from_log_file(file_path):
    # Read the text file into a string
    with open(file_path, 'r') as file:
        text = file.read()
    # Use regular expressions to find all floats after "Weights after iteration i"
    pattern = r"Weights after iteration (\d+): \[(.*?)\]"
    matches = re.findall(pattern, text, re.DOTALL)

    # Create a dictionary to store the extracted values
    data_dict = {}

    # Iterate through the matches and extract the floats
    for iteration, values_str in matches:
        iteration = int(iteration)
        pattern = r":\s([-+]?\d*(?:\.\d+)?(?:[eE][-+]?\d+)?)"
        values = [float(match) for match in re.findall(pattern, values_str)]
        data_dict[f'iteration{iteration}'] = values

    # Create a DataFrame from the dictionary
    weights_df = pd.DataFrame(data_dict)

    # Calculate the absolute differences across columns (iterations)
    differences_df = weights_df.diff(axis=1).abs()

    # Calculate the sum, average, and standard deviation of the differences across rows
    differences_sum = differences_df.sum(axis=0)
    differences_avg = differences_df.mean(axis=0)
    differences_std = differences_df.std(axis=0)

    # Create a new DataFrame to store the results
    results_df = pd.DataFrame({
        'Iteration': weights_df.columns[1:],  # Exclude the first column with 'iteration'
        'Sum of Differences': differences_sum.values[1:],
        'Average Difference': differences_avg.values[1:],
        'Std Deviation of Differences': differences_std.values[1:],
        'Maximum Difference': differences_df.max(axis=0).values[1:],
        'Minimum Difference': differences_df.min(axis=0).values[1:]
    })
    results_df['Iteration'] = results_df['Iteration'].replace('iteration', '', regex=True).astype(int)

    return weights_df, results_df


# Multiple files
def analyze_and_store_logs(log_directory):
    # Initialize an empty dictionary to store the results
    mle_dict = {}
    weights_dict = {}

    # List all the files in the specified directory
    files = os.listdir(log_directory)

    # Iterate through the files in the directory
    for file in files:
        # Check if the file matches the pattern log_exp{i}.txt
        if file.startswith("log_exp") and file.endswith("i.txt"):
            # Extract the experiment number (i)
            exp_number = file.split("_")[1].split(".")[0]

            # Generate the full file path
            file_path = os.path.join(log_directory, file)

            # Analyze the log file and store the information in a dictionary
            mle_result = extract_mle_info_from_log_file(file_path)
            weights_df, results_df = extract_weights_from_log_file(file_path)

            # Store the result in the main dictionary with the key 'exp{i}'
            weights_dict[exp_number] = {}
            mle_dict[exp_number] = mle_result
            weights_dict[exp_number]['weight_df'] = weights_df
            weights_dict[exp_number]['differences_df'] = results_df

    return mle_dict, weights_dict


def extract_params_from_model_file(filepath):
    # Initialize an empty dictionary to store dataframes
    data_dict = {}

    # Define regular expressions to extract fact and probability
    fact_pattern = r'::(\S+\(.*?\))'
    pst_pattern = r'::(\S+\(.*?\)".*?\))'
    act_pattern = r'::(act\S+\(.*?\))'
    probability_pattern = r'([-+]?\d*(?:\.\d+)?(?:[eE][-+]?\d+)?)::'

    # Read the text file line by line
    with open(filepath, 'r') as file:
        lines = file.readlines()

    # Process each line and create dataframes
    for line in lines:
        line = line.strip()
        if line:
            # Initialize lists to store facts and probabilities
            facts = []
            probabilities = []
            reference_line = []

            # Use regex to find all matches in the line
            fact_matches = re.findall(act_pattern, line)
            if len(fact_matches) == 0:
                fact_matches = re.findall(pst_pattern, line)
            if len(fact_matches) == 0:
                fact_matches = re.findall(fact_pattern, line)
            probability_matches = re.findall(probability_pattern, line)

            # Iterate through matches and store in lists
            if len(probability_matches) == 0:
                continue
            else:
                for fact_match, probability_match in zip(fact_matches, probability_matches):
                    fact = fact_match
                    probability = float(probability_match)

                    # Extract the category (e.g., "e_activity", "occ_dec", "p_occupancy")
                    category = fact.split('(')[0]

                    # Append to the lists
                    facts.append(fact)
                    probabilities.append(probability)

                    # Create or update the dataframe for the category
                    if category not in data_dict:
                        data_dict[category] = {'fact': [], 'probability': [], 'line': []}

                    line = line.replace(probability_match, 'p')
            
            for n in range(len(probability_matches)):
                reference_line.append(line)

            data_dict[category]['fact'].extend(facts)
            data_dict[category]['probability'].extend(probabilities)
            # replace all floats with 'p'
            data_dict[category]['line'].extend(reference_line)

    # Create dataframes from the collected data
    for category, data in data_dict.items():
        data_dict[category] = pd.DataFrame(data)

    return data_dict


def learned_parameters_to_df(predicate, data, keep_fact=False):
    ps = schema.PredicateStructure()
    predicate_class = ps.identify_predicate_class(f'{predicate}')
    fact_df = build.statements_to_df(data['fact'], predicate_class, build.FactTemplate, keep_fact=keep_fact)
    if fact_df.empty:
        return
    # merge the two dataframes by index
    if keep_fact:
        data = pd.merge(fact_df, data, on='fact').drop(columns=['fact'])
    else:
        data = pd.merge(fact_df, data, left_index=True, right_index=True).reset_index(drop=True)

    # pivot the DataFrame to reshape it
    entity_names = list(predicate_class.arguments)
    if 'value' in entity_names:
        entity_names.remove('value')
        if 'line' in data.columns:
            entity_names.append('line')
        data = data.pivot_table(index=entity_names, columns='value', values='probability', aggfunc='first').reset_index(drop=False)
        # rename the columns
        data.rename(columns={'dec': 'p_dec', 'inc': 'p_inc'}, inplace=True)
        # reset the index
        data.reset_index(drop=True, inplace=True)
        # add the base probability
        data['p_base'] = 1 - data['p_dec'] - data['p_inc']
        data.loc[data['p_base'] < 0, 'p_base'] = 0

    return data


# CALCULATING METRICS

# Function to calculate Kullback-Leibler Divergence (KL) between two distributions
def kl_divergence(p, q):
    p_safe = p + 1e-10  # Add a small epsilon to avoid zero probabilities
    q_safe = q + 1e-10
    check = p_safe / q_safe
    return np.sum(p_safe * np.log2(check))

# Function to calculate Jensen-Shannon Divergence (JSD)
def jsd(p, q):
    m = 0.5 * (p + q)
    return 0.5 * (kl_divergence(p, m) + kl_divergence(q, m))

def calculate_jsd(sample1, sample2):    
    if sample1.isna().any() or sample2.isna().any():
        return np.nan
    else:
        return jsd(sample1, sample2)
 
# Create a function to compare all experiments
def compare_jsds(pred, experiments, result_dict):
    jsd_values = {}
    for i, exp1 in enumerate(experiments):
        for j, exp2 in enumerate(experiments):
            # print(exp1, exp2)
            if i != j:
                if pred in result_dict[exp1].keys() and pred in result_dict[exp2].keys():
                    if 'probability' in result_dict[exp1][pred].columns:
                        cols = [col for col in result_dict[exp1][pred].columns if col != 'probability']
                    else:
                        cols = [col for col in result_dict[exp1][pred].columns if col not in ['p_dec', 'p_inc', 'p_base']]
                    
                    # Merge the two dataframes on all columns except the probability column or specified columns
                    merged_df = pd.merge(result_dict[exp1][pred], result_dict[exp2][pred], on=cols, how='outer', suffixes=(f'_{exp1}', f'_{exp2}'))
                    
                    if 'probability' in result_dict[exp1][pred].columns:
                        merged_df = merged_df.fillna(0)
                        jsd_values[f'JSD_{exp1}_{exp2}'] = np.abs(merged_df[f'probability_{exp1}'] - merged_df[f'probability_{exp2}'])
                    else:
                        sample1 = merged_df[[f'p_dec_{exp1}', f'p_inc_{exp1}', f'p_base_{exp1}']].rename(columns={f'p_dec_{exp1}': 'p_dec', f'p_inc_{exp1}': 'p_inc', f'p_base_{exp1}': 'p_base'})
                        sample2 = merged_df[[f'p_dec_{exp2}', f'p_inc_{exp2}', f'p_base_{exp2}']].rename(columns={f'p_dec_{exp2}': 'p_dec', f'p_inc_{exp2}': 'p_inc', f'p_base_{exp2}': 'p_base'})
                        
                        jsd_values[f'JSD_{exp1}_{exp2}'] = merged_df.apply(lambda row: calculate_jsd(sample1.loc[row.name], sample2.loc[row.name]), axis=1)

    return pd.DataFrame(jsd_values)


def compare_jsd_predicates(pred1_df, pred2_df, pred1='pred1', pred2='pred2'):
    # Make sure the dataframes have the same columns
    shared_cols = list(set(pred1_df.columns) & set(pred2_df.columns))
    cols = [col for col in shared_cols if col not in ['p_dec', 'p_inc', 'p_base']]

    # Merge the two dataframes on shared columns
    merged_df = pd.merge(pred1_df, pred2_df, on=cols, how='outer', suffixes=(f'_{pred1}', f'_{pred2}'))

    pred1 = merged_df[[f'p_dec_{pred1}', f'p_inc_{pred1}', f'p_base_{pred1}']].rename(columns={f'p_dec_{pred1}': 'p_dec', f'p_inc_{pred1}': 'p_inc', f'p_base_{pred1}': 'p_base'})
    pred2 = merged_df[[f'p_dec_{pred2}', f'p_inc_{pred2}', f'p_base_{pred2}']].rename(columns={f'p_dec_{pred2}': 'p_dec', f'p_inc_{pred2}': 'p_inc', f'p_base_{pred2}': 'p_base'})
                        
    jsd_values = merged_df.apply(lambda row: calculate_jsd(pred1.loc[row.name], pred2.loc[row.name]), axis=1)

    merged_df['JSD'] = jsd_values
    return merged_df.sort_values(by='JSD', ascending=False).reset_index(drop=True)


def find_max_category(df):
    max_categories = df[['p_dec', 'p_inc', 'p_base']].idxmax(axis=1)
    return max_categories

def compare_max_categories(pred, experiments, result_dict):
    max_categories_dict = {}
    
    for i, exp1 in enumerate(experiments):
        for j, exp2 in enumerate(experiments):
            if i != j:
                if pred in result_dict[exp1].keys() and pred in result_dict[exp2].keys():
                    if 'probability' in result_dict[exp1][pred].columns:
                        cols = [col for col in result_dict[exp1][pred].columns if col not in ['probability', 'max_category']]
                        # true if probability >= 0.5 else 0
                        result_dict[exp1][pred]['max_category'] = result_dict[exp1][pred]['probability'].apply(lambda x: 1 if x >= 0.5 else 0)
                        result_dict[exp2][pred]['max_category'] = result_dict[exp2][pred]['probability'].apply(lambda x: 1 if x >= 0.5 else 0)
                    else:
                        cols = [col for col in result_dict[exp1][pred].columns if col not in ['p_dec', 'p_inc', 'p_base', 'max_category']]
                        result_dict[exp1][pred]['max_category'] = find_max_category(result_dict[exp1][pred])
                        result_dict[exp2][pred]['max_category'] = find_max_category(result_dict[exp2][pred])

                    # Merge the two dataframes on all columns except the probability column or specified columns
                    merged_df = pd.merge(result_dict[exp1][pred], result_dict[exp2][pred], on=cols, how='outer', suffixes=(f'_{exp1}', f'_{exp2}'))
                    
                    if 'probability' in result_dict[exp1][pred].columns:
                        merged_df = merged_df.fillna(0)

                    def calculate_match(row):
                        if row[f'max_category_{exp1}'] is np.nan or row[f'max_category_{exp2}'] is np.nan:
                            return np.nan
                        else:
                            return int(row[f'max_category_{exp1}'] == row[f'max_category_{exp2}'])

                    match_series = merged_df.apply(calculate_match, axis=1)
                    # match_series = merged_df[f'max_category_{exp1}'].eq(merged_df[f'max_category_{exp2}']).astype(int)
                    max_categories_dict[f'MaxMatch_{exp1}_{exp2}'] = match_series

    return pd.DataFrame(max_categories_dict)


def compare_maxcat_predicates(pred1_df, pred2_df, pred1='pred1', pred2='pred2'):
    # Make sure the dataframes have the same columns
    shared_cols = list(set(pred1_df.columns) & set(pred2_df.columns))
    cols = [col for col in shared_cols if col not in ['p_dec', 'p_inc', 'p_base', 'max_category']]
    pred1_df = pred1_df.copy()
    pred2_df = pred2_df.copy()
    pred1_df['max_category'] = find_max_category(pred1_df)
    pred2_df['max_category'] = find_max_category(pred2_df)
    # Merge the two dataframes on shared columns
    merged_df = pd.merge(pred1_df, pred2_df, on=cols, how='outer', suffixes=(f'_{pred1}', f'_{pred2}'))
               
    def calculate_match(row):
        if row[f'max_category_{pred1}'] is np.nan or row[f'max_category_{pred2}'] is np.nan:
            return np.nan
        else:
            return int(row[f'max_category_{pred1}'] == row[f'max_category_{pred2}'])
        
    matches = merged_df.apply(calculate_match, axis=1)
    merged_df['MaxMatch'] = matches

    return merged_df.sort_values(by='MaxMatch', ascending=True).reset_index(drop=True)