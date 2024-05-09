%%% entity classes %%%
%% enzyme(E).
enzyme(e1).
enzyme(e2).
enzyme(e3).
enzyme(e4).
%% phosphosite(P).
phosphosite(p0).
phosphosite(p1).
phosphosite(p2).
phosphosite(p3).
phosphosite(p4).
phosphosite(p5).
phosphosite(p6).
phosphosite(p7).
phosphosite(p8).
phosphosite(p9).
phosphosite(p10).
phosphosite(p11).
phosphosite(p12).
phosphosite(p13).
phosphosite(p14).
phosphosite(p15).
phosphosite(p16).
phosphosite(p17).
phosphosite(p18).
phosphosite(p19).
phosphosite(p20).

%%% relationship classes %%%
%% es_interaction(E,P).
es_interaction(e1, P) :- phosphosite(P).
es_interaction(e2, P) :- phosphosite(P).
es_interaction(e3, P) :- phosphosite(P).
es_interaction(e4, P) :- phosphosite(P).

%%% fixed attributes %%%
%% e_function(E, _function). % value = _function = [kinase | phosphatase]
e_function(e1, kinase).
e_function(e2, kinase).
e_function(e3, phosphatase).
e_function(e4, kinase).
targets(E, P) :- es_interaction(E, P). % value = [true | false]; equivalent to 'es_interaction.exists'

