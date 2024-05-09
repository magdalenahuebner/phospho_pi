# Libraries
import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
import os
import pickle

from scipy.optimize import curve_fit
from sklearn.metrics import confusion_matrix
from sklearn.metrics import RocCurveDisplay, roc_curve, auc
from itertools import cycle
from scipy.cluster.hierarchy import linkage, leaves_list, dendrogram
from scipy.spatial.distance import squareform

from src.models import build_model


# gg
def plot_cm(y_pred, y_true, xlabel, ylabel, value_labels, path, title_suffix, normalize = None):
    # Calculating confusion matrix
    cm = confusion_matrix(y_pred, y_true, labels = value_labels, normalize=normalize)
    cm_df = pd.DataFrame(cm, index = value_labels, columns = value_labels)
    # Plotting the confusion matrix
    # plt.figure(figsize=(5,4))
    sns.heatmap(cm_df, annot=True, cmap='YlGnBu')
    plt.title(f'Confusion Matrix ({title_suffix})')
    plt.ylabel(ylabel)
    plt.xlabel(xlabel)

    if normalize != None: 
        title_suffix = f'{title_suffix}_norm_{normalize}'
        
    plt.savefig(f'{path}cm_{title_suffix}.png')
    plt.close()


def plot_ftcorr(data_dict:dict, outpath):

    data = np.array(list(data_dict.values()))

    corr = np.corrcoef(data, bias=True)
    labs = data_dict.keys()

    sns.heatmap(corr, annot=True, fmt='.2g', xticklabels=labs, yticklabels=labs, cmap='YlGnBu')
    plt.title('Feature Correlation Matrix')

    plt.savefig(f'{outpath}ftcorr.png')
    plt.close()


# Import all the pickle files in the phospho_pi folder and name them according to the subfolder they are in
# Input: Path to the phospho_pi folder
# Output: A dictionary with the pickle files as values and the name of the subfolder as keys
def import_pickles(path):
    data_dict = {}
    for root, dirs, files in os.walk(path):
        for file in files:
            if file.endswith(".pickle"):
                with open(os.path.join(root, file), 'rb') as f:
                    data_dict[os.path.basename(root)] = pickle.load(f)
    return data_dict


# Compare specified model metric between different models
def plot_model_metric(results_dict, experiments, data, vs, compare, metric, title, outpath):
    """
    Plot the prediction metric for the given experiments.
    """

    xs = []
    ys = []
    for exp in experiments:
        if len(experiments[exp]) == 0:
            xs.append(exp)
            ys.append(results_dict[exp][f'{data}_vs_{vs}']['report'][compare][metric])
        else:
            for model in experiments[exp]:
                ys.append(results_dict[exp][model][f'{data}_vs_{vs}']['report'][compare][metric])
                xs.append(f'{exp}_{model}')

    # plot the results as a bar chart
    # display the accuracy value within the bar chart
    fig, ax = plt.subplots(figsize=(10, 5))
    ax.bar(xs, ys)
    ax.set_xlabel('model')
    ax.set_ylabel(metric)
    ax.set_title(title)
    for i, v in enumerate(ys):
        ax.text(i - 0.2, v + 0.01, str(round(v, 2)))
    plt.show()

    # save the figure 
    fig.savefig(outpath, dpi=300)
    plt.close(fig)
    

# Function that takes in a dictionary of results and a dictionary of experiments and returns a list of values and labels
def get_values_labels(results_dict, group):
    values = []
    labels = []
    for exp, models in group.items():
        if len(models) == 0:
            values.append(results_dict[exp]['predictions']['occupancy'].reset_index(drop=True))
            labels.append(exp)
        else: 
            for model in models:
                values.append(results_dict[exp]['predictions'][model]['occupancy'].reset_index(drop=True))
                labels.append(f'{exp}_{model}')
    return values, labels


# Function that plots the predicited probabilities of occupancy from two experiment again each other and returns the correlation coefficient
def plot_corr_of_pred_probs(x, y, ax=None, logistic=False, metric='dob_norm'):
    # add a column from y to x merging on specified column
    z = x.copy()
    z[f'{metric}_y'] = z.merge(y, on='fact', how='left')[f'{metric}_y']
    # calculate the correlation between the two columns
    corr = z[metric].corr(z[f'{metric}_y'], method='pearson')
    sns.regplot(ax=ax, x=metric, y=f'{metric}_y', data=z, logistic=logistic)

    return corr


