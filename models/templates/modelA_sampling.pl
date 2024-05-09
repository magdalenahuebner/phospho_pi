%%% Probabilistic Clauses / Annotated Disjunctions

% activity/3
1/3::activity(E, S, inc); 1/3::activity(E, S, dec); 1/3::activity(E, S, baseline) :- enzyme(E), sample(S).


%%% Queries

query(activity(E, S, _dA)).
