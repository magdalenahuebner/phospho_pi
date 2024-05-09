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


%%% Samples

sample(s1).
sample(s2).
sample(s3).
sample(s4).
sample(s5).
sample(s6).
sample(s7).
sample(s8).
sample(s9).
sample(s10).
sample(s11).
sample(s12).
sample(s13).
sample(s14).
sample(s15).
sample(s16).
sample(s17).
sample(s18).
sample(s19).
sample(s20).
sample(s21).
sample(s22).
sample(s23).
sample(s24).
sample(s25).