# TODO
def jointplot(x, y, colour_by='dO'):
    # add a column from y to x merging on specified column
    z = x.copy()
    z['dob_norm_y'] = z.merge(y, on='fact', how='left')['dob_norm_y']
    sns.jointplot(x='dob_norm', y='dob_norm_y', data=z, hue=colour_by)


# Function that takes in dictionaries of multiple experiments and plots the predicited probabilities of occupancy for each combination of experiments in a grid
def compare_prob_corr_plots(results_dict, group_x, group_y, outpath, logistic=False, figsize=(9, 6), metric='dob_norm'):
    xs, xnams = get_values_labels(results_dict, group_x)
    ys, ynams = get_values_labels(results_dict, group_y)
    # generate multiple plots and arrange in a grid with len(x) rows and len(y) columns
    fig, axs = plt.subplots(len(ys), len(xs), figsize=figsize, squeeze=False)
    # iterate through each row in the grid
    for i, y in enumerate(ys):
        # iterate through each column in the grid
        for j, x in enumerate(xs):
            # plot the correlation between the ith element in x and the jth element in y
            corr = plot_corr_of_pred_probs(x, y, ax=axs[i, j], logistic=logistic, metric=metric)
            # set the title of the plot to be the ith element in x and the jth element in y
            axs[i, j].set_title(f'corr={corr:.2f}', fontsize=8)
            # set the x and y labels of the plot to be the ith element in x and the jth element in y
            axs[i, j].set_xlabel(xnams[j])
            axs[i, j].set_ylabel(ynams[i])
    # adjust the spacing between the plots
    plt.tight_layout()
    # save the figure
    plt.savefig(outpath)
    # show the figure
    plt.show()


def plot_time_lin(x_data, y_data, x_label, y_label, x_predict):
    # Define the function you want to fit
    def func(x, a, b):
        return a * x + b

    # Fit the function to the data
    params, covariance = curve_fit(func, x_data, y_data)

    # Parameters of the fitted function
    a_fit, b_fit = params

    # Predict y-value
    y_predict = func(x_predict, a_fit, b_fit)

    # Plot the original data and the fitted function
    plt.scatter(x_data, y_data, label='Data')
    plt.plot(x_data, func(x_data, a_fit, b_fit), 'r-', label='Fitted Function')
    plt.xlabel(x_label)
    plt.ylabel(y_label)
    plt.title('Fitted Function and Data')
    plt.legend()
    plt.grid(True)
    plt.show()

    print(f'Predicted y-value for x = {x_predict}: {y_predict}s = {y_predict/60}min = {y_predict/3600}h')


def plot_time_exp(n_pfacts, t_compile, x_label, y_label, x_predict):
    def exponential_func(x, a, b):
        return a * np.exp(b * x)

    # Initial guess for the constants (you can adjust these)
    initial_guess = [1.0, 0.1]

    params, covariance = curve_fit(exponential_func, n_pfacts, t_compile, p0=initial_guess)

    y_predict = exponential_func(x_predict, *params)

    plt.scatter(n_pfacts, t_compile, label='Data')
    plt.plot(n_pfacts, exponential_func(n_pfacts, *params), 'r-', label='Fitted Curve')

    plt.xlabel(x_label)
    plt.ylabel(y_label)
    plt.legend()
    plt.title('Exponential Fit')
    plt.grid(True)
    plt.show()

    print(f'Predicted y-value for x = {x_predict}: {y_predict}s = {y_predict/60}min = {y_predict/3600}h')


import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit


def plot_multiple_time_lin(x_dict, y_data_dict, x_label, y_label, x_predict, title = 'Linear Fit'):
    # Define the linear function you want to fit
    def linear_func(x, a, b):
        return a * x + b

    plt.figure(figsize=(10, 6))  # Create a larger figure for better visualization
    custom_labels = []
    custom_handles = []
    
    for key, x_data in x_dict.items():
        y_data = y_data_dict[key]
        # Fit the linear function to the data
        params, covariance = curve_fit(linear_func, x_data, y_data)

        # Parameters of the fitted linear function
        a_fit, b_fit = params

        # Predict y-value
        y_predict = linear_func(x_predict, a_fit, b_fit)

        # Calculate R^2
        residuals = y_data - linear_func(x_data, a_fit, b_fit)
        ss_res = np.sum(residuals**2)
        ss_tot = np.sum((y_data - np.mean(y_data))**2)
        r_squared = 1 - (ss_res / ss_tot)

        # Plot the original data
        plt.scatter(x_data, y_data, label=f'{key}')
        x_range = np.linspace(min(x_data), max(x_data), 100)
        line, = plt.plot(x_range, linear_func(x_range, a_fit, b_fit))  # Get line for color

        # Collect custom labels and handles
        custom_labels.append(f'a={a_fit:.2f}, R^2={r_squared:.4f}')
        # custom_labels.append(f'R^2={r_squared:.4f}')
        custom_handles.append(line)

        print(f'Predicted y-value for x = {x_predict}: {y_predict}s = {y_predict/60}min = {y_predict/3600}h')

    plt.xlabel(x_label)
    plt.ylabel(y_label)
    plt.title(title)

    # Create the first legend for the line labels
    legend1 = plt.legend(loc='upper left', bbox_to_anchor=(0, 1))
    
    # Add the first legend manually to the current Axes
    plt.gca().add_artist(legend1)
    
    # Create the second legend for the custom labels
    plt.legend(custom_handles, custom_labels, loc='upper right')
    # plt.legend(custom_handles, custom_labels, loc='upper left', bbox_to_anchor=(0, 1))

    plt.grid(True)
    # plt.xticks(np.arange(2, max(x_data) + 1, 2.0))
    plt.show()


def plot_multiple_time_exp(x_features, y_time, x_label, y_label, x_predict, title = 'Exponential Fit'):
    def exponential_func(x, a, b):
        return a * np.exp(b * x)

    initial_guess = [1.0, 0.1]

    custom_labels = []
    custom_handles = []

    # Specify colors for each dataset
    colors = ['c', 'b', 'r', 'y']

    plt.figure(figsize=(10, 6))  # Create a larger figure for better visualization

    for i, (key, feature) in enumerate(x_features.items()):
        params, covariance = curve_fit(exponential_func, feature, y_time[key], p0=initial_guess)
        y_predict = exponential_func(x_predict, *params)

        # Calculate R^2
        residuals = y_time[key] - exponential_func(feature, *params)
        ss_res = np.sum(residuals**2)
        ss_tot = np.sum((y_time[key] - np.mean(y_time[key]))**2)
        r_squared = 1 - (ss_res / ss_tot)

        plt.scatter(feature, y_time[key], label=f'{key}', marker='o')
        x_range = np.linspace(0, max(feature), 100)  # Use the common x-range
        line, = plt.plot(x_range, exponential_func(x_range, *params))  # Get line for color

        # Collect custom labels and handles
        custom_labels.append(f'R^2={r_squared:.4f}')
        custom_handles.append(line)

        print(f'{key} - Predicted y-value for x = {x_predict}: {y_predict}s = {y_predict/60}min = {y_predict/3600}h')

    plt.xlabel(x_label)
    plt.ylabel(y_label)
    plt.title(title)
    plt.grid(True)

    # Create the first legend for the line labels
    legend1 = plt.legend(loc='upper left', bbox_to_anchor=(0, 1))
    
    # Add the first legend manually to the current Axes
    plt.gca().add_artist(legend1)
    
    # Create the second legend for the custom labels
    plt.legend(custom_handles, custom_labels, loc='upper left', bbox_to_anchor=(0, 0.9))

    plt.tight_layout()  # Ensure proper layout of subplots
    plt.show()


def plot_multiple_time_poly(x_features, y_time, x_label, y_label, x_predict, degree=2, title='Polynomial Fit'):
    
    # Polynomial fit function
    def poly_func(x, *coeffs):
        return np.polyval(coeffs, x)

    plt.figure(figsize=(10, 6))  # Create a larger figure for better visualization
    custom_labels = []
    custom_handles = []

    for i, (key, feature) in enumerate(x_features.items()):
        # Fit the polynomial
        coeffs, covariance = curve_fit(poly_func, feature, y_time[key], p0=[1]*(degree+1))
        y_predict_val = poly_func(x_predict, *coeffs)

        # Calculate R^2
        residuals = y_time[key] - poly_func(feature, *coeffs)
        ss_res = np.sum(residuals**2)
        ss_tot = np.sum((y_time[key] - np.mean(y_time[key]))**2)
        r_squared = 1 - (ss_res / ss_tot)

        plt.scatter(feature, y_time[key], label=f'{key}')
        x_range = np.linspace(0, max(feature), 100)  # Use the common x-range
        line, = plt.plot(x_range, poly_func(x_range, *coeffs))  # Get line for color

        # Collect custom labels and handles
        custom_labels.append(f'R^2={r_squared:.4f}')
        custom_handles.append(line)
        print(f'{key} - Predicted y-value for x = {x_predict}: {y_predict_val}s = {y_predict_val/60}min = {y_predict_val/3600}h')

    plt.xlabel(x_label)
    plt.ylabel(y_label)
    plt.title(title)
    plt.grid(True)

    # Create the first legend for the line labels
    legend1 = plt.legend(loc='upper left', bbox_to_anchor=(0, 1))
    
    # Add the first legend manually to the current Axes
    plt.gca().add_artist(legend1)
    
    # Create the second legend for the custom labels
    plt.legend(custom_handles, custom_labels, loc='upper left', bbox_to_anchor=(0, 0.9))

    plt.tight_layout()  # Ensure proper layout of subplots
    plt.show()
    

