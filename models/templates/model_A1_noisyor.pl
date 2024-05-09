%% Prior Knowledge

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

% interaction
interaction(e1,p41).
interaction(e2,p41).
interaction(e3,p41).
interaction(e4,p51).
interaction(e4,p52).
interaction(e4,p61).

% enz_class
enz_class(e1,kinase).
enz_class(e2,kinase).
enz_class(e3,phosphatase).
enz_class(e4,kinase).



%%% Probabilistic Facts / Annotated Disjunctions

% fold_change/3
t(0.33, P)::fold_change(P, S, inc); t(0.33, P)::fold_change(P, S, dec); t(0.33, P)::fold_change(P, S, baseline) :- phosphosite(P).
% activity/3
t(0.33, E)::activity(E, S, inc); t(0.33, E)::activity(E, S, dec); t(0.33, E)::activity(E, S, baseline) :- enzyme(E).


%%% Clauses

% modification/4
modification(E, P, S, inc) :- interaction(E, P), enz_class(E, kinase), activity(E, S, inc).
modification(E, P, S, inc) :- interaction(E, P), enz_class(E, phosphatase), activity(E, S, dec).
modification(E, P, S, dec) :- interaction(E, P), enz_class(E, kinase), activity(E, S, dec).
modification(E, P, S, dec) :- interaction(E, P), enz_class(E, phosphatase), activity(E, S, inc).
modification(E, P, S, baseline) :- interaction(E, P), enz_class(E, kinase), activity(E, S, baseline).
modification(E, P, S, baseline) :- interaction(E, P), enz_class(E, phosphatase), activity(E, S, baseline).


%%% Probabilistic Clauses / Annotated Disjunctions

% occupancy/3 (noisy OR)
0.001::occupancy(P, S, inc); 0.001::occupancy(P, S, dec); 0.001::occupancy(P, S, baseline) :- phosphosite(P). 
t(0.33, _fc)::occupancy(P, S, inc); t(0.33, _fc)::occupancy(P, S, dec); t(0.33, _fc)::occupancy(P, S, baseline) :- fold_change(P, S, _fc).
t(0.33, E, _dM)::occupancy(P, S, inc); t(0.33, E, _dM)::occupancy(P, S, dec); t(0.33, E, _dM)::occupancy(P, S, baseline) :- modification(E, P, S, _dM).
