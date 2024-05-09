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
1.0::targets(E, P) :- es_interaction(E, P). % value = [true | false]; equivalent to 'es_interaction.exists'
%% e_activity(E, S, _dA). % value = _dA = [dec | base | inc]
e_activity(e1, s1, inc).
e_activity(e2, s1, dec).
e_activity(e3, s1, inc).
e_activity(e1, s2, inc).
e_activity(e2, s2, dec).
e_activity(e3, s2, dec).
e_activity(e1, s3, dec).
e_activity(e2, s3, dec).
e_activity(e3, s3, base).
e_activity(e1, s4, base).
e_activity(e2, s4, inc).
e_activity(e3, s4, inc).
e_activity(e1, s5, inc).
e_activity(e2, s5, base).
e_activity(e3, s5, inc).
e_activity(e1, s6, base).
e_activity(e2, s6, inc).
e_activity(e3, s6, dec).
e_activity(e1, s7, base).
e_activity(e2, s7, dec).
e_activity(e3, s7, inc).
e_activity(e1, s8, inc).
e_activity(e2, s8, dec).
e_activity(e3, s8, base).
e_activity(e1, s9, base).
e_activity(e2, s9, base).
e_activity(e3, s9, base).
e_activity(e1, s10, dec).
e_activity(e2, s10, inc).
e_activity(e3, s10, inc).
e_activity(e1, s11, base).
e_activity(e2, s11, base).
e_activity(e3, s11, dec).
e_activity(e1, s12, dec).
e_activity(e2, s12, base).
e_activity(e3, s12, base).
e_activity(e1, s13, inc).
e_activity(e2, s13, base).
e_activity(e3, s13, base).
e_activity(e1, s14, base).
e_activity(e2, s14, inc).
e_activity(e3, s14, base).
e_activity(e1, s15, dec).
e_activity(e2, s15, inc).
e_activity(e3, s15, dec).
e_activity(e1, s16, base).
e_activity(e2, s16, base).
e_activity(e3, s16, dec).
e_activity(e1, s17, base).
e_activity(e2, s17, dec).
e_activity(e3, s17, inc).
e_activity(e1, s18, inc).
e_activity(e2, s18, base).
e_activity(e3, s18, dec).
e_activity(e1, s19, dec).
e_activity(e2, s19, base).
e_activity(e3, s19, inc).
e_activity(e1, s20, dec).
e_activity(e2, s20, inc).
e_activity(e3, s20, inc).
e_activity(e1, s21, dec).
e_activity(e2, s21, inc).
e_activity(e3, s21, dec).
e_activity(e1, s22, base).
e_activity(e2, s22, dec).
e_activity(e3, s22, base).
e_activity(e1, s23, inc).
e_activity(e2, s23, base).
e_activity(e3, s23, dec).
e_activity(e1, s24, base).
e_activity(e2, s24, dec).
e_activity(e3, s24, inc).
e_activity(e1, s25, inc).
e_activity(e2, s25, dec).
e_activity(e3, s25, dec).
e_activity(e1, s26, base).
e_activity(e2, s26, base).
e_activity(e3, s26, base).
e_activity(e1, s27, inc).
e_activity(e2, s27, dec).
e_activity(e3, s27, dec).
e_activity(e1, s28, inc).
e_activity(e2, s28, dec).
e_activity(e3, s28, dec).
e_activity(e1, s29, inc).
e_activity(e2, s29, dec).
e_activity(e3, s29, dec).
e_activity(e1, s30, inc).
e_activity(e2, s30, dec).
e_activity(e3, s30, inc).
e_activity(e1, s31, base).
e_activity(e2, s31, inc).
e_activity(e3, s31, dec).
e_activity(e1, s32, inc).
e_activity(e2, s32, inc).
e_activity(e3, s32, dec).
e_activity(e1, s33, dec).
e_activity(e2, s33, base).
e_activity(e3, s33, base).
e_activity(e1, s34, inc).
e_activity(e2, s34, base).
e_activity(e3, s34, dec).
e_activity(e1, s35, inc).
e_activity(e2, s35, base).
e_activity(e3, s35, base).
e_activity(e1, s36, inc).
e_activity(e2, s36, base).
e_activity(e3, s36, inc).
e_activity(e1, s37, inc).
e_activity(e2, s37, inc).
e_activity(e3, s37, dec).
e_activity(e1, s38, dec).
e_activity(e2, s38, base).
e_activity(e3, s38, dec).
e_activity(e1, s39, dec).
e_activity(e2, s39, base).
e_activity(e3, s39, base).
e_activity(e1, s40, base).
e_activity(e2, s40, dec).
e_activity(e3, s40, base).
e_activity(e1, s41, inc).
e_activity(e2, s41, inc).
e_activity(e3, s41, base).
e_activity(e1, s42, dec).
e_activity(e2, s42, base).
e_activity(e3, s42, inc).
e_activity(e1, s43, inc).
e_activity(e2, s43, dec).
e_activity(e3, s43, base).
e_activity(e1, s44, dec).
e_activity(e2, s44, base).
e_activity(e3, s44, base).
e_activity(e1, s45, inc).
e_activity(e2, s45, inc).
e_activity(e3, s45, dec).
e_activity(e1, s46, dec).
e_activity(e2, s46, inc).
e_activity(e3, s46, base).
e_activity(e1, s47, base).
e_activity(e2, s47, base).
e_activity(e3, s47, base).
e_activity(e1, s48, base).
e_activity(e2, s48, inc).
e_activity(e3, s48, inc).
e_activity(e1, s49, dec).
e_activity(e2, s49, base).
e_activity(e3, s49, dec).
e_activity(e1, s50, dec).
e_activity(e2, s50, inc).
e_activity(e3, s50, base).
e_activity(e1, s51, dec).
e_activity(e2, s51, base).
e_activity(e3, s51, dec).
e_activity(e1, s52, dec).
e_activity(e2, s52, dec).
e_activity(e3, s52, inc).
e_activity(e1, s53, inc).
e_activity(e2, s53, dec).
e_activity(e3, s53, base).
e_activity(e1, s54, base).
e_activity(e2, s54, dec).
e_activity(e3, s54, inc).
e_activity(e1, s55, base).
e_activity(e2, s55, dec).
e_activity(e3, s55, inc).
e_activity(e1, s56, inc).
e_activity(e2, s56, dec).
e_activity(e3, s56, dec).
e_activity(e1, s57, base).
e_activity(e2, s57, dec).
e_activity(e3, s57, base).
e_activity(e1, s58, dec).
e_activity(e2, s58, base).
e_activity(e3, s58, dec).
e_activity(e1, s59, inc).
e_activity(e2, s59, dec).
e_activity(e3, s59, dec).
e_activity(e1, s60, inc).
e_activity(e2, s60, inc).
e_activity(e3, s60, base).
e_activity(e1, s61, inc).
e_activity(e2, s61, dec).
e_activity(e3, s61, dec).
e_activity(e1, s62, base).
e_activity(e2, s62, inc).
e_activity(e3, s62, base).
e_activity(e1, s63, inc).
e_activity(e2, s63, base).
e_activity(e3, s63, inc).
e_activity(e1, s64, inc).
e_activity(e2, s64, inc).
e_activity(e3, s64, dec).
e_activity(e1, s65, inc).
e_activity(e2, s65, dec).
e_activity(e3, s65, inc).
e_activity(e1, s66, inc).
e_activity(e2, s66, dec).
e_activity(e3, s66, inc).
e_activity(e1, s67, inc).
e_activity(e2, s67, base).
e_activity(e3, s67, inc).
e_activity(e1, s68, dec).
e_activity(e2, s68, inc).
e_activity(e3, s68, inc).
e_activity(e1, s69, base).
e_activity(e2, s69, inc).
e_activity(e3, s69, inc).
e_activity(e1, s70, inc).
e_activity(e2, s70, base).
e_activity(e3, s70, base).
e_activity(e1, s71, inc).
e_activity(e2, s71, inc).
e_activity(e3, s71, base).
e_activity(e1, s72, dec).
e_activity(e2, s72, dec).
e_activity(e3, s72, inc).
e_activity(e1, s73, base).
e_activity(e2, s73, dec).
e_activity(e3, s73, dec).
e_activity(e1, s74, inc).
e_activity(e2, s74, inc).
e_activity(e3, s74, dec).
e_activity(e1, s75, inc).
e_activity(e2, s75, inc).
e_activity(e3, s75, dec).
e_activity(e1, s76, dec).
e_activity(e2, s76, dec).
e_activity(e3, s76, dec).
e_activity(e1, s77, inc).
e_activity(e2, s77, inc).
e_activity(e3, s77, dec).
e_activity(e1, s78, base).
e_activity(e2, s78, dec).
e_activity(e3, s78, inc).
e_activity(e1, s79, base).
e_activity(e2, s79, inc).
e_activity(e3, s79, base).
e_activity(e1, s80, base).
e_activity(e2, s80, dec).
e_activity(e3, s80, dec).
e_activity(e1, s81, inc).
e_activity(e2, s81, inc).
e_activity(e3, s81, base).
e_activity(e1, s82, inc).
e_activity(e2, s82, base).
e_activity(e3, s82, base).
e_activity(e1, s83, dec).
e_activity(e2, s83, dec).
e_activity(e3, s83, dec).
e_activity(e1, s84, dec).
e_activity(e2, s84, base).
e_activity(e3, s84, inc).
e_activity(e1, s85, base).
e_activity(e2, s85, dec).
e_activity(e3, s85, inc).
e_activity(e1, s86, inc).
e_activity(e2, s86, inc).
e_activity(e3, s86, base).
e_activity(e1, s87, dec).
e_activity(e2, s87, base).
e_activity(e3, s87, inc).
e_activity(e1, s88, dec).
e_activity(e2, s88, inc).
e_activity(e3, s88, inc).
e_activity(e1, s89, inc).
e_activity(e2, s89, base).
e_activity(e3, s89, inc).
e_activity(e1, s90, inc).
e_activity(e2, s90, base).
e_activity(e3, s90, dec).
e_activity(e1, s91, inc).
e_activity(e2, s91, dec).
e_activity(e3, s91, base).
e_activity(e1, s92, dec).
e_activity(e2, s92, base).
e_activity(e3, s92, base).
e_activity(e1, s93, dec).
e_activity(e2, s93, base).
e_activity(e3, s93, base).
e_activity(e1, s94, dec).
e_activity(e2, s94, inc).
e_activity(e3, s94, dec).
e_activity(e1, s95, dec).
e_activity(e2, s95, inc).
e_activity(e3, s95, inc).
e_activity(e1, s96, base).
e_activity(e2, s96, dec).
e_activity(e3, s96, inc).
e_activity(e1, s97, dec).
e_activity(e2, s97, dec).
e_activity(e3, s97, inc).
e_activity(e1, s98, inc).
e_activity(e2, s98, inc).
e_activity(e3, s98, dec).
e_activity(e1, s99, inc).
e_activity(e2, s99, base).
e_activity(e3, s99, inc).
e_activity(e1, s100, inc).
e_activity(e2, s100, inc).
e_activity(e3, s100, dec).

