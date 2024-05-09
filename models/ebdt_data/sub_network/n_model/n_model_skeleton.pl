%%% entity classes %%%
%% enzyme(E).
enzyme("PTPRR").
enzyme("ABI1").
enzyme("ANXA2P2").
enzyme("ABL1").
enzyme("FYN").
enzyme("SRC").
enzyme("RBM39").
enzyme("BCLAF1").
enzyme("PTK6").
enzyme("PXN").
enzyme("PTK2").
enzyme("PTPRG").
enzyme("HIPK2").
enzyme("PTTG1IP").
enzyme("ATF1").
%% phosphosite(P).
phosphosite("BCLAF1(Y284)").
phosphosite("RBM39(Y95)").
phosphosite("PTK2(S910)").
phosphosite("ABI1(Y213)").
phosphosite("PXN(Y118)").
phosphosite("ANXA2P2(Y24)").
phosphosite("SRC(S17)").
phosphosite("SRC(S75)").
phosphosite("PTK2(S843)").
phosphosite("PTTG1IP(Y174)").
phosphosite("ATF1(S198)").
phosphosite("PTPRG(S995)").
phosphosite("PTK2(S722)").
phosphosite("PXN(Y88)").
phosphosite("ABL1(S718)").
phosphosite("ABL1(T735)").
phosphosite("ABL1(S569)").
phosphosite("PTK2(S29)").
phosphosite("HIPK2(Y361)").
%% drugs(D).
drug("GF109203X").
drug("PF3758309").
drug("GDC0941").
drug("Dasatinib").
drug("Go6976").
drug("LY2835219").
drug("Dabrafenib").
drug("CX4945").

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
es_interaction("HIPK2", "ATF1(S198)").
es_interaction("PTPRR", "PXN(Y88)").
%% p_regulates(P,E).
p_regulates("ABI1(Y213)", "ABI1").
p_regulates("ABL1(S569)", "ABL1").
p_regulates("ABL1(S718)", "ABL1").
p_regulates("ABL1(T735)", "ABL1").
p_regulates("ANXA2P2(Y24)", "ANXA2P2").
p_regulates("ATF1(S198)", "ATF1").
p_regulates("BCLAF1(Y284)", "BCLAF1").
p_regulates("HIPK2(Y361)", "HIPK2").
p_regulates("PTK2(S29)", "PTK2").
p_regulates("PTK2(S722)", "PTK2").
p_regulates("PTK2(S910)", "PTK2").
p_regulates("PTPRG(S995)", "PTPRG").
p_regulates("PTTG1IP(Y174)", "PTTG1IP").
p_regulates("PXN(Y118)", "PXN").
p_regulates("PXN(Y88)", "PXN").
p_regulates("RBM39(Y95)", "RBM39").
p_regulates("SRC(S17)", "SRC").
p_regulates("SRC(S75)", "SRC").
p_regulates("PTK2(S843)", "PTK2").
%% dk_interaction(D,E).
dk_interaction("Dabrafenib", "ABL1").
dk_interaction("Dasatinib", "ABL1").
dk_interaction("GDC0941", "ABL1").
dk_interaction("Dabrafenib", "FYN").
dk_interaction("Dasatinib", "FYN").
dk_interaction("PF3758309", "FYN").
dk_interaction("CX4945", "HIPK2").
dk_interaction("GF109203X", "HIPK2").
dk_interaction("Go6976", "HIPK2").
dk_interaction("LY2835219", "HIPK2").

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
%% p_function(P, _function).
p_function("PXN(Y88)", p_inc).
p_function("SRC(S17)", p_inc).
p_function("PXN(Y118)", p_inc).
p_function("RBM39(Y95)", unknown).
p_function("ABI1(Y213)", p_inc).
p_function("ABL1(S569)", p_inc).
p_function("SRC(S75)", p_inc).
p_function("ANXA2P2(Y24)", unknown).
p_function("PTTG1IP(Y174)", unknown).
p_function("HIPK2(Y361)", p_inc).
p_function("BCLAF1(Y284)", unknown).
p_function("ABL1(T735)", p_dec).
p_function("PTK2(S910)", p_inc).
p_function("ATF1(S198)", unknown).
p_function("PTK2(S843)", p_inc).
targets(E, P) :- es_interaction(E, P). % value = [true | false]; equivalent to 'es_interaction.exists'
inhibits(D, E) :- dk_interaction(D, E).

