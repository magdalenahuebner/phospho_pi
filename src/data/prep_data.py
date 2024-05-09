# Libraries
import pandas as pd
import numpy as np
import random
import networkx as nx
from requests.adapters import HTTPAdapter, Retry

from src.data.uniprot_api import *



# ANNOTATED DISJUNCTION

# Sample function for truncated normal distribution
def sample_truncated_normal(mean, lower_bound, upper_bound, std_dev):
    Z_a = (lower_bound - mean) / std_dev
    Z_b = (upper_bound - mean) / std_dev
    Z_sampled = np.random.uniform(Z_a, Z_b)
    sampled_value = mean + Z_sampled * std_dev
    return sampled_value

def sample_ad_probabilities_old(df, value_col:str, params:dict):
    df = df.copy()
    # Sample and populate the 'p_dec', 'p_base', and 'p_inc' columns
    for category in ['dec', 'base', 'inc']:
        mask = df[value_col] == category
        sample_values = [sample_truncated_normal(**params) for _ in range(mask.sum())]
        df.loc[mask, f'p_{category}'] = sample_values

    calculate_ad_probabilities(df)

    return df

def calculate_ad_probabilities(df):
    # Find the value that isn't NaN and calculate the other values
    for index, row in df.iterrows():
        if not pd.isna(row['p_dec']):
            p_dec = row['p_dec'] - 0.012
            df.at[index, 'p_dec'] = p_dec
            df.at[index, 'p_base'] = 1 - p_dec - 0.01
            df.at[index, 'p_inc'] = 0.001
        elif not pd.isna(row['p_base']):
            p_base = row['p_base'] - 0.012
            df.at[index, 'p_base'] = p_base
            df.at[index, 'p_dec'] = 0.5 * (1 - p_base) - 0.0005
            df.at[index, 'p_inc'] = 0.5 * (1 - p_base) - 0.0005
        elif not pd.isna(row['p_inc']):
            p_inc = row['p_inc'] - 0.012
            df.at[index, 'p_inc'] = p_inc
            df.at[index, 'p_base'] = 1 - p_inc - 0.01
            df.at[index, 'p_dec'] = 0.001



def sample_ad_probabilities(df, value_col:str, params:dict):
    sample_values = [sample_truncated_normal(**params) for _ in range(len(df))]
    df['prob'] = sample_values  # Assign sampled values to 'prob' column

    expanded_rows = []
    
    for _, row in df.iterrows():
        for category in ['inc', 'base', 'dec']:
            if category == row[value_col]:
                continue  # Skip rows that already have a value for this category
            
            new_row = row.to_dict()  # Convert the row to a dictionary
            new_row[value_col] = category
            expanded_rows.append(new_row)
    
    expanded_df = pd.DataFrame(expanded_rows)    

    # merge df and expanded_df
    df = pd.concat([df, expanded_df], ignore_index=True)
    df = df.sort_values(by=df.columns.to_list()).reset_index(drop=True)
    
     # Sample and populate the 'p_dec', 'p_base', and 'p_inc' columns
    for category in ['dec', 'base', 'inc']:
        mask = df[value_col] == category
        df.loc[mask, f'p_{category}'] = df.loc[mask, 'prob']

    calculate_ad_probabilities(df)

    return df


def expand_ad_cpd(df, value_col:str, base=False):

    categories = ['inc', 'dec']
    if base:
        categories.append('base')

    expanded_rows = []
    
    for _, row in df.iterrows():
        for category in categories:
            if category == row[value_col]:
                continue  # Skip rows that already have a value for this category
            
            new_row = row.to_dict()  # Convert the row to a dictionary
            new_row[value_col] = category
            new_row['p_inc'] = 0.001
            new_row['p_dec'] = 0.001
            new_row['p_base'] = 0.001
            expanded_rows.append(new_row)
    
    expanded_df = pd.DataFrame(expanded_rows)    

    # merge df and expanded_df
    df = pd.concat([df, expanded_df], ignore_index=True)
    df = df.sort_values(by=df.columns.to_list()).reset_index(drop=True)
    
     # Sample and populate the 'p_dec', 'p_base', and 'p_inc' columns
    for category in categories:
        mask = df[value_col] == category
        df.loc[mask, f'p_{category}'] = df.loc[mask, 'prob']
        if category == 'base':
            df.loc[mask, f'p_inc'] = (1 - df.loc[mask, f'p_{category}']) * 0.5
            df.loc[mask, f'p_dec'] = (1 - df.loc[mask, f'p_{category}']) * 0.5
        else:
            df.loc[mask, f'p_base'] = 1 - df.loc[mask, f'p_{category}'] - 0.001

    return df


# GENERATING SUBNETWORK

