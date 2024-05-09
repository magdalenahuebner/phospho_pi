%%% Facts

% Background information

% enzyme/1
enzyme(e1).
% enzyme(e2).
enzyme(e3).

% phosphosite/1
phosphosite(p0).

% enz_class/2
enz_class(e1, kinase).
% enz_class(e2, kinase).
enz_class(e3, phosphatase).

% interaction/2
interaction(e1, p0).
% interaction(e2, p0).
interaction(e3, p0).

% activity/3
0.33::activity(E, S, inc); 0.33::activity(E, S, dec); 0.33::activity(E, S, baseline) :- enzyme(E).


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

query(fold_change(P,s999,_fc)).
query(occupancy(P,s999,_dO)).
query(modification(E,P,s999,_dM)).


%%% Evidence

evidence(activity(e1,s999,inc)).
evidence(activity(e3,s999,dec)).