def plot_multiple_time_log(x_features, y_time, x_label, y_label, x_predict, title='Logarithmic Fit'):
    def log_func(x, a, b, c):
        return a + b * np.log(x + c)

    initial_guess = [1.0, 1.0, 1.0]  # Three parameters for the logarithmic function

    plt.figure(figsize=(10, 6))  # Create a larger figure for better visualization

    for i, (key, feature) in enumerate(x_features.items()):
        params, covariance = curve_fit(log_func, feature, y_time[key], p0=initial_guess)
        y_predict = log_func(x_predict, *params)

        plt.scatter(feature, y_time[key], label=f'{key}')
        x_range = np.linspace(1, max(feature), 100)  # Use the common x-range, starting from 1 to avoid log(0)
        plt.plot(x_range, log_func(x_range, *params), '-')  # Set the line color

        plt.xlabel(x_label)
        plt.ylabel(y_label)
        plt.legend()
        plt.title(title)
        plt.grid(True)
        print(f'{key} - Predicted y-value for x = {x_predict}: {y_predict}s = {y_predict/60}min = {y_predict/3600}h')

    plt.tight_layout()  # Ensure proper layout of subplots
    plt.show()


def plot_iteration_scores(dataframes, xlim=None, ylim=None):
    """
    Plot iteration scores from a list of DataFrames on the same plot.

    Args:
        dataframes (list of pd.DataFrame): List of DataFrames, each containing 'Iteration' and 'Score' columns.
        xlim (tuple or list, optional): Tuple or list specifying the x-axis limits (e.g., xlim=(0, 10)).
        ylim (tuple or list, optional): Tuple or list specifying the y-axis limits (e.g., ylim=(-2000, -1000)).
    """
    plt.figure(figsize=(8, 5))

    for exp, df in dataframes.items():
        if 'Iteration' not in df.columns or 'Score' not in df.columns:
            print("Each DataFrame must contain 'Iteration' and 'Score' columns.")
            return
        
        # Select rows where iterations are within xlim
        if xlim is not None:
            df = df[(df['Iteration'] >= xlim[0]) & (df['Iteration'] <= xlim[1])]
        # Select rows where scores are within ylim
        if ylim is not None:
            df = df[(df['Score'] >= ylim[0]) & (df['Score'] <= ylim[1])]

        plt.plot(df['Iteration'], df['Score'], marker='', linestyle='-', label=exp)

    plt.title('Iteration vs. Score')
    plt.xlabel('Iteration')
    plt.ylabel('Score')

    # Set axis limits if provided
    if xlim is not None:
        plt.xlim(xlim)
    if ylim is not None:
        plt.ylim(ylim)

    plt.grid(True)
    plt.legend()  # Add legends for each DataFrame
    plt.show()


