# Libraries
import pandas as pd
import re


# FROM MODEL TO PROBLOG SYNTAX

# ProbLog templates: facts, probabilistic facts, etc. 
class ProblogTemplate:
    def __init__(self, predicate, arguments):
        self.predicate = predicate
        self.arguments = arguments

    def __str__(self):
        raise NotImplementedError("Subclasses must implement the __str__ method.")

# Facts (fixed)
class FactTemplate(ProblogTemplate):
    def __init__(self, predicate, arguments):
        super().__init__(predicate, arguments)
        self.regex_pattern = rf"{self.predicate}\((.+)\)"
    
    def __str__(self):
        formatted_args = [f'"{arg}"' if arg[0].isupper() else arg for arg in self.arguments]
        arg_str = ', '.join(formatted_args)
        return f"{self.predicate}({arg_str})."

# Evidence
class EvidenceTemplate(ProblogTemplate):
    def __init__(self, predicate, arguments):
        super().__init__(predicate, arguments)
        self.regex_pattern = rf"evidence\({self.predicate}\((.+)\)\)"

    def __str__(self):
        formatted_args = [f'"{arg}"' if arg[0].isupper() else arg for arg in self.arguments]
        arg_str = ', '.join(formatted_args)
        return f"evidence({self.predicate}({arg_str}))."
    
# Probabilistic Facts
class ProblogProbabilisticFactTemplate(ProblogTemplate):
    def __init__(self, predicate, arguments, probabilities):
        super().__init__(predicate, arguments)
        self.probabilities = probabilities

    def __str__(self):
        facts = []
        for args, prob in zip(self.arguments, self.probabilities):
            arg_str = ', '.join(args)
            facts.append(f"{prob}::{self.predicate}({arg_str}).")
        return '\n'.join(facts)
    
# Probabilistic Targets Fact
class ProblogProbabilisticTargetsTemplate(ProblogTemplate):
    def __init__(self, predicate, arguments):
        super().__init__(predicate, arguments)
        self.regex_pattern = rf"{self.predicate}\((.+)\)"
    
    def __str__(self):
        formatted_args = [f'"{arg}"' if arg[0].isupper() else arg for arg in self.arguments]
        arg_str = ', '.join(formatted_args)
        return f"t(0.5)::{self.predicate}({arg_str})."

# Probabilistic Clauses (AD)
class AnnotatedDisjunctionClauseTemplate(ProblogTemplate):
    def __init__(self, predicate, arguments, value, ads, evidence_of):
        super().__init__(predicate, arguments)
        self.value = value
        self.ad = ads
        self.ad_values = ['dec', 'base', 'inc']  # Modify this list as needed
        self.evidence_of = evidence_of

    def __str__(self):
        formatted_args = [f'"{arg}"' if arg[0].isupper() else arg for arg in self.arguments]
        arg_str = ', '.join(formatted_args)
        # round p to 3 decimal places
        annotation_str = '; '.join([f'{round(p, 10)}::{self.predicate}({arg_str}, {val})' for p, val in zip(self.ad, self.ad_values)])
        clause = f"{annotation_str} :- {self.evidence_of}({arg_str}, {self.value})."
        return clause

class AnnotatedDisjunctionClauseBooleanTemplate(ProblogTemplate):
    def __init__(self, predicate, arguments, value, ads, evidence_of):
        super().__init__(predicate, arguments)
        self.value = value
        self.ad = ads
        self.ad_values = ['dec', 'inc']  # Modify this list as needed
        self.evidence_of = evidence_of

    def __str__(self):
        formatted_args = [f'"{arg}"' if arg[0].isupper() else arg for arg in self.arguments]
        arg_str = ', '.join(formatted_args)
        # round p to 3 decimal places
        annotation_str = '; '.join([f'{round(p, 10)}::{self.predicate}({arg_str}, {val})' for p, val in zip(self.ad, self.ad_values)])
        clause = f"{annotation_str} :- {self.evidence_of}({arg_str}, {self.value})."
        return clause

class AnnotatedDisjunctionClauseDomainTemplate(ProblogTemplate):
    def __init__(self, predicate, arguments, value, ad, domain):
        super().__init__(predicate, arguments)
        self.value = value
        self.ad = ad
        self.ad_values = ['dec', 'inc']  # Modify this list as needed
        self.domain = domain

    def __str__(self):
        formatted_args = [f'"{arg}"' if arg[0].isupper() else arg for arg in self.arguments]
        arg_str = ', '.join(formatted_args)
        # round p to 3 decimal places
        annotation_str = '; '.join([f'{round(self.ad, 10)}::{self.predicate}({arg_str}, {val})' for val in self.ad_values])
        clause = f"{annotation_str} :- {self.domain}({formatted_args[0]})."
        return clause
    
class QueryTemplate(ProblogTemplate):
    def __init__(self, predicate, arguments):
        super().__init__(predicate, arguments)
        self.regex_pattern = rf"query\({self.predicate}\((.+)\)\)"

    def __str__(self):
        formatted_args = [f'"{arg}"' if arg[0].isupper() else arg for arg in self.arguments]
        arg_str = ', '.join(formatted_args)
        return f"query({self.predicate}({arg_str}))."
    