def generate_subnetwork(e_ns, p_ns, edges, num_p_nodes, max_e_neighbors, phosphatases:set, e_total):
    
    G = nx.DiGraph()
    G.add_nodes_from(e_ns, bipartite=0)
    G.add_nodes_from(p_ns, bipartite=1)
    G.add_edges_from(edges)

    # Function to find a random P node and its neighbors
    def find_random_P_with_neighbors(G):
        p_nodes = [node for node in G.nodes() if G.nodes[node]['bipartite'] == 1]
        p_node = random.choice(p_nodes)
        neighbors = list(G.predecessors(p_node))
        return p_node, neighbors

    # Initialize the subnetwork
    subnetwork = nx.DiGraph()

    # Initialize lists to hold P nodes and their neighbors
    p_nodes = []
    p_neighbors = []
    neighbors_p1 = []

    # Add the first P node
    while set(neighbors_p1).intersection(phosphatases) == set():
        p1, neighbors_p1 = find_random_P_with_neighbors(G)
    
    p_nodes.append(p1)
    p_neighbors.append(neighbors_p1)
    subnetwork.add_node(p1, bipartite=1)

    # Add P nodes sharing at least one neighbor with any P node
    while len(p_nodes) < num_p_nodes:
        p, neighbors = find_random_P_with_neighbors(G)
        common_neighbors = False
        for i in range(len(p_nodes)):
            if set(neighbors).intersection(p_neighbors[i]):
                common_neighbors = True
                break
        if common_neighbors:
            p_nodes.append(p)
            p_neighbors.append(neighbors)
            subnetwork.add_node(p, bipartite=1)

    # Add edges between P nodes sharing at least one neighbor
    for i in range(num_p_nodes):
        for j in range(i + 1, num_p_nodes):
            common_neighbors = set(p_neighbors[i]).intersection(p_neighbors[j])
            if common_neighbors:
                subnetwork.add_nodes_from(common_neighbors, bipartite=0)
                subnetwork.add_edges_from([(e_node, p_nodes[i]) for e_node in common_neighbors])
                subnetwork.add_edges_from([(e_node, p_nodes[j]) for e_node in common_neighbors])


    # Create a copy of the subnetwork to add edges
    subnetwork_copy = subnetwork.copy()

    # Adjust the edges to ensure each P node in the subgraph has at most max_e_neighbors E node neighbors
    for p_node in subnetwork.nodes():
        e_neighbors = [n for n in G.predecessors(p_node) if n not in subnetwork.nodes()]
        current_e_neighbors = len(list(subnetwork.predecessors(p_node)))
        if current_e_neighbors < max_e_neighbors:
            random.shuffle(e_neighbors)
            e_neighbors_to_add = e_neighbors[:max_e_neighbors - current_e_neighbors]
            subnetwork_copy.add_nodes_from(e_neighbors_to_add, bipartite=0)
            subnetwork_copy.add_edges_from([(e_node, p_node) for e_node in e_neighbors_to_add])

    # Check the total number of E nodes in the subnetwork
    e_nodes_in_subnetwork = [node for node in subnetwork_copy.nodes() if subnetwork_copy.nodes[node]['bipartite'] == 0]

    # If the total number of E nodes in the subnetwork is greater than or equal to e_total, return the subnetwork
    if len(e_nodes_in_subnetwork) == e_total and set(e_nodes_in_subnetwork).intersection(phosphatases):
        print("Nodes in the subnetwork:", subnetwork_copy.nodes())
        print("Edges in the subnetwork:", subnetwork_copy.edges())
        return subnetwork_copy
    else:
        # If e_total is not met, pick a new random P node and try again
        return generate_subnetwork(e_ns, p_ns, edges, num_p_nodes, max_e_neighbors, phosphatases, e_total)


# EXTRACTING TOP CORRELATED ENZYMES