def plot_iteration_weights(dataframes, metric='Average Difference', xlim=None, ylim=None, title=None):
    """
    Plot iteration scores from a list of DataFrames on the same plot.

    Args:
        dataframes (list of pd.DataFrame): List of DataFrames, each containing 'Iteration' and 'Score' columns.
        xlim (tuple or list, optional): Tuple or list specifying the x-axis limits (e.g., xlim=(0, 10)).
        ylim (tuple or list, optional): Tuple or list specifying the y-axis limits (e.g., ylim=(-2000, -1000)).
    """
    plt.figure(figsize=(10, 6))

    for exp, df in dataframes.items():
        
        # Select rows where iterations are within xlim
        if xlim is not None:
            df = df[(df['Iteration'] >= xlim[0]) & (df['Iteration'] <= xlim[1])]
        # Select rows where scores are within ylim
        if ylim is not None:
            df = df[(df[metric] >= ylim[0]) & (df[metric] <= ylim[1])]

        plt.plot(df['Iteration'], df[metric], marker='', linestyle='-', label=exp)

    # plt.title(f'{metric} between Consecutive Iterations')
    plt.title(title)
    plt.xlabel('Iteration')
    plt.ylabel(f'Parameters - {metric}')
    
    # Set axis limits if provided
    if xlim is not None:
        plt.xlim(xlim)
    if ylim is not None:
        plt.ylim(ylim)

    plt.grid(True)
    plt.legend()  # Add legends for each DataFrame
    plt.show()

import seaborn as sns
import matplotlib.pyplot as plt


def plot_clustered_heatmap(matrix, score_type='Average JSD (all classes)'):
    # Convert the square distance matrix into condensed one
    condensed_matrix = squareform(matrix, checks=False)

    # Compute the linkage and get the order
    linkage_result = linkage(condensed_matrix, method='average')
    row_order = leaves_list(linkage_result)
    
    # Reorder rows and columns based on clustering
    clustered_matrix = matrix.iloc[row_order, :].iloc[:, row_order]

    # Create a clustered heatmap
    plt.figure(figsize=(8, 6), dpi=100)
    ax = sns.heatmap(clustered_matrix, annot=True, cmap="viridis", square=True)  # Reduce font size here
    
    # Modify x and y labels by removing _200i and _40i
    labels = [label.replace('_200i', '').replace('_40i', '') for label in clustered_matrix.index]
    
    # Set tick labels after creating the heatmap
    ax.set_xticks(np.arange(len(labels)) + 0.5)
    ax.set_xticklabels(labels)
    ax.set_yticks(np.arange(len(labels)) + 0.5)
    ax.set_yticklabels(labels)

    # Adjust font size for tick labels
    plt.tick_params(axis='x', labelsize=12, rotation=90)
    plt.tick_params(axis='y', labelsize=12, rotation=0)
    
    # Label the colorbar
    cbar = ax.collections[0].colorbar
    cbar.ax.tick_params(labelsize=11)
    cbar.set_label(score_type, fontsize=12)

    # Enhancing the aesthetics
    sns.despine(offset=10, trim=True)
    # plt.tight_layout()

    plt.show()


def calc_average_jsd_heatmap(experiments, predicates, jsd_dict):
    # Calculate average JSD per combination across all predicates
    average_jsd_matrix = pd.DataFrame(index=experiments, columns=experiments)

    for exp1 in experiments:
        for exp2 in experiments:
            if exp1 != exp2:
                combination_jsd_sum = 0
                valid_predicates = 0  # Track the number of valid predicates for this combination
                for pred in predicates:
                    jsd_values = jsd_dict[pred][f'JSD_{exp1}_{exp2}']
                    if not jsd_values.isna().all():  # Skip if all values are NaN
                        combination_jsd_sum += jsd_values.mean()
                        valid_predicates += 1
                if valid_predicates > 0:
                    average_jsd = combination_jsd_sum / valid_predicates
                    average_jsd_matrix.loc[exp1, exp2] = average_jsd

    # Convert the matrix to numeric
    average_jsd_matrix = average_jsd_matrix.apply(pd.to_numeric)
    average_jsd_matrix.fillna(0, inplace=True)

    return average_jsd_matrix


def calc_individual_predicate_jsd_heatmap(experiments, predicate, jsd_dict):
    # Create a matrix to store JSD values for the given predicate
    jsd_matrix = pd.DataFrame(index=experiments, columns=experiments)

    for exp1 in experiments:
        for exp2 in experiments:
            if exp1 != exp2:
                jsd_values = jsd_dict[predicate][f'JSD_{exp1}_{exp2}']
                jsd_matrix.loc[exp1, exp2] = jsd_values.mean()

    # Convert the matrix to numeric
    jsd_matrix = jsd_matrix.apply(pd.to_numeric)

    jsd_matrix.fillna(0, inplace=True)

    return jsd_matrix