%%% probabilistic attributes (known) %%%
% p::targets(E, P).
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

p_occupancy(P, S, _dO) :- 
    phosphosite(P),
    findall(E, (targets(E,P), e_function(E, kinase), e_activity(E, S, inc)), K_inc), 
    findall(E, (targets(E,P), e_function(E, kinase), e_activity(E, S, dec)), K_dec), 
    findall(E, (targets(E,P), e_function(E, kinase), e_activity(E, S, base)), K_base), 
    findall(E, (targets(E,P), e_function(E, phosphatase), e_activity(E, S, inc)), P_inc), 
    findall(E, (targets(E,P), e_function(E, phosphatase), e_activity(E, S, dec)), P_dec),
    findall(E, (targets(E,P), e_function(E, phosphatase), e_activity(E, S, base)), P_base),
    length(K_inc, CK_inc), length(K_dec, CK_dec), length(P_dec, CP_dec), length(P_inc, CP_inc), length(K_base, CK_base), length(P_base, CP_base),
    O_inc is CK_inc + CP_dec, O_dec is CK_dec + CP_inc, O_base is CK_base + CP_base,
    (O_inc > O_dec, _dO = inc; O_inc < O_dec, _dO = dec; O_inc = O_dec, _dO = base; O_inc = 0, O_dec = 0, O_base > 0, _dO = base).

%% QUERIES
query(p_occupancy(_, s100, _)).
