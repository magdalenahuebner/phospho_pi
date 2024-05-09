%%% entity classes %%%
%% enzyme(E).
enzyme(e1).
enzyme(e2).
enzyme(e3).
%% phosphosite(P).
phosphosite(p0).

%%% relationship classes %%%
%% es_interaction(E,P).
es_interaction(e1, p0).
es_interaction(e2, p0).
es_interaction(e3, p0).

%%% fixed attributes %%%
%% e_function(E, _function). % value = _function = [kinase | phosphatase]
e_function(e1, kinase).
e_function(e2, kinase).
e_function(e3, phosphatase).
targets(E, P) :- es_interaction(E, P). % value = [true | false]; equivalent to 'es_interaction.exists'

%%% probabilistic attributes (known) %%%
% p::targets(E, P).
1/3::e_activity(E, S, dec); 1/3::e_activity(E, S, base); 1/3::e_activity(E, S, inc) :- enzyme(E). % value = _dA = [dec | base | inc] (prior, E/S-level)
% p1::e_ksea(E, S, dec); p2::e_ksea(E, S, base); p3::e_ksea(E, S, inc) :- e_activity(E, S, _dA). % value = _ksea = [dec | base | inc] (cpd, E/S-level)
% p1::p_fc(P, S, dec); p2::p_fc(P, S, base); p3::p_fc(P, S, inc) :- p_occupancy(P, S, _dO). % value = _fc = [dec | base | inc] (cpd, P/S-level)

%%% probabilistic attributes (unknown) %%%
% t(p1)targets(E, P). % initialise with specific probability (e.g. Cantley)
% t(1/2)targets(E, P) :- es_interaction(E, P).
% t(1/2)targets(E, P) :- enzyme(E), phosphosite(P).
% t(_, _dO)::p_fc(P, S, dec); t(_, _dO)::p_fc(P, S, base); t(_, _dO)::p_fc(P, S, inc) :- p_occupancy(P, S, _dO). % value = _fc = [dec | base | inc] (cpd, P-level)
% t(1/3, S)::e_activity(E, S, dec); t(1/3, S)::e_activity(E, S, base); t(1/3, S)::e_activity(E, S, inc) :- enzyme(E). % value = _dA = [dec | base | inc] (prior, E/S-level)

%%% occupancy aggregation rule (cpd, P-level, E-level)
% % auxiliary variables (value = [true | false])
% t(1.0)::occ_dec(P, S) :- targets(E, P), e_function(E, kinase), e_activity(E, S, dec).
% t(1.0)::occ_dec(P, S) :- targets(E, P), e_function(E, phosphatase), e_activity(E, S, inc).
% t(1.0)::occ_base(P, S) :- targets(E, P), e_function(E, kinase), e_activity(E, S, base).
% t(1.0)::occ_base(P, S) :- targets(E, P), e_function(E, phosphatase), e_activity(E, S, base).
% t(1.0)::occ_inc(P, S) :- targets(E, P), e_function(E, kinase), e_activity(E, S, inc).
% t(1.0)::occ_inc(P, S) :- targets(E, P), e_function(E, phosphatase), e_activity(E, S, dec).
% % aggregation (value = _dO = [dec | base | inc])
% t(1.0)::p_occupancy(P, S, dec); t(0.0)::p_occupancy(P, S, base); t(0.0)::p_occupancy(P, S, inc) :- occ_dec(P, S), occ_base(P, S), \+ occ_inc(P, S).
% t(0.0)::p_occupancy(P, S, dec); t(0.0)::p_occupancy(P, S, base); t(1.0)::p_occupancy(P, S, inc) :- \+ occ_dec(P, S), occ_base(P, S), occ_inc(P, S).
% t(0.0)::p_occupancy(P, S, dec); t(1.0)::p_occupancy(P, S, base); t(0.0)::p_occupancy(P, S, inc) :- occ_dec(P, S), occ_base(P, S), occ_inc(P, S).
% t(0.0)::p_occupancy(P, S, dec); t(1.0)::p_occupancy(P, S, base); t(0.0)::p_occupancy(P, S, inc) :- \+ occ_dec(P, S), occ_base(P, S), \+ occ_inc(P, S).
% t(1.0)::p_occupancy(P, S, dec); t(0.0)::p_occupancy(P, S, base); t(0.0)::p_occupancy(P, S, inc) :- occ_dec(P, S), \+ occ_base(P, S), \+ occ_inc(P, S).
% t(0.0)::p_occupancy(P, S, dec); t(0.0)::p_occupancy(P, S, base); t(1.0)::p_occupancy(P, S, inc) :- \+ occ_dec(P, S), \+ occ_base(P, S), occ_inc(P, S).
% t(0.0)::p_occupancy(P, S, dec); t(1.0)::p_occupancy(P, S, base); t(0.0)::p_occupancy(P, S, inc) :- occ_dec(P, S), \+ occ_base(P, S), occ_inc(P, S).
% t(0.0)::p_occupancy(P, S, dec); t(1.0)::p_occupancy(P, S, base); t(0.0)::p_occupancy(P, S, inc) :- \+ occ_dec(P, S), \+ occ_base(P, S), \+ occ_inc(P, S).

query(e_activity(E, s, _dO)).