def calc_average_overlap_heatmap(experiments, predicates, max_dict):
    # Calculate average JSD per combination across all predicates
    average_overlap_matrix = pd.DataFrame(index=experiments, columns=experiments)

    for exp1 in experiments:
        for exp2 in experiments:
            if exp1 != exp2:
                total_overlap = 0
                valid_predicates = 0  # Track the number of valid predicates for this combination
                for pred in predicates:
                    overlap_values = max_dict[pred][f'MaxMatch_{exp1}_{exp2}']
                    if not overlap_values.isna().all():  # Skip if all values are NaN
                        total_overlap += overlap_values.mean()
                        valid_predicates += 1
                if valid_predicates > 0:
                    average_overlap = total_overlap / valid_predicates
                    average_overlap_matrix.loc[exp1, exp2] = average_overlap

    # Convert the matrix to numeric
    average_overlap_matrix = average_overlap_matrix.apply(pd.to_numeric)

    average_overlap_matrix.fillna(1, inplace=True)

    return average_overlap_matrix


def calc_individual_predicate_overlap_heatmap(experiments, predicate, max_dict):
    # Create a matrix to store JSD values for the given predicate
    overlap_matrix = pd.DataFrame(index=experiments, columns=experiments)

    for exp1 in experiments:
        for exp2 in experiments:
            if exp1 != exp2:
                overlap_values = max_dict[predicate][f'MaxMatch_{exp1}_{exp2}']
                overlap_matrix.loc[exp1, exp2] = overlap_values.mean()

    # Convert the matrix to numeric
    overlap_matrix = overlap_matrix.apply(pd.to_numeric)

    overlap_matrix.fillna(1, inplace=True)

    return overlap_matrix


def plot_targets_heatmaps(experiment_dict):
    num_experiments = len(experiment_dict)

    # Set up the figure and axes
    fig, axes = plt.subplots(1, num_experiments, figsize=(6 * num_experiments, 6))
    fig.suptitle('Heatmaps of Probability by Enzyme/substrate Pairs')

    for i, (experiment_name, df) in enumerate(experiment_dict.items()):
        pivot_df = df['targets'].pivot(index='enzyme', columns='substrate', values='probability')
        
        # Plot the heatmap for this experiment
        sns.heatmap(pivot_df, ax=axes[i], annot=True, cmap='coolwarm', linewidths=0.5, cbar=False, vmin=0, vmax=1)
        axes[i].set_title(experiment_name)
        axes[i].set_yticklabels(axes[i].get_yticklabels(), rotation=0)
        axes[i].grid(color='gray', linestyle='--', linewidth=0.5)

    # Show the plot
    plt.tight_layout(rect=[0, 0, 1, 0.9])
    plt.show()


def plot_targets_heatmaps_diff(experiment_dict):
    num_experiments = len(experiment_dict)
    
    # Check if there is only one experiment to compare
    if num_experiments == 2:
        experiment_name1, df1 = list(experiment_dict.items())[0]
        experiment_name2, df2 = list(experiment_dict.items())[1]
        
        # Pivot the dataframe
        pivot_df1 = df1['targets'].pivot(index='enzyme', columns='substrate', values='probability')
        pivot_df2 = df2['targets'].pivot(index='enzyme', columns='substrate', values='probability')
            
        # Calculate the difference between the two dataframes
        diff_df = abs(pivot_df1 - pivot_df2)

        # Create a single heatmap for the experiment
        plt.figure(figsize=(6, 6))
        plt.suptitle(f'{experiment_name1} vs {experiment_name2}')
        sns.heatmap(diff_df, annot=True, cmap='coolwarm', linewidths=0.5, cbar=False, vmin=0, vmax=1)
        plt.yticks(rotation=0)
        plt.grid(color='gray', linestyle='--', linewidth=0.5)
        plt.show()
    else:
        # Set up the figure and axes
        fig, axes = plt.subplots(1, num_experiments-1, figsize=(6 * (num_experiments-1), 6))
        fig.suptitle('Heatmaps of Probability Differences between Experiments')

        # Create an iterator for the axes
        axes_iter = iter(axes)
        
        # Iterate over pairs of experiments
        comparison_dict = {}
        for i in range(num_experiments - 1):
            experiment_name1, df1 = list(experiment_dict.items())[i]
            experiment_name2, df2 = list(experiment_dict.items())[i + 1]
            
            # Pivot both dataframes
            pivot_df1 = df1['targets'].pivot(index='enzyme', columns='substrate', values='probability')
            pivot_df2 = df2['targets'].pivot(index='enzyme', columns='substrate', values='probability')
            
            # Calculate the difference between the two dataframes
            diff_df = abs(pivot_df1 - pivot_df2)
            comparison_dict[f'{experiment_name1} vs {experiment_name2}'] = diff_df
        
        for i, (experiment_name, df) in enumerate(comparison_dict.items()):
            # Get the next available axes
            ax = next(axes_iter)
            
            # Plot the heatmap for this experiment
            sns.heatmap(df, ax=ax, annot=True, cmap='coolwarm', linewidths=0.5, cbar=False, vmin=0, vmax=1)
            ax.set_title(experiment_name)
            ax.set_yticklabels(ax.get_yticklabels(), rotation=0)
            ax.grid(color='gray', linestyle='--', linewidth=0.5)

        # Show the plot
        plt.tight_layout(rect=[0, 0, 1, 0.9])
        plt.show()


