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