%%% probabilistic attributes (known) %%%
% p::targets(E, P).
%% p1::e_ksea(E, S, dec); p2::e_ksea(E, S, base); p3::e_ksea(E, S, inc) :- e_activity(E, S, _dA). % value = _ksea = [dec | base | inc] (cpd, E/S-level)
0.1663::e_ksea(E, s1, dec); 0.6675::e_ksea(E, s1, base); 0.1663::e_ksea(E, s1, inc) :- e_activity(E, s1, base).
0.6675::e_ksea(E, s1, dec); 0.3315::e_ksea(E, s1, base); 0.001::e_ksea(E, s1, inc) :- e_activity(E, s1, dec).
0.001::e_ksea(E, s1, dec); 0.3315::e_ksea(E, s1, base); 0.6675::e_ksea(E, s1, inc) :- e_activity(E, s1, inc).
0.0653::e_ksea(E, s10, dec); 0.8693::e_ksea(E, s10, base); 0.0653::e_ksea(E, s10, inc) :- e_activity(E, s10, base).
0.8693::e_ksea(E, s10, dec); 0.1297::e_ksea(E, s10, base); 0.001::e_ksea(E, s10, inc) :- e_activity(E, s10, dec).
0.001::e_ksea(E, s10, dec); 0.1297::e_ksea(E, s10, base); 0.8693::e_ksea(E, s10, inc) :- e_activity(E, s10, inc).
0.0186::e_ksea(E, s100, dec); 0.9628::e_ksea(E, s100, base); 0.0186::e_ksea(E, s100, inc) :- e_activity(E, s100, base).
0.9628::e_ksea(E, s100, dec); 0.0362::e_ksea(E, s100, base); 0.001::e_ksea(E, s100, inc) :- e_activity(E, s100, dec).
0.001::e_ksea(E, s100, dec); 0.0362::e_ksea(E, s100, base); 0.9628::e_ksea(E, s100, inc) :- e_activity(E, s100, inc).
0.0582::e_ksea(E, s11, dec); 0.8836::e_ksea(E, s11, base); 0.0582::e_ksea(E, s11, inc) :- e_activity(E, s11, base).
0.8836::e_ksea(E, s11, dec); 0.1154::e_ksea(E, s11, base); 0.001::e_ksea(E, s11, inc) :- e_activity(E, s11, dec).
0.001::e_ksea(E, s11, dec); 0.1154::e_ksea(E, s11, base); 0.8836::e_ksea(E, s11, inc) :- e_activity(E, s11, inc).
0.1457::e_ksea(E, s12, dec); 0.7087::e_ksea(E, s12, base); 0.1457::e_ksea(E, s12, inc) :- e_activity(E, s12, base).
0.7087::e_ksea(E, s12, dec); 0.2903::e_ksea(E, s12, base); 0.001::e_ksea(E, s12, inc) :- e_activity(E, s12, dec).
0.001::e_ksea(E, s12, dec); 0.2903::e_ksea(E, s12, base); 0.7087::e_ksea(E, s12, inc) :- e_activity(E, s12, inc).
0.0408::e_ksea(E, s13, dec); 0.9185::e_ksea(E, s13, base); 0.0408::e_ksea(E, s13, inc) :- e_activity(E, s13, base).
0.9185::e_ksea(E, s13, dec); 0.0805::e_ksea(E, s13, base); 0.001::e_ksea(E, s13, inc) :- e_activity(E, s13, dec).
0.001::e_ksea(E, s13, dec); 0.0805::e_ksea(E, s13, base); 0.9185::e_ksea(E, s13, inc) :- e_activity(E, s13, inc).
0.1295::e_ksea(E, s14, dec); 0.741::e_ksea(E, s14, base); 0.1295::e_ksea(E, s14, inc) :- e_activity(E, s14, base).
0.741::e_ksea(E, s14, dec); 0.258::e_ksea(E, s14, base); 0.001::e_ksea(E, s14, inc) :- e_activity(E, s14, dec).
0.001::e_ksea(E, s14, dec); 0.258::e_ksea(E, s14, base); 0.741::e_ksea(E, s14, inc) :- e_activity(E, s14, inc).
0.0472::e_ksea(E, s15, dec); 0.9057::e_ksea(E, s15, base); 0.0472::e_ksea(E, s15, inc) :- e_activity(E, s15, base).
0.9057::e_ksea(E, s15, dec); 0.0933::e_ksea(E, s15, base); 0.001::e_ksea(E, s15, inc) :- e_activity(E, s15, dec).
0.001::e_ksea(E, s15, dec); 0.0933::e_ksea(E, s15, base); 0.9057::e_ksea(E, s15, inc) :- e_activity(E, s15, inc).
0.0812::e_ksea(E, s16, dec); 0.8377::e_ksea(E, s16, base); 0.0812::e_ksea(E, s16, inc) :- e_activity(E, s16, base).
0.8377::e_ksea(E, s16, dec); 0.1613::e_ksea(E, s16, base); 0.001::e_ksea(E, s16, inc) :- e_activity(E, s16, dec).
0.001::e_ksea(E, s16, dec); 0.1613::e_ksea(E, s16, base); 0.8377::e_ksea(E, s16, inc) :- e_activity(E, s16, inc).
0.0684::e_ksea(E, s17, dec); 0.8631::e_ksea(E, s17, base); 0.0684::e_ksea(E, s17, inc) :- e_activity(E, s17, base).
0.8631::e_ksea(E, s17, dec); 0.1359::e_ksea(E, s17, base); 0.001::e_ksea(E, s17, inc) :- e_activity(E, s17, dec).
0.001::e_ksea(E, s17, dec); 0.1359::e_ksea(E, s17, base); 0.8631::e_ksea(E, s17, inc) :- e_activity(E, s17, inc).
0.198::e_ksea(E, s18, dec); 0.6041::e_ksea(E, s18, base); 0.198::e_ksea(E, s18, inc) :- e_activity(E, s18, base).
0.6041::e_ksea(E, s18, dec); 0.3949::e_ksea(E, s18, base); 0.001::e_ksea(E, s18, inc) :- e_activity(E, s18, dec).
0.001::e_ksea(E, s18, dec); 0.3949::e_ksea(E, s18, base); 0.6041::e_ksea(E, s18, inc) :- e_activity(E, s18, inc).
0.1351::e_ksea(E, s19, dec); 0.7298::e_ksea(E, s19, base); 0.1351::e_ksea(E, s19, inc) :- e_activity(E, s19, base).
0.7298::e_ksea(E, s19, dec); 0.2692::e_ksea(E, s19, base); 0.001::e_ksea(E, s19, inc) :- e_activity(E, s19, dec).
0.001::e_ksea(E, s19, dec); 0.2692::e_ksea(E, s19, base); 0.7298::e_ksea(E, s19, inc) :- e_activity(E, s19, inc).
0.1732::e_ksea(E, s2, dec); 0.6536::e_ksea(E, s2, base); 0.1732::e_ksea(E, s2, inc) :- e_activity(E, s2, base).
0.6536::e_ksea(E, s2, dec); 0.3454::e_ksea(E, s2, base); 0.001::e_ksea(E, s2, inc) :- e_activity(E, s2, dec).
0.001::e_ksea(E, s2, dec); 0.3454::e_ksea(E, s2, base); 0.6536::e_ksea(E, s2, inc) :- e_activity(E, s2, inc).
0.2462::e_ksea(E, s20, dec); 0.5076::e_ksea(E, s20, base); 0.2462::e_ksea(E, s20, inc) :- e_activity(E, s20, base).
0.5076::e_ksea(E, s20, dec); 0.4914::e_ksea(E, s20, base); 0.001::e_ksea(E, s20, inc) :- e_activity(E, s20, dec).
0.001::e_ksea(E, s20, dec); 0.4914::e_ksea(E, s20, base); 0.5076::e_ksea(E, s20, inc) :- e_activity(E, s20, inc).
0.1126::e_ksea(E, s21, dec); 0.7747::e_ksea(E, s21, base); 0.1126::e_ksea(E, s21, inc) :- e_activity(E, s21, base).
0.7747::e_ksea(E, s21, dec); 0.2243::e_ksea(E, s21, base); 0.001::e_ksea(E, s21, inc) :- e_activity(E, s21, dec).
0.001::e_ksea(E, s21, dec); 0.2243::e_ksea(E, s21, base); 0.7747::e_ksea(E, s21, inc) :- e_activity(E, s21, inc).
0.0151::e_ksea(E, s22, dec); 0.9697::e_ksea(E, s22, base); 0.0151::e_ksea(E, s22, inc) :- e_activity(E, s22, base).
0.9697::e_ksea(E, s22, dec); 0.0293::e_ksea(E, s22, base); 0.001::e_ksea(E, s22, inc) :- e_activity(E, s22, dec).
0.001::e_ksea(E, s22, dec); 0.0293::e_ksea(E, s22, base); 0.9697::e_ksea(E, s22, inc) :- e_activity(E, s22, inc).
0.0579::e_ksea(E, s23, dec); 0.8842::e_ksea(E, s23, base); 0.0579::e_ksea(E, s23, inc) :- e_activity(E, s23, base).
0.8842::e_ksea(E, s23, dec); 0.1148::e_ksea(E, s23, base); 0.001::e_ksea(E, s23, inc) :- e_activity(E, s23, dec).
0.001::e_ksea(E, s23, dec); 0.1148::e_ksea(E, s23, base); 0.8842::e_ksea(E, s23, inc) :- e_activity(E, s23, inc).
0.2158::e_ksea(E, s24, dec); 0.5684::e_ksea(E, s24, base); 0.2158::e_ksea(E, s24, inc) :- e_activity(E, s24, base).
0.5684::e_ksea(E, s24, dec); 0.4306::e_ksea(E, s24, base); 0.001::e_ksea(E, s24, inc) :- e_activity(E, s24, dec).
0.001::e_ksea(E, s24, dec); 0.4306::e_ksea(E, s24, base); 0.5684::e_ksea(E, s24, inc) :- e_activity(E, s24, inc).
0.2049::e_ksea(E, s25, dec); 0.5902::e_ksea(E, s25, base); 0.2049::e_ksea(E, s25, inc) :- e_activity(E, s25, base).
0.5902::e_ksea(E, s25, dec); 0.4088::e_ksea(E, s25, base); 0.001::e_ksea(E, s25, inc) :- e_activity(E, s25, dec).
0.001::e_ksea(E, s25, dec); 0.4088::e_ksea(E, s25, base); 0.5902::e_ksea(E, s25, inc) :- e_activity(E, s25, inc).
0.1083::e_ksea(E, s26, dec); 0.7834::e_ksea(E, s26, base); 0.1083::e_ksea(E, s26, inc) :- e_activity(E, s26, base).
0.7834::e_ksea(E, s26, dec); 0.2156::e_ksea(E, s26, base); 0.001::e_ksea(E, s26, inc) :- e_activity(E, s26, dec).
0.001::e_ksea(E, s26, dec); 0.2156::e_ksea(E, s26, base); 0.7834::e_ksea(E, s26, inc) :- e_activity(E, s26, inc).
0.2494::e_ksea(E, s27, dec); 0.5013::e_ksea(E, s27, base); 0.2494::e_ksea(E, s27, inc) :- e_activity(E, s27, base).
0.5013::e_ksea(E, s27, dec); 0.4977::e_ksea(E, s27, base); 0.001::e_ksea(E, s27, inc) :- e_activity(E, s27, dec).
0.001::e_ksea(E, s27, dec); 0.4977::e_ksea(E, s27, base); 0.5013::e_ksea(E, s27, inc) :- e_activity(E, s27, inc).
0.199::e_ksea(E, s28, dec); 0.6021::e_ksea(E, s28, base); 0.199::e_ksea(E, s28, inc) :- e_activity(E, s28, base).
0.6021::e_ksea(E, s28, dec); 0.3969::e_ksea(E, s28, base); 0.001::e_ksea(E, s28, inc) :- e_activity(E, s28, dec).
0.001::e_ksea(E, s28, dec); 0.3969::e_ksea(E, s28, base); 0.6021::e_ksea(E, s28, inc) :- e_activity(E, s28, inc).
0.2342::e_ksea(E, s29, dec); 0.5316::e_ksea(E, s29, base); 0.2342::e_ksea(E, s29, inc) :- e_activity(E, s29, base).
0.5316::e_ksea(E, s29, dec); 0.4674::e_ksea(E, s29, base); 0.001::e_ksea(E, s29, inc) :- e_activity(E, s29, dec).
0.001::e_ksea(E, s29, dec); 0.4674::e_ksea(E, s29, base); 0.5316::e_ksea(E, s29, inc) :- e_activity(E, s29, inc).
0.0859::e_ksea(E, s3, dec); 0.8283::e_ksea(E, s3, base); 0.0859::e_ksea(E, s3, inc) :- e_activity(E, s3, base).
0.8283::e_ksea(E, s3, dec); 0.1707::e_ksea(E, s3, base); 0.001::e_ksea(E, s3, inc) :- e_activity(E, s3, dec).
0.001::e_ksea(E, s3, dec); 0.1707::e_ksea(E, s3, base); 0.8283::e_ksea(E, s3, inc) :- e_activity(E, s3, inc).
0.1379::e_ksea(E, s30, dec); 0.7242::e_ksea(E, s30, base); 0.1379::e_ksea(E, s30, inc) :- e_activity(E, s30, base).
0.7242::e_ksea(E, s30, dec); 0.2748::e_ksea(E, s30, base); 0.001::e_ksea(E, s30, inc) :- e_activity(E, s30, dec).
0.001::e_ksea(E, s30, dec); 0.2748::e_ksea(E, s30, base); 0.7242::e_ksea(E, s30, inc) :- e_activity(E, s30, inc).
0.0177::e_ksea(E, s31, dec); 0.9646::e_ksea(E, s31, base); 0.0177::e_ksea(E, s31, inc) :- e_activity(E, s31, base).
0.9646::e_ksea(E, s31, dec); 0.0344::e_ksea(E, s31, base); 0.001::e_ksea(E, s31, inc) :- e_activity(E, s31, dec).
0.001::e_ksea(E, s31, dec); 0.0344::e_ksea(E, s31, base); 0.9646::e_ksea(E, s31, inc) :- e_activity(E, s31, inc).
0.1155::e_ksea(E, s32, dec); 0.769::e_ksea(E, s32, base); 0.1155::e_ksea(E, s32, inc) :- e_activity(E, s32, base).
0.769::e_ksea(E, s32, dec); 0.23::e_ksea(E, s32, base); 0.001::e_ksea(E, s32, inc) :- e_activity(E, s32, dec).
0.001::e_ksea(E, s32, dec); 0.23::e_ksea(E, s32, base); 0.769::e_ksea(E, s32, inc) :- e_activity(E, s32, inc).
0.189::e_ksea(E, s33, dec); 0.6221::e_ksea(E, s33, base); 0.189::e_ksea(E, s33, inc) :- e_activity(E, s33, base).
0.6221::e_ksea(E, s33, dec); 0.3769::e_ksea(E, s33, base); 0.001::e_ksea(E, s33, inc) :- e_activity(E, s33, dec).
0.001::e_ksea(E, s33, dec); 0.3769::e_ksea(E, s33, base); 0.6221::e_ksea(E, s33, inc) :- e_activity(E, s33, inc).
0.0668::e_ksea(E, s34, dec); 0.8664::e_ksea(E, s34, base); 0.0668::e_ksea(E, s34, inc) :- e_activity(E, s34, base).
0.8664::e_ksea(E, s34, dec); 0.1326::e_ksea(E, s34, base); 0.001::e_ksea(E, s34, inc) :- e_activity(E, s34, dec).
0.001::e_ksea(E, s34, dec); 0.1326::e_ksea(E, s34, base); 0.8664::e_ksea(E, s34, inc) :- e_activity(E, s34, inc).
0.169::e_ksea(E, s35, dec); 0.6621::e_ksea(E, s35, base); 0.169::e_ksea(E, s35, inc) :- e_activity(E, s35, base).
0.6621::e_ksea(E, s35, dec); 0.3369::e_ksea(E, s35, base); 0.001::e_ksea(E, s35, inc) :- e_activity(E, s35, dec).
0.001::e_ksea(E, s35, dec); 0.3369::e_ksea(E, s35, base); 0.6621::e_ksea(E, s35, inc) :- e_activity(E, s35, inc).
0.0191::e_ksea(E, s36, dec); 0.9619::e_ksea(E, s36, base); 0.0191::e_ksea(E, s36, inc) :- e_activity(E, s36, base).
0.9619::e_ksea(E, s36, dec); 0.0371::e_ksea(E, s36, base); 0.001::e_ksea(E, s36, inc) :- e_activity(E, s36, dec).
0.001::e_ksea(E, s36, dec); 0.0371::e_ksea(E, s36, base); 0.9619::e_ksea(E, s36, inc) :- e_activity(E, s36, inc).
0.0991::e_ksea(E, s37, dec); 0.8018::e_ksea(E, s37, base); 0.0991::e_ksea(E, s37, inc) :- e_activity(E, s37, base).
0.8018::e_ksea(E, s37, dec); 0.1972::e_ksea(E, s37, base); 0.001::e_ksea(E, s37, inc) :- e_activity(E, s37, dec).
0.001::e_ksea(E, s37, dec); 0.1972::e_ksea(E, s37, base); 0.8018::e_ksea(E, s37, inc) :- e_activity(E, s37, inc).
0.144::e_ksea(E, s38, dec); 0.7121::e_ksea(E, s38, base); 0.144::e_ksea(E, s38, inc) :- e_activity(E, s38, base).
0.7121::e_ksea(E, s38, dec); 0.2869::e_ksea(E, s38, base); 0.001::e_ksea(E, s38, inc) :- e_activity(E, s38, dec).
0.001::e_ksea(E, s38, dec); 0.2869::e_ksea(E, s38, base); 0.7121::e_ksea(E, s38, inc) :- e_activity(E, s38, inc).
0.0841::e_ksea(E, s39, dec); 0.8318::e_ksea(E, s39, base); 0.0841::e_ksea(E, s39, inc) :- e_activity(E, s39, base).
0.8318::e_ksea(E, s39, dec); 0.1672::e_ksea(E, s39, base); 0.001::e_ksea(E, s39, inc) :- e_activity(E, s39, dec).
0.001::e_ksea(E, s39, dec); 0.1672::e_ksea(E, s39, base); 0.8318::e_ksea(E, s39, inc) :- e_activity(E, s39, inc).
0.2352::e_ksea(E, s4, dec); 0.5296::e_ksea(E, s4, base); 0.2352::e_ksea(E, s4, inc) :- e_activity(E, s4, base).
0.5296::e_ksea(E, s4, dec); 0.4694::e_ksea(E, s4, base); 0.001::e_ksea(E, s4, inc) :- e_activity(E, s4, dec).
0.001::e_ksea(E, s4, dec); 0.4694::e_ksea(E, s4, base); 0.5296::e_ksea(E, s4, inc) :- e_activity(E, s4, inc).
0.0603::e_ksea(E, s40, dec); 0.8795::e_ksea(E, s40, base); 0.0603::e_ksea(E, s40, inc) :- e_activity(E, s40, base).
0.8795::e_ksea(E, s40, dec); 0.1195::e_ksea(E, s40, base); 0.001::e_ksea(E, s40, inc) :- e_activity(E, s40, dec).
0.001::e_ksea(E, s40, dec); 0.1195::e_ksea(E, s40, base); 0.8795::e_ksea(E, s40, inc) :- e_activity(E, s40, inc).
0.1269::e_ksea(E, s41, dec); 0.7462::e_ksea(E, s41, base); 0.1269::e_ksea(E, s41, inc) :- e_activity(E, s41, base).
0.7462::e_ksea(E, s41, dec); 0.2528::e_ksea(E, s41, base); 0.001::e_ksea(E, s41, inc) :- e_activity(E, s41, dec).
0.001::e_ksea(E, s41, dec); 0.2528::e_ksea(E, s41, base); 0.7462::e_ksea(E, s41, inc) :- e_activity(E, s41, inc).
0.0524::e_ksea(E, s42, dec); 0.8953::e_ksea(E, s42, base); 0.0524::e_ksea(E, s42, inc) :- e_activity(E, s42, base).
0.8953::e_ksea(E, s42, dec); 0.1037::e_ksea(E, s42, base); 0.001::e_ksea(E, s42, inc) :- e_activity(E, s42, dec).
0.001::e_ksea(E, s42, dec); 0.1037::e_ksea(E, s42, base); 0.8953::e_ksea(E, s42, inc) :- e_activity(E, s42, inc).
0.0466::e_ksea(E, s43, dec); 0.9069::e_ksea(E, s43, base); 0.0466::e_ksea(E, s43, inc) :- e_activity(E, s43, base).
0.9069::e_ksea(E, s43, dec); 0.0921::e_ksea(E, s43, base); 0.001::e_ksea(E, s43, inc) :- e_activity(E, s43, dec).
0.001::e_ksea(E, s43, dec); 0.0921::e_ksea(E, s43, base); 0.9069::e_ksea(E, s43, inc) :- e_activity(E, s43, inc).
0.1454::e_ksea(E, s44, dec); 0.7091::e_ksea(E, s44, base); 0.1454::e_ksea(E, s44, inc) :- e_activity(E, s44, base).
0.7091::e_ksea(E, s44, dec); 0.2899::e_ksea(E, s44, base); 0.001::e_ksea(E, s44, inc) :- e_activity(E, s44, dec).
0.001::e_ksea(E, s44, dec); 0.2899::e_ksea(E, s44, base); 0.7091::e_ksea(E, s44, inc) :- e_activity(E, s44, inc).
0.0093::e_ksea(E, s45, dec); 0.9814::e_ksea(E, s45, base); 0.0093::e_ksea(E, s45, inc) :- e_activity(E, s45, base).
0.9814::e_ksea(E, s45, dec); 0.0176::e_ksea(E, s45, base); 0.001::e_ksea(E, s45, inc) :- e_activity(E, s45, dec).
0.001::e_ksea(E, s45, dec); 0.0176::e_ksea(E, s45, base); 0.9814::e_ksea(E, s45, inc) :- e_activity(E, s45, inc).
0.0579::e_ksea(E, s46, dec); 0.8842::e_ksea(E, s46, base); 0.0579::e_ksea(E, s46, inc) :- e_activity(E, s46, base).
0.8842::e_ksea(E, s46, dec); 0.1148::e_ksea(E, s46, base); 0.001::e_ksea(E, s46, inc) :- e_activity(E, s46, dec).
0.001::e_ksea(E, s46, dec); 0.1148::e_ksea(E, s46, base); 0.8842::e_ksea(E, s46, inc) :- e_activity(E, s46, inc).
0.2421::e_ksea(E, s47, dec); 0.5158::e_ksea(E, s47, base); 0.2421::e_ksea(E, s47, inc) :- e_activity(E, s47, base).
0.5158::e_ksea(E, s47, dec); 0.4832::e_ksea(E, s47, base); 0.001::e_ksea(E, s47, inc) :- e_activity(E, s47, dec).
0.001::e_ksea(E, s47, dec); 0.4832::e_ksea(E, s47, base); 0.5158::e_ksea(E, s47, inc) :- e_activity(E, s47, inc).
0.032::e_ksea(E, s48, dec); 0.936::e_ksea(E, s48, base); 0.032::e_ksea(E, s48, inc) :- e_activity(E, s48, base).
0.936::e_ksea(E, s48, dec); 0.063::e_ksea(E, s48, base); 0.001::e_ksea(E, s48, inc) :- e_activity(E, s48, dec).
0.001::e_ksea(E, s48, dec); 0.063::e_ksea(E, s48, base); 0.936::e_ksea(E, s48, inc) :- e_activity(E, s48, inc).
0.2277::e_ksea(E, s49, dec); 0.5446::e_ksea(E, s49, base); 0.2277::e_ksea(E, s49, inc) :- e_activity(E, s49, base).
0.5446::e_ksea(E, s49, dec); 0.4544::e_ksea(E, s49, base); 0.001::e_ksea(E, s49, inc) :- e_activity(E, s49, dec).
0.001::e_ksea(E, s49, dec); 0.4544::e_ksea(E, s49, base); 0.5446::e_ksea(E, s49, inc) :- e_activity(E, s49, inc).
0.1582::e_ksea(E, s5, dec); 0.6836::e_ksea(E, s5, base); 0.1582::e_ksea(E, s5, inc) :- e_activity(E, s5, base).
0.6836::e_ksea(E, s5, dec); 0.3154::e_ksea(E, s5, base); 0.001::e_ksea(E, s5, inc) :- e_activity(E, s5, dec).
0.001::e_ksea(E, s5, dec); 0.3154::e_ksea(E, s5, base); 0.6836::e_ksea(E, s5, inc) :- e_activity(E, s5, inc).
0.1614::e_ksea(E, s50, dec); 0.6772::e_ksea(E, s50, base); 0.1614::e_ksea(E, s50, inc) :- e_activity(E, s50, base).
0.6772::e_ksea(E, s50, dec); 0.3218::e_ksea(E, s50, base); 0.001::e_ksea(E, s50, inc) :- e_activity(E, s50, dec).
0.001::e_ksea(E, s50, dec); 0.3218::e_ksea(E, s50, base); 0.6772::e_ksea(E, s50, inc) :- e_activity(E, s50, inc).
0.0184::e_ksea(E, s51, dec); 0.9631::e_ksea(E, s51, base); 0.0184::e_ksea(E, s51, inc) :- e_activity(E, s51, base).
0.9631::e_ksea(E, s51, dec); 0.0359::e_ksea(E, s51, base); 0.001::e_ksea(E, s51, inc) :- e_activity(E, s51, dec).
0.001::e_ksea(E, s51, dec); 0.0359::e_ksea(E, s51, base); 0.9631::e_ksea(E, s51, inc) :- e_activity(E, s51, inc).
0.2462::e_ksea(E, s52, dec); 0.5077::e_ksea(E, s52, base); 0.2462::e_ksea(E, s52, inc) :- e_activity(E, s52, base).
0.5077::e_ksea(E, s52, dec); 0.4913::e_ksea(E, s52, base); 0.001::e_ksea(E, s52, inc) :- e_activity(E, s52, dec).
0.001::e_ksea(E, s52, dec); 0.4913::e_ksea(E, s52, base); 0.5077::e_ksea(E, s52, inc) :- e_activity(E, s52, inc).
0.0302::e_ksea(E, s53, dec); 0.9396::e_ksea(E, s53, base); 0.0302::e_ksea(E, s53, inc) :- e_activity(E, s53, base).
0.9396::e_ksea(E, s53, dec); 0.0594::e_ksea(E, s53, base); 0.001::e_ksea(E, s53, inc) :- e_activity(E, s53, dec).
0.001::e_ksea(E, s53, dec); 0.0594::e_ksea(E, s53, base); 0.9396::e_ksea(E, s53, inc) :- e_activity(E, s53, inc).
0.1457::e_ksea(E, s54, dec); 0.7086::e_ksea(E, s54, base); 0.1457::e_ksea(E, s54, inc) :- e_activity(E, s54, base).
0.7086::e_ksea(E, s54, dec); 0.2904::e_ksea(E, s54, base); 0.001::e_ksea(E, s54, inc) :- e_activity(E, s54, dec).
0.001::e_ksea(E, s54, dec); 0.2904::e_ksea(E, s54, base); 0.7086::e_ksea(E, s54, inc) :- e_activity(E, s54, inc).
0.1971::e_ksea(E, s55, dec); 0.6058::e_ksea(E, s55, base); 0.1971::e_ksea(E, s55, inc) :- e_activity(E, s55, base).
0.6058::e_ksea(E, s55, dec); 0.3932::e_ksea(E, s55, base); 0.001::e_ksea(E, s55, inc) :- e_activity(E, s55, dec).
0.001::e_ksea(E, s55, dec); 0.3932::e_ksea(E, s55, base); 0.6058::e_ksea(E, s55, inc) :- e_activity(E, s55, inc).
0.1028::e_ksea(E, s56, dec); 0.7944::e_ksea(E, s56, base); 0.1028::e_ksea(E, s56, inc) :- e_activity(E, s56, base).
0.7944::e_ksea(E, s56, dec); 0.2046::e_ksea(E, s56, base); 0.001::e_ksea(E, s56, inc) :- e_activity(E, s56, dec).
0.001::e_ksea(E, s56, dec); 0.2046::e_ksea(E, s56, base); 0.7944::e_ksea(E, s56, inc) :- e_activity(E, s56, inc).
0.0681::e_ksea(E, s57, dec); 0.8638::e_ksea(E, s57, base); 0.0681::e_ksea(E, s57, inc) :- e_activity(E, s57, base).
0.8638::e_ksea(E, s57, dec); 0.1352::e_ksea(E, s57, base); 0.001::e_ksea(E, s57, inc) :- e_activity(E, s57, dec).
0.001::e_ksea(E, s57, dec); 0.1352::e_ksea(E, s57, base); 0.8638::e_ksea(E, s57, inc) :- e_activity(E, s57, inc).
0.1549::e_ksea(E, s58, dec); 0.6903::e_ksea(E, s58, base); 0.1549::e_ksea(E, s58, inc) :- e_activity(E, s58, base).
0.6903::e_ksea(E, s58, dec); 0.3087::e_ksea(E, s58, base); 0.001::e_ksea(E, s58, inc) :- e_activity(E, s58, dec).
0.001::e_ksea(E, s58, dec); 0.3087::e_ksea(E, s58, base); 0.6903::e_ksea(E, s58, inc) :- e_activity(E, s58, inc).
0.1333::e_ksea(E, s59, dec); 0.7334::e_ksea(E, s59, base); 0.1333::e_ksea(E, s59, inc) :- e_activity(E, s59, base).
0.7334::e_ksea(E, s59, dec); 0.2656::e_ksea(E, s59, base); 0.001::e_ksea(E, s59, inc) :- e_activity(E, s59, dec).
0.001::e_ksea(E, s59, dec); 0.2656::e_ksea(E, s59, base); 0.7334::e_ksea(E, s59, inc) :- e_activity(E, s59, inc).
0.0741::e_ksea(E, s6, dec); 0.8518::e_ksea(E, s6, base); 0.0741::e_ksea(E, s6, inc) :- e_activity(E, s6, base).
0.8518::e_ksea(E, s6, dec); 0.1472::e_ksea(E, s6, base); 0.001::e_ksea(E, s6, inc) :- e_activity(E, s6, dec).
0.001::e_ksea(E, s6, dec); 0.1472::e_ksea(E, s6, base); 0.8518::e_ksea(E, s6, inc) :- e_activity(E, s6, inc).
0.1189::e_ksea(E, s60, dec); 0.7622::e_ksea(E, s60, base); 0.1189::e_ksea(E, s60, inc) :- e_activity(E, s60, base).
0.7622::e_ksea(E, s60, dec); 0.2368::e_ksea(E, s60, base); 0.001::e_ksea(E, s60, inc) :- e_activity(E, s60, dec).
0.001::e_ksea(E, s60, dec); 0.2368::e_ksea(E, s60, base); 0.7622::e_ksea(E, s60, inc) :- e_activity(E, s60, inc).
0.0787::e_ksea(E, s61, dec); 0.8426::e_ksea(E, s61, base); 0.0787::e_ksea(E, s61, inc) :- e_activity(E, s61, base).
0.8426::e_ksea(E, s61, dec); 0.1564::e_ksea(E, s61, base); 0.001::e_ksea(E, s61, inc) :- e_activity(E, s61, dec).
0.001::e_ksea(E, s61, dec); 0.1564::e_ksea(E, s61, base); 0.8426::e_ksea(E, s61, inc) :- e_activity(E, s61, inc).
0.2082::e_ksea(E, s62, dec); 0.5836::e_ksea(E, s62, base); 0.2082::e_ksea(E, s62, inc) :- e_activity(E, s62, base).
0.5836::e_ksea(E, s62, dec); 0.4154::e_ksea(E, s62, base); 0.001::e_ksea(E, s62, inc) :- e_activity(E, s62, dec).
0.001::e_ksea(E, s62, dec); 0.4154::e_ksea(E, s62, base); 0.5836::e_ksea(E, s62, inc) :- e_activity(E, s62, inc).
0.2398::e_ksea(E, s63, dec); 0.5204::e_ksea(E, s63, base); 0.2398::e_ksea(E, s63, inc) :- e_activity(E, s63, base).
0.5204::e_ksea(E, s63, dec); 0.4786::e_ksea(E, s63, base); 0.001::e_ksea(E, s63, inc) :- e_activity(E, s63, dec).
0.001::e_ksea(E, s63, dec); 0.4786::e_ksea(E, s63, base); 0.5204::e_ksea(E, s63, inc) :- e_activity(E, s63, inc).
0.0739::e_ksea(E, s64, dec); 0.8523::e_ksea(E, s64, base); 0.0739::e_ksea(E, s64, inc) :- e_activity(E, s64, base).
0.8523::e_ksea(E, s64, dec); 0.1467::e_ksea(E, s64, base); 0.001::e_ksea(E, s64, inc) :- e_activity(E, s64, dec).
0.001::e_ksea(E, s64, dec); 0.1467::e_ksea(E, s64, base); 0.8523::e_ksea(E, s64, inc) :- e_activity(E, s64, inc).
0.1307::e_ksea(E, s65, dec); 0.7386::e_ksea(E, s65, base); 0.1307::e_ksea(E, s65, inc) :- e_activity(E, s65, base).
0.7386::e_ksea(E, s65, dec); 0.2604::e_ksea(E, s65, base); 0.001::e_ksea(E, s65, inc) :- e_activity(E, s65, dec).
0.001::e_ksea(E, s65, dec); 0.2604::e_ksea(E, s65, base); 0.7386::e_ksea(E, s65, inc) :- e_activity(E, s65, inc).
0.0907::e_ksea(E, s66, dec); 0.8186::e_ksea(E, s66, base); 0.0907::e_ksea(E, s66, inc) :- e_activity(E, s66, base).
0.8186::e_ksea(E, s66, dec); 0.1804::e_ksea(E, s66, base); 0.001::e_ksea(E, s66, inc) :- e_activity(E, s66, dec).
0.001::e_ksea(E, s66, dec); 0.1804::e_ksea(E, s66, base); 0.8186::e_ksea(E, s66, inc) :- e_activity(E, s66, inc).
0.0873::e_ksea(E, s67, dec); 0.8254::e_ksea(E, s67, base); 0.0873::e_ksea(E, s67, inc) :- e_activity(E, s67, base).
0.8254::e_ksea(E, s67, dec); 0.1736::e_ksea(E, s67, base); 0.001::e_ksea(E, s67, inc) :- e_activity(E, s67, dec).
0.001::e_ksea(E, s67, dec); 0.1736::e_ksea(E, s67, base); 0.8254::e_ksea(E, s67, inc) :- e_activity(E, s67, inc).
0.0545::e_ksea(E, s68, dec); 0.8911::e_ksea(E, s68, base); 0.0545::e_ksea(E, s68, inc) :- e_activity(E, s68, base).
0.8911::e_ksea(E, s68, dec); 0.1079::e_ksea(E, s68, base); 0.001::e_ksea(E, s68, inc) :- e_activity(E, s68, dec).
0.001::e_ksea(E, s68, dec); 0.1079::e_ksea(E, s68, base); 0.8911::e_ksea(E, s68, inc) :- e_activity(E, s68, inc).
0.2402::e_ksea(E, s69, dec); 0.5196::e_ksea(E, s69, base); 0.2402::e_ksea(E, s69, inc) :- e_activity(E, s69, base).
0.5196::e_ksea(E, s69, dec); 0.4794::e_ksea(E, s69, base); 0.001::e_ksea(E, s69, inc) :- e_activity(E, s69, dec).
0.001::e_ksea(E, s69, dec); 0.4794::e_ksea(E, s69, base); 0.5196::e_ksea(E, s69, inc) :- e_activity(E, s69, inc).
0.0453::e_ksea(E, s7, dec); 0.9093::e_ksea(E, s7, base); 0.0453::e_ksea(E, s7, inc) :- e_activity(E, s7, base).
0.9093::e_ksea(E, s7, dec); 0.0897::e_ksea(E, s7, base); 0.001::e_ksea(E, s7, inc) :- e_activity(E, s7, dec).
0.001::e_ksea(E, s7, dec); 0.0897::e_ksea(E, s7, base); 0.9093::e_ksea(E, s7, inc) :- e_activity(E, s7, inc).
0.0031::e_ksea(E, s70, dec); 0.9939::e_ksea(E, s70, base); 0.0031::e_ksea(E, s70, inc) :- e_activity(E, s70, base).
0.9939::e_ksea(E, s70, dec); 0.0051::e_ksea(E, s70, base); 0.001::e_ksea(E, s70, inc) :- e_activity(E, s70, dec).
0.001::e_ksea(E, s70, dec); 0.0051::e_ksea(E, s70, base); 0.9939::e_ksea(E, s70, inc) :- e_activity(E, s70, inc).
0.016::e_ksea(E, s71, dec); 0.968::e_ksea(E, s71, base); 0.016::e_ksea(E, s71, inc) :- e_activity(E, s71, base).
0.968::e_ksea(E, s71, dec); 0.031::e_ksea(E, s71, base); 0.001::e_ksea(E, s71, inc) :- e_activity(E, s71, dec).
0.001::e_ksea(E, s71, dec); 0.031::e_ksea(E, s71, base); 0.968::e_ksea(E, s71, inc) :- e_activity(E, s71, inc).
0.0344::e_ksea(E, s72, dec); 0.9312::e_ksea(E, s72, base); 0.0344::e_ksea(E, s72, inc) :- e_activity(E, s72, base).
0.9312::e_ksea(E, s72, dec); 0.0678::e_ksea(E, s72, base); 0.001::e_ksea(E, s72, inc) :- e_activity(E, s72, dec).
0.001::e_ksea(E, s72, dec); 0.0678::e_ksea(E, s72, base); 0.9312::e_ksea(E, s72, inc) :- e_activity(E, s72, inc).
0.034::e_ksea(E, s73, dec); 0.9321::e_ksea(E, s73, base); 0.034::e_ksea(E, s73, inc) :- e_activity(E, s73, base).
0.9321::e_ksea(E, s73, dec); 0.0669::e_ksea(E, s73, base); 0.001::e_ksea(E, s73, inc) :- e_activity(E, s73, dec).
0.001::e_ksea(E, s73, dec); 0.0669::e_ksea(E, s73, base); 0.9321::e_ksea(E, s73, inc) :- e_activity(E, s73, inc).
0.2326::e_ksea(E, s74, dec); 0.5348::e_ksea(E, s74, base); 0.2326::e_ksea(E, s74, inc) :- e_activity(E, s74, base).
0.5348::e_ksea(E, s74, dec); 0.4642::e_ksea(E, s74, base); 0.001::e_ksea(E, s74, inc) :- e_activity(E, s74, dec).
0.001::e_ksea(E, s74, dec); 0.4642::e_ksea(E, s74, base); 0.5348::e_ksea(E, s74, inc) :- e_activity(E, s74, inc).
0.0448::e_ksea(E, s75, dec); 0.9103::e_ksea(E, s75, base); 0.0448::e_ksea(E, s75, inc) :- e_activity(E, s75, base).
0.9103::e_ksea(E, s75, dec); 0.0887::e_ksea(E, s75, base); 0.001::e_ksea(E, s75, inc) :- e_activity(E, s75, dec).
0.001::e_ksea(E, s75, dec); 0.0887::e_ksea(E, s75, base); 0.9103::e_ksea(E, s75, inc) :- e_activity(E, s75, inc).
0.071::e_ksea(E, s76, dec); 0.8581::e_ksea(E, s76, base); 0.071::e_ksea(E, s76, inc) :- e_activity(E, s76, base).
0.8581::e_ksea(E, s76, dec); 0.1409::e_ksea(E, s76, base); 0.001::e_ksea(E, s76, inc) :- e_activity(E, s76, dec).
0.001::e_ksea(E, s76, dec); 0.1409::e_ksea(E, s76, base); 0.8581::e_ksea(E, s76, inc) :- e_activity(E, s76, inc).
0.1289::e_ksea(E, s77, dec); 0.7423::e_ksea(E, s77, base); 0.1289::e_ksea(E, s77, inc) :- e_activity(E, s77, base).
0.7423::e_ksea(E, s77, dec); 0.2567::e_ksea(E, s77, base); 0.001::e_ksea(E, s77, inc) :- e_activity(E, s77, dec).
0.001::e_ksea(E, s77, dec); 0.2567::e_ksea(E, s77, base); 0.7423::e_ksea(E, s77, inc) :- e_activity(E, s77, inc).
0.0781::e_ksea(E, s78, dec); 0.8439::e_ksea(E, s78, base); 0.0781::e_ksea(E, s78, inc) :- e_activity(E, s78, base).
0.8439::e_ksea(E, s78, dec); 0.1551::e_ksea(E, s78, base); 0.001::e_ksea(E, s78, inc) :- e_activity(E, s78, dec).
0.001::e_ksea(E, s78, dec); 0.1551::e_ksea(E, s78, base); 0.8439::e_ksea(E, s78, inc) :- e_activity(E, s78, inc).
0.2363::e_ksea(E, s79, dec); 0.5274::e_ksea(E, s79, base); 0.2363::e_ksea(E, s79, inc) :- e_activity(E, s79, base).
0.5274::e_ksea(E, s79, dec); 0.4716::e_ksea(E, s79, base); 0.001::e_ksea(E, s79, inc) :- e_activity(E, s79, dec).
0.001::e_ksea(E, s79, dec); 0.4716::e_ksea(E, s79, base); 0.5274::e_ksea(E, s79, inc) :- e_activity(E, s79, inc).
0.1768::e_ksea(E, s8, dec); 0.6463::e_ksea(E, s8, base); 0.1768::e_ksea(E, s8, inc) :- e_activity(E, s8, base).
0.6463::e_ksea(E, s8, dec); 0.3527::e_ksea(E, s8, base); 0.001::e_ksea(E, s8, inc) :- e_activity(E, s8, dec).
0.001::e_ksea(E, s8, dec); 0.3527::e_ksea(E, s8, base); 0.6463::e_ksea(E, s8, inc) :- e_activity(E, s8, inc).
0.0496::e_ksea(E, s80, dec); 0.9008::e_ksea(E, s80, base); 0.0496::e_ksea(E, s80, inc) :- e_activity(E, s80, base).
0.9008::e_ksea(E, s80, dec); 0.0982::e_ksea(E, s80, base); 0.001::e_ksea(E, s80, inc) :- e_activity(E, s80, dec).
0.001::e_ksea(E, s80, dec); 0.0982::e_ksea(E, s80, base); 0.9008::e_ksea(E, s80, inc) :- e_activity(E, s80, inc).
0.061::e_ksea(E, s81, dec); 0.878::e_ksea(E, s81, base); 0.061::e_ksea(E, s81, inc) :- e_activity(E, s81, base).
0.878::e_ksea(E, s81, dec); 0.121::e_ksea(E, s81, base); 0.001::e_ksea(E, s81, inc) :- e_activity(E, s81, dec).
0.001::e_ksea(E, s81, dec); 0.121::e_ksea(E, s81, base); 0.878::e_ksea(E, s81, inc) :- e_activity(E, s81, inc).
0.203::e_ksea(E, s82, dec); 0.594::e_ksea(E, s82, base); 0.203::e_ksea(E, s82, inc) :- e_activity(E, s82, base).
0.594::e_ksea(E, s82, dec); 0.405::e_ksea(E, s82, base); 0.001::e_ksea(E, s82, inc) :- e_activity(E, s82, dec).
0.001::e_ksea(E, s82, dec); 0.405::e_ksea(E, s82, base); 0.594::e_ksea(E, s82, inc) :- e_activity(E, s82, inc).
0.1358::e_ksea(E, s83, dec); 0.7284::e_ksea(E, s83, base); 0.1358::e_ksea(E, s83, inc) :- e_activity(E, s83, base).
0.7284::e_ksea(E, s83, dec); 0.2706::e_ksea(E, s83, base); 0.001::e_ksea(E, s83, inc) :- e_activity(E, s83, dec).
0.001::e_ksea(E, s83, dec); 0.2706::e_ksea(E, s83, base); 0.7284::e_ksea(E, s83, inc) :- e_activity(E, s83, inc).
0.0129::e_ksea(E, s84, dec); 0.9743::e_ksea(E, s84, base); 0.0129::e_ksea(E, s84, inc) :- e_activity(E, s84, base).
0.9743::e_ksea(E, s84, dec); 0.0247::e_ksea(E, s84, base); 0.001::e_ksea(E, s84, inc) :- e_activity(E, s84, dec).
0.001::e_ksea(E, s84, dec); 0.0247::e_ksea(E, s84, base); 0.9743::e_ksea(E, s84, inc) :- e_activity(E, s84, inc).
0.1181::e_ksea(E, s85, dec); 0.7637::e_ksea(E, s85, base); 0.1181::e_ksea(E, s85, inc) :- e_activity(E, s85, base).
0.7637::e_ksea(E, s85, dec); 0.2353::e_ksea(E, s85, base); 0.001::e_ksea(E, s85, inc) :- e_activity(E, s85, dec).
0.001::e_ksea(E, s85, dec); 0.2353::e_ksea(E, s85, base); 0.7637::e_ksea(E, s85, inc) :- e_activity(E, s85, inc).
0.0858::e_ksea(E, s86, dec); 0.8283::e_ksea(E, s86, base); 0.0858::e_ksea(E, s86, inc) :- e_activity(E, s86, base).
0.8283::e_ksea(E, s86, dec); 0.1707::e_ksea(E, s86, base); 0.001::e_ksea(E, s86, inc) :- e_activity(E, s86, dec).
0.001::e_ksea(E, s86, dec); 0.1707::e_ksea(E, s86, base); 0.8283::e_ksea(E, s86, inc) :- e_activity(E, s86, inc).
0.1976::e_ksea(E, s87, dec); 0.6049::e_ksea(E, s87, base); 0.1976::e_ksea(E, s87, inc) :- e_activity(E, s87, base).
0.6049::e_ksea(E, s87, dec); 0.3941::e_ksea(E, s87, base); 0.001::e_ksea(E, s87, inc) :- e_activity(E, s87, dec).
0.001::e_ksea(E, s87, dec); 0.3941::e_ksea(E, s87, base); 0.6049::e_ksea(E, s87, inc) :- e_activity(E, s87, inc).
0.055::e_ksea(E, s88, dec); 0.89::e_ksea(E, s88, base); 0.055::e_ksea(E, s88, inc) :- e_activity(E, s88, base).
0.89::e_ksea(E, s88, dec); 0.109::e_ksea(E, s88, base); 0.001::e_ksea(E, s88, inc) :- e_activity(E, s88, dec).
0.001::e_ksea(E, s88, dec); 0.109::e_ksea(E, s88, base); 0.89::e_ksea(E, s88, inc) :- e_activity(E, s88, inc).
0.0221::e_ksea(E, s89, dec); 0.9558::e_ksea(E, s89, base); 0.0221::e_ksea(E, s89, inc) :- e_activity(E, s89, base).
0.9558::e_ksea(E, s89, dec); 0.0432::e_ksea(E, s89, base); 0.001::e_ksea(E, s89, inc) :- e_activity(E, s89, dec).
0.001::e_ksea(E, s89, dec); 0.0432::e_ksea(E, s89, base); 0.9558::e_ksea(E, s89, inc) :- e_activity(E, s89, inc).
0.1023::e_ksea(E, s9, dec); 0.7955::e_ksea(E, s9, base); 0.1023::e_ksea(E, s9, inc) :- e_activity(E, s9, base).
0.7955::e_ksea(E, s9, dec); 0.2035::e_ksea(E, s9, base); 0.001::e_ksea(E, s9, inc) :- e_activity(E, s9, dec).
0.001::e_ksea(E, s9, dec); 0.2035::e_ksea(E, s9, base); 0.7955::e_ksea(E, s9, inc) :- e_activity(E, s9, inc).
0.1522::e_ksea(E, s90, dec); 0.6955::e_ksea(E, s90, base); 0.1522::e_ksea(E, s90, inc) :- e_activity(E, s90, base).
0.6955::e_ksea(E, s90, dec); 0.3035::e_ksea(E, s90, base); 0.001::e_ksea(E, s90, inc) :- e_activity(E, s90, dec).
0.001::e_ksea(E, s90, dec); 0.3035::e_ksea(E, s90, base); 0.6955::e_ksea(E, s90, inc) :- e_activity(E, s90, inc).
0.125::e_ksea(E, s91, dec); 0.7501::e_ksea(E, s91, base); 0.125::e_ksea(E, s91, inc) :- e_activity(E, s91, base).
0.7501::e_ksea(E, s91, dec); 0.2489::e_ksea(E, s91, base); 0.001::e_ksea(E, s91, inc) :- e_activity(E, s91, dec).
0.001::e_ksea(E, s91, dec); 0.2489::e_ksea(E, s91, base); 0.7501::e_ksea(E, s91, inc) :- e_activity(E, s91, inc).
0.1921::e_ksea(E, s92, dec); 0.6157::e_ksea(E, s92, base); 0.1921::e_ksea(E, s92, inc) :- e_activity(E, s92, base).
0.6157::e_ksea(E, s92, dec); 0.3833::e_ksea(E, s92, base); 0.001::e_ksea(E, s92, inc) :- e_activity(E, s92, dec).
0.001::e_ksea(E, s92, dec); 0.3833::e_ksea(E, s92, base); 0.6157::e_ksea(E, s92, inc) :- e_activity(E, s92, inc).
0.0055::e_ksea(E, s93, dec); 0.9889::e_ksea(E, s93, base); 0.0055::e_ksea(E, s93, inc) :- e_activity(E, s93, base).
0.9889::e_ksea(E, s93, dec); 0.0101::e_ksea(E, s93, base); 0.001::e_ksea(E, s93, inc) :- e_activity(E, s93, dec).
0.001::e_ksea(E, s93, dec); 0.0101::e_ksea(E, s93, base); 0.9889::e_ksea(E, s93, inc) :- e_activity(E, s93, inc).
0.0607::e_ksea(E, s94, dec); 0.8785::e_ksea(E, s94, base); 0.0607::e_ksea(E, s94, inc) :- e_activity(E, s94, base).
0.8785::e_ksea(E, s94, dec); 0.1205::e_ksea(E, s94, base); 0.001::e_ksea(E, s94, inc) :- e_activity(E, s94, dec).
0.001::e_ksea(E, s94, dec); 0.1205::e_ksea(E, s94, base); 0.8785::e_ksea(E, s94, inc) :- e_activity(E, s94, inc).
0.0414::e_ksea(E, s95, dec); 0.9172::e_ksea(E, s95, base); 0.0414::e_ksea(E, s95, inc) :- e_activity(E, s95, base).
0.9172::e_ksea(E, s95, dec); 0.0818::e_ksea(E, s95, base); 0.001::e_ksea(E, s95, inc) :- e_activity(E, s95, dec).
0.001::e_ksea(E, s95, dec); 0.0818::e_ksea(E, s95, base); 0.9172::e_ksea(E, s95, inc) :- e_activity(E, s95, inc).
0.085::e_ksea(E, s96, dec); 0.8301::e_ksea(E, s96, base); 0.085::e_ksea(E, s96, inc) :- e_activity(E, s96, base).
0.8301::e_ksea(E, s96, dec); 0.1689::e_ksea(E, s96, base); 0.001::e_ksea(E, s96, inc) :- e_activity(E, s96, dec).
0.001::e_ksea(E, s96, dec); 0.1689::e_ksea(E, s96, base); 0.8301::e_ksea(E, s96, inc) :- e_activity(E, s96, inc).
0.2067::e_ksea(E, s97, dec); 0.5867::e_ksea(E, s97, base); 0.2067::e_ksea(E, s97, inc) :- e_activity(E, s97, base).
0.5867::e_ksea(E, s97, dec); 0.4123::e_ksea(E, s97, base); 0.001::e_ksea(E, s97, inc) :- e_activity(E, s97, dec).
0.001::e_ksea(E, s97, dec); 0.4123::e_ksea(E, s97, base); 0.5867::e_ksea(E, s97, inc) :- e_activity(E, s97, inc).
0.0736::e_ksea(E, s98, dec); 0.8529::e_ksea(E, s98, base); 0.0736::e_ksea(E, s98, inc) :- e_activity(E, s98, base).
0.8529::e_ksea(E, s98, dec); 0.1461::e_ksea(E, s98, base); 0.001::e_ksea(E, s98, inc) :- e_activity(E, s98, dec).
0.001::e_ksea(E, s98, dec); 0.1461::e_ksea(E, s98, base); 0.8529::e_ksea(E, s98, inc) :- e_activity(E, s98, inc).
0.1024::e_ksea(E, s99, dec); 0.7952::e_ksea(E, s99, base); 0.1024::e_ksea(E, s99, inc) :- e_activity(E, s99, base).
0.7952::e_ksea(E, s99, dec); 0.2038::e_ksea(E, s99, base); 0.001::e_ksea(E, s99, inc) :- e_activity(E, s99, dec).
0.001::e_ksea(E, s99, dec); 0.2038::e_ksea(E, s99, base); 0.7952::e_ksea(E, s99, inc) :- e_activity(E, s99, inc).
%% p1::p_fc(P, S, dec); p2::p_fc(P, S, base); p3::p_fc(P, S, inc) :- p_occupancy(P, S, _dO). % value = _fc = [dec | base | inc] (cpd, P/S-level)
0.1245::p_fc(P, s1, dec); 0.7511::p_fc(P, s1, base); 0.1245::p_fc(P, s1, inc) :- p_occupancy(P, s1, base).
0.7511::p_fc(P, s1, dec); 0.2479::p_fc(P, s1, base); 0.001::p_fc(P, s1, inc) :- p_occupancy(P, s1, dec).
0.001::p_fc(P, s1, dec); 0.2479::p_fc(P, s1, base); 0.7511::p_fc(P, s1, inc) :- p_occupancy(P, s1, inc).
0.0577::p_fc(P, s10, dec); 0.8847::p_fc(P, s10, base); 0.0577::p_fc(P, s10, inc) :- p_occupancy(P, s10, base).
0.8847::p_fc(P, s10, dec); 0.1143::p_fc(P, s10, base); 0.001::p_fc(P, s10, inc) :- p_occupancy(P, s10, dec).
0.001::p_fc(P, s10, dec); 0.1143::p_fc(P, s10, base); 0.8847::p_fc(P, s10, inc) :- p_occupancy(P, s10, inc).
0.0573::p_fc(P, s100, dec); 0.8854::p_fc(P, s100, base); 0.0573::p_fc(P, s100, inc) :- p_occupancy(P, s100, base).
0.8854::p_fc(P, s100, dec); 0.1136::p_fc(P, s100, base); 0.001::p_fc(P, s100, inc) :- p_occupancy(P, s100, dec).
0.001::p_fc(P, s100, dec); 0.1136::p_fc(P, s100, base); 0.8854::p_fc(P, s100, inc) :- p_occupancy(P, s100, inc).
0.1463::p_fc(P, s11, dec); 0.7074::p_fc(P, s11, base); 0.1463::p_fc(P, s11, inc) :- p_occupancy(P, s11, base).
0.7074::p_fc(P, s11, dec); 0.2916::p_fc(P, s11, base); 0.001::p_fc(P, s11, inc) :- p_occupancy(P, s11, dec).
0.001::p_fc(P, s11, dec); 0.2916::p_fc(P, s11, base); 0.7074::p_fc(P, s11, inc) :- p_occupancy(P, s11, inc).
0.0741::p_fc(P, s12, dec); 0.8518::p_fc(P, s12, base); 0.0741::p_fc(P, s12, inc) :- p_occupancy(P, s12, base).
0.8518::p_fc(P, s12, dec); 0.1472::p_fc(P, s12, base); 0.001::p_fc(P, s12, inc) :- p_occupancy(P, s12, dec).
0.001::p_fc(P, s12, dec); 0.1472::p_fc(P, s12, base); 0.8518::p_fc(P, s12, inc) :- p_occupancy(P, s12, inc).
0.2483::p_fc(P, s13, dec); 0.5034::p_fc(P, s13, base); 0.2483::p_fc(P, s13, inc) :- p_occupancy(P, s13, base).
0.5034::p_fc(P, s13, dec); 0.4956::p_fc(P, s13, base); 0.001::p_fc(P, s13, inc) :- p_occupancy(P, s13, dec).
0.001::p_fc(P, s13, dec); 0.4956::p_fc(P, s13, base); 0.5034::p_fc(P, s13, inc) :- p_occupancy(P, s13, inc).
0.0546::p_fc(P, s14, dec); 0.8909::p_fc(P, s14, base); 0.0546::p_fc(P, s14, inc) :- p_occupancy(P, s14, base).
0.8909::p_fc(P, s14, dec); 0.1081::p_fc(P, s14, base); 0.001::p_fc(P, s14, inc) :- p_occupancy(P, s14, dec).
0.001::p_fc(P, s14, dec); 0.1081::p_fc(P, s14, base); 0.8909::p_fc(P, s14, inc) :- p_occupancy(P, s14, inc).
0.0701::p_fc(P, s15, dec); 0.8598::p_fc(P, s15, base); 0.0701::p_fc(P, s15, inc) :- p_occupancy(P, s15, base).
0.8598::p_fc(P, s15, dec); 0.1392::p_fc(P, s15, base); 0.001::p_fc(P, s15, inc) :- p_occupancy(P, s15, dec).
0.001::p_fc(P, s15, dec); 0.1392::p_fc(P, s15, base); 0.8598::p_fc(P, s15, inc) :- p_occupancy(P, s15, inc).
0.2178::p_fc(P, s16, dec); 0.5644::p_fc(P, s16, base); 0.2178::p_fc(P, s16, inc) :- p_occupancy(P, s16, base).
0.5644::p_fc(P, s16, dec); 0.4346::p_fc(P, s16, base); 0.001::p_fc(P, s16, inc) :- p_occupancy(P, s16, dec).
0.001::p_fc(P, s16, dec); 0.4346::p_fc(P, s16, base); 0.5644::p_fc(P, s16, inc) :- p_occupancy(P, s16, inc).
0.2024::p_fc(P, s17, dec); 0.5953::p_fc(P, s17, base); 0.2024::p_fc(P, s17, inc) :- p_occupancy(P, s17, base).
0.5953::p_fc(P, s17, dec); 0.4037::p_fc(P, s17, base); 0.001::p_fc(P, s17, inc) :- p_occupancy(P, s17, dec).
0.001::p_fc(P, s17, dec); 0.4037::p_fc(P, s17, base); 0.5953::p_fc(P, s17, inc) :- p_occupancy(P, s17, inc).
0.0898::p_fc(P, s18, dec); 0.8205::p_fc(P, s18, base); 0.0898::p_fc(P, s18, inc) :- p_occupancy(P, s18, base).
0.8205::p_fc(P, s18, dec); 0.1785::p_fc(P, s18, base); 0.001::p_fc(P, s18, inc) :- p_occupancy(P, s18, dec).
0.001::p_fc(P, s18, dec); 0.1785::p_fc(P, s18, base); 0.8205::p_fc(P, s18, inc) :- p_occupancy(P, s18, inc).
0.1797::p_fc(P, s19, dec); 0.6406::p_fc(P, s19, base); 0.1797::p_fc(P, s19, inc) :- p_occupancy(P, s19, base).
0.6406::p_fc(P, s19, dec); 0.3584::p_fc(P, s19, base); 0.001::p_fc(P, s19, inc) :- p_occupancy(P, s19, dec).
0.001::p_fc(P, s19, dec); 0.3584::p_fc(P, s19, base); 0.6406::p_fc(P, s19, inc) :- p_occupancy(P, s19, inc).
0.1967::p_fc(P, s2, dec); 0.6066::p_fc(P, s2, base); 0.1967::p_fc(P, s2, inc) :- p_occupancy(P, s2, base).
0.6066::p_fc(P, s2, dec); 0.3924::p_fc(P, s2, base); 0.001::p_fc(P, s2, inc) :- p_occupancy(P, s2, dec).
0.001::p_fc(P, s2, dec); 0.3924::p_fc(P, s2, base); 0.6066::p_fc(P, s2, inc) :- p_occupancy(P, s2, inc).
0.0219::p_fc(P, s20, dec); 0.9562::p_fc(P, s20, base); 0.0219::p_fc(P, s20, inc) :- p_occupancy(P, s20, base).
0.9562::p_fc(P, s20, dec); 0.0428::p_fc(P, s20, base); 0.001::p_fc(P, s20, inc) :- p_occupancy(P, s20, dec).
0.001::p_fc(P, s20, dec); 0.0428::p_fc(P, s20, base); 0.9562::p_fc(P, s20, inc) :- p_occupancy(P, s20, inc).
0.132::p_fc(P, s21, dec); 0.736::p_fc(P, s21, base); 0.132::p_fc(P, s21, inc) :- p_occupancy(P, s21, base).
0.736::p_fc(P, s21, dec); 0.263::p_fc(P, s21, base); 0.001::p_fc(P, s21, inc) :- p_occupancy(P, s21, dec).
0.001::p_fc(P, s21, dec); 0.263::p_fc(P, s21, base); 0.736::p_fc(P, s21, inc) :- p_occupancy(P, s21, inc).
0.0586::p_fc(P, s22, dec); 0.8829::p_fc(P, s22, base); 0.0586::p_fc(P, s22, inc) :- p_occupancy(P, s22, base).
0.8829::p_fc(P, s22, dec); 0.1161::p_fc(P, s22, base); 0.001::p_fc(P, s22, inc) :- p_occupancy(P, s22, dec).
0.001::p_fc(P, s22, dec); 0.1161::p_fc(P, s22, base); 0.8829::p_fc(P, s22, inc) :- p_occupancy(P, s22, inc).
0.2472::p_fc(P, s23, dec); 0.5057::p_fc(P, s23, base); 0.2472::p_fc(P, s23, inc) :- p_occupancy(P, s23, base).
0.5057::p_fc(P, s23, dec); 0.4933::p_fc(P, s23, base); 0.001::p_fc(P, s23, inc) :- p_occupancy(P, s23, dec).
0.001::p_fc(P, s23, dec); 0.4933::p_fc(P, s23, base); 0.5057::p_fc(P, s23, inc) :- p_occupancy(P, s23, inc).
0.0625::p_fc(P, s24, dec); 0.875::p_fc(P, s24, base); 0.0625::p_fc(P, s24, inc) :- p_occupancy(P, s24, base).
0.875::p_fc(P, s24, dec); 0.124::p_fc(P, s24, base); 0.001::p_fc(P, s24, inc) :- p_occupancy(P, s24, dec).
0.001::p_fc(P, s24, dec); 0.124::p_fc(P, s24, base); 0.875::p_fc(P, s24, inc) :- p_occupancy(P, s24, inc).
0.0006::p_fc(P, s25, dec); 0.9988::p_fc(P, s25, base); 0.0006::p_fc(P, s25, inc) :- p_occupancy(P, s25, base).
0.9988::p_fc(P, s25, dec); 0.0002::p_fc(P, s25, base); 0.001::p_fc(P, s25, inc) :- p_occupancy(P, s25, dec).
0.001::p_fc(P, s25, dec); 0.0002::p_fc(P, s25, base); 0.9988::p_fc(P, s25, inc) :- p_occupancy(P, s25, inc).
0.0103::p_fc(P, s26, dec); 0.9794::p_fc(P, s26, base); 0.0103::p_fc(P, s26, inc) :- p_occupancy(P, s26, base).
0.9794::p_fc(P, s26, dec); 0.0196::p_fc(P, s26, base); 0.001::p_fc(P, s26, inc) :- p_occupancy(P, s26, dec).
0.001::p_fc(P, s26, dec); 0.0196::p_fc(P, s26, base); 0.9794::p_fc(P, s26, inc) :- p_occupancy(P, s26, inc).
0.2391::p_fc(P, s27, dec); 0.5217::p_fc(P, s27, base); 0.2391::p_fc(P, s27, inc) :- p_occupancy(P, s27, base).
0.5217::p_fc(P, s27, dec); 0.4773::p_fc(P, s27, base); 0.001::p_fc(P, s27, inc) :- p_occupancy(P, s27, dec).
0.001::p_fc(P, s27, dec); 0.4773::p_fc(P, s27, base); 0.5217::p_fc(P, s27, inc) :- p_occupancy(P, s27, inc).
0.1179::p_fc(P, s28, dec); 0.7641::p_fc(P, s28, base); 0.1179::p_fc(P, s28, inc) :- p_occupancy(P, s28, base).
0.7641::p_fc(P, s28, dec); 0.2349::p_fc(P, s28, base); 0.001::p_fc(P, s28, inc) :- p_occupancy(P, s28, dec).
0.001::p_fc(P, s28, dec); 0.2349::p_fc(P, s28, base); 0.7641::p_fc(P, s28, inc) :- p_occupancy(P, s28, inc).
0.0103::p_fc(P, s29, dec); 0.9794::p_fc(P, s29, base); 0.0103::p_fc(P, s29, inc) :- p_occupancy(P, s29, base).
0.9794::p_fc(P, s29, dec); 0.0196::p_fc(P, s29, base); 0.001::p_fc(P, s29, inc) :- p_occupancy(P, s29, dec).
0.001::p_fc(P, s29, dec); 0.0196::p_fc(P, s29, base); 0.9794::p_fc(P, s29, inc) :- p_occupancy(P, s29, inc).
0.2271::p_fc(P, s3, dec); 0.5458::p_fc(P, s3, base); 0.2271::p_fc(P, s3, inc) :- p_occupancy(P, s3, base).
0.5458::p_fc(P, s3, dec); 0.4532::p_fc(P, s3, base); 0.001::p_fc(P, s3, inc) :- p_occupancy(P, s3, dec).
0.001::p_fc(P, s3, dec); 0.4532::p_fc(P, s3, base); 0.5458::p_fc(P, s3, inc) :- p_occupancy(P, s3, inc).
0.1504::p_fc(P, s30, dec); 0.6992::p_fc(P, s30, base); 0.1504::p_fc(P, s30, inc) :- p_occupancy(P, s30, base).
0.6992::p_fc(P, s30, dec); 0.2998::p_fc(P, s30, base); 0.001::p_fc(P, s30, inc) :- p_occupancy(P, s30, dec).
0.001::p_fc(P, s30, dec); 0.2998::p_fc(P, s30, base); 0.6992::p_fc(P, s30, inc) :- p_occupancy(P, s30, inc).
0.2488::p_fc(P, s31, dec); 0.5023::p_fc(P, s31, base); 0.2488::p_fc(P, s31, inc) :- p_occupancy(P, s31, base).
0.5023::p_fc(P, s31, dec); 0.4967::p_fc(P, s31, base); 0.001::p_fc(P, s31, inc) :- p_occupancy(P, s31, dec).
0.001::p_fc(P, s31, dec); 0.4967::p_fc(P, s31, base); 0.5023::p_fc(P, s31, inc) :- p_occupancy(P, s31, inc).
0.0953::p_fc(P, s32, dec); 0.8094::p_fc(P, s32, base); 0.0953::p_fc(P, s32, inc) :- p_occupancy(P, s32, base).
0.8094::p_fc(P, s32, dec); 0.1896::p_fc(P, s32, base); 0.001::p_fc(P, s32, inc) :- p_occupancy(P, s32, dec).
0.001::p_fc(P, s32, dec); 0.1896::p_fc(P, s32, base); 0.8094::p_fc(P, s32, inc) :- p_occupancy(P, s32, inc).
0.2191::p_fc(P, s33, dec); 0.5618::p_fc(P, s33, base); 0.2191::p_fc(P, s33, inc) :- p_occupancy(P, s33, base).
0.5618::p_fc(P, s33, dec); 0.4372::p_fc(P, s33, base); 0.001::p_fc(P, s33, inc) :- p_occupancy(P, s33, dec).
0.001::p_fc(P, s33, dec); 0.4372::p_fc(P, s33, base); 0.5618::p_fc(P, s33, inc) :- p_occupancy(P, s33, inc).
0.1039::p_fc(P, s34, dec); 0.7923::p_fc(P, s34, base); 0.1039::p_fc(P, s34, inc) :- p_occupancy(P, s34, base).
0.7923::p_fc(P, s34, dec); 0.2067::p_fc(P, s34, base); 0.001::p_fc(P, s34, inc) :- p_occupancy(P, s34, dec).
0.001::p_fc(P, s34, dec); 0.2067::p_fc(P, s34, base); 0.7923::p_fc(P, s34, inc) :- p_occupancy(P, s34, inc).
0.1031::p_fc(P, s35, dec); 0.7938::p_fc(P, s35, base); 0.1031::p_fc(P, s35, inc) :- p_occupancy(P, s35, base).
0.7938::p_fc(P, s35, dec); 0.2052::p_fc(P, s35, base); 0.001::p_fc(P, s35, inc) :- p_occupancy(P, s35, dec).
0.001::p_fc(P, s35, dec); 0.2052::p_fc(P, s35, base); 0.7938::p_fc(P, s35, inc) :- p_occupancy(P, s35, inc).
0.1493::p_fc(P, s36, dec); 0.7013::p_fc(P, s36, base); 0.1493::p_fc(P, s36, inc) :- p_occupancy(P, s36, base).
0.7013::p_fc(P, s36, dec); 0.2977::p_fc(P, s36, base); 0.001::p_fc(P, s36, inc) :- p_occupancy(P, s36, dec).
0.001::p_fc(P, s36, dec); 0.2977::p_fc(P, s36, base); 0.7013::p_fc(P, s36, inc) :- p_occupancy(P, s36, inc).
0.0941::p_fc(P, s37, dec); 0.8119::p_fc(P, s37, base); 0.0941::p_fc(P, s37, inc) :- p_occupancy(P, s37, base).
0.8119::p_fc(P, s37, dec); 0.1871::p_fc(P, s37, base); 0.001::p_fc(P, s37, inc) :- p_occupancy(P, s37, dec).
0.001::p_fc(P, s37, dec); 0.1871::p_fc(P, s37, base); 0.8119::p_fc(P, s37, inc) :- p_occupancy(P, s37, inc).
0.0824::p_fc(P, s38, dec); 0.8353::p_fc(P, s38, base); 0.0824::p_fc(P, s38, inc) :- p_occupancy(P, s38, base).
0.8353::p_fc(P, s38, dec); 0.1637::p_fc(P, s38, base); 0.001::p_fc(P, s38, inc) :- p_occupancy(P, s38, dec).
0.001::p_fc(P, s38, dec); 0.1637::p_fc(P, s38, base); 0.8353::p_fc(P, s38, inc) :- p_occupancy(P, s38, inc).
0.1284::p_fc(P, s39, dec); 0.7433::p_fc(P, s39, base); 0.1284::p_fc(P, s39, inc) :- p_occupancy(P, s39, base).
0.7433::p_fc(P, s39, dec); 0.2557::p_fc(P, s39, base); 0.001::p_fc(P, s39, inc) :- p_occupancy(P, s39, dec).
0.001::p_fc(P, s39, dec); 0.2557::p_fc(P, s39, base); 0.7433::p_fc(P, s39, inc) :- p_occupancy(P, s39, inc).
0.157::p_fc(P, s4, dec); 0.686::p_fc(P, s4, base); 0.157::p_fc(P, s4, inc) :- p_occupancy(P, s4, base).
0.686::p_fc(P, s4, dec); 0.313::p_fc(P, s4, base); 0.001::p_fc(P, s4, inc) :- p_occupancy(P, s4, dec).
0.001::p_fc(P, s4, dec); 0.313::p_fc(P, s4, base); 0.686::p_fc(P, s4, inc) :- p_occupancy(P, s4, inc).
0.2465::p_fc(P, s40, dec); 0.5071::p_fc(P, s40, base); 0.2465::p_fc(P, s40, inc) :- p_occupancy(P, s40, base).
0.5071::p_fc(P, s40, dec); 0.4919::p_fc(P, s40, base); 0.001::p_fc(P, s40, inc) :- p_occupancy(P, s40, dec).
0.001::p_fc(P, s40, dec); 0.4919::p_fc(P, s40, base); 0.5071::p_fc(P, s40, inc) :- p_occupancy(P, s40, inc).
0.1444::p_fc(P, s41, dec); 0.7113::p_fc(P, s41, base); 0.1444::p_fc(P, s41, inc) :- p_occupancy(P, s41, base).
0.7113::p_fc(P, s41, dec); 0.2877::p_fc(P, s41, base); 0.001::p_fc(P, s41, inc) :- p_occupancy(P, s41, dec).
0.001::p_fc(P, s41, dec); 0.2877::p_fc(P, s41, base); 0.7113::p_fc(P, s41, inc) :- p_occupancy(P, s41, inc).
0.0142::p_fc(P, s42, dec); 0.9717::p_fc(P, s42, base); 0.0142::p_fc(P, s42, inc) :- p_occupancy(P, s42, base).
0.9717::p_fc(P, s42, dec); 0.0273::p_fc(P, s42, base); 0.001::p_fc(P, s42, inc) :- p_occupancy(P, s42, dec).
0.001::p_fc(P, s42, dec); 0.0273::p_fc(P, s42, base); 0.9717::p_fc(P, s42, inc) :- p_occupancy(P, s42, inc).
0.2188::p_fc(P, s43, dec); 0.5623::p_fc(P, s43, base); 0.2188::p_fc(P, s43, inc) :- p_occupancy(P, s43, base).
0.5623::p_fc(P, s43, dec); 0.4367::p_fc(P, s43, base); 0.001::p_fc(P, s43, inc) :- p_occupancy(P, s43, dec).
0.001::p_fc(P, s43, dec); 0.4367::p_fc(P, s43, base); 0.5623::p_fc(P, s43, inc) :- p_occupancy(P, s43, inc).
0.1192::p_fc(P, s44, dec); 0.7616::p_fc(P, s44, base); 0.1192::p_fc(P, s44, inc) :- p_occupancy(P, s44, base).
0.7616::p_fc(P, s44, dec); 0.2374::p_fc(P, s44, base); 0.001::p_fc(P, s44, inc) :- p_occupancy(P, s44, dec).
0.001::p_fc(P, s44, dec); 0.2374::p_fc(P, s44, base); 0.7616::p_fc(P, s44, inc) :- p_occupancy(P, s44, inc).
0.1238::p_fc(P, s45, dec); 0.7525::p_fc(P, s45, base); 0.1238::p_fc(P, s45, inc) :- p_occupancy(P, s45, base).
0.7525::p_fc(P, s45, dec); 0.2465::p_fc(P, s45, base); 0.001::p_fc(P, s45, inc) :- p_occupancy(P, s45, dec).
0.001::p_fc(P, s45, dec); 0.2465::p_fc(P, s45, base); 0.7525::p_fc(P, s45, inc) :- p_occupancy(P, s45, inc).
0.2275::p_fc(P, s46, dec); 0.5449::p_fc(P, s46, base); 0.2275::p_fc(P, s46, inc) :- p_occupancy(P, s46, base).
0.5449::p_fc(P, s46, dec); 0.4541::p_fc(P, s46, base); 0.001::p_fc(P, s46, inc) :- p_occupancy(P, s46, dec).
0.001::p_fc(P, s46, dec); 0.4541::p_fc(P, s46, base); 0.5449::p_fc(P, s46, inc) :- p_occupancy(P, s46, inc).
0.0296::p_fc(P, s47, dec); 0.9409::p_fc(P, s47, base); 0.0296::p_fc(P, s47, inc) :- p_occupancy(P, s47, base).
0.9409::p_fc(P, s47, dec); 0.0581::p_fc(P, s47, base); 0.001::p_fc(P, s47, inc) :- p_occupancy(P, s47, dec).
0.001::p_fc(P, s47, dec); 0.0581::p_fc(P, s47, base); 0.9409::p_fc(P, s47, inc) :- p_occupancy(P, s47, inc).
0.0315::p_fc(P, s48, dec); 0.9371::p_fc(P, s48, base); 0.0315::p_fc(P, s48, inc) :- p_occupancy(P, s48, base).
0.9371::p_fc(P, s48, dec); 0.0619::p_fc(P, s48, base); 0.001::p_fc(P, s48, inc) :- p_occupancy(P, s48, dec).
0.001::p_fc(P, s48, dec); 0.0619::p_fc(P, s48, base); 0.9371::p_fc(P, s48, inc) :- p_occupancy(P, s48, inc).
0.1598::p_fc(P, s49, dec); 0.6804::p_fc(P, s49, base); 0.1598::p_fc(P, s49, inc) :- p_occupancy(P, s49, base).
0.6804::p_fc(P, s49, dec); 0.3186::p_fc(P, s49, base); 0.001::p_fc(P, s49, inc) :- p_occupancy(P, s49, dec).
0.001::p_fc(P, s49, dec); 0.3186::p_fc(P, s49, base); 0.6804::p_fc(P, s49, inc) :- p_occupancy(P, s49, inc).
0.0595::p_fc(P, s5, dec); 0.881::p_fc(P, s5, base); 0.0595::p_fc(P, s5, inc) :- p_occupancy(P, s5, base).
0.881::p_fc(P, s5, dec); 0.118::p_fc(P, s5, base); 0.001::p_fc(P, s5, inc) :- p_occupancy(P, s5, dec).
0.001::p_fc(P, s5, dec); 0.118::p_fc(P, s5, base); 0.881::p_fc(P, s5, inc) :- p_occupancy(P, s5, inc).
0.0937::p_fc(P, s50, dec); 0.8127::p_fc(P, s50, base); 0.0937::p_fc(P, s50, inc) :- p_occupancy(P, s50, base).
0.8127::p_fc(P, s50, dec); 0.1863::p_fc(P, s50, base); 0.001::p_fc(P, s50, inc) :- p_occupancy(P, s50, dec).
0.001::p_fc(P, s50, dec); 0.1863::p_fc(P, s50, base); 0.8127::p_fc(P, s50, inc) :- p_occupancy(P, s50, inc).
0.1969::p_fc(P, s51, dec); 0.6063::p_fc(P, s51, base); 0.1969::p_fc(P, s51, inc) :- p_occupancy(P, s51, base).
0.6063::p_fc(P, s51, dec); 0.3927::p_fc(P, s51, base); 0.001::p_fc(P, s51, inc) :- p_occupancy(P, s51, dec).
0.001::p_fc(P, s51, dec); 0.3927::p_fc(P, s51, base); 0.6063::p_fc(P, s51, inc) :- p_occupancy(P, s51, inc).
0.1084::p_fc(P, s52, dec); 0.7833::p_fc(P, s52, base); 0.1084::p_fc(P, s52, inc) :- p_occupancy(P, s52, base).
0.7833::p_fc(P, s52, dec); 0.2157::p_fc(P, s52, base); 0.001::p_fc(P, s52, inc) :- p_occupancy(P, s52, dec).
0.001::p_fc(P, s52, dec); 0.2157::p_fc(P, s52, base); 0.7833::p_fc(P, s52, inc) :- p_occupancy(P, s52, inc).
0.0346::p_fc(P, s53, dec); 0.9308::p_fc(P, s53, base); 0.0346::p_fc(P, s53, inc) :- p_occupancy(P, s53, base).
0.9308::p_fc(P, s53, dec); 0.0682::p_fc(P, s53, base); 0.001::p_fc(P, s53, inc) :- p_occupancy(P, s53, dec).
0.001::p_fc(P, s53, dec); 0.0682::p_fc(P, s53, base); 0.9308::p_fc(P, s53, inc) :- p_occupancy(P, s53, inc).
0.0839::p_fc(P, s54, dec); 0.8321::p_fc(P, s54, base); 0.0839::p_fc(P, s54, inc) :- p_occupancy(P, s54, base).
0.8321::p_fc(P, s54, dec); 0.1669::p_fc(P, s54, base); 0.001::p_fc(P, s54, inc) :- p_occupancy(P, s54, dec).
0.001::p_fc(P, s54, dec); 0.1669::p_fc(P, s54, base); 0.8321::p_fc(P, s54, inc) :- p_occupancy(P, s54, inc).
0.0766::p_fc(P, s55, dec); 0.8468::p_fc(P, s55, base); 0.0766::p_fc(P, s55, inc) :- p_occupancy(P, s55, base).
0.8468::p_fc(P, s55, dec); 0.1522::p_fc(P, s55, base); 0.001::p_fc(P, s55, inc) :- p_occupancy(P, s55, dec).
0.001::p_fc(P, s55, dec); 0.1522::p_fc(P, s55, base); 0.8468::p_fc(P, s55, inc) :- p_occupancy(P, s55, inc).
0.1494::p_fc(P, s56, dec); 0.7011::p_fc(P, s56, base); 0.1494::p_fc(P, s56, inc) :- p_occupancy(P, s56, base).
0.7011::p_fc(P, s56, dec); 0.2979::p_fc(P, s56, base); 0.001::p_fc(P, s56, inc) :- p_occupancy(P, s56, dec).
0.001::p_fc(P, s56, dec); 0.2979::p_fc(P, s56, base); 0.7011::p_fc(P, s56, inc) :- p_occupancy(P, s56, inc).
0.208::p_fc(P, s57, dec); 0.584::p_fc(P, s57, base); 0.208::p_fc(P, s57, inc) :- p_occupancy(P, s57, base).
0.584::p_fc(P, s57, dec); 0.415::p_fc(P, s57, base); 0.001::p_fc(P, s57, inc) :- p_occupancy(P, s57, dec).
0.001::p_fc(P, s57, dec); 0.415::p_fc(P, s57, base); 0.584::p_fc(P, s57, inc) :- p_occupancy(P, s57, inc).
0.2168::p_fc(P, s58, dec); 0.5663::p_fc(P, s58, base); 0.2168::p_fc(P, s58, inc) :- p_occupancy(P, s58, base).
0.5663::p_fc(P, s58, dec); 0.4327::p_fc(P, s58, base); 0.001::p_fc(P, s58, inc) :- p_occupancy(P, s58, dec).
0.001::p_fc(P, s58, dec); 0.4327::p_fc(P, s58, base); 0.5663::p_fc(P, s58, inc) :- p_occupancy(P, s58, inc).
0.1355::p_fc(P, s59, dec); 0.729::p_fc(P, s59, base); 0.1355::p_fc(P, s59, inc) :- p_occupancy(P, s59, base).
0.729::p_fc(P, s59, dec); 0.27::p_fc(P, s59, base); 0.001::p_fc(P, s59, inc) :- p_occupancy(P, s59, dec).
0.001::p_fc(P, s59, dec); 0.27::p_fc(P, s59, base); 0.729::p_fc(P, s59, inc) :- p_occupancy(P, s59, inc).
0.144::p_fc(P, s6, dec); 0.712::p_fc(P, s6, base); 0.144::p_fc(P, s6, inc) :- p_occupancy(P, s6, base).
0.712::p_fc(P, s6, dec); 0.287::p_fc(P, s6, base); 0.001::p_fc(P, s6, inc) :- p_occupancy(P, s6, dec).
0.001::p_fc(P, s6, dec); 0.287::p_fc(P, s6, base); 0.712::p_fc(P, s6, inc) :- p_occupancy(P, s6, inc).
0.2245::p_fc(P, s60, dec); 0.5511::p_fc(P, s60, base); 0.2245::p_fc(P, s60, inc) :- p_occupancy(P, s60, base).
0.5511::p_fc(P, s60, dec); 0.4479::p_fc(P, s60, base); 0.001::p_fc(P, s60, inc) :- p_occupancy(P, s60, dec).
0.001::p_fc(P, s60, dec); 0.4479::p_fc(P, s60, base); 0.5511::p_fc(P, s60, inc) :- p_occupancy(P, s60, inc).
0.0804::p_fc(P, s61, dec); 0.8391::p_fc(P, s61, base); 0.0804::p_fc(P, s61, inc) :- p_occupancy(P, s61, base).
0.8391::p_fc(P, s61, dec); 0.1599::p_fc(P, s61, base); 0.001::p_fc(P, s61, inc) :- p_occupancy(P, s61, dec).
0.001::p_fc(P, s61, dec); 0.1599::p_fc(P, s61, base); 0.8391::p_fc(P, s61, inc) :- p_occupancy(P, s61, inc).
0.0724::p_fc(P, s62, dec); 0.8552::p_fc(P, s62, base); 0.0724::p_fc(P, s62, inc) :- p_occupancy(P, s62, base).
0.8552::p_fc(P, s62, dec); 0.1438::p_fc(P, s62, base); 0.001::p_fc(P, s62, inc) :- p_occupancy(P, s62, dec).
0.001::p_fc(P, s62, dec); 0.1438::p_fc(P, s62, base); 0.8552::p_fc(P, s62, inc) :- p_occupancy(P, s62, inc).
0.2358::p_fc(P, s63, dec); 0.5283::p_fc(P, s63, base); 0.2358::p_fc(P, s63, inc) :- p_occupancy(P, s63, base).
0.5283::p_fc(P, s63, dec); 0.4707::p_fc(P, s63, base); 0.001::p_fc(P, s63, inc) :- p_occupancy(P, s63, dec).
0.001::p_fc(P, s63, dec); 0.4707::p_fc(P, s63, base); 0.5283::p_fc(P, s63, inc) :- p_occupancy(P, s63, inc).
0.1074::p_fc(P, s64, dec); 0.7852::p_fc(P, s64, base); 0.1074::p_fc(P, s64, inc) :- p_occupancy(P, s64, base).
0.7852::p_fc(P, s64, dec); 0.2138::p_fc(P, s64, base); 0.001::p_fc(P, s64, inc) :- p_occupancy(P, s64, dec).
0.001::p_fc(P, s64, dec); 0.2138::p_fc(P, s64, base); 0.7852::p_fc(P, s64, inc) :- p_occupancy(P, s64, inc).
0.1882::p_fc(P, s65, dec); 0.6236::p_fc(P, s65, base); 0.1882::p_fc(P, s65, inc) :- p_occupancy(P, s65, base).
0.6236::p_fc(P, s65, dec); 0.3754::p_fc(P, s65, base); 0.001::p_fc(P, s65, inc) :- p_occupancy(P, s65, dec).
0.001::p_fc(P, s65, dec); 0.3754::p_fc(P, s65, base); 0.6236::p_fc(P, s65, inc) :- p_occupancy(P, s65, inc).
0.0251::p_fc(P, s66, dec); 0.9498::p_fc(P, s66, base); 0.0251::p_fc(P, s66, inc) :- p_occupancy(P, s66, base).
0.9498::p_fc(P, s66, dec); 0.0492::p_fc(P, s66, base); 0.001::p_fc(P, s66, inc) :- p_occupancy(P, s66, dec).
0.001::p_fc(P, s66, dec); 0.0492::p_fc(P, s66, base); 0.9498::p_fc(P, s66, inc) :- p_occupancy(P, s66, inc).
0.2386::p_fc(P, s67, dec); 0.5228::p_fc(P, s67, base); 0.2386::p_fc(P, s67, inc) :- p_occupancy(P, s67, base).
0.5228::p_fc(P, s67, dec); 0.4762::p_fc(P, s67, base); 0.001::p_fc(P, s67, inc) :- p_occupancy(P, s67, dec).
0.001::p_fc(P, s67, dec); 0.4762::p_fc(P, s67, base); 0.5228::p_fc(P, s67, inc) :- p_occupancy(P, s67, inc).
0.19::p_fc(P, s68, dec); 0.6199::p_fc(P, s68, base); 0.19::p_fc(P, s68, inc) :- p_occupancy(P, s68, base).
0.6199::p_fc(P, s68, dec); 0.3791::p_fc(P, s68, base); 0.001::p_fc(P, s68, inc) :- p_occupancy(P, s68, dec).
0.001::p_fc(P, s68, dec); 0.3791::p_fc(P, s68, base); 0.6199::p_fc(P, s68, inc) :- p_occupancy(P, s68, inc).
0.0368::p_fc(P, s69, dec); 0.9264::p_fc(P, s69, base); 0.0368::p_fc(P, s69, inc) :- p_occupancy(P, s69, base).
0.9264::p_fc(P, s69, dec); 0.0726::p_fc(P, s69, base); 0.001::p_fc(P, s69, inc) :- p_occupancy(P, s69, dec).
0.001::p_fc(P, s69, dec); 0.0726::p_fc(P, s69, base); 0.9264::p_fc(P, s69, inc) :- p_occupancy(P, s69, inc).
0.1066::p_fc(P, s7, dec); 0.7869::p_fc(P, s7, base); 0.1066::p_fc(P, s7, inc) :- p_occupancy(P, s7, base).
0.7869::p_fc(P, s7, dec); 0.2121::p_fc(P, s7, base); 0.001::p_fc(P, s7, inc) :- p_occupancy(P, s7, dec).
0.001::p_fc(P, s7, dec); 0.2121::p_fc(P, s7, base); 0.7869::p_fc(P, s7, inc) :- p_occupancy(P, s7, inc).
0.1416::p_fc(P, s70, dec); 0.7168::p_fc(P, s70, base); 0.1416::p_fc(P, s70, inc) :- p_occupancy(P, s70, base).
0.7168::p_fc(P, s70, dec); 0.2822::p_fc(P, s70, base); 0.001::p_fc(P, s70, inc) :- p_occupancy(P, s70, dec).
0.001::p_fc(P, s70, dec); 0.2822::p_fc(P, s70, base); 0.7168::p_fc(P, s70, inc) :- p_occupancy(P, s70, inc).
0.0497::p_fc(P, s71, dec); 0.9005::p_fc(P, s71, base); 0.0497::p_fc(P, s71, inc) :- p_occupancy(P, s71, base).
0.9005::p_fc(P, s71, dec); 0.0985::p_fc(P, s71, base); 0.001::p_fc(P, s71, inc) :- p_occupancy(P, s71, dec).
0.001::p_fc(P, s71, dec); 0.0985::p_fc(P, s71, base); 0.9005::p_fc(P, s71, inc) :- p_occupancy(P, s71, inc).
0.0817::p_fc(P, s72, dec); 0.8366::p_fc(P, s72, base); 0.0817::p_fc(P, s72, inc) :- p_occupancy(P, s72, base).
0.8366::p_fc(P, s72, dec); 0.1624::p_fc(P, s72, base); 0.001::p_fc(P, s72, inc) :- p_occupancy(P, s72, dec).
0.001::p_fc(P, s72, dec); 0.1624::p_fc(P, s72, base); 0.8366::p_fc(P, s72, inc) :- p_occupancy(P, s72, inc).
0.0084::p_fc(P, s73, dec); 0.9833::p_fc(P, s73, base); 0.0084::p_fc(P, s73, inc) :- p_occupancy(P, s73, base).
0.9833::p_fc(P, s73, dec); 0.0157::p_fc(P, s73, base); 0.001::p_fc(P, s73, inc) :- p_occupancy(P, s73, dec).
0.001::p_fc(P, s73, dec); 0.0157::p_fc(P, s73, base); 0.9833::p_fc(P, s73, inc) :- p_occupancy(P, s73, inc).
0.1749::p_fc(P, s74, dec); 0.6503::p_fc(P, s74, base); 0.1749::p_fc(P, s74, inc) :- p_occupancy(P, s74, base).
0.6503::p_fc(P, s74, dec); 0.3487::p_fc(P, s74, base); 0.001::p_fc(P, s74, inc) :- p_occupancy(P, s74, dec).
0.001::p_fc(P, s74, dec); 0.3487::p_fc(P, s74, base); 0.6503::p_fc(P, s74, inc) :- p_occupancy(P, s74, inc).
0.0195::p_fc(P, s75, dec); 0.9609::p_fc(P, s75, base); 0.0195::p_fc(P, s75, inc) :- p_occupancy(P, s75, base).
0.9609::p_fc(P, s75, dec); 0.0381::p_fc(P, s75, base); 0.001::p_fc(P, s75, inc) :- p_occupancy(P, s75, dec).
0.001::p_fc(P, s75, dec); 0.0381::p_fc(P, s75, base); 0.9609::p_fc(P, s75, inc) :- p_occupancy(P, s75, inc).
0.2418::p_fc(P, s76, dec); 0.5164::p_fc(P, s76, base); 0.2418::p_fc(P, s76, inc) :- p_occupancy(P, s76, base).
0.5164::p_fc(P, s76, dec); 0.4826::p_fc(P, s76, base); 0.001::p_fc(P, s76, inc) :- p_occupancy(P, s76, dec).
0.001::p_fc(P, s76, dec); 0.4826::p_fc(P, s76, base); 0.5164::p_fc(P, s76, inc) :- p_occupancy(P, s76, inc).
0.2239::p_fc(P, s77, dec); 0.5522::p_fc(P, s77, base); 0.2239::p_fc(P, s77, inc) :- p_occupancy(P, s77, base).
0.5522::p_fc(P, s77, dec); 0.4468::p_fc(P, s77, base); 0.001::p_fc(P, s77, inc) :- p_occupancy(P, s77, dec).
0.001::p_fc(P, s77, dec); 0.4468::p_fc(P, s77, base); 0.5522::p_fc(P, s77, inc) :- p_occupancy(P, s77, inc).
0.2266::p_fc(P, s78, dec); 0.5468::p_fc(P, s78, base); 0.2266::p_fc(P, s78, inc) :- p_occupancy(P, s78, base).
0.5468::p_fc(P, s78, dec); 0.4522::p_fc(P, s78, base); 0.001::p_fc(P, s78, inc) :- p_occupancy(P, s78, dec).
0.001::p_fc(P, s78, dec); 0.4522::p_fc(P, s78, base); 0.5468::p_fc(P, s78, inc) :- p_occupancy(P, s78, inc).
0.053::p_fc(P, s79, dec); 0.8939::p_fc(P, s79, base); 0.053::p_fc(P, s79, inc) :- p_occupancy(P, s79, base).
0.8939::p_fc(P, s79, dec); 0.1051::p_fc(P, s79, base); 0.001::p_fc(P, s79, inc) :- p_occupancy(P, s79, dec).
0.001::p_fc(P, s79, dec); 0.1051::p_fc(P, s79, base); 0.8939::p_fc(P, s79, inc) :- p_occupancy(P, s79, inc).
0.2077::p_fc(P, s8, dec); 0.5845::p_fc(P, s8, base); 0.2077::p_fc(P, s8, inc) :- p_occupancy(P, s8, base).
0.5845::p_fc(P, s8, dec); 0.4145::p_fc(P, s8, base); 0.001::p_fc(P, s8, inc) :- p_occupancy(P, s8, dec).
0.001::p_fc(P, s8, dec); 0.4145::p_fc(P, s8, base); 0.5845::p_fc(P, s8, inc) :- p_occupancy(P, s8, inc).
0.1352::p_fc(P, s80, dec); 0.7297::p_fc(P, s80, base); 0.1352::p_fc(P, s80, inc) :- p_occupancy(P, s80, base).
0.7297::p_fc(P, s80, dec); 0.2693::p_fc(P, s80, base); 0.001::p_fc(P, s80, inc) :- p_occupancy(P, s80, dec).
0.001::p_fc(P, s80, dec); 0.2693::p_fc(P, s80, base); 0.7297::p_fc(P, s80, inc) :- p_occupancy(P, s80, inc).
0.0517::p_fc(P, s81, dec); 0.8965::p_fc(P, s81, base); 0.0517::p_fc(P, s81, inc) :- p_occupancy(P, s81, base).
0.8965::p_fc(P, s81, dec); 0.1025::p_fc(P, s81, base); 0.001::p_fc(P, s81, inc) :- p_occupancy(P, s81, dec).
0.001::p_fc(P, s81, dec); 0.1025::p_fc(P, s81, base); 0.8965::p_fc(P, s81, inc) :- p_occupancy(P, s81, inc).
0.0591::p_fc(P, s82, dec); 0.8817::p_fc(P, s82, base); 0.0591::p_fc(P, s82, inc) :- p_occupancy(P, s82, base).
0.8817::p_fc(P, s82, dec); 0.1173::p_fc(P, s82, base); 0.001::p_fc(P, s82, inc) :- p_occupancy(P, s82, dec).
0.001::p_fc(P, s82, dec); 0.1173::p_fc(P, s82, base); 0.8817::p_fc(P, s82, inc) :- p_occupancy(P, s82, inc).
0.0861::p_fc(P, s83, dec); 0.8278::p_fc(P, s83, base); 0.0861::p_fc(P, s83, inc) :- p_occupancy(P, s83, base).
0.8278::p_fc(P, s83, dec); 0.1712::p_fc(P, s83, base); 0.001::p_fc(P, s83, inc) :- p_occupancy(P, s83, dec).
0.001::p_fc(P, s83, dec); 0.1712::p_fc(P, s83, base); 0.8278::p_fc(P, s83, inc) :- p_occupancy(P, s83, inc).
0.226::p_fc(P, s84, dec); 0.5481::p_fc(P, s84, base); 0.226::p_fc(P, s84, inc) :- p_occupancy(P, s84, base).
0.5481::p_fc(P, s84, dec); 0.4509::p_fc(P, s84, base); 0.001::p_fc(P, s84, inc) :- p_occupancy(P, s84, dec).
0.001::p_fc(P, s84, dec); 0.4509::p_fc(P, s84, base); 0.5481::p_fc(P, s84, inc) :- p_occupancy(P, s84, inc).
0.2035::p_fc(P, s85, dec); 0.5931::p_fc(P, s85, base); 0.2035::p_fc(P, s85, inc) :- p_occupancy(P, s85, base).
0.5931::p_fc(P, s85, dec); 0.4059::p_fc(P, s85, base); 0.001::p_fc(P, s85, inc) :- p_occupancy(P, s85, dec).
0.001::p_fc(P, s85, dec); 0.4059::p_fc(P, s85, base); 0.5931::p_fc(P, s85, inc) :- p_occupancy(P, s85, inc).
0.0096::p_fc(P, s86, dec); 0.9809::p_fc(P, s86, base); 0.0096::p_fc(P, s86, inc) :- p_occupancy(P, s86, base).
0.9809::p_fc(P, s86, dec); 0.0181::p_fc(P, s86, base); 0.001::p_fc(P, s86, inc) :- p_occupancy(P, s86, dec).
0.001::p_fc(P, s86, dec); 0.0181::p_fc(P, s86, base); 0.9809::p_fc(P, s86, inc) :- p_occupancy(P, s86, inc).
0.0707::p_fc(P, s87, dec); 0.8585::p_fc(P, s87, base); 0.0707::p_fc(P, s87, inc) :- p_occupancy(P, s87, base).
0.8585::p_fc(P, s87, dec); 0.1405::p_fc(P, s87, base); 0.001::p_fc(P, s87, inc) :- p_occupancy(P, s87, dec).
0.001::p_fc(P, s87, dec); 0.1405::p_fc(P, s87, base); 0.8585::p_fc(P, s87, inc) :- p_occupancy(P, s87, inc).
0.0505::p_fc(P, s88, dec); 0.8989::p_fc(P, s88, base); 0.0505::p_fc(P, s88, inc) :- p_occupancy(P, s88, base).
0.8989::p_fc(P, s88, dec); 0.1001::p_fc(P, s88, base); 0.001::p_fc(P, s88, inc) :- p_occupancy(P, s88, dec).
0.001::p_fc(P, s88, dec); 0.1001::p_fc(P, s88, base); 0.8989::p_fc(P, s88, inc) :- p_occupancy(P, s88, inc).
0.077::p_fc(P, s89, dec); 0.8461::p_fc(P, s89, base); 0.077::p_fc(P, s89, inc) :- p_occupancy(P, s89, base).
0.8461::p_fc(P, s89, dec); 0.1529::p_fc(P, s89, base); 0.001::p_fc(P, s89, inc) :- p_occupancy(P, s89, dec).
0.001::p_fc(P, s89, dec); 0.1529::p_fc(P, s89, base); 0.8461::p_fc(P, s89, inc) :- p_occupancy(P, s89, inc).
0.2251::p_fc(P, s9, dec); 0.5499::p_fc(P, s9, base); 0.2251::p_fc(P, s9, inc) :- p_occupancy(P, s9, base).
0.5499::p_fc(P, s9, dec); 0.4491::p_fc(P, s9, base); 0.001::p_fc(P, s9, inc) :- p_occupancy(P, s9, dec).
0.001::p_fc(P, s9, dec); 0.4491::p_fc(P, s9, base); 0.5499::p_fc(P, s9, inc) :- p_occupancy(P, s9, inc).
0.1293::p_fc(P, s90, dec); 0.7415::p_fc(P, s90, base); 0.1293::p_fc(P, s90, inc) :- p_occupancy(P, s90, base).
0.7415::p_fc(P, s90, dec); 0.2575::p_fc(P, s90, base); 0.001::p_fc(P, s90, inc) :- p_occupancy(P, s90, dec).
0.001::p_fc(P, s90, dec); 0.2575::p_fc(P, s90, base); 0.7415::p_fc(P, s90, inc) :- p_occupancy(P, s90, inc).
0.0007::p_fc(P, s91, dec); 0.9986::p_fc(P, s91, base); 0.0007::p_fc(P, s91, inc) :- p_occupancy(P, s91, base).
0.9986::p_fc(P, s91, dec); 0.0004::p_fc(P, s91, base); 0.001::p_fc(P, s91, inc) :- p_occupancy(P, s91, dec).
0.001::p_fc(P, s91, dec); 0.0004::p_fc(P, s91, base); 0.9986::p_fc(P, s91, inc) :- p_occupancy(P, s91, inc).
0.0028::p_fc(P, s92, dec); 0.9944::p_fc(P, s92, base); 0.0028::p_fc(P, s92, inc) :- p_occupancy(P, s92, base).
0.9944::p_fc(P, s92, dec); 0.0046::p_fc(P, s92, base); 0.001::p_fc(P, s92, inc) :- p_occupancy(P, s92, dec).
0.001::p_fc(P, s92, dec); 0.0046::p_fc(P, s92, base); 0.9944::p_fc(P, s92, inc) :- p_occupancy(P, s92, inc).
0.189::p_fc(P, s93, dec); 0.622::p_fc(P, s93, base); 0.189::p_fc(P, s93, inc) :- p_occupancy(P, s93, base).
0.622::p_fc(P, s93, dec); 0.377::p_fc(P, s93, base); 0.001::p_fc(P, s93, inc) :- p_occupancy(P, s93, dec).
0.001::p_fc(P, s93, dec); 0.377::p_fc(P, s93, base); 0.622::p_fc(P, s93, inc) :- p_occupancy(P, s93, inc).
0.0061::p_fc(P, s94, dec); 0.9878::p_fc(P, s94, base); 0.0061::p_fc(P, s94, inc) :- p_occupancy(P, s94, base).
0.9878::p_fc(P, s94, dec); 0.0112::p_fc(P, s94, base); 0.001::p_fc(P, s94, inc) :- p_occupancy(P, s94, dec).
0.001::p_fc(P, s94, dec); 0.0112::p_fc(P, s94, base); 0.9878::p_fc(P, s94, inc) :- p_occupancy(P, s94, inc).
0.1426::p_fc(P, s95, dec); 0.7149::p_fc(P, s95, base); 0.1426::p_fc(P, s95, inc) :- p_occupancy(P, s95, base).
0.7149::p_fc(P, s95, dec); 0.2841::p_fc(P, s95, base); 0.001::p_fc(P, s95, inc) :- p_occupancy(P, s95, dec).
0.001::p_fc(P, s95, dec); 0.2841::p_fc(P, s95, base); 0.7149::p_fc(P, s95, inc) :- p_occupancy(P, s95, inc).
0.2253::p_fc(P, s96, dec); 0.5495::p_fc(P, s96, base); 0.2253::p_fc(P, s96, inc) :- p_occupancy(P, s96, base).
0.5495::p_fc(P, s96, dec); 0.4495::p_fc(P, s96, base); 0.001::p_fc(P, s96, inc) :- p_occupancy(P, s96, dec).
0.001::p_fc(P, s96, dec); 0.4495::p_fc(P, s96, base); 0.5495::p_fc(P, s96, inc) :- p_occupancy(P, s96, inc).
0.0798::p_fc(P, s97, dec); 0.8403::p_fc(P, s97, base); 0.0798::p_fc(P, s97, inc) :- p_occupancy(P, s97, base).
0.8403::p_fc(P, s97, dec); 0.1587::p_fc(P, s97, base); 0.001::p_fc(P, s97, inc) :- p_occupancy(P, s97, dec).
0.001::p_fc(P, s97, dec); 0.1587::p_fc(P, s97, base); 0.8403::p_fc(P, s97, inc) :- p_occupancy(P, s97, inc).
0.15::p_fc(P, s98, dec); 0.7001::p_fc(P, s98, base); 0.15::p_fc(P, s98, inc) :- p_occupancy(P, s98, base).
0.7001::p_fc(P, s98, dec); 0.2989::p_fc(P, s98, base); 0.001::p_fc(P, s98, inc) :- p_occupancy(P, s98, dec).
0.001::p_fc(P, s98, dec); 0.2989::p_fc(P, s98, base); 0.7001::p_fc(P, s98, inc) :- p_occupancy(P, s98, inc).
0.2229::p_fc(P, s99, dec); 0.5543::p_fc(P, s99, base); 0.2229::p_fc(P, s99, inc) :- p_occupancy(P, s99, base).
0.5543::p_fc(P, s99, dec); 0.4447::p_fc(P, s99, base); 0.001::p_fc(P, s99, inc) :- p_occupancy(P, s99, dec).
0.001::p_fc(P, s99, dec); 0.4447::p_fc(P, s99, base); 0.5543::p_fc(P, s99, inc) :- p_occupancy(P, s99, inc).