def plot_multiclass_roc(y_onehot_test, y_score, target_names):
    n_classes = len(target_names)
    fpr = dict()
    tpr = dict()
    roc_auc = dict()

    for i in range(n_classes):
        fpr[i], tpr[i], _ = roc_curve(y_onehot_test[:, i], y_score[:, i])
        roc_auc[i] = auc(fpr[i], tpr[i])

    fpr_grid = np.linspace(0.0, 1.0, 1000)

    # Interpolate all ROC curves at these points
    mean_tpr = np.zeros_like(fpr_grid)

    for i in range(n_classes):
        mean_tpr += np.interp(fpr_grid, fpr[i], tpr[i])  # linear interpolation

    # Average it and compute AUC
    mean_tpr /= n_classes

    fpr["macro"] = fpr_grid
    tpr["macro"] = mean_tpr
    roc_auc["macro"] = auc(fpr["macro"], tpr["macro"])

    # Compute micro-average ROC curve and ROC area
    fpr["micro"], tpr["micro"], _ = roc_curve(y_onehot_test.ravel(), y_score.ravel())
    roc_auc["micro"] = auc(fpr["micro"], tpr["micro"])

    fig, ax = plt.subplots(figsize=(6, 6))

    plt.plot(
        fpr["micro"],
        tpr["micro"],
        label=f"micro-average ROC curve (AUC = {roc_auc['micro']:.2f})",
        color="deeppink",
        linestyle=":",
        linewidth=4,
    )

    plt.plot(
        fpr["macro"],
        tpr["macro"],
        label=f"macro-average ROC curve (AUC = {roc_auc['macro']:.2f})",
        color="navy",
        linestyle=":",
        linewidth=4,
    )

    colors = cycle(["aqua", "darkorange", "cornflowerblue"])
    for class_id, color in zip(range(n_classes), colors):
        RocCurveDisplay.from_predictions(
            y_onehot_test[:, class_id],
            y_score[:, class_id],
            name=f"ROC curve for {target_names[class_id]}",
            color=color,
            ax=ax,
            # plot_chance_level=True,
        )

    plt.axis("square")
    plt.xlabel("False Positive Rate")
    plt.ylabel("True Positive Rate")
    plt.title("Extension of Receiver Operating Characteristic\nto One-vs-Rest multiclass")
    plt.legend()
    plt.show()

    # Create a DataFrame to store all AUC values
    auc_df = pd.DataFrame({
        'Class': target_names,
        'AUC': [roc_auc[i] for i in range(n_classes)],
    })
    # Add Macro-average row
    macro_avg_row = pd.DataFrame({'Class': ['Macro-average'], 'AUC': [roc_auc['macro']]})
    # Add Micro-average row
    micro_avg_row = pd.DataFrame({'Class': ['Micro-average'], 'AUC': [roc_auc['micro']]})
    # Concatenate the DataFrames
    auc_df = pd.concat([auc_df, macro_avg_row, micro_avg_row], ignore_index=True)

    return auc_df


def plot_micro_average_roc(y_onehot_tests, y_scores, experiment_names):
    n_experiments = len(experiment_names)

    fig, ax = plt.subplots(figsize=(6, 6))

    for i in range(n_experiments):
        fpr, tpr, _ = roc_curve(y_onehot_tests[i].ravel(), y_scores[i].ravel())
        roc_auc = auc(fpr, tpr)

        plt.plot(
            fpr,
            tpr,
            label=f"{experiment_names[i]} (AUC = {roc_auc:.6f})",
            linestyle="-",
            linewidth=2,
        )

    plt.xlabel("False Positive Rate")
    plt.ylabel("True Positive Rate")
    # plt.title("Micro-average ROC Curve for Multiple Experiments")
    plt.legend()
    plt.show()

    # Create a DataFrame to store all AUC values
    auc_df = pd.DataFrame({
        'Experiment': experiment_names,
        'AUC': [auc(y_onehot_tests[i].ravel(), y_scores[i].ravel()) for i in range(n_experiments)],
    })
    return auc_df


