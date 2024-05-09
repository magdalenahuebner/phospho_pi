%%% Probabilistic Clauses / Annotated Disjunctions

% activity/3
1/3::activity(E, S, inc); 1/3::activity(E, S, dec); 1/3::activity(E, S, baseline) :- enzyme(E), sample(S).


%%% Queries

query(activity(E, S, _dA)).


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