%%% probabilistic attributes (unknown) %%%
% t(p1)targets(E, P). % initialise with specific probability (e.g. Cantley)
% t(1/2)targets(E, P) :- es_interaction(E, P).
% t(1/2)targets(E, P) :- enzyme(E), phosphosite(P).
% t(_, _dO)::p_fc(P, S, dec); t(_, _dO)::p_fc(P, S, base); t(_, _dO)::p_fc(P, S, inc) :- p_occupancy(P, S, _dO). % value = _fc = [dec | base | inc] (cpd, P-level)
t(0.33, E, S)::e_activity(E, S, dec); t(0.33, E, S)::e_activity(E, S, base); t(0.33, E, S)::e_activity(E, S, inc) :- enzyme(E). % value = _dA = [dec | base | inc] (prior, E/S-level)

%%% occupancy aggregation rule (cpd, P-level, E-level)
% auxiliary variables (value = [true | false])
t(0.7, E, P)::occ_dec(P, S) :- targets(E, P), e_function(E, kinase), e_activity(E, S, dec).
t(0.7, E, P)::occ_dec(P, S) :- targets(E, P), e_function(E, phosphatase), e_activity(E, S, inc).
t(0.7, E, P)::occ_base(P, S) :- targets(E, P), e_function(E, kinase), e_activity(E, S, base).
t(0.7, E, P)::occ_base(P, S) :- targets(E, P), e_function(E, phosphatase), e_activity(E, S, base).
t(0.7, E, P)::occ_inc(P, S) :- targets(E, P), e_function(E, kinase), e_activity(E, S, inc).
t(0.7, E, P)::occ_inc(P, S) :- targets(E, P), e_function(E, phosphatase), e_activity(E, S, dec).
% aggregation (value = _dO = [dec | base | inc])
t(1.0)::p_occupancy(P, S, dec); t(0.0)::p_occupancy(P, S, base); t(0.0)::p_occupancy(P, S, inc) :- occ_dec(P, S), occ_base(P, S), \+ occ_inc(P, S).
t(0.0)::p_occupancy(P, S, dec); t(0.0)::p_occupancy(P, S, base); t(1.0)::p_occupancy(P, S, inc) :- \+ occ_dec(P, S), occ_base(P, S), occ_inc(P, S).
t(0.25)::p_occupancy(P, S, dec); t(0.5)::p_occupancy(P, S, base); t(0.25)::p_occupancy(P, S, inc) :- occ_dec(P, S), occ_base(P, S), occ_inc(P, S).
t(0.0)::p_occupancy(P, S, dec); t(1.0)::p_occupancy(P, S, base); t(0.0)::p_occupancy(P, S, inc) :- \+ occ_dec(P, S), occ_base(P, S), \+ occ_inc(P, S).
t(1.0)::p_occupancy(P, S, dec); t(0.0)::p_occupancy(P, S, base); t(0.0)::p_occupancy(P, S, inc) :- occ_dec(P, S), \+ occ_base(P, S), \+ occ_inc(P, S).
t(0.0)::p_occupancy(P, S, dec); t(0.0)::p_occupancy(P, S, base); t(1.0)::p_occupancy(P, S, inc) :- \+ occ_dec(P, S), \+ occ_base(P, S), occ_inc(P, S).
t(0.25)::p_occupancy(P, S, dec); t(0.5)::p_occupancy(P, S, base); t(0.25)::p_occupancy(P, S, inc) :- occ_dec(P, S), \+ occ_base(P, S), occ_inc(P, S).
t(0.0)::p_occupancy(P, S, dec); t(1.0)::p_occupancy(P, S, base); t(0.0)::p_occupancy(P, S, inc) :- \+ occ_dec(P, S), \+ occ_base(P, S), \+ occ_inc(P, S).