def plot_micro_average_roc_seaborn(y_onehot_tests, y_scores, experiment_names):
    n_experiments = len(experiment_names)

    # Apply Seaborn's default styling
    sns.set_style("whitegrid")

    plt.figure(figsize=(6, 6), dpi=100)

    for i in range(n_experiments):
        fpr, tpr, _ = roc_curve(y_onehot_tests[i].ravel(), y_scores[i].ravel())
        roc_auc = auc(fpr, tpr)

        # Set line style based on experiment number
        linestyle = "--" if i > 9 else "-"  # Dashed line for experiments after exp10

        plt.plot(
            fpr,
            tpr,
            label=f"{experiment_names[i].split('_')[0]} (AUC = {roc_auc:.4f})",
            # label=f"{experiment_names[i]} (AUC = {roc_auc:.6f})",
            linestyle=linestyle,
            linewidth=1.5,
        )

    # Add the reference line
    plt.plot([0, 1], [0, 1], color='gray', linestyle='--', linewidth=1)

    # Improve the grid, make it lighter
    plt.grid(True, linestyle='--', linewidth=0.5)

    # Increase the legibility of the ticks
    plt.xticks(fontsize=12)
    plt.yticks(fontsize=12)
    
    plt.xlabel("False Positive Rate", fontsize=14)
    plt.ylabel("True Positive Rate", fontsize=14)
    plt.legend(loc='lower right', fontsize=12)

    plt.show()


def plot_micro_average_roc_seaborn_paired(y_onehot_tests, y_scores, experiment_names):
    n_experiments = len(experiment_names)

    # Apply Seaborn's default styling
    sns.set_style("whitegrid")

    plt.figure(figsize=(6, 6), dpi=100)

    # Define a color map to ensure experiments have the same color
    color_map = plt.cm.tab20
    
    for i in range(n_experiments):
        fpr, tpr, _ = roc_curve(y_onehot_tests[i].ravel(), y_scores[i].ravel())
        roc_auc = auc(fpr, tpr)

        # Extracting base name for color consistency
        base_name = experiment_names[i].replace('_p>0.8', '')
        
        # Assigning color based on base name
        color = color_map(list(experiment_names).index(base_name) / n_experiments if base_name in experiment_names else i / n_experiments)

        # Set line style based on 'top20%' presence
        linestyle = "--" if '_p>0.8' in experiment_names[i] else "-"
        
        plt.plot(
            fpr,
            tpr,
            label=f"{experiment_names[i]} (AUC = {roc_auc:.4f})",
            linestyle=linestyle,
            linewidth=1.5,
            color=color
        )

    # Add the reference line
    plt.plot([0, 1], [0, 1], color='gray', linestyle='--', linewidth=1)

    # Improve the grid, make it lighter
    plt.grid(True, linestyle='--', linewidth=0.5)

    # Increase the legibility of the ticks
    plt.xticks(fontsize=12)
    plt.yticks(fontsize=12)
    
    plt.xlabel("False Positive Rate", fontsize=14)
    plt.ylabel("True Positive Rate", fontsize=14)
    plt.legend(loc='lower right', fontsize=12)

    plt.show()


def plot_targets_heatmap(df):
    sns.set(style="whitegrid")  # Start with a white grid style

    # Create the figure
    plt.figure(figsize=(40, 40), dpi=100)

    # Plot the heatmap for this experiment
    sns.heatmap(df, annot=True, cmap='coolwarm', linewidths=0.5, cbar=False, vmin=0, vmax=1)

    plt.grid(color='gray', linestyle='--', alpha=0.5)
    plt.xticks(rotation=90)
    plt.yticks(rotation=0)
    plt.xlabel('Substrates', fontsize=11)
    plt.ylabel('Enzymes', fontsize=11)

    plt.tick_params(axis='both', which='minor', labelsize=11.5)

    # Show the plot
    plt.tight_layout(rect=[0, 0, 1, 0.9])
    plt.show()