%%% probabilistic attributes (known) %%%
% p::targets(E, P).
%% p1::e_ksea(E, S, dec); p2::e_ksea(E, S, base); p3::e_ksea(E, S, inc) :- e_activity(E, S, _dA). % value = _ksea = [dec | base | inc] (cpd, E/S-level)
%% p1::p_fc(P, S, dec); p2::p_fc(P, S, base); p3::p_fc(P, S, inc) :- p_occupancy(P, S, _dO). % value = _fc = [dec | base | inc] (cpd, P/S-level)

%%% probabilistic attributes (unknown) %%%
%%t(0.33)::p_function(P, p_dec); t(0.33)::p_function(P, p_inc).
t(0.33)::p_function("PTK2(S722)", p_dec); t(0.33)::p_function("PTK2(S722)", p_inc).
t(0.33)::p_function("ABL1(S718)", p_dec); t(0.33)::p_function("ABL1(S718)", p_inc).
t(0.33)::p_function("PTPRG(S995)", p_dec); t(0.33)::p_function("PTPRG(S995)", p_inc).
t(0.33)::p_function("PTK2(S29)", p_dec); t(0.33)::p_function("PTK2(S29)", p_inc).

% activity
t(0.33, E, S)::e_activity(E, S, dec); t(0.33, E, S)::e_activity(E, S, inc) :- enzyme(E). % value = _dA = [dec | base | inc] (prior, E/S-level)

%%% occupancy aggregation rule (cpd, P-level, E-level)
% auxiliary variables (value = [true | false])
0.001::occ_dec(P, S) :- targets(E, P).
0.001::occ_inc(P, S) :- targets(E, P).
t(0.7, E, P)::occ_dec(P, S) :- targets(E, P), e_function(E, kinase), e_activity(E, S, dec).
t(0.7, E, P)::occ_dec(P, S) :- targets(E, P), e_function(E, phosphatase), e_activity(E, S, inc).
t(0.7, E, P)::occ_inc(P, S) :- targets(E, P), e_function(E, kinase), e_activity(E, S, inc).
t(0.7, E, P)::occ_inc(P, S) :- targets(E, P), e_function(E, phosphatase), e_activity(E, S, dec).
% aggregation (value = _dO = [dec | base | inc])
t(1.0, P)::p_occupancy(P, S, dec); t(0.0, P)::p_occupancy(P, S, inc) :- occ_dec(P, S), \+ occ_inc(P, S).
t(0.0, P)::p_occupancy(P, S, dec); t(1.0, P)::p_occupancy(P, S, inc) :- \+ occ_dec(P, S), occ_inc(P, S).
t(0.5, P)::p_occupancy(P, S, dec); t(0.5, P)::p_occupancy(P, S, inc) :- occ_dec(P, S), occ_inc(P, S).
t(0.0, P)::p_occupancy(P, S, dec); t(0.0, P)::p_occupancy(P, S, inc) :- \+ occ_dec(P, S), \+ occ_inc(P, S).

%%% occupancy aggregation rule (cpd, P-level, E-level)
% auxiliary variables (value = [true | false])
0.001::act_dec(E0, S) :- p_regulates(P, E0).
0.001::act_inc(E0, S) :- p_regulates(P, E0).
0.001::act_inc(E0, S) :- inhibits(S, E0).
t(0.9, E0)::act_dec(E0, S) :- inhibits(S, E).
t(0.7, P, E0)::act_dec(E0, S) :- p_regulates(P, E0), p_function(P, p_inc), p_occupancy(P, S, dec).
t(0.7, P, E0)::act_dec(E0, S) :- p_regulates(P, E0), p_function(P, p_dec), p_occupancy(P, S, inc).
t(0.7, P, E0)::act_inc(E0, S) :- p_regulates(P, E0), p_function(P, p_inc), p_occupancy(P, S, inc).
t(0.7, P, E0)::act_inc(E0, S) :- p_regulates(P, E0), p_function(P, p_dec), p_occupancy(P, S, dec).

% aggregation (value = _dO = [dec | base | inc])
t(1.0, E0)::e_activity(E0, S, dec); t(0.0, E0)::e_activity(E0, S, inc) :- act_dec(E0, S), \+ act_inc(E0, S).
t(0.0, E0)::e_activity(E0, S, dec); t(1.0, E0)::e_activity(E0, S, inc) :- \+ act_dec(E0, S), act_inc(E0, S).
t(0.5, E0)::e_activity(E0, S, dec); t(0.5, E0)::e_activity(E0, S, inc) :- act_dec(E0, S), act_inc(E0, S).
t(0.0, E0)::e_activity(E0, S, dec); t(0.0, E0)::e_activity(E0, S, inc) :- \+ act_dec(E0, S), \+ act_inc(E0, S).
