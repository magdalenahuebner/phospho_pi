# Model Schema: P model, E model, N model
class PredicateStructure:

    @classmethod
    def identify_predicate_class(cls, fact):
        for subclass in cls.__subclasses__():
            if subclass.predicate_name in fact:
                return subclass
        return None  # If no matching class is found

# Entity Classes
class EnzymePredicate(PredicateStructure):
    predicate_name = 'enzyme'
    arguments = ['enzyme']
    type = 'entity'
    def __init__(self, enzyme_list):
        self.enzyme = enzyme_list

class PhosphositePredicate(PredicateStructure):
    predicate_name = 'phosphosite'
    arguments = ['phosphosite']
    type = 'entity'
    def __init__(self, phosphosite_list):
        self.phosphosite = phosphosite_list

class DrugPredicate(PredicateStructure):
    predicate_name = 'drug'
    arguments = ['drug']
    type = 'entity'
    def __init__(self, drug_list):
        self.drug = drug_list

# Relationship Classes
class ESInteractionPredicate(PredicateStructure):
    predicate_name = 'es_interaction'
    arguments = ['enzyme', 'substrate']
    type = 'entity'
    def __init__(self, dataframe, enzyme_col, phosphosite_col):
        self.enzyme = list(dataframe[enzyme_col])
        self.substrate = list(dataframe[phosphosite_col])

class DKInteractionPredicate(PredicateStructure):
    predicate_name = 'dk_interaction'
    arguments = ['drug', 'enzyme']
    type = 'entity'
    def __init__(self, dataframe, drug_col, enzyme_col):
        self.drug = list(dataframe[drug_col])
        self.enzyme = list(dataframe[enzyme_col])

class PRegulatesPredicate(PredicateStructure):
    predicate_name = 'p_regulates'
    arguments = ['phosphosite', 'protein']
    type = 'entity'
    def __init__(self, dataframe, phosphosite_col, protein_col):
        self.phosphosite = list(dataframe[phosphosite_col])
        self.protein = list(dataframe[protein_col])

# Attributes
class EFunctionPredicate(PredicateStructure):
    predicate_name = 'e_function'
    arguments = ['enzyme', 'function']
    type = 'fixed_attr'
    def __init__(self, dataframe, enzyme_col, function_col):
        self.enzyme = list(dataframe[enzyme_col])
        self.function = list(dataframe[function_col])

class EActivityPredicate(PredicateStructure):
    predicate_name = 'e_activity'
    arguments = ['enzyme', 'sample', 'value']
    type = 'prob_attr'
    value_types = ['dec', 'base', 'inc']
    def __init__(self):
        # Initialize attributes in __init__
        self.enzyme = None
        self.sample = None
        self.value = None
        self.probability = None

    def add_data(self, dataframe, enzyme_col, sample_col, value_col):
        self.enzyme = list(dataframe[enzyme_col])
        self.sample = list(dataframe[sample_col])
        self.value = list(dataframe[value_col])
    
    def add_samples(self, samples:list):
        self.sample = samples 

    def add_enzymes(self, enzymes:list):
        self.enzyme = enzymes 

    def add_probabilities(self, dataframe, prob_col):
        self.probability = list(dataframe[prob_col])

class EActDecPredicate(PredicateStructure):
    predicate_name = 'act_dec'
    arguments = ['enzyme', 'sample']
    type = 'prob_attr'

class EActBasePredicate(PredicateStructure):
    predicate_name = 'act_base'
    arguments = ['enzyme', 'sample']
    type = 'prob_attr'

class EActIncPredicate(PredicateStructure):
    predicate_name = 'act_inc'
    arguments = ['enzyme', 'sample']
    type = 'prob_attr'

