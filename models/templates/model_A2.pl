%%% Facts

% Background information

% enzyme/1
enzyme(e1).
enzyme(e2).
enzyme(e3).

% phosphosite/1
phosphosite(p0).

% enz_class/2
enz_class(e1, kinase).
enz_class(e2, kinase).
enz_class(e3, phosphatase).

% interaction/2
0.9::interaction(e1, p0).
0.65::interaction(e2, p0).
0.8::interaction(e3, p0).


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

% occupancy/3
0.001::occupancy(P, S, inc); 0.001::occupancy(P, S, dec); 0.001::occupancy(P, S, baseline) :- phosphosite(P). 
t(0.33, P, _fc, _dM1, _dM2, _dM3)::occupancy(P, S, inc); t(0.33, P, _fc, _dM1, _dM2, _dM3)::occupancy(P, S, dec); t(0.33, P, _fc, _dM1, _dM2, _dM3)::occupancy(P, S, baseline) :- 
	fold_change(P, S, _fc), 
	modification(e1, P, S, _dM1),
	modification(e2, P, S, _dM2),
	modification(e3, P, S, _dM3).