def extract_top_corr_enzymes(table1, table2, interactions, max_enzymes=10, min_corr=0.5):
    # Modify the prob column in both tables based on 'value'
    table1['modified_prob'] = table1['prob'] * table1['value'].map({'inc': 1, 'dec': -1})
    table2['modified_prob'] = table2['prob'] * table2['value'].map({'inc': 1, 'dec': -1})

    # Initialize a dictionary to store correlations for each substrate
    sorted_enzyme_correlations = {}
    substrate_correlations = {}

    # Iterate through unique substrates in TABLE1
    unique_substrates = table1['phosphosite'].unique()
    for substrate in unique_substrates:
        # Filter TABLE1 for the current substrate
        substrate_data = table1.loc[table1['phosphosite'] == substrate]
        
        # Initialize a dictionary to store correlations for each enzyme
        enzyme_correlations = {}
        
        # Filter interactions for the current substrate
        substrate_interactions = interactions.loc[interactions['substrate'] == substrate]
        
        # Iterate through unique enzymes in interactions for the current substrate
        unique_enzymes = substrate_interactions['enzyme'].unique()
        for enzyme in unique_enzymes:
            # Filter TABLE2 for the current enzyme
            enzyme_data = table2.loc[table2['enzyme'] == enzyme]
            
            # Merge substrate_data and enzyme_data based on the 'sample' column
            merged_data = substrate_data.merge(enzyme_data, on='sample', suffixes=('_substrate', '_enzyme'))
            
            # Calculate the correlation based on modified_prob
            correlation = merged_data['modified_prob_substrate'].corr(merged_data['modified_prob_enzyme'], method='pearson')

            # Check if the correlation meets the minimum threshold
            if abs(correlation) >= min_corr:
                enzyme_correlations[enzyme] = correlation
        
        # Sort the absolute enzyme correlations in descending order
        sorted_enzyme_correlations[substrate] = sorted(enzyme_correlations.items(), key=lambda x: abs(x[1]), reverse=True)    

        # Limit to the top 10 correlated enzymes
        top_enzymes = [item[0] for item in sorted_enzyme_correlations[substrate][:max_enzymes]]
        
        # Store the top 10 correlated enzymes for the current substrate
        substrate_correlations[substrate] = top_enzymes

    return substrate_correlations, sorted_enzyme_correlations

# Function to filter interactions based on substrate_correlations
def filter_interactions_by_correlations(df, correlations):
    filtered_interactions = []
    for substrate, top_enzymes in correlations.items():
        # Filter interactions for the current substrate and top enzymes
        filtered = df[(df['substrate'] == substrate) & (df['enzyme'].isin(top_enzymes))]
        filtered_interactions.append(filtered)
    
    # Filter interactions for substrates not in substrate_correlations
    substrates_in_correlations = set(correlations.keys())
    for substrate in df['substrate'].unique():
        if substrate not in substrates_in_correlations:
            filtered = df[df['substrate'] == substrate]
            filtered_interactions.append(filtered)
    
    return pd.concat(filtered_interactions)


# Function to perform ID mapping and return results as a DataFrame
def id_mapping_to_dataframe(id_list, from_db="UniProtKB_AC-ID", to_db="Gene_Name"):
    
    # Initialize session with retry settings
    retries = Retry(total=5, backoff_factor=0.25, status_forcelist=[500, 502, 503, 504])
    session = requests.Session()
    session.mount("https://", HTTPAdapter(max_retries=retries))

    # Submit the ID mapping job
    job_id = submit_id_mapping(from_db, to_db, id_list)
    
    # Wait for the job to complete
    if check_id_mapping_results_ready(job_id, session=session):
        link = get_id_mapping_results_link(job_id, session=session)
        
        # Get the ID mapping results
        results = get_id_mapping_results_search(link, session=session)
        
        if isinstance(results['results'], list):
            # Convert the results to a DataFrame
            df = pd.DataFrame(results['results'])
            df = df.rename(columns={"from": from_db, "to": to_db})
        else:
            # Handle XML results
            root = ElementTree.fromstring(results)
            ns = get_xml_namespace(root)
            entries = root.findall(f".//{{{ns}}}entry")
            data = []
            for entry in entries:
                accession = entry.find(f".//{{{ns}}}accession").text
                mapped_ids = [e.text for e in entry.findall(f".//{{{ns}}}property[@type='mapped']/{{{ns}}}value")]
                data.append([accession, mapped_ids])
            df = pd.DataFrame(data, columns=[from_db, to_db])
        
        return df
    else:
        raise Exception("ID mapping job did not complete successfully.")


def scale_ksea_column(df, column_name, tc_column_name):
    if column_name not in df.columns or tc_column_name not in df.columns:
        raise ValueError(f"Either '{column_name}' or '{tc_column_name}' columns do not exist in the DataFrame.")

    def scale_value(x, tc):
        min_orig = 0.5
        max_orig = 1.0
        min_new = 0.5
        
        if tc < 5:
            if tc == 4:
                max_new = 0.9
            elif tc == 3:
                max_new = 0.85
            elif tc == 2:
                max_new = 0.8
            elif tc == 1:
                max_new = 0.75
            else:
                max_new = 1.0  # Default value if tc is not in [2, 3, 4]
            
            # Apply the linear transformation formula
            y = (x - min_orig) * (max_new - min_new) / (max_orig - min_orig) + min_new
        else:
            y = x  # No scaling for tc >= 5
        
        return y

    df[column_name] = df.apply(lambda row: scale_value(row[column_name], row[tc_column_name]), axis=1)


def scale_fc_column(df, column_name):

    def scale_value(x):
        min_orig = 0.499
        max_orig = 1.0
        min_new = 0.001
        max_new = 1.0
        
        # Apply the linear transformation formula
        y = (x - min_orig) * (max_new - min_new) / (max_orig - min_orig) + min_new

        return y

    df[column_name] = df.apply(lambda row: scale_value(row[column_name]), axis=1)