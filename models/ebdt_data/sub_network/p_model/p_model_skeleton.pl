%%% entity classes %%%
%% enzyme(E).
enzyme("HIPK2").
enzyme("PTK2").
enzyme("PTPRG").
enzyme("PTPRR").
enzyme("SRC").
enzyme("FYN").
enzyme("ABL1").
enzyme("PTK6").
%% phosphosite(P).
phosphosite("ATF1(S198)").
phosphosite("ANXA2P2(Y24)").
phosphosite("PXN(Y118)").
phosphosite("BCLAF1(Y284)").
phosphosite("PXN(Y88)").
phosphosite("PTTG1IP(Y174)").
phosphosite("ABI1(Y213)").
phosphosite("HIPK2(Y361)").
phosphosite("RBM39(Y95)").

%%% relationship classes %%%
%% es_interaction(E,P).
es_interaction("SRC", "PXN(Y88)").
es_interaction("SRC", "PXN(Y118)").
es_interaction("SRC", "ANXA2P2(Y24)").
es_interaction("SRC", "PTTG1IP(Y174)").
es_interaction("SRC", "BCLAF1(Y284)").
es_interaction("SRC", "HIPK2(Y361)").
es_interaction("ABL1", "PXN(Y118)").
es_interaction("ABL1", "ABI1(Y213)").
es_interaction("ABL1", "RBM39(Y95)").
es_interaction("PTK2", "PXN(Y118)").
es_interaction("PTPRG", "PXN(Y118)").
es_interaction("FYN", "PXN(Y118)").
es_interaction("PTK6", "PXN(Y118)").
es_interaction("HIPK2", "HIPK2(Y361)").
es_interaction("HIPK2", "ATF1(S198)").
es_interaction("PTPRR", "PXN(Y88)").

%%% fixed attributes %%%
%% e_function(E, _function). % value = _function = [kinase | phosphatase]
e_function("ABL1", kinase).
e_function("FYN", kinase).
e_function("HIPK2", kinase).
e_function("PTK2", kinase).
e_function("PTK6", kinase).
e_function("SRC", kinase).
e_function("PTPRG", phosphatase).
e_function("PTPRR", phosphatase).
targets(E, P) :- es_interaction(E, P). % value = [true | false]; equivalent to 'es_interaction.exists'

%%% probabilistic attributes (known) %%%
% p::targets(E, P).
%% p1::e_ksea(E, S, dec); p2::e_ksea(E, S, base); p3::e_ksea(E, S, inc) :- e_activity(E, S, _dA). % value = _ksea = [dec | base | inc] (cpd, E/S-level)
%% p1::p_fc(P, S, dec); p2::p_fc(P, S, base); p3::p_fc(P, S, inc) :- p_occupancy(P, S, _dO). % value = _fc = [dec | base | inc] (cpd, P/S-level)

%%% probabilistic attributes (unknown) %%%
% t(p1)targets(E, P). % initialise with specific probability (e.g. Cantley)
% t(1/2)targets(E, P) :- es_interaction(E, P).
% t(1/2)targets(E, P) :- enzyme(E), phosphosite(P).
% t(_, _dO)::p_fc(P, S, dec); t(_, _dO)::p_fc(P, S, base); t(_, _dO)::p_fc(P, S, inc) :- p_occupancy(P, S, _dO). % value = _fc = [dec | base | inc] (cpd, P-level)
t(0.33, E, S)::e_activity(E, S, dec); t(0.33, E, S)::e_activity(E, S, inc) :- enzyme(E). % value = _dA = [dec | base | inc] (prior, E/S-level)

%%% occupancy aggregation rule (cpd, P-level, E-level)
% auxiliary variables (value = [true | false])
t(0.7, E, P)::occ_dec(P, S) :- targets(E, P), e_function(E, kinase), e_activity(E, S, dec).
t(0.7, E, P)::occ_dec(P, S) :- targets(E, P), e_function(E, phosphatase), e_activity(E, S, inc).
t(0.7, E, P)::occ_inc(P, S) :- targets(E, P), e_function(E, kinase), e_activity(E, S, inc).
t(0.7, E, P)::occ_inc(P, S) :- targets(E, P), e_function(E, phosphatase), e_activity(E, S, dec).
% aggregation (value = _dO = [dec | base | inc])
t(1.0)::p_occupancy(P, S, dec); t(0.0)::p_occupancy(P, S, inc) :- occ_dec(P, S), \+ occ_inc(P, S).
t(0.0)::p_occupancy(P, S, dec); t(1.0)::p_occupancy(P, S, inc) :- \+ occ_dec(P, S), occ_inc(P, S).
t(0.5)::p_occupancy(P, S, dec); t(0.5)::p_occupancy(P, S, inc) :- occ_dec(P, S), occ_inc(P, S).
t(0.0)::p_occupancy(P, S, dec); t(0.0)::p_occupancy(P, S, inc) :- \+ occ_dec(P, S), \+ occ_inc(P, S).
