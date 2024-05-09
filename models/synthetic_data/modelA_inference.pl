%%% Clauses

% modification/4
modification(E, P, S, inc) :- interaction(E, P), enz_class(E, kinase), activity(E, S, inc).
modification(E, P, S, inc) :- interaction(E, P), enz_class(E, phosphatase), activity(E, S, dec).
modification(E, P, S, dec) :- interaction(E, P), enz_class(E, kinase), activity(E, S, dec).
modification(E, P, S, dec) :- interaction(E, P), enz_class(E, phosphatase), activity(E, S, inc).
modification(E, P, S, baseline) :- interaction(E, P), enz_class(E, kinase), activity(E, S, baseline).
modification(E, P, S, baseline) :- interaction(E, P), enz_class(E, phosphatase), activity(E, S, baseline).


%%% Probabilistic Clauses / Annotated Disjunctions

% occupancy/3
occupancy(P, S, _dO) :- phosphosite(P), 
                        findall(E, modification(E, P, S, inc), E_inc), 
                        findall(E, modification(E, P, S, dec), E_dec), 
                        findall(E, modification(E, P, S, baseline), E_base), 
                        length(E_inc, C_inc), length(E_dec, C_dec),
                        (C_inc > C_dec, _dO = inc; C_inc < C_dec, _dO = dec; C_inc = C_dec, _dO = baseline).

% fold_change/3
fold_change(P, S, _dO) :- phosphosite(P), occupancy(P, S, _dO).


%%% Queries

query(fold_change(P, S, _fc)).
query(occupancy(P, S, _dO)).


%%% Prior Knowledge

% enzyme
enzyme(e1).
enzyme(e2).
enzyme(e3).
enzyme(e4).

% phosphosite
phosphosite(p41).
phosphosite(p51).
phosphosite(p52).
phosphosite(p61).

% enz_class
enz_class(e1,kinase).
enz_class(e2,kinase).
enz_class(e3,phosphatase).
enz_class(e4,kinase).

% interaction
interaction(e1,p41).
interaction(e2,p41).
interaction(e3,p41).
interaction(e4,p51).
interaction(e4,p52).
interaction(e4,p61).
