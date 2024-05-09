%%% entity classes %%%
%% enzyme(E).
enzyme("SRC").
enzyme("PTK2").
enzyme("HIPK2").
enzyme("FYN").
enzyme("PTPRG").
enzyme("ABL1").
%% phosphosite(P).
phosphosite("PTK2(S722)").
phosphosite("ABL1(S569)").
phosphosite("SRC(S17)").
phosphosite("ABL1(T735)").
phosphosite("ABL1(S718)").
phosphosite("PTPRG(S995)").
phosphosite("PTK2(S29)").
phosphosite("PTK2(S910)").
phosphosite("SRC(S75)").
phosphosite("PTK2(S843)").
phosphosite("HIPK2(Y361)").
%% drugs(D).
drug("PF3758309").
drug("LY2835219").
drug("GDC0941").
drug("Go6976").
drug("Dabrafenib").
drug("GF109203X").
drug("CX4945").
drug("Dasatinib").

%%% relationship classes %%%
%% p_regulates(P,E).
p_regulates("ABL1(S569)", "ABL1").
p_regulates("ABL1(S718)", "ABL1").
p_regulates("ABL1(T735)", "ABL1").
p_regulates("HIPK2(Y361)", "HIPK2").
p_regulates("PTK2(S29)", "PTK2").
p_regulates("PTK2(S722)", "PTK2").
p_regulates("PTK2(S910)", "PTK2").
p_regulates("PTPRG(S995)", "PTPRG").
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
%% p_function(P, _function).
p_function("SRC(S17)", p_inc).
p_function("ABL1(S569)", p_inc).
p_function("SRC(S75)", p_inc).
p_function("HIPK2(Y361)", p_inc).
p_function("ABL1(T735)", p_dec).
p_function("PTK2(S910)", p_inc).
p_function("PTK2(S843)", p_inc).
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

% occupancy
t(0.33, P, S)::p_occupancy(P, S, dec); t(0.33, P, S)::p_occupancy(P, S, inc) :- phosphosite(P). % value = _dA = [dec | base | inc] (prior, E/S-level)

%%% occupancy aggregation rule (cpd, P-level, E-level)
% auxiliary variables (value = [true | false])
0.001::act_dec(E, S) :- p_regulates(P, E).
0.001::act_inc(E, S) :- p_regulates(P, E).
0.001::act_inc(E, S) :- inhibits(S, E).
t(0.9, E)::act_dec(E, S) :- inhibits(S, E).
t(0.7, P, E)::act_dec(E, S) :- p_regulates(P, E), p_function(P, p_inc), p_occupancy(P, S, dec).
t(0.7, P, E)::act_dec(E, S) :- p_regulates(P, E), p_function(P, p_dec), p_occupancy(P, S, inc).
t(0.7, P, E)::act_inc(E, S) :- p_regulates(P, E), p_function(P, p_inc), p_occupancy(P, S, inc).
t(0.7, P, E)::act_inc(E, S) :- p_regulates(P, E), p_function(P, p_dec), p_occupancy(P, S, dec).

% aggregation (value = _dO = [dec | base | inc])
t(1.0, E)::e_activity(E, S, dec); t(0.0, E)::e_activity(E, S, inc) :- act_dec(E, S), \+ act_inc(E, S).
t(0.0, E)::e_activity(E, S, dec); t(1.0, E)::e_activity(E, S, inc) :- \+ act_dec(E, S), act_inc(E, S).
t(0.5, E)::e_activity(E, S, dec); t(0.5, E)::e_activity(E, S, inc) :- act_dec(E, S), act_inc(E, S).
t(0.0, E)::e_activity(E, S, dec); t(0.0, E)::e_activity(E, S, inc) :- \+ act_dec(E, S), \+ act_inc(E, S).
