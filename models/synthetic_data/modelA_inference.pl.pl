%%% Clauses

% modification/4
1.0::modification(E, P, S, inc) :- interaction(E, P), enz_class(E, kinase), activity(E, S, inc).
1.0::modification(E, P, S, inc) :- interaction(E, P), enz_class(E, phosphatase), activity(E, S, dec).
1.0::modification(E, P, S, dec) :- interaction(E, P), enz_class(E, kinase), activity(E, S, dec).
1.0::modification(E, P, S, dec) :- interaction(E, P), enz_class(E, phosphatase), activity(E, S, inc).
1.0::modification(E, P, S, baseline) :- interaction(E, P), enz_class(E, kinase), activity(E, S, baseline).
1.0::modification(E, P, S, baseline) :- interaction(E, P), enz_class(E, phosphatase), activity(E, S, baseline).


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

query(fold_change(P,s9,_fc)).
query(occupancy(P,s9,_dO)).


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


%%% Additional Facts

% activity
activity(e1,s1,dec).
activity(e1,s10,inc).
activity(e1,s11,dec).
activity(e1,s12,dec).
activity(e1,s13,inc).
activity(e1,s14,inc).
activity(e1,s15,dec).
activity(e1,s16,inc).
activity(e1,s17,baseline).
activity(e1,s18,baseline).
activity(e1,s19,dec).
activity(e1,s2,inc).
activity(e1,s20,inc).
activity(e1,s21,baseline).
activity(e1,s22,dec).
activity(e1,s23,dec).
activity(e1,s24,baseline).
activity(e1,s25,baseline).
activity(e1,s3,baseline).
activity(e1,s4,dec).
activity(e1,s5,baseline).
activity(e1,s6,dec).
activity(e1,s7,dec).
activity(e1,s8,baseline).
activity(e1,s9,inc).
activity(e2,s1,baseline).
activity(e2,s10,inc).
activity(e2,s11,dec).
activity(e2,s12,baseline).
activity(e2,s13,dec).
activity(e2,s14,dec).
activity(e2,s15,inc).
activity(e2,s16,dec).
activity(e2,s17,dec).
activity(e2,s18,baseline).
activity(e2,s19,baseline).
activity(e2,s2,baseline).
activity(e2,s20,dec).
activity(e2,s21,inc).
activity(e2,s22,baseline).
activity(e2,s23,dec).
activity(e2,s24,dec).
activity(e2,s25,baseline).
activity(e2,s3,baseline).
activity(e2,s4,baseline).
activity(e2,s5,dec).
activity(e2,s6,inc).
activity(e2,s7,baseline).
activity(e2,s8,dec).
activity(e2,s9,baseline).
activity(e3,s1,dec).
activity(e3,s10,baseline).
activity(e3,s11,dec).
activity(e3,s12,dec).
activity(e3,s13,baseline).
activity(e3,s14,dec).
activity(e3,s15,baseline).
activity(e3,s16,inc).
activity(e3,s17,inc).
activity(e3,s18,inc).
activity(e3,s19,inc).
activity(e3,s2,baseline).
activity(e3,s20,dec).
activity(e3,s21,baseline).
activity(e3,s22,inc).
activity(e3,s23,dec).
activity(e3,s24,dec).
activity(e3,s25,dec).
activity(e3,s3,dec).
activity(e3,s4,inc).
activity(e3,s5,inc).
activity(e3,s6,inc).
activity(e3,s7,inc).
activity(e3,s8,baseline).
activity(e3,s9,baseline).
activity(e4,s1,dec).
activity(e4,s10,dec).
activity(e4,s11,inc).
activity(e4,s12,dec).
activity(e4,s13,inc).
activity(e4,s14,baseline).
activity(e4,s15,inc).
activity(e4,s16,baseline).
activity(e4,s17,baseline).
activity(e4,s18,dec).
activity(e4,s19,dec).
activity(e4,s2,dec).
activity(e4,s20,inc).
activity(e4,s21,inc).
activity(e4,s22,inc).
activity(e4,s23,baseline).
activity(e4,s24,inc).
activity(e4,s25,dec).
activity(e4,s3,inc).
activity(e4,s4,dec).
activity(e4,s5,inc).
activity(e4,s6,baseline).
activity(e4,s7,baseline).
activity(e4,s8,baseline).
activity(e4,s9,inc).