# Problog Statement Generator
class ProblogStatementGenerator:
    def __init__(self, predicate_object):
        self.predicate_object = predicate_object

    def generate_facts(self, template_class, select='all'):
        arg_names = self.predicate_object.arguments
        facts = []

        for i in range(len(getattr(self.predicate_object, arg_names[0]))):
            arguments = [getattr(self.predicate_object, arg)[i] for arg in arg_names]
            if select == 'all':
                fact = template_class(self.predicate_object.predicate_name, arguments)
                facts.append(str(fact))
            elif select != all and all(item in arguments for item in select):
                fact = template_class(self.predicate_object.predicate_name, arguments)
                facts.append(str(fact))
            else:
                continue

        return facts
        
    def generate_queries(self):
        arg_names = self.predicate_object.arguments
        queries = []

        # Find the first existing attribute that is not None to determine the loop length
        for i in range(len(arg_names)):
            if getattr(self.predicate_object, arg_names[i]) is not None:
                break  # Found the first existing non-None attribute


        for j in range(len(getattr(self.predicate_object, arg_names[i]))):
            arguments = []

            for arg in arg_names:
                if getattr(self.predicate_object, arg) is not None:
                    arguments.append(getattr(self.predicate_object, arg)[j])
                else:
                    arguments.append("_")  # Replace missing attributes with underscores

            query = QueryTemplate(self.predicate_object.predicate_name, arguments)
            queries.append(str(query))

        return queries
    
    def generate_ad_clauses(self, type=None):
        entity_names = self.predicate_object.arguments.copy()
        entity_names.remove('value')
        clauses = []

        for i in range(len(getattr(self.predicate_object, entity_names[0]))):
            entities = [getattr(self.predicate_object, entity)[i] for entity in entity_names]
            if type == 'boolean':
                ads = [getattr(self.predicate_object, ad)[i] for ad in ['dec', 'inc']]
                clause = AnnotatedDisjunctionClauseBooleanTemplate(self.predicate_object.predicate_name, entities, self.predicate_object.value[i], ads, self.predicate_object.evidence_of)
            elif type == 'domain':
                if i % 2 == 0:
                    continue
                val = self.predicate_object.value[i]
                ad = (1 - getattr(self.predicate_object, val)[i]) / 2
                clause = AnnotatedDisjunctionClauseDomainTemplate(self.predicate_object.predicate_name, entities, self.predicate_object.value[i], ad, self.predicate_object.domain)
            else:
                ads = [getattr(self.predicate_object, ad)[i] for ad in self.predicate_object.value_types]
                clause = AnnotatedDisjunctionClauseTemplate(self.predicate_object.predicate_name, entities, self.predicate_object.value[i], ads, self.predicate_object.evidence_of)
            
            clauses.append(str(clause))

        return clauses
    

# FROM PROBLOG SYNTAX TO MODEL

def statements_to_df(statements, predicate_class, template_class, keep_fact=False):
    template_instance = template_class(predicate=predicate_class.predicate_name,
                                       arguments=predicate_class.arguments)

    df_data = []

    for statement in statements:
        match = re.match(template_instance.regex_pattern, statement)
        if match:
            arguments = match.group(1).split(',')
            arguments = [arg.replace('"', '') for arg in arguments]
            if keep_fact:
                arguments.append(statement)
            df_data.append(arguments)

    columns = template_instance.arguments.copy()
    if keep_fact:
        columns.append('fact')

    df = pd.DataFrame(df_data, columns=columns)
    df = df.sort_values(by=columns)

    return df


# FROM AND TO FILES

# Add statements to ProbLog model
def insert_statements(model:str, statements:list, location:str, model_out=None):

    if model_out is None:
        model_out = model
    inputfile = open(model, 'r').readlines()
    write_file = open(model_out,'w')
    
    for line in inputfile:
        write_file.write(line)
        if f'{location}' in line:
            for statement in statements:
                write_file.write(statement + '\n')
    write_file.close()

# Remove queries from ProbLog model
def remove_queries(model):

    inputfile = open(model, 'r').readlines()
    write_file = open(model,'w')

    for line in inputfile:
        if not (line.startswith('query')):
            write_file.write(line)
    write_file.close()

# Remove queries from ProbLog model
def remove_evidence(model):

    inputfile = open(model, 'r').readlines()
    write_file = open(model,'w')

    for line in inputfile:
        if not (line.startswith('evidence')):
            write_file.write(line)
    write_file.close()

# Read in sampled data, separate into samples, and convert to dataframe
def sampling_file_to_df(file_path, predicate_class, template_class):
    facts_by_sample = {}
    current_sample = 1

    with open(file_path, 'r') as file:
        lines = file.readlines()

        for line in lines:
            line = line.strip()
            
            if line == "----------------":
                current_sample += 1
                continue
            
            if current_sample not in facts_by_sample:
                facts_by_sample[current_sample] = []
            
            facts_by_sample[current_sample].append(line)

    dataframes = []
    for sample_num, facts in facts_by_sample.items():
        result_df = statements_to_df(facts, predicate_class, template_class)
        result_df['sample'] = f's{sample_num}'
        dataframes.append(result_df)
    
    concatenated_df = pd.concat(dataframes, ignore_index=True)
    concatenated_df = concatenated_df.sort_values(by=concatenated_df.columns.tolist()).reset_index(drop=True)

    return concatenated_df


# MISC UTILS

# Merge two dictionaries into one dictionary by key and concatenate values to list
def merge_dictionary(dict_1, dict_2):
    dict_3 = {**dict_1, **dict_2}
    for key, value in dict_3.items():
        if key in dict_1 and key in dict_2:
            if isinstance(value, list):
                dict_3[key] = value + dict_1[key]
            elif isinstance(value, pd.DataFrame):
                dict_3[key] = pd.concat([value, dict_1[key]])
                dict_3[key] = dict_3[key].sort_values(by=value.columns.tolist()).reset_index(drop=True)

    return dict_3