class EKseaPredicate(PredicateStructure):
    predicate_name = 'e_ksea'
    arguments = ['enzyme', 'sample', 'value']
    value_types = ['dec', 'base', 'inc']
    evidence_of = 'e_activity'
    domain = 'enzyme'
    # def __init__(self):
    #     # Initialize attributes in __init__
    #     self.enzyme = None
    #     self.sample = None
    #     self.value = None

    def add_data(self, dataframe, enzyme_col, sample_col, value_col):
        self.enzyme = list(dataframe[enzyme_col])
        self.sample = list(dataframe[sample_col])
        self.value = list(dataframe[value_col])
    
    def add_samples(self, samples:list):
        self.sample = samples 

    def add_ad_probabilities(self, dataframe, p_dec_col, p_base_col, p_inc_col):
        self.dec = list(dataframe[p_dec_col])
        self.base = list(dataframe[p_base_col])
        self.inc = list(dataframe[p_inc_col])

class TargetsPredicate(PredicateStructure):
    predicate_name = 'targets'
    arguments = ['enzyme', 'substrate']
    type = 'prob_attr'
    def __init__(self):
        self.enzyme = None
        self.substrate = None

    def add_data(self, dataframe, enzyme_col, phosphosite_col):
        self.enzyme = list(dataframe[enzyme_col])
        self.substrate = list(dataframe[phosphosite_col])

    def add_probabilities(self, dataframe, prob_col):
        self.probability = list(dataframe[prob_col])

class PFunctionPredicate(PredicateStructure):
    predicate_name = 'p_function'
    arguments = ['phosphosite', 'function']
    type = 'fixed_attr'
    def __init__(self, dataframe, phosphosite_col, function_col):
        self.phosphosite = list(dataframe[phosphosite_col])
        self.function = list(dataframe[function_col])

class POccupancyPredicate(PredicateStructure):
    predicate_name = 'p_occupancy'
    arguments = ['phosphosite', 'sample', 'value']
    type = 'prob_attr'
    value_types = ['dec', 'base', 'inc']
    def __init__(self):
        # Initialize attributes in __init__
        self.phosphosite = None
        self.sample = None
        self.value = None
        self.probability = None

    def add_data(self, dataframe, phosphosite_col, sample_col, value_col):
        self.phosphosite = list(dataframe[phosphosite_col])
        self.sample = list(dataframe[sample_col])
        self.value = list(dataframe[value_col])
    
    def add_samples(self, samples:list):
        self.sample = samples 

    def add_phosphosites(self, phosphosites:list):
        self.phosphosite = phosphosites 

    def add_probabilities(self, dataframe, prob_col):
        self.probability = list(dataframe[prob_col])

class POccDecPredicate(PredicateStructure):
    predicate_name = 'occ_dec'
    arguments = ['phosphosite', 'sample']
    type = 'prob_attr'

class POccBasePredicate(PredicateStructure):
    predicate_name = 'occ_base'
    arguments = ['phosphosite', 'sample']
    type = 'prob_attr'

class POccIncPredicate(PredicateStructure):
    predicate_name = 'occ_inc'
    arguments = ['phosphosite', 'sample']
    type = 'prob_attr'

class PFoldChangePredicate(PredicateStructure):
    predicate_name = 'p_fc'
    arguments = ['phosphosite', 'sample', 'value']
    value_types = ['dec', 'base', 'inc']
    evidence_of = 'p_occupancy'
    domain = 'phosphosite'
    # def __init__(self):
    #     # Initialize attributes in __init__
    #     self.phosphosite = None
    #     self.sample = None
    #     self.value = None

    def add_data(self, dataframe, phosphosite_col, sample_col, value_col):
        self.phosphosite = list(dataframe[phosphosite_col])
        self.sample = list(dataframe[sample_col])
        self.value = list(dataframe[value_col])
    
    def add_samples(self, samples:list):
        self.sample = samples 

    def add_ad_probabilities(self, dataframe, p_dec_col, p_base_col, p_inc_col):
        self.dec = list(dataframe[p_dec_col])
        self.base = list(dataframe[p_base_col])
        self.inc = list(dataframe[p_inc_col])
