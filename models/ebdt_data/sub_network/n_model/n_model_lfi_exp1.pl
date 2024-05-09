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
p_function("ABI1(Y213)", p_inc).
p_function("ABL1(S569)", p_inc).
p_function("SRC(S75)", p_inc).
p_function("HIPK2(Y361)", p_inc).
p_function("ABL1(T735)", p_dec).
p_function("PTK2(S910)", p_inc).
p_function("PTK2(S843)", p_inc).
targets(E, P) :- es_interaction(E, P). % value = [true | false]; equivalent to 'es_interaction.exists'
inhibits(D, E) :- dk_interaction(D, E).

%%% probabilistic attributes (known) %%%
% p::targets(E, P).
%% p1::e_ksea(E, S, dec); p2::e_ksea(E, S, base); p3::e_ksea(E, S, inc) :- e_activity(E, S, _dA). % value = _ksea = [dec | base | inc] (cpd, E/S-level)
0.6485357991::e_ksea("ABL1", "AC220", dec); 0.001::e_ksea("ABL1", "AC220", inc) :- e_activity("ABL1", "AC220", dec).
0.001::e_ksea("ABL1", "AC220", dec); 0.6485357991::e_ksea("ABL1", "AC220", inc) :- e_activity("ABL1", "AC220", inc).
0.5907946928::e_ksea("ABL1", "AT13148", dec); 0.001::e_ksea("ABL1", "AT13148", inc) :- e_activity("ABL1", "AT13148", dec).
0.001::e_ksea("ABL1", "AT13148", dec); 0.5907946928::e_ksea("ABL1", "AT13148", inc) :- e_activity("ABL1", "AT13148", inc).
0.6516967571::e_ksea("ABL1", "AZ20", dec); 0.001::e_ksea("ABL1", "AZ20", inc) :- e_activity("ABL1", "AZ20", dec).
0.001::e_ksea("ABL1", "AZ20", dec); 0.6516967571::e_ksea("ABL1", "AZ20", inc) :- e_activity("ABL1", "AZ20", inc).
0.5696596882::e_ksea("ABL1", "AZD1480", dec); 0.001::e_ksea("ABL1", "AZD1480", inc) :- e_activity("ABL1", "AZD1480", dec).
0.001::e_ksea("ABL1", "AZD1480", dec); 0.5696596882::e_ksea("ABL1", "AZD1480", inc) :- e_activity("ABL1", "AZD1480", inc).
0.8364156347::e_ksea("ABL1", "AZD3759", dec); 0.001::e_ksea("ABL1", "AZD3759", inc) :- e_activity("ABL1", "AZD3759", dec).
0.001::e_ksea("ABL1", "AZD3759", dec); 0.8364156347::e_ksea("ABL1", "AZD3759", inc) :- e_activity("ABL1", "AZD3759", inc).
0.7305696235::e_ksea("ABL1", "AZD5363", dec); 0.001::e_ksea("ABL1", "AZD5363", inc) :- e_activity("ABL1", "AZD5363", dec).
0.001::e_ksea("ABL1", "AZD5363", dec); 0.7305696235::e_ksea("ABL1", "AZD5363", inc) :- e_activity("ABL1", "AZD5363", inc).
0.6027315408::e_ksea("ABL1", "AZD5438", dec); 0.001::e_ksea("ABL1", "AZD5438", inc) :- e_activity("ABL1", "AZD5438", dec).
0.001::e_ksea("ABL1", "AZD5438", dec); 0.6027315408::e_ksea("ABL1", "AZD5438", inc) :- e_activity("ABL1", "AZD5438", inc).
0.810765732::e_ksea("ABL1", "AZD6482", dec); 0.001::e_ksea("ABL1", "AZD6482", inc) :- e_activity("ABL1", "AZD6482", dec).
0.001::e_ksea("ABL1", "AZD6482", dec); 0.810765732::e_ksea("ABL1", "AZD6482", inc) :- e_activity("ABL1", "AZD6482", inc).
0.5063468877::e_ksea("ABL1", "AZD6738", dec); 0.001::e_ksea("ABL1", "AZD6738", inc) :- e_activity("ABL1", "AZD6738", dec).
0.001::e_ksea("ABL1", "AZD6738", dec); 0.5063468877::e_ksea("ABL1", "AZD6738", inc) :- e_activity("ABL1", "AZD6738", inc).
0.6233519816::e_ksea("ABL1", "AZD8055", dec); 0.001::e_ksea("ABL1", "AZD8055", inc) :- e_activity("ABL1", "AZD8055", dec).
0.001::e_ksea("ABL1", "AZD8055", dec); 0.6233519816::e_ksea("ABL1", "AZD8055", inc) :- e_activity("ABL1", "AZD8055", inc).
0.7045614293::e_ksea("ABL1", "Amuvatinib", dec); 0.001::e_ksea("ABL1", "Amuvatinib", inc) :- e_activity("ABL1", "Amuvatinib", dec).
0.001::e_ksea("ABL1", "Amuvatinib", dec); 0.7045614293::e_ksea("ABL1", "Amuvatinib", inc) :- e_activity("ABL1", "Amuvatinib", inc).
0.6255774284::e_ksea("ABL1", "BX912", dec); 0.001::e_ksea("ABL1", "BX912", inc) :- e_activity("ABL1", "BX912", dec).
0.001::e_ksea("ABL1", "BX912", dec); 0.6255774284::e_ksea("ABL1", "BX912", inc) :- e_activity("ABL1", "BX912", inc).
0.98614926::e_ksea("ABL1", "Bosutinib", dec); 0.001::e_ksea("ABL1", "Bosutinib", inc) :- e_activity("ABL1", "Bosutinib", dec).
0.001::e_ksea("ABL1", "Bosutinib", dec); 0.98614926::e_ksea("ABL1", "Bosutinib", inc) :- e_activity("ABL1", "Bosutinib", inc).
0.5523133511::e_ksea("ABL1", "CAL101", dec); 0.001::e_ksea("ABL1", "CAL101", inc) :- e_activity("ABL1", "CAL101", dec).
0.001::e_ksea("ABL1", "CAL101", dec); 0.5523133511::e_ksea("ABL1", "CAL101", inc) :- e_activity("ABL1", "CAL101", inc).
0.7836236651::e_ksea("ABL1", "CHIR99021", dec); 0.001::e_ksea("ABL1", "CHIR99021", inc) :- e_activity("ABL1", "CHIR99021", dec).
0.001::e_ksea("ABL1", "CHIR99021", dec); 0.7836236651::e_ksea("ABL1", "CHIR99021", inc) :- e_activity("ABL1", "CHIR99021", inc).
0.7802654751::e_ksea("ABL1", "CX4945", dec); 0.001::e_ksea("ABL1", "CX4945", inc) :- e_activity("ABL1", "CX4945", dec).
0.001::e_ksea("ABL1", "CX4945", dec); 0.7802654751::e_ksea("ABL1", "CX4945", inc) :- e_activity("ABL1", "CX4945", inc).
0.7126127558::e_ksea("ABL1", "DNAPK", dec); 0.001::e_ksea("ABL1", "DNAPK", inc) :- e_activity("ABL1", "DNAPK", dec).
0.001::e_ksea("ABL1", "DNAPK", dec); 0.7126127558::e_ksea("ABL1", "DNAPK", inc) :- e_activity("ABL1", "DNAPK", inc).
0.7367697441::e_ksea("ABL1", "Dabrafenib", dec); 0.001::e_ksea("ABL1", "Dabrafenib", inc) :- e_activity("ABL1", "Dabrafenib", dec).
0.001::e_ksea("ABL1", "Dabrafenib", dec); 0.7367697441::e_ksea("ABL1", "Dabrafenib", inc) :- e_activity("ABL1", "Dabrafenib", inc).
0.9977612659::e_ksea("ABL1", "Dasatinib", dec); 0.001::e_ksea("ABL1", "Dasatinib", inc) :- e_activity("ABL1", "Dasatinib", dec).
0.001::e_ksea("ABL1", "Dasatinib", dec); 0.9977612659::e_ksea("ABL1", "Dasatinib", inc) :- e_activity("ABL1", "Dasatinib", inc).
0.5114778531::e_ksea("ABL1", "Edelfosine", dec); 0.001::e_ksea("ABL1", "Edelfosine", inc) :- e_activity("ABL1", "Edelfosine", dec).
0.001::e_ksea("ABL1", "Edelfosine", dec); 0.5114778531::e_ksea("ABL1", "Edelfosine", inc) :- e_activity("ABL1", "Edelfosine", inc).
0.9842877594::e_ksea("ABL1", "FRAX486", dec); 0.001::e_ksea("ABL1", "FRAX486", inc) :- e_activity("ABL1", "FRAX486", dec).
0.001::e_ksea("ABL1", "FRAX486", dec); 0.9842877594::e_ksea("ABL1", "FRAX486", inc) :- e_activity("ABL1", "FRAX486", inc).
0.7950011926::e_ksea("ABL1", "GDC0941", dec); 0.001::e_ksea("ABL1", "GDC0941", inc) :- e_activity("ABL1", "GDC0941", dec).
0.001::e_ksea("ABL1", "GDC0941", dec); 0.7950011926::e_ksea("ABL1", "GDC0941", inc) :- e_activity("ABL1", "GDC0941", inc).
0.8661377079::e_ksea("ABL1", "GDC0994", dec); 0.001::e_ksea("ABL1", "GDC0994", inc) :- e_activity("ABL1", "GDC0994", dec).
0.001::e_ksea("ABL1", "GDC0994", dec); 0.8661377079::e_ksea("ABL1", "GDC0994", inc) :- e_activity("ABL1", "GDC0994", inc).
0.6395069878::e_ksea("ABL1", "GF109203X", dec); 0.001::e_ksea("ABL1", "GF109203X", inc) :- e_activity("ABL1", "GF109203X", dec).
0.001::e_ksea("ABL1", "GF109203X", dec); 0.6395069878::e_ksea("ABL1", "GF109203X", inc) :- e_activity("ABL1", "GF109203X", inc).
0.5062410486::e_ksea("ABL1", "GO6983", dec); 0.001::e_ksea("ABL1", "GO6983", inc) :- e_activity("ABL1", "GO6983", dec).
0.001::e_ksea("ABL1", "GO6983", dec); 0.5062410486::e_ksea("ABL1", "GO6983", inc) :- e_activity("ABL1", "GO6983", inc).
0.5102090864::e_ksea("ABL1", "GSK2334470", dec); 0.001::e_ksea("ABL1", "GSK2334470", inc) :- e_activity("ABL1", "GSK2334470", dec).
0.001::e_ksea("ABL1", "GSK2334470", dec); 0.5102090864::e_ksea("ABL1", "GSK2334470", inc) :- e_activity("ABL1", "GSK2334470", inc).
0.5608116312::e_ksea("ABL1", "GSK690693", dec); 0.001::e_ksea("ABL1", "GSK690693", inc) :- e_activity("ABL1", "GSK690693", dec).
0.001::e_ksea("ABL1", "GSK690693", dec); 0.5608116312::e_ksea("ABL1", "GSK690693", inc) :- e_activity("ABL1", "GSK690693", inc).
0.6315805268::e_ksea("ABL1", "Go6976", dec); 0.001::e_ksea("ABL1", "Go6976", inc) :- e_activity("ABL1", "Go6976", dec).
0.001::e_ksea("ABL1", "Go6976", dec); 0.6315805268::e_ksea("ABL1", "Go6976", inc) :- e_activity("ABL1", "Go6976", inc).
0.5236682831::e_ksea("ABL1", "H89", dec); 0.001::e_ksea("ABL1", "H89", inc) :- e_activity("ABL1", "H89", dec).
0.001::e_ksea("ABL1", "H89", dec); 0.5236682831::e_ksea("ABL1", "H89", inc) :- e_activity("ABL1", "H89", inc).
0.6272139351::e_ksea("ABL1", "HS173", dec); 0.001::e_ksea("ABL1", "HS173", inc) :- e_activity("ABL1", "HS173", dec).
0.001::e_ksea("ABL1", "HS173", dec); 0.6272139351::e_ksea("ABL1", "HS173", inc) :- e_activity("ABL1", "HS173", inc).
0.7577481144::e_ksea("ABL1", "Ipatasertib", dec); 0.001::e_ksea("ABL1", "Ipatasertib", inc) :- e_activity("ABL1", "Ipatasertib", dec).
0.001::e_ksea("ABL1", "Ipatasertib", dec); 0.7577481144::e_ksea("ABL1", "Ipatasertib", inc) :- e_activity("ABL1", "Ipatasertib", inc).
0.736492792::e_ksea("ABL1", "JNJ", dec); 0.001::e_ksea("ABL1", "JNJ", inc) :- e_activity("ABL1", "JNJ", dec).
0.001::e_ksea("ABL1", "JNJ", dec); 0.736492792::e_ksea("ABL1", "JNJ", inc) :- e_activity("ABL1", "JNJ", inc).
0.5867910519::e_ksea("ABL1", "JNK", dec); 0.001::e_ksea("ABL1", "JNK", inc) :- e_activity("ABL1", "JNK", dec).
0.001::e_ksea("ABL1", "JNK", dec); 0.5867910519::e_ksea("ABL1", "JNK", inc) :- e_activity("ABL1", "JNK", inc).
0.6527214928::e_ksea("ABL1", "KD025", dec); 0.001::e_ksea("ABL1", "KD025", inc) :- e_activity("ABL1", "KD025", dec).
0.001::e_ksea("ABL1", "KD025", dec); 0.6527214928::e_ksea("ABL1", "KD025", inc) :- e_activity("ABL1", "KD025", inc).
0.8140577976::e_ksea("ABL1", "KN62", dec); 0.001::e_ksea("ABL1", "KN62", inc) :- e_activity("ABL1", "KN62", dec).
0.001::e_ksea("ABL1", "KN62", dec); 0.8140577976::e_ksea("ABL1", "KN62", inc) :- e_activity("ABL1", "KN62", inc).
0.7185886651::e_ksea("ABL1", "KN93", dec); 0.001::e_ksea("ABL1", "KN93", inc) :- e_activity("ABL1", "KN93", dec).
0.001::e_ksea("ABL1", "KN93", dec); 0.7185886651::e_ksea("ABL1", "KN93", inc) :- e_activity("ABL1", "KN93", inc).
0.5920970236::e_ksea("ABL1", "Ku0063794", dec); 0.001::e_ksea("ABL1", "Ku0063794", inc) :- e_activity("ABL1", "Ku0063794", dec).
0.001::e_ksea("ABL1", "Ku0063794", dec); 0.5920970236::e_ksea("ABL1", "Ku0063794", inc) :- e_activity("ABL1", "Ku0063794", inc).
0.5530528903::e_ksea("ABL1", "LY2090314", dec); 0.001::e_ksea("ABL1", "LY2090314", inc) :- e_activity("ABL1", "LY2090314", dec).
0.001::e_ksea("ABL1", "LY2090314", dec); 0.5530528903::e_ksea("ABL1", "LY2090314", inc) :- e_activity("ABL1", "LY2090314", inc).
0.8258720004::e_ksea("ABL1", "LY2584702", dec); 0.001::e_ksea("ABL1", "LY2584702", inc) :- e_activity("ABL1", "LY2584702", dec).
0.001::e_ksea("ABL1", "LY2584702", dec); 0.8258720004::e_ksea("ABL1", "LY2584702", inc) :- e_activity("ABL1", "LY2584702", inc).
0.6854132105::e_ksea("ABL1", "LY2835219", dec); 0.001::e_ksea("ABL1", "LY2835219", inc) :- e_activity("ABL1", "LY2835219", dec).
0.001::e_ksea("ABL1", "LY2835219", dec); 0.6854132105::e_ksea("ABL1", "LY2835219", inc) :- e_activity("ABL1", "LY2835219", inc).
0.7184060505::e_ksea("ABL1", "Linsitinib", dec); 0.001::e_ksea("ABL1", "Linsitinib", inc) :- e_activity("ABL1", "Linsitinib", dec).
0.001::e_ksea("ABL1", "Linsitinib", dec); 0.7184060505::e_ksea("ABL1", "Linsitinib", inc) :- e_activity("ABL1", "Linsitinib", inc).
0.658487624::e_ksea("ABL1", "MK2206", dec); 0.001::e_ksea("ABL1", "MK2206", inc) :- e_activity("ABL1", "MK2206", dec).
0.001::e_ksea("ABL1", "MK2206", dec); 0.658487624::e_ksea("ABL1", "MK2206", inc) :- e_activity("ABL1", "MK2206", inc).
0.5708635718::e_ksea("ABL1", "NU7441", dec); 0.001::e_ksea("ABL1", "NU7441", inc) :- e_activity("ABL1", "NU7441", dec).
0.001::e_ksea("ABL1", "NU7441", dec); 0.5708635718::e_ksea("ABL1", "NU7441", inc) :- e_activity("ABL1", "NU7441", inc).
0.6236073271::e_ksea("ABL1", "PD153035", dec); 0.001::e_ksea("ABL1", "PD153035", inc) :- e_activity("ABL1", "PD153035", dec).
0.001::e_ksea("ABL1", "PD153035", dec); 0.6236073271::e_ksea("ABL1", "PD153035", inc) :- e_activity("ABL1", "PD153035", inc).
0.5679247608::e_ksea("ABL1", "PF3758309", dec); 0.001::e_ksea("ABL1", "PF3758309", inc) :- e_activity("ABL1", "PF3758309", dec).
0.001::e_ksea("ABL1", "PF3758309", dec); 0.5679247608::e_ksea("ABL1", "PF3758309", inc) :- e_activity("ABL1", "PF3758309", inc).
0.5115498866::e_ksea("ABL1", "PF4708671", dec); 0.001::e_ksea("ABL1", "PF4708671", inc) :- e_activity("ABL1", "PF4708671", dec).
0.001::e_ksea("ABL1", "PF4708671", dec); 0.5115498866::e_ksea("ABL1", "PF4708671", inc) :- e_activity("ABL1", "PF4708671", inc).
0.5712907195::e_ksea("ABL1", "PH797804", dec); 0.001::e_ksea("ABL1", "PH797804", inc) :- e_activity("ABL1", "PH797804", dec).
0.001::e_ksea("ABL1", "PH797804", dec); 0.5712907195::e_ksea("ABL1", "PH797804", inc) :- e_activity("ABL1", "PH797804", inc).
0.6008008812::e_ksea("ABL1", "PIK294", dec); 0.001::e_ksea("ABL1", "PIK294", inc) :- e_activity("ABL1", "PIK294", dec).
0.001::e_ksea("ABL1", "PIK294", dec); 0.6008008812::e_ksea("ABL1", "PIK294", inc) :- e_activity("ABL1", "PIK294", inc).
0.751548373::e_ksea("ABL1", "Ribociclib", dec); 0.001::e_ksea("ABL1", "Ribociclib", inc) :- e_activity("ABL1", "Ribociclib", dec).
0.001::e_ksea("ABL1", "Ribociclib", dec); 0.751548373::e_ksea("ABL1", "Ribociclib", inc) :- e_activity("ABL1", "Ribociclib", inc).
0.6404439703::e_ksea("ABL1", "Ripasudil", dec); 0.001::e_ksea("ABL1", "Ripasudil", inc) :- e_activity("ABL1", "Ripasudil", dec).
0.001::e_ksea("ABL1", "Ripasudil", dec); 0.6404439703::e_ksea("ABL1", "Ripasudil", inc) :- e_activity("ABL1", "Ripasudil", inc).
0.5833516809::e_ksea("ABL1", "SP600125", dec); 0.001::e_ksea("ABL1", "SP600125", inc) :- e_activity("ABL1", "SP600125", dec).
0.001::e_ksea("ABL1", "SP600125", dec); 0.5833516809::e_ksea("ABL1", "SP600125", inc) :- e_activity("ABL1", "SP600125", inc).
0.4999811659::e_ksea("ABL1", "Selumetinib", dec); 0.001::e_ksea("ABL1", "Selumetinib", inc) :- e_activity("ABL1", "Selumetinib", dec).
0.001::e_ksea("ABL1", "Selumetinib", dec); 0.4999811659::e_ksea("ABL1", "Selumetinib", inc) :- e_activity("ABL1", "Selumetinib", inc).
0.6785272855::e_ksea("ABL1", "TAK715", dec); 0.001::e_ksea("ABL1", "TAK715", inc) :- e_activity("ABL1", "TAK715", dec).
0.001::e_ksea("ABL1", "TAK715", dec); 0.6785272855::e_ksea("ABL1", "TAK715", inc) :- e_activity("ABL1", "TAK715", inc).
0.532669282::e_ksea("ABL1", "TBCA", dec); 0.001::e_ksea("ABL1", "TBCA", inc) :- e_activity("ABL1", "TBCA", dec).
0.001::e_ksea("ABL1", "TBCA", dec); 0.532669282::e_ksea("ABL1", "TBCA", inc) :- e_activity("ABL1", "TBCA", inc).
0.5529183359::e_ksea("ABL1", "TGX221", dec); 0.001::e_ksea("ABL1", "TGX221", inc) :- e_activity("ABL1", "TGX221", dec).
0.001::e_ksea("ABL1", "TGX221", dec); 0.5529183359::e_ksea("ABL1", "TGX221", inc) :- e_activity("ABL1", "TGX221", inc).
0.7566025624::e_ksea("ABL1", "Tofacitinib", dec); 0.001::e_ksea("ABL1", "Tofacitinib", inc) :- e_activity("ABL1", "Tofacitinib", dec).
0.001::e_ksea("ABL1", "Tofacitinib", dec); 0.7566025624::e_ksea("ABL1", "Tofacitinib", inc) :- e_activity("ABL1", "Tofacitinib", inc).
0.6697977339::e_ksea("ABL1", "Torin", dec); 0.001::e_ksea("ABL1", "Torin", inc) :- e_activity("ABL1", "Torin", dec).
0.001::e_ksea("ABL1", "Torin", dec); 0.6697977339::e_ksea("ABL1", "Torin", inc) :- e_activity("ABL1", "Torin", inc).
0.5317146618::e_ksea("ABL1", "Trametinib", dec); 0.001::e_ksea("ABL1", "Trametinib", inc) :- e_activity("ABL1", "Trametinib", dec).
0.001::e_ksea("ABL1", "Trametinib", dec); 0.5317146618::e_ksea("ABL1", "Trametinib", inc) :- e_activity("ABL1", "Trametinib", inc).
0.5476799131::e_ksea("ABL1", "U73122", dec); 0.001::e_ksea("ABL1", "U73122", inc) :- e_activity("ABL1", "U73122", dec).
0.001::e_ksea("ABL1", "U73122", dec); 0.5476799131::e_ksea("ABL1", "U73122", inc) :- e_activity("ABL1", "U73122", inc).
0.60876657::e_ksea("ABL1", "Ulixertinib", dec); 0.001::e_ksea("ABL1", "Ulixertinib", inc) :- e_activity("ABL1", "Ulixertinib", dec).
0.001::e_ksea("ABL1", "Ulixertinib", dec); 0.60876657::e_ksea("ABL1", "Ulixertinib", inc) :- e_activity("ABL1", "Ulixertinib", inc).
0.508461097::e_ksea("ABL1", "Vemurafenib", dec); 0.001::e_ksea("ABL1", "Vemurafenib", inc) :- e_activity("ABL1", "Vemurafenib", dec).
0.001::e_ksea("ABL1", "Vemurafenib", dec); 0.508461097::e_ksea("ABL1", "Vemurafenib", inc) :- e_activity("ABL1", "Vemurafenib", inc).
0.5197971212::e_ksea("FYN", "AC220", dec); 0.001::e_ksea("FYN", "AC220", inc) :- e_activity("FYN", "AC220", dec).
0.001::e_ksea("FYN", "AC220", dec); 0.5197971212::e_ksea("FYN", "AC220", inc) :- e_activity("FYN", "AC220", inc).
0.5949742227::e_ksea("FYN", "AT13148", dec); 0.001::e_ksea("FYN", "AT13148", inc) :- e_activity("FYN", "AT13148", dec).
0.001::e_ksea("FYN", "AT13148", dec); 0.5949742227::e_ksea("FYN", "AT13148", inc) :- e_activity("FYN", "AT13148", inc).
0.5808854874::e_ksea("FYN", "AZ20", dec); 0.001::e_ksea("FYN", "AZ20", inc) :- e_activity("FYN", "AZ20", dec).
0.001::e_ksea("FYN", "AZ20", dec); 0.5808854874::e_ksea("FYN", "AZ20", inc) :- e_activity("FYN", "AZ20", inc).
0.5121780674::e_ksea("FYN", "AZD1480", dec); 0.001::e_ksea("FYN", "AZD1480", inc) :- e_activity("FYN", "AZD1480", dec).
0.001::e_ksea("FYN", "AZD1480", dec); 0.5121780674::e_ksea("FYN", "AZD1480", inc) :- e_activity("FYN", "AZD1480", inc).
0.6044154211::e_ksea("FYN", "AZD3759", dec); 0.001::e_ksea("FYN", "AZD3759", inc) :- e_activity("FYN", "AZD3759", dec).
0.001::e_ksea("FYN", "AZD3759", dec); 0.6044154211::e_ksea("FYN", "AZD3759", inc) :- e_activity("FYN", "AZD3759", inc).
0.5339072137::e_ksea("FYN", "AZD5363", dec); 0.001::e_ksea("FYN", "AZD5363", inc) :- e_activity("FYN", "AZD5363", dec).
0.001::e_ksea("FYN", "AZD5363", dec); 0.5339072137::e_ksea("FYN", "AZD5363", inc) :- e_activity("FYN", "AZD5363", inc).
0.5245574102::e_ksea("FYN", "AZD5438", dec); 0.001::e_ksea("FYN", "AZD5438", inc) :- e_activity("FYN", "AZD5438", dec).
0.001::e_ksea("FYN", "AZD5438", dec); 0.5245574102::e_ksea("FYN", "AZD5438", inc) :- e_activity("FYN", "AZD5438", inc).
0.6039822374::e_ksea("FYN", "AZD6482", dec); 0.001::e_ksea("FYN", "AZD6482", inc) :- e_activity("FYN", "AZD6482", dec).
0.001::e_ksea("FYN", "AZD6482", dec); 0.6039822374::e_ksea("FYN", "AZD6482", inc) :- e_activity("FYN", "AZD6482", inc).
0.5536381833::e_ksea("FYN", "AZD6738", dec); 0.001::e_ksea("FYN", "AZD6738", inc) :- e_activity("FYN", "AZD6738", dec).
0.001::e_ksea("FYN", "AZD6738", dec); 0.5536381833::e_ksea("FYN", "AZD6738", inc) :- e_activity("FYN", "AZD6738", inc).
0.5391816905::e_ksea("FYN", "AZD8055", dec); 0.001::e_ksea("FYN", "AZD8055", inc) :- e_activity("FYN", "AZD8055", dec).
0.001::e_ksea("FYN", "AZD8055", dec); 0.5391816905::e_ksea("FYN", "AZD8055", inc) :- e_activity("FYN", "AZD8055", inc).
0.5762424359::e_ksea("FYN", "Amuvatinib", dec); 0.001::e_ksea("FYN", "Amuvatinib", inc) :- e_activity("FYN", "Amuvatinib", dec).
0.001::e_ksea("FYN", "Amuvatinib", dec); 0.5762424359::e_ksea("FYN", "Amuvatinib", inc) :- e_activity("FYN", "Amuvatinib", inc).
0.5430942116::e_ksea("FYN", "BX912", dec); 0.001::e_ksea("FYN", "BX912", inc) :- e_activity("FYN", "BX912", dec).
0.001::e_ksea("FYN", "BX912", dec); 0.5430942116::e_ksea("FYN", "BX912", inc) :- e_activity("FYN", "BX912", inc).
0.5766080345::e_ksea("FYN", "Bosutinib", dec); 0.001::e_ksea("FYN", "Bosutinib", inc) :- e_activity("FYN", "Bosutinib", dec).
0.001::e_ksea("FYN", "Bosutinib", dec); 0.5766080345::e_ksea("FYN", "Bosutinib", inc) :- e_activity("FYN", "Bosutinib", inc).
0.5268481345::e_ksea("FYN", "CAL101", dec); 0.001::e_ksea("FYN", "CAL101", inc) :- e_activity("FYN", "CAL101", dec).
0.001::e_ksea("FYN", "CAL101", dec); 0.5268481345::e_ksea("FYN", "CAL101", inc) :- e_activity("FYN", "CAL101", inc).
0.5558367322::e_ksea("FYN", "CHIR99021", dec); 0.001::e_ksea("FYN", "CHIR99021", inc) :- e_activity("FYN", "CHIR99021", dec).
0.001::e_ksea("FYN", "CHIR99021", dec); 0.5558367322::e_ksea("FYN", "CHIR99021", inc) :- e_activity("FYN", "CHIR99021", inc).
0.6636288622::e_ksea("FYN", "CX4945", dec); 0.001::e_ksea("FYN", "CX4945", inc) :- e_activity("FYN", "CX4945", dec).
0.001::e_ksea("FYN", "CX4945", dec); 0.6636288622::e_ksea("FYN", "CX4945", inc) :- e_activity("FYN", "CX4945", inc).
0.512609335::e_ksea("FYN", "DNAPK", dec); 0.001::e_ksea("FYN", "DNAPK", inc) :- e_activity("FYN", "DNAPK", dec).
0.001::e_ksea("FYN", "DNAPK", dec); 0.512609335::e_ksea("FYN", "DNAPK", inc) :- e_activity("FYN", "DNAPK", inc).
0.5719408425::e_ksea("FYN", "Dabrafenib", dec); 0.001::e_ksea("FYN", "Dabrafenib", inc) :- e_activity("FYN", "Dabrafenib", dec).
0.001::e_ksea("FYN", "Dabrafenib", dec); 0.5719408425::e_ksea("FYN", "Dabrafenib", inc) :- e_activity("FYN", "Dabrafenib", inc).
0.5137716479::e_ksea("FYN", "Dasatinib", dec); 0.001::e_ksea("FYN", "Dasatinib", inc) :- e_activity("FYN", "Dasatinib", dec).
0.001::e_ksea("FYN", "Dasatinib", dec); 0.5137716479::e_ksea("FYN", "Dasatinib", inc) :- e_activity("FYN", "Dasatinib", inc).
0.5067660209::e_ksea("FYN", "Edelfosine", dec); 0.001::e_ksea("FYN", "Edelfosine", inc) :- e_activity("FYN", "Edelfosine", dec).
0.001::e_ksea("FYN", "Edelfosine", dec); 0.5067660209::e_ksea("FYN", "Edelfosine", inc) :- e_activity("FYN", "Edelfosine", inc).
0.5489492068::e_ksea("FYN", "FRAX486", dec); 0.001::e_ksea("FYN", "FRAX486", inc) :- e_activity("FYN", "FRAX486", dec).
0.001::e_ksea("FYN", "FRAX486", dec); 0.5489492068::e_ksea("FYN", "FRAX486", inc) :- e_activity("FYN", "FRAX486", inc).
0.5340297006::e_ksea("FYN", "GDC0941", dec); 0.001::e_ksea("FYN", "GDC0941", inc) :- e_activity("FYN", "GDC0941", dec).
0.001::e_ksea("FYN", "GDC0941", dec); 0.5340297006::e_ksea("FYN", "GDC0941", inc) :- e_activity("FYN", "GDC0941", inc).
0.5498879271::e_ksea("FYN", "GDC0994", dec); 0.001::e_ksea("FYN", "GDC0994", inc) :- e_activity("FYN", "GDC0994", dec).
0.001::e_ksea("FYN", "GDC0994", dec); 0.5498879271::e_ksea("FYN", "GDC0994", inc) :- e_activity("FYN", "GDC0994", inc).
0.5294638521::e_ksea("FYN", "GF109203X", dec); 0.001::e_ksea("FYN", "GF109203X", inc) :- e_activity("FYN", "GF109203X", dec).
0.001::e_ksea("FYN", "GF109203X", dec); 0.5294638521::e_ksea("FYN", "GF109203X", inc) :- e_activity("FYN", "GF109203X", inc).
0.5161651135::e_ksea("FYN", "GO6983", dec); 0.001::e_ksea("FYN", "GO6983", inc) :- e_activity("FYN", "GO6983", dec).
0.001::e_ksea("FYN", "GO6983", dec); 0.5161651135::e_ksea("FYN", "GO6983", inc) :- e_activity("FYN", "GO6983", inc).
0.582957175::e_ksea("FYN", "GSK2334470", dec); 0.001::e_ksea("FYN", "GSK2334470", inc) :- e_activity("FYN", "GSK2334470", dec).
0.001::e_ksea("FYN", "GSK2334470", dec); 0.582957175::e_ksea("FYN", "GSK2334470", inc) :- e_activity("FYN", "GSK2334470", inc).
0.6185150698::e_ksea("FYN", "GSK690693", dec); 0.001::e_ksea("FYN", "GSK690693", inc) :- e_activity("FYN", "GSK690693", dec).
0.001::e_ksea("FYN", "GSK690693", dec); 0.6185150698::e_ksea("FYN", "GSK690693", inc) :- e_activity("FYN", "GSK690693", inc).
0.5148596375::e_ksea("FYN", "Go6976", dec); 0.001::e_ksea("FYN", "Go6976", inc) :- e_activity("FYN", "Go6976", dec).
0.001::e_ksea("FYN", "Go6976", dec); 0.5148596375::e_ksea("FYN", "Go6976", inc) :- e_activity("FYN", "Go6976", inc).
0.5155195935::e_ksea("FYN", "H89", dec); 0.001::e_ksea("FYN", "H89", inc) :- e_activity("FYN", "H89", dec).
0.001::e_ksea("FYN", "H89", dec); 0.5155195935::e_ksea("FYN", "H89", inc) :- e_activity("FYN", "H89", inc).
0.5091614616::e_ksea("FYN", "HS173", dec); 0.001::e_ksea("FYN", "HS173", inc) :- e_activity("FYN", "HS173", dec).
0.001::e_ksea("FYN", "HS173", dec); 0.5091614616::e_ksea("FYN", "HS173", inc) :- e_activity("FYN", "HS173", inc).
0.5528533203::e_ksea("FYN", "Ipatasertib", dec); 0.001::e_ksea("FYN", "Ipatasertib", inc) :- e_activity("FYN", "Ipatasertib", dec).
0.001::e_ksea("FYN", "Ipatasertib", dec); 0.5528533203::e_ksea("FYN", "Ipatasertib", inc) :- e_activity("FYN", "Ipatasertib", inc).
0.512347828::e_ksea("FYN", "JNJ", dec); 0.001::e_ksea("FYN", "JNJ", inc) :- e_activity("FYN", "JNJ", dec).
0.001::e_ksea("FYN", "JNJ", dec); 0.512347828::e_ksea("FYN", "JNJ", inc) :- e_activity("FYN", "JNJ", inc).
0.6600339354::e_ksea("FYN", "JNK", dec); 0.001::e_ksea("FYN", "JNK", inc) :- e_activity("FYN", "JNK", dec).
0.001::e_ksea("FYN", "JNK", dec); 0.6600339354::e_ksea("FYN", "JNK", inc) :- e_activity("FYN", "JNK", inc).
0.5809598896::e_ksea("FYN", "KD025", dec); 0.001::e_ksea("FYN", "KD025", inc) :- e_activity("FYN", "KD025", dec).
0.001::e_ksea("FYN", "KD025", dec); 0.5809598896::e_ksea("FYN", "KD025", inc) :- e_activity("FYN", "KD025", inc).
0.640569638::e_ksea("FYN", "KN62", dec); 0.001::e_ksea("FYN", "KN62", inc) :- e_activity("FYN", "KN62", dec).
0.001::e_ksea("FYN", "KN62", dec); 0.640569638::e_ksea("FYN", "KN62", inc) :- e_activity("FYN", "KN62", inc).
0.649603364::e_ksea("FYN", "KN93", dec); 0.001::e_ksea("FYN", "KN93", inc) :- e_activity("FYN", "KN93", dec).
0.001::e_ksea("FYN", "KN93", dec); 0.649603364::e_ksea("FYN", "KN93", inc) :- e_activity("FYN", "KN93", inc).
0.5332106407::e_ksea("FYN", "Ku0063794", dec); 0.001::e_ksea("FYN", "Ku0063794", inc) :- e_activity("FYN", "Ku0063794", dec).
0.001::e_ksea("FYN", "Ku0063794", dec); 0.5332106407::e_ksea("FYN", "Ku0063794", inc) :- e_activity("FYN", "Ku0063794", inc).
0.5454247443::e_ksea("FYN", "LY2090314", dec); 0.001::e_ksea("FYN", "LY2090314", inc) :- e_activity("FYN", "LY2090314", dec).
0.001::e_ksea("FYN", "LY2090314", dec); 0.5454247443::e_ksea("FYN", "LY2090314", inc) :- e_activity("FYN", "LY2090314", inc).
0.5816241186::e_ksea("FYN", "LY2584702", dec); 0.001::e_ksea("FYN", "LY2584702", inc) :- e_activity("FYN", "LY2584702", dec).
0.001::e_ksea("FYN", "LY2584702", dec); 0.5816241186::e_ksea("FYN", "LY2584702", inc) :- e_activity("FYN", "LY2584702", inc).
0.5663051864::e_ksea("FYN", "LY2835219", dec); 0.001::e_ksea("FYN", "LY2835219", inc) :- e_activity("FYN", "LY2835219", dec).
0.001::e_ksea("FYN", "LY2835219", dec); 0.5663051864::e_ksea("FYN", "LY2835219", inc) :- e_activity("FYN", "LY2835219", inc).
0.6497083091::e_ksea("FYN", "Linsitinib", dec); 0.001::e_ksea("FYN", "Linsitinib", inc) :- e_activity("FYN", "Linsitinib", dec).
0.001::e_ksea("FYN", "Linsitinib", dec); 0.6497083091::e_ksea("FYN", "Linsitinib", inc) :- e_activity("FYN", "Linsitinib", inc).
0.5887517184::e_ksea("FYN", "MK2206", dec); 0.001::e_ksea("FYN", "MK2206", inc) :- e_activity("FYN", "MK2206", dec).
0.001::e_ksea("FYN", "MK2206", dec); 0.5887517184::e_ksea("FYN", "MK2206", inc) :- e_activity("FYN", "MK2206", inc).
0.52111586::e_ksea("FYN", "NU7441", dec); 0.001::e_ksea("FYN", "NU7441", inc) :- e_activity("FYN", "NU7441", dec).
0.001::e_ksea("FYN", "NU7441", dec); 0.52111586::e_ksea("FYN", "NU7441", inc) :- e_activity("FYN", "NU7441", inc).
0.5164392129::e_ksea("FYN", "PD153035", dec); 0.001::e_ksea("FYN", "PD153035", inc) :- e_activity("FYN", "PD153035", dec).
0.001::e_ksea("FYN", "PD153035", dec); 0.5164392129::e_ksea("FYN", "PD153035", inc) :- e_activity("FYN", "PD153035", inc).
0.5039027526::e_ksea("FYN", "PF3758309", dec); 0.001::e_ksea("FYN", "PF3758309", inc) :- e_activity("FYN", "PF3758309", dec).
0.001::e_ksea("FYN", "PF3758309", dec); 0.5039027526::e_ksea("FYN", "PF3758309", inc) :- e_activity("FYN", "PF3758309", inc).
0.6133953136::e_ksea("FYN", "PF4708671", dec); 0.001::e_ksea("FYN", "PF4708671", inc) :- e_activity("FYN", "PF4708671", dec).
0.001::e_ksea("FYN", "PF4708671", dec); 0.6133953136::e_ksea("FYN", "PF4708671", inc) :- e_activity("FYN", "PF4708671", inc).
0.5276258595::e_ksea("FYN", "PH797804", dec); 0.001::e_ksea("FYN", "PH797804", inc) :- e_activity("FYN", "PH797804", dec).
0.001::e_ksea("FYN", "PH797804", dec); 0.5276258595::e_ksea("FYN", "PH797804", inc) :- e_activity("FYN", "PH797804", inc).
0.5217717051::e_ksea("FYN", "PIK294", dec); 0.001::e_ksea("FYN", "PIK294", inc) :- e_activity("FYN", "PIK294", dec).
0.001::e_ksea("FYN", "PIK294", dec); 0.5217717051::e_ksea("FYN", "PIK294", inc) :- e_activity("FYN", "PIK294", inc).
0.5243122783::e_ksea("FYN", "Ribociclib", dec); 0.001::e_ksea("FYN", "Ribociclib", inc) :- e_activity("FYN", "Ribociclib", dec).
0.001::e_ksea("FYN", "Ribociclib", dec); 0.5243122783::e_ksea("FYN", "Ribociclib", inc) :- e_activity("FYN", "Ribociclib", inc).
0.5851462475::e_ksea("FYN", "Ripasudil", dec); 0.001::e_ksea("FYN", "Ripasudil", inc) :- e_activity("FYN", "Ripasudil", dec).
0.001::e_ksea("FYN", "Ripasudil", dec); 0.5851462475::e_ksea("FYN", "Ripasudil", inc) :- e_activity("FYN", "Ripasudil", inc).
0.5143566088::e_ksea("FYN", "SP600125", dec); 0.001::e_ksea("FYN", "SP600125", inc) :- e_activity("FYN", "SP600125", dec).
0.001::e_ksea("FYN", "SP600125", dec); 0.5143566088::e_ksea("FYN", "SP600125", inc) :- e_activity("FYN", "SP600125", inc).
0.5199914289::e_ksea("FYN", "Selumetinib", dec); 0.001::e_ksea("FYN", "Selumetinib", inc) :- e_activity("FYN", "Selumetinib", dec).
0.001::e_ksea("FYN", "Selumetinib", dec); 0.5199914289::e_ksea("FYN", "Selumetinib", inc) :- e_activity("FYN", "Selumetinib", inc).
0.5169965583::e_ksea("FYN", "TAK715", dec); 0.001::e_ksea("FYN", "TAK715", inc) :- e_activity("FYN", "TAK715", dec).
0.001::e_ksea("FYN", "TAK715", dec); 0.5169965583::e_ksea("FYN", "TAK715", inc) :- e_activity("FYN", "TAK715", inc).
0.5694160402::e_ksea("FYN", "TBCA", dec); 0.001::e_ksea("FYN", "TBCA", inc) :- e_activity("FYN", "TBCA", dec).
0.001::e_ksea("FYN", "TBCA", dec); 0.5694160402::e_ksea("FYN", "TBCA", inc) :- e_activity("FYN", "TBCA", inc).
0.513298009::e_ksea("FYN", "TGX221", dec); 0.001::e_ksea("FYN", "TGX221", inc) :- e_activity("FYN", "TGX221", dec).
0.001::e_ksea("FYN", "TGX221", dec); 0.513298009::e_ksea("FYN", "TGX221", inc) :- e_activity("FYN", "TGX221", inc).
0.5661347359::e_ksea("FYN", "Tofacitinib", dec); 0.001::e_ksea("FYN", "Tofacitinib", inc) :- e_activity("FYN", "Tofacitinib", dec).
0.001::e_ksea("FYN", "Tofacitinib", dec); 0.5661347359::e_ksea("FYN", "Tofacitinib", inc) :- e_activity("FYN", "Tofacitinib", inc).
0.5860966226::e_ksea("FYN", "Torin", dec); 0.001::e_ksea("FYN", "Torin", inc) :- e_activity("FYN", "Torin", dec).
0.001::e_ksea("FYN", "Torin", dec); 0.5860966226::e_ksea("FYN", "Torin", inc) :- e_activity("FYN", "Torin", inc).
0.5519381353::e_ksea("FYN", "Trametinib", dec); 0.001::e_ksea("FYN", "Trametinib", inc) :- e_activity("FYN", "Trametinib", dec).
0.001::e_ksea("FYN", "Trametinib", dec); 0.5519381353::e_ksea("FYN", "Trametinib", inc) :- e_activity("FYN", "Trametinib", inc).
0.5063235369::e_ksea("FYN", "U73122", dec); 0.001::e_ksea("FYN", "U73122", inc) :- e_activity("FYN", "U73122", dec).
0.001::e_ksea("FYN", "U73122", dec); 0.5063235369::e_ksea("FYN", "U73122", inc) :- e_activity("FYN", "U73122", inc).
0.5067795973::e_ksea("FYN", "Ulixertinib", dec); 0.001::e_ksea("FYN", "Ulixertinib", inc) :- e_activity("FYN", "Ulixertinib", dec).
0.001::e_ksea("FYN", "Ulixertinib", dec); 0.5067795973::e_ksea("FYN", "Ulixertinib", inc) :- e_activity("FYN", "Ulixertinib", inc).
0.5416674681::e_ksea("FYN", "Vemurafenib", dec); 0.001::e_ksea("FYN", "Vemurafenib", inc) :- e_activity("FYN", "Vemurafenib", dec).
0.001::e_ksea("FYN", "Vemurafenib", dec); 0.5416674681::e_ksea("FYN", "Vemurafenib", inc) :- e_activity("FYN", "Vemurafenib", inc).
0.6553190115::e_ksea("HIPK2", "AC220", dec); 0.001::e_ksea("HIPK2", "AC220", inc) :- e_activity("HIPK2", "AC220", dec).
0.001::e_ksea("HIPK2", "AC220", dec); 0.6553190115::e_ksea("HIPK2", "AC220", inc) :- e_activity("HIPK2", "AC220", inc).
0.6997085147::e_ksea("HIPK2", "AT13148", dec); 0.001::e_ksea("HIPK2", "AT13148", inc) :- e_activity("HIPK2", "AT13148", dec).
0.001::e_ksea("HIPK2", "AT13148", dec); 0.6997085147::e_ksea("HIPK2", "AT13148", inc) :- e_activity("HIPK2", "AT13148", inc).
0.6635592463::e_ksea("HIPK2", "AZ20", dec); 0.001::e_ksea("HIPK2", "AZ20", inc) :- e_activity("HIPK2", "AZ20", dec).
0.001::e_ksea("HIPK2", "AZ20", dec); 0.6635592463::e_ksea("HIPK2", "AZ20", inc) :- e_activity("HIPK2", "AZ20", inc).
0.9677231675::e_ksea("HIPK2", "AZD1480", dec); 0.001::e_ksea("HIPK2", "AZD1480", inc) :- e_activity("HIPK2", "AZD1480", dec).
0.001::e_ksea("HIPK2", "AZD1480", dec); 0.9677231675::e_ksea("HIPK2", "AZD1480", inc) :- e_activity("HIPK2", "AZD1480", inc).
0.8762329773::e_ksea("HIPK2", "AZD3759", dec); 0.001::e_ksea("HIPK2", "AZD3759", inc) :- e_activity("HIPK2", "AZD3759", dec).
0.001::e_ksea("HIPK2", "AZD3759", dec); 0.8762329773::e_ksea("HIPK2", "AZD3759", inc) :- e_activity("HIPK2", "AZD3759", inc).
0.9828710672::e_ksea("HIPK2", "AZD5363", dec); 0.001::e_ksea("HIPK2", "AZD5363", inc) :- e_activity("HIPK2", "AZD5363", dec).
0.001::e_ksea("HIPK2", "AZD5363", dec); 0.9828710672::e_ksea("HIPK2", "AZD5363", inc) :- e_activity("HIPK2", "AZD5363", inc).
0.9969426482::e_ksea("HIPK2", "AZD5438", dec); 0.001::e_ksea("HIPK2", "AZD5438", inc) :- e_activity("HIPK2", "AZD5438", dec).
0.001::e_ksea("HIPK2", "AZD5438", dec); 0.9969426482::e_ksea("HIPK2", "AZD5438", inc) :- e_activity("HIPK2", "AZD5438", inc).
0.7665624122::e_ksea("HIPK2", "AZD6482", dec); 0.001::e_ksea("HIPK2", "AZD6482", inc) :- e_activity("HIPK2", "AZD6482", dec).
0.001::e_ksea("HIPK2", "AZD6482", dec); 0.7665624122::e_ksea("HIPK2", "AZD6482", inc) :- e_activity("HIPK2", "AZD6482", inc).
0.800736786::e_ksea("HIPK2", "AZD6738", dec); 0.001::e_ksea("HIPK2", "AZD6738", inc) :- e_activity("HIPK2", "AZD6738", dec).
0.001::e_ksea("HIPK2", "AZD6738", dec); 0.800736786::e_ksea("HIPK2", "AZD6738", inc) :- e_activity("HIPK2", "AZD6738", inc).
0.7409364393::e_ksea("HIPK2", "AZD8055", dec); 0.001::e_ksea("HIPK2", "AZD8055", inc) :- e_activity("HIPK2", "AZD8055", dec).
0.001::e_ksea("HIPK2", "AZD8055", dec); 0.7409364393::e_ksea("HIPK2", "AZD8055", inc) :- e_activity("HIPK2", "AZD8055", inc).
0.538589258::e_ksea("HIPK2", "Amuvatinib", dec); 0.001::e_ksea("HIPK2", "Amuvatinib", inc) :- e_activity("HIPK2", "Amuvatinib", dec).
0.001::e_ksea("HIPK2", "Amuvatinib", dec); 0.538589258::e_ksea("HIPK2", "Amuvatinib", inc) :- e_activity("HIPK2", "Amuvatinib", inc).
0.9382765504::e_ksea("HIPK2", "BX912", dec); 0.001::e_ksea("HIPK2", "BX912", inc) :- e_activity("HIPK2", "BX912", dec).
0.001::e_ksea("HIPK2", "BX912", dec); 0.9382765504::e_ksea("HIPK2", "BX912", inc) :- e_activity("HIPK2", "BX912", inc).
0.6865094106::e_ksea("HIPK2", "Bosutinib", dec); 0.001::e_ksea("HIPK2", "Bosutinib", inc) :- e_activity("HIPK2", "Bosutinib", dec).
0.001::e_ksea("HIPK2", "Bosutinib", dec); 0.6865094106::e_ksea("HIPK2", "Bosutinib", inc) :- e_activity("HIPK2", "Bosutinib", inc).
0.6960164585::e_ksea("HIPK2", "CAL101", dec); 0.001::e_ksea("HIPK2", "CAL101", inc) :- e_activity("HIPK2", "CAL101", dec).
0.001::e_ksea("HIPK2", "CAL101", dec); 0.6960164585::e_ksea("HIPK2", "CAL101", inc) :- e_activity("HIPK2", "CAL101", inc).
0.9081403298::e_ksea("HIPK2", "CHIR99021", dec); 0.001::e_ksea("HIPK2", "CHIR99021", inc) :- e_activity("HIPK2", "CHIR99021", dec).
0.001::e_ksea("HIPK2", "CHIR99021", dec); 0.9081403298::e_ksea("HIPK2", "CHIR99021", inc) :- e_activity("HIPK2", "CHIR99021", inc).
0.9003559256::e_ksea("HIPK2", "CX4945", dec); 0.001::e_ksea("HIPK2", "CX4945", inc) :- e_activity("HIPK2", "CX4945", dec).
0.001::e_ksea("HIPK2", "CX4945", dec); 0.9003559256::e_ksea("HIPK2", "CX4945", inc) :- e_activity("HIPK2", "CX4945", inc).
0.5381890675::e_ksea("HIPK2", "DNAPK", dec); 0.001::e_ksea("HIPK2", "DNAPK", inc) :- e_activity("HIPK2", "DNAPK", dec).
0.001::e_ksea("HIPK2", "DNAPK", dec); 0.5381890675::e_ksea("HIPK2", "DNAPK", inc) :- e_activity("HIPK2", "DNAPK", inc).
0.6201157088::e_ksea("HIPK2", "Dabrafenib", dec); 0.001::e_ksea("HIPK2", "Dabrafenib", inc) :- e_activity("HIPK2", "Dabrafenib", dec).
0.001::e_ksea("HIPK2", "Dabrafenib", dec); 0.6201157088::e_ksea("HIPK2", "Dabrafenib", inc) :- e_activity("HIPK2", "Dabrafenib", inc).
0.6947195394::e_ksea("HIPK2", "Dasatinib", dec); 0.001::e_ksea("HIPK2", "Dasatinib", inc) :- e_activity("HIPK2", "Dasatinib", dec).
0.001::e_ksea("HIPK2", "Dasatinib", dec); 0.6947195394::e_ksea("HIPK2", "Dasatinib", inc) :- e_activity("HIPK2", "Dasatinib", inc).
0.6397120502::e_ksea("HIPK2", "Edelfosine", dec); 0.001::e_ksea("HIPK2", "Edelfosine", inc) :- e_activity("HIPK2", "Edelfosine", dec).
0.001::e_ksea("HIPK2", "Edelfosine", dec); 0.6397120502::e_ksea("HIPK2", "Edelfosine", inc) :- e_activity("HIPK2", "Edelfosine", inc).
0.9724415195::e_ksea("HIPK2", "FRAX486", dec); 0.001::e_ksea("HIPK2", "FRAX486", inc) :- e_activity("HIPK2", "FRAX486", dec).
0.001::e_ksea("HIPK2", "FRAX486", dec); 0.9724415195::e_ksea("HIPK2", "FRAX486", inc) :- e_activity("HIPK2", "FRAX486", inc).
0.9487606991::e_ksea("HIPK2", "GDC0941", dec); 0.001::e_ksea("HIPK2", "GDC0941", inc) :- e_activity("HIPK2", "GDC0941", dec).
0.001::e_ksea("HIPK2", "GDC0941", dec); 0.9487606991::e_ksea("HIPK2", "GDC0941", inc) :- e_activity("HIPK2", "GDC0941", inc).
0.9155674249::e_ksea("HIPK2", "GDC0994", dec); 0.001::e_ksea("HIPK2", "GDC0994", inc) :- e_activity("HIPK2", "GDC0994", dec).
0.001::e_ksea("HIPK2", "GDC0994", dec); 0.9155674249::e_ksea("HIPK2", "GDC0994", inc) :- e_activity("HIPK2", "GDC0994", inc).
0.8429374691::e_ksea("HIPK2", "GF109203X", dec); 0.001::e_ksea("HIPK2", "GF109203X", inc) :- e_activity("HIPK2", "GF109203X", dec).
0.001::e_ksea("HIPK2", "GF109203X", dec); 0.8429374691::e_ksea("HIPK2", "GF109203X", inc) :- e_activity("HIPK2", "GF109203X", inc).
0.8914446399::e_ksea("HIPK2", "GO6983", dec); 0.001::e_ksea("HIPK2", "GO6983", inc) :- e_activity("HIPK2", "GO6983", dec).
0.001::e_ksea("HIPK2", "GO6983", dec); 0.8914446399::e_ksea("HIPK2", "GO6983", inc) :- e_activity("HIPK2", "GO6983", inc).
0.8673607778::e_ksea("HIPK2", "GSK2334470", dec); 0.001::e_ksea("HIPK2", "GSK2334470", inc) :- e_activity("HIPK2", "GSK2334470", dec).
0.001::e_ksea("HIPK2", "GSK2334470", dec); 0.8673607778::e_ksea("HIPK2", "GSK2334470", inc) :- e_activity("HIPK2", "GSK2334470", inc).
0.6912901887::e_ksea("HIPK2", "GSK690693", dec); 0.001::e_ksea("HIPK2", "GSK690693", inc) :- e_activity("HIPK2", "GSK690693", dec).
0.001::e_ksea("HIPK2", "GSK690693", dec); 0.6912901887::e_ksea("HIPK2", "GSK690693", inc) :- e_activity("HIPK2", "GSK690693", inc).
0.7820057793::e_ksea("HIPK2", "Go6976", dec); 0.001::e_ksea("HIPK2", "Go6976", inc) :- e_activity("HIPK2", "Go6976", dec).
0.001::e_ksea("HIPK2", "Go6976", dec); 0.7820057793::e_ksea("HIPK2", "Go6976", inc) :- e_activity("HIPK2", "Go6976", inc).
0.748977283::e_ksea("HIPK2", "H89", dec); 0.001::e_ksea("HIPK2", "H89", inc) :- e_activity("HIPK2", "H89", dec).
0.001::e_ksea("HIPK2", "H89", dec); 0.748977283::e_ksea("HIPK2", "H89", inc) :- e_activity("HIPK2", "H89", inc).
0.7783728185::e_ksea("HIPK2", "HS173", dec); 0.001::e_ksea("HIPK2", "HS173", inc) :- e_activity("HIPK2", "HS173", dec).
0.001::e_ksea("HIPK2", "HS173", dec); 0.7783728185::e_ksea("HIPK2", "HS173", inc) :- e_activity("HIPK2", "HS173", inc).
0.894519261::e_ksea("HIPK2", "Ipatasertib", dec); 0.001::e_ksea("HIPK2", "Ipatasertib", inc) :- e_activity("HIPK2", "Ipatasertib", dec).
0.001::e_ksea("HIPK2", "Ipatasertib", dec); 0.894519261::e_ksea("HIPK2", "Ipatasertib", inc) :- e_activity("HIPK2", "Ipatasertib", inc).
0.8124943588::e_ksea("HIPK2", "JNJ", dec); 0.001::e_ksea("HIPK2", "JNJ", inc) :- e_activity("HIPK2", "JNJ", dec).
0.001::e_ksea("HIPK2", "JNJ", dec); 0.8124943588::e_ksea("HIPK2", "JNJ", inc) :- e_activity("HIPK2", "JNJ", inc).
0.6759710154::e_ksea("HIPK2", "JNK", dec); 0.001::e_ksea("HIPK2", "JNK", inc) :- e_activity("HIPK2", "JNK", dec).
0.001::e_ksea("HIPK2", "JNK", dec); 0.6759710154::e_ksea("HIPK2", "JNK", inc) :- e_activity("HIPK2", "JNK", inc).
0.8011783318::e_ksea("HIPK2", "KD025", dec); 0.001::e_ksea("HIPK2", "KD025", inc) :- e_activity("HIPK2", "KD025", dec).
0.001::e_ksea("HIPK2", "KD025", dec); 0.8011783318::e_ksea("HIPK2", "KD025", inc) :- e_activity("HIPK2", "KD025", inc).
0.9389679477::e_ksea("HIPK2", "KN62", dec); 0.001::e_ksea("HIPK2", "KN62", inc) :- e_activity("HIPK2", "KN62", dec).
0.001::e_ksea("HIPK2", "KN62", dec); 0.9389679477::e_ksea("HIPK2", "KN62", inc) :- e_activity("HIPK2", "KN62", inc).
0.7397988295::e_ksea("HIPK2", "KN93", dec); 0.001::e_ksea("HIPK2", "KN93", inc) :- e_activity("HIPK2", "KN93", dec).
0.001::e_ksea("HIPK2", "KN93", dec); 0.7397988295::e_ksea("HIPK2", "KN93", inc) :- e_activity("HIPK2", "KN93", inc).
0.741362278::e_ksea("HIPK2", "Ku0063794", dec); 0.001::e_ksea("HIPK2", "Ku0063794", inc) :- e_activity("HIPK2", "Ku0063794", dec).
0.001::e_ksea("HIPK2", "Ku0063794", dec); 0.741362278::e_ksea("HIPK2", "Ku0063794", inc) :- e_activity("HIPK2", "Ku0063794", inc).
0.9630966691::e_ksea("HIPK2", "LY2090314", dec); 0.001::e_ksea("HIPK2", "LY2090314", inc) :- e_activity("HIPK2", "LY2090314", dec).
0.001::e_ksea("HIPK2", "LY2090314", dec); 0.9630966691::e_ksea("HIPK2", "LY2090314", inc) :- e_activity("HIPK2", "LY2090314", inc).
0.89451467::e_ksea("HIPK2", "LY2584702", dec); 0.001::e_ksea("HIPK2", "LY2584702", inc) :- e_activity("HIPK2", "LY2584702", dec).
0.001::e_ksea("HIPK2", "LY2584702", dec); 0.89451467::e_ksea("HIPK2", "LY2584702", inc) :- e_activity("HIPK2", "LY2584702", inc).
0.5218748103::e_ksea("HIPK2", "LY2835219", dec); 0.001::e_ksea("HIPK2", "LY2835219", inc) :- e_activity("HIPK2", "LY2835219", dec).
0.001::e_ksea("HIPK2", "LY2835219", dec); 0.5218748103::e_ksea("HIPK2", "LY2835219", inc) :- e_activity("HIPK2", "LY2835219", inc).
0.5804494528::e_ksea("HIPK2", "Linsitinib", dec); 0.001::e_ksea("HIPK2", "Linsitinib", inc) :- e_activity("HIPK2", "Linsitinib", dec).
0.001::e_ksea("HIPK2", "Linsitinib", dec); 0.5804494528::e_ksea("HIPK2", "Linsitinib", inc) :- e_activity("HIPK2", "Linsitinib", inc).
0.5812803016::e_ksea("HIPK2", "MK2206", dec); 0.001::e_ksea("HIPK2", "MK2206", inc) :- e_activity("HIPK2", "MK2206", dec).
0.001::e_ksea("HIPK2", "MK2206", dec); 0.5812803016::e_ksea("HIPK2", "MK2206", inc) :- e_activity("HIPK2", "MK2206", inc).
0.5537785546::e_ksea("HIPK2", "NU7441", dec); 0.001::e_ksea("HIPK2", "NU7441", inc) :- e_activity("HIPK2", "NU7441", dec).
0.001::e_ksea("HIPK2", "NU7441", dec); 0.5537785546::e_ksea("HIPK2", "NU7441", inc) :- e_activity("HIPK2", "NU7441", inc).
0.6920539252::e_ksea("HIPK2", "PD153035", dec); 0.001::e_ksea("HIPK2", "PD153035", inc) :- e_activity("HIPK2", "PD153035", dec).
0.001::e_ksea("HIPK2", "PD153035", dec); 0.6920539252::e_ksea("HIPK2", "PD153035", inc) :- e_activity("HIPK2", "PD153035", inc).
0.9938242968::e_ksea("HIPK2", "PF3758309", dec); 0.001::e_ksea("HIPK2", "PF3758309", inc) :- e_activity("HIPK2", "PF3758309", dec).
0.001::e_ksea("HIPK2", "PF3758309", dec); 0.9938242968::e_ksea("HIPK2", "PF3758309", inc) :- e_activity("HIPK2", "PF3758309", inc).
0.7845279583::e_ksea("HIPK2", "PF4708671", dec); 0.001::e_ksea("HIPK2", "PF4708671", inc) :- e_activity("HIPK2", "PF4708671", dec).
0.001::e_ksea("HIPK2", "PF4708671", dec); 0.7845279583::e_ksea("HIPK2", "PF4708671", inc) :- e_activity("HIPK2", "PF4708671", inc).
0.5911922898::e_ksea("HIPK2", "PH797804", dec); 0.001::e_ksea("HIPK2", "PH797804", inc) :- e_activity("HIPK2", "PH797804", dec).
0.001::e_ksea("HIPK2", "PH797804", dec); 0.5911922898::e_ksea("HIPK2", "PH797804", inc) :- e_activity("HIPK2", "PH797804", inc).
0.9173055527::e_ksea("HIPK2", "PIK294", dec); 0.001::e_ksea("HIPK2", "PIK294", inc) :- e_activity("HIPK2", "PIK294", dec).
0.001::e_ksea("HIPK2", "PIK294", dec); 0.9173055527::e_ksea("HIPK2", "PIK294", inc) :- e_activity("HIPK2", "PIK294", inc).
0.5363949299::e_ksea("HIPK2", "Ribociclib", dec); 0.001::e_ksea("HIPK2", "Ribociclib", inc) :- e_activity("HIPK2", "Ribociclib", dec).
0.001::e_ksea("HIPK2", "Ribociclib", dec); 0.5363949299::e_ksea("HIPK2", "Ribociclib", inc) :- e_activity("HIPK2", "Ribociclib", inc).
0.9293111409::e_ksea("HIPK2", "Ripasudil", dec); 0.001::e_ksea("HIPK2", "Ripasudil", inc) :- e_activity("HIPK2", "Ripasudil", dec).
0.001::e_ksea("HIPK2", "Ripasudil", dec); 0.9293111409::e_ksea("HIPK2", "Ripasudil", inc) :- e_activity("HIPK2", "Ripasudil", inc).
0.8827635392::e_ksea("HIPK2", "SP600125", dec); 0.001::e_ksea("HIPK2", "SP600125", inc) :- e_activity("HIPK2", "SP600125", dec).
0.001::e_ksea("HIPK2", "SP600125", dec); 0.8827635392::e_ksea("HIPK2", "SP600125", inc) :- e_activity("HIPK2", "SP600125", inc).
0.5729050063::e_ksea("HIPK2", "Selumetinib", dec); 0.001::e_ksea("HIPK2", "Selumetinib", inc) :- e_activity("HIPK2", "Selumetinib", dec).
0.001::e_ksea("HIPK2", "Selumetinib", dec); 0.5729050063::e_ksea("HIPK2", "Selumetinib", inc) :- e_activity("HIPK2", "Selumetinib", inc).
0.799291612::e_ksea("HIPK2", "TAK715", dec); 0.001::e_ksea("HIPK2", "TAK715", inc) :- e_activity("HIPK2", "TAK715", dec).
0.001::e_ksea("HIPK2", "TAK715", dec); 0.799291612::e_ksea("HIPK2", "TAK715", inc) :- e_activity("HIPK2", "TAK715", inc).
0.6976976554::e_ksea("HIPK2", "TBCA", dec); 0.001::e_ksea("HIPK2", "TBCA", inc) :- e_activity("HIPK2", "TBCA", dec).
0.001::e_ksea("HIPK2", "TBCA", dec); 0.6976976554::e_ksea("HIPK2", "TBCA", inc) :- e_activity("HIPK2", "TBCA", inc).
0.8085446594::e_ksea("HIPK2", "TGX221", dec); 0.001::e_ksea("HIPK2", "TGX221", inc) :- e_activity("HIPK2", "TGX221", dec).
0.001::e_ksea("HIPK2", "TGX221", dec); 0.8085446594::e_ksea("HIPK2", "TGX221", inc) :- e_activity("HIPK2", "TGX221", inc).
0.6533948008::e_ksea("HIPK2", "Tofacitinib", dec); 0.001::e_ksea("HIPK2", "Tofacitinib", inc) :- e_activity("HIPK2", "Tofacitinib", dec).
0.001::e_ksea("HIPK2", "Tofacitinib", dec); 0.6533948008::e_ksea("HIPK2", "Tofacitinib", inc) :- e_activity("HIPK2", "Tofacitinib", inc).
0.5681831743::e_ksea("HIPK2", "Torin", dec); 0.001::e_ksea("HIPK2", "Torin", inc) :- e_activity("HIPK2", "Torin", dec).
0.001::e_ksea("HIPK2", "Torin", dec); 0.5681831743::e_ksea("HIPK2", "Torin", inc) :- e_activity("HIPK2", "Torin", inc).
0.7623752575::e_ksea("HIPK2", "Trametinib", dec); 0.001::e_ksea("HIPK2", "Trametinib", inc) :- e_activity("HIPK2", "Trametinib", dec).
0.001::e_ksea("HIPK2", "Trametinib", dec); 0.7623752575::e_ksea("HIPK2", "Trametinib", inc) :- e_activity("HIPK2", "Trametinib", inc).
0.5684267976::e_ksea("HIPK2", "U73122", dec); 0.001::e_ksea("HIPK2", "U73122", inc) :- e_activity("HIPK2", "U73122", dec).
0.001::e_ksea("HIPK2", "U73122", dec); 0.5684267976::e_ksea("HIPK2", "U73122", inc) :- e_activity("HIPK2", "U73122", inc).
0.5681954321::e_ksea("HIPK2", "Ulixertinib", dec); 0.001::e_ksea("HIPK2", "Ulixertinib", inc) :- e_activity("HIPK2", "Ulixertinib", dec).
0.001::e_ksea("HIPK2", "Ulixertinib", dec); 0.5681954321::e_ksea("HIPK2", "Ulixertinib", inc) :- e_activity("HIPK2", "Ulixertinib", inc).
0.6276624615::e_ksea("HIPK2", "Vemurafenib", dec); 0.001::e_ksea("HIPK2", "Vemurafenib", inc) :- e_activity("HIPK2", "Vemurafenib", dec).
0.001::e_ksea("HIPK2", "Vemurafenib", dec); 0.6276624615::e_ksea("HIPK2", "Vemurafenib", inc) :- e_activity("HIPK2", "Vemurafenib", inc).
0.5069575613::e_ksea("PTK2", "AC220", dec); 0.001::e_ksea("PTK2", "AC220", inc) :- e_activity("PTK2", "AC220", dec).
0.001::e_ksea("PTK2", "AC220", dec); 0.5069575613::e_ksea("PTK2", "AC220", inc) :- e_activity("PTK2", "AC220", inc).
0.667007332::e_ksea("PTK2", "AT13148", dec); 0.001::e_ksea("PTK2", "AT13148", inc) :- e_activity("PTK2", "AT13148", dec).
0.001::e_ksea("PTK2", "AT13148", dec); 0.667007332::e_ksea("PTK2", "AT13148", inc) :- e_activity("PTK2", "AT13148", inc).
0.6651862864::e_ksea("PTK2", "AZ20", dec); 0.001::e_ksea("PTK2", "AZ20", inc) :- e_activity("PTK2", "AZ20", dec).
0.001::e_ksea("PTK2", "AZ20", dec); 0.6651862864::e_ksea("PTK2", "AZ20", inc) :- e_activity("PTK2", "AZ20", inc).
0.7937734951::e_ksea("PTK2", "AZD1480", dec); 0.001::e_ksea("PTK2", "AZD1480", inc) :- e_activity("PTK2", "AZD1480", dec).
0.001::e_ksea("PTK2", "AZD1480", dec); 0.7937734951::e_ksea("PTK2", "AZD1480", inc) :- e_activity("PTK2", "AZD1480", inc).
0.7393868597::e_ksea("PTK2", "AZD3759", dec); 0.001::e_ksea("PTK2", "AZD3759", inc) :- e_activity("PTK2", "AZD3759", dec).
0.001::e_ksea("PTK2", "AZD3759", dec); 0.7393868597::e_ksea("PTK2", "AZD3759", inc) :- e_activity("PTK2", "AZD3759", inc).
0.7920848235::e_ksea("PTK2", "AZD5363", dec); 0.001::e_ksea("PTK2", "AZD5363", inc) :- e_activity("PTK2", "AZD5363", dec).
0.001::e_ksea("PTK2", "AZD5363", dec); 0.7920848235::e_ksea("PTK2", "AZD5363", inc) :- e_activity("PTK2", "AZD5363", inc).
0.5289208728::e_ksea("PTK2", "AZD5438", dec); 0.001::e_ksea("PTK2", "AZD5438", inc) :- e_activity("PTK2", "AZD5438", dec).
0.001::e_ksea("PTK2", "AZD5438", dec); 0.5289208728::e_ksea("PTK2", "AZD5438", inc) :- e_activity("PTK2", "AZD5438", inc).
0.7615577458::e_ksea("PTK2", "AZD6482", dec); 0.001::e_ksea("PTK2", "AZD6482", inc) :- e_activity("PTK2", "AZD6482", dec).
0.001::e_ksea("PTK2", "AZD6482", dec); 0.7615577458::e_ksea("PTK2", "AZD6482", inc) :- e_activity("PTK2", "AZD6482", inc).
0.6129638986::e_ksea("PTK2", "AZD6738", dec); 0.001::e_ksea("PTK2", "AZD6738", inc) :- e_activity("PTK2", "AZD6738", dec).
0.001::e_ksea("PTK2", "AZD6738", dec); 0.6129638986::e_ksea("PTK2", "AZD6738", inc) :- e_activity("PTK2", "AZD6738", inc).
0.7430982987::e_ksea("PTK2", "AZD8055", dec); 0.001::e_ksea("PTK2", "AZD8055", inc) :- e_activity("PTK2", "AZD8055", dec).
0.001::e_ksea("PTK2", "AZD8055", dec); 0.7430982987::e_ksea("PTK2", "AZD8055", inc) :- e_activity("PTK2", "AZD8055", inc).
0.593696762::e_ksea("PTK2", "Amuvatinib", dec); 0.001::e_ksea("PTK2", "Amuvatinib", inc) :- e_activity("PTK2", "Amuvatinib", dec).
0.001::e_ksea("PTK2", "Amuvatinib", dec); 0.593696762::e_ksea("PTK2", "Amuvatinib", inc) :- e_activity("PTK2", "Amuvatinib", inc).
0.793759227::e_ksea("PTK2", "BX912", dec); 0.001::e_ksea("PTK2", "BX912", inc) :- e_activity("PTK2", "BX912", dec).
0.001::e_ksea("PTK2", "BX912", dec); 0.793759227::e_ksea("PTK2", "BX912", inc) :- e_activity("PTK2", "BX912", inc).
0.5522212103::e_ksea("PTK2", "Bosutinib", dec); 0.001::e_ksea("PTK2", "Bosutinib", inc) :- e_activity("PTK2", "Bosutinib", dec).
0.001::e_ksea("PTK2", "Bosutinib", dec); 0.5522212103::e_ksea("PTK2", "Bosutinib", inc) :- e_activity("PTK2", "Bosutinib", inc).
0.6724733627::e_ksea("PTK2", "CAL101", dec); 0.001::e_ksea("PTK2", "CAL101", inc) :- e_activity("PTK2", "CAL101", dec).
0.001::e_ksea("PTK2", "CAL101", dec); 0.6724733627::e_ksea("PTK2", "CAL101", inc) :- e_activity("PTK2", "CAL101", inc).
0.676040444::e_ksea("PTK2", "CHIR99021", dec); 0.001::e_ksea("PTK2", "CHIR99021", inc) :- e_activity("PTK2", "CHIR99021", dec).
0.001::e_ksea("PTK2", "CHIR99021", dec); 0.676040444::e_ksea("PTK2", "CHIR99021", inc) :- e_activity("PTK2", "CHIR99021", inc).
0.591101047::e_ksea("PTK2", "CX4945", dec); 0.001::e_ksea("PTK2", "CX4945", inc) :- e_activity("PTK2", "CX4945", dec).
0.001::e_ksea("PTK2", "CX4945", dec); 0.591101047::e_ksea("PTK2", "CX4945", inc) :- e_activity("PTK2", "CX4945", inc).
0.6262898028::e_ksea("PTK2", "DNAPK", dec); 0.001::e_ksea("PTK2", "DNAPK", inc) :- e_activity("PTK2", "DNAPK", dec).
0.001::e_ksea("PTK2", "DNAPK", dec); 0.6262898028::e_ksea("PTK2", "DNAPK", inc) :- e_activity("PTK2", "DNAPK", inc).
0.6685337249::e_ksea("PTK2", "Dabrafenib", dec); 0.001::e_ksea("PTK2", "Dabrafenib", inc) :- e_activity("PTK2", "Dabrafenib", dec).
0.001::e_ksea("PTK2", "Dabrafenib", dec); 0.6685337249::e_ksea("PTK2", "Dabrafenib", inc) :- e_activity("PTK2", "Dabrafenib", inc).
0.5395296847::e_ksea("PTK2", "Dasatinib", dec); 0.001::e_ksea("PTK2", "Dasatinib", inc) :- e_activity("PTK2", "Dasatinib", dec).
0.001::e_ksea("PTK2", "Dasatinib", dec); 0.5395296847::e_ksea("PTK2", "Dasatinib", inc) :- e_activity("PTK2", "Dasatinib", inc).
0.5843132984::e_ksea("PTK2", "Edelfosine", dec); 0.001::e_ksea("PTK2", "Edelfosine", inc) :- e_activity("PTK2", "Edelfosine", dec).
0.001::e_ksea("PTK2", "Edelfosine", dec); 0.5843132984::e_ksea("PTK2", "Edelfosine", inc) :- e_activity("PTK2", "Edelfosine", inc).
0.6638302942::e_ksea("PTK2", "FRAX486", dec); 0.001::e_ksea("PTK2", "FRAX486", inc) :- e_activity("PTK2", "FRAX486", dec).
0.001::e_ksea("PTK2", "FRAX486", dec); 0.6638302942::e_ksea("PTK2", "FRAX486", inc) :- e_activity("PTK2", "FRAX486", inc).
0.6848377562::e_ksea("PTK2", "GDC0941", dec); 0.001::e_ksea("PTK2", "GDC0941", inc) :- e_activity("PTK2", "GDC0941", dec).
0.001::e_ksea("PTK2", "GDC0941", dec); 0.6848377562::e_ksea("PTK2", "GDC0941", inc) :- e_activity("PTK2", "GDC0941", inc).
0.7758153631::e_ksea("PTK2", "GDC0994", dec); 0.001::e_ksea("PTK2", "GDC0994", inc) :- e_activity("PTK2", "GDC0994", dec).
0.001::e_ksea("PTK2", "GDC0994", dec); 0.7758153631::e_ksea("PTK2", "GDC0994", inc) :- e_activity("PTK2", "GDC0994", inc).
0.6549173::e_ksea("PTK2", "GF109203X", dec); 0.001::e_ksea("PTK2", "GF109203X", inc) :- e_activity("PTK2", "GF109203X", dec).
0.001::e_ksea("PTK2", "GF109203X", dec); 0.6549173::e_ksea("PTK2", "GF109203X", inc) :- e_activity("PTK2", "GF109203X", inc).
0.5266752915::e_ksea("PTK2", "GO6983", dec); 0.001::e_ksea("PTK2", "GO6983", inc) :- e_activity("PTK2", "GO6983", dec).
0.001::e_ksea("PTK2", "GO6983", dec); 0.5266752915::e_ksea("PTK2", "GO6983", inc) :- e_activity("PTK2", "GO6983", inc).
0.7945430752::e_ksea("PTK2", "GSK2334470", dec); 0.001::e_ksea("PTK2", "GSK2334470", inc) :- e_activity("PTK2", "GSK2334470", dec).
0.001::e_ksea("PTK2", "GSK2334470", dec); 0.7945430752::e_ksea("PTK2", "GSK2334470", inc) :- e_activity("PTK2", "GSK2334470", inc).
0.5473377275::e_ksea("PTK2", "GSK690693", dec); 0.001::e_ksea("PTK2", "GSK690693", inc) :- e_activity("PTK2", "GSK690693", dec).
0.001::e_ksea("PTK2", "GSK690693", dec); 0.5473377275::e_ksea("PTK2", "GSK690693", inc) :- e_activity("PTK2", "GSK690693", inc).
0.6249148146::e_ksea("PTK2", "Go6976", dec); 0.001::e_ksea("PTK2", "Go6976", inc) :- e_activity("PTK2", "Go6976", dec).
0.001::e_ksea("PTK2", "Go6976", dec); 0.6249148146::e_ksea("PTK2", "Go6976", inc) :- e_activity("PTK2", "Go6976", inc).
0.5936989525::e_ksea("PTK2", "H89", dec); 0.001::e_ksea("PTK2", "H89", inc) :- e_activity("PTK2", "H89", dec).
0.001::e_ksea("PTK2", "H89", dec); 0.5936989525::e_ksea("PTK2", "H89", inc) :- e_activity("PTK2", "H89", inc).
0.5320785006::e_ksea("PTK2", "HS173", dec); 0.001::e_ksea("PTK2", "HS173", inc) :- e_activity("PTK2", "HS173", dec).
0.001::e_ksea("PTK2", "HS173", dec); 0.5320785006::e_ksea("PTK2", "HS173", inc) :- e_activity("PTK2", "HS173", inc).
0.7980858302::e_ksea("PTK2", "Ipatasertib", dec); 0.001::e_ksea("PTK2", "Ipatasertib", inc) :- e_activity("PTK2", "Ipatasertib", dec).
0.001::e_ksea("PTK2", "Ipatasertib", dec); 0.7980858302::e_ksea("PTK2", "Ipatasertib", inc) :- e_activity("PTK2", "Ipatasertib", inc).
0.6082048383::e_ksea("PTK2", "JNJ", dec); 0.001::e_ksea("PTK2", "JNJ", inc) :- e_activity("PTK2", "JNJ", dec).
0.001::e_ksea("PTK2", "JNJ", dec); 0.6082048383::e_ksea("PTK2", "JNJ", inc) :- e_activity("PTK2", "JNJ", inc).
0.6676523098::e_ksea("PTK2", "JNK", dec); 0.001::e_ksea("PTK2", "JNK", inc) :- e_activity("PTK2", "JNK", dec).
0.001::e_ksea("PTK2", "JNK", dec); 0.6676523098::e_ksea("PTK2", "JNK", inc) :- e_activity("PTK2", "JNK", inc).
0.7460550485::e_ksea("PTK2", "KD025", dec); 0.001::e_ksea("PTK2", "KD025", inc) :- e_activity("PTK2", "KD025", dec).
0.001::e_ksea("PTK2", "KD025", dec); 0.7460550485::e_ksea("PTK2", "KD025", inc) :- e_activity("PTK2", "KD025", inc).
0.7288251245::e_ksea("PTK2", "KN62", dec); 0.001::e_ksea("PTK2", "KN62", inc) :- e_activity("PTK2", "KN62", dec).
0.001::e_ksea("PTK2", "KN62", dec); 0.7288251245::e_ksea("PTK2", "KN62", inc) :- e_activity("PTK2", "KN62", inc).
0.5593325159::e_ksea("PTK2", "KN93", dec); 0.001::e_ksea("PTK2", "KN93", inc) :- e_activity("PTK2", "KN93", dec).
0.001::e_ksea("PTK2", "KN93", dec); 0.5593325159::e_ksea("PTK2", "KN93", inc) :- e_activity("PTK2", "KN93", inc).
0.5596283211::e_ksea("PTK2", "Ku0063794", dec); 0.001::e_ksea("PTK2", "Ku0063794", inc) :- e_activity("PTK2", "Ku0063794", dec).
0.001::e_ksea("PTK2", "Ku0063794", dec); 0.5596283211::e_ksea("PTK2", "Ku0063794", inc) :- e_activity("PTK2", "Ku0063794", inc).
0.7766443351::e_ksea("PTK2", "LY2090314", dec); 0.001::e_ksea("PTK2", "LY2090314", inc) :- e_activity("PTK2", "LY2090314", dec).
0.001::e_ksea("PTK2", "LY2090314", dec); 0.7766443351::e_ksea("PTK2", "LY2090314", inc) :- e_activity("PTK2", "LY2090314", inc).
0.7701833478::e_ksea("PTK2", "LY2584702", dec); 0.001::e_ksea("PTK2", "LY2584702", inc) :- e_activity("PTK2", "LY2584702", dec).
0.001::e_ksea("PTK2", "LY2584702", dec); 0.7701833478::e_ksea("PTK2", "LY2584702", inc) :- e_activity("PTK2", "LY2584702", inc).
0.6907706244::e_ksea("PTK2", "LY2835219", dec); 0.001::e_ksea("PTK2", "LY2835219", inc) :- e_activity("PTK2", "LY2835219", dec).
0.001::e_ksea("PTK2", "LY2835219", dec); 0.6907706244::e_ksea("PTK2", "LY2835219", inc) :- e_activity("PTK2", "LY2835219", inc).
0.6467485453::e_ksea("PTK2", "Linsitinib", dec); 0.001::e_ksea("PTK2", "Linsitinib", inc) :- e_activity("PTK2", "Linsitinib", dec).
0.001::e_ksea("PTK2", "Linsitinib", dec); 0.6467485453::e_ksea("PTK2", "Linsitinib", inc) :- e_activity("PTK2", "Linsitinib", inc).
0.5955677101::e_ksea("PTK2", "MK2206", dec); 0.001::e_ksea("PTK2", "MK2206", inc) :- e_activity("PTK2", "MK2206", dec).
0.001::e_ksea("PTK2", "MK2206", dec); 0.5955677101::e_ksea("PTK2", "MK2206", inc) :- e_activity("PTK2", "MK2206", inc).
0.6941820839::e_ksea("PTK2", "NU7441", dec); 0.001::e_ksea("PTK2", "NU7441", inc) :- e_activity("PTK2", "NU7441", dec).
0.001::e_ksea("PTK2", "NU7441", dec); 0.6941820839::e_ksea("PTK2", "NU7441", inc) :- e_activity("PTK2", "NU7441", inc).
0.7026022484::e_ksea("PTK2", "PD153035", dec); 0.001::e_ksea("PTK2", "PD153035", inc) :- e_activity("PTK2", "PD153035", dec).
0.001::e_ksea("PTK2", "PD153035", dec); 0.7026022484::e_ksea("PTK2", "PD153035", inc) :- e_activity("PTK2", "PD153035", inc).
0.5857641637::e_ksea("PTK2", "PF3758309", dec); 0.001::e_ksea("PTK2", "PF3758309", inc) :- e_activity("PTK2", "PF3758309", dec).
0.001::e_ksea("PTK2", "PF3758309", dec); 0.5857641637::e_ksea("PTK2", "PF3758309", inc) :- e_activity("PTK2", "PF3758309", inc).
0.534002158::e_ksea("PTK2", "PF4708671", dec); 0.001::e_ksea("PTK2", "PF4708671", inc) :- e_activity("PTK2", "PF4708671", dec).
0.001::e_ksea("PTK2", "PF4708671", dec); 0.534002158::e_ksea("PTK2", "PF4708671", inc) :- e_activity("PTK2", "PF4708671", inc).
0.5586751693::e_ksea("PTK2", "PH797804", dec); 0.001::e_ksea("PTK2", "PH797804", inc) :- e_activity("PTK2", "PH797804", dec).
0.001::e_ksea("PTK2", "PH797804", dec); 0.5586751693::e_ksea("PTK2", "PH797804", inc) :- e_activity("PTK2", "PH797804", inc).
0.6968906619::e_ksea("PTK2", "PIK294", dec); 0.001::e_ksea("PTK2", "PIK294", inc) :- e_activity("PTK2", "PIK294", dec).
0.001::e_ksea("PTK2", "PIK294", dec); 0.6968906619::e_ksea("PTK2", "PIK294", inc) :- e_activity("PTK2", "PIK294", inc).
0.73583891::e_ksea("PTK2", "Ribociclib", dec); 0.001::e_ksea("PTK2", "Ribociclib", inc) :- e_activity("PTK2", "Ribociclib", dec).
0.001::e_ksea("PTK2", "Ribociclib", dec); 0.73583891::e_ksea("PTK2", "Ribociclib", inc) :- e_activity("PTK2", "Ribociclib", inc).
0.6116557546::e_ksea("PTK2", "Ripasudil", dec); 0.001::e_ksea("PTK2", "Ripasudil", inc) :- e_activity("PTK2", "Ripasudil", dec).
0.001::e_ksea("PTK2", "Ripasudil", dec); 0.6116557546::e_ksea("PTK2", "Ripasudil", inc) :- e_activity("PTK2", "Ripasudil", inc).
0.5832103715::e_ksea("PTK2", "SP600125", dec); 0.001::e_ksea("PTK2", "SP600125", inc) :- e_activity("PTK2", "SP600125", dec).
0.001::e_ksea("PTK2", "SP600125", dec); 0.5832103715::e_ksea("PTK2", "SP600125", inc) :- e_activity("PTK2", "SP600125", inc).
0.6506957211::e_ksea("PTK2", "Selumetinib", dec); 0.001::e_ksea("PTK2", "Selumetinib", inc) :- e_activity("PTK2", "Selumetinib", dec).
0.001::e_ksea("PTK2", "Selumetinib", dec); 0.6506957211::e_ksea("PTK2", "Selumetinib", inc) :- e_activity("PTK2", "Selumetinib", inc).
0.7865489971::e_ksea("PTK2", "TAK715", dec); 0.001::e_ksea("PTK2", "TAK715", inc) :- e_activity("PTK2", "TAK715", dec).
0.001::e_ksea("PTK2", "TAK715", dec); 0.7865489971::e_ksea("PTK2", "TAK715", inc) :- e_activity("PTK2", "TAK715", inc).
0.6655478718::e_ksea("PTK2", "TBCA", dec); 0.001::e_ksea("PTK2", "TBCA", inc) :- e_activity("PTK2", "TBCA", dec).
0.001::e_ksea("PTK2", "TBCA", dec); 0.6655478718::e_ksea("PTK2", "TBCA", inc) :- e_activity("PTK2", "TBCA", inc).
0.6514608621::e_ksea("PTK2", "TGX221", dec); 0.001::e_ksea("PTK2", "TGX221", inc) :- e_activity("PTK2", "TGX221", dec).
0.001::e_ksea("PTK2", "TGX221", dec); 0.6514608621::e_ksea("PTK2", "TGX221", inc) :- e_activity("PTK2", "TGX221", inc).
0.7908692874::e_ksea("PTK2", "Tofacitinib", dec); 0.001::e_ksea("PTK2", "Tofacitinib", inc) :- e_activity("PTK2", "Tofacitinib", dec).
0.001::e_ksea("PTK2", "Tofacitinib", dec); 0.7908692874::e_ksea("PTK2", "Tofacitinib", inc) :- e_activity("PTK2", "Tofacitinib", inc).
0.5480494176::e_ksea("PTK2", "Torin", dec); 0.001::e_ksea("PTK2", "Torin", inc) :- e_activity("PTK2", "Torin", dec).
0.001::e_ksea("PTK2", "Torin", dec); 0.5480494176::e_ksea("PTK2", "Torin", inc) :- e_activity("PTK2", "Torin", inc).
0.5449014849::e_ksea("PTK2", "Trametinib", dec); 0.001::e_ksea("PTK2", "Trametinib", inc) :- e_activity("PTK2", "Trametinib", dec).
0.001::e_ksea("PTK2", "Trametinib", dec); 0.5449014849::e_ksea("PTK2", "Trametinib", inc) :- e_activity("PTK2", "Trametinib", inc).
0.5536301271::e_ksea("PTK2", "U73122", dec); 0.001::e_ksea("PTK2", "U73122", inc) :- e_activity("PTK2", "U73122", dec).
0.001::e_ksea("PTK2", "U73122", dec); 0.5536301271::e_ksea("PTK2", "U73122", inc) :- e_activity("PTK2", "U73122", inc).
0.5146613814::e_ksea("PTK2", "Ulixertinib", dec); 0.001::e_ksea("PTK2", "Ulixertinib", inc) :- e_activity("PTK2", "Ulixertinib", dec).
0.001::e_ksea("PTK2", "Ulixertinib", dec); 0.5146613814::e_ksea("PTK2", "Ulixertinib", inc) :- e_activity("PTK2", "Ulixertinib", inc).
0.7201071798::e_ksea("PTK2", "Vemurafenib", dec); 0.001::e_ksea("PTK2", "Vemurafenib", inc) :- e_activity("PTK2", "Vemurafenib", dec).
0.001::e_ksea("PTK2", "Vemurafenib", dec); 0.7201071798::e_ksea("PTK2", "Vemurafenib", inc) :- e_activity("PTK2", "Vemurafenib", inc).
0.5205207774::e_ksea("PTK6", "AC220", dec); 0.001::e_ksea("PTK6", "AC220", inc) :- e_activity("PTK6", "AC220", dec).
0.001::e_ksea("PTK6", "AC220", dec); 0.5205207774::e_ksea("PTK6", "AC220", inc) :- e_activity("PTK6", "AC220", inc).
0.6742028734::e_ksea("PTK6", "AT13148", dec); 0.001::e_ksea("PTK6", "AT13148", inc) :- e_activity("PTK6", "AT13148", dec).
0.001::e_ksea("PTK6", "AT13148", dec); 0.6742028734::e_ksea("PTK6", "AT13148", inc) :- e_activity("PTK6", "AT13148", inc).
0.6529386761::e_ksea("PTK6", "AZ20", dec); 0.001::e_ksea("PTK6", "AZ20", inc) :- e_activity("PTK6", "AZ20", dec).
0.001::e_ksea("PTK6", "AZ20", dec); 0.6529386761::e_ksea("PTK6", "AZ20", inc) :- e_activity("PTK6", "AZ20", inc).
0.6891464008::e_ksea("PTK6", "AZD1480", dec); 0.001::e_ksea("PTK6", "AZD1480", inc) :- e_activity("PTK6", "AZD1480", dec).
0.001::e_ksea("PTK6", "AZD1480", dec); 0.6891464008::e_ksea("PTK6", "AZD1480", inc) :- e_activity("PTK6", "AZD1480", inc).
0.7578207981::e_ksea("PTK6", "AZD3759", dec); 0.001::e_ksea("PTK6", "AZD3759", inc) :- e_activity("PTK6", "AZD3759", dec).
0.001::e_ksea("PTK6", "AZD3759", dec); 0.7578207981::e_ksea("PTK6", "AZD3759", inc) :- e_activity("PTK6", "AZD3759", inc).
0.7273289957::e_ksea("PTK6", "AZD5363", dec); 0.001::e_ksea("PTK6", "AZD5363", inc) :- e_activity("PTK6", "AZD5363", dec).
0.001::e_ksea("PTK6", "AZD5363", dec); 0.7273289957::e_ksea("PTK6", "AZD5363", inc) :- e_activity("PTK6", "AZD5363", inc).
0.5737145809::e_ksea("PTK6", "AZD5438", dec); 0.001::e_ksea("PTK6", "AZD5438", inc) :- e_activity("PTK6", "AZD5438", dec).
0.001::e_ksea("PTK6", "AZD5438", dec); 0.5737145809::e_ksea("PTK6", "AZD5438", inc) :- e_activity("PTK6", "AZD5438", inc).
0.5687978426::e_ksea("PTK6", "AZD6482", dec); 0.001::e_ksea("PTK6", "AZD6482", inc) :- e_activity("PTK6", "AZD6482", dec).
0.001::e_ksea("PTK6", "AZD6482", dec); 0.5687978426::e_ksea("PTK6", "AZD6482", inc) :- e_activity("PTK6", "AZD6482", inc).
0.6951569461::e_ksea("PTK6", "AZD6738", dec); 0.001::e_ksea("PTK6", "AZD6738", inc) :- e_activity("PTK6", "AZD6738", dec).
0.001::e_ksea("PTK6", "AZD6738", dec); 0.6951569461::e_ksea("PTK6", "AZD6738", inc) :- e_activity("PTK6", "AZD6738", inc).
0.6028265116::e_ksea("PTK6", "AZD8055", dec); 0.001::e_ksea("PTK6", "AZD8055", inc) :- e_activity("PTK6", "AZD8055", dec).
0.001::e_ksea("PTK6", "AZD8055", dec); 0.6028265116::e_ksea("PTK6", "AZD8055", inc) :- e_activity("PTK6", "AZD8055", inc).
0.6325014746::e_ksea("PTK6", "Amuvatinib", dec); 0.001::e_ksea("PTK6", "Amuvatinib", inc) :- e_activity("PTK6", "Amuvatinib", dec).
0.001::e_ksea("PTK6", "Amuvatinib", dec); 0.6325014746::e_ksea("PTK6", "Amuvatinib", inc) :- e_activity("PTK6", "Amuvatinib", inc).
0.6928136257::e_ksea("PTK6", "BX912", dec); 0.001::e_ksea("PTK6", "BX912", inc) :- e_activity("PTK6", "BX912", dec).
0.001::e_ksea("PTK6", "BX912", dec); 0.6928136257::e_ksea("PTK6", "BX912", inc) :- e_activity("PTK6", "BX912", inc).
0.741669992::e_ksea("PTK6", "Bosutinib", dec); 0.001::e_ksea("PTK6", "Bosutinib", inc) :- e_activity("PTK6", "Bosutinib", dec).
0.001::e_ksea("PTK6", "Bosutinib", dec); 0.741669992::e_ksea("PTK6", "Bosutinib", inc) :- e_activity("PTK6", "Bosutinib", inc).
0.519182646::e_ksea("PTK6", "CAL101", dec); 0.001::e_ksea("PTK6", "CAL101", inc) :- e_activity("PTK6", "CAL101", dec).
0.001::e_ksea("PTK6", "CAL101", dec); 0.519182646::e_ksea("PTK6", "CAL101", inc) :- e_activity("PTK6", "CAL101", inc).
0.7307105817::e_ksea("PTK6", "CHIR99021", dec); 0.001::e_ksea("PTK6", "CHIR99021", inc) :- e_activity("PTK6", "CHIR99021", dec).
0.001::e_ksea("PTK6", "CHIR99021", dec); 0.7307105817::e_ksea("PTK6", "CHIR99021", inc) :- e_activity("PTK6", "CHIR99021", inc).
0.7716697345::e_ksea("PTK6", "CX4945", dec); 0.001::e_ksea("PTK6", "CX4945", inc) :- e_activity("PTK6", "CX4945", dec).
0.001::e_ksea("PTK6", "CX4945", dec); 0.7716697345::e_ksea("PTK6", "CX4945", inc) :- e_activity("PTK6", "CX4945", inc).
0.7543637876::e_ksea("PTK6", "DNAPK", dec); 0.001::e_ksea("PTK6", "DNAPK", inc) :- e_activity("PTK6", "DNAPK", dec).
0.001::e_ksea("PTK6", "DNAPK", dec); 0.7543637876::e_ksea("PTK6", "DNAPK", inc) :- e_activity("PTK6", "DNAPK", inc).
0.7070444247::e_ksea("PTK6", "Dabrafenib", dec); 0.001::e_ksea("PTK6", "Dabrafenib", inc) :- e_activity("PTK6", "Dabrafenib", dec).
0.001::e_ksea("PTK6", "Dabrafenib", dec); 0.7070444247::e_ksea("PTK6", "Dabrafenib", inc) :- e_activity("PTK6", "Dabrafenib", inc).
0.7155040569::e_ksea("PTK6", "Dasatinib", dec); 0.001::e_ksea("PTK6", "Dasatinib", inc) :- e_activity("PTK6", "Dasatinib", dec).
0.001::e_ksea("PTK6", "Dasatinib", dec); 0.7155040569::e_ksea("PTK6", "Dasatinib", inc) :- e_activity("PTK6", "Dasatinib", inc).
0.5958405484::e_ksea("PTK6", "Edelfosine", dec); 0.001::e_ksea("PTK6", "Edelfosine", inc) :- e_activity("PTK6", "Edelfosine", dec).
0.001::e_ksea("PTK6", "Edelfosine", dec); 0.5958405484::e_ksea("PTK6", "Edelfosine", inc) :- e_activity("PTK6", "Edelfosine", inc).
0.6041371096::e_ksea("PTK6", "FRAX486", dec); 0.001::e_ksea("PTK6", "FRAX486", inc) :- e_activity("PTK6", "FRAX486", dec).
0.001::e_ksea("PTK6", "FRAX486", dec); 0.6041371096::e_ksea("PTK6", "FRAX486", inc) :- e_activity("PTK6", "FRAX486", inc).
0.5469266676::e_ksea("PTK6", "GDC0941", dec); 0.001::e_ksea("PTK6", "GDC0941", inc) :- e_activity("PTK6", "GDC0941", dec).
0.001::e_ksea("PTK6", "GDC0941", dec); 0.5469266676::e_ksea("PTK6", "GDC0941", inc) :- e_activity("PTK6", "GDC0941", inc).
0.6449096136::e_ksea("PTK6", "GDC0994", dec); 0.001::e_ksea("PTK6", "GDC0994", inc) :- e_activity("PTK6", "GDC0994", dec).
0.001::e_ksea("PTK6", "GDC0994", dec); 0.6449096136::e_ksea("PTK6", "GDC0994", inc) :- e_activity("PTK6", "GDC0994", inc).
0.7150665578::e_ksea("PTK6", "GF109203X", dec); 0.001::e_ksea("PTK6", "GF109203X", inc) :- e_activity("PTK6", "GF109203X", dec).
0.001::e_ksea("PTK6", "GF109203X", dec); 0.7150665578::e_ksea("PTK6", "GF109203X", inc) :- e_activity("PTK6", "GF109203X", inc).
0.6529374861::e_ksea("PTK6", "GO6983", dec); 0.001::e_ksea("PTK6", "GO6983", inc) :- e_activity("PTK6", "GO6983", dec).
0.001::e_ksea("PTK6", "GO6983", dec); 0.6529374861::e_ksea("PTK6", "GO6983", inc) :- e_activity("PTK6", "GO6983", inc).
0.6236287599::e_ksea("PTK6", "GSK2334470", dec); 0.001::e_ksea("PTK6", "GSK2334470", inc) :- e_activity("PTK6", "GSK2334470", dec).
0.001::e_ksea("PTK6", "GSK2334470", dec); 0.6236287599::e_ksea("PTK6", "GSK2334470", inc) :- e_activity("PTK6", "GSK2334470", inc).
0.7520203098::e_ksea("PTK6", "GSK690693", dec); 0.001::e_ksea("PTK6", "GSK690693", inc) :- e_activity("PTK6", "GSK690693", dec).
0.001::e_ksea("PTK6", "GSK690693", dec); 0.7520203098::e_ksea("PTK6", "GSK690693", inc) :- e_activity("PTK6", "GSK690693", inc).
0.6018966626::e_ksea("PTK6", "Go6976", dec); 0.001::e_ksea("PTK6", "Go6976", inc) :- e_activity("PTK6", "Go6976", dec).
0.001::e_ksea("PTK6", "Go6976", dec); 0.6018966626::e_ksea("PTK6", "Go6976", inc) :- e_activity("PTK6", "Go6976", inc).
0.7656721249::e_ksea("PTK6", "H89", dec); 0.001::e_ksea("PTK6", "H89", inc) :- e_activity("PTK6", "H89", dec).
0.001::e_ksea("PTK6", "H89", dec); 0.7656721249::e_ksea("PTK6", "H89", inc) :- e_activity("PTK6", "H89", inc).
0.7434731196::e_ksea("PTK6", "HS173", dec); 0.001::e_ksea("PTK6", "HS173", inc) :- e_activity("PTK6", "HS173", dec).
0.001::e_ksea("PTK6", "HS173", dec); 0.7434731196::e_ksea("PTK6", "HS173", inc) :- e_activity("PTK6", "HS173", inc).
0.6713605978::e_ksea("PTK6", "Ipatasertib", dec); 0.001::e_ksea("PTK6", "Ipatasertib", inc) :- e_activity("PTK6", "Ipatasertib", dec).
0.001::e_ksea("PTK6", "Ipatasertib", dec); 0.6713605978::e_ksea("PTK6", "Ipatasertib", inc) :- e_activity("PTK6", "Ipatasertib", inc).
0.6931944195::e_ksea("PTK6", "JNJ", dec); 0.001::e_ksea("PTK6", "JNJ", inc) :- e_activity("PTK6", "JNJ", dec).
0.001::e_ksea("PTK6", "JNJ", dec); 0.6931944195::e_ksea("PTK6", "JNJ", inc) :- e_activity("PTK6", "JNJ", inc).
0.5276729095::e_ksea("PTK6", "JNK", dec); 0.001::e_ksea("PTK6", "JNK", inc) :- e_activity("PTK6", "JNK", dec).
0.001::e_ksea("PTK6", "JNK", dec); 0.5276729095::e_ksea("PTK6", "JNK", inc) :- e_activity("PTK6", "JNK", inc).
0.6646582131::e_ksea("PTK6", "KD025", dec); 0.001::e_ksea("PTK6", "KD025", inc) :- e_activity("PTK6", "KD025", dec).
0.001::e_ksea("PTK6", "KD025", dec); 0.6646582131::e_ksea("PTK6", "KD025", inc) :- e_activity("PTK6", "KD025", inc).
0.7602153169::e_ksea("PTK6", "KN62", dec); 0.001::e_ksea("PTK6", "KN62", inc) :- e_activity("PTK6", "KN62", dec).
0.001::e_ksea("PTK6", "KN62", dec); 0.7602153169::e_ksea("PTK6", "KN62", inc) :- e_activity("PTK6", "KN62", inc).
0.6940867717::e_ksea("PTK6", "KN93", dec); 0.001::e_ksea("PTK6", "KN93", inc) :- e_activity("PTK6", "KN93", dec).
0.001::e_ksea("PTK6", "KN93", dec); 0.6940867717::e_ksea("PTK6", "KN93", inc) :- e_activity("PTK6", "KN93", inc).
0.7268673068::e_ksea("PTK6", "Ku0063794", dec); 0.001::e_ksea("PTK6", "Ku0063794", inc) :- e_activity("PTK6", "Ku0063794", dec).
0.001::e_ksea("PTK6", "Ku0063794", dec); 0.7268673068::e_ksea("PTK6", "Ku0063794", inc) :- e_activity("PTK6", "Ku0063794", inc).
0.7238303173::e_ksea("PTK6", "LY2090314", dec); 0.001::e_ksea("PTK6", "LY2090314", inc) :- e_activity("PTK6", "LY2090314", dec).
0.001::e_ksea("PTK6", "LY2090314", dec); 0.7238303173::e_ksea("PTK6", "LY2090314", inc) :- e_activity("PTK6", "LY2090314", inc).
0.6617745833::e_ksea("PTK6", "LY2584702", dec); 0.001::e_ksea("PTK6", "LY2584702", inc) :- e_activity("PTK6", "LY2584702", dec).
0.001::e_ksea("PTK6", "LY2584702", dec); 0.6617745833::e_ksea("PTK6", "LY2584702", inc) :- e_activity("PTK6", "LY2584702", inc).
0.7311642185::e_ksea("PTK6", "LY2835219", dec); 0.001::e_ksea("PTK6", "LY2835219", inc) :- e_activity("PTK6", "LY2835219", dec).
0.001::e_ksea("PTK6", "LY2835219", dec); 0.7311642185::e_ksea("PTK6", "LY2835219", inc) :- e_activity("PTK6", "LY2835219", inc).
0.7547917323::e_ksea("PTK6", "Linsitinib", dec); 0.001::e_ksea("PTK6", "Linsitinib", inc) :- e_activity("PTK6", "Linsitinib", dec).
0.001::e_ksea("PTK6", "Linsitinib", dec); 0.7547917323::e_ksea("PTK6", "Linsitinib", inc) :- e_activity("PTK6", "Linsitinib", inc).
0.6664926693::e_ksea("PTK6", "MK2206", dec); 0.001::e_ksea("PTK6", "MK2206", inc) :- e_activity("PTK6", "MK2206", dec).
0.001::e_ksea("PTK6", "MK2206", dec); 0.6664926693::e_ksea("PTK6", "MK2206", inc) :- e_activity("PTK6", "MK2206", inc).
0.624444611::e_ksea("PTK6", "NU7441", dec); 0.001::e_ksea("PTK6", "NU7441", inc) :- e_activity("PTK6", "NU7441", dec).
0.001::e_ksea("PTK6", "NU7441", dec); 0.624444611::e_ksea("PTK6", "NU7441", inc) :- e_activity("PTK6", "NU7441", inc).
0.7658462829::e_ksea("PTK6", "PD153035", dec); 0.001::e_ksea("PTK6", "PD153035", inc) :- e_activity("PTK6", "PD153035", dec).
0.001::e_ksea("PTK6", "PD153035", dec); 0.7658462829::e_ksea("PTK6", "PD153035", inc) :- e_activity("PTK6", "PD153035", inc).
0.5367601693::e_ksea("PTK6", "PF3758309", dec); 0.001::e_ksea("PTK6", "PF3758309", inc) :- e_activity("PTK6", "PF3758309", dec).
0.001::e_ksea("PTK6", "PF3758309", dec); 0.5367601693::e_ksea("PTK6", "PF3758309", inc) :- e_activity("PTK6", "PF3758309", inc).
0.5383340809::e_ksea("PTK6", "PF4708671", dec); 0.001::e_ksea("PTK6", "PF4708671", inc) :- e_activity("PTK6", "PF4708671", dec).
0.001::e_ksea("PTK6", "PF4708671", dec); 0.5383340809::e_ksea("PTK6", "PF4708671", inc) :- e_activity("PTK6", "PF4708671", inc).
0.5085472372::e_ksea("PTK6", "PH797804", dec); 0.001::e_ksea("PTK6", "PH797804", inc) :- e_activity("PTK6", "PH797804", dec).
0.001::e_ksea("PTK6", "PH797804", dec); 0.5085472372::e_ksea("PTK6", "PH797804", inc) :- e_activity("PTK6", "PH797804", inc).
0.6195685071::e_ksea("PTK6", "PIK294", dec); 0.001::e_ksea("PTK6", "PIK294", inc) :- e_activity("PTK6", "PIK294", dec).
0.001::e_ksea("PTK6", "PIK294", dec); 0.6195685071::e_ksea("PTK6", "PIK294", inc) :- e_activity("PTK6", "PIK294", inc).
0.663012212::e_ksea("PTK6", "Ribociclib", dec); 0.001::e_ksea("PTK6", "Ribociclib", inc) :- e_activity("PTK6", "Ribociclib", dec).
0.001::e_ksea("PTK6", "Ribociclib", dec); 0.663012212::e_ksea("PTK6", "Ribociclib", inc) :- e_activity("PTK6", "Ribociclib", inc).
0.5464830696::e_ksea("PTK6", "Ripasudil", dec); 0.001::e_ksea("PTK6", "Ripasudil", inc) :- e_activity("PTK6", "Ripasudil", dec).
0.001::e_ksea("PTK6", "Ripasudil", dec); 0.5464830696::e_ksea("PTK6", "Ripasudil", inc) :- e_activity("PTK6", "Ripasudil", inc).
0.60778855::e_ksea("PTK6", "SP600125", dec); 0.001::e_ksea("PTK6", "SP600125", inc) :- e_activity("PTK6", "SP600125", dec).
0.001::e_ksea("PTK6", "SP600125", dec); 0.60778855::e_ksea("PTK6", "SP600125", inc) :- e_activity("PTK6", "SP600125", inc).
0.5021470037::e_ksea("PTK6", "Selumetinib", dec); 0.001::e_ksea("PTK6", "Selumetinib", inc) :- e_activity("PTK6", "Selumetinib", dec).
0.001::e_ksea("PTK6", "Selumetinib", dec); 0.5021470037::e_ksea("PTK6", "Selumetinib", inc) :- e_activity("PTK6", "Selumetinib", inc).
0.5633697231::e_ksea("PTK6", "TAK715", dec); 0.001::e_ksea("PTK6", "TAK715", inc) :- e_activity("PTK6", "TAK715", dec).
0.001::e_ksea("PTK6", "TAK715", dec); 0.5633697231::e_ksea("PTK6", "TAK715", inc) :- e_activity("PTK6", "TAK715", inc).
0.6597348661::e_ksea("PTK6", "TBCA", dec); 0.001::e_ksea("PTK6", "TBCA", inc) :- e_activity("PTK6", "TBCA", dec).
0.001::e_ksea("PTK6", "TBCA", dec); 0.6597348661::e_ksea("PTK6", "TBCA", inc) :- e_activity("PTK6", "TBCA", inc).
0.5768145793::e_ksea("PTK6", "TGX221", dec); 0.001::e_ksea("PTK6", "TGX221", inc) :- e_activity("PTK6", "TGX221", dec).
0.001::e_ksea("PTK6", "TGX221", dec); 0.5768145793::e_ksea("PTK6", "TGX221", inc) :- e_activity("PTK6", "TGX221", inc).
0.6611277215::e_ksea("PTK6", "Tofacitinib", dec); 0.001::e_ksea("PTK6", "Tofacitinib", inc) :- e_activity("PTK6", "Tofacitinib", dec).
0.001::e_ksea("PTK6", "Tofacitinib", dec); 0.6611277215::e_ksea("PTK6", "Tofacitinib", inc) :- e_activity("PTK6", "Tofacitinib", inc).
0.6138706928::e_ksea("PTK6", "Torin", dec); 0.001::e_ksea("PTK6", "Torin", inc) :- e_activity("PTK6", "Torin", dec).
0.001::e_ksea("PTK6", "Torin", dec); 0.6138706928::e_ksea("PTK6", "Torin", inc) :- e_activity("PTK6", "Torin", inc).
0.7037266421::e_ksea("PTK6", "Trametinib", dec); 0.001::e_ksea("PTK6", "Trametinib", inc) :- e_activity("PTK6", "Trametinib", dec).
0.001::e_ksea("PTK6", "Trametinib", dec); 0.7037266421::e_ksea("PTK6", "Trametinib", inc) :- e_activity("PTK6", "Trametinib", inc).
0.5941488162::e_ksea("PTK6", "U73122", dec); 0.001::e_ksea("PTK6", "U73122", inc) :- e_activity("PTK6", "U73122", dec).
0.001::e_ksea("PTK6", "U73122", dec); 0.5941488162::e_ksea("PTK6", "U73122", inc) :- e_activity("PTK6", "U73122", inc).
0.5241638393::e_ksea("PTK6", "Ulixertinib", dec); 0.001::e_ksea("PTK6", "Ulixertinib", inc) :- e_activity("PTK6", "Ulixertinib", dec).
0.001::e_ksea("PTK6", "Ulixertinib", dec); 0.5241638393::e_ksea("PTK6", "Ulixertinib", inc) :- e_activity("PTK6", "Ulixertinib", inc).
0.7056873132::e_ksea("PTK6", "Vemurafenib", dec); 0.001::e_ksea("PTK6", "Vemurafenib", inc) :- e_activity("PTK6", "Vemurafenib", dec).
0.001::e_ksea("PTK6", "Vemurafenib", dec); 0.7056873132::e_ksea("PTK6", "Vemurafenib", inc) :- e_activity("PTK6", "Vemurafenib", inc).
0.5994749034::e_ksea("PTPRG", "AC220", dec); 0.001::e_ksea("PTPRG", "AC220", inc) :- e_activity("PTPRG", "AC220", dec).
0.001::e_ksea("PTPRG", "AC220", dec); 0.5994749034::e_ksea("PTPRG", "AC220", inc) :- e_activity("PTPRG", "AC220", inc).
0.5867333314::e_ksea("PTPRG", "AT13148", dec); 0.001::e_ksea("PTPRG", "AT13148", inc) :- e_activity("PTPRG", "AT13148", dec).
0.001::e_ksea("PTPRG", "AT13148", dec); 0.5867333314::e_ksea("PTPRG", "AT13148", inc) :- e_activity("PTPRG", "AT13148", inc).
0.5196142857::e_ksea("PTPRG", "AZ20", dec); 0.001::e_ksea("PTPRG", "AZ20", inc) :- e_activity("PTPRG", "AZ20", dec).
0.001::e_ksea("PTPRG", "AZ20", dec); 0.5196142857::e_ksea("PTPRG", "AZ20", inc) :- e_activity("PTPRG", "AZ20", inc).
0.6949489803::e_ksea("PTPRG", "AZD1480", dec); 0.001::e_ksea("PTPRG", "AZD1480", inc) :- e_activity("PTPRG", "AZD1480", dec).
0.001::e_ksea("PTPRG", "AZD1480", dec); 0.6949489803::e_ksea("PTPRG", "AZD1480", inc) :- e_activity("PTPRG", "AZD1480", inc).
0.5723099101::e_ksea("PTPRG", "AZD3759", dec); 0.001::e_ksea("PTPRG", "AZD3759", inc) :- e_activity("PTPRG", "AZD3759", dec).
0.001::e_ksea("PTPRG", "AZD3759", dec); 0.5723099101::e_ksea("PTPRG", "AZD3759", inc) :- e_activity("PTPRG", "AZD3759", inc).
0.6013568692::e_ksea("PTPRG", "AZD5363", dec); 0.001::e_ksea("PTPRG", "AZD5363", inc) :- e_activity("PTPRG", "AZD5363", dec).
0.001::e_ksea("PTPRG", "AZD5363", dec); 0.6013568692::e_ksea("PTPRG", "AZD5363", inc) :- e_activity("PTPRG", "AZD5363", inc).
0.5888240545::e_ksea("PTPRG", "AZD5438", dec); 0.001::e_ksea("PTPRG", "AZD5438", inc) :- e_activity("PTPRG", "AZD5438", dec).
0.001::e_ksea("PTPRG", "AZD5438", dec); 0.5888240545::e_ksea("PTPRG", "AZD5438", inc) :- e_activity("PTPRG", "AZD5438", inc).
0.594220976::e_ksea("PTPRG", "AZD6482", dec); 0.001::e_ksea("PTPRG", "AZD6482", inc) :- e_activity("PTPRG", "AZD6482", dec).
0.001::e_ksea("PTPRG", "AZD6482", dec); 0.594220976::e_ksea("PTPRG", "AZD6482", inc) :- e_activity("PTPRG", "AZD6482", inc).
0.4994500289::e_ksea("PTPRG", "AZD6738", dec); 0.001::e_ksea("PTPRG", "AZD6738", inc) :- e_activity("PTPRG", "AZD6738", dec).
0.001::e_ksea("PTPRG", "AZD6738", dec); 0.4994500289::e_ksea("PTPRG", "AZD6738", inc) :- e_activity("PTPRG", "AZD6738", inc).
0.5241091467::e_ksea("PTPRG", "AZD8055", dec); 0.001::e_ksea("PTPRG", "AZD8055", inc) :- e_activity("PTPRG", "AZD8055", dec).
0.001::e_ksea("PTPRG", "AZD8055", dec); 0.5241091467::e_ksea("PTPRG", "AZD8055", inc) :- e_activity("PTPRG", "AZD8055", inc).
0.52348215::e_ksea("PTPRG", "Amuvatinib", dec); 0.001::e_ksea("PTPRG", "Amuvatinib", inc) :- e_activity("PTPRG", "Amuvatinib", dec).
0.001::e_ksea("PTPRG", "Amuvatinib", dec); 0.52348215::e_ksea("PTPRG", "Amuvatinib", inc) :- e_activity("PTPRG", "Amuvatinib", inc).
0.7116552285::e_ksea("PTPRG", "BX912", dec); 0.001::e_ksea("PTPRG", "BX912", inc) :- e_activity("PTPRG", "BX912", dec).
0.001::e_ksea("PTPRG", "BX912", dec); 0.7116552285::e_ksea("PTPRG", "BX912", inc) :- e_activity("PTPRG", "BX912", inc).
0.6357757358::e_ksea("PTPRG", "Bosutinib", dec); 0.001::e_ksea("PTPRG", "Bosutinib", inc) :- e_activity("PTPRG", "Bosutinib", dec).
0.001::e_ksea("PTPRG", "Bosutinib", dec); 0.6357757358::e_ksea("PTPRG", "Bosutinib", inc) :- e_activity("PTPRG", "Bosutinib", inc).
0.5031085316::e_ksea("PTPRG", "CAL101", dec); 0.001::e_ksea("PTPRG", "CAL101", inc) :- e_activity("PTPRG", "CAL101", dec).
0.001::e_ksea("PTPRG", "CAL101", dec); 0.5031085316::e_ksea("PTPRG", "CAL101", inc) :- e_activity("PTPRG", "CAL101", inc).
0.6005063514::e_ksea("PTPRG", "CHIR99021", dec); 0.001::e_ksea("PTPRG", "CHIR99021", inc) :- e_activity("PTPRG", "CHIR99021", dec).
0.001::e_ksea("PTPRG", "CHIR99021", dec); 0.6005063514::e_ksea("PTPRG", "CHIR99021", inc) :- e_activity("PTPRG", "CHIR99021", inc).
0.5628883373::e_ksea("PTPRG", "CX4945", dec); 0.001::e_ksea("PTPRG", "CX4945", inc) :- e_activity("PTPRG", "CX4945", dec).
0.001::e_ksea("PTPRG", "CX4945", dec); 0.5628883373::e_ksea("PTPRG", "CX4945", inc) :- e_activity("PTPRG", "CX4945", inc).
0.539721766::e_ksea("PTPRG", "DNAPK", dec); 0.001::e_ksea("PTPRG", "DNAPK", inc) :- e_activity("PTPRG", "DNAPK", dec).
0.001::e_ksea("PTPRG", "DNAPK", dec); 0.539721766::e_ksea("PTPRG", "DNAPK", inc) :- e_activity("PTPRG", "DNAPK", inc).
0.5373727723::e_ksea("PTPRG", "Dabrafenib", dec); 0.001::e_ksea("PTPRG", "Dabrafenib", inc) :- e_activity("PTPRG", "Dabrafenib", dec).
0.001::e_ksea("PTPRG", "Dabrafenib", dec); 0.5373727723::e_ksea("PTPRG", "Dabrafenib", inc) :- e_activity("PTPRG", "Dabrafenib", inc).
0.6348969732::e_ksea("PTPRG", "Dasatinib", dec); 0.001::e_ksea("PTPRG", "Dasatinib", inc) :- e_activity("PTPRG", "Dasatinib", dec).
0.001::e_ksea("PTPRG", "Dasatinib", dec); 0.6348969732::e_ksea("PTPRG", "Dasatinib", inc) :- e_activity("PTPRG", "Dasatinib", inc).
0.5552168923::e_ksea("PTPRG", "Edelfosine", dec); 0.001::e_ksea("PTPRG", "Edelfosine", inc) :- e_activity("PTPRG", "Edelfosine", dec).
0.001::e_ksea("PTPRG", "Edelfosine", dec); 0.5552168923::e_ksea("PTPRG", "Edelfosine", inc) :- e_activity("PTPRG", "Edelfosine", inc).
0.6993573912::e_ksea("PTPRG", "FRAX486", dec); 0.001::e_ksea("PTPRG", "FRAX486", inc) :- e_activity("PTPRG", "FRAX486", dec).
0.001::e_ksea("PTPRG", "FRAX486", dec); 0.6993573912::e_ksea("PTPRG", "FRAX486", inc) :- e_activity("PTPRG", "FRAX486", inc).
0.5941488041::e_ksea("PTPRG", "GDC0941", dec); 0.001::e_ksea("PTPRG", "GDC0941", inc) :- e_activity("PTPRG", "GDC0941", dec).
0.001::e_ksea("PTPRG", "GDC0941", dec); 0.5941488041::e_ksea("PTPRG", "GDC0941", inc) :- e_activity("PTPRG", "GDC0941", inc).
0.6751728479::e_ksea("PTPRG", "GDC0994", dec); 0.001::e_ksea("PTPRG", "GDC0994", inc) :- e_activity("PTPRG", "GDC0994", dec).
0.001::e_ksea("PTPRG", "GDC0994", dec); 0.6751728479::e_ksea("PTPRG", "GDC0994", inc) :- e_activity("PTPRG", "GDC0994", inc).
0.513323231::e_ksea("PTPRG", "GF109203X", dec); 0.001::e_ksea("PTPRG", "GF109203X", inc) :- e_activity("PTPRG", "GF109203X", dec).
0.001::e_ksea("PTPRG", "GF109203X", dec); 0.513323231::e_ksea("PTPRG", "GF109203X", inc) :- e_activity("PTPRG", "GF109203X", inc).
0.5627159123::e_ksea("PTPRG", "GO6983", dec); 0.001::e_ksea("PTPRG", "GO6983", inc) :- e_activity("PTPRG", "GO6983", dec).
0.001::e_ksea("PTPRG", "GO6983", dec); 0.5627159123::e_ksea("PTPRG", "GO6983", inc) :- e_activity("PTPRG", "GO6983", inc).
0.7147288337::e_ksea("PTPRG", "GSK2334470", dec); 0.001::e_ksea("PTPRG", "GSK2334470", inc) :- e_activity("PTPRG", "GSK2334470", dec).
0.001::e_ksea("PTPRG", "GSK2334470", dec); 0.7147288337::e_ksea("PTPRG", "GSK2334470", inc) :- e_activity("PTPRG", "GSK2334470", inc).
0.7035546245::e_ksea("PTPRG", "GSK690693", dec); 0.001::e_ksea("PTPRG", "GSK690693", inc) :- e_activity("PTPRG", "GSK690693", dec).
0.001::e_ksea("PTPRG", "GSK690693", dec); 0.7035546245::e_ksea("PTPRG", "GSK690693", inc) :- e_activity("PTPRG", "GSK690693", inc).
0.5248036131::e_ksea("PTPRG", "Go6976", dec); 0.001::e_ksea("PTPRG", "Go6976", inc) :- e_activity("PTPRG", "Go6976", dec).
0.001::e_ksea("PTPRG", "Go6976", dec); 0.5248036131::e_ksea("PTPRG", "Go6976", inc) :- e_activity("PTPRG", "Go6976", inc).
0.5370912038::e_ksea("PTPRG", "H89", dec); 0.001::e_ksea("PTPRG", "H89", inc) :- e_activity("PTPRG", "H89", dec).
0.001::e_ksea("PTPRG", "H89", dec); 0.5370912038::e_ksea("PTPRG", "H89", inc) :- e_activity("PTPRG", "H89", inc).
0.5213286932::e_ksea("PTPRG", "HS173", dec); 0.001::e_ksea("PTPRG", "HS173", inc) :- e_activity("PTPRG", "HS173", dec).
0.001::e_ksea("PTPRG", "HS173", dec); 0.5213286932::e_ksea("PTPRG", "HS173", inc) :- e_activity("PTPRG", "HS173", inc).
0.701153374::e_ksea("PTPRG", "Ipatasertib", dec); 0.001::e_ksea("PTPRG", "Ipatasertib", inc) :- e_activity("PTPRG", "Ipatasertib", dec).
0.001::e_ksea("PTPRG", "Ipatasertib", dec); 0.701153374::e_ksea("PTPRG", "Ipatasertib", inc) :- e_activity("PTPRG", "Ipatasertib", inc).
0.543894822::e_ksea("PTPRG", "JNJ", dec); 0.001::e_ksea("PTPRG", "JNJ", inc) :- e_activity("PTPRG", "JNJ", dec).
0.001::e_ksea("PTPRG", "JNJ", dec); 0.543894822::e_ksea("PTPRG", "JNJ", inc) :- e_activity("PTPRG", "JNJ", inc).
0.5640778953::e_ksea("PTPRG", "JNK", dec); 0.001::e_ksea("PTPRG", "JNK", inc) :- e_activity("PTPRG", "JNK", dec).
0.001::e_ksea("PTPRG", "JNK", dec); 0.5640778953::e_ksea("PTPRG", "JNK", inc) :- e_activity("PTPRG", "JNK", inc).
0.5739057117::e_ksea("PTPRG", "KD025", dec); 0.001::e_ksea("PTPRG", "KD025", inc) :- e_activity("PTPRG", "KD025", dec).
0.001::e_ksea("PTPRG", "KD025", dec); 0.5739057117::e_ksea("PTPRG", "KD025", inc) :- e_activity("PTPRG", "KD025", inc).
0.5242767864::e_ksea("PTPRG", "KN62", dec); 0.001::e_ksea("PTPRG", "KN62", inc) :- e_activity("PTPRG", "KN62", dec).
0.001::e_ksea("PTPRG", "KN62", dec); 0.5242767864::e_ksea("PTPRG", "KN62", inc) :- e_activity("PTPRG", "KN62", inc).
0.6926526878::e_ksea("PTPRG", "KN93", dec); 0.001::e_ksea("PTPRG", "KN93", inc) :- e_activity("PTPRG", "KN93", dec).
0.001::e_ksea("PTPRG", "KN93", dec); 0.6926526878::e_ksea("PTPRG", "KN93", inc) :- e_activity("PTPRG", "KN93", inc).
0.613294986::e_ksea("PTPRG", "Ku0063794", dec); 0.001::e_ksea("PTPRG", "Ku0063794", inc) :- e_activity("PTPRG", "Ku0063794", dec).
0.001::e_ksea("PTPRG", "Ku0063794", dec); 0.613294986::e_ksea("PTPRG", "Ku0063794", inc) :- e_activity("PTPRG", "Ku0063794", inc).
0.5974862949::e_ksea("PTPRG", "LY2090314", dec); 0.001::e_ksea("PTPRG", "LY2090314", inc) :- e_activity("PTPRG", "LY2090314", dec).
0.001::e_ksea("PTPRG", "LY2090314", dec); 0.5974862949::e_ksea("PTPRG", "LY2090314", inc) :- e_activity("PTPRG", "LY2090314", inc).
0.6255107246::e_ksea("PTPRG", "LY2584702", dec); 0.001::e_ksea("PTPRG", "LY2584702", inc) :- e_activity("PTPRG", "LY2584702", dec).
0.001::e_ksea("PTPRG", "LY2584702", dec); 0.6255107246::e_ksea("PTPRG", "LY2584702", inc) :- e_activity("PTPRG", "LY2584702", inc).
0.5521413145::e_ksea("PTPRG", "LY2835219", dec); 0.001::e_ksea("PTPRG", "LY2835219", inc) :- e_activity("PTPRG", "LY2835219", dec).
0.001::e_ksea("PTPRG", "LY2835219", dec); 0.5521413145::e_ksea("PTPRG", "LY2835219", inc) :- e_activity("PTPRG", "LY2835219", inc).
0.5391269141::e_ksea("PTPRG", "Linsitinib", dec); 0.001::e_ksea("PTPRG", "Linsitinib", inc) :- e_activity("PTPRG", "Linsitinib", dec).
0.001::e_ksea("PTPRG", "Linsitinib", dec); 0.5391269141::e_ksea("PTPRG", "Linsitinib", inc) :- e_activity("PTPRG", "Linsitinib", inc).
0.7458543971::e_ksea("PTPRG", "MK2206", dec); 0.001::e_ksea("PTPRG", "MK2206", inc) :- e_activity("PTPRG", "MK2206", dec).
0.001::e_ksea("PTPRG", "MK2206", dec); 0.7458543971::e_ksea("PTPRG", "MK2206", inc) :- e_activity("PTPRG", "MK2206", inc).
0.542451748::e_ksea("PTPRG", "NU7441", dec); 0.001::e_ksea("PTPRG", "NU7441", inc) :- e_activity("PTPRG", "NU7441", dec).
0.001::e_ksea("PTPRG", "NU7441", dec); 0.542451748::e_ksea("PTPRG", "NU7441", inc) :- e_activity("PTPRG", "NU7441", inc).
0.7079410851::e_ksea("PTPRG", "PD153035", dec); 0.001::e_ksea("PTPRG", "PD153035", inc) :- e_activity("PTPRG", "PD153035", dec).
0.001::e_ksea("PTPRG", "PD153035", dec); 0.7079410851::e_ksea("PTPRG", "PD153035", inc) :- e_activity("PTPRG", "PD153035", inc).
0.7980654904::e_ksea("PTPRG", "PF3758309", dec); 0.001::e_ksea("PTPRG", "PF3758309", inc) :- e_activity("PTPRG", "PF3758309", dec).
0.001::e_ksea("PTPRG", "PF3758309", dec); 0.7980654904::e_ksea("PTPRG", "PF3758309", inc) :- e_activity("PTPRG", "PF3758309", inc).
0.6303313331::e_ksea("PTPRG", "PF4708671", dec); 0.001::e_ksea("PTPRG", "PF4708671", inc) :- e_activity("PTPRG", "PF4708671", dec).
0.001::e_ksea("PTPRG", "PF4708671", dec); 0.6303313331::e_ksea("PTPRG", "PF4708671", inc) :- e_activity("PTPRG", "PF4708671", inc).
0.5404990241::e_ksea("PTPRG", "PH797804", dec); 0.001::e_ksea("PTPRG", "PH797804", inc) :- e_activity("PTPRG", "PH797804", dec).
0.001::e_ksea("PTPRG", "PH797804", dec); 0.5404990241::e_ksea("PTPRG", "PH797804", inc) :- e_activity("PTPRG", "PH797804", inc).
0.6364075182::e_ksea("PTPRG", "PIK294", dec); 0.001::e_ksea("PTPRG", "PIK294", inc) :- e_activity("PTPRG", "PIK294", dec).
0.001::e_ksea("PTPRG", "PIK294", dec); 0.6364075182::e_ksea("PTPRG", "PIK294", inc) :- e_activity("PTPRG", "PIK294", inc).
0.6581959498::e_ksea("PTPRG", "Ribociclib", dec); 0.001::e_ksea("PTPRG", "Ribociclib", inc) :- e_activity("PTPRG", "Ribociclib", dec).
0.001::e_ksea("PTPRG", "Ribociclib", dec); 0.6581959498::e_ksea("PTPRG", "Ribociclib", inc) :- e_activity("PTPRG", "Ribociclib", inc).
0.507351225::e_ksea("PTPRG", "Ripasudil", dec); 0.001::e_ksea("PTPRG", "Ripasudil", inc) :- e_activity("PTPRG", "Ripasudil", dec).
0.001::e_ksea("PTPRG", "Ripasudil", dec); 0.507351225::e_ksea("PTPRG", "Ripasudil", inc) :- e_activity("PTPRG", "Ripasudil", inc).
0.5240251141::e_ksea("PTPRG", "SP600125", dec); 0.001::e_ksea("PTPRG", "SP600125", inc) :- e_activity("PTPRG", "SP600125", dec).
0.001::e_ksea("PTPRG", "SP600125", dec); 0.5240251141::e_ksea("PTPRG", "SP600125", inc) :- e_activity("PTPRG", "SP600125", inc).
0.5384363688::e_ksea("PTPRG", "Selumetinib", dec); 0.001::e_ksea("PTPRG", "Selumetinib", inc) :- e_activity("PTPRG", "Selumetinib", dec).
0.001::e_ksea("PTPRG", "Selumetinib", dec); 0.5384363688::e_ksea("PTPRG", "Selumetinib", inc) :- e_activity("PTPRG", "Selumetinib", inc).
0.5127592503::e_ksea("PTPRG", "TAK715", dec); 0.001::e_ksea("PTPRG", "TAK715", inc) :- e_activity("PTPRG", "TAK715", dec).
0.001::e_ksea("PTPRG", "TAK715", dec); 0.5127592503::e_ksea("PTPRG", "TAK715", inc) :- e_activity("PTPRG", "TAK715", inc).
0.590264172::e_ksea("PTPRG", "TBCA", dec); 0.001::e_ksea("PTPRG", "TBCA", inc) :- e_activity("PTPRG", "TBCA", dec).
0.001::e_ksea("PTPRG", "TBCA", dec); 0.590264172::e_ksea("PTPRG", "TBCA", inc) :- e_activity("PTPRG", "TBCA", inc).
0.5736186779::e_ksea("PTPRG", "TGX221", dec); 0.001::e_ksea("PTPRG", "TGX221", inc) :- e_activity("PTPRG", "TGX221", dec).
0.001::e_ksea("PTPRG", "TGX221", dec); 0.5736186779::e_ksea("PTPRG", "TGX221", inc) :- e_activity("PTPRG", "TGX221", inc).
0.6956495061::e_ksea("PTPRG", "Tofacitinib", dec); 0.001::e_ksea("PTPRG", "Tofacitinib", inc) :- e_activity("PTPRG", "Tofacitinib", dec).
0.001::e_ksea("PTPRG", "Tofacitinib", dec); 0.6956495061::e_ksea("PTPRG", "Tofacitinib", inc) :- e_activity("PTPRG", "Tofacitinib", inc).
0.5940448386::e_ksea("PTPRG", "Torin", dec); 0.001::e_ksea("PTPRG", "Torin", inc) :- e_activity("PTPRG", "Torin", dec).
0.001::e_ksea("PTPRG", "Torin", dec); 0.5940448386::e_ksea("PTPRG", "Torin", inc) :- e_activity("PTPRG", "Torin", inc).
0.6627782909::e_ksea("PTPRG", "Trametinib", dec); 0.001::e_ksea("PTPRG", "Trametinib", inc) :- e_activity("PTPRG", "Trametinib", dec).
0.001::e_ksea("PTPRG", "Trametinib", dec); 0.6627782909::e_ksea("PTPRG", "Trametinib", inc) :- e_activity("PTPRG", "Trametinib", inc).
0.5106478711::e_ksea("PTPRG", "U73122", dec); 0.001::e_ksea("PTPRG", "U73122", inc) :- e_activity("PTPRG", "U73122", dec).
0.001::e_ksea("PTPRG", "U73122", dec); 0.5106478711::e_ksea("PTPRG", "U73122", inc) :- e_activity("PTPRG", "U73122", inc).
0.5275644456::e_ksea("PTPRG", "Ulixertinib", dec); 0.001::e_ksea("PTPRG", "Ulixertinib", inc) :- e_activity("PTPRG", "Ulixertinib", dec).
0.001::e_ksea("PTPRG", "Ulixertinib", dec); 0.5275644456::e_ksea("PTPRG", "Ulixertinib", inc) :- e_activity("PTPRG", "Ulixertinib", inc).
0.5138175024::e_ksea("PTPRG", "Vemurafenib", dec); 0.001::e_ksea("PTPRG", "Vemurafenib", inc) :- e_activity("PTPRG", "Vemurafenib", dec).
0.001::e_ksea("PTPRG", "Vemurafenib", dec); 0.5138175024::e_ksea("PTPRG", "Vemurafenib", inc) :- e_activity("PTPRG", "Vemurafenib", inc).
0.6638502146::e_ksea("PTPRR", "AC220", dec); 0.001::e_ksea("PTPRR", "AC220", inc) :- e_activity("PTPRR", "AC220", dec).
0.001::e_ksea("PTPRR", "AC220", dec); 0.6638502146::e_ksea("PTPRR", "AC220", inc) :- e_activity("PTPRR", "AC220", inc).
0.5986066907::e_ksea("PTPRR", "AT13148", dec); 0.001::e_ksea("PTPRR", "AT13148", inc) :- e_activity("PTPRR", "AT13148", dec).
0.001::e_ksea("PTPRR", "AT13148", dec); 0.5986066907::e_ksea("PTPRR", "AT13148", inc) :- e_activity("PTPRR", "AT13148", inc).
0.645471697::e_ksea("PTPRR", "AZ20", dec); 0.001::e_ksea("PTPRR", "AZ20", inc) :- e_activity("PTPRR", "AZ20", dec).
0.001::e_ksea("PTPRR", "AZ20", dec); 0.645471697::e_ksea("PTPRR", "AZ20", inc) :- e_activity("PTPRR", "AZ20", inc).
0.5162855759::e_ksea("PTPRR", "AZD1480", dec); 0.001::e_ksea("PTPRR", "AZD1480", inc) :- e_activity("PTPRR", "AZD1480", dec).
0.001::e_ksea("PTPRR", "AZD1480", dec); 0.5162855759::e_ksea("PTPRR", "AZD1480", inc) :- e_activity("PTPRR", "AZD1480", inc).
0.6819145969::e_ksea("PTPRR", "AZD3759", dec); 0.001::e_ksea("PTPRR", "AZD3759", inc) :- e_activity("PTPRR", "AZD3759", dec).
0.001::e_ksea("PTPRR", "AZD3759", dec); 0.6819145969::e_ksea("PTPRR", "AZD3759", inc) :- e_activity("PTPRR", "AZD3759", inc).
0.6081088022::e_ksea("PTPRR", "AZD5363", dec); 0.001::e_ksea("PTPRR", "AZD5363", inc) :- e_activity("PTPRR", "AZD5363", dec).
0.001::e_ksea("PTPRR", "AZD5363", dec); 0.6081088022::e_ksea("PTPRR", "AZD5363", inc) :- e_activity("PTPRR", "AZD5363", inc).
0.7893111692::e_ksea("PTPRR", "AZD5438", dec); 0.001::e_ksea("PTPRR", "AZD5438", inc) :- e_activity("PTPRR", "AZD5438", dec).
0.001::e_ksea("PTPRR", "AZD5438", dec); 0.7893111692::e_ksea("PTPRR", "AZD5438", inc) :- e_activity("PTPRR", "AZD5438", inc).
0.7771667384::e_ksea("PTPRR", "AZD6482", dec); 0.001::e_ksea("PTPRR", "AZD6482", inc) :- e_activity("PTPRR", "AZD6482", dec).
0.001::e_ksea("PTPRR", "AZD6482", dec); 0.7771667384::e_ksea("PTPRR", "AZD6482", inc) :- e_activity("PTPRR", "AZD6482", inc).
0.6951880671::e_ksea("PTPRR", "AZD6738", dec); 0.001::e_ksea("PTPRR", "AZD6738", inc) :- e_activity("PTPRR", "AZD6738", dec).
0.001::e_ksea("PTPRR", "AZD6738", dec); 0.6951880671::e_ksea("PTPRR", "AZD6738", inc) :- e_activity("PTPRR", "AZD6738", inc).
0.5025259792::e_ksea("PTPRR", "AZD8055", dec); 0.001::e_ksea("PTPRR", "AZD8055", inc) :- e_activity("PTPRR", "AZD8055", dec).
0.001::e_ksea("PTPRR", "AZD8055", dec); 0.5025259792::e_ksea("PTPRR", "AZD8055", inc) :- e_activity("PTPRR", "AZD8055", inc).
0.6134764767::e_ksea("PTPRR", "Amuvatinib", dec); 0.001::e_ksea("PTPRR", "Amuvatinib", inc) :- e_activity("PTPRR", "Amuvatinib", dec).
0.001::e_ksea("PTPRR", "Amuvatinib", dec); 0.6134764767::e_ksea("PTPRR", "Amuvatinib", inc) :- e_activity("PTPRR", "Amuvatinib", inc).
0.5790302259::e_ksea("PTPRR", "BX912", dec); 0.001::e_ksea("PTPRR", "BX912", inc) :- e_activity("PTPRR", "BX912", dec).
0.001::e_ksea("PTPRR", "BX912", dec); 0.5790302259::e_ksea("PTPRR", "BX912", inc) :- e_activity("PTPRR", "BX912", inc).
0.7188190322::e_ksea("PTPRR", "Bosutinib", dec); 0.001::e_ksea("PTPRR", "Bosutinib", inc) :- e_activity("PTPRR", "Bosutinib", dec).
0.001::e_ksea("PTPRR", "Bosutinib", dec); 0.7188190322::e_ksea("PTPRR", "Bosutinib", inc) :- e_activity("PTPRR", "Bosutinib", inc).
0.5219478548::e_ksea("PTPRR", "CAL101", dec); 0.001::e_ksea("PTPRR", "CAL101", inc) :- e_activity("PTPRR", "CAL101", dec).
0.001::e_ksea("PTPRR", "CAL101", dec); 0.5219478548::e_ksea("PTPRR", "CAL101", inc) :- e_activity("PTPRR", "CAL101", inc).
0.5442789234::e_ksea("PTPRR", "CHIR99021", dec); 0.001::e_ksea("PTPRR", "CHIR99021", inc) :- e_activity("PTPRR", "CHIR99021", dec).
0.001::e_ksea("PTPRR", "CHIR99021", dec); 0.5442789234::e_ksea("PTPRR", "CHIR99021", inc) :- e_activity("PTPRR", "CHIR99021", inc).
0.7483395275::e_ksea("PTPRR", "CX4945", dec); 0.001::e_ksea("PTPRR", "CX4945", inc) :- e_activity("PTPRR", "CX4945", dec).
0.001::e_ksea("PTPRR", "CX4945", dec); 0.7483395275::e_ksea("PTPRR", "CX4945", inc) :- e_activity("PTPRR", "CX4945", inc).
0.5262465306::e_ksea("PTPRR", "DNAPK", dec); 0.001::e_ksea("PTPRR", "DNAPK", inc) :- e_activity("PTPRR", "DNAPK", dec).
0.001::e_ksea("PTPRR", "DNAPK", dec); 0.5262465306::e_ksea("PTPRR", "DNAPK", inc) :- e_activity("PTPRR", "DNAPK", inc).
0.6783788531::e_ksea("PTPRR", "Dabrafenib", dec); 0.001::e_ksea("PTPRR", "Dabrafenib", inc) :- e_activity("PTPRR", "Dabrafenib", dec).
0.001::e_ksea("PTPRR", "Dabrafenib", dec); 0.6783788531::e_ksea("PTPRR", "Dabrafenib", inc) :- e_activity("PTPRR", "Dabrafenib", inc).
0.7078600828::e_ksea("PTPRR", "Dasatinib", dec); 0.001::e_ksea("PTPRR", "Dasatinib", inc) :- e_activity("PTPRR", "Dasatinib", dec).
0.001::e_ksea("PTPRR", "Dasatinib", dec); 0.7078600828::e_ksea("PTPRR", "Dasatinib", inc) :- e_activity("PTPRR", "Dasatinib", inc).
0.6333635206::e_ksea("PTPRR", "Edelfosine", dec); 0.001::e_ksea("PTPRR", "Edelfosine", inc) :- e_activity("PTPRR", "Edelfosine", dec).
0.001::e_ksea("PTPRR", "Edelfosine", dec); 0.6333635206::e_ksea("PTPRR", "Edelfosine", inc) :- e_activity("PTPRR", "Edelfosine", inc).
0.7993998517::e_ksea("PTPRR", "FRAX486", dec); 0.001::e_ksea("PTPRR", "FRAX486", inc) :- e_activity("PTPRR", "FRAX486", dec).
0.001::e_ksea("PTPRR", "FRAX486", dec); 0.7993998517::e_ksea("PTPRR", "FRAX486", inc) :- e_activity("PTPRR", "FRAX486", inc).
0.6442812832::e_ksea("PTPRR", "GDC0941", dec); 0.001::e_ksea("PTPRR", "GDC0941", inc) :- e_activity("PTPRR", "GDC0941", dec).
0.001::e_ksea("PTPRR", "GDC0941", dec); 0.6442812832::e_ksea("PTPRR", "GDC0941", inc) :- e_activity("PTPRR", "GDC0941", inc).
0.5356534887::e_ksea("PTPRR", "GDC0994", dec); 0.001::e_ksea("PTPRR", "GDC0994", inc) :- e_activity("PTPRR", "GDC0994", dec).
0.001::e_ksea("PTPRR", "GDC0994", dec); 0.5356534887::e_ksea("PTPRR", "GDC0994", inc) :- e_activity("PTPRR", "GDC0994", inc).
0.760668914::e_ksea("PTPRR", "GF109203X", dec); 0.001::e_ksea("PTPRR", "GF109203X", inc) :- e_activity("PTPRR", "GF109203X", dec).
0.001::e_ksea("PTPRR", "GF109203X", dec); 0.760668914::e_ksea("PTPRR", "GF109203X", inc) :- e_activity("PTPRR", "GF109203X", inc).
0.5122026894::e_ksea("PTPRR", "GO6983", dec); 0.001::e_ksea("PTPRR", "GO6983", inc) :- e_activity("PTPRR", "GO6983", dec).
0.001::e_ksea("PTPRR", "GO6983", dec); 0.5122026894::e_ksea("PTPRR", "GO6983", inc) :- e_activity("PTPRR", "GO6983", inc).
0.5027478619::e_ksea("PTPRR", "GSK2334470", dec); 0.001::e_ksea("PTPRR", "GSK2334470", inc) :- e_activity("PTPRR", "GSK2334470", dec).
0.001::e_ksea("PTPRR", "GSK2334470", dec); 0.5027478619::e_ksea("PTPRR", "GSK2334470", inc) :- e_activity("PTPRR", "GSK2334470", inc).
0.6271883479::e_ksea("PTPRR", "GSK690693", dec); 0.001::e_ksea("PTPRR", "GSK690693", inc) :- e_activity("PTPRR", "GSK690693", dec).
0.001::e_ksea("PTPRR", "GSK690693", dec); 0.6271883479::e_ksea("PTPRR", "GSK690693", inc) :- e_activity("PTPRR", "GSK690693", inc).
0.5401875686::e_ksea("PTPRR", "Go6976", dec); 0.001::e_ksea("PTPRR", "Go6976", inc) :- e_activity("PTPRR", "Go6976", dec).
0.001::e_ksea("PTPRR", "Go6976", dec); 0.5401875686::e_ksea("PTPRR", "Go6976", inc) :- e_activity("PTPRR", "Go6976", inc).
0.5715586392::e_ksea("PTPRR", "H89", dec); 0.001::e_ksea("PTPRR", "H89", inc) :- e_activity("PTPRR", "H89", dec).
0.001::e_ksea("PTPRR", "H89", dec); 0.5715586392::e_ksea("PTPRR", "H89", inc) :- e_activity("PTPRR", "H89", inc).
0.6854431577::e_ksea("PTPRR", "HS173", dec); 0.001::e_ksea("PTPRR", "HS173", inc) :- e_activity("PTPRR", "HS173", dec).
0.001::e_ksea("PTPRR", "HS173", dec); 0.6854431577::e_ksea("PTPRR", "HS173", inc) :- e_activity("PTPRR", "HS173", inc).
0.7822142991::e_ksea("PTPRR", "Ipatasertib", dec); 0.001::e_ksea("PTPRR", "Ipatasertib", inc) :- e_activity("PTPRR", "Ipatasertib", dec).
0.001::e_ksea("PTPRR", "Ipatasertib", dec); 0.7822142991::e_ksea("PTPRR", "Ipatasertib", inc) :- e_activity("PTPRR", "Ipatasertib", inc).
0.7004896498::e_ksea("PTPRR", "JNJ", dec); 0.001::e_ksea("PTPRR", "JNJ", inc) :- e_activity("PTPRR", "JNJ", dec).
0.001::e_ksea("PTPRR", "JNJ", dec); 0.7004896498::e_ksea("PTPRR", "JNJ", inc) :- e_activity("PTPRR", "JNJ", inc).
0.6114344439::e_ksea("PTPRR", "JNK", dec); 0.001::e_ksea("PTPRR", "JNK", inc) :- e_activity("PTPRR", "JNK", dec).
0.001::e_ksea("PTPRR", "JNK", dec); 0.6114344439::e_ksea("PTPRR", "JNK", inc) :- e_activity("PTPRR", "JNK", inc).
0.614144805::e_ksea("PTPRR", "KD025", dec); 0.001::e_ksea("PTPRR", "KD025", inc) :- e_activity("PTPRR", "KD025", dec).
0.001::e_ksea("PTPRR", "KD025", dec); 0.614144805::e_ksea("PTPRR", "KD025", inc) :- e_activity("PTPRR", "KD025", inc).
0.7732631002::e_ksea("PTPRR", "KN62", dec); 0.001::e_ksea("PTPRR", "KN62", inc) :- e_activity("PTPRR", "KN62", dec).
0.001::e_ksea("PTPRR", "KN62", dec); 0.7732631002::e_ksea("PTPRR", "KN62", inc) :- e_activity("PTPRR", "KN62", inc).
0.6679371511::e_ksea("PTPRR", "KN93", dec); 0.001::e_ksea("PTPRR", "KN93", inc) :- e_activity("PTPRR", "KN93", dec).
0.001::e_ksea("PTPRR", "KN93", dec); 0.6679371511::e_ksea("PTPRR", "KN93", inc) :- e_activity("PTPRR", "KN93", inc).
0.7707742711::e_ksea("PTPRR", "Ku0063794", dec); 0.001::e_ksea("PTPRR", "Ku0063794", inc) :- e_activity("PTPRR", "Ku0063794", dec).
0.001::e_ksea("PTPRR", "Ku0063794", dec); 0.7707742711::e_ksea("PTPRR", "Ku0063794", inc) :- e_activity("PTPRR", "Ku0063794", inc).
0.6966012566::e_ksea("PTPRR", "LY2090314", dec); 0.001::e_ksea("PTPRR", "LY2090314", inc) :- e_activity("PTPRR", "LY2090314", dec).
0.001::e_ksea("PTPRR", "LY2090314", dec); 0.6966012566::e_ksea("PTPRR", "LY2090314", inc) :- e_activity("PTPRR", "LY2090314", inc).
0.6456630326::e_ksea("PTPRR", "LY2584702", dec); 0.001::e_ksea("PTPRR", "LY2584702", inc) :- e_activity("PTPRR", "LY2584702", dec).
0.001::e_ksea("PTPRR", "LY2584702", dec); 0.6456630326::e_ksea("PTPRR", "LY2584702", inc) :- e_activity("PTPRR", "LY2584702", inc).
0.6667592461::e_ksea("PTPRR", "LY2835219", dec); 0.001::e_ksea("PTPRR", "LY2835219", inc) :- e_activity("PTPRR", "LY2835219", dec).
0.001::e_ksea("PTPRR", "LY2835219", dec); 0.6667592461::e_ksea("PTPRR", "LY2835219", inc) :- e_activity("PTPRR", "LY2835219", inc).
0.5457136342::e_ksea("PTPRR", "Linsitinib", dec); 0.001::e_ksea("PTPRR", "Linsitinib", inc) :- e_activity("PTPRR", "Linsitinib", dec).
0.001::e_ksea("PTPRR", "Linsitinib", dec); 0.5457136342::e_ksea("PTPRR", "Linsitinib", inc) :- e_activity("PTPRR", "Linsitinib", inc).
0.681916142::e_ksea("PTPRR", "MK2206", dec); 0.001::e_ksea("PTPRR", "MK2206", inc) :- e_activity("PTPRR", "MK2206", dec).
0.001::e_ksea("PTPRR", "MK2206", dec); 0.681916142::e_ksea("PTPRR", "MK2206", inc) :- e_activity("PTPRR", "MK2206", inc).
0.5745226217::e_ksea("PTPRR", "NU7441", dec); 0.001::e_ksea("PTPRR", "NU7441", inc) :- e_activity("PTPRR", "NU7441", dec).
0.001::e_ksea("PTPRR", "NU7441", dec); 0.5745226217::e_ksea("PTPRR", "NU7441", inc) :- e_activity("PTPRR", "NU7441", inc).
0.575158162::e_ksea("PTPRR", "PD153035", dec); 0.001::e_ksea("PTPRR", "PD153035", inc) :- e_activity("PTPRR", "PD153035", dec).
0.001::e_ksea("PTPRR", "PD153035", dec); 0.575158162::e_ksea("PTPRR", "PD153035", inc) :- e_activity("PTPRR", "PD153035", inc).
0.7801562071::e_ksea("PTPRR", "PF3758309", dec); 0.001::e_ksea("PTPRR", "PF3758309", inc) :- e_activity("PTPRR", "PF3758309", dec).
0.001::e_ksea("PTPRR", "PF3758309", dec); 0.7801562071::e_ksea("PTPRR", "PF3758309", inc) :- e_activity("PTPRR", "PF3758309", inc).
0.542663287::e_ksea("PTPRR", "PF4708671", dec); 0.001::e_ksea("PTPRR", "PF4708671", inc) :- e_activity("PTPRR", "PF4708671", dec).
0.001::e_ksea("PTPRR", "PF4708671", dec); 0.542663287::e_ksea("PTPRR", "PF4708671", inc) :- e_activity("PTPRR", "PF4708671", inc).
0.5175588988::e_ksea("PTPRR", "PH797804", dec); 0.001::e_ksea("PTPRR", "PH797804", inc) :- e_activity("PTPRR", "PH797804", dec).
0.001::e_ksea("PTPRR", "PH797804", dec); 0.5175588988::e_ksea("PTPRR", "PH797804", inc) :- e_activity("PTPRR", "PH797804", inc).
0.5371559167::e_ksea("PTPRR", "PIK294", dec); 0.001::e_ksea("PTPRR", "PIK294", inc) :- e_activity("PTPRR", "PIK294", dec).
0.001::e_ksea("PTPRR", "PIK294", dec); 0.5371559167::e_ksea("PTPRR", "PIK294", inc) :- e_activity("PTPRR", "PIK294", inc).
0.7568081284::e_ksea("PTPRR", "Ribociclib", dec); 0.001::e_ksea("PTPRR", "Ribociclib", inc) :- e_activity("PTPRR", "Ribociclib", dec).
0.001::e_ksea("PTPRR", "Ribociclib", dec); 0.7568081284::e_ksea("PTPRR", "Ribociclib", inc) :- e_activity("PTPRR", "Ribociclib", inc).
0.6273417398::e_ksea("PTPRR", "Ripasudil", dec); 0.001::e_ksea("PTPRR", "Ripasudil", inc) :- e_activity("PTPRR", "Ripasudil", dec).
0.001::e_ksea("PTPRR", "Ripasudil", dec); 0.6273417398::e_ksea("PTPRR", "Ripasudil", inc) :- e_activity("PTPRR", "Ripasudil", inc).
0.5984747467::e_ksea("PTPRR", "SP600125", dec); 0.001::e_ksea("PTPRR", "SP600125", inc) :- e_activity("PTPRR", "SP600125", dec).
0.001::e_ksea("PTPRR", "SP600125", dec); 0.5984747467::e_ksea("PTPRR", "SP600125", inc) :- e_activity("PTPRR", "SP600125", inc).
0.797263846::e_ksea("PTPRR", "Selumetinib", dec); 0.001::e_ksea("PTPRR", "Selumetinib", inc) :- e_activity("PTPRR", "Selumetinib", dec).
0.001::e_ksea("PTPRR", "Selumetinib", dec); 0.797263846::e_ksea("PTPRR", "Selumetinib", inc) :- e_activity("PTPRR", "Selumetinib", inc).
0.5628914056::e_ksea("PTPRR", "TAK715", dec); 0.001::e_ksea("PTPRR", "TAK715", inc) :- e_activity("PTPRR", "TAK715", dec).
0.001::e_ksea("PTPRR", "TAK715", dec); 0.5628914056::e_ksea("PTPRR", "TAK715", inc) :- e_activity("PTPRR", "TAK715", inc).
0.6228191748::e_ksea("PTPRR", "TBCA", dec); 0.001::e_ksea("PTPRR", "TBCA", inc) :- e_activity("PTPRR", "TBCA", dec).
0.001::e_ksea("PTPRR", "TBCA", dec); 0.6228191748::e_ksea("PTPRR", "TBCA", inc) :- e_activity("PTPRR", "TBCA", inc).
0.5675783149::e_ksea("PTPRR", "TGX221", dec); 0.001::e_ksea("PTPRR", "TGX221", inc) :- e_activity("PTPRR", "TGX221", dec).
0.001::e_ksea("PTPRR", "TGX221", dec); 0.5675783149::e_ksea("PTPRR", "TGX221", inc) :- e_activity("PTPRR", "TGX221", inc).
0.7170790681::e_ksea("PTPRR", "Tofacitinib", dec); 0.001::e_ksea("PTPRR", "Tofacitinib", inc) :- e_activity("PTPRR", "Tofacitinib", dec).
0.001::e_ksea("PTPRR", "Tofacitinib", dec); 0.7170790681::e_ksea("PTPRR", "Tofacitinib", inc) :- e_activity("PTPRR", "Tofacitinib", inc).
0.7966759438::e_ksea("PTPRR", "Torin", dec); 0.001::e_ksea("PTPRR", "Torin", inc) :- e_activity("PTPRR", "Torin", dec).
0.001::e_ksea("PTPRR", "Torin", dec); 0.7966759438::e_ksea("PTPRR", "Torin", inc) :- e_activity("PTPRR", "Torin", inc).
0.7740753405::e_ksea("PTPRR", "Trametinib", dec); 0.001::e_ksea("PTPRR", "Trametinib", inc) :- e_activity("PTPRR", "Trametinib", dec).
0.001::e_ksea("PTPRR", "Trametinib", dec); 0.7740753405::e_ksea("PTPRR", "Trametinib", inc) :- e_activity("PTPRR", "Trametinib", inc).
0.6576269212::e_ksea("PTPRR", "U73122", dec); 0.001::e_ksea("PTPRR", "U73122", inc) :- e_activity("PTPRR", "U73122", dec).
0.001::e_ksea("PTPRR", "U73122", dec); 0.6576269212::e_ksea("PTPRR", "U73122", inc) :- e_activity("PTPRR", "U73122", inc).
0.7721291576::e_ksea("PTPRR", "Ulixertinib", dec); 0.001::e_ksea("PTPRR", "Ulixertinib", inc) :- e_activity("PTPRR", "Ulixertinib", dec).
0.001::e_ksea("PTPRR", "Ulixertinib", dec); 0.7721291576::e_ksea("PTPRR", "Ulixertinib", inc) :- e_activity("PTPRR", "Ulixertinib", inc).
0.6674871771::e_ksea("PTPRR", "Vemurafenib", dec); 0.001::e_ksea("PTPRR", "Vemurafenib", inc) :- e_activity("PTPRR", "Vemurafenib", dec).
0.001::e_ksea("PTPRR", "Vemurafenib", dec); 0.6674871771::e_ksea("PTPRR", "Vemurafenib", inc) :- e_activity("PTPRR", "Vemurafenib", inc).
0.8398796284::e_ksea("SRC", "AC220", dec); 0.001::e_ksea("SRC", "AC220", inc) :- e_activity("SRC", "AC220", dec).
0.001::e_ksea("SRC", "AC220", dec); 0.8398796284::e_ksea("SRC", "AC220", inc) :- e_activity("SRC", "AC220", inc).
0.6528554508::e_ksea("SRC", "AT13148", dec); 0.001::e_ksea("SRC", "AT13148", inc) :- e_activity("SRC", "AT13148", dec).
0.001::e_ksea("SRC", "AT13148", dec); 0.6528554508::e_ksea("SRC", "AT13148", inc) :- e_activity("SRC", "AT13148", inc).
0.7910925693::e_ksea("SRC", "AZ20", dec); 0.001::e_ksea("SRC", "AZ20", inc) :- e_activity("SRC", "AZ20", dec).
0.001::e_ksea("SRC", "AZ20", dec); 0.7910925693::e_ksea("SRC", "AZ20", inc) :- e_activity("SRC", "AZ20", inc).
0.6233229283::e_ksea("SRC", "AZD1480", dec); 0.001::e_ksea("SRC", "AZD1480", inc) :- e_activity("SRC", "AZD1480", dec).
0.001::e_ksea("SRC", "AZD1480", dec); 0.6233229283::e_ksea("SRC", "AZD1480", inc) :- e_activity("SRC", "AZD1480", inc).
0.6423967795::e_ksea("SRC", "AZD3759", dec); 0.001::e_ksea("SRC", "AZD3759", inc) :- e_activity("SRC", "AZD3759", dec).
0.001::e_ksea("SRC", "AZD3759", dec); 0.6423967795::e_ksea("SRC", "AZD3759", inc) :- e_activity("SRC", "AZD3759", inc).
0.6745323453::e_ksea("SRC", "AZD5363", dec); 0.001::e_ksea("SRC", "AZD5363", inc) :- e_activity("SRC", "AZD5363", dec).
0.001::e_ksea("SRC", "AZD5363", dec); 0.6745323453::e_ksea("SRC", "AZD5363", inc) :- e_activity("SRC", "AZD5363", inc).
0.7511368553::e_ksea("SRC", "AZD5438", dec); 0.001::e_ksea("SRC", "AZD5438", inc) :- e_activity("SRC", "AZD5438", dec).
0.001::e_ksea("SRC", "AZD5438", dec); 0.7511368553::e_ksea("SRC", "AZD5438", inc) :- e_activity("SRC", "AZD5438", inc).
0.8811418526::e_ksea("SRC", "AZD6482", dec); 0.001::e_ksea("SRC", "AZD6482", inc) :- e_activity("SRC", "AZD6482", dec).
0.001::e_ksea("SRC", "AZD6482", dec); 0.8811418526::e_ksea("SRC", "AZD6482", inc) :- e_activity("SRC", "AZD6482", inc).
0.9760158221::e_ksea("SRC", "AZD6738", dec); 0.001::e_ksea("SRC", "AZD6738", inc) :- e_activity("SRC", "AZD6738", dec).
0.001::e_ksea("SRC", "AZD6738", dec); 0.9760158221::e_ksea("SRC", "AZD6738", inc) :- e_activity("SRC", "AZD6738", inc).
0.6729559654::e_ksea("SRC", "AZD8055", dec); 0.001::e_ksea("SRC", "AZD8055", inc) :- e_activity("SRC", "AZD8055", dec).
0.001::e_ksea("SRC", "AZD8055", dec); 0.6729559654::e_ksea("SRC", "AZD8055", inc) :- e_activity("SRC", "AZD8055", inc).
0.6002503962::e_ksea("SRC", "Amuvatinib", dec); 0.001::e_ksea("SRC", "Amuvatinib", inc) :- e_activity("SRC", "Amuvatinib", dec).
0.001::e_ksea("SRC", "Amuvatinib", dec); 0.6002503962::e_ksea("SRC", "Amuvatinib", inc) :- e_activity("SRC", "Amuvatinib", inc).
0.5369145878::e_ksea("SRC", "BX912", dec); 0.001::e_ksea("SRC", "BX912", inc) :- e_activity("SRC", "BX912", dec).
0.001::e_ksea("SRC", "BX912", dec); 0.5369145878::e_ksea("SRC", "BX912", inc) :- e_activity("SRC", "BX912", inc).
0.9872709238::e_ksea("SRC", "Bosutinib", dec); 0.001::e_ksea("SRC", "Bosutinib", inc) :- e_activity("SRC", "Bosutinib", dec).
0.001::e_ksea("SRC", "Bosutinib", dec); 0.9872709238::e_ksea("SRC", "Bosutinib", inc) :- e_activity("SRC", "Bosutinib", inc).
0.5623476275::e_ksea("SRC", "CAL101", dec); 0.001::e_ksea("SRC", "CAL101", inc) :- e_activity("SRC", "CAL101", dec).
0.001::e_ksea("SRC", "CAL101", dec); 0.5623476275::e_ksea("SRC", "CAL101", inc) :- e_activity("SRC", "CAL101", inc).
0.7000871525::e_ksea("SRC", "CHIR99021", dec); 0.001::e_ksea("SRC", "CHIR99021", inc) :- e_activity("SRC", "CHIR99021", dec).
0.001::e_ksea("SRC", "CHIR99021", dec); 0.7000871525::e_ksea("SRC", "CHIR99021", inc) :- e_activity("SRC", "CHIR99021", inc).
0.9149204826::e_ksea("SRC", "CX4945", dec); 0.001::e_ksea("SRC", "CX4945", inc) :- e_activity("SRC", "CX4945", dec).
0.001::e_ksea("SRC", "CX4945", dec); 0.9149204826::e_ksea("SRC", "CX4945", inc) :- e_activity("SRC", "CX4945", inc).
0.6309896247::e_ksea("SRC", "DNAPK", dec); 0.001::e_ksea("SRC", "DNAPK", inc) :- e_activity("SRC", "DNAPK", dec).
0.001::e_ksea("SRC", "DNAPK", dec); 0.6309896247::e_ksea("SRC", "DNAPK", inc) :- e_activity("SRC", "DNAPK", inc).
0.6500982993::e_ksea("SRC", "Dabrafenib", dec); 0.001::e_ksea("SRC", "Dabrafenib", inc) :- e_activity("SRC", "Dabrafenib", dec).
0.001::e_ksea("SRC", "Dabrafenib", dec); 0.6500982993::e_ksea("SRC", "Dabrafenib", inc) :- e_activity("SRC", "Dabrafenib", inc).
0.887915682::e_ksea("SRC", "Dasatinib", dec); 0.001::e_ksea("SRC", "Dasatinib", inc) :- e_activity("SRC", "Dasatinib", dec).
0.001::e_ksea("SRC", "Dasatinib", dec); 0.887915682::e_ksea("SRC", "Dasatinib", inc) :- e_activity("SRC", "Dasatinib", inc).
0.853426962::e_ksea("SRC", "Edelfosine", dec); 0.001::e_ksea("SRC", "Edelfosine", inc) :- e_activity("SRC", "Edelfosine", dec).
0.001::e_ksea("SRC", "Edelfosine", dec); 0.853426962::e_ksea("SRC", "Edelfosine", inc) :- e_activity("SRC", "Edelfosine", inc).
0.7951814123::e_ksea("SRC", "FRAX486", dec); 0.001::e_ksea("SRC", "FRAX486", inc) :- e_activity("SRC", "FRAX486", dec).
0.001::e_ksea("SRC", "FRAX486", dec); 0.7951814123::e_ksea("SRC", "FRAX486", inc) :- e_activity("SRC", "FRAX486", inc).
0.5568026358::e_ksea("SRC", "GDC0941", dec); 0.001::e_ksea("SRC", "GDC0941", inc) :- e_activity("SRC", "GDC0941", dec).
0.001::e_ksea("SRC", "GDC0941", dec); 0.5568026358::e_ksea("SRC", "GDC0941", inc) :- e_activity("SRC", "GDC0941", inc).
0.9316782593::e_ksea("SRC", "GDC0994", dec); 0.001::e_ksea("SRC", "GDC0994", inc) :- e_activity("SRC", "GDC0994", dec).
0.001::e_ksea("SRC", "GDC0994", dec); 0.9316782593::e_ksea("SRC", "GDC0994", inc) :- e_activity("SRC", "GDC0994", inc).
0.9895363566::e_ksea("SRC", "GF109203X", dec); 0.001::e_ksea("SRC", "GF109203X", inc) :- e_activity("SRC", "GF109203X", dec).
0.001::e_ksea("SRC", "GF109203X", dec); 0.9895363566::e_ksea("SRC", "GF109203X", inc) :- e_activity("SRC", "GF109203X", inc).
0.9096057458::e_ksea("SRC", "GO6983", dec); 0.001::e_ksea("SRC", "GO6983", inc) :- e_activity("SRC", "GO6983", dec).
0.001::e_ksea("SRC", "GO6983", dec); 0.9096057458::e_ksea("SRC", "GO6983", inc) :- e_activity("SRC", "GO6983", inc).
0.7280571419::e_ksea("SRC", "GSK2334470", dec); 0.001::e_ksea("SRC", "GSK2334470", inc) :- e_activity("SRC", "GSK2334470", dec).
0.001::e_ksea("SRC", "GSK2334470", dec); 0.7280571419::e_ksea("SRC", "GSK2334470", inc) :- e_activity("SRC", "GSK2334470", inc).
0.5611571664::e_ksea("SRC", "GSK690693", dec); 0.001::e_ksea("SRC", "GSK690693", inc) :- e_activity("SRC", "GSK690693", dec).
0.001::e_ksea("SRC", "GSK690693", dec); 0.5611571664::e_ksea("SRC", "GSK690693", inc) :- e_activity("SRC", "GSK690693", inc).
0.7813235596::e_ksea("SRC", "Go6976", dec); 0.001::e_ksea("SRC", "Go6976", inc) :- e_activity("SRC", "Go6976", dec).
0.001::e_ksea("SRC", "Go6976", dec); 0.7813235596::e_ksea("SRC", "Go6976", inc) :- e_activity("SRC", "Go6976", inc).
0.9246610655::e_ksea("SRC", "H89", dec); 0.001::e_ksea("SRC", "H89", inc) :- e_activity("SRC", "H89", dec).
0.001::e_ksea("SRC", "H89", dec); 0.9246610655::e_ksea("SRC", "H89", inc) :- e_activity("SRC", "H89", inc).
0.5650781645::e_ksea("SRC", "HS173", dec); 0.001::e_ksea("SRC", "HS173", inc) :- e_activity("SRC", "HS173", dec).
0.001::e_ksea("SRC", "HS173", dec); 0.5650781645::e_ksea("SRC", "HS173", inc) :- e_activity("SRC", "HS173", inc).
0.953712136::e_ksea("SRC", "Ipatasertib", dec); 0.001::e_ksea("SRC", "Ipatasertib", inc) :- e_activity("SRC", "Ipatasertib", dec).
0.001::e_ksea("SRC", "Ipatasertib", dec); 0.953712136::e_ksea("SRC", "Ipatasertib", inc) :- e_activity("SRC", "Ipatasertib", inc).
0.7610507859::e_ksea("SRC", "JNJ", dec); 0.001::e_ksea("SRC", "JNJ", inc) :- e_activity("SRC", "JNJ", dec).
0.001::e_ksea("SRC", "JNJ", dec); 0.7610507859::e_ksea("SRC", "JNJ", inc) :- e_activity("SRC", "JNJ", inc).
0.6327992685::e_ksea("SRC", "JNK", dec); 0.001::e_ksea("SRC", "JNK", inc) :- e_activity("SRC", "JNK", dec).
0.001::e_ksea("SRC", "JNK", dec); 0.6327992685::e_ksea("SRC", "JNK", inc) :- e_activity("SRC", "JNK", inc).
0.6146734092::e_ksea("SRC", "KD025", dec); 0.001::e_ksea("SRC", "KD025", inc) :- e_activity("SRC", "KD025", dec).
0.001::e_ksea("SRC", "KD025", dec); 0.6146734092::e_ksea("SRC", "KD025", inc) :- e_activity("SRC", "KD025", inc).
0.5552953468::e_ksea("SRC", "KN62", dec); 0.001::e_ksea("SRC", "KN62", inc) :- e_activity("SRC", "KN62", dec).
0.001::e_ksea("SRC", "KN62", dec); 0.5552953468::e_ksea("SRC", "KN62", inc) :- e_activity("SRC", "KN62", inc).
0.8675867996::e_ksea("SRC", "KN93", dec); 0.001::e_ksea("SRC", "KN93", inc) :- e_activity("SRC", "KN93", dec).
0.001::e_ksea("SRC", "KN93", dec); 0.8675867996::e_ksea("SRC", "KN93", inc) :- e_activity("SRC", "KN93", inc).
0.6996859575::e_ksea("SRC", "Ku0063794", dec); 0.001::e_ksea("SRC", "Ku0063794", inc) :- e_activity("SRC", "Ku0063794", dec).
0.001::e_ksea("SRC", "Ku0063794", dec); 0.6996859575::e_ksea("SRC", "Ku0063794", inc) :- e_activity("SRC", "Ku0063794", inc).
0.6699186491::e_ksea("SRC", "LY2090314", dec); 0.001::e_ksea("SRC", "LY2090314", inc) :- e_activity("SRC", "LY2090314", dec).
0.001::e_ksea("SRC", "LY2090314", dec); 0.6699186491::e_ksea("SRC", "LY2090314", inc) :- e_activity("SRC", "LY2090314", inc).
0.6762884945::e_ksea("SRC", "LY2584702", dec); 0.001::e_ksea("SRC", "LY2584702", inc) :- e_activity("SRC", "LY2584702", dec).
0.001::e_ksea("SRC", "LY2584702", dec); 0.6762884945::e_ksea("SRC", "LY2584702", inc) :- e_activity("SRC", "LY2584702", inc).
0.5665501728::e_ksea("SRC", "LY2835219", dec); 0.001::e_ksea("SRC", "LY2835219", inc) :- e_activity("SRC", "LY2835219", dec).
0.001::e_ksea("SRC", "LY2835219", dec); 0.5665501728::e_ksea("SRC", "LY2835219", inc) :- e_activity("SRC", "LY2835219", inc).
0.6908962879::e_ksea("SRC", "Linsitinib", dec); 0.001::e_ksea("SRC", "Linsitinib", inc) :- e_activity("SRC", "Linsitinib", dec).
0.001::e_ksea("SRC", "Linsitinib", dec); 0.6908962879::e_ksea("SRC", "Linsitinib", inc) :- e_activity("SRC", "Linsitinib", inc).
0.7587734741::e_ksea("SRC", "MK2206", dec); 0.001::e_ksea("SRC", "MK2206", inc) :- e_activity("SRC", "MK2206", dec).
0.001::e_ksea("SRC", "MK2206", dec); 0.7587734741::e_ksea("SRC", "MK2206", inc) :- e_activity("SRC", "MK2206", inc).
0.9262141975::e_ksea("SRC", "NU7441", dec); 0.001::e_ksea("SRC", "NU7441", inc) :- e_activity("SRC", "NU7441", dec).
0.001::e_ksea("SRC", "NU7441", dec); 0.9262141975::e_ksea("SRC", "NU7441", inc) :- e_activity("SRC", "NU7441", inc).
0.7547020431::e_ksea("SRC", "PD153035", dec); 0.001::e_ksea("SRC", "PD153035", inc) :- e_activity("SRC", "PD153035", dec).
0.001::e_ksea("SRC", "PD153035", dec); 0.7547020431::e_ksea("SRC", "PD153035", inc) :- e_activity("SRC", "PD153035", inc).
0.7221966639::e_ksea("SRC", "PF3758309", dec); 0.001::e_ksea("SRC", "PF3758309", inc) :- e_activity("SRC", "PF3758309", dec).
0.001::e_ksea("SRC", "PF3758309", dec); 0.7221966639::e_ksea("SRC", "PF3758309", inc) :- e_activity("SRC", "PF3758309", inc).
0.9067870045::e_ksea("SRC", "PF4708671", dec); 0.001::e_ksea("SRC", "PF4708671", inc) :- e_activity("SRC", "PF4708671", dec).
0.001::e_ksea("SRC", "PF4708671", dec); 0.9067870045::e_ksea("SRC", "PF4708671", inc) :- e_activity("SRC", "PF4708671", inc).
0.6567843858::e_ksea("SRC", "PH797804", dec); 0.001::e_ksea("SRC", "PH797804", inc) :- e_activity("SRC", "PH797804", dec).
0.001::e_ksea("SRC", "PH797804", dec); 0.6567843858::e_ksea("SRC", "PH797804", inc) :- e_activity("SRC", "PH797804", inc).
0.8808273::e_ksea("SRC", "PIK294", dec); 0.001::e_ksea("SRC", "PIK294", inc) :- e_activity("SRC", "PIK294", dec).
0.001::e_ksea("SRC", "PIK294", dec); 0.8808273::e_ksea("SRC", "PIK294", inc) :- e_activity("SRC", "PIK294", inc).
0.8713799873::e_ksea("SRC", "Ribociclib", dec); 0.001::e_ksea("SRC", "Ribociclib", inc) :- e_activity("SRC", "Ribociclib", dec).
0.001::e_ksea("SRC", "Ribociclib", dec); 0.8713799873::e_ksea("SRC", "Ribociclib", inc) :- e_activity("SRC", "Ribociclib", inc).
0.6171787004::e_ksea("SRC", "Ripasudil", dec); 0.001::e_ksea("SRC", "Ripasudil", inc) :- e_activity("SRC", "Ripasudil", dec).
0.001::e_ksea("SRC", "Ripasudil", dec); 0.6171787004::e_ksea("SRC", "Ripasudil", inc) :- e_activity("SRC", "Ripasudil", inc).
0.9475344372::e_ksea("SRC", "SP600125", dec); 0.001::e_ksea("SRC", "SP600125", inc) :- e_activity("SRC", "SP600125", dec).
0.001::e_ksea("SRC", "SP600125", dec); 0.9475344372::e_ksea("SRC", "SP600125", inc) :- e_activity("SRC", "SP600125", inc).
0.7202679311::e_ksea("SRC", "Selumetinib", dec); 0.001::e_ksea("SRC", "Selumetinib", inc) :- e_activity("SRC", "Selumetinib", dec).
0.001::e_ksea("SRC", "Selumetinib", dec); 0.7202679311::e_ksea("SRC", "Selumetinib", inc) :- e_activity("SRC", "Selumetinib", inc).
0.8338084969::e_ksea("SRC", "TAK715", dec); 0.001::e_ksea("SRC", "TAK715", inc) :- e_activity("SRC", "TAK715", dec).
0.001::e_ksea("SRC", "TAK715", dec); 0.8338084969::e_ksea("SRC", "TAK715", inc) :- e_activity("SRC", "TAK715", inc).
0.7682700659::e_ksea("SRC", "TBCA", dec); 0.001::e_ksea("SRC", "TBCA", inc) :- e_activity("SRC", "TBCA", dec).
0.001::e_ksea("SRC", "TBCA", dec); 0.7682700659::e_ksea("SRC", "TBCA", inc) :- e_activity("SRC", "TBCA", inc).
0.5999814232::e_ksea("SRC", "TGX221", dec); 0.001::e_ksea("SRC", "TGX221", inc) :- e_activity("SRC", "TGX221", dec).
0.001::e_ksea("SRC", "TGX221", dec); 0.5999814232::e_ksea("SRC", "TGX221", inc) :- e_activity("SRC", "TGX221", inc).
0.860738931::e_ksea("SRC", "Tofacitinib", dec); 0.001::e_ksea("SRC", "Tofacitinib", inc) :- e_activity("SRC", "Tofacitinib", dec).
0.001::e_ksea("SRC", "Tofacitinib", dec); 0.860738931::e_ksea("SRC", "Tofacitinib", inc) :- e_activity("SRC", "Tofacitinib", inc).
0.7746828572::e_ksea("SRC", "Torin", dec); 0.001::e_ksea("SRC", "Torin", inc) :- e_activity("SRC", "Torin", dec).
0.001::e_ksea("SRC", "Torin", dec); 0.7746828572::e_ksea("SRC", "Torin", inc) :- e_activity("SRC", "Torin", inc).
0.7352346687::e_ksea("SRC", "Trametinib", dec); 0.001::e_ksea("SRC", "Trametinib", inc) :- e_activity("SRC", "Trametinib", dec).
0.001::e_ksea("SRC", "Trametinib", dec); 0.7352346687::e_ksea("SRC", "Trametinib", inc) :- e_activity("SRC", "Trametinib", inc).
0.5503249012::e_ksea("SRC", "U73122", dec); 0.001::e_ksea("SRC", "U73122", inc) :- e_activity("SRC", "U73122", dec).
0.001::e_ksea("SRC", "U73122", dec); 0.5503249012::e_ksea("SRC", "U73122", inc) :- e_activity("SRC", "U73122", inc).
0.6018116265::e_ksea("SRC", "Ulixertinib", dec); 0.001::e_ksea("SRC", "Ulixertinib", inc) :- e_activity("SRC", "Ulixertinib", dec).
0.001::e_ksea("SRC", "Ulixertinib", dec); 0.6018116265::e_ksea("SRC", "Ulixertinib", inc) :- e_activity("SRC", "Ulixertinib", inc).
0.7965407629::e_ksea("SRC", "Vemurafenib", dec); 0.001::e_ksea("SRC", "Vemurafenib", inc) :- e_activity("SRC", "Vemurafenib", dec).
0.001::e_ksea("SRC", "Vemurafenib", dec); 0.7965407629::e_ksea("SRC", "Vemurafenib", inc) :- e_activity("SRC", "Vemurafenib", inc).
0.1757321005::e_ksea("ABL1", "AC220", dec); 0.1757321005::e_ksea("ABL1", "AC220", inc) :- enzyme("ABL1").
0.2046026536::e_ksea("ABL1", "AT13148", dec); 0.2046026536::e_ksea("ABL1", "AT13148", inc) :- enzyme("ABL1").
0.1741516215::e_ksea("ABL1", "AZ20", dec); 0.1741516215::e_ksea("ABL1", "AZ20", inc) :- enzyme("ABL1").
0.2151701559::e_ksea("ABL1", "AZD1480", dec); 0.2151701559::e_ksea("ABL1", "AZD1480", inc) :- enzyme("ABL1").
0.0817921827::e_ksea("ABL1", "AZD3759", dec); 0.0817921827::e_ksea("ABL1", "AZD3759", inc) :- enzyme("ABL1").
0.1347151883::e_ksea("ABL1", "AZD5363", dec); 0.1347151883::e_ksea("ABL1", "AZD5363", inc) :- enzyme("ABL1").
0.1986342296::e_ksea("ABL1", "AZD5438", dec); 0.1986342296::e_ksea("ABL1", "AZD5438", inc) :- enzyme("ABL1").
0.094617134::e_ksea("ABL1", "AZD6482", dec); 0.094617134::e_ksea("ABL1", "AZD6482", inc) :- enzyme("ABL1").
0.2468265561::e_ksea("ABL1", "AZD6738", dec); 0.2468265561::e_ksea("ABL1", "AZD6738", inc) :- enzyme("ABL1").
0.1883240092::e_ksea("ABL1", "AZD8055", dec); 0.1883240092::e_ksea("ABL1", "AZD8055", inc) :- enzyme("ABL1").
0.1477192854::e_ksea("ABL1", "Amuvatinib", dec); 0.1477192854::e_ksea("ABL1", "Amuvatinib", inc) :- enzyme("ABL1").
0.1872112858::e_ksea("ABL1", "BX912", dec); 0.1872112858::e_ksea("ABL1", "BX912", inc) :- enzyme("ABL1").
0.00692537::e_ksea("ABL1", "Bosutinib", dec); 0.00692537::e_ksea("ABL1", "Bosutinib", inc) :- enzyme("ABL1").
0.2238433245::e_ksea("ABL1", "CAL101", dec); 0.2238433245::e_ksea("ABL1", "CAL101", inc) :- enzyme("ABL1").
0.1081881675::e_ksea("ABL1", "CHIR99021", dec); 0.1081881675::e_ksea("ABL1", "CHIR99021", inc) :- enzyme("ABL1").
0.1098672625::e_ksea("ABL1", "CX4945", dec); 0.1098672625::e_ksea("ABL1", "CX4945", inc) :- enzyme("ABL1").
0.1436936221::e_ksea("ABL1", "DNAPK", dec); 0.1436936221::e_ksea("ABL1", "DNAPK", inc) :- enzyme("ABL1").
0.1316151279::e_ksea("ABL1", "Dabrafenib", dec); 0.1316151279::e_ksea("ABL1", "Dabrafenib", inc) :- enzyme("ABL1").
0.0011193671::e_ksea("ABL1", "Dasatinib", dec); 0.0011193671::e_ksea("ABL1", "Dasatinib", inc) :- enzyme("ABL1").
0.2442610734::e_ksea("ABL1", "Edelfosine", dec); 0.2442610734::e_ksea("ABL1", "Edelfosine", inc) :- enzyme("ABL1").
0.0078561203::e_ksea("ABL1", "FRAX486", dec); 0.0078561203::e_ksea("ABL1", "FRAX486", inc) :- enzyme("ABL1").
0.1024994037::e_ksea("ABL1", "GDC0941", dec); 0.1024994037::e_ksea("ABL1", "GDC0941", inc) :- enzyme("ABL1").
0.0669311461::e_ksea("ABL1", "GDC0994", dec); 0.0669311461::e_ksea("ABL1", "GDC0994", inc) :- enzyme("ABL1").
0.1802465061::e_ksea("ABL1", "GF109203X", dec); 0.1802465061::e_ksea("ABL1", "GF109203X", inc) :- enzyme("ABL1").
0.2468794757::e_ksea("ABL1", "GO6983", dec); 0.2468794757::e_ksea("ABL1", "GO6983", inc) :- enzyme("ABL1").
0.2448954568::e_ksea("ABL1", "GSK2334470", dec); 0.2448954568::e_ksea("ABL1", "GSK2334470", inc) :- enzyme("ABL1").
0.2195941844::e_ksea("ABL1", "GSK690693", dec); 0.2195941844::e_ksea("ABL1", "GSK690693", inc) :- enzyme("ABL1").
0.1842097366::e_ksea("ABL1", "Go6976", dec); 0.1842097366::e_ksea("ABL1", "Go6976", inc) :- enzyme("ABL1").
0.2381658585::e_ksea("ABL1", "H89", dec); 0.2381658585::e_ksea("ABL1", "H89", inc) :- enzyme("ABL1").
0.1863930324::e_ksea("ABL1", "HS173", dec); 0.1863930324::e_ksea("ABL1", "HS173", inc) :- enzyme("ABL1").
0.1211259428::e_ksea("ABL1", "Ipatasertib", dec); 0.1211259428::e_ksea("ABL1", "Ipatasertib", inc) :- enzyme("ABL1").
0.131753604::e_ksea("ABL1", "JNJ", dec); 0.131753604::e_ksea("ABL1", "JNJ", inc) :- enzyme("ABL1").
0.206604474::e_ksea("ABL1", "JNK", dec); 0.206604474::e_ksea("ABL1", "JNK", inc) :- enzyme("ABL1").
0.1736392536::e_ksea("ABL1", "KD025", dec); 0.1736392536::e_ksea("ABL1", "KD025", inc) :- enzyme("ABL1").
0.0929711012::e_ksea("ABL1", "KN62", dec); 0.0929711012::e_ksea("ABL1", "KN62", inc) :- enzyme("ABL1").
0.1407056674::e_ksea("ABL1", "KN93", dec); 0.1407056674::e_ksea("ABL1", "KN93", inc) :- enzyme("ABL1").
0.2039514882::e_ksea("ABL1", "Ku0063794", dec); 0.2039514882::e_ksea("ABL1", "Ku0063794", inc) :- enzyme("ABL1").
0.2234735548::e_ksea("ABL1", "LY2090314", dec); 0.2234735548::e_ksea("ABL1", "LY2090314", inc) :- enzyme("ABL1").
0.0870639998::e_ksea("ABL1", "LY2584702", dec); 0.0870639998::e_ksea("ABL1", "LY2584702", inc) :- enzyme("ABL1").
0.1572933947::e_ksea("ABL1", "LY2835219", dec); 0.1572933947::e_ksea("ABL1", "LY2835219", inc) :- enzyme("ABL1").
0.1407969747::e_ksea("ABL1", "Linsitinib", dec); 0.1407969747::e_ksea("ABL1", "Linsitinib", inc) :- enzyme("ABL1").
0.170756188::e_ksea("ABL1", "MK2206", dec); 0.170756188::e_ksea("ABL1", "MK2206", inc) :- enzyme("ABL1").
0.2145682141::e_ksea("ABL1", "NU7441", dec); 0.2145682141::e_ksea("ABL1", "NU7441", inc) :- enzyme("ABL1").
0.1881963365::e_ksea("ABL1", "PD153035", dec); 0.1881963365::e_ksea("ABL1", "PD153035", inc) :- enzyme("ABL1").
0.2160376196::e_ksea("ABL1", "PF3758309", dec); 0.2160376196::e_ksea("ABL1", "PF3758309", inc) :- enzyme("ABL1").
0.2442250567::e_ksea("ABL1", "PF4708671", dec); 0.2442250567::e_ksea("ABL1", "PF4708671", inc) :- enzyme("ABL1").
0.2143546402::e_ksea("ABL1", "PH797804", dec); 0.2143546402::e_ksea("ABL1", "PH797804", inc) :- enzyme("ABL1").
0.1995995594::e_ksea("ABL1", "PIK294", dec); 0.1995995594::e_ksea("ABL1", "PIK294", inc) :- enzyme("ABL1").
0.1242258135::e_ksea("ABL1", "Ribociclib", dec); 0.1242258135::e_ksea("ABL1", "Ribociclib", inc) :- enzyme("ABL1").
0.1797780148::e_ksea("ABL1", "Ripasudil", dec); 0.1797780148::e_ksea("ABL1", "Ripasudil", inc) :- enzyme("ABL1").
0.2083241596::e_ksea("ABL1", "SP600125", dec); 0.2083241596::e_ksea("ABL1", "SP600125", inc) :- enzyme("ABL1").
0.250009417::e_ksea("ABL1", "Selumetinib", dec); 0.250009417::e_ksea("ABL1", "Selumetinib", inc) :- enzyme("ABL1").
0.1607363573::e_ksea("ABL1", "TAK715", dec); 0.1607363573::e_ksea("ABL1", "TAK715", inc) :- enzyme("ABL1").
0.233665359::e_ksea("ABL1", "TBCA", dec); 0.233665359::e_ksea("ABL1", "TBCA", inc) :- enzyme("ABL1").
0.2235408321::e_ksea("ABL1", "TGX221", dec); 0.2235408321::e_ksea("ABL1", "TGX221", inc) :- enzyme("ABL1").
0.1216987188::e_ksea("ABL1", "Tofacitinib", dec); 0.1216987188::e_ksea("ABL1", "Tofacitinib", inc) :- enzyme("ABL1").
0.165101133::e_ksea("ABL1", "Torin", dec); 0.165101133::e_ksea("ABL1", "Torin", inc) :- enzyme("ABL1").
0.2341426691::e_ksea("ABL1", "Trametinib", dec); 0.2341426691::e_ksea("ABL1", "Trametinib", inc) :- enzyme("ABL1").
0.2261600435::e_ksea("ABL1", "U73122", dec); 0.2261600435::e_ksea("ABL1", "U73122", inc) :- enzyme("ABL1").
0.195616715::e_ksea("ABL1", "Ulixertinib", dec); 0.195616715::e_ksea("ABL1", "Ulixertinib", inc) :- enzyme("ABL1").
0.2457694515::e_ksea("ABL1", "Vemurafenib", dec); 0.2457694515::e_ksea("ABL1", "Vemurafenib", inc) :- enzyme("ABL1").
0.2401014394::e_ksea("FYN", "AC220", dec); 0.2401014394::e_ksea("FYN", "AC220", inc) :- enzyme("FYN").
0.2025128886::e_ksea("FYN", "AT13148", dec); 0.2025128886::e_ksea("FYN", "AT13148", inc) :- enzyme("FYN").
0.2095572563::e_ksea("FYN", "AZ20", dec); 0.2095572563::e_ksea("FYN", "AZ20", inc) :- enzyme("FYN").
0.2439109663::e_ksea("FYN", "AZD1480", dec); 0.2439109663::e_ksea("FYN", "AZD1480", inc) :- enzyme("FYN").
0.1977922894::e_ksea("FYN", "AZD3759", dec); 0.1977922894::e_ksea("FYN", "AZD3759", inc) :- enzyme("FYN").
0.2330463931::e_ksea("FYN", "AZD5363", dec); 0.2330463931::e_ksea("FYN", "AZD5363", inc) :- enzyme("FYN").
0.2377212949::e_ksea("FYN", "AZD5438", dec); 0.2377212949::e_ksea("FYN", "AZD5438", inc) :- enzyme("FYN").
0.1980088813::e_ksea("FYN", "AZD6482", dec); 0.1980088813::e_ksea("FYN", "AZD6482", inc) :- enzyme("FYN").
0.2231809083::e_ksea("FYN", "AZD6738", dec); 0.2231809083::e_ksea("FYN", "AZD6738", inc) :- enzyme("FYN").
0.2304091547::e_ksea("FYN", "AZD8055", dec); 0.2304091547::e_ksea("FYN", "AZD8055", inc) :- enzyme("FYN").
0.211878782::e_ksea("FYN", "Amuvatinib", dec); 0.211878782::e_ksea("FYN", "Amuvatinib", inc) :- enzyme("FYN").
0.2284528942::e_ksea("FYN", "BX912", dec); 0.2284528942::e_ksea("FYN", "BX912", inc) :- enzyme("FYN").
0.2116959828::e_ksea("FYN", "Bosutinib", dec); 0.2116959828::e_ksea("FYN", "Bosutinib", inc) :- enzyme("FYN").
0.2365759328::e_ksea("FYN", "CAL101", dec); 0.2365759328::e_ksea("FYN", "CAL101", inc) :- enzyme("FYN").
0.2220816339::e_ksea("FYN", "CHIR99021", dec); 0.2220816339::e_ksea("FYN", "CHIR99021", inc) :- enzyme("FYN").
0.1681855689::e_ksea("FYN", "CX4945", dec); 0.1681855689::e_ksea("FYN", "CX4945", inc) :- enzyme("FYN").
0.2436953325::e_ksea("FYN", "DNAPK", dec); 0.2436953325::e_ksea("FYN", "DNAPK", inc) :- enzyme("FYN").
0.2140295787::e_ksea("FYN", "Dabrafenib", dec); 0.2140295787::e_ksea("FYN", "Dabrafenib", inc) :- enzyme("FYN").
0.2431141761::e_ksea("FYN", "Dasatinib", dec); 0.2431141761::e_ksea("FYN", "Dasatinib", inc) :- enzyme("FYN").
0.2466169895::e_ksea("FYN", "Edelfosine", dec); 0.2466169895::e_ksea("FYN", "Edelfosine", inc) :- enzyme("FYN").
0.2255253966::e_ksea("FYN", "FRAX486", dec); 0.2255253966::e_ksea("FYN", "FRAX486", inc) :- enzyme("FYN").
0.2329851497::e_ksea("FYN", "GDC0941", dec); 0.2329851497::e_ksea("FYN", "GDC0941", inc) :- enzyme("FYN").
0.2250560364::e_ksea("FYN", "GDC0994", dec); 0.2250560364::e_ksea("FYN", "GDC0994", inc) :- enzyme("FYN").
0.2352680739::e_ksea("FYN", "GF109203X", dec); 0.2352680739::e_ksea("FYN", "GF109203X", inc) :- enzyme("FYN").
0.2419174432::e_ksea("FYN", "GO6983", dec); 0.2419174432::e_ksea("FYN", "GO6983", inc) :- enzyme("FYN").
0.2085214125::e_ksea("FYN", "GSK2334470", dec); 0.2085214125::e_ksea("FYN", "GSK2334470", inc) :- enzyme("FYN").
0.1907424651::e_ksea("FYN", "GSK690693", dec); 0.1907424651::e_ksea("FYN", "GSK690693", inc) :- enzyme("FYN").
0.2425701813::e_ksea("FYN", "Go6976", dec); 0.2425701813::e_ksea("FYN", "Go6976", inc) :- enzyme("FYN").
0.2422402032::e_ksea("FYN", "H89", dec); 0.2422402032::e_ksea("FYN", "H89", inc) :- enzyme("FYN").
0.2454192692::e_ksea("FYN", "HS173", dec); 0.2454192692::e_ksea("FYN", "HS173", inc) :- enzyme("FYN").
0.2235733398::e_ksea("FYN", "Ipatasertib", dec); 0.2235733398::e_ksea("FYN", "Ipatasertib", inc) :- enzyme("FYN").
0.243826086::e_ksea("FYN", "JNJ", dec); 0.243826086::e_ksea("FYN", "JNJ", inc) :- enzyme("FYN").
0.1699830323::e_ksea("FYN", "JNK", dec); 0.1699830323::e_ksea("FYN", "JNK", inc) :- enzyme("FYN").
0.2095200552::e_ksea("FYN", "KD025", dec); 0.2095200552::e_ksea("FYN", "KD025", inc) :- enzyme("FYN").
0.179715181::e_ksea("FYN", "KN62", dec); 0.179715181::e_ksea("FYN", "KN62", inc) :- enzyme("FYN").
0.175198318::e_ksea("FYN", "KN93", dec); 0.175198318::e_ksea("FYN", "KN93", inc) :- enzyme("FYN").
0.2333946797::e_ksea("FYN", "Ku0063794", dec); 0.2333946797::e_ksea("FYN", "Ku0063794", inc) :- enzyme("FYN").
0.2272876279::e_ksea("FYN", "LY2090314", dec); 0.2272876279::e_ksea("FYN", "LY2090314", inc) :- enzyme("FYN").
0.2091879407::e_ksea("FYN", "LY2584702", dec); 0.2091879407::e_ksea("FYN", "LY2584702", inc) :- enzyme("FYN").
0.2168474068::e_ksea("FYN", "LY2835219", dec); 0.2168474068::e_ksea("FYN", "LY2835219", inc) :- enzyme("FYN").
0.1751458455::e_ksea("FYN", "Linsitinib", dec); 0.1751458455::e_ksea("FYN", "Linsitinib", inc) :- enzyme("FYN").
0.2056241408::e_ksea("FYN", "MK2206", dec); 0.2056241408::e_ksea("FYN", "MK2206", inc) :- enzyme("FYN").
0.23944207::e_ksea("FYN", "NU7441", dec); 0.23944207::e_ksea("FYN", "NU7441", inc) :- enzyme("FYN").
0.2417803935::e_ksea("FYN", "PD153035", dec); 0.2417803935::e_ksea("FYN", "PD153035", inc) :- enzyme("FYN").
0.2480486237::e_ksea("FYN", "PF3758309", dec); 0.2480486237::e_ksea("FYN", "PF3758309", inc) :- enzyme("FYN").
0.1933023432::e_ksea("FYN", "PF4708671", dec); 0.1933023432::e_ksea("FYN", "PF4708671", inc) :- enzyme("FYN").
0.2361870703::e_ksea("FYN", "PH797804", dec); 0.2361870703::e_ksea("FYN", "PH797804", inc) :- enzyme("FYN").
0.2391141474::e_ksea("FYN", "PIK294", dec); 0.2391141474::e_ksea("FYN", "PIK294", inc) :- enzyme("FYN").
0.2378438609::e_ksea("FYN", "Ribociclib", dec); 0.2378438609::e_ksea("FYN", "Ribociclib", inc) :- enzyme("FYN").
0.2074268762::e_ksea("FYN", "Ripasudil", dec); 0.2074268762::e_ksea("FYN", "Ripasudil", inc) :- enzyme("FYN").
0.2428216956::e_ksea("FYN", "SP600125", dec); 0.2428216956::e_ksea("FYN", "SP600125", inc) :- enzyme("FYN").
0.2400042855::e_ksea("FYN", "Selumetinib", dec); 0.2400042855::e_ksea("FYN", "Selumetinib", inc) :- enzyme("FYN").
0.2415017209::e_ksea("FYN", "TAK715", dec); 0.2415017209::e_ksea("FYN", "TAK715", inc) :- enzyme("FYN").
0.2152919799::e_ksea("FYN", "TBCA", dec); 0.2152919799::e_ksea("FYN", "TBCA", inc) :- enzyme("FYN").
0.2433509955::e_ksea("FYN", "TGX221", dec); 0.2433509955::e_ksea("FYN", "TGX221", inc) :- enzyme("FYN").
0.216932632::e_ksea("FYN", "Tofacitinib", dec); 0.216932632::e_ksea("FYN", "Tofacitinib", inc) :- enzyme("FYN").
0.2069516887::e_ksea("FYN", "Torin", dec); 0.2069516887::e_ksea("FYN", "Torin", inc) :- enzyme("FYN").
0.2240309323::e_ksea("FYN", "Trametinib", dec); 0.2240309323::e_ksea("FYN", "Trametinib", inc) :- enzyme("FYN").
0.2468382315::e_ksea("FYN", "U73122", dec); 0.2468382315::e_ksea("FYN", "U73122", inc) :- enzyme("FYN").
0.2466102013::e_ksea("FYN", "Ulixertinib", dec); 0.2466102013::e_ksea("FYN", "Ulixertinib", inc) :- enzyme("FYN").
0.2291662659::e_ksea("FYN", "Vemurafenib", dec); 0.2291662659::e_ksea("FYN", "Vemurafenib", inc) :- enzyme("FYN").
0.1723404943::e_ksea("HIPK2", "AC220", dec); 0.1723404943::e_ksea("HIPK2", "AC220", inc) :- enzyme("HIPK2").
0.1501457426::e_ksea("HIPK2", "AT13148", dec); 0.1501457426::e_ksea("HIPK2", "AT13148", inc) :- enzyme("HIPK2").
0.1682203768::e_ksea("HIPK2", "AZ20", dec); 0.1682203768::e_ksea("HIPK2", "AZ20", inc) :- enzyme("HIPK2").
0.0161384162::e_ksea("HIPK2", "AZD1480", dec); 0.0161384162::e_ksea("HIPK2", "AZD1480", inc) :- enzyme("HIPK2").
0.0618835114::e_ksea("HIPK2", "AZD3759", dec); 0.0618835114::e_ksea("HIPK2", "AZD3759", inc) :- enzyme("HIPK2").
0.0085644664::e_ksea("HIPK2", "AZD5363", dec); 0.0085644664::e_ksea("HIPK2", "AZD5363", inc) :- enzyme("HIPK2").
0.0015286759::e_ksea("HIPK2", "AZD5438", dec); 0.0015286759::e_ksea("HIPK2", "AZD5438", inc) :- enzyme("HIPK2").
0.1167187939::e_ksea("HIPK2", "AZD6482", dec); 0.1167187939::e_ksea("HIPK2", "AZD6482", inc) :- enzyme("HIPK2").
0.099631607::e_ksea("HIPK2", "AZD6738", dec); 0.099631607::e_ksea("HIPK2", "AZD6738", inc) :- enzyme("HIPK2").
0.1295317803::e_ksea("HIPK2", "AZD8055", dec); 0.1295317803::e_ksea("HIPK2", "AZD8055", inc) :- enzyme("HIPK2").
0.230705371::e_ksea("HIPK2", "Amuvatinib", dec); 0.230705371::e_ksea("HIPK2", "Amuvatinib", inc) :- enzyme("HIPK2").
0.0308617248::e_ksea("HIPK2", "BX912", dec); 0.0308617248::e_ksea("HIPK2", "BX912", inc) :- enzyme("HIPK2").
0.1567452947::e_ksea("HIPK2", "Bosutinib", dec); 0.1567452947::e_ksea("HIPK2", "Bosutinib", inc) :- enzyme("HIPK2").
0.1519917707::e_ksea("HIPK2", "CAL101", dec); 0.1519917707::e_ksea("HIPK2", "CAL101", inc) :- enzyme("HIPK2").
0.0459298351::e_ksea("HIPK2", "CHIR99021", dec); 0.0459298351::e_ksea("HIPK2", "CHIR99021", inc) :- enzyme("HIPK2").
0.0498220372::e_ksea("HIPK2", "CX4945", dec); 0.0498220372::e_ksea("HIPK2", "CX4945", inc) :- enzyme("HIPK2").
0.2309054662::e_ksea("HIPK2", "DNAPK", dec); 0.2309054662::e_ksea("HIPK2", "DNAPK", inc) :- enzyme("HIPK2").
0.1899421456::e_ksea("HIPK2", "Dabrafenib", dec); 0.1899421456::e_ksea("HIPK2", "Dabrafenib", inc) :- enzyme("HIPK2").
0.1526402303::e_ksea("HIPK2", "Dasatinib", dec); 0.1526402303::e_ksea("HIPK2", "Dasatinib", inc) :- enzyme("HIPK2").
0.1801439749::e_ksea("HIPK2", "Edelfosine", dec); 0.1801439749::e_ksea("HIPK2", "Edelfosine", inc) :- enzyme("HIPK2").
0.0137792402::e_ksea("HIPK2", "FRAX486", dec); 0.0137792402::e_ksea("HIPK2", "FRAX486", inc) :- enzyme("HIPK2").
0.0256196504::e_ksea("HIPK2", "GDC0941", dec); 0.0256196504::e_ksea("HIPK2", "GDC0941", inc) :- enzyme("HIPK2").
0.0422162876::e_ksea("HIPK2", "GDC0994", dec); 0.0422162876::e_ksea("HIPK2", "GDC0994", inc) :- enzyme("HIPK2").
0.0785312654::e_ksea("HIPK2", "GF109203X", dec); 0.0785312654::e_ksea("HIPK2", "GF109203X", inc) :- enzyme("HIPK2").
0.0542776801::e_ksea("HIPK2", "GO6983", dec); 0.0542776801::e_ksea("HIPK2", "GO6983", inc) :- enzyme("HIPK2").
0.0663196111::e_ksea("HIPK2", "GSK2334470", dec); 0.0663196111::e_ksea("HIPK2", "GSK2334470", inc) :- enzyme("HIPK2").
0.1543549056::e_ksea("HIPK2", "GSK690693", dec); 0.1543549056::e_ksea("HIPK2", "GSK690693", inc) :- enzyme("HIPK2").
0.1089971104::e_ksea("HIPK2", "Go6976", dec); 0.1089971104::e_ksea("HIPK2", "Go6976", inc) :- enzyme("HIPK2").
0.1255113585::e_ksea("HIPK2", "H89", dec); 0.1255113585::e_ksea("HIPK2", "H89", inc) :- enzyme("HIPK2").
0.1108135907::e_ksea("HIPK2", "HS173", dec); 0.1108135907::e_ksea("HIPK2", "HS173", inc) :- enzyme("HIPK2").
0.0527403695::e_ksea("HIPK2", "Ipatasertib", dec); 0.0527403695::e_ksea("HIPK2", "Ipatasertib", inc) :- enzyme("HIPK2").
0.0937528206::e_ksea("HIPK2", "JNJ", dec); 0.0937528206::e_ksea("HIPK2", "JNJ", inc) :- enzyme("HIPK2").
0.1620144923::e_ksea("HIPK2", "JNK", dec); 0.1620144923::e_ksea("HIPK2", "JNK", inc) :- enzyme("HIPK2").
0.0994108341::e_ksea("HIPK2", "KD025", dec); 0.0994108341::e_ksea("HIPK2", "KD025", inc) :- enzyme("HIPK2").
0.0305160261::e_ksea("HIPK2", "KN62", dec); 0.0305160261::e_ksea("HIPK2", "KN62", inc) :- enzyme("HIPK2").
0.1301005853::e_ksea("HIPK2", "KN93", dec); 0.1301005853::e_ksea("HIPK2", "KN93", inc) :- enzyme("HIPK2").
0.129318861::e_ksea("HIPK2", "Ku0063794", dec); 0.129318861::e_ksea("HIPK2", "Ku0063794", inc) :- enzyme("HIPK2").
0.0184516654::e_ksea("HIPK2", "LY2090314", dec); 0.0184516654::e_ksea("HIPK2", "LY2090314", inc) :- enzyme("HIPK2").
0.052742665::e_ksea("HIPK2", "LY2584702", dec); 0.052742665::e_ksea("HIPK2", "LY2584702", inc) :- enzyme("HIPK2").
0.2390625949::e_ksea("HIPK2", "LY2835219", dec); 0.2390625949::e_ksea("HIPK2", "LY2835219", inc) :- enzyme("HIPK2").
0.2097752736::e_ksea("HIPK2", "Linsitinib", dec); 0.2097752736::e_ksea("HIPK2", "Linsitinib", inc) :- enzyme("HIPK2").
0.2093598492::e_ksea("HIPK2", "MK2206", dec); 0.2093598492::e_ksea("HIPK2", "MK2206", inc) :- enzyme("HIPK2").
0.2231107227::e_ksea("HIPK2", "NU7441", dec); 0.2231107227::e_ksea("HIPK2", "NU7441", inc) :- enzyme("HIPK2").
0.1539730374::e_ksea("HIPK2", "PD153035", dec); 0.1539730374::e_ksea("HIPK2", "PD153035", inc) :- enzyme("HIPK2").
0.0030878516::e_ksea("HIPK2", "PF3758309", dec); 0.0030878516::e_ksea("HIPK2", "PF3758309", inc) :- enzyme("HIPK2").
0.1077360209::e_ksea("HIPK2", "PF4708671", dec); 0.1077360209::e_ksea("HIPK2", "PF4708671", inc) :- enzyme("HIPK2").
0.2044038551::e_ksea("HIPK2", "PH797804", dec); 0.2044038551::e_ksea("HIPK2", "PH797804", inc) :- enzyme("HIPK2").
0.0413472236::e_ksea("HIPK2", "PIK294", dec); 0.0413472236::e_ksea("HIPK2", "PIK294", inc) :- enzyme("HIPK2").
0.231802535::e_ksea("HIPK2", "Ribociclib", dec); 0.231802535::e_ksea("HIPK2", "Ribociclib", inc) :- enzyme("HIPK2").
0.0353444295::e_ksea("HIPK2", "Ripasudil", dec); 0.0353444295::e_ksea("HIPK2", "Ripasudil", inc) :- enzyme("HIPK2").
0.0586182304::e_ksea("HIPK2", "SP600125", dec); 0.0586182304::e_ksea("HIPK2", "SP600125", inc) :- enzyme("HIPK2").
0.2135474968::e_ksea("HIPK2", "Selumetinib", dec); 0.2135474968::e_ksea("HIPK2", "Selumetinib", inc) :- enzyme("HIPK2").
0.100354194::e_ksea("HIPK2", "TAK715", dec); 0.100354194::e_ksea("HIPK2", "TAK715", inc) :- enzyme("HIPK2").
0.1511511723::e_ksea("HIPK2", "TBCA", dec); 0.1511511723::e_ksea("HIPK2", "TBCA", inc) :- enzyme("HIPK2").
0.0957276703::e_ksea("HIPK2", "TGX221", dec); 0.0957276703::e_ksea("HIPK2", "TGX221", inc) :- enzyme("HIPK2").
0.1733025996::e_ksea("HIPK2", "Tofacitinib", dec); 0.1733025996::e_ksea("HIPK2", "Tofacitinib", inc) :- enzyme("HIPK2").
0.2159084129::e_ksea("HIPK2", "Torin", dec); 0.2159084129::e_ksea("HIPK2", "Torin", inc) :- enzyme("HIPK2").
0.1188123713::e_ksea("HIPK2", "Trametinib", dec); 0.1188123713::e_ksea("HIPK2", "Trametinib", inc) :- enzyme("HIPK2").
0.2157866012::e_ksea("HIPK2", "U73122", dec); 0.2157866012::e_ksea("HIPK2", "U73122", inc) :- enzyme("HIPK2").
0.215902284::e_ksea("HIPK2", "Ulixertinib", dec); 0.215902284::e_ksea("HIPK2", "Ulixertinib", inc) :- enzyme("HIPK2").
0.1861687692::e_ksea("HIPK2", "Vemurafenib", dec); 0.1861687692::e_ksea("HIPK2", "Vemurafenib", inc) :- enzyme("HIPK2").
0.2465212194::e_ksea("PTK2", "AC220", dec); 0.2465212194::e_ksea("PTK2", "AC220", inc) :- enzyme("PTK2").
0.166496334::e_ksea("PTK2", "AT13148", dec); 0.166496334::e_ksea("PTK2", "AT13148", inc) :- enzyme("PTK2").
0.1674068568::e_ksea("PTK2", "AZ20", dec); 0.1674068568::e_ksea("PTK2", "AZ20", inc) :- enzyme("PTK2").
0.1031132525::e_ksea("PTK2", "AZD1480", dec); 0.1031132525::e_ksea("PTK2", "AZD1480", inc) :- enzyme("PTK2").
0.1303065701::e_ksea("PTK2", "AZD3759", dec); 0.1303065701::e_ksea("PTK2", "AZD3759", inc) :- enzyme("PTK2").
0.1039575882::e_ksea("PTK2", "AZD5363", dec); 0.1039575882::e_ksea("PTK2", "AZD5363", inc) :- enzyme("PTK2").
0.2355395636::e_ksea("PTK2", "AZD5438", dec); 0.2355395636::e_ksea("PTK2", "AZD5438", inc) :- enzyme("PTK2").
0.1192211271::e_ksea("PTK2", "AZD6482", dec); 0.1192211271::e_ksea("PTK2", "AZD6482", inc) :- enzyme("PTK2").
0.1935180507::e_ksea("PTK2", "AZD6738", dec); 0.1935180507::e_ksea("PTK2", "AZD6738", inc) :- enzyme("PTK2").
0.1284508506::e_ksea("PTK2", "AZD8055", dec); 0.1284508506::e_ksea("PTK2", "AZD8055", inc) :- enzyme("PTK2").
0.203151619::e_ksea("PTK2", "Amuvatinib", dec); 0.203151619::e_ksea("PTK2", "Amuvatinib", inc) :- enzyme("PTK2").
0.1031203865::e_ksea("PTK2", "BX912", dec); 0.1031203865::e_ksea("PTK2", "BX912", inc) :- enzyme("PTK2").
0.2238893949::e_ksea("PTK2", "Bosutinib", dec); 0.2238893949::e_ksea("PTK2", "Bosutinib", inc) :- enzyme("PTK2").
0.1637633187::e_ksea("PTK2", "CAL101", dec); 0.1637633187::e_ksea("PTK2", "CAL101", inc) :- enzyme("PTK2").
0.161979778::e_ksea("PTK2", "CHIR99021", dec); 0.161979778::e_ksea("PTK2", "CHIR99021", inc) :- enzyme("PTK2").
0.2044494765::e_ksea("PTK2", "CX4945", dec); 0.2044494765::e_ksea("PTK2", "CX4945", inc) :- enzyme("PTK2").
0.1868550986::e_ksea("PTK2", "DNAPK", dec); 0.1868550986::e_ksea("PTK2", "DNAPK", inc) :- enzyme("PTK2").
0.1657331375::e_ksea("PTK2", "Dabrafenib", dec); 0.1657331375::e_ksea("PTK2", "Dabrafenib", inc) :- enzyme("PTK2").
0.2302351576::e_ksea("PTK2", "Dasatinib", dec); 0.2302351576::e_ksea("PTK2", "Dasatinib", inc) :- enzyme("PTK2").
0.2078433508::e_ksea("PTK2", "Edelfosine", dec); 0.2078433508::e_ksea("PTK2", "Edelfosine", inc) :- enzyme("PTK2").
0.1680848529::e_ksea("PTK2", "FRAX486", dec); 0.1680848529::e_ksea("PTK2", "FRAX486", inc) :- enzyme("PTK2").
0.1575811219::e_ksea("PTK2", "GDC0941", dec); 0.1575811219::e_ksea("PTK2", "GDC0941", inc) :- enzyme("PTK2").
0.1120923185::e_ksea("PTK2", "GDC0994", dec); 0.1120923185::e_ksea("PTK2", "GDC0994", inc) :- enzyme("PTK2").
0.17254135::e_ksea("PTK2", "GF109203X", dec); 0.17254135::e_ksea("PTK2", "GF109203X", inc) :- enzyme("PTK2").
0.2366623543::e_ksea("PTK2", "GO6983", dec); 0.2366623543::e_ksea("PTK2", "GO6983", inc) :- enzyme("PTK2").
0.1027284624::e_ksea("PTK2", "GSK2334470", dec); 0.1027284624::e_ksea("PTK2", "GSK2334470", inc) :- enzyme("PTK2").
0.2263311362::e_ksea("PTK2", "GSK690693", dec); 0.2263311362::e_ksea("PTK2", "GSK690693", inc) :- enzyme("PTK2").
0.1875425927::e_ksea("PTK2", "Go6976", dec); 0.1875425927::e_ksea("PTK2", "Go6976", inc) :- enzyme("PTK2").
0.2031505237::e_ksea("PTK2", "H89", dec); 0.2031505237::e_ksea("PTK2", "H89", inc) :- enzyme("PTK2").
0.2339607497::e_ksea("PTK2", "HS173", dec); 0.2339607497::e_ksea("PTK2", "HS173", inc) :- enzyme("PTK2").
0.1009570849::e_ksea("PTK2", "Ipatasertib", dec); 0.1009570849::e_ksea("PTK2", "Ipatasertib", inc) :- enzyme("PTK2").
0.1958975809::e_ksea("PTK2", "JNJ", dec); 0.1958975809::e_ksea("PTK2", "JNJ", inc) :- enzyme("PTK2").
0.1661738451::e_ksea("PTK2", "JNK", dec); 0.1661738451::e_ksea("PTK2", "JNK", inc) :- enzyme("PTK2").
0.1269724758::e_ksea("PTK2", "KD025", dec); 0.1269724758::e_ksea("PTK2", "KD025", inc) :- enzyme("PTK2").
0.1355874377::e_ksea("PTK2", "KN62", dec); 0.1355874377::e_ksea("PTK2", "KN62", inc) :- enzyme("PTK2").
0.2203337421::e_ksea("PTK2", "KN93", dec); 0.2203337421::e_ksea("PTK2", "KN93", inc) :- enzyme("PTK2").
0.2201858395::e_ksea("PTK2", "Ku0063794", dec); 0.2201858395::e_ksea("PTK2", "Ku0063794", inc) :- enzyme("PTK2").
0.1116778324::e_ksea("PTK2", "LY2090314", dec); 0.1116778324::e_ksea("PTK2", "LY2090314", inc) :- enzyme("PTK2").
0.1149083261::e_ksea("PTK2", "LY2584702", dec); 0.1149083261::e_ksea("PTK2", "LY2584702", inc) :- enzyme("PTK2").
0.1546146878::e_ksea("PTK2", "LY2835219", dec); 0.1546146878::e_ksea("PTK2", "LY2835219", inc) :- enzyme("PTK2").
0.1766257273::e_ksea("PTK2", "Linsitinib", dec); 0.1766257273::e_ksea("PTK2", "Linsitinib", inc) :- enzyme("PTK2").
0.2022161449::e_ksea("PTK2", "MK2206", dec); 0.2022161449::e_ksea("PTK2", "MK2206", inc) :- enzyme("PTK2").
0.152908958::e_ksea("PTK2", "NU7441", dec); 0.152908958::e_ksea("PTK2", "NU7441", inc) :- enzyme("PTK2").
0.1486988758::e_ksea("PTK2", "PD153035", dec); 0.1486988758::e_ksea("PTK2", "PD153035", inc) :- enzyme("PTK2").
0.2071179182::e_ksea("PTK2", "PF3758309", dec); 0.2071179182::e_ksea("PTK2", "PF3758309", inc) :- enzyme("PTK2").
0.232998921::e_ksea("PTK2", "PF4708671", dec); 0.232998921::e_ksea("PTK2", "PF4708671", inc) :- enzyme("PTK2").
0.2206624154::e_ksea("PTK2", "PH797804", dec); 0.2206624154::e_ksea("PTK2", "PH797804", inc) :- enzyme("PTK2").
0.151554669::e_ksea("PTK2", "PIK294", dec); 0.151554669::e_ksea("PTK2", "PIK294", inc) :- enzyme("PTK2").
0.132080545::e_ksea("PTK2", "Ribociclib", dec); 0.132080545::e_ksea("PTK2", "Ribociclib", inc) :- enzyme("PTK2").
0.1941721227::e_ksea("PTK2", "Ripasudil", dec); 0.1941721227::e_ksea("PTK2", "Ripasudil", inc) :- enzyme("PTK2").
0.2083948143::e_ksea("PTK2", "SP600125", dec); 0.2083948143::e_ksea("PTK2", "SP600125", inc) :- enzyme("PTK2").
0.1746521395::e_ksea("PTK2", "Selumetinib", dec); 0.1746521395::e_ksea("PTK2", "Selumetinib", inc) :- enzyme("PTK2").
0.1067255015::e_ksea("PTK2", "TAK715", dec); 0.1067255015::e_ksea("PTK2", "TAK715", inc) :- enzyme("PTK2").
0.1672260641::e_ksea("PTK2", "TBCA", dec); 0.1672260641::e_ksea("PTK2", "TBCA", inc) :- enzyme("PTK2").
0.174269569::e_ksea("PTK2", "TGX221", dec); 0.174269569::e_ksea("PTK2", "TGX221", inc) :- enzyme("PTK2").
0.1045653563::e_ksea("PTK2", "Tofacitinib", dec); 0.1045653563::e_ksea("PTK2", "Tofacitinib", inc) :- enzyme("PTK2").
0.2259752912::e_ksea("PTK2", "Torin", dec); 0.2259752912::e_ksea("PTK2", "Torin", inc) :- enzyme("PTK2").
0.2275492576::e_ksea("PTK2", "Trametinib", dec); 0.2275492576::e_ksea("PTK2", "Trametinib", inc) :- enzyme("PTK2").
0.2231849364::e_ksea("PTK2", "U73122", dec); 0.2231849364::e_ksea("PTK2", "U73122", inc) :- enzyme("PTK2").
0.2426693093::e_ksea("PTK2", "Ulixertinib", dec); 0.2426693093::e_ksea("PTK2", "Ulixertinib", inc) :- enzyme("PTK2").
0.1399464101::e_ksea("PTK2", "Vemurafenib", dec); 0.1399464101::e_ksea("PTK2", "Vemurafenib", inc) :- enzyme("PTK2").
0.2397396113::e_ksea("PTK6", "AC220", dec); 0.2397396113::e_ksea("PTK6", "AC220", inc) :- enzyme("PTK6").
0.1628985633::e_ksea("PTK6", "AT13148", dec); 0.1628985633::e_ksea("PTK6", "AT13148", inc) :- enzyme("PTK6").
0.173530662::e_ksea("PTK6", "AZ20", dec); 0.173530662::e_ksea("PTK6", "AZ20", inc) :- enzyme("PTK6").
0.1554267996::e_ksea("PTK6", "AZD1480", dec); 0.1554267996::e_ksea("PTK6", "AZD1480", inc) :- enzyme("PTK6").
0.1210896009::e_ksea("PTK6", "AZD3759", dec); 0.1210896009::e_ksea("PTK6", "AZD3759", inc) :- enzyme("PTK6").
0.1363355022::e_ksea("PTK6", "AZD5363", dec); 0.1363355022::e_ksea("PTK6", "AZD5363", inc) :- enzyme("PTK6").
0.2131427095::e_ksea("PTK6", "AZD5438", dec); 0.2131427095::e_ksea("PTK6", "AZD5438", inc) :- enzyme("PTK6").
0.2156010787::e_ksea("PTK6", "AZD6482", dec); 0.2156010787::e_ksea("PTK6", "AZD6482", inc) :- enzyme("PTK6").
0.152421527::e_ksea("PTK6", "AZD6738", dec); 0.152421527::e_ksea("PTK6", "AZD6738", inc) :- enzyme("PTK6").
0.1985867442::e_ksea("PTK6", "AZD8055", dec); 0.1985867442::e_ksea("PTK6", "AZD8055", inc) :- enzyme("PTK6").
0.1837492627::e_ksea("PTK6", "Amuvatinib", dec); 0.1837492627::e_ksea("PTK6", "Amuvatinib", inc) :- enzyme("PTK6").
0.1535931872::e_ksea("PTK6", "BX912", dec); 0.1535931872::e_ksea("PTK6", "BX912", inc) :- enzyme("PTK6").
0.129165004::e_ksea("PTK6", "Bosutinib", dec); 0.129165004::e_ksea("PTK6", "Bosutinib", inc) :- enzyme("PTK6").
0.240408677::e_ksea("PTK6", "CAL101", dec); 0.240408677::e_ksea("PTK6", "CAL101", inc) :- enzyme("PTK6").
0.1346447092::e_ksea("PTK6", "CHIR99021", dec); 0.1346447092::e_ksea("PTK6", "CHIR99021", inc) :- enzyme("PTK6").
0.1141651327::e_ksea("PTK6", "CX4945", dec); 0.1141651327::e_ksea("PTK6", "CX4945", inc) :- enzyme("PTK6").
0.1228181062::e_ksea("PTK6", "DNAPK", dec); 0.1228181062::e_ksea("PTK6", "DNAPK", inc) :- enzyme("PTK6").
0.1464777876::e_ksea("PTK6", "Dabrafenib", dec); 0.1464777876::e_ksea("PTK6", "Dabrafenib", inc) :- enzyme("PTK6").
0.1422479716::e_ksea("PTK6", "Dasatinib", dec); 0.1422479716::e_ksea("PTK6", "Dasatinib", inc) :- enzyme("PTK6").
0.2020797258::e_ksea("PTK6", "Edelfosine", dec); 0.2020797258::e_ksea("PTK6", "Edelfosine", inc) :- enzyme("PTK6").
0.1979314452::e_ksea("PTK6", "FRAX486", dec); 0.1979314452::e_ksea("PTK6", "FRAX486", inc) :- enzyme("PTK6").
0.2265366662::e_ksea("PTK6", "GDC0941", dec); 0.2265366662::e_ksea("PTK6", "GDC0941", inc) :- enzyme("PTK6").
0.1775451932::e_ksea("PTK6", "GDC0994", dec); 0.1775451932::e_ksea("PTK6", "GDC0994", inc) :- enzyme("PTK6").
0.1424667211::e_ksea("PTK6", "GF109203X", dec); 0.1424667211::e_ksea("PTK6", "GF109203X", inc) :- enzyme("PTK6").
0.173531257::e_ksea("PTK6", "GO6983", dec); 0.173531257::e_ksea("PTK6", "GO6983", inc) :- enzyme("PTK6").
0.1881856201::e_ksea("PTK6", "GSK2334470", dec); 0.1881856201::e_ksea("PTK6", "GSK2334470", inc) :- enzyme("PTK6").
0.1239898451::e_ksea("PTK6", "GSK690693", dec); 0.1239898451::e_ksea("PTK6", "GSK690693", inc) :- enzyme("PTK6").
0.1990516687::e_ksea("PTK6", "Go6976", dec); 0.1990516687::e_ksea("PTK6", "Go6976", inc) :- enzyme("PTK6").
0.1171639376::e_ksea("PTK6", "H89", dec); 0.1171639376::e_ksea("PTK6", "H89", inc) :- enzyme("PTK6").
0.1282634402::e_ksea("PTK6", "HS173", dec); 0.1282634402::e_ksea("PTK6", "HS173", inc) :- enzyme("PTK6").
0.1643197011::e_ksea("PTK6", "Ipatasertib", dec); 0.1643197011::e_ksea("PTK6", "Ipatasertib", inc) :- enzyme("PTK6").
0.1534027902::e_ksea("PTK6", "JNJ", dec); 0.1534027902::e_ksea("PTK6", "JNJ", inc) :- enzyme("PTK6").
0.2361635452::e_ksea("PTK6", "JNK", dec); 0.2361635452::e_ksea("PTK6", "JNK", inc) :- enzyme("PTK6").
0.1676708934::e_ksea("PTK6", "KD025", dec); 0.1676708934::e_ksea("PTK6", "KD025", inc) :- enzyme("PTK6").
0.1198923416::e_ksea("PTK6", "KN62", dec); 0.1198923416::e_ksea("PTK6", "KN62", inc) :- enzyme("PTK6").
0.1529566142::e_ksea("PTK6", "KN93", dec); 0.1529566142::e_ksea("PTK6", "KN93", inc) :- enzyme("PTK6").
0.1365663466::e_ksea("PTK6", "Ku0063794", dec); 0.1365663466::e_ksea("PTK6", "Ku0063794", inc) :- enzyme("PTK6").
0.1380848413::e_ksea("PTK6", "LY2090314", dec); 0.1380848413::e_ksea("PTK6", "LY2090314", inc) :- enzyme("PTK6").
0.1691127084::e_ksea("PTK6", "LY2584702", dec); 0.1691127084::e_ksea("PTK6", "LY2584702", inc) :- enzyme("PTK6").
0.1344178908::e_ksea("PTK6", "LY2835219", dec); 0.1344178908::e_ksea("PTK6", "LY2835219", inc) :- enzyme("PTK6").
0.1226041338::e_ksea("PTK6", "Linsitinib", dec); 0.1226041338::e_ksea("PTK6", "Linsitinib", inc) :- enzyme("PTK6").
0.1667536654::e_ksea("PTK6", "MK2206", dec); 0.1667536654::e_ksea("PTK6", "MK2206", inc) :- enzyme("PTK6").
0.1877776945::e_ksea("PTK6", "NU7441", dec); 0.1877776945::e_ksea("PTK6", "NU7441", inc) :- enzyme("PTK6").
0.1170768585::e_ksea("PTK6", "PD153035", dec); 0.1170768585::e_ksea("PTK6", "PD153035", inc) :- enzyme("PTK6").
0.2316199154::e_ksea("PTK6", "PF3758309", dec); 0.2316199154::e_ksea("PTK6", "PF3758309", inc) :- enzyme("PTK6").
0.2308329596::e_ksea("PTK6", "PF4708671", dec); 0.2308329596::e_ksea("PTK6", "PF4708671", inc) :- enzyme("PTK6").
0.2457263814::e_ksea("PTK6", "PH797804", dec); 0.2457263814::e_ksea("PTK6", "PH797804", inc) :- enzyme("PTK6").
0.1902157465::e_ksea("PTK6", "PIK294", dec); 0.1902157465::e_ksea("PTK6", "PIK294", inc) :- enzyme("PTK6").
0.168493894::e_ksea("PTK6", "Ribociclib", dec); 0.168493894::e_ksea("PTK6", "Ribociclib", inc) :- enzyme("PTK6").
0.2267584652::e_ksea("PTK6", "Ripasudil", dec); 0.2267584652::e_ksea("PTK6", "Ripasudil", inc) :- enzyme("PTK6").
0.196105725::e_ksea("PTK6", "SP600125", dec); 0.196105725::e_ksea("PTK6", "SP600125", inc) :- enzyme("PTK6").
0.2489264982::e_ksea("PTK6", "Selumetinib", dec); 0.2489264982::e_ksea("PTK6", "Selumetinib", inc) :- enzyme("PTK6").
0.2183151384::e_ksea("PTK6", "TAK715", dec); 0.2183151384::e_ksea("PTK6", "TAK715", inc) :- enzyme("PTK6").
0.170132567::e_ksea("PTK6", "TBCA", dec); 0.170132567::e_ksea("PTK6", "TBCA", inc) :- enzyme("PTK6").
0.2115927103::e_ksea("PTK6", "TGX221", dec); 0.2115927103::e_ksea("PTK6", "TGX221", inc) :- enzyme("PTK6").
0.1694361392::e_ksea("PTK6", "Tofacitinib", dec); 0.1694361392::e_ksea("PTK6", "Tofacitinib", inc) :- enzyme("PTK6").
0.1930646536::e_ksea("PTK6", "Torin", dec); 0.1930646536::e_ksea("PTK6", "Torin", inc) :- enzyme("PTK6").
0.148136679::e_ksea("PTK6", "Trametinib", dec); 0.148136679::e_ksea("PTK6", "Trametinib", inc) :- enzyme("PTK6").
0.2029255919::e_ksea("PTK6", "U73122", dec); 0.2029255919::e_ksea("PTK6", "U73122", inc) :- enzyme("PTK6").
0.2379180803::e_ksea("PTK6", "Ulixertinib", dec); 0.2379180803::e_ksea("PTK6", "Ulixertinib", inc) :- enzyme("PTK6").
0.1471563434::e_ksea("PTK6", "Vemurafenib", dec); 0.1471563434::e_ksea("PTK6", "Vemurafenib", inc) :- enzyme("PTK6").
0.2002625483::e_ksea("PTPRG", "AC220", dec); 0.2002625483::e_ksea("PTPRG", "AC220", inc) :- enzyme("PTPRG").
0.2066333343::e_ksea("PTPRG", "AT13148", dec); 0.2066333343::e_ksea("PTPRG", "AT13148", inc) :- enzyme("PTPRG").
0.2401928572::e_ksea("PTPRG", "AZ20", dec); 0.2401928572::e_ksea("PTPRG", "AZ20", inc) :- enzyme("PTPRG").
0.1525255099::e_ksea("PTPRG", "AZD1480", dec); 0.1525255099::e_ksea("PTPRG", "AZD1480", inc) :- enzyme("PTPRG").
0.213845045::e_ksea("PTPRG", "AZD3759", dec); 0.213845045::e_ksea("PTPRG", "AZD3759", inc) :- enzyme("PTPRG").
0.1993215654::e_ksea("PTPRG", "AZD5363", dec); 0.1993215654::e_ksea("PTPRG", "AZD5363", inc) :- enzyme("PTPRG").
0.2055879727::e_ksea("PTPRG", "AZD5438", dec); 0.2055879727::e_ksea("PTPRG", "AZD5438", inc) :- enzyme("PTPRG").
0.202889512::e_ksea("PTPRG", "AZD6482", dec); 0.202889512::e_ksea("PTPRG", "AZD6482", inc) :- enzyme("PTPRG").
0.2502749855::e_ksea("PTPRG", "AZD6738", dec); 0.2502749855::e_ksea("PTPRG", "AZD6738", inc) :- enzyme("PTPRG").
0.2379454267::e_ksea("PTPRG", "AZD8055", dec); 0.2379454267::e_ksea("PTPRG", "AZD8055", inc) :- enzyme("PTPRG").
0.238258925::e_ksea("PTPRG", "Amuvatinib", dec); 0.238258925::e_ksea("PTPRG", "Amuvatinib", inc) :- enzyme("PTPRG").
0.1441723857::e_ksea("PTPRG", "BX912", dec); 0.1441723857::e_ksea("PTPRG", "BX912", inc) :- enzyme("PTPRG").
0.1821121321::e_ksea("PTPRG", "Bosutinib", dec); 0.1821121321::e_ksea("PTPRG", "Bosutinib", inc) :- enzyme("PTPRG").
0.2484457342::e_ksea("PTPRG", "CAL101", dec); 0.2484457342::e_ksea("PTPRG", "CAL101", inc) :- enzyme("PTPRG").
0.1997468243::e_ksea("PTPRG", "CHIR99021", dec); 0.1997468243::e_ksea("PTPRG", "CHIR99021", inc) :- enzyme("PTPRG").
0.2185558314::e_ksea("PTPRG", "CX4945", dec); 0.2185558314::e_ksea("PTPRG", "CX4945", inc) :- enzyme("PTPRG").
0.230139117::e_ksea("PTPRG", "DNAPK", dec); 0.230139117::e_ksea("PTPRG", "DNAPK", inc) :- enzyme("PTPRG").
0.2313136139::e_ksea("PTPRG", "Dabrafenib", dec); 0.2313136139::e_ksea("PTPRG", "Dabrafenib", inc) :- enzyme("PTPRG").
0.1825515134::e_ksea("PTPRG", "Dasatinib", dec); 0.1825515134::e_ksea("PTPRG", "Dasatinib", inc) :- enzyme("PTPRG").
0.2223915539::e_ksea("PTPRG", "Edelfosine", dec); 0.2223915539::e_ksea("PTPRG", "Edelfosine", inc) :- enzyme("PTPRG").
0.1503213044::e_ksea("PTPRG", "FRAX486", dec); 0.1503213044::e_ksea("PTPRG", "FRAX486", inc) :- enzyme("PTPRG").
0.2029255979::e_ksea("PTPRG", "GDC0941", dec); 0.2029255979::e_ksea("PTPRG", "GDC0941", inc) :- enzyme("PTPRG").
0.162413576::e_ksea("PTPRG", "GDC0994", dec); 0.162413576::e_ksea("PTPRG", "GDC0994", inc) :- enzyme("PTPRG").
0.2433383845::e_ksea("PTPRG", "GF109203X", dec); 0.2433383845::e_ksea("PTPRG", "GF109203X", inc) :- enzyme("PTPRG").
0.2186420438::e_ksea("PTPRG", "GO6983", dec); 0.2186420438::e_ksea("PTPRG", "GO6983", inc) :- enzyme("PTPRG").
0.1426355832::e_ksea("PTPRG", "GSK2334470", dec); 0.1426355832::e_ksea("PTPRG", "GSK2334470", inc) :- enzyme("PTPRG").
0.1482226877::e_ksea("PTPRG", "GSK690693", dec); 0.1482226877::e_ksea("PTPRG", "GSK690693", inc) :- enzyme("PTPRG").
0.2375981934::e_ksea("PTPRG", "Go6976", dec); 0.2375981934::e_ksea("PTPRG", "Go6976", inc) :- enzyme("PTPRG").
0.2314543981::e_ksea("PTPRG", "H89", dec); 0.2314543981::e_ksea("PTPRG", "H89", inc) :- enzyme("PTPRG").
0.2393356534::e_ksea("PTPRG", "HS173", dec); 0.2393356534::e_ksea("PTPRG", "HS173", inc) :- enzyme("PTPRG").
0.149423313::e_ksea("PTPRG", "Ipatasertib", dec); 0.149423313::e_ksea("PTPRG", "Ipatasertib", inc) :- enzyme("PTPRG").
0.228052589::e_ksea("PTPRG", "JNJ", dec); 0.228052589::e_ksea("PTPRG", "JNJ", inc) :- enzyme("PTPRG").
0.2179610524::e_ksea("PTPRG", "JNK", dec); 0.2179610524::e_ksea("PTPRG", "JNK", inc) :- enzyme("PTPRG").
0.2130471441::e_ksea("PTPRG", "KD025", dec); 0.2130471441::e_ksea("PTPRG", "KD025", inc) :- enzyme("PTPRG").
0.2378616068::e_ksea("PTPRG", "KN62", dec); 0.2378616068::e_ksea("PTPRG", "KN62", inc) :- enzyme("PTPRG").
0.1536736561::e_ksea("PTPRG", "KN93", dec); 0.1536736561::e_ksea("PTPRG", "KN93", inc) :- enzyme("PTPRG").
0.193352507::e_ksea("PTPRG", "Ku0063794", dec); 0.193352507::e_ksea("PTPRG", "Ku0063794", inc) :- enzyme("PTPRG").
0.2012568525::e_ksea("PTPRG", "LY2090314", dec); 0.2012568525::e_ksea("PTPRG", "LY2090314", inc) :- enzyme("PTPRG").
0.1872446377::e_ksea("PTPRG", "LY2584702", dec); 0.1872446377::e_ksea("PTPRG", "LY2584702", inc) :- enzyme("PTPRG").
0.2239293428::e_ksea("PTPRG", "LY2835219", dec); 0.2239293428::e_ksea("PTPRG", "LY2835219", inc) :- enzyme("PTPRG").
0.230436543::e_ksea("PTPRG", "Linsitinib", dec); 0.230436543::e_ksea("PTPRG", "Linsitinib", inc) :- enzyme("PTPRG").
0.1270728014::e_ksea("PTPRG", "MK2206", dec); 0.1270728014::e_ksea("PTPRG", "MK2206", inc) :- enzyme("PTPRG").
0.228774126::e_ksea("PTPRG", "NU7441", dec); 0.228774126::e_ksea("PTPRG", "NU7441", inc) :- enzyme("PTPRG").
0.1460294574::e_ksea("PTPRG", "PD153035", dec); 0.1460294574::e_ksea("PTPRG", "PD153035", inc) :- enzyme("PTPRG").
0.1009672548::e_ksea("PTPRG", "PF3758309", dec); 0.1009672548::e_ksea("PTPRG", "PF3758309", inc) :- enzyme("PTPRG").
0.1848343334::e_ksea("PTPRG", "PF4708671", dec); 0.1848343334::e_ksea("PTPRG", "PF4708671", inc) :- enzyme("PTPRG").
0.2297504879::e_ksea("PTPRG", "PH797804", dec); 0.2297504879::e_ksea("PTPRG", "PH797804", inc) :- enzyme("PTPRG").
0.1817962409::e_ksea("PTPRG", "PIK294", dec); 0.1817962409::e_ksea("PTPRG", "PIK294", inc) :- enzyme("PTPRG").
0.1709020251::e_ksea("PTPRG", "Ribociclib", dec); 0.1709020251::e_ksea("PTPRG", "Ribociclib", inc) :- enzyme("PTPRG").
0.2463243875::e_ksea("PTPRG", "Ripasudil", dec); 0.2463243875::e_ksea("PTPRG", "Ripasudil", inc) :- enzyme("PTPRG").
0.237987443::e_ksea("PTPRG", "SP600125", dec); 0.237987443::e_ksea("PTPRG", "SP600125", inc) :- enzyme("PTPRG").
0.2307818156::e_ksea("PTPRG", "Selumetinib", dec); 0.2307818156::e_ksea("PTPRG", "Selumetinib", inc) :- enzyme("PTPRG").
0.2436203749::e_ksea("PTPRG", "TAK715", dec); 0.2436203749::e_ksea("PTPRG", "TAK715", inc) :- enzyme("PTPRG").
0.204867914::e_ksea("PTPRG", "TBCA", dec); 0.204867914::e_ksea("PTPRG", "TBCA", inc) :- enzyme("PTPRG").
0.213190661::e_ksea("PTPRG", "TGX221", dec); 0.213190661::e_ksea("PTPRG", "TGX221", inc) :- enzyme("PTPRG").
0.152175247::e_ksea("PTPRG", "Tofacitinib", dec); 0.152175247::e_ksea("PTPRG", "Tofacitinib", inc) :- enzyme("PTPRG").
0.2029775807::e_ksea("PTPRG", "Torin", dec); 0.2029775807::e_ksea("PTPRG", "Torin", inc) :- enzyme("PTPRG").
0.1686108546::e_ksea("PTPRG", "Trametinib", dec); 0.1686108546::e_ksea("PTPRG", "Trametinib", inc) :- enzyme("PTPRG").
0.2446760645::e_ksea("PTPRG", "U73122", dec); 0.2446760645::e_ksea("PTPRG", "U73122", inc) :- enzyme("PTPRG").
0.2362177772::e_ksea("PTPRG", "Ulixertinib", dec); 0.2362177772::e_ksea("PTPRG", "Ulixertinib", inc) :- enzyme("PTPRG").
0.2430912488::e_ksea("PTPRG", "Vemurafenib", dec); 0.2430912488::e_ksea("PTPRG", "Vemurafenib", inc) :- enzyme("PTPRG").
0.1680748927::e_ksea("PTPRR", "AC220", dec); 0.1680748927::e_ksea("PTPRR", "AC220", inc) :- enzyme("PTPRR").
0.2006966547::e_ksea("PTPRR", "AT13148", dec); 0.2006966547::e_ksea("PTPRR", "AT13148", inc) :- enzyme("PTPRR").
0.1772641515::e_ksea("PTPRR", "AZ20", dec); 0.1772641515::e_ksea("PTPRR", "AZ20", inc) :- enzyme("PTPRR").
0.2418572121::e_ksea("PTPRR", "AZD1480", dec); 0.2418572121::e_ksea("PTPRR", "AZD1480", inc) :- enzyme("PTPRR").
0.1590427015::e_ksea("PTPRR", "AZD3759", dec); 0.1590427015::e_ksea("PTPRR", "AZD3759", inc) :- enzyme("PTPRR").
0.1959455989::e_ksea("PTPRR", "AZD5363", dec); 0.1959455989::e_ksea("PTPRR", "AZD5363", inc) :- enzyme("PTPRR").
0.1053444154::e_ksea("PTPRR", "AZD5438", dec); 0.1053444154::e_ksea("PTPRR", "AZD5438", inc) :- enzyme("PTPRR").
0.1114166308::e_ksea("PTPRR", "AZD6482", dec); 0.1114166308::e_ksea("PTPRR", "AZD6482", inc) :- enzyme("PTPRR").
0.1524059664::e_ksea("PTPRR", "AZD6738", dec); 0.1524059664::e_ksea("PTPRR", "AZD6738", inc) :- enzyme("PTPRR").
0.2487370104::e_ksea("PTPRR", "AZD8055", dec); 0.2487370104::e_ksea("PTPRR", "AZD8055", inc) :- enzyme("PTPRR").
0.1932617616::e_ksea("PTPRR", "Amuvatinib", dec); 0.1932617616::e_ksea("PTPRR", "Amuvatinib", inc) :- enzyme("PTPRR").
0.210484887::e_ksea("PTPRR", "BX912", dec); 0.210484887::e_ksea("PTPRR", "BX912", inc) :- enzyme("PTPRR").
0.1405904839::e_ksea("PTPRR", "Bosutinib", dec); 0.1405904839::e_ksea("PTPRR", "Bosutinib", inc) :- enzyme("PTPRR").
0.2390260726::e_ksea("PTPRR", "CAL101", dec); 0.2390260726::e_ksea("PTPRR", "CAL101", inc) :- enzyme("PTPRR").
0.2278605383::e_ksea("PTPRR", "CHIR99021", dec); 0.2278605383::e_ksea("PTPRR", "CHIR99021", inc) :- enzyme("PTPRR").
0.1258302363::e_ksea("PTPRR", "CX4945", dec); 0.1258302363::e_ksea("PTPRR", "CX4945", inc) :- enzyme("PTPRR").
0.2368767347::e_ksea("PTPRR", "DNAPK", dec); 0.2368767347::e_ksea("PTPRR", "DNAPK", inc) :- enzyme("PTPRR").
0.1608105735::e_ksea("PTPRR", "Dabrafenib", dec); 0.1608105735::e_ksea("PTPRR", "Dabrafenib", inc) :- enzyme("PTPRR").
0.1460699586::e_ksea("PTPRR", "Dasatinib", dec); 0.1460699586::e_ksea("PTPRR", "Dasatinib", inc) :- enzyme("PTPRR").
0.1833182397::e_ksea("PTPRR", "Edelfosine", dec); 0.1833182397::e_ksea("PTPRR", "Edelfosine", inc) :- enzyme("PTPRR").
0.1003000742::e_ksea("PTPRR", "FRAX486", dec); 0.1003000742::e_ksea("PTPRR", "FRAX486", inc) :- enzyme("PTPRR").
0.1778593584::e_ksea("PTPRR", "GDC0941", dec); 0.1778593584::e_ksea("PTPRR", "GDC0941", inc) :- enzyme("PTPRR").
0.2321732556::e_ksea("PTPRR", "GDC0994", dec); 0.2321732556::e_ksea("PTPRR", "GDC0994", inc) :- enzyme("PTPRR").
0.119665543::e_ksea("PTPRR", "GF109203X", dec); 0.119665543::e_ksea("PTPRR", "GF109203X", inc) :- enzyme("PTPRR").
0.2438986553::e_ksea("PTPRR", "GO6983", dec); 0.2438986553::e_ksea("PTPRR", "GO6983", inc) :- enzyme("PTPRR").
0.2486260691::e_ksea("PTPRR", "GSK2334470", dec); 0.2486260691::e_ksea("PTPRR", "GSK2334470", inc) :- enzyme("PTPRR").
0.186405826::e_ksea("PTPRR", "GSK690693", dec); 0.186405826::e_ksea("PTPRR", "GSK690693", inc) :- enzyme("PTPRR").
0.2299062157::e_ksea("PTPRR", "Go6976", dec); 0.2299062157::e_ksea("PTPRR", "Go6976", inc) :- enzyme("PTPRR").
0.2142206804::e_ksea("PTPRR", "H89", dec); 0.2142206804::e_ksea("PTPRR", "H89", inc) :- enzyme("PTPRR").
0.1572784211::e_ksea("PTPRR", "HS173", dec); 0.1572784211::e_ksea("PTPRR", "HS173", inc) :- enzyme("PTPRR").
0.1088928505::e_ksea("PTPRR", "Ipatasertib", dec); 0.1088928505::e_ksea("PTPRR", "Ipatasertib", inc) :- enzyme("PTPRR").
0.1497551751::e_ksea("PTPRR", "JNJ", dec); 0.1497551751::e_ksea("PTPRR", "JNJ", inc) :- enzyme("PTPRR").
0.194282778::e_ksea("PTPRR", "JNK", dec); 0.194282778::e_ksea("PTPRR", "JNK", inc) :- enzyme("PTPRR").
0.1929275975::e_ksea("PTPRR", "KD025", dec); 0.1929275975::e_ksea("PTPRR", "KD025", inc) :- enzyme("PTPRR").
0.1133684499::e_ksea("PTPRR", "KN62", dec); 0.1133684499::e_ksea("PTPRR", "KN62", inc) :- enzyme("PTPRR").
0.1660314244::e_ksea("PTPRR", "KN93", dec); 0.1660314244::e_ksea("PTPRR", "KN93", inc) :- enzyme("PTPRR").
0.1146128644::e_ksea("PTPRR", "Ku0063794", dec); 0.1146128644::e_ksea("PTPRR", "Ku0063794", inc) :- enzyme("PTPRR").
0.1516993717::e_ksea("PTPRR", "LY2090314", dec); 0.1516993717::e_ksea("PTPRR", "LY2090314", inc) :- enzyme("PTPRR").
0.1771684837::e_ksea("PTPRR", "LY2584702", dec); 0.1771684837::e_ksea("PTPRR", "LY2584702", inc) :- enzyme("PTPRR").
0.166620377::e_ksea("PTPRR", "LY2835219", dec); 0.166620377::e_ksea("PTPRR", "LY2835219", inc) :- enzyme("PTPRR").
0.2271431829::e_ksea("PTPRR", "Linsitinib", dec); 0.2271431829::e_ksea("PTPRR", "Linsitinib", inc) :- enzyme("PTPRR").
0.159041929::e_ksea("PTPRR", "MK2206", dec); 0.159041929::e_ksea("PTPRR", "MK2206", inc) :- enzyme("PTPRR").
0.2127386892::e_ksea("PTPRR", "NU7441", dec); 0.2127386892::e_ksea("PTPRR", "NU7441", inc) :- enzyme("PTPRR").
0.212420919::e_ksea("PTPRR", "PD153035", dec); 0.212420919::e_ksea("PTPRR", "PD153035", inc) :- enzyme("PTPRR").
0.1099218965::e_ksea("PTPRR", "PF3758309", dec); 0.1099218965::e_ksea("PTPRR", "PF3758309", inc) :- enzyme("PTPRR").
0.2286683565::e_ksea("PTPRR", "PF4708671", dec); 0.2286683565::e_ksea("PTPRR", "PF4708671", inc) :- enzyme("PTPRR").
0.2412205506::e_ksea("PTPRR", "PH797804", dec); 0.2412205506::e_ksea("PTPRR", "PH797804", inc) :- enzyme("PTPRR").
0.2314220417::e_ksea("PTPRR", "PIK294", dec); 0.2314220417::e_ksea("PTPRR", "PIK294", inc) :- enzyme("PTPRR").
0.1215959358::e_ksea("PTPRR", "Ribociclib", dec); 0.1215959358::e_ksea("PTPRR", "Ribociclib", inc) :- enzyme("PTPRR").
0.1863291301::e_ksea("PTPRR", "Ripasudil", dec); 0.1863291301::e_ksea("PTPRR", "Ripasudil", inc) :- enzyme("PTPRR").
0.2007626267::e_ksea("PTPRR", "SP600125", dec); 0.2007626267::e_ksea("PTPRR", "SP600125", inc) :- enzyme("PTPRR").
0.101368077::e_ksea("PTPRR", "Selumetinib", dec); 0.101368077::e_ksea("PTPRR", "Selumetinib", inc) :- enzyme("PTPRR").
0.2185542972::e_ksea("PTPRR", "TAK715", dec); 0.2185542972::e_ksea("PTPRR", "TAK715", inc) :- enzyme("PTPRR").
0.1885904126::e_ksea("PTPRR", "TBCA", dec); 0.1885904126::e_ksea("PTPRR", "TBCA", inc) :- enzyme("PTPRR").
0.2162108426::e_ksea("PTPRR", "TGX221", dec); 0.2162108426::e_ksea("PTPRR", "TGX221", inc) :- enzyme("PTPRR").
0.141460466::e_ksea("PTPRR", "Tofacitinib", dec); 0.141460466::e_ksea("PTPRR", "Tofacitinib", inc) :- enzyme("PTPRR").
0.1016620281::e_ksea("PTPRR", "Torin", dec); 0.1016620281::e_ksea("PTPRR", "Torin", inc) :- enzyme("PTPRR").
0.1129623298::e_ksea("PTPRR", "Trametinib", dec); 0.1129623298::e_ksea("PTPRR", "Trametinib", inc) :- enzyme("PTPRR").
0.1711865394::e_ksea("PTPRR", "U73122", dec); 0.1711865394::e_ksea("PTPRR", "U73122", inc) :- enzyme("PTPRR").
0.1139354212::e_ksea("PTPRR", "Ulixertinib", dec); 0.1139354212::e_ksea("PTPRR", "Ulixertinib", inc) :- enzyme("PTPRR").
0.1662564114::e_ksea("PTPRR", "Vemurafenib", dec); 0.1662564114::e_ksea("PTPRR", "Vemurafenib", inc) :- enzyme("PTPRR").
0.0800601858::e_ksea("SRC", "AC220", dec); 0.0800601858::e_ksea("SRC", "AC220", inc) :- enzyme("SRC").
0.1735722746::e_ksea("SRC", "AT13148", dec); 0.1735722746::e_ksea("SRC", "AT13148", inc) :- enzyme("SRC").
0.1044537153::e_ksea("SRC", "AZ20", dec); 0.1044537153::e_ksea("SRC", "AZ20", inc) :- enzyme("SRC").
0.1883385359::e_ksea("SRC", "AZD1480", dec); 0.1883385359::e_ksea("SRC", "AZD1480", inc) :- enzyme("SRC").
0.1788016102::e_ksea("SRC", "AZD3759", dec); 0.1788016102::e_ksea("SRC", "AZD3759", inc) :- enzyme("SRC").
0.1627338273::e_ksea("SRC", "AZD5363", dec); 0.1627338273::e_ksea("SRC", "AZD5363", inc) :- enzyme("SRC").
0.1244315724::e_ksea("SRC", "AZD5438", dec); 0.1244315724::e_ksea("SRC", "AZD5438", inc) :- enzyme("SRC").
0.0594290737::e_ksea("SRC", "AZD6482", dec); 0.0594290737::e_ksea("SRC", "AZD6482", inc) :- enzyme("SRC").
0.0119920889::e_ksea("SRC", "AZD6738", dec); 0.0119920889::e_ksea("SRC", "AZD6738", inc) :- enzyme("SRC").
0.1635220173::e_ksea("SRC", "AZD8055", dec); 0.1635220173::e_ksea("SRC", "AZD8055", inc) :- enzyme("SRC").
0.1998748019::e_ksea("SRC", "Amuvatinib", dec); 0.1998748019::e_ksea("SRC", "Amuvatinib", inc) :- enzyme("SRC").
0.2315427061::e_ksea("SRC", "BX912", dec); 0.2315427061::e_ksea("SRC", "BX912", inc) :- enzyme("SRC").
0.0063645381::e_ksea("SRC", "Bosutinib", dec); 0.0063645381::e_ksea("SRC", "Bosutinib", inc) :- enzyme("SRC").
0.2188261863::e_ksea("SRC", "CAL101", dec); 0.2188261863::e_ksea("SRC", "CAL101", inc) :- enzyme("SRC").
0.1499564237::e_ksea("SRC", "CHIR99021", dec); 0.1499564237::e_ksea("SRC", "CHIR99021", inc) :- enzyme("SRC").
0.0425397587::e_ksea("SRC", "CX4945", dec); 0.0425397587::e_ksea("SRC", "CX4945", inc) :- enzyme("SRC").
0.1845051876::e_ksea("SRC", "DNAPK", dec); 0.1845051876::e_ksea("SRC", "DNAPK", inc) :- enzyme("SRC").
0.1749508504::e_ksea("SRC", "Dabrafenib", dec); 0.1749508504::e_ksea("SRC", "Dabrafenib", inc) :- enzyme("SRC").
0.056042159::e_ksea("SRC", "Dasatinib", dec); 0.056042159::e_ksea("SRC", "Dasatinib", inc) :- enzyme("SRC").
0.073286519::e_ksea("SRC", "Edelfosine", dec); 0.073286519::e_ksea("SRC", "Edelfosine", inc) :- enzyme("SRC").
0.1024092939::e_ksea("SRC", "FRAX486", dec); 0.1024092939::e_ksea("SRC", "FRAX486", inc) :- enzyme("SRC").
0.2215986821::e_ksea("SRC", "GDC0941", dec); 0.2215986821::e_ksea("SRC", "GDC0941", inc) :- enzyme("SRC").
0.0341608703::e_ksea("SRC", "GDC0994", dec); 0.0341608703::e_ksea("SRC", "GDC0994", inc) :- enzyme("SRC").
0.0052318217::e_ksea("SRC", "GF109203X", dec); 0.0052318217::e_ksea("SRC", "GF109203X", inc) :- enzyme("SRC").
0.0451971271::e_ksea("SRC", "GO6983", dec); 0.0451971271::e_ksea("SRC", "GO6983", inc) :- enzyme("SRC").
0.135971429::e_ksea("SRC", "GSK2334470", dec); 0.135971429::e_ksea("SRC", "GSK2334470", inc) :- enzyme("SRC").
0.2194214168::e_ksea("SRC", "GSK690693", dec); 0.2194214168::e_ksea("SRC", "GSK690693", inc) :- enzyme("SRC").
0.1093382202::e_ksea("SRC", "Go6976", dec); 0.1093382202::e_ksea("SRC", "Go6976", inc) :- enzyme("SRC").
0.0376694672::e_ksea("SRC", "H89", dec); 0.0376694672::e_ksea("SRC", "H89", inc) :- enzyme("SRC").
0.2174609178::e_ksea("SRC", "HS173", dec); 0.2174609178::e_ksea("SRC", "HS173", inc) :- enzyme("SRC").
0.023143932::e_ksea("SRC", "Ipatasertib", dec); 0.023143932::e_ksea("SRC", "Ipatasertib", inc) :- enzyme("SRC").
0.119474607::e_ksea("SRC", "JNJ", dec); 0.119474607::e_ksea("SRC", "JNJ", inc) :- enzyme("SRC").
0.1836003657::e_ksea("SRC", "JNK", dec); 0.1836003657::e_ksea("SRC", "JNK", inc) :- enzyme("SRC").
0.1926632954::e_ksea("SRC", "KD025", dec); 0.1926632954::e_ksea("SRC", "KD025", inc) :- enzyme("SRC").
0.2223523266::e_ksea("SRC", "KN62", dec); 0.2223523266::e_ksea("SRC", "KN62", inc) :- enzyme("SRC").
0.0662066002::e_ksea("SRC", "KN93", dec); 0.0662066002::e_ksea("SRC", "KN93", inc) :- enzyme("SRC").
0.1501570212::e_ksea("SRC", "Ku0063794", dec); 0.1501570212::e_ksea("SRC", "Ku0063794", inc) :- enzyme("SRC").
0.1650406755::e_ksea("SRC", "LY2090314", dec); 0.1650406755::e_ksea("SRC", "LY2090314", inc) :- enzyme("SRC").
0.1618557528::e_ksea("SRC", "LY2584702", dec); 0.1618557528::e_ksea("SRC", "LY2584702", inc) :- enzyme("SRC").
0.2167249136::e_ksea("SRC", "LY2835219", dec); 0.2167249136::e_ksea("SRC", "LY2835219", inc) :- enzyme("SRC").
0.154551856::e_ksea("SRC", "Linsitinib", dec); 0.154551856::e_ksea("SRC", "Linsitinib", inc) :- enzyme("SRC").
0.1206132629::e_ksea("SRC", "MK2206", dec); 0.1206132629::e_ksea("SRC", "MK2206", inc) :- enzyme("SRC").
0.0368929012::e_ksea("SRC", "NU7441", dec); 0.0368929012::e_ksea("SRC", "NU7441", inc) :- enzyme("SRC").
0.1226489784::e_ksea("SRC", "PD153035", dec); 0.1226489784::e_ksea("SRC", "PD153035", inc) :- enzyme("SRC").
0.138901668::e_ksea("SRC", "PF3758309", dec); 0.138901668::e_ksea("SRC", "PF3758309", inc) :- enzyme("SRC").
0.0466064978::e_ksea("SRC", "PF4708671", dec); 0.0466064978::e_ksea("SRC", "PF4708671", inc) :- enzyme("SRC").
0.1716078071::e_ksea("SRC", "PH797804", dec); 0.1716078071::e_ksea("SRC", "PH797804", inc) :- enzyme("SRC").
0.05958635::e_ksea("SRC", "PIK294", dec); 0.05958635::e_ksea("SRC", "PIK294", inc) :- enzyme("SRC").
0.0643100063::e_ksea("SRC", "Ribociclib", dec); 0.0643100063::e_ksea("SRC", "Ribociclib", inc) :- enzyme("SRC").
0.1914106498::e_ksea("SRC", "Ripasudil", dec); 0.1914106498::e_ksea("SRC", "Ripasudil", inc) :- enzyme("SRC").
0.0262327814::e_ksea("SRC", "SP600125", dec); 0.0262327814::e_ksea("SRC", "SP600125", inc) :- enzyme("SRC").
0.1398660345::e_ksea("SRC", "Selumetinib", dec); 0.1398660345::e_ksea("SRC", "Selumetinib", inc) :- enzyme("SRC").
0.0830957515::e_ksea("SRC", "TAK715", dec); 0.0830957515::e_ksea("SRC", "TAK715", inc) :- enzyme("SRC").
0.1158649671::e_ksea("SRC", "TBCA", dec); 0.1158649671::e_ksea("SRC", "TBCA", inc) :- enzyme("SRC").
0.2000092884::e_ksea("SRC", "TGX221", dec); 0.2000092884::e_ksea("SRC", "TGX221", inc) :- enzyme("SRC").
0.0696305345::e_ksea("SRC", "Tofacitinib", dec); 0.0696305345::e_ksea("SRC", "Tofacitinib", inc) :- enzyme("SRC").
0.1126585714::e_ksea("SRC", "Torin", dec); 0.1126585714::e_ksea("SRC", "Torin", inc) :- enzyme("SRC").
0.1323826657::e_ksea("SRC", "Trametinib", dec); 0.1323826657::e_ksea("SRC", "Trametinib", inc) :- enzyme("SRC").
0.2248375494::e_ksea("SRC", "U73122", dec); 0.2248375494::e_ksea("SRC", "U73122", inc) :- enzyme("SRC").
0.1990941867::e_ksea("SRC", "Ulixertinib", dec); 0.1990941867::e_ksea("SRC", "Ulixertinib", inc) :- enzyme("SRC").
0.1017296186::e_ksea("SRC", "Vemurafenib", dec); 0.1017296186::e_ksea("SRC", "Vemurafenib", inc) :- enzyme("SRC").
%% p1::p_fc(P, S, dec); p2::p_fc(P, S, base); p3::p_fc(P, S, inc) :- p_occupancy(P, S, _dO). % value = _fc = [dec | base | inc] (cpd, P/S-level)
0.3176118912::p_fc("ABI1(Y213)", "AC220", dec); 0.001::p_fc("ABI1(Y213)", "AC220", inc) :- p_occupancy("ABI1(Y213)", "AC220", dec).
0.001::p_fc("ABI1(Y213)", "AC220", dec); 0.3176118912::p_fc("ABI1(Y213)", "AC220", inc) :- p_occupancy("ABI1(Y213)", "AC220", inc).
0.0461842006::p_fc("ABI1(Y213)", "AT13148", dec); 0.001::p_fc("ABI1(Y213)", "AT13148", inc) :- p_occupancy("ABI1(Y213)", "AT13148", dec).
0.001::p_fc("ABI1(Y213)", "AT13148", dec); 0.0461842006::p_fc("ABI1(Y213)", "AT13148", inc) :- p_occupancy("ABI1(Y213)", "AT13148", inc).
0.0127648242::p_fc("ABI1(Y213)", "AZ20", dec); 0.001::p_fc("ABI1(Y213)", "AZ20", inc) :- p_occupancy("ABI1(Y213)", "AZ20", dec).
0.001::p_fc("ABI1(Y213)", "AZ20", dec); 0.0127648242::p_fc("ABI1(Y213)", "AZ20", inc) :- p_occupancy("ABI1(Y213)", "AZ20", inc).
0.477316591::p_fc("ABI1(Y213)", "AZD1480", dec); 0.001::p_fc("ABI1(Y213)", "AZD1480", inc) :- p_occupancy("ABI1(Y213)", "AZD1480", dec).
0.001::p_fc("ABI1(Y213)", "AZD1480", dec); 0.477316591::p_fc("ABI1(Y213)", "AZD1480", inc) :- p_occupancy("ABI1(Y213)", "AZD1480", inc).
0.2923203804::p_fc("ABI1(Y213)", "AZD3759", dec); 0.001::p_fc("ABI1(Y213)", "AZD3759", inc) :- p_occupancy("ABI1(Y213)", "AZD3759", dec).
0.001::p_fc("ABI1(Y213)", "AZD3759", dec); 0.2923203804::p_fc("ABI1(Y213)", "AZD3759", inc) :- p_occupancy("ABI1(Y213)", "AZD3759", inc).
0.0786221198::p_fc("ABI1(Y213)", "AZD5363", dec); 0.001::p_fc("ABI1(Y213)", "AZD5363", inc) :- p_occupancy("ABI1(Y213)", "AZD5363", dec).
0.001::p_fc("ABI1(Y213)", "AZD5363", dec); 0.0786221198::p_fc("ABI1(Y213)", "AZD5363", inc) :- p_occupancy("ABI1(Y213)", "AZD5363", inc).
0.7938051428::p_fc("ABI1(Y213)", "AZD5438", dec); 0.001::p_fc("ABI1(Y213)", "AZD5438", inc) :- p_occupancy("ABI1(Y213)", "AZD5438", dec).
0.001::p_fc("ABI1(Y213)", "AZD5438", dec); 0.7938051428::p_fc("ABI1(Y213)", "AZD5438", inc) :- p_occupancy("ABI1(Y213)", "AZD5438", inc).
0.6873070282::p_fc("ABI1(Y213)", "AZD6482", dec); 0.001::p_fc("ABI1(Y213)", "AZD6482", inc) :- p_occupancy("ABI1(Y213)", "AZD6482", dec).
0.001::p_fc("ABI1(Y213)", "AZD6482", dec); 0.6873070282::p_fc("ABI1(Y213)", "AZD6482", inc) :- p_occupancy("ABI1(Y213)", "AZD6482", inc).
0.3736351541::p_fc("ABI1(Y213)", "AZD6738", dec); 0.001::p_fc("ABI1(Y213)", "AZD6738", inc) :- p_occupancy("ABI1(Y213)", "AZD6738", dec).
0.001::p_fc("ABI1(Y213)", "AZD6738", dec); 0.3736351541::p_fc("ABI1(Y213)", "AZD6738", inc) :- p_occupancy("ABI1(Y213)", "AZD6738", inc).
0.4177691676::p_fc("ABI1(Y213)", "AZD8055", dec); 0.001::p_fc("ABI1(Y213)", "AZD8055", inc) :- p_occupancy("ABI1(Y213)", "AZD8055", dec).
0.001::p_fc("ABI1(Y213)", "AZD8055", dec); 0.4177691676::p_fc("ABI1(Y213)", "AZD8055", inc) :- p_occupancy("ABI1(Y213)", "AZD8055", inc).
0.3862038467::p_fc("ABI1(Y213)", "Amuvatinib", dec); 0.001::p_fc("ABI1(Y213)", "Amuvatinib", inc) :- p_occupancy("ABI1(Y213)", "Amuvatinib", dec).
0.001::p_fc("ABI1(Y213)", "Amuvatinib", dec); 0.3862038467::p_fc("ABI1(Y213)", "Amuvatinib", inc) :- p_occupancy("ABI1(Y213)", "Amuvatinib", inc).
0.3828108397::p_fc("ABI1(Y213)", "BX912", dec); 0.001::p_fc("ABI1(Y213)", "BX912", inc) :- p_occupancy("ABI1(Y213)", "BX912", dec).
0.001::p_fc("ABI1(Y213)", "BX912", dec); 0.3828108397::p_fc("ABI1(Y213)", "BX912", inc) :- p_occupancy("ABI1(Y213)", "BX912", inc).
0.9980016051::p_fc("ABI1(Y213)", "Bosutinib", dec); 0.001::p_fc("ABI1(Y213)", "Bosutinib", inc) :- p_occupancy("ABI1(Y213)", "Bosutinib", dec).
0.001::p_fc("ABI1(Y213)", "Bosutinib", dec); 0.9980016051::p_fc("ABI1(Y213)", "Bosutinib", inc) :- p_occupancy("ABI1(Y213)", "Bosutinib", inc).
0.6528835214::p_fc("ABI1(Y213)", "CAL101", dec); 0.001::p_fc("ABI1(Y213)", "CAL101", inc) :- p_occupancy("ABI1(Y213)", "CAL101", dec).
0.001::p_fc("ABI1(Y213)", "CAL101", dec); 0.6528835214::p_fc("ABI1(Y213)", "CAL101", inc) :- p_occupancy("ABI1(Y213)", "CAL101", inc).
0.019392136::p_fc("ABI1(Y213)", "CHIR99021", dec); 0.001::p_fc("ABI1(Y213)", "CHIR99021", inc) :- p_occupancy("ABI1(Y213)", "CHIR99021", dec).
0.001::p_fc("ABI1(Y213)", "CHIR99021", dec); 0.019392136::p_fc("ABI1(Y213)", "CHIR99021", inc) :- p_occupancy("ABI1(Y213)", "CHIR99021", inc).
0.4284746941::p_fc("ABI1(Y213)", "CX4945", dec); 0.001::p_fc("ABI1(Y213)", "CX4945", inc) :- p_occupancy("ABI1(Y213)", "CX4945", dec).
0.001::p_fc("ABI1(Y213)", "CX4945", dec); 0.4284746941::p_fc("ABI1(Y213)", "CX4945", inc) :- p_occupancy("ABI1(Y213)", "CX4945", inc).
0.3107421435::p_fc("ABI1(Y213)", "DNAPK", dec); 0.001::p_fc("ABI1(Y213)", "DNAPK", inc) :- p_occupancy("ABI1(Y213)", "DNAPK", dec).
0.001::p_fc("ABI1(Y213)", "DNAPK", dec); 0.3107421435::p_fc("ABI1(Y213)", "DNAPK", inc) :- p_occupancy("ABI1(Y213)", "DNAPK", inc).
0.7270710895::p_fc("ABI1(Y213)", "Dabrafenib", dec); 0.001::p_fc("ABI1(Y213)", "Dabrafenib", inc) :- p_occupancy("ABI1(Y213)", "Dabrafenib", dec).
0.001::p_fc("ABI1(Y213)", "Dabrafenib", dec); 0.7270710895::p_fc("ABI1(Y213)", "Dabrafenib", inc) :- p_occupancy("ABI1(Y213)", "Dabrafenib", inc).
0.998005773::p_fc("ABI1(Y213)", "Dasatinib", dec); 0.001::p_fc("ABI1(Y213)", "Dasatinib", inc) :- p_occupancy("ABI1(Y213)", "Dasatinib", dec).
0.001::p_fc("ABI1(Y213)", "Dasatinib", dec); 0.998005773::p_fc("ABI1(Y213)", "Dasatinib", inc) :- p_occupancy("ABI1(Y213)", "Dasatinib", inc).
0.1390185705::p_fc("ABI1(Y213)", "Edelfosine", dec); 0.001::p_fc("ABI1(Y213)", "Edelfosine", inc) :- p_occupancy("ABI1(Y213)", "Edelfosine", dec).
0.001::p_fc("ABI1(Y213)", "Edelfosine", dec); 0.1390185705::p_fc("ABI1(Y213)", "Edelfosine", inc) :- p_occupancy("ABI1(Y213)", "Edelfosine", inc).
0.6236065382::p_fc("ABI1(Y213)", "FRAX486", dec); 0.001::p_fc("ABI1(Y213)", "FRAX486", inc) :- p_occupancy("ABI1(Y213)", "FRAX486", dec).
0.001::p_fc("ABI1(Y213)", "FRAX486", dec); 0.6236065382::p_fc("ABI1(Y213)", "FRAX486", inc) :- p_occupancy("ABI1(Y213)", "FRAX486", inc).
0.8311355854::p_fc("ABI1(Y213)", "GDC0941", dec); 0.001::p_fc("ABI1(Y213)", "GDC0941", inc) :- p_occupancy("ABI1(Y213)", "GDC0941", dec).
0.001::p_fc("ABI1(Y213)", "GDC0941", dec); 0.8311355854::p_fc("ABI1(Y213)", "GDC0941", inc) :- p_occupancy("ABI1(Y213)", "GDC0941", inc).
0.3436812188::p_fc("ABI1(Y213)", "GDC0994", dec); 0.001::p_fc("ABI1(Y213)", "GDC0994", inc) :- p_occupancy("ABI1(Y213)", "GDC0994", dec).
0.001::p_fc("ABI1(Y213)", "GDC0994", dec); 0.3436812188::p_fc("ABI1(Y213)", "GDC0994", inc) :- p_occupancy("ABI1(Y213)", "GDC0994", inc).
0.1320272122::p_fc("ABI1(Y213)", "GF109203X", dec); 0.001::p_fc("ABI1(Y213)", "GF109203X", inc) :- p_occupancy("ABI1(Y213)", "GF109203X", dec).
0.001::p_fc("ABI1(Y213)", "GF109203X", dec); 0.1320272122::p_fc("ABI1(Y213)", "GF109203X", inc) :- p_occupancy("ABI1(Y213)", "GF109203X", inc).
0.397895991::p_fc("ABI1(Y213)", "GO6983", dec); 0.001::p_fc("ABI1(Y213)", "GO6983", inc) :- p_occupancy("ABI1(Y213)", "GO6983", dec).
0.001::p_fc("ABI1(Y213)", "GO6983", dec); 0.397895991::p_fc("ABI1(Y213)", "GO6983", inc) :- p_occupancy("ABI1(Y213)", "GO6983", inc).
0.8459569743::p_fc("ABI1(Y213)", "GSK2334470", dec); 0.001::p_fc("ABI1(Y213)", "GSK2334470", inc) :- p_occupancy("ABI1(Y213)", "GSK2334470", dec).
0.001::p_fc("ABI1(Y213)", "GSK2334470", dec); 0.8459569743::p_fc("ABI1(Y213)", "GSK2334470", inc) :- p_occupancy("ABI1(Y213)", "GSK2334470", inc).
0.5901170347::p_fc("ABI1(Y213)", "GSK690693", dec); 0.001::p_fc("ABI1(Y213)", "GSK690693", inc) :- p_occupancy("ABI1(Y213)", "GSK690693", dec).
0.001::p_fc("ABI1(Y213)", "GSK690693", dec); 0.5901170347::p_fc("ABI1(Y213)", "GSK690693", inc) :- p_occupancy("ABI1(Y213)", "GSK690693", inc).
0.4896270822::p_fc("ABI1(Y213)", "Go6976", dec); 0.001::p_fc("ABI1(Y213)", "Go6976", inc) :- p_occupancy("ABI1(Y213)", "Go6976", dec).
0.001::p_fc("ABI1(Y213)", "Go6976", dec); 0.4896270822::p_fc("ABI1(Y213)", "Go6976", inc) :- p_occupancy("ABI1(Y213)", "Go6976", inc).
0.5203376758::p_fc("ABI1(Y213)", "H89", dec); 0.001::p_fc("ABI1(Y213)", "H89", inc) :- p_occupancy("ABI1(Y213)", "H89", dec).
0.001::p_fc("ABI1(Y213)", "H89", dec); 0.5203376758::p_fc("ABI1(Y213)", "H89", inc) :- p_occupancy("ABI1(Y213)", "H89", inc).
0.8388530129::p_fc("ABI1(Y213)", "HS173", dec); 0.001::p_fc("ABI1(Y213)", "HS173", inc) :- p_occupancy("ABI1(Y213)", "HS173", dec).
0.001::p_fc("ABI1(Y213)", "HS173", dec); 0.8388530129::p_fc("ABI1(Y213)", "HS173", inc) :- p_occupancy("ABI1(Y213)", "HS173", inc).
0.2305710865::p_fc("ABI1(Y213)", "Ipatasertib", dec); 0.001::p_fc("ABI1(Y213)", "Ipatasertib", inc) :- p_occupancy("ABI1(Y213)", "Ipatasertib", dec).
0.001::p_fc("ABI1(Y213)", "Ipatasertib", dec); 0.2305710865::p_fc("ABI1(Y213)", "Ipatasertib", inc) :- p_occupancy("ABI1(Y213)", "Ipatasertib", inc).
0.026157962::p_fc("ABI1(Y213)", "JNJ", dec); 0.001::p_fc("ABI1(Y213)", "JNJ", inc) :- p_occupancy("ABI1(Y213)", "JNJ", dec).
0.001::p_fc("ABI1(Y213)", "JNJ", dec); 0.026157962::p_fc("ABI1(Y213)", "JNJ", inc) :- p_occupancy("ABI1(Y213)", "JNJ", inc).
0.0185398065::p_fc("ABI1(Y213)", "JNK", dec); 0.001::p_fc("ABI1(Y213)", "JNK", inc) :- p_occupancy("ABI1(Y213)", "JNK", dec).
0.001::p_fc("ABI1(Y213)", "JNK", dec); 0.0185398065::p_fc("ABI1(Y213)", "JNK", inc) :- p_occupancy("ABI1(Y213)", "JNK", inc).
0.5254346148::p_fc("ABI1(Y213)", "KD025", dec); 0.001::p_fc("ABI1(Y213)", "KD025", inc) :- p_occupancy("ABI1(Y213)", "KD025", dec).
0.001::p_fc("ABI1(Y213)", "KD025", dec); 0.5254346148::p_fc("ABI1(Y213)", "KD025", inc) :- p_occupancy("ABI1(Y213)", "KD025", inc).
0.4856485981::p_fc("ABI1(Y213)", "KN62", dec); 0.001::p_fc("ABI1(Y213)", "KN62", inc) :- p_occupancy("ABI1(Y213)", "KN62", dec).
0.001::p_fc("ABI1(Y213)", "KN62", dec); 0.4856485981::p_fc("ABI1(Y213)", "KN62", inc) :- p_occupancy("ABI1(Y213)", "KN62", inc).
0.6445220919::p_fc("ABI1(Y213)", "KN93", dec); 0.001::p_fc("ABI1(Y213)", "KN93", inc) :- p_occupancy("ABI1(Y213)", "KN93", dec).
0.001::p_fc("ABI1(Y213)", "KN93", dec); 0.6445220919::p_fc("ABI1(Y213)", "KN93", inc) :- p_occupancy("ABI1(Y213)", "KN93", inc).
0.1642327962::p_fc("ABI1(Y213)", "Ku0063794", dec); 0.001::p_fc("ABI1(Y213)", "Ku0063794", inc) :- p_occupancy("ABI1(Y213)", "Ku0063794", dec).
0.001::p_fc("ABI1(Y213)", "Ku0063794", dec); 0.1642327962::p_fc("ABI1(Y213)", "Ku0063794", inc) :- p_occupancy("ABI1(Y213)", "Ku0063794", inc).
0.1218963745::p_fc("ABI1(Y213)", "LY2090314", dec); 0.001::p_fc("ABI1(Y213)", "LY2090314", inc) :- p_occupancy("ABI1(Y213)", "LY2090314", dec).
0.001::p_fc("ABI1(Y213)", "LY2090314", dec); 0.1218963745::p_fc("ABI1(Y213)", "LY2090314", inc) :- p_occupancy("ABI1(Y213)", "LY2090314", inc).
0.6986184516::p_fc("ABI1(Y213)", "LY2584702", dec); 0.001::p_fc("ABI1(Y213)", "LY2584702", inc) :- p_occupancy("ABI1(Y213)", "LY2584702", dec).
0.001::p_fc("ABI1(Y213)", "LY2584702", dec); 0.6986184516::p_fc("ABI1(Y213)", "LY2584702", inc) :- p_occupancy("ABI1(Y213)", "LY2584702", inc).
0.8994288192::p_fc("ABI1(Y213)", "LY2835219", dec); 0.001::p_fc("ABI1(Y213)", "LY2835219", inc) :- p_occupancy("ABI1(Y213)", "LY2835219", dec).
0.001::p_fc("ABI1(Y213)", "LY2835219", dec); 0.8994288192::p_fc("ABI1(Y213)", "LY2835219", inc) :- p_occupancy("ABI1(Y213)", "LY2835219", inc).
0.4806434099::p_fc("ABI1(Y213)", "Linsitinib", dec); 0.001::p_fc("ABI1(Y213)", "Linsitinib", inc) :- p_occupancy("ABI1(Y213)", "Linsitinib", dec).
0.001::p_fc("ABI1(Y213)", "Linsitinib", dec); 0.4806434099::p_fc("ABI1(Y213)", "Linsitinib", inc) :- p_occupancy("ABI1(Y213)", "Linsitinib", inc).
0.5455526474::p_fc("ABI1(Y213)", "MK2206", dec); 0.001::p_fc("ABI1(Y213)", "MK2206", inc) :- p_occupancy("ABI1(Y213)", "MK2206", dec).
0.001::p_fc("ABI1(Y213)", "MK2206", dec); 0.5455526474::p_fc("ABI1(Y213)", "MK2206", inc) :- p_occupancy("ABI1(Y213)", "MK2206", inc).
0.6925733072::p_fc("ABI1(Y213)", "NU7441", dec); 0.001::p_fc("ABI1(Y213)", "NU7441", inc) :- p_occupancy("ABI1(Y213)", "NU7441", dec).
0.001::p_fc("ABI1(Y213)", "NU7441", dec); 0.6925733072::p_fc("ABI1(Y213)", "NU7441", inc) :- p_occupancy("ABI1(Y213)", "NU7441", inc).
0.7392614509::p_fc("ABI1(Y213)", "PD153035", dec); 0.001::p_fc("ABI1(Y213)", "PD153035", inc) :- p_occupancy("ABI1(Y213)", "PD153035", dec).
0.001::p_fc("ABI1(Y213)", "PD153035", dec); 0.7392614509::p_fc("ABI1(Y213)", "PD153035", inc) :- p_occupancy("ABI1(Y213)", "PD153035", inc).
0.9978499527::p_fc("ABI1(Y213)", "PF3758309", dec); 0.001::p_fc("ABI1(Y213)", "PF3758309", inc) :- p_occupancy("ABI1(Y213)", "PF3758309", dec).
0.001::p_fc("ABI1(Y213)", "PF3758309", dec); 0.9978499527::p_fc("ABI1(Y213)", "PF3758309", inc) :- p_occupancy("ABI1(Y213)", "PF3758309", inc).
0.7323737045::p_fc("ABI1(Y213)", "PF4708671", dec); 0.001::p_fc("ABI1(Y213)", "PF4708671", inc) :- p_occupancy("ABI1(Y213)", "PF4708671", dec).
0.001::p_fc("ABI1(Y213)", "PF4708671", dec); 0.7323737045::p_fc("ABI1(Y213)", "PF4708671", inc) :- p_occupancy("ABI1(Y213)", "PF4708671", inc).
0.9067799538::p_fc("ABI1(Y213)", "PH797804", dec); 0.001::p_fc("ABI1(Y213)", "PH797804", inc) :- p_occupancy("ABI1(Y213)", "PH797804", dec).
0.001::p_fc("ABI1(Y213)", "PH797804", dec); 0.9067799538::p_fc("ABI1(Y213)", "PH797804", inc) :- p_occupancy("ABI1(Y213)", "PH797804", inc).
0.0961053048::p_fc("ABI1(Y213)", "PIK294", dec); 0.001::p_fc("ABI1(Y213)", "PIK294", inc) :- p_occupancy("ABI1(Y213)", "PIK294", dec).
0.001::p_fc("ABI1(Y213)", "PIK294", dec); 0.0961053048::p_fc("ABI1(Y213)", "PIK294", inc) :- p_occupancy("ABI1(Y213)", "PIK294", inc).
0.4251759302::p_fc("ABI1(Y213)", "Ribociclib", dec); 0.001::p_fc("ABI1(Y213)", "Ribociclib", inc) :- p_occupancy("ABI1(Y213)", "Ribociclib", dec).
0.001::p_fc("ABI1(Y213)", "Ribociclib", dec); 0.4251759302::p_fc("ABI1(Y213)", "Ribociclib", inc) :- p_occupancy("ABI1(Y213)", "Ribociclib", inc).
0.6150494682::p_fc("ABI1(Y213)", "Ripasudil", dec); 0.001::p_fc("ABI1(Y213)", "Ripasudil", inc) :- p_occupancy("ABI1(Y213)", "Ripasudil", dec).
0.001::p_fc("ABI1(Y213)", "Ripasudil", dec); 0.6150494682::p_fc("ABI1(Y213)", "Ripasudil", inc) :- p_occupancy("ABI1(Y213)", "Ripasudil", inc).
0.0221376543::p_fc("ABI1(Y213)", "SP600125", dec); 0.001::p_fc("ABI1(Y213)", "SP600125", inc) :- p_occupancy("ABI1(Y213)", "SP600125", dec).
0.001::p_fc("ABI1(Y213)", "SP600125", dec); 0.0221376543::p_fc("ABI1(Y213)", "SP600125", inc) :- p_occupancy("ABI1(Y213)", "SP600125", inc).
0.5493834952::p_fc("ABI1(Y213)", "Selumetinib", dec); 0.001::p_fc("ABI1(Y213)", "Selumetinib", inc) :- p_occupancy("ABI1(Y213)", "Selumetinib", dec).
0.001::p_fc("ABI1(Y213)", "Selumetinib", dec); 0.5493834952::p_fc("ABI1(Y213)", "Selumetinib", inc) :- p_occupancy("ABI1(Y213)", "Selumetinib", inc).
0.3907103628::p_fc("ABI1(Y213)", "TAK715", dec); 0.001::p_fc("ABI1(Y213)", "TAK715", inc) :- p_occupancy("ABI1(Y213)", "TAK715", dec).
0.001::p_fc("ABI1(Y213)", "TAK715", dec); 0.3907103628::p_fc("ABI1(Y213)", "TAK715", inc) :- p_occupancy("ABI1(Y213)", "TAK715", inc).
0.4399127077::p_fc("ABI1(Y213)", "TBCA", dec); 0.001::p_fc("ABI1(Y213)", "TBCA", inc) :- p_occupancy("ABI1(Y213)", "TBCA", dec).
0.001::p_fc("ABI1(Y213)", "TBCA", dec); 0.4399127077::p_fc("ABI1(Y213)", "TBCA", inc) :- p_occupancy("ABI1(Y213)", "TBCA", inc).
0.7443904763::p_fc("ABI1(Y213)", "TGX221", dec); 0.001::p_fc("ABI1(Y213)", "TGX221", inc) :- p_occupancy("ABI1(Y213)", "TGX221", dec).
0.001::p_fc("ABI1(Y213)", "TGX221", dec); 0.7443904763::p_fc("ABI1(Y213)", "TGX221", inc) :- p_occupancy("ABI1(Y213)", "TGX221", inc).
0.3715240322::p_fc("ABI1(Y213)", "Tofacitinib", dec); 0.001::p_fc("ABI1(Y213)", "Tofacitinib", inc) :- p_occupancy("ABI1(Y213)", "Tofacitinib", dec).
0.001::p_fc("ABI1(Y213)", "Tofacitinib", dec); 0.3715240322::p_fc("ABI1(Y213)", "Tofacitinib", inc) :- p_occupancy("ABI1(Y213)", "Tofacitinib", inc).
0.9296502559::p_fc("ABI1(Y213)", "Torin", dec); 0.001::p_fc("ABI1(Y213)", "Torin", inc) :- p_occupancy("ABI1(Y213)", "Torin", dec).
0.001::p_fc("ABI1(Y213)", "Torin", dec); 0.9296502559::p_fc("ABI1(Y213)", "Torin", inc) :- p_occupancy("ABI1(Y213)", "Torin", inc).
0.0990452032::p_fc("ABI1(Y213)", "Trametinib", dec); 0.001::p_fc("ABI1(Y213)", "Trametinib", inc) :- p_occupancy("ABI1(Y213)", "Trametinib", dec).
0.001::p_fc("ABI1(Y213)", "Trametinib", dec); 0.0990452032::p_fc("ABI1(Y213)", "Trametinib", inc) :- p_occupancy("ABI1(Y213)", "Trametinib", inc).
0.3487026405::p_fc("ABI1(Y213)", "U73122", dec); 0.001::p_fc("ABI1(Y213)", "U73122", inc) :- p_occupancy("ABI1(Y213)", "U73122", dec).
0.001::p_fc("ABI1(Y213)", "U73122", dec); 0.3487026405::p_fc("ABI1(Y213)", "U73122", inc) :- p_occupancy("ABI1(Y213)", "U73122", inc).
0.2079277075::p_fc("ABI1(Y213)", "Ulixertinib", dec); 0.001::p_fc("ABI1(Y213)", "Ulixertinib", inc) :- p_occupancy("ABI1(Y213)", "Ulixertinib", dec).
0.001::p_fc("ABI1(Y213)", "Ulixertinib", dec); 0.2079277075::p_fc("ABI1(Y213)", "Ulixertinib", inc) :- p_occupancy("ABI1(Y213)", "Ulixertinib", inc).
0.8842368419::p_fc("ABI1(Y213)", "Vemurafenib", dec); 0.001::p_fc("ABI1(Y213)", "Vemurafenib", inc) :- p_occupancy("ABI1(Y213)", "Vemurafenib", dec).
0.001::p_fc("ABI1(Y213)", "Vemurafenib", dec); 0.8842368419::p_fc("ABI1(Y213)", "Vemurafenib", inc) :- p_occupancy("ABI1(Y213)", "Vemurafenib", inc).
0.7365195472::p_fc("ABL1(S569)", "AC220", dec); 0.001::p_fc("ABL1(S569)", "AC220", inc) :- p_occupancy("ABL1(S569)", "AC220", dec).
0.001::p_fc("ABL1(S569)", "AC220", dec); 0.7365195472::p_fc("ABL1(S569)", "AC220", inc) :- p_occupancy("ABL1(S569)", "AC220", inc).
0.2158915666::p_fc("ABL1(S569)", "AT13148", dec); 0.001::p_fc("ABL1(S569)", "AT13148", inc) :- p_occupancy("ABL1(S569)", "AT13148", dec).
0.001::p_fc("ABL1(S569)", "AT13148", dec); 0.2158915666::p_fc("ABL1(S569)", "AT13148", inc) :- p_occupancy("ABL1(S569)", "AT13148", inc).
0.0574123734::p_fc("ABL1(S569)", "AZ20", dec); 0.001::p_fc("ABL1(S569)", "AZ20", inc) :- p_occupancy("ABL1(S569)", "AZ20", dec).
0.001::p_fc("ABL1(S569)", "AZ20", dec); 0.0574123734::p_fc("ABL1(S569)", "AZ20", inc) :- p_occupancy("ABL1(S569)", "AZ20", inc).
0.2483110431::p_fc("ABL1(S569)", "AZD1480", dec); 0.001::p_fc("ABL1(S569)", "AZD1480", inc) :- p_occupancy("ABL1(S569)", "AZD1480", dec).
0.001::p_fc("ABL1(S569)", "AZD1480", dec); 0.2483110431::p_fc("ABL1(S569)", "AZD1480", inc) :- p_occupancy("ABL1(S569)", "AZD1480", inc).
0.5992072952::p_fc("ABL1(S569)", "AZD3759", dec); 0.001::p_fc("ABL1(S569)", "AZD3759", inc) :- p_occupancy("ABL1(S569)", "AZD3759", dec).
0.001::p_fc("ABL1(S569)", "AZD3759", dec); 0.5992072952::p_fc("ABL1(S569)", "AZD3759", inc) :- p_occupancy("ABL1(S569)", "AZD3759", inc).
0.3104199547::p_fc("ABL1(S569)", "AZD5363", dec); 0.001::p_fc("ABL1(S569)", "AZD5363", inc) :- p_occupancy("ABL1(S569)", "AZD5363", dec).
0.001::p_fc("ABL1(S569)", "AZD5363", dec); 0.3104199547::p_fc("ABL1(S569)", "AZD5363", inc) :- p_occupancy("ABL1(S569)", "AZD5363", inc).
0.6573360499::p_fc("ABL1(S569)", "AZD5438", dec); 0.001::p_fc("ABL1(S569)", "AZD5438", inc) :- p_occupancy("ABL1(S569)", "AZD5438", dec).
0.001::p_fc("ABL1(S569)", "AZD5438", dec); 0.6573360499::p_fc("ABL1(S569)", "AZD5438", inc) :- p_occupancy("ABL1(S569)", "AZD5438", inc).
0.3292058784::p_fc("ABL1(S569)", "AZD6482", dec); 0.001::p_fc("ABL1(S569)", "AZD6482", inc) :- p_occupancy("ABL1(S569)", "AZD6482", dec).
0.001::p_fc("ABL1(S569)", "AZD6482", dec); 0.3292058784::p_fc("ABL1(S569)", "AZD6482", inc) :- p_occupancy("ABL1(S569)", "AZD6482", inc).
0.4448130464::p_fc("ABL1(S569)", "AZD6738", dec); 0.001::p_fc("ABL1(S569)", "AZD6738", inc) :- p_occupancy("ABL1(S569)", "AZD6738", dec).
0.001::p_fc("ABL1(S569)", "AZD6738", dec); 0.4448130464::p_fc("ABL1(S569)", "AZD6738", inc) :- p_occupancy("ABL1(S569)", "AZD6738", inc).
0.1288142893::p_fc("ABL1(S569)", "AZD8055", dec); 0.001::p_fc("ABL1(S569)", "AZD8055", inc) :- p_occupancy("ABL1(S569)", "AZD8055", dec).
0.001::p_fc("ABL1(S569)", "AZD8055", dec); 0.1288142893::p_fc("ABL1(S569)", "AZD8055", inc) :- p_occupancy("ABL1(S569)", "AZD8055", inc).
0.740772872::p_fc("ABL1(S569)", "Amuvatinib", dec); 0.001::p_fc("ABL1(S569)", "Amuvatinib", inc) :- p_occupancy("ABL1(S569)", "Amuvatinib", dec).
0.001::p_fc("ABL1(S569)", "Amuvatinib", dec); 0.740772872::p_fc("ABL1(S569)", "Amuvatinib", inc) :- p_occupancy("ABL1(S569)", "Amuvatinib", inc).
0.0817551507::p_fc("ABL1(S569)", "BX912", dec); 0.001::p_fc("ABL1(S569)", "BX912", inc) :- p_occupancy("ABL1(S569)", "BX912", dec).
0.001::p_fc("ABL1(S569)", "BX912", dec); 0.0817551507::p_fc("ABL1(S569)", "BX912", inc) :- p_occupancy("ABL1(S569)", "BX912", inc).
0.8306166669::p_fc("ABL1(S569)", "Bosutinib", dec); 0.001::p_fc("ABL1(S569)", "Bosutinib", inc) :- p_occupancy("ABL1(S569)", "Bosutinib", dec).
0.001::p_fc("ABL1(S569)", "Bosutinib", dec); 0.8306166669::p_fc("ABL1(S569)", "Bosutinib", inc) :- p_occupancy("ABL1(S569)", "Bosutinib", inc).
0.2640355868::p_fc("ABL1(S569)", "CAL101", dec); 0.001::p_fc("ABL1(S569)", "CAL101", inc) :- p_occupancy("ABL1(S569)", "CAL101", dec).
0.001::p_fc("ABL1(S569)", "CAL101", dec); 0.2640355868::p_fc("ABL1(S569)", "CAL101", inc) :- p_occupancy("ABL1(S569)", "CAL101", inc).
0.9332547623::p_fc("ABL1(S569)", "CHIR99021", dec); 0.001::p_fc("ABL1(S569)", "CHIR99021", inc) :- p_occupancy("ABL1(S569)", "CHIR99021", dec).
0.001::p_fc("ABL1(S569)", "CHIR99021", dec); 0.9332547623::p_fc("ABL1(S569)", "CHIR99021", inc) :- p_occupancy("ABL1(S569)", "CHIR99021", inc).
0.0781330821::p_fc("ABL1(S569)", "CX4945", dec); 0.001::p_fc("ABL1(S569)", "CX4945", inc) :- p_occupancy("ABL1(S569)", "CX4945", dec).
0.001::p_fc("ABL1(S569)", "CX4945", dec); 0.0781330821::p_fc("ABL1(S569)", "CX4945", inc) :- p_occupancy("ABL1(S569)", "CX4945", inc).
0.2125999294::p_fc("ABL1(S569)", "DNAPK", dec); 0.001::p_fc("ABL1(S569)", "DNAPK", inc) :- p_occupancy("ABL1(S569)", "DNAPK", dec).
0.001::p_fc("ABL1(S569)", "DNAPK", dec); 0.2125999294::p_fc("ABL1(S569)", "DNAPK", inc) :- p_occupancy("ABL1(S569)", "DNAPK", inc).
0.2317891154::p_fc("ABL1(S569)", "Dabrafenib", dec); 0.001::p_fc("ABL1(S569)", "Dabrafenib", inc) :- p_occupancy("ABL1(S569)", "Dabrafenib", dec).
0.001::p_fc("ABL1(S569)", "Dabrafenib", dec); 0.2317891154::p_fc("ABL1(S569)", "Dabrafenib", inc) :- p_occupancy("ABL1(S569)", "Dabrafenib", inc).
0.3901157734::p_fc("ABL1(S569)", "Dasatinib", dec); 0.001::p_fc("ABL1(S569)", "Dasatinib", inc) :- p_occupancy("ABL1(S569)", "Dasatinib", dec).
0.001::p_fc("ABL1(S569)", "Dasatinib", dec); 0.3901157734::p_fc("ABL1(S569)", "Dasatinib", inc) :- p_occupancy("ABL1(S569)", "Dasatinib", inc).
0.9925128563::p_fc("ABL1(S569)", "Edelfosine", dec); 0.001::p_fc("ABL1(S569)", "Edelfosine", inc) :- p_occupancy("ABL1(S569)", "Edelfosine", dec).
0.001::p_fc("ABL1(S569)", "Edelfosine", dec); 0.9925128563::p_fc("ABL1(S569)", "Edelfosine", inc) :- p_occupancy("ABL1(S569)", "Edelfosine", inc).
0.1974571028::p_fc("ABL1(S569)", "FRAX486", dec); 0.001::p_fc("ABL1(S569)", "FRAX486", inc) :- p_occupancy("ABL1(S569)", "FRAX486", dec).
0.001::p_fc("ABL1(S569)", "FRAX486", dec); 0.1974571028::p_fc("ABL1(S569)", "FRAX486", inc) :- p_occupancy("ABL1(S569)", "FRAX486", inc).
0.3835354342::p_fc("ABL1(S569)", "GDC0941", dec); 0.001::p_fc("ABL1(S569)", "GDC0941", inc) :- p_occupancy("ABL1(S569)", "GDC0941", dec).
0.001::p_fc("ABL1(S569)", "GDC0941", dec); 0.3835354342::p_fc("ABL1(S569)", "GDC0941", inc) :- p_occupancy("ABL1(S569)", "GDC0941", inc).
0.0724072426::p_fc("ABL1(S569)", "GDC0994", dec); 0.001::p_fc("ABL1(S569)", "GDC0994", inc) :- p_occupancy("ABL1(S569)", "GDC0994", dec).
0.001::p_fc("ABL1(S569)", "GDC0994", dec); 0.0724072426::p_fc("ABL1(S569)", "GDC0994", inc) :- p_occupancy("ABL1(S569)", "GDC0994", inc).
0.4324788123::p_fc("ABL1(S569)", "GF109203X", dec); 0.001::p_fc("ABL1(S569)", "GF109203X", inc) :- p_occupancy("ABL1(S569)", "GF109203X", dec).
0.001::p_fc("ABL1(S569)", "GF109203X", dec); 0.4324788123::p_fc("ABL1(S569)", "GF109203X", inc) :- p_occupancy("ABL1(S569)", "GF109203X", inc).
0.3547352984::p_fc("ABL1(S569)", "GO6983", dec); 0.001::p_fc("ABL1(S569)", "GO6983", inc) :- p_occupancy("ABL1(S569)", "GO6983", dec).
0.001::p_fc("ABL1(S569)", "GO6983", dec); 0.3547352984::p_fc("ABL1(S569)", "GO6983", inc) :- p_occupancy("ABL1(S569)", "GO6983", inc).
0.3017777716::p_fc("ABL1(S569)", "GSK2334470", dec); 0.001::p_fc("ABL1(S569)", "GSK2334470", inc) :- p_occupancy("ABL1(S569)", "GSK2334470", dec).
0.001::p_fc("ABL1(S569)", "GSK2334470", dec); 0.3017777716::p_fc("ABL1(S569)", "GSK2334470", inc) :- p_occupancy("ABL1(S569)", "GSK2334470", inc).
0.9383238368::p_fc("ABL1(S569)", "GSK690693", dec); 0.001::p_fc("ABL1(S569)", "GSK690693", inc) :- p_occupancy("ABL1(S569)", "GSK690693", dec).
0.001::p_fc("ABL1(S569)", "GSK690693", dec); 0.9383238368::p_fc("ABL1(S569)", "GSK690693", inc) :- p_occupancy("ABL1(S569)", "GSK690693", inc).
0.7129131529::p_fc("ABL1(S569)", "Go6976", dec); 0.001::p_fc("ABL1(S569)", "Go6976", inc) :- p_occupancy("ABL1(S569)", "Go6976", dec).
0.001::p_fc("ABL1(S569)", "Go6976", dec); 0.7129131529::p_fc("ABL1(S569)", "Go6976", inc) :- p_occupancy("ABL1(S569)", "Go6976", inc).
0.6477877504::p_fc("ABL1(S569)", "H89", dec); 0.001::p_fc("ABL1(S569)", "H89", inc) :- p_occupancy("ABL1(S569)", "H89", dec).
0.001::p_fc("ABL1(S569)", "H89", dec); 0.6477877504::p_fc("ABL1(S569)", "H89", inc) :- p_occupancy("ABL1(S569)", "H89", inc).
0.6317505777::p_fc("ABL1(S569)", "HS173", dec); 0.001::p_fc("ABL1(S569)", "HS173", inc) :- p_occupancy("ABL1(S569)", "HS173", dec).
0.001::p_fc("ABL1(S569)", "HS173", dec); 0.6317505777::p_fc("ABL1(S569)", "HS173", inc) :- p_occupancy("ABL1(S569)", "HS173", inc).
0.1363207595::p_fc("ABL1(S569)", "Ipatasertib", dec); 0.001::p_fc("ABL1(S569)", "Ipatasertib", inc) :- p_occupancy("ABL1(S569)", "Ipatasertib", dec).
0.001::p_fc("ABL1(S569)", "Ipatasertib", dec); 0.1363207595::p_fc("ABL1(S569)", "Ipatasertib", inc) :- p_occupancy("ABL1(S569)", "Ipatasertib", inc).
0.913670453::p_fc("ABL1(S569)", "JNJ", dec); 0.001::p_fc("ABL1(S569)", "JNJ", inc) :- p_occupancy("ABL1(S569)", "JNJ", dec).
0.001::p_fc("ABL1(S569)", "JNJ", dec); 0.913670453::p_fc("ABL1(S569)", "JNJ", inc) :- p_occupancy("ABL1(S569)", "JNJ", inc).
0.2511955112::p_fc("ABL1(S569)", "JNK", dec); 0.001::p_fc("ABL1(S569)", "JNK", inc) :- p_occupancy("ABL1(S569)", "JNK", dec).
0.001::p_fc("ABL1(S569)", "JNK", dec); 0.2511955112::p_fc("ABL1(S569)", "JNK", inc) :- p_occupancy("ABL1(S569)", "JNK", inc).
0.4825286411::p_fc("ABL1(S569)", "KD025", dec); 0.001::p_fc("ABL1(S569)", "KD025", inc) :- p_occupancy("ABL1(S569)", "KD025", dec).
0.001::p_fc("ABL1(S569)", "KD025", dec); 0.4825286411::p_fc("ABL1(S569)", "KD025", inc) :- p_occupancy("ABL1(S569)", "KD025", inc).
0.4370370562::p_fc("ABL1(S569)", "KN62", dec); 0.001::p_fc("ABL1(S569)", "KN62", inc) :- p_occupancy("ABL1(S569)", "KN62", dec).
0.001::p_fc("ABL1(S569)", "KN62", dec); 0.4370370562::p_fc("ABL1(S569)", "KN62", inc) :- p_occupancy("ABL1(S569)", "KN62", inc).
0.3002555235::p_fc("ABL1(S569)", "KN93", dec); 0.001::p_fc("ABL1(S569)", "KN93", inc) :- p_occupancy("ABL1(S569)", "KN93", dec).
0.001::p_fc("ABL1(S569)", "KN93", dec); 0.3002555235::p_fc("ABL1(S569)", "KN93", inc) :- p_occupancy("ABL1(S569)", "KN93", inc).
0.016929771::p_fc("ABL1(S569)", "Ku0063794", dec); 0.001::p_fc("ABL1(S569)", "Ku0063794", inc) :- p_occupancy("ABL1(S569)", "Ku0063794", dec).
0.001::p_fc("ABL1(S569)", "Ku0063794", dec); 0.016929771::p_fc("ABL1(S569)", "Ku0063794", inc) :- p_occupancy("ABL1(S569)", "Ku0063794", inc).
0.9962852118::p_fc("ABL1(S569)", "LY2090314", dec); 0.001::p_fc("ABL1(S569)", "LY2090314", inc) :- p_occupancy("ABL1(S569)", "LY2090314", dec).
0.001::p_fc("ABL1(S569)", "LY2090314", dec); 0.9962852118::p_fc("ABL1(S569)", "LY2090314", inc) :- p_occupancy("ABL1(S569)", "LY2090314", inc).
0.4298096158::p_fc("ABL1(S569)", "LY2584702", dec); 0.001::p_fc("ABL1(S569)", "LY2584702", inc) :- p_occupancy("ABL1(S569)", "LY2584702", dec).
0.001::p_fc("ABL1(S569)", "LY2584702", dec); 0.4298096158::p_fc("ABL1(S569)", "LY2584702", inc) :- p_occupancy("ABL1(S569)", "LY2584702", inc).
0.3993449543::p_fc("ABL1(S569)", "LY2835219", dec); 0.001::p_fc("ABL1(S569)", "LY2835219", inc) :- p_occupancy("ABL1(S569)", "LY2835219", dec).
0.001::p_fc("ABL1(S569)", "LY2835219", dec); 0.3993449543::p_fc("ABL1(S569)", "LY2835219", inc) :- p_occupancy("ABL1(S569)", "LY2835219", inc).
0.3039387158::p_fc("ABL1(S569)", "Linsitinib", dec); 0.001::p_fc("ABL1(S569)", "Linsitinib", inc) :- p_occupancy("ABL1(S569)", "Linsitinib", dec).
0.001::p_fc("ABL1(S569)", "Linsitinib", dec); 0.3039387158::p_fc("ABL1(S569)", "Linsitinib", inc) :- p_occupancy("ABL1(S569)", "Linsitinib", inc).
0.2797045064::p_fc("ABL1(S569)", "MK2206", dec); 0.001::p_fc("ABL1(S569)", "MK2206", inc) :- p_occupancy("ABL1(S569)", "MK2206", dec).
0.001::p_fc("ABL1(S569)", "MK2206", dec); 0.2797045064::p_fc("ABL1(S569)", "MK2206", inc) :- p_occupancy("ABL1(S569)", "MK2206", inc).
0.3322446667::p_fc("ABL1(S569)", "NU7441", dec); 0.001::p_fc("ABL1(S569)", "NU7441", inc) :- p_occupancy("ABL1(S569)", "NU7441", dec).
0.001::p_fc("ABL1(S569)", "NU7441", dec); 0.3322446667::p_fc("ABL1(S569)", "NU7441", inc) :- p_occupancy("ABL1(S569)", "NU7441", inc).
0.7625801887::p_fc("ABL1(S569)", "PD153035", dec); 0.001::p_fc("ABL1(S569)", "PD153035", inc) :- p_occupancy("ABL1(S569)", "PD153035", dec).
0.001::p_fc("ABL1(S569)", "PD153035", dec); 0.7625801887::p_fc("ABL1(S569)", "PD153035", inc) :- p_occupancy("ABL1(S569)", "PD153035", inc).
0.7469910934::p_fc("ABL1(S569)", "PF3758309", dec); 0.001::p_fc("ABL1(S569)", "PF3758309", inc) :- p_occupancy("ABL1(S569)", "PF3758309", dec).
0.001::p_fc("ABL1(S569)", "PF3758309", dec); 0.7469910934::p_fc("ABL1(S569)", "PF3758309", inc) :- p_occupancy("ABL1(S569)", "PF3758309", inc).
0.7645401204::p_fc("ABL1(S569)", "PF4708671", dec); 0.001::p_fc("ABL1(S569)", "PF4708671", inc) :- p_occupancy("ABL1(S569)", "PF4708671", dec).
0.001::p_fc("ABL1(S569)", "PF4708671", dec); 0.7645401204::p_fc("ABL1(S569)", "PF4708671", inc) :- p_occupancy("ABL1(S569)", "PF4708671", inc).
0.9011874702::p_fc("ABL1(S569)", "PH797804", dec); 0.001::p_fc("ABL1(S569)", "PH797804", inc) :- p_occupancy("ABL1(S569)", "PH797804", dec).
0.001::p_fc("ABL1(S569)", "PH797804", dec); 0.9011874702::p_fc("ABL1(S569)", "PH797804", inc) :- p_occupancy("ABL1(S569)", "PH797804", inc).
0.040709475::p_fc("ABL1(S569)", "PIK294", dec); 0.001::p_fc("ABL1(S569)", "PIK294", inc) :- p_occupancy("ABL1(S569)", "PIK294", dec).
0.001::p_fc("ABL1(S569)", "PIK294", dec); 0.040709475::p_fc("ABL1(S569)", "PIK294", inc) :- p_occupancy("ABL1(S569)", "PIK294", inc).
0.7148131518::p_fc("ABL1(S569)", "Ribociclib", dec); 0.001::p_fc("ABL1(S569)", "Ribociclib", inc) :- p_occupancy("ABL1(S569)", "Ribociclib", dec).
0.001::p_fc("ABL1(S569)", "Ribociclib", dec); 0.7148131518::p_fc("ABL1(S569)", "Ribociclib", inc) :- p_occupancy("ABL1(S569)", "Ribociclib", inc).
0.8096545523::p_fc("ABL1(S569)", "Ripasudil", dec); 0.001::p_fc("ABL1(S569)", "Ripasudil", inc) :- p_occupancy("ABL1(S569)", "Ripasudil", dec).
0.001::p_fc("ABL1(S569)", "Ripasudil", dec); 0.8096545523::p_fc("ABL1(S569)", "Ripasudil", inc) :- p_occupancy("ABL1(S569)", "Ripasudil", inc).
0.8972194543::p_fc("ABL1(S569)", "SP600125", dec); 0.001::p_fc("ABL1(S569)", "SP600125", inc) :- p_occupancy("ABL1(S569)", "SP600125", dec).
0.001::p_fc("ABL1(S569)", "SP600125", dec); 0.8972194543::p_fc("ABL1(S569)", "SP600125", inc) :- p_occupancy("ABL1(S569)", "SP600125", inc).
0.0893778097::p_fc("ABL1(S569)", "Selumetinib", dec); 0.001::p_fc("ABL1(S569)", "Selumetinib", inc) :- p_occupancy("ABL1(S569)", "Selumetinib", dec).
0.001::p_fc("ABL1(S569)", "Selumetinib", dec); 0.0893778097::p_fc("ABL1(S569)", "Selumetinib", inc) :- p_occupancy("ABL1(S569)", "Selumetinib", inc).
0.2554644202::p_fc("ABL1(S569)", "TAK715", dec); 0.001::p_fc("ABL1(S569)", "TAK715", inc) :- p_occupancy("ABL1(S569)", "TAK715", dec).
0.001::p_fc("ABL1(S569)", "TAK715", dec); 0.2554644202::p_fc("ABL1(S569)", "TAK715", inc) :- p_occupancy("ABL1(S569)", "TAK715", inc).
0.3733213716::p_fc("ABL1(S569)", "TBCA", dec); 0.001::p_fc("ABL1(S569)", "TBCA", inc) :- p_occupancy("ABL1(S569)", "TBCA", dec).
0.001::p_fc("ABL1(S569)", "TBCA", dec); 0.3733213716::p_fc("ABL1(S569)", "TBCA", inc) :- p_occupancy("ABL1(S569)", "TBCA", inc).
0.1395714217::p_fc("ABL1(S569)", "TGX221", dec); 0.001::p_fc("ABL1(S569)", "TGX221", inc) :- p_occupancy("ABL1(S569)", "TGX221", dec).
0.001::p_fc("ABL1(S569)", "TGX221", dec); 0.1395714217::p_fc("ABL1(S569)", "TGX221", inc) :- p_occupancy("ABL1(S569)", "TGX221", inc).
0.2238189091::p_fc("ABL1(S569)", "Tofacitinib", dec); 0.001::p_fc("ABL1(S569)", "Tofacitinib", inc) :- p_occupancy("ABL1(S569)", "Tofacitinib", dec).
0.001::p_fc("ABL1(S569)", "Tofacitinib", dec); 0.2238189091::p_fc("ABL1(S569)", "Tofacitinib", inc) :- p_occupancy("ABL1(S569)", "Tofacitinib", inc).
0.5198472772::p_fc("ABL1(S569)", "Torin", dec); 0.001::p_fc("ABL1(S569)", "Torin", inc) :- p_occupancy("ABL1(S569)", "Torin", dec).
0.001::p_fc("ABL1(S569)", "Torin", dec); 0.5198472772::p_fc("ABL1(S569)", "Torin", inc) :- p_occupancy("ABL1(S569)", "Torin", inc).
0.0166180468::p_fc("ABL1(S569)", "Trametinib", dec); 0.001::p_fc("ABL1(S569)", "Trametinib", inc) :- p_occupancy("ABL1(S569)", "Trametinib", dec).
0.001::p_fc("ABL1(S569)", "Trametinib", dec); 0.0166180468::p_fc("ABL1(S569)", "Trametinib", inc) :- p_occupancy("ABL1(S569)", "Trametinib", inc).
0.7525441384::p_fc("ABL1(S569)", "U73122", dec); 0.001::p_fc("ABL1(S569)", "U73122", inc) :- p_occupancy("ABL1(S569)", "U73122", dec).
0.001::p_fc("ABL1(S569)", "U73122", dec); 0.7525441384::p_fc("ABL1(S569)", "U73122", inc) :- p_occupancy("ABL1(S569)", "U73122", inc).
0.3890482293::p_fc("ABL1(S569)", "Ulixertinib", dec); 0.001::p_fc("ABL1(S569)", "Ulixertinib", inc) :- p_occupancy("ABL1(S569)", "Ulixertinib", dec).
0.001::p_fc("ABL1(S569)", "Ulixertinib", dec); 0.3890482293::p_fc("ABL1(S569)", "Ulixertinib", inc) :- p_occupancy("ABL1(S569)", "Ulixertinib", inc).
0.905941106::p_fc("ABL1(S569)", "Vemurafenib", dec); 0.001::p_fc("ABL1(S569)", "Vemurafenib", inc) :- p_occupancy("ABL1(S569)", "Vemurafenib", dec).
0.001::p_fc("ABL1(S569)", "Vemurafenib", dec); 0.905941106::p_fc("ABL1(S569)", "Vemurafenib", inc) :- p_occupancy("ABL1(S569)", "Vemurafenib", inc).
0.177358319::p_fc("ABL1(S718)", "AC220", dec); 0.001::p_fc("ABL1(S718)", "AC220", inc) :- p_occupancy("ABL1(S718)", "AC220", dec).
0.001::p_fc("ABL1(S718)", "AC220", dec); 0.177358319::p_fc("ABL1(S718)", "AC220", inc) :- p_occupancy("ABL1(S718)", "AC220", inc).
0.4798002737::p_fc("ABL1(S718)", "AT13148", dec); 0.001::p_fc("ABL1(S718)", "AT13148", inc) :- p_occupancy("ABL1(S718)", "AT13148", dec).
0.001::p_fc("ABL1(S718)", "AT13148", dec); 0.4798002737::p_fc("ABL1(S718)", "AT13148", inc) :- p_occupancy("ABL1(S718)", "AT13148", inc).
0.214644036::p_fc("ABL1(S718)", "AZ20", dec); 0.001::p_fc("ABL1(S718)", "AZ20", inc) :- p_occupancy("ABL1(S718)", "AZ20", dec).
0.001::p_fc("ABL1(S718)", "AZ20", dec); 0.214644036::p_fc("ABL1(S718)", "AZ20", inc) :- p_occupancy("ABL1(S718)", "AZ20", inc).
0.3652864541::p_fc("ABL1(S718)", "AZD1480", dec); 0.001::p_fc("ABL1(S718)", "AZD1480", inc) :- p_occupancy("ABL1(S718)", "AZD1480", dec).
0.001::p_fc("ABL1(S718)", "AZD1480", dec); 0.3652864541::p_fc("ABL1(S718)", "AZD1480", inc) :- p_occupancy("ABL1(S718)", "AZD1480", inc).
0.2101821522::p_fc("ABL1(S718)", "AZD3759", dec); 0.001::p_fc("ABL1(S718)", "AZD3759", inc) :- p_occupancy("ABL1(S718)", "AZD3759", dec).
0.001::p_fc("ABL1(S718)", "AZD3759", dec); 0.2101821522::p_fc("ABL1(S718)", "AZD3759", inc) :- p_occupancy("ABL1(S718)", "AZD3759", inc).
0.3248406263::p_fc("ABL1(S718)", "AZD5363", dec); 0.001::p_fc("ABL1(S718)", "AZD5363", inc) :- p_occupancy("ABL1(S718)", "AZD5363", dec).
0.001::p_fc("ABL1(S718)", "AZD5363", dec); 0.3248406263::p_fc("ABL1(S718)", "AZD5363", inc) :- p_occupancy("ABL1(S718)", "AZD5363", inc).
0.4222024873::p_fc("ABL1(S718)", "AZD5438", dec); 0.001::p_fc("ABL1(S718)", "AZD5438", inc) :- p_occupancy("ABL1(S718)", "AZD5438", dec).
0.001::p_fc("ABL1(S718)", "AZD5438", dec); 0.4222024873::p_fc("ABL1(S718)", "AZD5438", inc) :- p_occupancy("ABL1(S718)", "AZD5438", inc).
0.2142564463::p_fc("ABL1(S718)", "AZD6482", dec); 0.001::p_fc("ABL1(S718)", "AZD6482", inc) :- p_occupancy("ABL1(S718)", "AZD6482", dec).
0.001::p_fc("ABL1(S718)", "AZD6482", dec); 0.2142564463::p_fc("ABL1(S718)", "AZD6482", inc) :- p_occupancy("ABL1(S718)", "AZD6482", inc).
0.5057650109::p_fc("ABL1(S718)", "AZD6738", dec); 0.001::p_fc("ABL1(S718)", "AZD6738", inc) :- p_occupancy("ABL1(S718)", "AZD6738", dec).
0.001::p_fc("ABL1(S718)", "AZD6738", dec); 0.5057650109::p_fc("ABL1(S718)", "AZD6738", inc) :- p_occupancy("ABL1(S718)", "AZD6738", inc).
0.9911452719::p_fc("ABL1(S718)", "AZD8055", dec); 0.001::p_fc("ABL1(S718)", "AZD8055", inc) :- p_occupancy("ABL1(S718)", "AZD8055", dec).
0.001::p_fc("ABL1(S718)", "AZD8055", dec); 0.9911452719::p_fc("ABL1(S718)", "AZD8055", inc) :- p_occupancy("ABL1(S718)", "AZD8055", inc).
0.1983658666::p_fc("ABL1(S718)", "Amuvatinib", dec); 0.001::p_fc("ABL1(S718)", "Amuvatinib", inc) :- p_occupancy("ABL1(S718)", "Amuvatinib", dec).
0.001::p_fc("ABL1(S718)", "Amuvatinib", dec); 0.1983658666::p_fc("ABL1(S718)", "Amuvatinib", inc) :- p_occupancy("ABL1(S718)", "Amuvatinib", inc).
0.3492654086::p_fc("ABL1(S718)", "BX912", dec); 0.001::p_fc("ABL1(S718)", "BX912", inc) :- p_occupancy("ABL1(S718)", "BX912", dec).
0.001::p_fc("ABL1(S718)", "BX912", dec); 0.3492654086::p_fc("ABL1(S718)", "BX912", inc) :- p_occupancy("ABL1(S718)", "BX912", inc).
0.333194516::p_fc("ABL1(S718)", "Bosutinib", dec); 0.001::p_fc("ABL1(S718)", "Bosutinib", inc) :- p_occupancy("ABL1(S718)", "Bosutinib", dec).
0.001::p_fc("ABL1(S718)", "Bosutinib", dec); 0.333194516::p_fc("ABL1(S718)", "Bosutinib", inc) :- p_occupancy("ABL1(S718)", "Bosutinib", inc).
0.5811865539::p_fc("ABL1(S718)", "CAL101", dec); 0.001::p_fc("ABL1(S718)", "CAL101", inc) :- p_occupancy("ABL1(S718)", "CAL101", dec).
0.001::p_fc("ABL1(S718)", "CAL101", dec); 0.5811865539::p_fc("ABL1(S718)", "CAL101", inc) :- p_occupancy("ABL1(S718)", "CAL101", inc).
0.2610230788::p_fc("ABL1(S718)", "CHIR99021", dec); 0.001::p_fc("ABL1(S718)", "CHIR99021", inc) :- p_occupancy("ABL1(S718)", "CHIR99021", dec).
0.001::p_fc("ABL1(S718)", "CHIR99021", dec); 0.2610230788::p_fc("ABL1(S718)", "CHIR99021", inc) :- p_occupancy("ABL1(S718)", "CHIR99021", inc).
0.8940438415::p_fc("ABL1(S718)", "CX4945", dec); 0.001::p_fc("ABL1(S718)", "CX4945", inc) :- p_occupancy("ABL1(S718)", "CX4945", dec).
0.001::p_fc("ABL1(S718)", "CX4945", dec); 0.8940438415::p_fc("ABL1(S718)", "CX4945", inc) :- p_occupancy("ABL1(S718)", "CX4945", inc).
0.1468027282::p_fc("ABL1(S718)", "DNAPK", dec); 0.001::p_fc("ABL1(S718)", "DNAPK", inc) :- p_occupancy("ABL1(S718)", "DNAPK", dec).
0.001::p_fc("ABL1(S718)", "DNAPK", dec); 0.1468027282::p_fc("ABL1(S718)", "DNAPK", inc) :- p_occupancy("ABL1(S718)", "DNAPK", inc).
0.1048577244::p_fc("ABL1(S718)", "Dabrafenib", dec); 0.001::p_fc("ABL1(S718)", "Dabrafenib", inc) :- p_occupancy("ABL1(S718)", "Dabrafenib", dec).
0.001::p_fc("ABL1(S718)", "Dabrafenib", dec); 0.1048577244::p_fc("ABL1(S718)", "Dabrafenib", inc) :- p_occupancy("ABL1(S718)", "Dabrafenib", inc).
0.3100588751::p_fc("ABL1(S718)", "Dasatinib", dec); 0.001::p_fc("ABL1(S718)", "Dasatinib", inc) :- p_occupancy("ABL1(S718)", "Dasatinib", dec).
0.001::p_fc("ABL1(S718)", "Dasatinib", dec); 0.3100588751::p_fc("ABL1(S718)", "Dasatinib", inc) :- p_occupancy("ABL1(S718)", "Dasatinib", inc).
0.5630430064::p_fc("ABL1(S718)", "Edelfosine", dec); 0.001::p_fc("ABL1(S718)", "Edelfosine", inc) :- p_occupancy("ABL1(S718)", "Edelfosine", dec).
0.001::p_fc("ABL1(S718)", "Edelfosine", dec); 0.5630430064::p_fc("ABL1(S718)", "Edelfosine", inc) :- p_occupancy("ABL1(S718)", "Edelfosine", inc).
0.6415059618::p_fc("ABL1(S718)", "FRAX486", dec); 0.001::p_fc("ABL1(S718)", "FRAX486", inc) :- p_occupancy("ABL1(S718)", "FRAX486", dec).
0.001::p_fc("ABL1(S718)", "FRAX486", dec); 0.6415059618::p_fc("ABL1(S718)", "FRAX486", inc) :- p_occupancy("ABL1(S718)", "FRAX486", inc).
0.0943835703::p_fc("ABL1(S718)", "GDC0941", dec); 0.001::p_fc("ABL1(S718)", "GDC0941", inc) :- p_occupancy("ABL1(S718)", "GDC0941", dec).
0.001::p_fc("ABL1(S718)", "GDC0941", dec); 0.0943835703::p_fc("ABL1(S718)", "GDC0941", inc) :- p_occupancy("ABL1(S718)", "GDC0941", inc).
0.7936689214::p_fc("ABL1(S718)", "GDC0994", dec); 0.001::p_fc("ABL1(S718)", "GDC0994", inc) :- p_occupancy("ABL1(S718)", "GDC0994", dec).
0.001::p_fc("ABL1(S718)", "GDC0994", dec); 0.7936689214::p_fc("ABL1(S718)", "GDC0994", inc) :- p_occupancy("ABL1(S718)", "GDC0994", inc).
0.3334741099::p_fc("ABL1(S718)", "GF109203X", dec); 0.001::p_fc("ABL1(S718)", "GF109203X", inc) :- p_occupancy("ABL1(S718)", "GF109203X", dec).
0.001::p_fc("ABL1(S718)", "GF109203X", dec); 0.3334741099::p_fc("ABL1(S718)", "GF109203X", inc) :- p_occupancy("ABL1(S718)", "GF109203X", inc).
0.9767743696::p_fc("ABL1(S718)", "GO6983", dec); 0.001::p_fc("ABL1(S718)", "GO6983", inc) :- p_occupancy("ABL1(S718)", "GO6983", dec).
0.001::p_fc("ABL1(S718)", "GO6983", dec); 0.9767743696::p_fc("ABL1(S718)", "GO6983", inc) :- p_occupancy("ABL1(S718)", "GO6983", inc).
0.6001857028::p_fc("ABL1(S718)", "GSK2334470", dec); 0.001::p_fc("ABL1(S718)", "GSK2334470", inc) :- p_occupancy("ABL1(S718)", "GSK2334470", dec).
0.001::p_fc("ABL1(S718)", "GSK2334470", dec); 0.6001857028::p_fc("ABL1(S718)", "GSK2334470", inc) :- p_occupancy("ABL1(S718)", "GSK2334470", inc).
0.2049318976::p_fc("ABL1(S718)", "GSK690693", dec); 0.001::p_fc("ABL1(S718)", "GSK690693", inc) :- p_occupancy("ABL1(S718)", "GSK690693", dec).
0.001::p_fc("ABL1(S718)", "GSK690693", dec); 0.2049318976::p_fc("ABL1(S718)", "GSK690693", inc) :- p_occupancy("ABL1(S718)", "GSK690693", inc).
0.2483615227::p_fc("ABL1(S718)", "Go6976", dec); 0.001::p_fc("ABL1(S718)", "Go6976", inc) :- p_occupancy("ABL1(S718)", "Go6976", dec).
0.001::p_fc("ABL1(S718)", "Go6976", dec); 0.2483615227::p_fc("ABL1(S718)", "Go6976", inc) :- p_occupancy("ABL1(S718)", "Go6976", inc).
0.3228156811::p_fc("ABL1(S718)", "H89", dec); 0.001::p_fc("ABL1(S718)", "H89", inc) :- p_occupancy("ABL1(S718)", "H89", dec).
0.001::p_fc("ABL1(S718)", "H89", dec); 0.3228156811::p_fc("ABL1(S718)", "H89", inc) :- p_occupancy("ABL1(S718)", "H89", inc).
0.0686644096::p_fc("ABL1(S718)", "HS173", dec); 0.001::p_fc("ABL1(S718)", "HS173", inc) :- p_occupancy("ABL1(S718)", "HS173", dec).
0.001::p_fc("ABL1(S718)", "HS173", dec); 0.0686644096::p_fc("ABL1(S718)", "HS173", inc) :- p_occupancy("ABL1(S718)", "HS173", inc).
0.6276497277::p_fc("ABL1(S718)", "Ipatasertib", dec); 0.001::p_fc("ABL1(S718)", "Ipatasertib", inc) :- p_occupancy("ABL1(S718)", "Ipatasertib", dec).
0.001::p_fc("ABL1(S718)", "Ipatasertib", dec); 0.6276497277::p_fc("ABL1(S718)", "Ipatasertib", inc) :- p_occupancy("ABL1(S718)", "Ipatasertib", inc).
0.0261807981::p_fc("ABL1(S718)", "JNJ", dec); 0.001::p_fc("ABL1(S718)", "JNJ", inc) :- p_occupancy("ABL1(S718)", "JNJ", dec).
0.001::p_fc("ABL1(S718)", "JNJ", dec); 0.0261807981::p_fc("ABL1(S718)", "JNJ", inc) :- p_occupancy("ABL1(S718)", "JNJ", inc).
0.6334440111::p_fc("ABL1(S718)", "JNK", dec); 0.001::p_fc("ABL1(S718)", "JNK", inc) :- p_occupancy("ABL1(S718)", "JNK", dec).
0.001::p_fc("ABL1(S718)", "JNK", dec); 0.6334440111::p_fc("ABL1(S718)", "JNK", inc) :- p_occupancy("ABL1(S718)", "JNK", inc).
0.1183674988::p_fc("ABL1(S718)", "KD025", dec); 0.001::p_fc("ABL1(S718)", "KD025", inc) :- p_occupancy("ABL1(S718)", "KD025", dec).
0.001::p_fc("ABL1(S718)", "KD025", dec); 0.1183674988::p_fc("ABL1(S718)", "KD025", inc) :- p_occupancy("ABL1(S718)", "KD025", inc).
0.0133540689::p_fc("ABL1(S718)", "KN62", dec); 0.001::p_fc("ABL1(S718)", "KN62", inc) :- p_occupancy("ABL1(S718)", "KN62", dec).
0.001::p_fc("ABL1(S718)", "KN62", dec); 0.0133540689::p_fc("ABL1(S718)", "KN62", inc) :- p_occupancy("ABL1(S718)", "KN62", inc).
0.0371193354::p_fc("ABL1(S718)", "KN93", dec); 0.001::p_fc("ABL1(S718)", "KN93", inc) :- p_occupancy("ABL1(S718)", "KN93", dec).
0.001::p_fc("ABL1(S718)", "KN93", dec); 0.0371193354::p_fc("ABL1(S718)", "KN93", inc) :- p_occupancy("ABL1(S718)", "KN93", inc).
0.0315831318::p_fc("ABL1(S718)", "Ku0063794", dec); 0.001::p_fc("ABL1(S718)", "Ku0063794", inc) :- p_occupancy("ABL1(S718)", "Ku0063794", dec).
0.001::p_fc("ABL1(S718)", "Ku0063794", dec); 0.0315831318::p_fc("ABL1(S718)", "Ku0063794", inc) :- p_occupancy("ABL1(S718)", "Ku0063794", inc).
0.6583916947::p_fc("ABL1(S718)", "LY2090314", dec); 0.001::p_fc("ABL1(S718)", "LY2090314", inc) :- p_occupancy("ABL1(S718)", "LY2090314", dec).
0.001::p_fc("ABL1(S718)", "LY2090314", dec); 0.6583916947::p_fc("ABL1(S718)", "LY2090314", inc) :- p_occupancy("ABL1(S718)", "LY2090314", inc).
0.7162484709::p_fc("ABL1(S718)", "LY2584702", dec); 0.001::p_fc("ABL1(S718)", "LY2584702", inc) :- p_occupancy("ABL1(S718)", "LY2584702", dec).
0.001::p_fc("ABL1(S718)", "LY2584702", dec); 0.7162484709::p_fc("ABL1(S718)", "LY2584702", inc) :- p_occupancy("ABL1(S718)", "LY2584702", inc).
0.0213633764::p_fc("ABL1(S718)", "LY2835219", dec); 0.001::p_fc("ABL1(S718)", "LY2835219", inc) :- p_occupancy("ABL1(S718)", "LY2835219", dec).
0.001::p_fc("ABL1(S718)", "LY2835219", dec); 0.0213633764::p_fc("ABL1(S718)", "LY2835219", inc) :- p_occupancy("ABL1(S718)", "LY2835219", inc).
0.4443913787::p_fc("ABL1(S718)", "Linsitinib", dec); 0.001::p_fc("ABL1(S718)", "Linsitinib", inc) :- p_occupancy("ABL1(S718)", "Linsitinib", dec).
0.001::p_fc("ABL1(S718)", "Linsitinib", dec); 0.4443913787::p_fc("ABL1(S718)", "Linsitinib", inc) :- p_occupancy("ABL1(S718)", "Linsitinib", inc).
0.1981608507::p_fc("ABL1(S718)", "MK2206", dec); 0.001::p_fc("ABL1(S718)", "MK2206", inc) :- p_occupancy("ABL1(S718)", "MK2206", dec).
0.001::p_fc("ABL1(S718)", "MK2206", dec); 0.1981608507::p_fc("ABL1(S718)", "MK2206", inc) :- p_occupancy("ABL1(S718)", "MK2206", inc).
0.2485750287::p_fc("ABL1(S718)", "NU7441", dec); 0.001::p_fc("ABL1(S718)", "NU7441", inc) :- p_occupancy("ABL1(S718)", "NU7441", dec).
0.001::p_fc("ABL1(S718)", "NU7441", dec); 0.2485750287::p_fc("ABL1(S718)", "NU7441", inc) :- p_occupancy("ABL1(S718)", "NU7441", inc).
0.2203174995::p_fc("ABL1(S718)", "PD153035", dec); 0.001::p_fc("ABL1(S718)", "PD153035", inc) :- p_occupancy("ABL1(S718)", "PD153035", dec).
0.001::p_fc("ABL1(S718)", "PD153035", dec); 0.2203174995::p_fc("ABL1(S718)", "PD153035", inc) :- p_occupancy("ABL1(S718)", "PD153035", inc).
0.8614128511::p_fc("ABL1(S718)", "PF3758309", dec); 0.001::p_fc("ABL1(S718)", "PF3758309", inc) :- p_occupancy("ABL1(S718)", "PF3758309", dec).
0.001::p_fc("ABL1(S718)", "PF3758309", dec); 0.8614128511::p_fc("ABL1(S718)", "PF3758309", inc) :- p_occupancy("ABL1(S718)", "PF3758309", inc).
0.2703617295::p_fc("ABL1(S718)", "PF4708671", dec); 0.001::p_fc("ABL1(S718)", "PF4708671", inc) :- p_occupancy("ABL1(S718)", "PF4708671", dec).
0.001::p_fc("ABL1(S718)", "PF4708671", dec); 0.2703617295::p_fc("ABL1(S718)", "PF4708671", inc) :- p_occupancy("ABL1(S718)", "PF4708671", inc).
0.7718692033::p_fc("ABL1(S718)", "PH797804", dec); 0.001::p_fc("ABL1(S718)", "PH797804", inc) :- p_occupancy("ABL1(S718)", "PH797804", dec).
0.001::p_fc("ABL1(S718)", "PH797804", dec); 0.7718692033::p_fc("ABL1(S718)", "PH797804", inc) :- p_occupancy("ABL1(S718)", "PH797804", inc).
0.1160382271::p_fc("ABL1(S718)", "PIK294", dec); 0.001::p_fc("ABL1(S718)", "PIK294", inc) :- p_occupancy("ABL1(S718)", "PIK294", dec).
0.001::p_fc("ABL1(S718)", "PIK294", dec); 0.1160382271::p_fc("ABL1(S718)", "PIK294", inc) :- p_occupancy("ABL1(S718)", "PIK294", inc).
0.0068614376::p_fc("ABL1(S718)", "Ribociclib", dec); 0.001::p_fc("ABL1(S718)", "Ribociclib", inc) :- p_occupancy("ABL1(S718)", "Ribociclib", dec).
0.001::p_fc("ABL1(S718)", "Ribociclib", dec); 0.0068614376::p_fc("ABL1(S718)", "Ribociclib", inc) :- p_occupancy("ABL1(S718)", "Ribociclib", inc).
0.4928541653::p_fc("ABL1(S718)", "Ripasudil", dec); 0.001::p_fc("ABL1(S718)", "Ripasudil", inc) :- p_occupancy("ABL1(S718)", "Ripasudil", dec).
0.001::p_fc("ABL1(S718)", "Ripasudil", dec); 0.4928541653::p_fc("ABL1(S718)", "Ripasudil", inc) :- p_occupancy("ABL1(S718)", "Ripasudil", inc).
0.15185443::p_fc("ABL1(S718)", "SP600125", dec); 0.001::p_fc("ABL1(S718)", "SP600125", inc) :- p_occupancy("ABL1(S718)", "SP600125", dec).
0.001::p_fc("ABL1(S718)", "SP600125", dec); 0.15185443::p_fc("ABL1(S718)", "SP600125", inc) :- p_occupancy("ABL1(S718)", "SP600125", inc).
0.1339580053::p_fc("ABL1(S718)", "Selumetinib", dec); 0.001::p_fc("ABL1(S718)", "Selumetinib", inc) :- p_occupancy("ABL1(S718)", "Selumetinib", dec).
0.001::p_fc("ABL1(S718)", "Selumetinib", dec); 0.1339580053::p_fc("ABL1(S718)", "Selumetinib", inc) :- p_occupancy("ABL1(S718)", "Selumetinib", inc).
0.7764699681::p_fc("ABL1(S718)", "TAK715", dec); 0.001::p_fc("ABL1(S718)", "TAK715", inc) :- p_occupancy("ABL1(S718)", "TAK715", dec).
0.001::p_fc("ABL1(S718)", "TAK715", dec); 0.7764699681::p_fc("ABL1(S718)", "TAK715", inc) :- p_occupancy("ABL1(S718)", "TAK715", inc).
0.2009760172::p_fc("ABL1(S718)", "TBCA", dec); 0.001::p_fc("ABL1(S718)", "TBCA", inc) :- p_occupancy("ABL1(S718)", "TBCA", dec).
0.001::p_fc("ABL1(S718)", "TBCA", dec); 0.2009760172::p_fc("ABL1(S718)", "TBCA", inc) :- p_occupancy("ABL1(S718)", "TBCA", inc).
0.2115007125::p_fc("ABL1(S718)", "TGX221", dec); 0.001::p_fc("ABL1(S718)", "TGX221", inc) :- p_occupancy("ABL1(S718)", "TGX221", dec).
0.001::p_fc("ABL1(S718)", "TGX221", dec); 0.2115007125::p_fc("ABL1(S718)", "TGX221", inc) :- p_occupancy("ABL1(S718)", "TGX221", inc).
0.4624684831::p_fc("ABL1(S718)", "Tofacitinib", dec); 0.001::p_fc("ABL1(S718)", "Tofacitinib", inc) :- p_occupancy("ABL1(S718)", "Tofacitinib", dec).
0.001::p_fc("ABL1(S718)", "Tofacitinib", dec); 0.4624684831::p_fc("ABL1(S718)", "Tofacitinib", inc) :- p_occupancy("ABL1(S718)", "Tofacitinib", inc).
0.872714853::p_fc("ABL1(S718)", "Torin", dec); 0.001::p_fc("ABL1(S718)", "Torin", inc) :- p_occupancy("ABL1(S718)", "Torin", dec).
0.001::p_fc("ABL1(S718)", "Torin", dec); 0.872714853::p_fc("ABL1(S718)", "Torin", inc) :- p_occupancy("ABL1(S718)", "Torin", inc).
0.5774995091::p_fc("ABL1(S718)", "Trametinib", dec); 0.001::p_fc("ABL1(S718)", "Trametinib", inc) :- p_occupancy("ABL1(S718)", "Trametinib", dec).
0.001::p_fc("ABL1(S718)", "Trametinib", dec); 0.5774995091::p_fc("ABL1(S718)", "Trametinib", inc) :- p_occupancy("ABL1(S718)", "Trametinib", inc).
0.7352087133::p_fc("ABL1(S718)", "U73122", dec); 0.001::p_fc("ABL1(S718)", "U73122", inc) :- p_occupancy("ABL1(S718)", "U73122", dec).
0.001::p_fc("ABL1(S718)", "U73122", dec); 0.7352087133::p_fc("ABL1(S718)", "U73122", inc) :- p_occupancy("ABL1(S718)", "U73122", inc).
0.9934417043::p_fc("ABL1(S718)", "Ulixertinib", dec); 0.001::p_fc("ABL1(S718)", "Ulixertinib", inc) :- p_occupancy("ABL1(S718)", "Ulixertinib", dec).
0.001::p_fc("ABL1(S718)", "Ulixertinib", dec); 0.9934417043::p_fc("ABL1(S718)", "Ulixertinib", inc) :- p_occupancy("ABL1(S718)", "Ulixertinib", inc).
0.0816328298::p_fc("ABL1(S718)", "Vemurafenib", dec); 0.001::p_fc("ABL1(S718)", "Vemurafenib", inc) :- p_occupancy("ABL1(S718)", "Vemurafenib", dec).
0.001::p_fc("ABL1(S718)", "Vemurafenib", dec); 0.0816328298::p_fc("ABL1(S718)", "Vemurafenib", inc) :- p_occupancy("ABL1(S718)", "Vemurafenib", inc).
0.4284219627::p_fc("ABL1(T735)", "AC220", dec); 0.001::p_fc("ABL1(T735)", "AC220", inc) :- p_occupancy("ABL1(T735)", "AC220", dec).
0.001::p_fc("ABL1(T735)", "AC220", dec); 0.4284219627::p_fc("ABL1(T735)", "AC220", inc) :- p_occupancy("ABL1(T735)", "AC220", inc).
0.9522429731::p_fc("ABL1(T735)", "AT13148", dec); 0.001::p_fc("ABL1(T735)", "AT13148", inc) :- p_occupancy("ABL1(T735)", "AT13148", dec).
0.001::p_fc("ABL1(T735)", "AT13148", dec); 0.9522429731::p_fc("ABL1(T735)", "AT13148", inc) :- p_occupancy("ABL1(T735)", "AT13148", inc).
0.3337390099::p_fc("ABL1(T735)", "AZ20", dec); 0.001::p_fc("ABL1(T735)", "AZ20", inc) :- p_occupancy("ABL1(T735)", "AZ20", dec).
0.001::p_fc("ABL1(T735)", "AZ20", dec); 0.3337390099::p_fc("ABL1(T735)", "AZ20", inc) :- p_occupancy("ABL1(T735)", "AZ20", inc).
0.9948726373::p_fc("ABL1(T735)", "AZD1480", dec); 0.001::p_fc("ABL1(T735)", "AZD1480", inc) :- p_occupancy("ABL1(T735)", "AZD1480", dec).
0.001::p_fc("ABL1(T735)", "AZD1480", dec); 0.9948726373::p_fc("ABL1(T735)", "AZD1480", inc) :- p_occupancy("ABL1(T735)", "AZD1480", inc).
0.2434721171::p_fc("ABL1(T735)", "AZD3759", dec); 0.001::p_fc("ABL1(T735)", "AZD3759", inc) :- p_occupancy("ABL1(T735)", "AZD3759", dec).
0.001::p_fc("ABL1(T735)", "AZD3759", dec); 0.2434721171::p_fc("ABL1(T735)", "AZD3759", inc) :- p_occupancy("ABL1(T735)", "AZD3759", inc).
0.998005988::p_fc("ABL1(T735)", "AZD5363", dec); 0.001::p_fc("ABL1(T735)", "AZD5363", inc) :- p_occupancy("ABL1(T735)", "AZD5363", dec).
0.001::p_fc("ABL1(T735)", "AZD5363", dec); 0.998005988::p_fc("ABL1(T735)", "AZD5363", inc) :- p_occupancy("ABL1(T735)", "AZD5363", inc).
0.9980059353::p_fc("ABL1(T735)", "AZD5438", dec); 0.001::p_fc("ABL1(T735)", "AZD5438", inc) :- p_occupancy("ABL1(T735)", "AZD5438", dec).
0.001::p_fc("ABL1(T735)", "AZD5438", dec); 0.9980059353::p_fc("ABL1(T735)", "AZD5438", inc) :- p_occupancy("ABL1(T735)", "AZD5438", inc).
0.4677202812::p_fc("ABL1(T735)", "AZD6482", dec); 0.001::p_fc("ABL1(T735)", "AZD6482", inc) :- p_occupancy("ABL1(T735)", "AZD6482", dec).
0.001::p_fc("ABL1(T735)", "AZD6482", dec); 0.4677202812::p_fc("ABL1(T735)", "AZD6482", inc) :- p_occupancy("ABL1(T735)", "AZD6482", inc).
0.0440784569::p_fc("ABL1(T735)", "AZD6738", dec); 0.001::p_fc("ABL1(T735)", "AZD6738", inc) :- p_occupancy("ABL1(T735)", "AZD6738", dec).
0.001::p_fc("ABL1(T735)", "AZD6738", dec); 0.0440784569::p_fc("ABL1(T735)", "AZD6738", inc) :- p_occupancy("ABL1(T735)", "AZD6738", inc).
0.5993816117::p_fc("ABL1(T735)", "AZD8055", dec); 0.001::p_fc("ABL1(T735)", "AZD8055", inc) :- p_occupancy("ABL1(T735)", "AZD8055", dec).
0.001::p_fc("ABL1(T735)", "AZD8055", dec); 0.5993816117::p_fc("ABL1(T735)", "AZD8055", inc) :- p_occupancy("ABL1(T735)", "AZD8055", inc).
0.8570131687::p_fc("ABL1(T735)", "Amuvatinib", dec); 0.001::p_fc("ABL1(T735)", "Amuvatinib", inc) :- p_occupancy("ABL1(T735)", "Amuvatinib", dec).
0.001::p_fc("ABL1(T735)", "Amuvatinib", dec); 0.8570131687::p_fc("ABL1(T735)", "Amuvatinib", inc) :- p_occupancy("ABL1(T735)", "Amuvatinib", inc).
0.998005988::p_fc("ABL1(T735)", "BX912", dec); 0.001::p_fc("ABL1(T735)", "BX912", inc) :- p_occupancy("ABL1(T735)", "BX912", dec).
0.001::p_fc("ABL1(T735)", "BX912", dec); 0.998005988::p_fc("ABL1(T735)", "BX912", inc) :- p_occupancy("ABL1(T735)", "BX912", inc).
0.1942129249::p_fc("ABL1(T735)", "Bosutinib", dec); 0.001::p_fc("ABL1(T735)", "Bosutinib", inc) :- p_occupancy("ABL1(T735)", "Bosutinib", dec).
0.001::p_fc("ABL1(T735)", "Bosutinib", dec); 0.1942129249::p_fc("ABL1(T735)", "Bosutinib", inc) :- p_occupancy("ABL1(T735)", "Bosutinib", inc).
0.9931434431::p_fc("ABL1(T735)", "CAL101", dec); 0.001::p_fc("ABL1(T735)", "CAL101", inc) :- p_occupancy("ABL1(T735)", "CAL101", dec).
0.001::p_fc("ABL1(T735)", "CAL101", dec); 0.9931434431::p_fc("ABL1(T735)", "CAL101", inc) :- p_occupancy("ABL1(T735)", "CAL101", inc).
0.9979666988::p_fc("ABL1(T735)", "CHIR99021", dec); 0.001::p_fc("ABL1(T735)", "CHIR99021", inc) :- p_occupancy("ABL1(T735)", "CHIR99021", dec).
0.001::p_fc("ABL1(T735)", "CHIR99021", dec); 0.9979666988::p_fc("ABL1(T735)", "CHIR99021", inc) :- p_occupancy("ABL1(T735)", "CHIR99021", inc).
0.9606548131::p_fc("ABL1(T735)", "CX4945", dec); 0.001::p_fc("ABL1(T735)", "CX4945", inc) :- p_occupancy("ABL1(T735)", "CX4945", dec).
0.001::p_fc("ABL1(T735)", "CX4945", dec); 0.9606548131::p_fc("ABL1(T735)", "CX4945", inc) :- p_occupancy("ABL1(T735)", "CX4945", inc).
0.3151673513::p_fc("ABL1(T735)", "DNAPK", dec); 0.001::p_fc("ABL1(T735)", "DNAPK", inc) :- p_occupancy("ABL1(T735)", "DNAPK", dec).
0.001::p_fc("ABL1(T735)", "DNAPK", dec); 0.3151673513::p_fc("ABL1(T735)", "DNAPK", inc) :- p_occupancy("ABL1(T735)", "DNAPK", inc).
0.1228086768::p_fc("ABL1(T735)", "Dabrafenib", dec); 0.001::p_fc("ABL1(T735)", "Dabrafenib", inc) :- p_occupancy("ABL1(T735)", "Dabrafenib", dec).
0.001::p_fc("ABL1(T735)", "Dabrafenib", dec); 0.1228086768::p_fc("ABL1(T735)", "Dabrafenib", inc) :- p_occupancy("ABL1(T735)", "Dabrafenib", inc).
0.8780898096::p_fc("ABL1(T735)", "Dasatinib", dec); 0.001::p_fc("ABL1(T735)", "Dasatinib", inc) :- p_occupancy("ABL1(T735)", "Dasatinib", dec).
0.001::p_fc("ABL1(T735)", "Dasatinib", dec); 0.8780898096::p_fc("ABL1(T735)", "Dasatinib", inc) :- p_occupancy("ABL1(T735)", "Dasatinib", inc).
0.3256352456::p_fc("ABL1(T735)", "Edelfosine", dec); 0.001::p_fc("ABL1(T735)", "Edelfosine", inc) :- p_occupancy("ABL1(T735)", "Edelfosine", dec).
0.001::p_fc("ABL1(T735)", "Edelfosine", dec); 0.3256352456::p_fc("ABL1(T735)", "Edelfosine", inc) :- p_occupancy("ABL1(T735)", "Edelfosine", inc).
0.860014021::p_fc("ABL1(T735)", "FRAX486", dec); 0.001::p_fc("ABL1(T735)", "FRAX486", inc) :- p_occupancy("ABL1(T735)", "FRAX486", dec).
0.001::p_fc("ABL1(T735)", "FRAX486", dec); 0.860014021::p_fc("ABL1(T735)", "FRAX486", inc) :- p_occupancy("ABL1(T735)", "FRAX486", inc).
0.7929779946::p_fc("ABL1(T735)", "GDC0941", dec); 0.001::p_fc("ABL1(T735)", "GDC0941", inc) :- p_occupancy("ABL1(T735)", "GDC0941", dec).
0.001::p_fc("ABL1(T735)", "GDC0941", dec); 0.7929779946::p_fc("ABL1(T735)", "GDC0941", inc) :- p_occupancy("ABL1(T735)", "GDC0941", inc).
0.1221473641::p_fc("ABL1(T735)", "GDC0994", dec); 0.001::p_fc("ABL1(T735)", "GDC0994", inc) :- p_occupancy("ABL1(T735)", "GDC0994", dec).
0.001::p_fc("ABL1(T735)", "GDC0994", dec); 0.1221473641::p_fc("ABL1(T735)", "GDC0994", inc) :- p_occupancy("ABL1(T735)", "GDC0994", inc).
0.1324288038::p_fc("ABL1(T735)", "GF109203X", dec); 0.001::p_fc("ABL1(T735)", "GF109203X", inc) :- p_occupancy("ABL1(T735)", "GF109203X", dec).
0.001::p_fc("ABL1(T735)", "GF109203X", dec); 0.1324288038::p_fc("ABL1(T735)", "GF109203X", inc) :- p_occupancy("ABL1(T735)", "GF109203X", inc).
0.884705737::p_fc("ABL1(T735)", "GO6983", dec); 0.001::p_fc("ABL1(T735)", "GO6983", inc) :- p_occupancy("ABL1(T735)", "GO6983", dec).
0.001::p_fc("ABL1(T735)", "GO6983", dec); 0.884705737::p_fc("ABL1(T735)", "GO6983", inc) :- p_occupancy("ABL1(T735)", "GO6983", inc).
0.998005988::p_fc("ABL1(T735)", "GSK2334470", dec); 0.001::p_fc("ABL1(T735)", "GSK2334470", inc) :- p_occupancy("ABL1(T735)", "GSK2334470", dec).
0.001::p_fc("ABL1(T735)", "GSK2334470", dec); 0.998005988::p_fc("ABL1(T735)", "GSK2334470", inc) :- p_occupancy("ABL1(T735)", "GSK2334470", inc).
0.2247295354::p_fc("ABL1(T735)", "GSK690693", dec); 0.001::p_fc("ABL1(T735)", "GSK690693", inc) :- p_occupancy("ABL1(T735)", "GSK690693", dec).
0.001::p_fc("ABL1(T735)", "GSK690693", dec); 0.2247295354::p_fc("ABL1(T735)", "GSK690693", inc) :- p_occupancy("ABL1(T735)", "GSK690693", inc).
0.8013236265::p_fc("ABL1(T735)", "Go6976", dec); 0.001::p_fc("ABL1(T735)", "Go6976", inc) :- p_occupancy("ABL1(T735)", "Go6976", dec).
0.001::p_fc("ABL1(T735)", "Go6976", dec); 0.8013236265::p_fc("ABL1(T735)", "Go6976", inc) :- p_occupancy("ABL1(T735)", "Go6976", inc).
0.2494110024::p_fc("ABL1(T735)", "H89", dec); 0.001::p_fc("ABL1(T735)", "H89", inc) :- p_occupancy("ABL1(T735)", "H89", dec).
0.001::p_fc("ABL1(T735)", "H89", dec); 0.2494110024::p_fc("ABL1(T735)", "H89", inc) :- p_occupancy("ABL1(T735)", "H89", inc).
0.2950074851::p_fc("ABL1(T735)", "HS173", dec); 0.001::p_fc("ABL1(T735)", "HS173", inc) :- p_occupancy("ABL1(T735)", "HS173", dec).
0.001::p_fc("ABL1(T735)", "HS173", dec); 0.2950074851::p_fc("ABL1(T735)", "HS173", inc) :- p_occupancy("ABL1(T735)", "HS173", inc).
0.9980043063::p_fc("ABL1(T735)", "Ipatasertib", dec); 0.001::p_fc("ABL1(T735)", "Ipatasertib", inc) :- p_occupancy("ABL1(T735)", "Ipatasertib", dec).
0.001::p_fc("ABL1(T735)", "Ipatasertib", dec); 0.9980043063::p_fc("ABL1(T735)", "Ipatasertib", inc) :- p_occupancy("ABL1(T735)", "Ipatasertib", inc).
0.567049392::p_fc("ABL1(T735)", "JNJ", dec); 0.001::p_fc("ABL1(T735)", "JNJ", inc) :- p_occupancy("ABL1(T735)", "JNJ", dec).
0.001::p_fc("ABL1(T735)", "JNJ", dec); 0.567049392::p_fc("ABL1(T735)", "JNJ", inc) :- p_occupancy("ABL1(T735)", "JNJ", inc).
0.3737580745::p_fc("ABL1(T735)", "JNK", dec); 0.001::p_fc("ABL1(T735)", "JNK", inc) :- p_occupancy("ABL1(T735)", "JNK", dec).
0.001::p_fc("ABL1(T735)", "JNK", dec); 0.3737580745::p_fc("ABL1(T735)", "JNK", inc) :- p_occupancy("ABL1(T735)", "JNK", inc).
0.3750949939::p_fc("ABL1(T735)", "KD025", dec); 0.001::p_fc("ABL1(T735)", "KD025", inc) :- p_occupancy("ABL1(T735)", "KD025", dec).
0.001::p_fc("ABL1(T735)", "KD025", dec); 0.3750949939::p_fc("ABL1(T735)", "KD025", inc) :- p_occupancy("ABL1(T735)", "KD025", inc).
0.741593101::p_fc("ABL1(T735)", "KN62", dec); 0.001::p_fc("ABL1(T735)", "KN62", inc) :- p_occupancy("ABL1(T735)", "KN62", dec).
0.001::p_fc("ABL1(T735)", "KN62", dec); 0.741593101::p_fc("ABL1(T735)", "KN62", inc) :- p_occupancy("ABL1(T735)", "KN62", inc).
0.9960261515::p_fc("ABL1(T735)", "KN93", dec); 0.001::p_fc("ABL1(T735)", "KN93", inc) :- p_occupancy("ABL1(T735)", "KN93", dec).
0.001::p_fc("ABL1(T735)", "KN93", dec); 0.9960261515::p_fc("ABL1(T735)", "KN93", inc) :- p_occupancy("ABL1(T735)", "KN93", inc).
0.9965682695::p_fc("ABL1(T735)", "Ku0063794", dec); 0.001::p_fc("ABL1(T735)", "Ku0063794", inc) :- p_occupancy("ABL1(T735)", "Ku0063794", dec).
0.001::p_fc("ABL1(T735)", "Ku0063794", dec); 0.9965682695::p_fc("ABL1(T735)", "Ku0063794", inc) :- p_occupancy("ABL1(T735)", "Ku0063794", inc).
0.9714227288::p_fc("ABL1(T735)", "LY2090314", dec); 0.001::p_fc("ABL1(T735)", "LY2090314", inc) :- p_occupancy("ABL1(T735)", "LY2090314", dec).
0.001::p_fc("ABL1(T735)", "LY2090314", dec); 0.9714227288::p_fc("ABL1(T735)", "LY2090314", inc) :- p_occupancy("ABL1(T735)", "LY2090314", inc).
0.4631041972::p_fc("ABL1(T735)", "LY2584702", dec); 0.001::p_fc("ABL1(T735)", "LY2584702", inc) :- p_occupancy("ABL1(T735)", "LY2584702", dec).
0.001::p_fc("ABL1(T735)", "LY2584702", dec); 0.4631041972::p_fc("ABL1(T735)", "LY2584702", inc) :- p_occupancy("ABL1(T735)", "LY2584702", inc).
0.240382513::p_fc("ABL1(T735)", "LY2835219", dec); 0.001::p_fc("ABL1(T735)", "LY2835219", inc) :- p_occupancy("ABL1(T735)", "LY2835219", dec).
0.001::p_fc("ABL1(T735)", "LY2835219", dec); 0.240382513::p_fc("ABL1(T735)", "LY2835219", inc) :- p_occupancy("ABL1(T735)", "LY2835219", inc).
0.2392386155::p_fc("ABL1(T735)", "Linsitinib", dec); 0.001::p_fc("ABL1(T735)", "Linsitinib", inc) :- p_occupancy("ABL1(T735)", "Linsitinib", dec).
0.001::p_fc("ABL1(T735)", "Linsitinib", dec); 0.2392386155::p_fc("ABL1(T735)", "Linsitinib", inc) :- p_occupancy("ABL1(T735)", "Linsitinib", inc).
0.7491456274::p_fc("ABL1(T735)", "MK2206", dec); 0.001::p_fc("ABL1(T735)", "MK2206", inc) :- p_occupancy("ABL1(T735)", "MK2206", dec).
0.001::p_fc("ABL1(T735)", "MK2206", dec); 0.7491456274::p_fc("ABL1(T735)", "MK2206", inc) :- p_occupancy("ABL1(T735)", "MK2206", inc).
0.7767338504::p_fc("ABL1(T735)", "NU7441", dec); 0.001::p_fc("ABL1(T735)", "NU7441", inc) :- p_occupancy("ABL1(T735)", "NU7441", dec).
0.001::p_fc("ABL1(T735)", "NU7441", dec); 0.7767338504::p_fc("ABL1(T735)", "NU7441", inc) :- p_occupancy("ABL1(T735)", "NU7441", inc).
0.3091425627::p_fc("ABL1(T735)", "PD153035", dec); 0.001::p_fc("ABL1(T735)", "PD153035", inc) :- p_occupancy("ABL1(T735)", "PD153035", dec).
0.001::p_fc("ABL1(T735)", "PD153035", dec); 0.3091425627::p_fc("ABL1(T735)", "PD153035", inc) :- p_occupancy("ABL1(T735)", "PD153035", inc).
0.126592392::p_fc("ABL1(T735)", "PF3758309", dec); 0.001::p_fc("ABL1(T735)", "PF3758309", inc) :- p_occupancy("ABL1(T735)", "PF3758309", dec).
0.001::p_fc("ABL1(T735)", "PF3758309", dec); 0.126592392::p_fc("ABL1(T735)", "PF3758309", inc) :- p_occupancy("ABL1(T735)", "PF3758309", inc).
0.281166533::p_fc("ABL1(T735)", "PF4708671", dec); 0.001::p_fc("ABL1(T735)", "PF4708671", inc) :- p_occupancy("ABL1(T735)", "PF4708671", dec).
0.001::p_fc("ABL1(T735)", "PF4708671", dec); 0.281166533::p_fc("ABL1(T735)", "PF4708671", inc) :- p_occupancy("ABL1(T735)", "PF4708671", inc).
0.8821067313::p_fc("ABL1(T735)", "PH797804", dec); 0.001::p_fc("ABL1(T735)", "PH797804", inc) :- p_occupancy("ABL1(T735)", "PH797804", dec).
0.001::p_fc("ABL1(T735)", "PH797804", dec); 0.8821067313::p_fc("ABL1(T735)", "PH797804", inc) :- p_occupancy("ABL1(T735)", "PH797804", inc).
0.9975482573::p_fc("ABL1(T735)", "PIK294", dec); 0.001::p_fc("ABL1(T735)", "PIK294", inc) :- p_occupancy("ABL1(T735)", "PIK294", dec).
0.001::p_fc("ABL1(T735)", "PIK294", dec); 0.9975482573::p_fc("ABL1(T735)", "PIK294", inc) :- p_occupancy("ABL1(T735)", "PIK294", inc).
0.4538633205::p_fc("ABL1(T735)", "Ribociclib", dec); 0.001::p_fc("ABL1(T735)", "Ribociclib", inc) :- p_occupancy("ABL1(T735)", "Ribociclib", dec).
0.001::p_fc("ABL1(T735)", "Ribociclib", dec); 0.4538633205::p_fc("ABL1(T735)", "Ribociclib", inc) :- p_occupancy("ABL1(T735)", "Ribociclib", inc).
0.0493646567::p_fc("ABL1(T735)", "Ripasudil", dec); 0.001::p_fc("ABL1(T735)", "Ripasudil", inc) :- p_occupancy("ABL1(T735)", "Ripasudil", dec).
0.001::p_fc("ABL1(T735)", "Ripasudil", dec); 0.0493646567::p_fc("ABL1(T735)", "Ripasudil", inc) :- p_occupancy("ABL1(T735)", "Ripasudil", inc).
0.1394437361::p_fc("ABL1(T735)", "SP600125", dec); 0.001::p_fc("ABL1(T735)", "SP600125", inc) :- p_occupancy("ABL1(T735)", "SP600125", dec).
0.001::p_fc("ABL1(T735)", "SP600125", dec); 0.1394437361::p_fc("ABL1(T735)", "SP600125", inc) :- p_occupancy("ABL1(T735)", "SP600125", inc).
0.7782818459::p_fc("ABL1(T735)", "Selumetinib", dec); 0.001::p_fc("ABL1(T735)", "Selumetinib", inc) :- p_occupancy("ABL1(T735)", "Selumetinib", dec).
0.001::p_fc("ABL1(T735)", "Selumetinib", dec); 0.7782818459::p_fc("ABL1(T735)", "Selumetinib", inc) :- p_occupancy("ABL1(T735)", "Selumetinib", inc).
0.2144182689::p_fc("ABL1(T735)", "TAK715", dec); 0.001::p_fc("ABL1(T735)", "TAK715", inc) :- p_occupancy("ABL1(T735)", "TAK715", dec).
0.001::p_fc("ABL1(T735)", "TAK715", dec); 0.2144182689::p_fc("ABL1(T735)", "TAK715", inc) :- p_occupancy("ABL1(T735)", "TAK715", inc).
0.4573774493::p_fc("ABL1(T735)", "TBCA", dec); 0.001::p_fc("ABL1(T735)", "TBCA", inc) :- p_occupancy("ABL1(T735)", "TBCA", dec).
0.001::p_fc("ABL1(T735)", "TBCA", dec); 0.4573774493::p_fc("ABL1(T735)", "TBCA", inc) :- p_occupancy("ABL1(T735)", "TBCA", inc).
0.1398373632::p_fc("ABL1(T735)", "TGX221", dec); 0.001::p_fc("ABL1(T735)", "TGX221", inc) :- p_occupancy("ABL1(T735)", "TGX221", dec).
0.001::p_fc("ABL1(T735)", "TGX221", dec); 0.1398373632::p_fc("ABL1(T735)", "TGX221", inc) :- p_occupancy("ABL1(T735)", "TGX221", inc).
0.9979617173::p_fc("ABL1(T735)", "Tofacitinib", dec); 0.001::p_fc("ABL1(T735)", "Tofacitinib", inc) :- p_occupancy("ABL1(T735)", "Tofacitinib", dec).
0.001::p_fc("ABL1(T735)", "Tofacitinib", dec); 0.9979617173::p_fc("ABL1(T735)", "Tofacitinib", inc) :- p_occupancy("ABL1(T735)", "Tofacitinib", inc).
0.8294491082::p_fc("ABL1(T735)", "Torin", dec); 0.001::p_fc("ABL1(T735)", "Torin", inc) :- p_occupancy("ABL1(T735)", "Torin", dec).
0.001::p_fc("ABL1(T735)", "Torin", dec); 0.8294491082::p_fc("ABL1(T735)", "Torin", inc) :- p_occupancy("ABL1(T735)", "Torin", inc).
0.891272185::p_fc("ABL1(T735)", "Trametinib", dec); 0.001::p_fc("ABL1(T735)", "Trametinib", inc) :- p_occupancy("ABL1(T735)", "Trametinib", dec).
0.001::p_fc("ABL1(T735)", "Trametinib", dec); 0.891272185::p_fc("ABL1(T735)", "Trametinib", inc) :- p_occupancy("ABL1(T735)", "Trametinib", inc).
0.4747563647::p_fc("ABL1(T735)", "U73122", dec); 0.001::p_fc("ABL1(T735)", "U73122", inc) :- p_occupancy("ABL1(T735)", "U73122", dec).
0.001::p_fc("ABL1(T735)", "U73122", dec); 0.4747563647::p_fc("ABL1(T735)", "U73122", inc) :- p_occupancy("ABL1(T735)", "U73122", inc).
0.2983572973::p_fc("ABL1(T735)", "Ulixertinib", dec); 0.001::p_fc("ABL1(T735)", "Ulixertinib", inc) :- p_occupancy("ABL1(T735)", "Ulixertinib", dec).
0.001::p_fc("ABL1(T735)", "Ulixertinib", dec); 0.2983572973::p_fc("ABL1(T735)", "Ulixertinib", inc) :- p_occupancy("ABL1(T735)", "Ulixertinib", inc).
0.3383102882::p_fc("ABL1(T735)", "Vemurafenib", dec); 0.001::p_fc("ABL1(T735)", "Vemurafenib", inc) :- p_occupancy("ABL1(T735)", "Vemurafenib", dec).
0.001::p_fc("ABL1(T735)", "Vemurafenib", dec); 0.3383102882::p_fc("ABL1(T735)", "Vemurafenib", inc) :- p_occupancy("ABL1(T735)", "Vemurafenib", inc).
0.6688699515::p_fc("ANXA2P2(Y24)", "AC220", dec); 0.001::p_fc("ANXA2P2(Y24)", "AC220", inc) :- p_occupancy("ANXA2P2(Y24)", "AC220", dec).
0.001::p_fc("ANXA2P2(Y24)", "AC220", dec); 0.6688699515::p_fc("ANXA2P2(Y24)", "AC220", inc) :- p_occupancy("ANXA2P2(Y24)", "AC220", inc).
0.0465387135::p_fc("ANXA2P2(Y24)", "AT13148", dec); 0.001::p_fc("ANXA2P2(Y24)", "AT13148", inc) :- p_occupancy("ANXA2P2(Y24)", "AT13148", dec).
0.001::p_fc("ANXA2P2(Y24)", "AT13148", dec); 0.0465387135::p_fc("ANXA2P2(Y24)", "AT13148", inc) :- p_occupancy("ANXA2P2(Y24)", "AT13148", inc).
0.101174582::p_fc("ANXA2P2(Y24)", "AZ20", dec); 0.001::p_fc("ANXA2P2(Y24)", "AZ20", inc) :- p_occupancy("ANXA2P2(Y24)", "AZ20", dec).
0.001::p_fc("ANXA2P2(Y24)", "AZ20", dec); 0.101174582::p_fc("ANXA2P2(Y24)", "AZ20", inc) :- p_occupancy("ANXA2P2(Y24)", "AZ20", inc).
0.7280359728::p_fc("ANXA2P2(Y24)", "AZD1480", dec); 0.001::p_fc("ANXA2P2(Y24)", "AZD1480", inc) :- p_occupancy("ANXA2P2(Y24)", "AZD1480", dec).
0.001::p_fc("ANXA2P2(Y24)", "AZD1480", dec); 0.7280359728::p_fc("ANXA2P2(Y24)", "AZD1480", inc) :- p_occupancy("ANXA2P2(Y24)", "AZD1480", inc).
0.2983355399::p_fc("ANXA2P2(Y24)", "AZD3759", dec); 0.001::p_fc("ANXA2P2(Y24)", "AZD3759", inc) :- p_occupancy("ANXA2P2(Y24)", "AZD3759", dec).
0.001::p_fc("ANXA2P2(Y24)", "AZD3759", dec); 0.2983355399::p_fc("ANXA2P2(Y24)", "AZD3759", inc) :- p_occupancy("ANXA2P2(Y24)", "AZD3759", inc).
0.8855154996::p_fc("ANXA2P2(Y24)", "AZD5363", dec); 0.001::p_fc("ANXA2P2(Y24)", "AZD5363", inc) :- p_occupancy("ANXA2P2(Y24)", "AZD5363", dec).
0.001::p_fc("ANXA2P2(Y24)", "AZD5363", dec); 0.8855154996::p_fc("ANXA2P2(Y24)", "AZD5363", inc) :- p_occupancy("ANXA2P2(Y24)", "AZD5363", inc).
0.7274477668::p_fc("ANXA2P2(Y24)", "AZD5438", dec); 0.001::p_fc("ANXA2P2(Y24)", "AZD5438", inc) :- p_occupancy("ANXA2P2(Y24)", "AZD5438", dec).
0.001::p_fc("ANXA2P2(Y24)", "AZD5438", dec); 0.7274477668::p_fc("ANXA2P2(Y24)", "AZD5438", inc) :- p_occupancy("ANXA2P2(Y24)", "AZD5438", inc).
0.6924561866::p_fc("ANXA2P2(Y24)", "AZD6482", dec); 0.001::p_fc("ANXA2P2(Y24)", "AZD6482", inc) :- p_occupancy("ANXA2P2(Y24)", "AZD6482", dec).
0.001::p_fc("ANXA2P2(Y24)", "AZD6482", dec); 0.6924561866::p_fc("ANXA2P2(Y24)", "AZD6482", inc) :- p_occupancy("ANXA2P2(Y24)", "AZD6482", inc).
0.3047199313::p_fc("ANXA2P2(Y24)", "AZD6738", dec); 0.001::p_fc("ANXA2P2(Y24)", "AZD6738", inc) :- p_occupancy("ANXA2P2(Y24)", "AZD6738", dec).
0.001::p_fc("ANXA2P2(Y24)", "AZD6738", dec); 0.3047199313::p_fc("ANXA2P2(Y24)", "AZD6738", inc) :- p_occupancy("ANXA2P2(Y24)", "AZD6738", inc).
0.9453878916::p_fc("ANXA2P2(Y24)", "AZD8055", dec); 0.001::p_fc("ANXA2P2(Y24)", "AZD8055", inc) :- p_occupancy("ANXA2P2(Y24)", "AZD8055", dec).
0.001::p_fc("ANXA2P2(Y24)", "AZD8055", dec); 0.9453878916::p_fc("ANXA2P2(Y24)", "AZD8055", inc) :- p_occupancy("ANXA2P2(Y24)", "AZD8055", inc).
0.2452992754::p_fc("ANXA2P2(Y24)", "Amuvatinib", dec); 0.001::p_fc("ANXA2P2(Y24)", "Amuvatinib", inc) :- p_occupancy("ANXA2P2(Y24)", "Amuvatinib", dec).
0.001::p_fc("ANXA2P2(Y24)", "Amuvatinib", dec); 0.2452992754::p_fc("ANXA2P2(Y24)", "Amuvatinib", inc) :- p_occupancy("ANXA2P2(Y24)", "Amuvatinib", inc).
0.8128625795::p_fc("ANXA2P2(Y24)", "BX912", dec); 0.001::p_fc("ANXA2P2(Y24)", "BX912", inc) :- p_occupancy("ANXA2P2(Y24)", "BX912", dec).
0.001::p_fc("ANXA2P2(Y24)", "BX912", dec); 0.8128625795::p_fc("ANXA2P2(Y24)", "BX912", inc) :- p_occupancy("ANXA2P2(Y24)", "BX912", inc).
0.4114012788::p_fc("ANXA2P2(Y24)", "Bosutinib", dec); 0.001::p_fc("ANXA2P2(Y24)", "Bosutinib", inc) :- p_occupancy("ANXA2P2(Y24)", "Bosutinib", dec).
0.001::p_fc("ANXA2P2(Y24)", "Bosutinib", dec); 0.4114012788::p_fc("ANXA2P2(Y24)", "Bosutinib", inc) :- p_occupancy("ANXA2P2(Y24)", "Bosutinib", inc).
0.9793279034::p_fc("ANXA2P2(Y24)", "CAL101", dec); 0.001::p_fc("ANXA2P2(Y24)", "CAL101", inc) :- p_occupancy("ANXA2P2(Y24)", "CAL101", dec).
0.001::p_fc("ANXA2P2(Y24)", "CAL101", dec); 0.9793279034::p_fc("ANXA2P2(Y24)", "CAL101", inc) :- p_occupancy("ANXA2P2(Y24)", "CAL101", inc).
0.823050963::p_fc("ANXA2P2(Y24)", "CHIR99021", dec); 0.001::p_fc("ANXA2P2(Y24)", "CHIR99021", inc) :- p_occupancy("ANXA2P2(Y24)", "CHIR99021", dec).
0.001::p_fc("ANXA2P2(Y24)", "CHIR99021", dec); 0.823050963::p_fc("ANXA2P2(Y24)", "CHIR99021", inc) :- p_occupancy("ANXA2P2(Y24)", "CHIR99021", inc).
0.1230154475::p_fc("ANXA2P2(Y24)", "CX4945", dec); 0.001::p_fc("ANXA2P2(Y24)", "CX4945", inc) :- p_occupancy("ANXA2P2(Y24)", "CX4945", dec).
0.001::p_fc("ANXA2P2(Y24)", "CX4945", dec); 0.1230154475::p_fc("ANXA2P2(Y24)", "CX4945", inc) :- p_occupancy("ANXA2P2(Y24)", "CX4945", inc).
0.7232341888::p_fc("ANXA2P2(Y24)", "DNAPK", dec); 0.001::p_fc("ANXA2P2(Y24)", "DNAPK", inc) :- p_occupancy("ANXA2P2(Y24)", "DNAPK", dec).
0.001::p_fc("ANXA2P2(Y24)", "DNAPK", dec); 0.7232341888::p_fc("ANXA2P2(Y24)", "DNAPK", inc) :- p_occupancy("ANXA2P2(Y24)", "DNAPK", inc).
0.6562850094::p_fc("ANXA2P2(Y24)", "Dabrafenib", dec); 0.001::p_fc("ANXA2P2(Y24)", "Dabrafenib", inc) :- p_occupancy("ANXA2P2(Y24)", "Dabrafenib", dec).
0.001::p_fc("ANXA2P2(Y24)", "Dabrafenib", dec); 0.6562850094::p_fc("ANXA2P2(Y24)", "Dabrafenib", inc) :- p_occupancy("ANXA2P2(Y24)", "Dabrafenib", inc).
0.5430047225::p_fc("ANXA2P2(Y24)", "Dasatinib", dec); 0.001::p_fc("ANXA2P2(Y24)", "Dasatinib", inc) :- p_occupancy("ANXA2P2(Y24)", "Dasatinib", dec).
0.001::p_fc("ANXA2P2(Y24)", "Dasatinib", dec); 0.5430047225::p_fc("ANXA2P2(Y24)", "Dasatinib", inc) :- p_occupancy("ANXA2P2(Y24)", "Dasatinib", inc).
0.590012352::p_fc("ANXA2P2(Y24)", "Edelfosine", dec); 0.001::p_fc("ANXA2P2(Y24)", "Edelfosine", inc) :- p_occupancy("ANXA2P2(Y24)", "Edelfosine", dec).
0.001::p_fc("ANXA2P2(Y24)", "Edelfosine", dec); 0.590012352::p_fc("ANXA2P2(Y24)", "Edelfosine", inc) :- p_occupancy("ANXA2P2(Y24)", "Edelfosine", inc).
0.8075522417::p_fc("ANXA2P2(Y24)", "FRAX486", dec); 0.001::p_fc("ANXA2P2(Y24)", "FRAX486", inc) :- p_occupancy("ANXA2P2(Y24)", "FRAX486", dec).
0.001::p_fc("ANXA2P2(Y24)", "FRAX486", dec); 0.8075522417::p_fc("ANXA2P2(Y24)", "FRAX486", inc) :- p_occupancy("ANXA2P2(Y24)", "FRAX486", inc).
0.9975608045::p_fc("ANXA2P2(Y24)", "GDC0941", dec); 0.001::p_fc("ANXA2P2(Y24)", "GDC0941", inc) :- p_occupancy("ANXA2P2(Y24)", "GDC0941", dec).
0.001::p_fc("ANXA2P2(Y24)", "GDC0941", dec); 0.9975608045::p_fc("ANXA2P2(Y24)", "GDC0941", inc) :- p_occupancy("ANXA2P2(Y24)", "GDC0941", inc).
0.0216112487::p_fc("ANXA2P2(Y24)", "GDC0994", dec); 0.001::p_fc("ANXA2P2(Y24)", "GDC0994", inc) :- p_occupancy("ANXA2P2(Y24)", "GDC0994", dec).
0.001::p_fc("ANXA2P2(Y24)", "GDC0994", dec); 0.0216112487::p_fc("ANXA2P2(Y24)", "GDC0994", inc) :- p_occupancy("ANXA2P2(Y24)", "GDC0994", inc).
0.5282515026::p_fc("ANXA2P2(Y24)", "GF109203X", dec); 0.001::p_fc("ANXA2P2(Y24)", "GF109203X", inc) :- p_occupancy("ANXA2P2(Y24)", "GF109203X", dec).
0.001::p_fc("ANXA2P2(Y24)", "GF109203X", dec); 0.5282515026::p_fc("ANXA2P2(Y24)", "GF109203X", inc) :- p_occupancy("ANXA2P2(Y24)", "GF109203X", inc).
0.9340903058::p_fc("ANXA2P2(Y24)", "GO6983", dec); 0.001::p_fc("ANXA2P2(Y24)", "GO6983", inc) :- p_occupancy("ANXA2P2(Y24)", "GO6983", dec).
0.001::p_fc("ANXA2P2(Y24)", "GO6983", dec); 0.9340903058::p_fc("ANXA2P2(Y24)", "GO6983", inc) :- p_occupancy("ANXA2P2(Y24)", "GO6983", inc).
0.9829805538::p_fc("ANXA2P2(Y24)", "GSK2334470", dec); 0.001::p_fc("ANXA2P2(Y24)", "GSK2334470", inc) :- p_occupancy("ANXA2P2(Y24)", "GSK2334470", dec).
0.001::p_fc("ANXA2P2(Y24)", "GSK2334470", dec); 0.9829805538::p_fc("ANXA2P2(Y24)", "GSK2334470", inc) :- p_occupancy("ANXA2P2(Y24)", "GSK2334470", inc).
0.4169288881::p_fc("ANXA2P2(Y24)", "GSK690693", dec); 0.001::p_fc("ANXA2P2(Y24)", "GSK690693", inc) :- p_occupancy("ANXA2P2(Y24)", "GSK690693", dec).
0.001::p_fc("ANXA2P2(Y24)", "GSK690693", dec); 0.4169288881::p_fc("ANXA2P2(Y24)", "GSK690693", inc) :- p_occupancy("ANXA2P2(Y24)", "GSK690693", inc).
0.448552754::p_fc("ANXA2P2(Y24)", "Go6976", dec); 0.001::p_fc("ANXA2P2(Y24)", "Go6976", inc) :- p_occupancy("ANXA2P2(Y24)", "Go6976", dec).
0.001::p_fc("ANXA2P2(Y24)", "Go6976", dec); 0.448552754::p_fc("ANXA2P2(Y24)", "Go6976", inc) :- p_occupancy("ANXA2P2(Y24)", "Go6976", inc).
0.0690371921::p_fc("ANXA2P2(Y24)", "H89", dec); 0.001::p_fc("ANXA2P2(Y24)", "H89", inc) :- p_occupancy("ANXA2P2(Y24)", "H89", dec).
0.001::p_fc("ANXA2P2(Y24)", "H89", dec); 0.0690371921::p_fc("ANXA2P2(Y24)", "H89", inc) :- p_occupancy("ANXA2P2(Y24)", "H89", inc).
0.9540703891::p_fc("ANXA2P2(Y24)", "HS173", dec); 0.001::p_fc("ANXA2P2(Y24)", "HS173", inc) :- p_occupancy("ANXA2P2(Y24)", "HS173", dec).
0.001::p_fc("ANXA2P2(Y24)", "HS173", dec); 0.9540703891::p_fc("ANXA2P2(Y24)", "HS173", inc) :- p_occupancy("ANXA2P2(Y24)", "HS173", inc).
0.9508496961::p_fc("ANXA2P2(Y24)", "Ipatasertib", dec); 0.001::p_fc("ANXA2P2(Y24)", "Ipatasertib", inc) :- p_occupancy("ANXA2P2(Y24)", "Ipatasertib", dec).
0.001::p_fc("ANXA2P2(Y24)", "Ipatasertib", dec); 0.9508496961::p_fc("ANXA2P2(Y24)", "Ipatasertib", inc) :- p_occupancy("ANXA2P2(Y24)", "Ipatasertib", inc).
0.7019851815::p_fc("ANXA2P2(Y24)", "JNJ", dec); 0.001::p_fc("ANXA2P2(Y24)", "JNJ", inc) :- p_occupancy("ANXA2P2(Y24)", "JNJ", dec).
0.001::p_fc("ANXA2P2(Y24)", "JNJ", dec); 0.7019851815::p_fc("ANXA2P2(Y24)", "JNJ", inc) :- p_occupancy("ANXA2P2(Y24)", "JNJ", inc).
0.618387503::p_fc("ANXA2P2(Y24)", "JNK", dec); 0.001::p_fc("ANXA2P2(Y24)", "JNK", inc) :- p_occupancy("ANXA2P2(Y24)", "JNK", dec).
0.001::p_fc("ANXA2P2(Y24)", "JNK", dec); 0.618387503::p_fc("ANXA2P2(Y24)", "JNK", inc) :- p_occupancy("ANXA2P2(Y24)", "JNK", inc).
0.8682065524::p_fc("ANXA2P2(Y24)", "KD025", dec); 0.001::p_fc("ANXA2P2(Y24)", "KD025", inc) :- p_occupancy("ANXA2P2(Y24)", "KD025", dec).
0.001::p_fc("ANXA2P2(Y24)", "KD025", dec); 0.8682065524::p_fc("ANXA2P2(Y24)", "KD025", inc) :- p_occupancy("ANXA2P2(Y24)", "KD025", inc).
0.5331401625::p_fc("ANXA2P2(Y24)", "KN62", dec); 0.001::p_fc("ANXA2P2(Y24)", "KN62", inc) :- p_occupancy("ANXA2P2(Y24)", "KN62", dec).
0.001::p_fc("ANXA2P2(Y24)", "KN62", dec); 0.5331401625::p_fc("ANXA2P2(Y24)", "KN62", inc) :- p_occupancy("ANXA2P2(Y24)", "KN62", inc).
0.7877056662::p_fc("ANXA2P2(Y24)", "KN93", dec); 0.001::p_fc("ANXA2P2(Y24)", "KN93", inc) :- p_occupancy("ANXA2P2(Y24)", "KN93", dec).
0.001::p_fc("ANXA2P2(Y24)", "KN93", dec); 0.7877056662::p_fc("ANXA2P2(Y24)", "KN93", inc) :- p_occupancy("ANXA2P2(Y24)", "KN93", inc).
0.2905679033::p_fc("ANXA2P2(Y24)", "Ku0063794", dec); 0.001::p_fc("ANXA2P2(Y24)", "Ku0063794", inc) :- p_occupancy("ANXA2P2(Y24)", "Ku0063794", dec).
0.001::p_fc("ANXA2P2(Y24)", "Ku0063794", dec); 0.2905679033::p_fc("ANXA2P2(Y24)", "Ku0063794", inc) :- p_occupancy("ANXA2P2(Y24)", "Ku0063794", inc).
0.9681511642::p_fc("ANXA2P2(Y24)", "LY2090314", dec); 0.001::p_fc("ANXA2P2(Y24)", "LY2090314", inc) :- p_occupancy("ANXA2P2(Y24)", "LY2090314", dec).
0.001::p_fc("ANXA2P2(Y24)", "LY2090314", dec); 0.9681511642::p_fc("ANXA2P2(Y24)", "LY2090314", inc) :- p_occupancy("ANXA2P2(Y24)", "LY2090314", inc).
0.2419372866::p_fc("ANXA2P2(Y24)", "LY2584702", dec); 0.001::p_fc("ANXA2P2(Y24)", "LY2584702", inc) :- p_occupancy("ANXA2P2(Y24)", "LY2584702", dec).
0.001::p_fc("ANXA2P2(Y24)", "LY2584702", dec); 0.2419372866::p_fc("ANXA2P2(Y24)", "LY2584702", inc) :- p_occupancy("ANXA2P2(Y24)", "LY2584702", inc).
0.0678467621::p_fc("ANXA2P2(Y24)", "LY2835219", dec); 0.001::p_fc("ANXA2P2(Y24)", "LY2835219", inc) :- p_occupancy("ANXA2P2(Y24)", "LY2835219", dec).
0.001::p_fc("ANXA2P2(Y24)", "LY2835219", dec); 0.0678467621::p_fc("ANXA2P2(Y24)", "LY2835219", inc) :- p_occupancy("ANXA2P2(Y24)", "LY2835219", inc).
0.5760972033::p_fc("ANXA2P2(Y24)", "Linsitinib", dec); 0.001::p_fc("ANXA2P2(Y24)", "Linsitinib", inc) :- p_occupancy("ANXA2P2(Y24)", "Linsitinib", dec).
0.001::p_fc("ANXA2P2(Y24)", "Linsitinib", dec); 0.5760972033::p_fc("ANXA2P2(Y24)", "Linsitinib", inc) :- p_occupancy("ANXA2P2(Y24)", "Linsitinib", inc).
0.3979895936::p_fc("ANXA2P2(Y24)", "MK2206", dec); 0.001::p_fc("ANXA2P2(Y24)", "MK2206", inc) :- p_occupancy("ANXA2P2(Y24)", "MK2206", dec).
0.001::p_fc("ANXA2P2(Y24)", "MK2206", dec); 0.3979895936::p_fc("ANXA2P2(Y24)", "MK2206", inc) :- p_occupancy("ANXA2P2(Y24)", "MK2206", inc).
0.1264821089::p_fc("ANXA2P2(Y24)", "NU7441", dec); 0.001::p_fc("ANXA2P2(Y24)", "NU7441", inc) :- p_occupancy("ANXA2P2(Y24)", "NU7441", dec).
0.001::p_fc("ANXA2P2(Y24)", "NU7441", dec); 0.1264821089::p_fc("ANXA2P2(Y24)", "NU7441", inc) :- p_occupancy("ANXA2P2(Y24)", "NU7441", inc).
0.4587599835::p_fc("ANXA2P2(Y24)", "PD153035", dec); 0.001::p_fc("ANXA2P2(Y24)", "PD153035", inc) :- p_occupancy("ANXA2P2(Y24)", "PD153035", dec).
0.001::p_fc("ANXA2P2(Y24)", "PD153035", dec); 0.4587599835::p_fc("ANXA2P2(Y24)", "PD153035", inc) :- p_occupancy("ANXA2P2(Y24)", "PD153035", inc).
0.3848471904::p_fc("ANXA2P2(Y24)", "PF3758309", dec); 0.001::p_fc("ANXA2P2(Y24)", "PF3758309", inc) :- p_occupancy("ANXA2P2(Y24)", "PF3758309", dec).
0.001::p_fc("ANXA2P2(Y24)", "PF3758309", dec); 0.3848471904::p_fc("ANXA2P2(Y24)", "PF3758309", inc) :- p_occupancy("ANXA2P2(Y24)", "PF3758309", inc).
0.6879377879::p_fc("ANXA2P2(Y24)", "PF4708671", dec); 0.001::p_fc("ANXA2P2(Y24)", "PF4708671", inc) :- p_occupancy("ANXA2P2(Y24)", "PF4708671", dec).
0.001::p_fc("ANXA2P2(Y24)", "PF4708671", dec); 0.6879377879::p_fc("ANXA2P2(Y24)", "PF4708671", inc) :- p_occupancy("ANXA2P2(Y24)", "PF4708671", inc).
0.3753635607::p_fc("ANXA2P2(Y24)", "PH797804", dec); 0.001::p_fc("ANXA2P2(Y24)", "PH797804", inc) :- p_occupancy("ANXA2P2(Y24)", "PH797804", dec).
0.001::p_fc("ANXA2P2(Y24)", "PH797804", dec); 0.3753635607::p_fc("ANXA2P2(Y24)", "PH797804", inc) :- p_occupancy("ANXA2P2(Y24)", "PH797804", inc).
0.8601335948::p_fc("ANXA2P2(Y24)", "PIK294", dec); 0.001::p_fc("ANXA2P2(Y24)", "PIK294", inc) :- p_occupancy("ANXA2P2(Y24)", "PIK294", dec).
0.001::p_fc("ANXA2P2(Y24)", "PIK294", dec); 0.8601335948::p_fc("ANXA2P2(Y24)", "PIK294", inc) :- p_occupancy("ANXA2P2(Y24)", "PIK294", inc).
0.2202083724::p_fc("ANXA2P2(Y24)", "Ribociclib", dec); 0.001::p_fc("ANXA2P2(Y24)", "Ribociclib", inc) :- p_occupancy("ANXA2P2(Y24)", "Ribociclib", dec).
0.001::p_fc("ANXA2P2(Y24)", "Ribociclib", dec); 0.2202083724::p_fc("ANXA2P2(Y24)", "Ribociclib", inc) :- p_occupancy("ANXA2P2(Y24)", "Ribociclib", inc).
0.5739489564::p_fc("ANXA2P2(Y24)", "Ripasudil", dec); 0.001::p_fc("ANXA2P2(Y24)", "Ripasudil", inc) :- p_occupancy("ANXA2P2(Y24)", "Ripasudil", dec).
0.001::p_fc("ANXA2P2(Y24)", "Ripasudil", dec); 0.5739489564::p_fc("ANXA2P2(Y24)", "Ripasudil", inc) :- p_occupancy("ANXA2P2(Y24)", "Ripasudil", inc).
0.4588019674::p_fc("ANXA2P2(Y24)", "SP600125", dec); 0.001::p_fc("ANXA2P2(Y24)", "SP600125", inc) :- p_occupancy("ANXA2P2(Y24)", "SP600125", dec).
0.001::p_fc("ANXA2P2(Y24)", "SP600125", dec); 0.4588019674::p_fc("ANXA2P2(Y24)", "SP600125", inc) :- p_occupancy("ANXA2P2(Y24)", "SP600125", inc).
0.5930898184::p_fc("ANXA2P2(Y24)", "Selumetinib", dec); 0.001::p_fc("ANXA2P2(Y24)", "Selumetinib", inc) :- p_occupancy("ANXA2P2(Y24)", "Selumetinib", dec).
0.001::p_fc("ANXA2P2(Y24)", "Selumetinib", dec); 0.5930898184::p_fc("ANXA2P2(Y24)", "Selumetinib", inc) :- p_occupancy("ANXA2P2(Y24)", "Selumetinib", inc).
0.8218065187::p_fc("ANXA2P2(Y24)", "TAK715", dec); 0.001::p_fc("ANXA2P2(Y24)", "TAK715", inc) :- p_occupancy("ANXA2P2(Y24)", "TAK715", dec).
0.001::p_fc("ANXA2P2(Y24)", "TAK715", dec); 0.8218065187::p_fc("ANXA2P2(Y24)", "TAK715", inc) :- p_occupancy("ANXA2P2(Y24)", "TAK715", inc).
0.6772189685::p_fc("ANXA2P2(Y24)", "TBCA", dec); 0.001::p_fc("ANXA2P2(Y24)", "TBCA", inc) :- p_occupancy("ANXA2P2(Y24)", "TBCA", dec).
0.001::p_fc("ANXA2P2(Y24)", "TBCA", dec); 0.6772189685::p_fc("ANXA2P2(Y24)", "TBCA", inc) :- p_occupancy("ANXA2P2(Y24)", "TBCA", inc).
0.2436093729::p_fc("ANXA2P2(Y24)", "TGX221", dec); 0.001::p_fc("ANXA2P2(Y24)", "TGX221", inc) :- p_occupancy("ANXA2P2(Y24)", "TGX221", dec).
0.001::p_fc("ANXA2P2(Y24)", "TGX221", dec); 0.2436093729::p_fc("ANXA2P2(Y24)", "TGX221", inc) :- p_occupancy("ANXA2P2(Y24)", "TGX221", inc).
0.595954247::p_fc("ANXA2P2(Y24)", "Tofacitinib", dec); 0.001::p_fc("ANXA2P2(Y24)", "Tofacitinib", inc) :- p_occupancy("ANXA2P2(Y24)", "Tofacitinib", dec).
0.001::p_fc("ANXA2P2(Y24)", "Tofacitinib", dec); 0.595954247::p_fc("ANXA2P2(Y24)", "Tofacitinib", inc) :- p_occupancy("ANXA2P2(Y24)", "Tofacitinib", inc).
0.0946593738::p_fc("ANXA2P2(Y24)", "Torin", dec); 0.001::p_fc("ANXA2P2(Y24)", "Torin", inc) :- p_occupancy("ANXA2P2(Y24)", "Torin", dec).
0.001::p_fc("ANXA2P2(Y24)", "Torin", dec); 0.0946593738::p_fc("ANXA2P2(Y24)", "Torin", inc) :- p_occupancy("ANXA2P2(Y24)", "Torin", inc).
0.7222869164::p_fc("ANXA2P2(Y24)", "Trametinib", dec); 0.001::p_fc("ANXA2P2(Y24)", "Trametinib", inc) :- p_occupancy("ANXA2P2(Y24)", "Trametinib", dec).
0.001::p_fc("ANXA2P2(Y24)", "Trametinib", dec); 0.7222869164::p_fc("ANXA2P2(Y24)", "Trametinib", inc) :- p_occupancy("ANXA2P2(Y24)", "Trametinib", inc).
0.7884303816::p_fc("ANXA2P2(Y24)", "U73122", dec); 0.001::p_fc("ANXA2P2(Y24)", "U73122", inc) :- p_occupancy("ANXA2P2(Y24)", "U73122", dec).
0.001::p_fc("ANXA2P2(Y24)", "U73122", dec); 0.7884303816::p_fc("ANXA2P2(Y24)", "U73122", inc) :- p_occupancy("ANXA2P2(Y24)", "U73122", inc).
0.2775867249::p_fc("ANXA2P2(Y24)", "Ulixertinib", dec); 0.001::p_fc("ANXA2P2(Y24)", "Ulixertinib", inc) :- p_occupancy("ANXA2P2(Y24)", "Ulixertinib", dec).
0.001::p_fc("ANXA2P2(Y24)", "Ulixertinib", dec); 0.2775867249::p_fc("ANXA2P2(Y24)", "Ulixertinib", inc) :- p_occupancy("ANXA2P2(Y24)", "Ulixertinib", inc).
0.5173160748::p_fc("ANXA2P2(Y24)", "Vemurafenib", dec); 0.001::p_fc("ANXA2P2(Y24)", "Vemurafenib", inc) :- p_occupancy("ANXA2P2(Y24)", "Vemurafenib", dec).
0.001::p_fc("ANXA2P2(Y24)", "Vemurafenib", dec); 0.5173160748::p_fc("ANXA2P2(Y24)", "Vemurafenib", inc) :- p_occupancy("ANXA2P2(Y24)", "Vemurafenib", inc).
0.8457874177::p_fc("ATF1(S198)", "AC220", dec); 0.001::p_fc("ATF1(S198)", "AC220", inc) :- p_occupancy("ATF1(S198)", "AC220", dec).
0.001::p_fc("ATF1(S198)", "AC220", dec); 0.8457874177::p_fc("ATF1(S198)", "AC220", inc) :- p_occupancy("ATF1(S198)", "AC220", inc).
0.20735634::p_fc("ATF1(S198)", "AT13148", dec); 0.001::p_fc("ATF1(S198)", "AT13148", inc) :- p_occupancy("ATF1(S198)", "AT13148", dec).
0.001::p_fc("ATF1(S198)", "AT13148", dec); 0.20735634::p_fc("ATF1(S198)", "AT13148", inc) :- p_occupancy("ATF1(S198)", "AT13148", inc).
0.8426313639::p_fc("ATF1(S198)", "AZ20", dec); 0.001::p_fc("ATF1(S198)", "AZ20", inc) :- p_occupancy("ATF1(S198)", "AZ20", dec).
0.001::p_fc("ATF1(S198)", "AZ20", dec); 0.8426313639::p_fc("ATF1(S198)", "AZ20", inc) :- p_occupancy("ATF1(S198)", "AZ20", inc).
0.0308461155::p_fc("ATF1(S198)", "AZD1480", dec); 0.001::p_fc("ATF1(S198)", "AZD1480", inc) :- p_occupancy("ATF1(S198)", "AZD1480", dec).
0.001::p_fc("ATF1(S198)", "AZD1480", dec); 0.0308461155::p_fc("ATF1(S198)", "AZD1480", inc) :- p_occupancy("ATF1(S198)", "AZD1480", inc).
0.2933465055::p_fc("ATF1(S198)", "AZD3759", dec); 0.001::p_fc("ATF1(S198)", "AZD3759", inc) :- p_occupancy("ATF1(S198)", "AZD3759", dec).
0.001::p_fc("ATF1(S198)", "AZD3759", dec); 0.2933465055::p_fc("ATF1(S198)", "AZD3759", inc) :- p_occupancy("ATF1(S198)", "AZD3759", inc).
0.1348712367::p_fc("ATF1(S198)", "AZD5363", dec); 0.001::p_fc("ATF1(S198)", "AZD5363", inc) :- p_occupancy("ATF1(S198)", "AZD5363", dec).
0.001::p_fc("ATF1(S198)", "AZD5363", dec); 0.1348712367::p_fc("ATF1(S198)", "AZD5363", inc) :- p_occupancy("ATF1(S198)", "AZD5363", inc).
0.9975523871::p_fc("ATF1(S198)", "AZD5438", dec); 0.001::p_fc("ATF1(S198)", "AZD5438", inc) :- p_occupancy("ATF1(S198)", "AZD5438", dec).
0.001::p_fc("ATF1(S198)", "AZD5438", dec); 0.9975523871::p_fc("ATF1(S198)", "AZD5438", inc) :- p_occupancy("ATF1(S198)", "AZD5438", inc).
0.5311577558::p_fc("ATF1(S198)", "AZD6482", dec); 0.001::p_fc("ATF1(S198)", "AZD6482", inc) :- p_occupancy("ATF1(S198)", "AZD6482", dec).
0.001::p_fc("ATF1(S198)", "AZD6482", dec); 0.5311577558::p_fc("ATF1(S198)", "AZD6482", inc) :- p_occupancy("ATF1(S198)", "AZD6482", inc).
0.8711661002::p_fc("ATF1(S198)", "AZD6738", dec); 0.001::p_fc("ATF1(S198)", "AZD6738", inc) :- p_occupancy("ATF1(S198)", "AZD6738", dec).
0.001::p_fc("ATF1(S198)", "AZD6738", dec); 0.8711661002::p_fc("ATF1(S198)", "AZD6738", inc) :- p_occupancy("ATF1(S198)", "AZD6738", inc).
0.6268464173::p_fc("ATF1(S198)", "AZD8055", dec); 0.001::p_fc("ATF1(S198)", "AZD8055", inc) :- p_occupancy("ATF1(S198)", "AZD8055", dec).
0.001::p_fc("ATF1(S198)", "AZD8055", dec); 0.6268464173::p_fc("ATF1(S198)", "AZD8055", inc) :- p_occupancy("ATF1(S198)", "AZD8055", inc).
0.4749176347::p_fc("ATF1(S198)", "Amuvatinib", dec); 0.001::p_fc("ATF1(S198)", "Amuvatinib", inc) :- p_occupancy("ATF1(S198)", "Amuvatinib", dec).
0.001::p_fc("ATF1(S198)", "Amuvatinib", dec); 0.4749176347::p_fc("ATF1(S198)", "Amuvatinib", inc) :- p_occupancy("ATF1(S198)", "Amuvatinib", inc).
0.6583150736::p_fc("ATF1(S198)", "BX912", dec); 0.001::p_fc("ATF1(S198)", "BX912", inc) :- p_occupancy("ATF1(S198)", "BX912", dec).
0.001::p_fc("ATF1(S198)", "BX912", dec); 0.6583150736::p_fc("ATF1(S198)", "BX912", inc) :- p_occupancy("ATF1(S198)", "BX912", inc).
0.1206295226::p_fc("ATF1(S198)", "Bosutinib", dec); 0.001::p_fc("ATF1(S198)", "Bosutinib", inc) :- p_occupancy("ATF1(S198)", "Bosutinib", dec).
0.001::p_fc("ATF1(S198)", "Bosutinib", dec); 0.1206295226::p_fc("ATF1(S198)", "Bosutinib", inc) :- p_occupancy("ATF1(S198)", "Bosutinib", inc).
0.0054546224::p_fc("ATF1(S198)", "CAL101", dec); 0.001::p_fc("ATF1(S198)", "CAL101", inc) :- p_occupancy("ATF1(S198)", "CAL101", dec).
0.001::p_fc("ATF1(S198)", "CAL101", dec); 0.0054546224::p_fc("ATF1(S198)", "CAL101", inc) :- p_occupancy("ATF1(S198)", "CAL101", inc).
0.0555002721::p_fc("ATF1(S198)", "CHIR99021", dec); 0.001::p_fc("ATF1(S198)", "CHIR99021", inc) :- p_occupancy("ATF1(S198)", "CHIR99021", dec).
0.001::p_fc("ATF1(S198)", "CHIR99021", dec); 0.0555002721::p_fc("ATF1(S198)", "CHIR99021", inc) :- p_occupancy("ATF1(S198)", "CHIR99021", inc).
0.6424723573::p_fc("ATF1(S198)", "CX4945", dec); 0.001::p_fc("ATF1(S198)", "CX4945", inc) :- p_occupancy("ATF1(S198)", "CX4945", dec).
0.001::p_fc("ATF1(S198)", "CX4945", dec); 0.6424723573::p_fc("ATF1(S198)", "CX4945", inc) :- p_occupancy("ATF1(S198)", "CX4945", inc).
0.1880817471::p_fc("ATF1(S198)", "DNAPK", dec); 0.001::p_fc("ATF1(S198)", "DNAPK", inc) :- p_occupancy("ATF1(S198)", "DNAPK", dec).
0.001::p_fc("ATF1(S198)", "DNAPK", dec); 0.1880817471::p_fc("ATF1(S198)", "DNAPK", inc) :- p_occupancy("ATF1(S198)", "DNAPK", inc).
0.2380520088::p_fc("ATF1(S198)", "Dabrafenib", dec); 0.001::p_fc("ATF1(S198)", "Dabrafenib", inc) :- p_occupancy("ATF1(S198)", "Dabrafenib", dec).
0.001::p_fc("ATF1(S198)", "Dabrafenib", dec); 0.2380520088::p_fc("ATF1(S198)", "Dabrafenib", inc) :- p_occupancy("ATF1(S198)", "Dabrafenib", inc).
0.263883813::p_fc("ATF1(S198)", "Dasatinib", dec); 0.001::p_fc("ATF1(S198)", "Dasatinib", inc) :- p_occupancy("ATF1(S198)", "Dasatinib", dec).
0.001::p_fc("ATF1(S198)", "Dasatinib", dec); 0.263883813::p_fc("ATF1(S198)", "Dasatinib", inc) :- p_occupancy("ATF1(S198)", "Dasatinib", inc).
0.1954112157::p_fc("ATF1(S198)", "Edelfosine", dec); 0.001::p_fc("ATF1(S198)", "Edelfosine", inc) :- p_occupancy("ATF1(S198)", "Edelfosine", dec).
0.001::p_fc("ATF1(S198)", "Edelfosine", dec); 0.1954112157::p_fc("ATF1(S198)", "Edelfosine", inc) :- p_occupancy("ATF1(S198)", "Edelfosine", inc).
0.427336905::p_fc("ATF1(S198)", "FRAX486", dec); 0.001::p_fc("ATF1(S198)", "FRAX486", inc) :- p_occupancy("ATF1(S198)", "FRAX486", dec).
0.001::p_fc("ATF1(S198)", "FRAX486", dec); 0.427336905::p_fc("ATF1(S198)", "FRAX486", inc) :- p_occupancy("ATF1(S198)", "FRAX486", inc).
0.0215505599::p_fc("ATF1(S198)", "GDC0941", dec); 0.001::p_fc("ATF1(S198)", "GDC0941", inc) :- p_occupancy("ATF1(S198)", "GDC0941", dec).
0.001::p_fc("ATF1(S198)", "GDC0941", dec); 0.0215505599::p_fc("ATF1(S198)", "GDC0941", inc) :- p_occupancy("ATF1(S198)", "GDC0941", inc).
0.1764055583::p_fc("ATF1(S198)", "GDC0994", dec); 0.001::p_fc("ATF1(S198)", "GDC0994", inc) :- p_occupancy("ATF1(S198)", "GDC0994", dec).
0.001::p_fc("ATF1(S198)", "GDC0994", dec); 0.1764055583::p_fc("ATF1(S198)", "GDC0994", inc) :- p_occupancy("ATF1(S198)", "GDC0994", inc).
0.0761130112::p_fc("ATF1(S198)", "GF109203X", dec); 0.001::p_fc("ATF1(S198)", "GF109203X", inc) :- p_occupancy("ATF1(S198)", "GF109203X", dec).
0.001::p_fc("ATF1(S198)", "GF109203X", dec); 0.0761130112::p_fc("ATF1(S198)", "GF109203X", inc) :- p_occupancy("ATF1(S198)", "GF109203X", inc).
0.4448621773::p_fc("ATF1(S198)", "GO6983", dec); 0.001::p_fc("ATF1(S198)", "GO6983", inc) :- p_occupancy("ATF1(S198)", "GO6983", dec).
0.001::p_fc("ATF1(S198)", "GO6983", dec); 0.4448621773::p_fc("ATF1(S198)", "GO6983", inc) :- p_occupancy("ATF1(S198)", "GO6983", inc).
0.0401261894::p_fc("ATF1(S198)", "GSK2334470", dec); 0.001::p_fc("ATF1(S198)", "GSK2334470", inc) :- p_occupancy("ATF1(S198)", "GSK2334470", dec).
0.001::p_fc("ATF1(S198)", "GSK2334470", dec); 0.0401261894::p_fc("ATF1(S198)", "GSK2334470", inc) :- p_occupancy("ATF1(S198)", "GSK2334470", inc).
0.5111420096::p_fc("ATF1(S198)", "GSK690693", dec); 0.001::p_fc("ATF1(S198)", "GSK690693", inc) :- p_occupancy("ATF1(S198)", "GSK690693", dec).
0.001::p_fc("ATF1(S198)", "GSK690693", dec); 0.5111420096::p_fc("ATF1(S198)", "GSK690693", inc) :- p_occupancy("ATF1(S198)", "GSK690693", inc).
0.442363382::p_fc("ATF1(S198)", "Go6976", dec); 0.001::p_fc("ATF1(S198)", "Go6976", inc) :- p_occupancy("ATF1(S198)", "Go6976", dec).
0.001::p_fc("ATF1(S198)", "Go6976", dec); 0.442363382::p_fc("ATF1(S198)", "Go6976", inc) :- p_occupancy("ATF1(S198)", "Go6976", inc).
0.2059721424::p_fc("ATF1(S198)", "H89", dec); 0.001::p_fc("ATF1(S198)", "H89", inc) :- p_occupancy("ATF1(S198)", "H89", dec).
0.001::p_fc("ATF1(S198)", "H89", dec); 0.2059721424::p_fc("ATF1(S198)", "H89", inc) :- p_occupancy("ATF1(S198)", "H89", inc).
0.8438917638::p_fc("ATF1(S198)", "HS173", dec); 0.001::p_fc("ATF1(S198)", "HS173", inc) :- p_occupancy("ATF1(S198)", "HS173", dec).
0.001::p_fc("ATF1(S198)", "HS173", dec); 0.8438917638::p_fc("ATF1(S198)", "HS173", inc) :- p_occupancy("ATF1(S198)", "HS173", inc).
0.221034402::p_fc("ATF1(S198)", "Ipatasertib", dec); 0.001::p_fc("ATF1(S198)", "Ipatasertib", inc) :- p_occupancy("ATF1(S198)", "Ipatasertib", dec).
0.001::p_fc("ATF1(S198)", "Ipatasertib", dec); 0.221034402::p_fc("ATF1(S198)", "Ipatasertib", inc) :- p_occupancy("ATF1(S198)", "Ipatasertib", inc).
0.264014559::p_fc("ATF1(S198)", "JNJ", dec); 0.001::p_fc("ATF1(S198)", "JNJ", inc) :- p_occupancy("ATF1(S198)", "JNJ", dec).
0.001::p_fc("ATF1(S198)", "JNJ", dec); 0.264014559::p_fc("ATF1(S198)", "JNJ", inc) :- p_occupancy("ATF1(S198)", "JNJ", inc).
0.7948508212::p_fc("ATF1(S198)", "JNK", dec); 0.001::p_fc("ATF1(S198)", "JNK", inc) :- p_occupancy("ATF1(S198)", "JNK", dec).
0.001::p_fc("ATF1(S198)", "JNK", dec); 0.7948508212::p_fc("ATF1(S198)", "JNK", inc) :- p_occupancy("ATF1(S198)", "JNK", inc).
0.9587652054::p_fc("ATF1(S198)", "KD025", dec); 0.001::p_fc("ATF1(S198)", "KD025", inc) :- p_occupancy("ATF1(S198)", "KD025", dec).
0.001::p_fc("ATF1(S198)", "KD025", dec); 0.9587652054::p_fc("ATF1(S198)", "KD025", inc) :- p_occupancy("ATF1(S198)", "KD025", inc).
0.6551973961::p_fc("ATF1(S198)", "KN62", dec); 0.001::p_fc("ATF1(S198)", "KN62", inc) :- p_occupancy("ATF1(S198)", "KN62", dec).
0.001::p_fc("ATF1(S198)", "KN62", dec); 0.6551973961::p_fc("ATF1(S198)", "KN62", inc) :- p_occupancy("ATF1(S198)", "KN62", inc).
0.0077290339::p_fc("ATF1(S198)", "KN93", dec); 0.001::p_fc("ATF1(S198)", "KN93", inc) :- p_occupancy("ATF1(S198)", "KN93", dec).
0.001::p_fc("ATF1(S198)", "KN93", dec); 0.0077290339::p_fc("ATF1(S198)", "KN93", inc) :- p_occupancy("ATF1(S198)", "KN93", inc).
0.7823140554::p_fc("ATF1(S198)", "Ku0063794", dec); 0.001::p_fc("ATF1(S198)", "Ku0063794", inc) :- p_occupancy("ATF1(S198)", "Ku0063794", dec).
0.001::p_fc("ATF1(S198)", "Ku0063794", dec); 0.7823140554::p_fc("ATF1(S198)", "Ku0063794", inc) :- p_occupancy("ATF1(S198)", "Ku0063794", inc).
0.7177212528::p_fc("ATF1(S198)", "LY2090314", dec); 0.001::p_fc("ATF1(S198)", "LY2090314", inc) :- p_occupancy("ATF1(S198)", "LY2090314", dec).
0.001::p_fc("ATF1(S198)", "LY2090314", dec); 0.7177212528::p_fc("ATF1(S198)", "LY2090314", inc) :- p_occupancy("ATF1(S198)", "LY2090314", inc).
0.3313393378::p_fc("ATF1(S198)", "LY2584702", dec); 0.001::p_fc("ATF1(S198)", "LY2584702", inc) :- p_occupancy("ATF1(S198)", "LY2584702", dec).
0.001::p_fc("ATF1(S198)", "LY2584702", dec); 0.3313393378::p_fc("ATF1(S198)", "LY2584702", inc) :- p_occupancy("ATF1(S198)", "LY2584702", inc).
0.9214892713::p_fc("ATF1(S198)", "LY2835219", dec); 0.001::p_fc("ATF1(S198)", "LY2835219", inc) :- p_occupancy("ATF1(S198)", "LY2835219", dec).
0.001::p_fc("ATF1(S198)", "LY2835219", dec); 0.9214892713::p_fc("ATF1(S198)", "LY2835219", inc) :- p_occupancy("ATF1(S198)", "LY2835219", inc).
0.8540980321::p_fc("ATF1(S198)", "Linsitinib", dec); 0.001::p_fc("ATF1(S198)", "Linsitinib", inc) :- p_occupancy("ATF1(S198)", "Linsitinib", dec).
0.001::p_fc("ATF1(S198)", "Linsitinib", dec); 0.8540980321::p_fc("ATF1(S198)", "Linsitinib", inc) :- p_occupancy("ATF1(S198)", "Linsitinib", inc).
0.5234714117::p_fc("ATF1(S198)", "MK2206", dec); 0.001::p_fc("ATF1(S198)", "MK2206", inc) :- p_occupancy("ATF1(S198)", "MK2206", dec).
0.001::p_fc("ATF1(S198)", "MK2206", dec); 0.5234714117::p_fc("ATF1(S198)", "MK2206", inc) :- p_occupancy("ATF1(S198)", "MK2206", inc).
0.1175510118::p_fc("ATF1(S198)", "NU7441", dec); 0.001::p_fc("ATF1(S198)", "NU7441", inc) :- p_occupancy("ATF1(S198)", "NU7441", dec).
0.001::p_fc("ATF1(S198)", "NU7441", dec); 0.1175510118::p_fc("ATF1(S198)", "NU7441", inc) :- p_occupancy("ATF1(S198)", "NU7441", inc).
0.9704412817::p_fc("ATF1(S198)", "PD153035", dec); 0.001::p_fc("ATF1(S198)", "PD153035", inc) :- p_occupancy("ATF1(S198)", "PD153035", dec).
0.001::p_fc("ATF1(S198)", "PD153035", dec); 0.9704412817::p_fc("ATF1(S198)", "PD153035", inc) :- p_occupancy("ATF1(S198)", "PD153035", inc).
0.9084827802::p_fc("ATF1(S198)", "PF3758309", dec); 0.001::p_fc("ATF1(S198)", "PF3758309", inc) :- p_occupancy("ATF1(S198)", "PF3758309", dec).
0.001::p_fc("ATF1(S198)", "PF3758309", dec); 0.9084827802::p_fc("ATF1(S198)", "PF3758309", inc) :- p_occupancy("ATF1(S198)", "PF3758309", inc).
0.0609391614::p_fc("ATF1(S198)", "PF4708671", dec); 0.001::p_fc("ATF1(S198)", "PF4708671", inc) :- p_occupancy("ATF1(S198)", "PF4708671", dec).
0.001::p_fc("ATF1(S198)", "PF4708671", dec); 0.0609391614::p_fc("ATF1(S198)", "PF4708671", inc) :- p_occupancy("ATF1(S198)", "PF4708671", inc).
0.0834255062::p_fc("ATF1(S198)", "PH797804", dec); 0.001::p_fc("ATF1(S198)", "PH797804", inc) :- p_occupancy("ATF1(S198)", "PH797804", dec).
0.001::p_fc("ATF1(S198)", "PH797804", dec); 0.0834255062::p_fc("ATF1(S198)", "PH797804", inc) :- p_occupancy("ATF1(S198)", "PH797804", inc).
0.4903727998::p_fc("ATF1(S198)", "PIK294", dec); 0.001::p_fc("ATF1(S198)", "PIK294", inc) :- p_occupancy("ATF1(S198)", "PIK294", dec).
0.001::p_fc("ATF1(S198)", "PIK294", dec); 0.4903727998::p_fc("ATF1(S198)", "PIK294", inc) :- p_occupancy("ATF1(S198)", "PIK294", inc).
0.4156032415::p_fc("ATF1(S198)", "Ribociclib", dec); 0.001::p_fc("ATF1(S198)", "Ribociclib", inc) :- p_occupancy("ATF1(S198)", "Ribociclib", dec).
0.001::p_fc("ATF1(S198)", "Ribociclib", dec); 0.4156032415::p_fc("ATF1(S198)", "Ribociclib", inc) :- p_occupancy("ATF1(S198)", "Ribociclib", inc).
0.3731604549::p_fc("ATF1(S198)", "Ripasudil", dec); 0.001::p_fc("ATF1(S198)", "Ripasudil", inc) :- p_occupancy("ATF1(S198)", "Ripasudil", dec).
0.001::p_fc("ATF1(S198)", "Ripasudil", dec); 0.3731604549::p_fc("ATF1(S198)", "Ripasudil", inc) :- p_occupancy("ATF1(S198)", "Ripasudil", inc).
0.1210305895::p_fc("ATF1(S198)", "SP600125", dec); 0.001::p_fc("ATF1(S198)", "SP600125", inc) :- p_occupancy("ATF1(S198)", "SP600125", dec).
0.001::p_fc("ATF1(S198)", "SP600125", dec); 0.1210305895::p_fc("ATF1(S198)", "SP600125", inc) :- p_occupancy("ATF1(S198)", "SP600125", inc).
0.2345534565::p_fc("ATF1(S198)", "Selumetinib", dec); 0.001::p_fc("ATF1(S198)", "Selumetinib", inc) :- p_occupancy("ATF1(S198)", "Selumetinib", dec).
0.001::p_fc("ATF1(S198)", "Selumetinib", dec); 0.2345534565::p_fc("ATF1(S198)", "Selumetinib", inc) :- p_occupancy("ATF1(S198)", "Selumetinib", inc).
0.4638951947::p_fc("ATF1(S198)", "TAK715", dec); 0.001::p_fc("ATF1(S198)", "TAK715", inc) :- p_occupancy("ATF1(S198)", "TAK715", dec).
0.001::p_fc("ATF1(S198)", "TAK715", dec); 0.4638951947::p_fc("ATF1(S198)", "TAK715", inc) :- p_occupancy("ATF1(S198)", "TAK715", inc).
0.1957498684::p_fc("ATF1(S198)", "TBCA", dec); 0.001::p_fc("ATF1(S198)", "TBCA", inc) :- p_occupancy("ATF1(S198)", "TBCA", dec).
0.001::p_fc("ATF1(S198)", "TBCA", dec); 0.1957498684::p_fc("ATF1(S198)", "TBCA", inc) :- p_occupancy("ATF1(S198)", "TBCA", inc).
0.336185573::p_fc("ATF1(S198)", "TGX221", dec); 0.001::p_fc("ATF1(S198)", "TGX221", inc) :- p_occupancy("ATF1(S198)", "TGX221", dec).
0.001::p_fc("ATF1(S198)", "TGX221", dec); 0.336185573::p_fc("ATF1(S198)", "TGX221", inc) :- p_occupancy("ATF1(S198)", "TGX221", inc).
0.0895827618::p_fc("ATF1(S198)", "Tofacitinib", dec); 0.001::p_fc("ATF1(S198)", "Tofacitinib", inc) :- p_occupancy("ATF1(S198)", "Tofacitinib", dec).
0.001::p_fc("ATF1(S198)", "Tofacitinib", dec); 0.0895827618::p_fc("ATF1(S198)", "Tofacitinib", inc) :- p_occupancy("ATF1(S198)", "Tofacitinib", inc).
0.489986072::p_fc("ATF1(S198)", "Torin", dec); 0.001::p_fc("ATF1(S198)", "Torin", inc) :- p_occupancy("ATF1(S198)", "Torin", dec).
0.001::p_fc("ATF1(S198)", "Torin", dec); 0.489986072::p_fc("ATF1(S198)", "Torin", inc) :- p_occupancy("ATF1(S198)", "Torin", inc).
0.2948922256::p_fc("ATF1(S198)", "Trametinib", dec); 0.001::p_fc("ATF1(S198)", "Trametinib", inc) :- p_occupancy("ATF1(S198)", "Trametinib", dec).
0.001::p_fc("ATF1(S198)", "Trametinib", dec); 0.2948922256::p_fc("ATF1(S198)", "Trametinib", inc) :- p_occupancy("ATF1(S198)", "Trametinib", inc).
0.7942490888::p_fc("ATF1(S198)", "U73122", dec); 0.001::p_fc("ATF1(S198)", "U73122", inc) :- p_occupancy("ATF1(S198)", "U73122", dec).
0.001::p_fc("ATF1(S198)", "U73122", dec); 0.7942490888::p_fc("ATF1(S198)", "U73122", inc) :- p_occupancy("ATF1(S198)", "U73122", inc).
0.7181477701::p_fc("ATF1(S198)", "Ulixertinib", dec); 0.001::p_fc("ATF1(S198)", "Ulixertinib", inc) :- p_occupancy("ATF1(S198)", "Ulixertinib", dec).
0.001::p_fc("ATF1(S198)", "Ulixertinib", dec); 0.7181477701::p_fc("ATF1(S198)", "Ulixertinib", inc) :- p_occupancy("ATF1(S198)", "Ulixertinib", inc).
0.3208579833::p_fc("ATF1(S198)", "Vemurafenib", dec); 0.001::p_fc("ATF1(S198)", "Vemurafenib", inc) :- p_occupancy("ATF1(S198)", "Vemurafenib", dec).
0.001::p_fc("ATF1(S198)", "Vemurafenib", dec); 0.3208579833::p_fc("ATF1(S198)", "Vemurafenib", inc) :- p_occupancy("ATF1(S198)", "Vemurafenib", inc).
0.9423282593::p_fc("BCLAF1(Y284)", "AC220", dec); 0.001::p_fc("BCLAF1(Y284)", "AC220", inc) :- p_occupancy("BCLAF1(Y284)", "AC220", dec).
0.001::p_fc("BCLAF1(Y284)", "AC220", dec); 0.9423282593::p_fc("BCLAF1(Y284)", "AC220", inc) :- p_occupancy("BCLAF1(Y284)", "AC220", inc).
0.9726076124::p_fc("BCLAF1(Y284)", "AT13148", dec); 0.001::p_fc("BCLAF1(Y284)", "AT13148", inc) :- p_occupancy("BCLAF1(Y284)", "AT13148", dec).
0.001::p_fc("BCLAF1(Y284)", "AT13148", dec); 0.9726076124::p_fc("BCLAF1(Y284)", "AT13148", inc) :- p_occupancy("BCLAF1(Y284)", "AT13148", inc).
0.8986954765::p_fc("BCLAF1(Y284)", "AZ20", dec); 0.001::p_fc("BCLAF1(Y284)", "AZ20", inc) :- p_occupancy("BCLAF1(Y284)", "AZ20", dec).
0.001::p_fc("BCLAF1(Y284)", "AZ20", dec); 0.8986954765::p_fc("BCLAF1(Y284)", "AZ20", inc) :- p_occupancy("BCLAF1(Y284)", "AZ20", inc).
0.8666173621::p_fc("BCLAF1(Y284)", "AZD1480", dec); 0.001::p_fc("BCLAF1(Y284)", "AZD1480", inc) :- p_occupancy("BCLAF1(Y284)", "AZD1480", dec).
0.001::p_fc("BCLAF1(Y284)", "AZD1480", dec); 0.8666173621::p_fc("BCLAF1(Y284)", "AZD1480", inc) :- p_occupancy("BCLAF1(Y284)", "AZD1480", inc).
0.3122651988::p_fc("BCLAF1(Y284)", "AZD3759", dec); 0.001::p_fc("BCLAF1(Y284)", "AZD3759", inc) :- p_occupancy("BCLAF1(Y284)", "AZD3759", dec).
0.001::p_fc("BCLAF1(Y284)", "AZD3759", dec); 0.3122651988::p_fc("BCLAF1(Y284)", "AZD3759", inc) :- p_occupancy("BCLAF1(Y284)", "AZD3759", inc).
0.6158014894::p_fc("BCLAF1(Y284)", "AZD5363", dec); 0.001::p_fc("BCLAF1(Y284)", "AZD5363", inc) :- p_occupancy("BCLAF1(Y284)", "AZD5363", dec).
0.001::p_fc("BCLAF1(Y284)", "AZD5363", dec); 0.6158014894::p_fc("BCLAF1(Y284)", "AZD5363", inc) :- p_occupancy("BCLAF1(Y284)", "AZD5363", inc).
0.8846792338::p_fc("BCLAF1(Y284)", "AZD5438", dec); 0.001::p_fc("BCLAF1(Y284)", "AZD5438", inc) :- p_occupancy("BCLAF1(Y284)", "AZD5438", dec).
0.001::p_fc("BCLAF1(Y284)", "AZD5438", dec); 0.8846792338::p_fc("BCLAF1(Y284)", "AZD5438", inc) :- p_occupancy("BCLAF1(Y284)", "AZD5438", inc).
0.9885247057::p_fc("BCLAF1(Y284)", "AZD6482", dec); 0.001::p_fc("BCLAF1(Y284)", "AZD6482", inc) :- p_occupancy("BCLAF1(Y284)", "AZD6482", dec).
0.001::p_fc("BCLAF1(Y284)", "AZD6482", dec); 0.9885247057::p_fc("BCLAF1(Y284)", "AZD6482", inc) :- p_occupancy("BCLAF1(Y284)", "AZD6482", inc).
0.0283860067::p_fc("BCLAF1(Y284)", "AZD6738", dec); 0.001::p_fc("BCLAF1(Y284)", "AZD6738", inc) :- p_occupancy("BCLAF1(Y284)", "AZD6738", dec).
0.001::p_fc("BCLAF1(Y284)", "AZD6738", dec); 0.0283860067::p_fc("BCLAF1(Y284)", "AZD6738", inc) :- p_occupancy("BCLAF1(Y284)", "AZD6738", inc).
0.977308639::p_fc("BCLAF1(Y284)", "AZD8055", dec); 0.001::p_fc("BCLAF1(Y284)", "AZD8055", inc) :- p_occupancy("BCLAF1(Y284)", "AZD8055", dec).
0.001::p_fc("BCLAF1(Y284)", "AZD8055", dec); 0.977308639::p_fc("BCLAF1(Y284)", "AZD8055", inc) :- p_occupancy("BCLAF1(Y284)", "AZD8055", inc).
0.0561683897::p_fc("BCLAF1(Y284)", "Amuvatinib", dec); 0.001::p_fc("BCLAF1(Y284)", "Amuvatinib", inc) :- p_occupancy("BCLAF1(Y284)", "Amuvatinib", dec).
0.001::p_fc("BCLAF1(Y284)", "Amuvatinib", dec); 0.0561683897::p_fc("BCLAF1(Y284)", "Amuvatinib", inc) :- p_occupancy("BCLAF1(Y284)", "Amuvatinib", inc).
0.9564205444::p_fc("BCLAF1(Y284)", "BX912", dec); 0.001::p_fc("BCLAF1(Y284)", "BX912", inc) :- p_occupancy("BCLAF1(Y284)", "BX912", dec).
0.001::p_fc("BCLAF1(Y284)", "BX912", dec); 0.9564205444::p_fc("BCLAF1(Y284)", "BX912", inc) :- p_occupancy("BCLAF1(Y284)", "BX912", inc).
0.7758747726::p_fc("BCLAF1(Y284)", "Bosutinib", dec); 0.001::p_fc("BCLAF1(Y284)", "Bosutinib", inc) :- p_occupancy("BCLAF1(Y284)", "Bosutinib", dec).
0.001::p_fc("BCLAF1(Y284)", "Bosutinib", dec); 0.7758747726::p_fc("BCLAF1(Y284)", "Bosutinib", inc) :- p_occupancy("BCLAF1(Y284)", "Bosutinib", inc).
0.3386304215::p_fc("BCLAF1(Y284)", "CAL101", dec); 0.001::p_fc("BCLAF1(Y284)", "CAL101", inc) :- p_occupancy("BCLAF1(Y284)", "CAL101", dec).
0.001::p_fc("BCLAF1(Y284)", "CAL101", dec); 0.3386304215::p_fc("BCLAF1(Y284)", "CAL101", inc) :- p_occupancy("BCLAF1(Y284)", "CAL101", inc).
0.889182794::p_fc("BCLAF1(Y284)", "CHIR99021", dec); 0.001::p_fc("BCLAF1(Y284)", "CHIR99021", inc) :- p_occupancy("BCLAF1(Y284)", "CHIR99021", dec).
0.001::p_fc("BCLAF1(Y284)", "CHIR99021", dec); 0.889182794::p_fc("BCLAF1(Y284)", "CHIR99021", inc) :- p_occupancy("BCLAF1(Y284)", "CHIR99021", inc).
0.9980017941::p_fc("BCLAF1(Y284)", "CX4945", dec); 0.001::p_fc("BCLAF1(Y284)", "CX4945", inc) :- p_occupancy("BCLAF1(Y284)", "CX4945", dec).
0.001::p_fc("BCLAF1(Y284)", "CX4945", dec); 0.9980017941::p_fc("BCLAF1(Y284)", "CX4945", inc) :- p_occupancy("BCLAF1(Y284)", "CX4945", inc).
0.2035160942::p_fc("BCLAF1(Y284)", "DNAPK", dec); 0.001::p_fc("BCLAF1(Y284)", "DNAPK", inc) :- p_occupancy("BCLAF1(Y284)", "DNAPK", dec).
0.001::p_fc("BCLAF1(Y284)", "DNAPK", dec); 0.2035160942::p_fc("BCLAF1(Y284)", "DNAPK", inc) :- p_occupancy("BCLAF1(Y284)", "DNAPK", inc).
0.9145570375::p_fc("BCLAF1(Y284)", "Dabrafenib", dec); 0.001::p_fc("BCLAF1(Y284)", "Dabrafenib", inc) :- p_occupancy("BCLAF1(Y284)", "Dabrafenib", dec).
0.001::p_fc("BCLAF1(Y284)", "Dabrafenib", dec); 0.9145570375::p_fc("BCLAF1(Y284)", "Dabrafenib", inc) :- p_occupancy("BCLAF1(Y284)", "Dabrafenib", inc).
0.9951434259::p_fc("BCLAF1(Y284)", "Dasatinib", dec); 0.001::p_fc("BCLAF1(Y284)", "Dasatinib", inc) :- p_occupancy("BCLAF1(Y284)", "Dasatinib", dec).
0.001::p_fc("BCLAF1(Y284)", "Dasatinib", dec); 0.9951434259::p_fc("BCLAF1(Y284)", "Dasatinib", inc) :- p_occupancy("BCLAF1(Y284)", "Dasatinib", inc).
0.9980058619::p_fc("BCLAF1(Y284)", "Edelfosine", dec); 0.001::p_fc("BCLAF1(Y284)", "Edelfosine", inc) :- p_occupancy("BCLAF1(Y284)", "Edelfosine", dec).
0.001::p_fc("BCLAF1(Y284)", "Edelfosine", dec); 0.9980058619::p_fc("BCLAF1(Y284)", "Edelfosine", inc) :- p_occupancy("BCLAF1(Y284)", "Edelfosine", inc).
0.3845606534::p_fc("BCLAF1(Y284)", "FRAX486", dec); 0.001::p_fc("BCLAF1(Y284)", "FRAX486", inc) :- p_occupancy("BCLAF1(Y284)", "FRAX486", dec).
0.001::p_fc("BCLAF1(Y284)", "FRAX486", dec); 0.3845606534::p_fc("BCLAF1(Y284)", "FRAX486", inc) :- p_occupancy("BCLAF1(Y284)", "FRAX486", inc).
0.9980059748::p_fc("BCLAF1(Y284)", "GDC0941", dec); 0.001::p_fc("BCLAF1(Y284)", "GDC0941", inc) :- p_occupancy("BCLAF1(Y284)", "GDC0941", dec).
0.001::p_fc("BCLAF1(Y284)", "GDC0941", dec); 0.9980059748::p_fc("BCLAF1(Y284)", "GDC0941", inc) :- p_occupancy("BCLAF1(Y284)", "GDC0941", inc).
0.8269951453::p_fc("BCLAF1(Y284)", "GDC0994", dec); 0.001::p_fc("BCLAF1(Y284)", "GDC0994", inc) :- p_occupancy("BCLAF1(Y284)", "GDC0994", dec).
0.001::p_fc("BCLAF1(Y284)", "GDC0994", dec); 0.8269951453::p_fc("BCLAF1(Y284)", "GDC0994", inc) :- p_occupancy("BCLAF1(Y284)", "GDC0994", inc).
0.6989086996::p_fc("BCLAF1(Y284)", "GF109203X", dec); 0.001::p_fc("BCLAF1(Y284)", "GF109203X", inc) :- p_occupancy("BCLAF1(Y284)", "GF109203X", dec).
0.001::p_fc("BCLAF1(Y284)", "GF109203X", dec); 0.6989086996::p_fc("BCLAF1(Y284)", "GF109203X", inc) :- p_occupancy("BCLAF1(Y284)", "GF109203X", inc).
0.9980059675::p_fc("BCLAF1(Y284)", "GO6983", dec); 0.001::p_fc("BCLAF1(Y284)", "GO6983", inc) :- p_occupancy("BCLAF1(Y284)", "GO6983", dec).
0.001::p_fc("BCLAF1(Y284)", "GO6983", dec); 0.9980059675::p_fc("BCLAF1(Y284)", "GO6983", inc) :- p_occupancy("BCLAF1(Y284)", "GO6983", inc).
0.9942388038::p_fc("BCLAF1(Y284)", "GSK2334470", dec); 0.001::p_fc("BCLAF1(Y284)", "GSK2334470", inc) :- p_occupancy("BCLAF1(Y284)", "GSK2334470", dec).
0.001::p_fc("BCLAF1(Y284)", "GSK2334470", dec); 0.9942388038::p_fc("BCLAF1(Y284)", "GSK2334470", inc) :- p_occupancy("BCLAF1(Y284)", "GSK2334470", inc).
0.5536961742::p_fc("BCLAF1(Y284)", "GSK690693", dec); 0.001::p_fc("BCLAF1(Y284)", "GSK690693", inc) :- p_occupancy("BCLAF1(Y284)", "GSK690693", dec).
0.001::p_fc("BCLAF1(Y284)", "GSK690693", dec); 0.5536961742::p_fc("BCLAF1(Y284)", "GSK690693", inc) :- p_occupancy("BCLAF1(Y284)", "GSK690693", inc).
0.9979247502::p_fc("BCLAF1(Y284)", "Go6976", dec); 0.001::p_fc("BCLAF1(Y284)", "Go6976", inc) :- p_occupancy("BCLAF1(Y284)", "Go6976", dec).
0.001::p_fc("BCLAF1(Y284)", "Go6976", dec); 0.9979247502::p_fc("BCLAF1(Y284)", "Go6976", inc) :- p_occupancy("BCLAF1(Y284)", "Go6976", inc).
0.1502555101::p_fc("BCLAF1(Y284)", "H89", dec); 0.001::p_fc("BCLAF1(Y284)", "H89", inc) :- p_occupancy("BCLAF1(Y284)", "H89", dec).
0.001::p_fc("BCLAF1(Y284)", "H89", dec); 0.1502555101::p_fc("BCLAF1(Y284)", "H89", inc) :- p_occupancy("BCLAF1(Y284)", "H89", inc).
0.0581104004::p_fc("BCLAF1(Y284)", "HS173", dec); 0.001::p_fc("BCLAF1(Y284)", "HS173", inc) :- p_occupancy("BCLAF1(Y284)", "HS173", dec).
0.001::p_fc("BCLAF1(Y284)", "HS173", dec); 0.0581104004::p_fc("BCLAF1(Y284)", "HS173", inc) :- p_occupancy("BCLAF1(Y284)", "HS173", inc).
0.8935499141::p_fc("BCLAF1(Y284)", "Ipatasertib", dec); 0.001::p_fc("BCLAF1(Y284)", "Ipatasertib", inc) :- p_occupancy("BCLAF1(Y284)", "Ipatasertib", dec).
0.001::p_fc("BCLAF1(Y284)", "Ipatasertib", dec); 0.8935499141::p_fc("BCLAF1(Y284)", "Ipatasertib", inc) :- p_occupancy("BCLAF1(Y284)", "Ipatasertib", inc).
0.0936546245::p_fc("BCLAF1(Y284)", "JNJ", dec); 0.001::p_fc("BCLAF1(Y284)", "JNJ", inc) :- p_occupancy("BCLAF1(Y284)", "JNJ", dec).
0.001::p_fc("BCLAF1(Y284)", "JNJ", dec); 0.0936546245::p_fc("BCLAF1(Y284)", "JNJ", inc) :- p_occupancy("BCLAF1(Y284)", "JNJ", inc).
0.1869284201::p_fc("BCLAF1(Y284)", "JNK", dec); 0.001::p_fc("BCLAF1(Y284)", "JNK", inc) :- p_occupancy("BCLAF1(Y284)", "JNK", dec).
0.001::p_fc("BCLAF1(Y284)", "JNK", dec); 0.1869284201::p_fc("BCLAF1(Y284)", "JNK", inc) :- p_occupancy("BCLAF1(Y284)", "JNK", inc).
0.4820075859::p_fc("BCLAF1(Y284)", "KD025", dec); 0.001::p_fc("BCLAF1(Y284)", "KD025", inc) :- p_occupancy("BCLAF1(Y284)", "KD025", dec).
0.001::p_fc("BCLAF1(Y284)", "KD025", dec); 0.4820075859::p_fc("BCLAF1(Y284)", "KD025", inc) :- p_occupancy("BCLAF1(Y284)", "KD025", inc).
0.8899016759::p_fc("BCLAF1(Y284)", "KN62", dec); 0.001::p_fc("BCLAF1(Y284)", "KN62", inc) :- p_occupancy("BCLAF1(Y284)", "KN62", dec).
0.001::p_fc("BCLAF1(Y284)", "KN62", dec); 0.8899016759::p_fc("BCLAF1(Y284)", "KN62", inc) :- p_occupancy("BCLAF1(Y284)", "KN62", inc).
0.9980059868::p_fc("BCLAF1(Y284)", "KN93", dec); 0.001::p_fc("BCLAF1(Y284)", "KN93", inc) :- p_occupancy("BCLAF1(Y284)", "KN93", dec).
0.001::p_fc("BCLAF1(Y284)", "KN93", dec); 0.9980059868::p_fc("BCLAF1(Y284)", "KN93", inc) :- p_occupancy("BCLAF1(Y284)", "KN93", inc).
0.7772786566::p_fc("BCLAF1(Y284)", "Ku0063794", dec); 0.001::p_fc("BCLAF1(Y284)", "Ku0063794", inc) :- p_occupancy("BCLAF1(Y284)", "Ku0063794", dec).
0.001::p_fc("BCLAF1(Y284)", "Ku0063794", dec); 0.7772786566::p_fc("BCLAF1(Y284)", "Ku0063794", inc) :- p_occupancy("BCLAF1(Y284)", "Ku0063794", inc).
0.9905404965::p_fc("BCLAF1(Y284)", "LY2090314", dec); 0.001::p_fc("BCLAF1(Y284)", "LY2090314", inc) :- p_occupancy("BCLAF1(Y284)", "LY2090314", dec).
0.001::p_fc("BCLAF1(Y284)", "LY2090314", dec); 0.9905404965::p_fc("BCLAF1(Y284)", "LY2090314", inc) :- p_occupancy("BCLAF1(Y284)", "LY2090314", inc).
0.9964332869::p_fc("BCLAF1(Y284)", "LY2584702", dec); 0.001::p_fc("BCLAF1(Y284)", "LY2584702", inc) :- p_occupancy("BCLAF1(Y284)", "LY2584702", dec).
0.001::p_fc("BCLAF1(Y284)", "LY2584702", dec); 0.9964332869::p_fc("BCLAF1(Y284)", "LY2584702", inc) :- p_occupancy("BCLAF1(Y284)", "LY2584702", inc).
0.4130264468::p_fc("BCLAF1(Y284)", "LY2835219", dec); 0.001::p_fc("BCLAF1(Y284)", "LY2835219", inc) :- p_occupancy("BCLAF1(Y284)", "LY2835219", dec).
0.001::p_fc("BCLAF1(Y284)", "LY2835219", dec); 0.4130264468::p_fc("BCLAF1(Y284)", "LY2835219", inc) :- p_occupancy("BCLAF1(Y284)", "LY2835219", inc).
0.8776720178::p_fc("BCLAF1(Y284)", "Linsitinib", dec); 0.001::p_fc("BCLAF1(Y284)", "Linsitinib", inc) :- p_occupancy("BCLAF1(Y284)", "Linsitinib", dec).
0.001::p_fc("BCLAF1(Y284)", "Linsitinib", dec); 0.8776720178::p_fc("BCLAF1(Y284)", "Linsitinib", inc) :- p_occupancy("BCLAF1(Y284)", "Linsitinib", inc).
0.9363861577::p_fc("BCLAF1(Y284)", "MK2206", dec); 0.001::p_fc("BCLAF1(Y284)", "MK2206", inc) :- p_occupancy("BCLAF1(Y284)", "MK2206", dec).
0.001::p_fc("BCLAF1(Y284)", "MK2206", dec); 0.9363861577::p_fc("BCLAF1(Y284)", "MK2206", inc) :- p_occupancy("BCLAF1(Y284)", "MK2206", inc).
0.7734964774::p_fc("BCLAF1(Y284)", "NU7441", dec); 0.001::p_fc("BCLAF1(Y284)", "NU7441", inc) :- p_occupancy("BCLAF1(Y284)", "NU7441", dec).
0.001::p_fc("BCLAF1(Y284)", "NU7441", dec); 0.7734964774::p_fc("BCLAF1(Y284)", "NU7441", inc) :- p_occupancy("BCLAF1(Y284)", "NU7441", inc).
0.4331886571::p_fc("BCLAF1(Y284)", "PD153035", dec); 0.001::p_fc("BCLAF1(Y284)", "PD153035", inc) :- p_occupancy("BCLAF1(Y284)", "PD153035", dec).
0.001::p_fc("BCLAF1(Y284)", "PD153035", dec); 0.4331886571::p_fc("BCLAF1(Y284)", "PD153035", inc) :- p_occupancy("BCLAF1(Y284)", "PD153035", inc).
0.0906804555::p_fc("BCLAF1(Y284)", "PF3758309", dec); 0.001::p_fc("BCLAF1(Y284)", "PF3758309", inc) :- p_occupancy("BCLAF1(Y284)", "PF3758309", dec).
0.001::p_fc("BCLAF1(Y284)", "PF3758309", dec); 0.0906804555::p_fc("BCLAF1(Y284)", "PF3758309", inc) :- p_occupancy("BCLAF1(Y284)", "PF3758309", inc).
0.4173057637::p_fc("BCLAF1(Y284)", "PF4708671", dec); 0.001::p_fc("BCLAF1(Y284)", "PF4708671", inc) :- p_occupancy("BCLAF1(Y284)", "PF4708671", dec).
0.001::p_fc("BCLAF1(Y284)", "PF4708671", dec); 0.4173057637::p_fc("BCLAF1(Y284)", "PF4708671", inc) :- p_occupancy("BCLAF1(Y284)", "PF4708671", inc).
0.3392781486::p_fc("BCLAF1(Y284)", "PH797804", dec); 0.001::p_fc("BCLAF1(Y284)", "PH797804", inc) :- p_occupancy("BCLAF1(Y284)", "PH797804", dec).
0.001::p_fc("BCLAF1(Y284)", "PH797804", dec); 0.3392781486::p_fc("BCLAF1(Y284)", "PH797804", inc) :- p_occupancy("BCLAF1(Y284)", "PH797804", inc).
0.4244273244::p_fc("BCLAF1(Y284)", "PIK294", dec); 0.001::p_fc("BCLAF1(Y284)", "PIK294", inc) :- p_occupancy("BCLAF1(Y284)", "PIK294", dec).
0.001::p_fc("BCLAF1(Y284)", "PIK294", dec); 0.4244273244::p_fc("BCLAF1(Y284)", "PIK294", inc) :- p_occupancy("BCLAF1(Y284)", "PIK294", inc).
0.9735828955::p_fc("BCLAF1(Y284)", "Ribociclib", dec); 0.001::p_fc("BCLAF1(Y284)", "Ribociclib", inc) :- p_occupancy("BCLAF1(Y284)", "Ribociclib", dec).
0.001::p_fc("BCLAF1(Y284)", "Ribociclib", dec); 0.9735828955::p_fc("BCLAF1(Y284)", "Ribociclib", inc) :- p_occupancy("BCLAF1(Y284)", "Ribociclib", inc).
0.9848446819::p_fc("BCLAF1(Y284)", "Ripasudil", dec); 0.001::p_fc("BCLAF1(Y284)", "Ripasudil", inc) :- p_occupancy("BCLAF1(Y284)", "Ripasudil", dec).
0.001::p_fc("BCLAF1(Y284)", "Ripasudil", dec); 0.9848446819::p_fc("BCLAF1(Y284)", "Ripasudil", inc) :- p_occupancy("BCLAF1(Y284)", "Ripasudil", inc).
0.9837662543::p_fc("BCLAF1(Y284)", "SP600125", dec); 0.001::p_fc("BCLAF1(Y284)", "SP600125", inc) :- p_occupancy("BCLAF1(Y284)", "SP600125", dec).
0.001::p_fc("BCLAF1(Y284)", "SP600125", dec); 0.9837662543::p_fc("BCLAF1(Y284)", "SP600125", inc) :- p_occupancy("BCLAF1(Y284)", "SP600125", inc).
0.9153763693::p_fc("BCLAF1(Y284)", "Selumetinib", dec); 0.001::p_fc("BCLAF1(Y284)", "Selumetinib", inc) :- p_occupancy("BCLAF1(Y284)", "Selumetinib", dec).
0.001::p_fc("BCLAF1(Y284)", "Selumetinib", dec); 0.9153763693::p_fc("BCLAF1(Y284)", "Selumetinib", inc) :- p_occupancy("BCLAF1(Y284)", "Selumetinib", inc).
0.9621946981::p_fc("BCLAF1(Y284)", "TAK715", dec); 0.001::p_fc("BCLAF1(Y284)", "TAK715", inc) :- p_occupancy("BCLAF1(Y284)", "TAK715", dec).
0.001::p_fc("BCLAF1(Y284)", "TAK715", dec); 0.9621946981::p_fc("BCLAF1(Y284)", "TAK715", inc) :- p_occupancy("BCLAF1(Y284)", "TAK715", inc).
0.9766986094::p_fc("BCLAF1(Y284)", "TBCA", dec); 0.001::p_fc("BCLAF1(Y284)", "TBCA", inc) :- p_occupancy("BCLAF1(Y284)", "TBCA", dec).
0.001::p_fc("BCLAF1(Y284)", "TBCA", dec); 0.9766986094::p_fc("BCLAF1(Y284)", "TBCA", inc) :- p_occupancy("BCLAF1(Y284)", "TBCA", inc).
0.6392320989::p_fc("BCLAF1(Y284)", "TGX221", dec); 0.001::p_fc("BCLAF1(Y284)", "TGX221", inc) :- p_occupancy("BCLAF1(Y284)", "TGX221", dec).
0.001::p_fc("BCLAF1(Y284)", "TGX221", dec); 0.6392320989::p_fc("BCLAF1(Y284)", "TGX221", inc) :- p_occupancy("BCLAF1(Y284)", "TGX221", inc).
0.6348840029::p_fc("BCLAF1(Y284)", "Tofacitinib", dec); 0.001::p_fc("BCLAF1(Y284)", "Tofacitinib", inc) :- p_occupancy("BCLAF1(Y284)", "Tofacitinib", dec).
0.001::p_fc("BCLAF1(Y284)", "Tofacitinib", dec); 0.6348840029::p_fc("BCLAF1(Y284)", "Tofacitinib", inc) :- p_occupancy("BCLAF1(Y284)", "Tofacitinib", inc).
0.5422012697::p_fc("BCLAF1(Y284)", "Torin", dec); 0.001::p_fc("BCLAF1(Y284)", "Torin", inc) :- p_occupancy("BCLAF1(Y284)", "Torin", dec).
0.001::p_fc("BCLAF1(Y284)", "Torin", dec); 0.5422012697::p_fc("BCLAF1(Y284)", "Torin", inc) :- p_occupancy("BCLAF1(Y284)", "Torin", inc).
0.2174443404::p_fc("BCLAF1(Y284)", "Trametinib", dec); 0.001::p_fc("BCLAF1(Y284)", "Trametinib", inc) :- p_occupancy("BCLAF1(Y284)", "Trametinib", dec).
0.001::p_fc("BCLAF1(Y284)", "Trametinib", dec); 0.2174443404::p_fc("BCLAF1(Y284)", "Trametinib", inc) :- p_occupancy("BCLAF1(Y284)", "Trametinib", inc).
0.8253276785::p_fc("BCLAF1(Y284)", "U73122", dec); 0.001::p_fc("BCLAF1(Y284)", "U73122", inc) :- p_occupancy("BCLAF1(Y284)", "U73122", dec).
0.001::p_fc("BCLAF1(Y284)", "U73122", dec); 0.8253276785::p_fc("BCLAF1(Y284)", "U73122", inc) :- p_occupancy("BCLAF1(Y284)", "U73122", inc).
0.109882206::p_fc("BCLAF1(Y284)", "Ulixertinib", dec); 0.001::p_fc("BCLAF1(Y284)", "Ulixertinib", inc) :- p_occupancy("BCLAF1(Y284)", "Ulixertinib", dec).
0.001::p_fc("BCLAF1(Y284)", "Ulixertinib", dec); 0.109882206::p_fc("BCLAF1(Y284)", "Ulixertinib", inc) :- p_occupancy("BCLAF1(Y284)", "Ulixertinib", inc).
0.9281350262::p_fc("BCLAF1(Y284)", "Vemurafenib", dec); 0.001::p_fc("BCLAF1(Y284)", "Vemurafenib", inc) :- p_occupancy("BCLAF1(Y284)", "Vemurafenib", dec).
0.001::p_fc("BCLAF1(Y284)", "Vemurafenib", dec); 0.9281350262::p_fc("BCLAF1(Y284)", "Vemurafenib", inc) :- p_occupancy("BCLAF1(Y284)", "Vemurafenib", inc).
0.6601432091::p_fc("HIPK2(Y361)", "AC220", dec); 0.001::p_fc("HIPK2(Y361)", "AC220", inc) :- p_occupancy("HIPK2(Y361)", "AC220", dec).
0.001::p_fc("HIPK2(Y361)", "AC220", dec); 0.6601432091::p_fc("HIPK2(Y361)", "AC220", inc) :- p_occupancy("HIPK2(Y361)", "AC220", inc).
0.0540873712::p_fc("HIPK2(Y361)", "AT13148", dec); 0.001::p_fc("HIPK2(Y361)", "AT13148", inc) :- p_occupancy("HIPK2(Y361)", "AT13148", dec).
0.001::p_fc("HIPK2(Y361)", "AT13148", dec); 0.0540873712::p_fc("HIPK2(Y361)", "AT13148", inc) :- p_occupancy("HIPK2(Y361)", "AT13148", inc).
0.8995910758::p_fc("HIPK2(Y361)", "AZ20", dec); 0.001::p_fc("HIPK2(Y361)", "AZ20", inc) :- p_occupancy("HIPK2(Y361)", "AZ20", dec).
0.001::p_fc("HIPK2(Y361)", "AZ20", dec); 0.8995910758::p_fc("HIPK2(Y361)", "AZ20", inc) :- p_occupancy("HIPK2(Y361)", "AZ20", inc).
0.3467336048::p_fc("HIPK2(Y361)", "AZD1480", dec); 0.001::p_fc("HIPK2(Y361)", "AZD1480", inc) :- p_occupancy("HIPK2(Y361)", "AZD1480", dec).
0.001::p_fc("HIPK2(Y361)", "AZD1480", dec); 0.3467336048::p_fc("HIPK2(Y361)", "AZD1480", inc) :- p_occupancy("HIPK2(Y361)", "AZD1480", inc).
0.9922743948::p_fc("HIPK2(Y361)", "AZD3759", dec); 0.001::p_fc("HIPK2(Y361)", "AZD3759", inc) :- p_occupancy("HIPK2(Y361)", "AZD3759", dec).
0.001::p_fc("HIPK2(Y361)", "AZD3759", dec); 0.9922743948::p_fc("HIPK2(Y361)", "AZD3759", inc) :- p_occupancy("HIPK2(Y361)", "AZD3759", inc).
0.7457152554::p_fc("HIPK2(Y361)", "AZD5363", dec); 0.001::p_fc("HIPK2(Y361)", "AZD5363", inc) :- p_occupancy("HIPK2(Y361)", "AZD5363", dec).
0.001::p_fc("HIPK2(Y361)", "AZD5363", dec); 0.7457152554::p_fc("HIPK2(Y361)", "AZD5363", inc) :- p_occupancy("HIPK2(Y361)", "AZD5363", inc).
0.4581002731::p_fc("HIPK2(Y361)", "AZD5438", dec); 0.001::p_fc("HIPK2(Y361)", "AZD5438", inc) :- p_occupancy("HIPK2(Y361)", "AZD5438", dec).
0.001::p_fc("HIPK2(Y361)", "AZD5438", dec); 0.4581002731::p_fc("HIPK2(Y361)", "AZD5438", inc) :- p_occupancy("HIPK2(Y361)", "AZD5438", inc).
0.214018877::p_fc("HIPK2(Y361)", "AZD6482", dec); 0.001::p_fc("HIPK2(Y361)", "AZD6482", inc) :- p_occupancy("HIPK2(Y361)", "AZD6482", dec).
0.001::p_fc("HIPK2(Y361)", "AZD6482", dec); 0.214018877::p_fc("HIPK2(Y361)", "AZD6482", inc) :- p_occupancy("HIPK2(Y361)", "AZD6482", inc).
0.43971308::p_fc("HIPK2(Y361)", "AZD6738", dec); 0.001::p_fc("HIPK2(Y361)", "AZD6738", inc) :- p_occupancy("HIPK2(Y361)", "AZD6738", dec).
0.001::p_fc("HIPK2(Y361)", "AZD6738", dec); 0.43971308::p_fc("HIPK2(Y361)", "AZD6738", inc) :- p_occupancy("HIPK2(Y361)", "AZD6738", inc).
0.9978017357::p_fc("HIPK2(Y361)", "AZD8055", dec); 0.001::p_fc("HIPK2(Y361)", "AZD8055", inc) :- p_occupancy("HIPK2(Y361)", "AZD8055", dec).
0.001::p_fc("HIPK2(Y361)", "AZD8055", dec); 0.9978017357::p_fc("HIPK2(Y361)", "AZD8055", inc) :- p_occupancy("HIPK2(Y361)", "AZD8055", inc).
0.9884633185::p_fc("HIPK2(Y361)", "Amuvatinib", dec); 0.001::p_fc("HIPK2(Y361)", "Amuvatinib", inc) :- p_occupancy("HIPK2(Y361)", "Amuvatinib", dec).
0.001::p_fc("HIPK2(Y361)", "Amuvatinib", dec); 0.9884633185::p_fc("HIPK2(Y361)", "Amuvatinib", inc) :- p_occupancy("HIPK2(Y361)", "Amuvatinib", inc).
0.6283836007::p_fc("HIPK2(Y361)", "BX912", dec); 0.001::p_fc("HIPK2(Y361)", "BX912", inc) :- p_occupancy("HIPK2(Y361)", "BX912", dec).
0.001::p_fc("HIPK2(Y361)", "BX912", dec); 0.6283836007::p_fc("HIPK2(Y361)", "BX912", inc) :- p_occupancy("HIPK2(Y361)", "BX912", inc).
0.6117392707::p_fc("HIPK2(Y361)", "Bosutinib", dec); 0.001::p_fc("HIPK2(Y361)", "Bosutinib", inc) :- p_occupancy("HIPK2(Y361)", "Bosutinib", dec).
0.001::p_fc("HIPK2(Y361)", "Bosutinib", dec); 0.6117392707::p_fc("HIPK2(Y361)", "Bosutinib", inc) :- p_occupancy("HIPK2(Y361)", "Bosutinib", inc).
0.3082409791::p_fc("HIPK2(Y361)", "CAL101", dec); 0.001::p_fc("HIPK2(Y361)", "CAL101", inc) :- p_occupancy("HIPK2(Y361)", "CAL101", dec).
0.001::p_fc("HIPK2(Y361)", "CAL101", dec); 0.3082409791::p_fc("HIPK2(Y361)", "CAL101", inc) :- p_occupancy("HIPK2(Y361)", "CAL101", inc).
0.7444465218::p_fc("HIPK2(Y361)", "CHIR99021", dec); 0.001::p_fc("HIPK2(Y361)", "CHIR99021", inc) :- p_occupancy("HIPK2(Y361)", "CHIR99021", dec).
0.001::p_fc("HIPK2(Y361)", "CHIR99021", dec); 0.7444465218::p_fc("HIPK2(Y361)", "CHIR99021", inc) :- p_occupancy("HIPK2(Y361)", "CHIR99021", inc).
0.7462608922::p_fc("HIPK2(Y361)", "CX4945", dec); 0.001::p_fc("HIPK2(Y361)", "CX4945", inc) :- p_occupancy("HIPK2(Y361)", "CX4945", dec).
0.001::p_fc("HIPK2(Y361)", "CX4945", dec); 0.7462608922::p_fc("HIPK2(Y361)", "CX4945", inc) :- p_occupancy("HIPK2(Y361)", "CX4945", inc).
0.1764094416::p_fc("HIPK2(Y361)", "DNAPK", dec); 0.001::p_fc("HIPK2(Y361)", "DNAPK", inc) :- p_occupancy("HIPK2(Y361)", "DNAPK", dec).
0.001::p_fc("HIPK2(Y361)", "DNAPK", dec); 0.1764094416::p_fc("HIPK2(Y361)", "DNAPK", inc) :- p_occupancy("HIPK2(Y361)", "DNAPK", inc).
0.3826924965::p_fc("HIPK2(Y361)", "Dabrafenib", dec); 0.001::p_fc("HIPK2(Y361)", "Dabrafenib", inc) :- p_occupancy("HIPK2(Y361)", "Dabrafenib", dec).
0.001::p_fc("HIPK2(Y361)", "Dabrafenib", dec); 0.3826924965::p_fc("HIPK2(Y361)", "Dabrafenib", inc) :- p_occupancy("HIPK2(Y361)", "Dabrafenib", inc).
0.0266010867::p_fc("HIPK2(Y361)", "Dasatinib", dec); 0.001::p_fc("HIPK2(Y361)", "Dasatinib", inc) :- p_occupancy("HIPK2(Y361)", "Dasatinib", dec).
0.001::p_fc("HIPK2(Y361)", "Dasatinib", dec); 0.0266010867::p_fc("HIPK2(Y361)", "Dasatinib", inc) :- p_occupancy("HIPK2(Y361)", "Dasatinib", inc).
0.7219658301::p_fc("HIPK2(Y361)", "Edelfosine", dec); 0.001::p_fc("HIPK2(Y361)", "Edelfosine", inc) :- p_occupancy("HIPK2(Y361)", "Edelfosine", dec).
0.001::p_fc("HIPK2(Y361)", "Edelfosine", dec); 0.7219658301::p_fc("HIPK2(Y361)", "Edelfosine", inc) :- p_occupancy("HIPK2(Y361)", "Edelfosine", inc).
0.4899333383::p_fc("HIPK2(Y361)", "FRAX486", dec); 0.001::p_fc("HIPK2(Y361)", "FRAX486", inc) :- p_occupancy("HIPK2(Y361)", "FRAX486", dec).
0.001::p_fc("HIPK2(Y361)", "FRAX486", dec); 0.4899333383::p_fc("HIPK2(Y361)", "FRAX486", inc) :- p_occupancy("HIPK2(Y361)", "FRAX486", inc).
0.7975376563::p_fc("HIPK2(Y361)", "GDC0941", dec); 0.001::p_fc("HIPK2(Y361)", "GDC0941", inc) :- p_occupancy("HIPK2(Y361)", "GDC0941", dec).
0.001::p_fc("HIPK2(Y361)", "GDC0941", dec); 0.7975376563::p_fc("HIPK2(Y361)", "GDC0941", inc) :- p_occupancy("HIPK2(Y361)", "GDC0941", inc).
0.7561796597::p_fc("HIPK2(Y361)", "GDC0994", dec); 0.001::p_fc("HIPK2(Y361)", "GDC0994", inc) :- p_occupancy("HIPK2(Y361)", "GDC0994", dec).
0.001::p_fc("HIPK2(Y361)", "GDC0994", dec); 0.7561796597::p_fc("HIPK2(Y361)", "GDC0994", inc) :- p_occupancy("HIPK2(Y361)", "GDC0994", inc).
0.888481358::p_fc("HIPK2(Y361)", "GF109203X", dec); 0.001::p_fc("HIPK2(Y361)", "GF109203X", inc) :- p_occupancy("HIPK2(Y361)", "GF109203X", dec).
0.001::p_fc("HIPK2(Y361)", "GF109203X", dec); 0.888481358::p_fc("HIPK2(Y361)", "GF109203X", inc) :- p_occupancy("HIPK2(Y361)", "GF109203X", inc).
0.7239402729::p_fc("HIPK2(Y361)", "GO6983", dec); 0.001::p_fc("HIPK2(Y361)", "GO6983", inc) :- p_occupancy("HIPK2(Y361)", "GO6983", dec).
0.001::p_fc("HIPK2(Y361)", "GO6983", dec); 0.7239402729::p_fc("HIPK2(Y361)", "GO6983", inc) :- p_occupancy("HIPK2(Y361)", "GO6983", inc).
0.9977995066::p_fc("HIPK2(Y361)", "GSK2334470", dec); 0.001::p_fc("HIPK2(Y361)", "GSK2334470", inc) :- p_occupancy("HIPK2(Y361)", "GSK2334470", dec).
0.001::p_fc("HIPK2(Y361)", "GSK2334470", dec); 0.9977995066::p_fc("HIPK2(Y361)", "GSK2334470", inc) :- p_occupancy("HIPK2(Y361)", "GSK2334470", inc).
0.7364769066::p_fc("HIPK2(Y361)", "GSK690693", dec); 0.001::p_fc("HIPK2(Y361)", "GSK690693", inc) :- p_occupancy("HIPK2(Y361)", "GSK690693", dec).
0.001::p_fc("HIPK2(Y361)", "GSK690693", dec); 0.7364769066::p_fc("HIPK2(Y361)", "GSK690693", inc) :- p_occupancy("HIPK2(Y361)", "GSK690693", inc).
0.1967453814::p_fc("HIPK2(Y361)", "Go6976", dec); 0.001::p_fc("HIPK2(Y361)", "Go6976", inc) :- p_occupancy("HIPK2(Y361)", "Go6976", dec).
0.001::p_fc("HIPK2(Y361)", "Go6976", dec); 0.1967453814::p_fc("HIPK2(Y361)", "Go6976", inc) :- p_occupancy("HIPK2(Y361)", "Go6976", inc).
0.2224575225::p_fc("HIPK2(Y361)", "H89", dec); 0.001::p_fc("HIPK2(Y361)", "H89", inc) :- p_occupancy("HIPK2(Y361)", "H89", dec).
0.001::p_fc("HIPK2(Y361)", "H89", dec); 0.2224575225::p_fc("HIPK2(Y361)", "H89", inc) :- p_occupancy("HIPK2(Y361)", "H89", inc).
0.7572004228::p_fc("HIPK2(Y361)", "HS173", dec); 0.001::p_fc("HIPK2(Y361)", "HS173", inc) :- p_occupancy("HIPK2(Y361)", "HS173", dec).
0.001::p_fc("HIPK2(Y361)", "HS173", dec); 0.7572004228::p_fc("HIPK2(Y361)", "HS173", inc) :- p_occupancy("HIPK2(Y361)", "HS173", inc).
0.6083738486::p_fc("HIPK2(Y361)", "Ipatasertib", dec); 0.001::p_fc("HIPK2(Y361)", "Ipatasertib", inc) :- p_occupancy("HIPK2(Y361)", "Ipatasertib", dec).
0.001::p_fc("HIPK2(Y361)", "Ipatasertib", dec); 0.6083738486::p_fc("HIPK2(Y361)", "Ipatasertib", inc) :- p_occupancy("HIPK2(Y361)", "Ipatasertib", inc).
0.4594401836::p_fc("HIPK2(Y361)", "JNJ", dec); 0.001::p_fc("HIPK2(Y361)", "JNJ", inc) :- p_occupancy("HIPK2(Y361)", "JNJ", dec).
0.001::p_fc("HIPK2(Y361)", "JNJ", dec); 0.4594401836::p_fc("HIPK2(Y361)", "JNJ", inc) :- p_occupancy("HIPK2(Y361)", "JNJ", inc).
0.7367651637::p_fc("HIPK2(Y361)", "JNK", dec); 0.001::p_fc("HIPK2(Y361)", "JNK", inc) :- p_occupancy("HIPK2(Y361)", "JNK", dec).
0.001::p_fc("HIPK2(Y361)", "JNK", dec); 0.7367651637::p_fc("HIPK2(Y361)", "JNK", inc) :- p_occupancy("HIPK2(Y361)", "JNK", inc).
0.7113575644::p_fc("HIPK2(Y361)", "KD025", dec); 0.001::p_fc("HIPK2(Y361)", "KD025", inc) :- p_occupancy("HIPK2(Y361)", "KD025", dec).
0.001::p_fc("HIPK2(Y361)", "KD025", dec); 0.7113575644::p_fc("HIPK2(Y361)", "KD025", inc) :- p_occupancy("HIPK2(Y361)", "KD025", inc).
0.7378426618::p_fc("HIPK2(Y361)", "KN62", dec); 0.001::p_fc("HIPK2(Y361)", "KN62", inc) :- p_occupancy("HIPK2(Y361)", "KN62", dec).
0.001::p_fc("HIPK2(Y361)", "KN62", dec); 0.7378426618::p_fc("HIPK2(Y361)", "KN62", inc) :- p_occupancy("HIPK2(Y361)", "KN62", inc).
0.6574964079::p_fc("HIPK2(Y361)", "KN93", dec); 0.001::p_fc("HIPK2(Y361)", "KN93", inc) :- p_occupancy("HIPK2(Y361)", "KN93", dec).
0.001::p_fc("HIPK2(Y361)", "KN93", dec); 0.6574964079::p_fc("HIPK2(Y361)", "KN93", inc) :- p_occupancy("HIPK2(Y361)", "KN93", inc).
0.8492259904::p_fc("HIPK2(Y361)", "Ku0063794", dec); 0.001::p_fc("HIPK2(Y361)", "Ku0063794", inc) :- p_occupancy("HIPK2(Y361)", "Ku0063794", dec).
0.001::p_fc("HIPK2(Y361)", "Ku0063794", dec); 0.8492259904::p_fc("HIPK2(Y361)", "Ku0063794", inc) :- p_occupancy("HIPK2(Y361)", "Ku0063794", inc).
0.4785446895::p_fc("HIPK2(Y361)", "LY2090314", dec); 0.001::p_fc("HIPK2(Y361)", "LY2090314", inc) :- p_occupancy("HIPK2(Y361)", "LY2090314", dec).
0.001::p_fc("HIPK2(Y361)", "LY2090314", dec); 0.4785446895::p_fc("HIPK2(Y361)", "LY2090314", inc) :- p_occupancy("HIPK2(Y361)", "LY2090314", inc).
0.5925832579::p_fc("HIPK2(Y361)", "LY2584702", dec); 0.001::p_fc("HIPK2(Y361)", "LY2584702", inc) :- p_occupancy("HIPK2(Y361)", "LY2584702", dec).
0.001::p_fc("HIPK2(Y361)", "LY2584702", dec); 0.5925832579::p_fc("HIPK2(Y361)", "LY2584702", inc) :- p_occupancy("HIPK2(Y361)", "LY2584702", inc).
0.2707849491::p_fc("HIPK2(Y361)", "LY2835219", dec); 0.001::p_fc("HIPK2(Y361)", "LY2835219", inc) :- p_occupancy("HIPK2(Y361)", "LY2835219", dec).
0.001::p_fc("HIPK2(Y361)", "LY2835219", dec); 0.2707849491::p_fc("HIPK2(Y361)", "LY2835219", inc) :- p_occupancy("HIPK2(Y361)", "LY2835219", inc).
0.8062140213::p_fc("HIPK2(Y361)", "Linsitinib", dec); 0.001::p_fc("HIPK2(Y361)", "Linsitinib", inc) :- p_occupancy("HIPK2(Y361)", "Linsitinib", dec).
0.001::p_fc("HIPK2(Y361)", "Linsitinib", dec); 0.8062140213::p_fc("HIPK2(Y361)", "Linsitinib", inc) :- p_occupancy("HIPK2(Y361)", "Linsitinib", inc).
0.1697008126::p_fc("HIPK2(Y361)", "MK2206", dec); 0.001::p_fc("HIPK2(Y361)", "MK2206", inc) :- p_occupancy("HIPK2(Y361)", "MK2206", dec).
0.001::p_fc("HIPK2(Y361)", "MK2206", dec); 0.1697008126::p_fc("HIPK2(Y361)", "MK2206", inc) :- p_occupancy("HIPK2(Y361)", "MK2206", inc).
0.4799792747::p_fc("HIPK2(Y361)", "NU7441", dec); 0.001::p_fc("HIPK2(Y361)", "NU7441", inc) :- p_occupancy("HIPK2(Y361)", "NU7441", dec).
0.001::p_fc("HIPK2(Y361)", "NU7441", dec); 0.4799792747::p_fc("HIPK2(Y361)", "NU7441", inc) :- p_occupancy("HIPK2(Y361)", "NU7441", inc).
0.1652044736::p_fc("HIPK2(Y361)", "PD153035", dec); 0.001::p_fc("HIPK2(Y361)", "PD153035", inc) :- p_occupancy("HIPK2(Y361)", "PD153035", dec).
0.001::p_fc("HIPK2(Y361)", "PD153035", dec); 0.1652044736::p_fc("HIPK2(Y361)", "PD153035", inc) :- p_occupancy("HIPK2(Y361)", "PD153035", inc).
0.998005967::p_fc("HIPK2(Y361)", "PF3758309", dec); 0.001::p_fc("HIPK2(Y361)", "PF3758309", inc) :- p_occupancy("HIPK2(Y361)", "PF3758309", dec).
0.001::p_fc("HIPK2(Y361)", "PF3758309", dec); 0.998005967::p_fc("HIPK2(Y361)", "PF3758309", inc) :- p_occupancy("HIPK2(Y361)", "PF3758309", inc).
0.8511966434::p_fc("HIPK2(Y361)", "PF4708671", dec); 0.001::p_fc("HIPK2(Y361)", "PF4708671", inc) :- p_occupancy("HIPK2(Y361)", "PF4708671", dec).
0.001::p_fc("HIPK2(Y361)", "PF4708671", dec); 0.8511966434::p_fc("HIPK2(Y361)", "PF4708671", inc) :- p_occupancy("HIPK2(Y361)", "PF4708671", inc).
0.5763981425::p_fc("HIPK2(Y361)", "PH797804", dec); 0.001::p_fc("HIPK2(Y361)", "PH797804", inc) :- p_occupancy("HIPK2(Y361)", "PH797804", dec).
0.001::p_fc("HIPK2(Y361)", "PH797804", dec); 0.5763981425::p_fc("HIPK2(Y361)", "PH797804", inc) :- p_occupancy("HIPK2(Y361)", "PH797804", inc).
0.494329657::p_fc("HIPK2(Y361)", "PIK294", dec); 0.001::p_fc("HIPK2(Y361)", "PIK294", inc) :- p_occupancy("HIPK2(Y361)", "PIK294", dec).
0.001::p_fc("HIPK2(Y361)", "PIK294", dec); 0.494329657::p_fc("HIPK2(Y361)", "PIK294", inc) :- p_occupancy("HIPK2(Y361)", "PIK294", inc).
0.7557064448::p_fc("HIPK2(Y361)", "Ribociclib", dec); 0.001::p_fc("HIPK2(Y361)", "Ribociclib", inc) :- p_occupancy("HIPK2(Y361)", "Ribociclib", dec).
0.001::p_fc("HIPK2(Y361)", "Ribociclib", dec); 0.7557064448::p_fc("HIPK2(Y361)", "Ribociclib", inc) :- p_occupancy("HIPK2(Y361)", "Ribociclib", inc).
0.1415724726::p_fc("HIPK2(Y361)", "Ripasudil", dec); 0.001::p_fc("HIPK2(Y361)", "Ripasudil", inc) :- p_occupancy("HIPK2(Y361)", "Ripasudil", dec).
0.001::p_fc("HIPK2(Y361)", "Ripasudil", dec); 0.1415724726::p_fc("HIPK2(Y361)", "Ripasudil", inc) :- p_occupancy("HIPK2(Y361)", "Ripasudil", inc).
0.7920702929::p_fc("HIPK2(Y361)", "SP600125", dec); 0.001::p_fc("HIPK2(Y361)", "SP600125", inc) :- p_occupancy("HIPK2(Y361)", "SP600125", dec).
0.001::p_fc("HIPK2(Y361)", "SP600125", dec); 0.7920702929::p_fc("HIPK2(Y361)", "SP600125", inc) :- p_occupancy("HIPK2(Y361)", "SP600125", inc).
0.2301846744::p_fc("HIPK2(Y361)", "Selumetinib", dec); 0.001::p_fc("HIPK2(Y361)", "Selumetinib", inc) :- p_occupancy("HIPK2(Y361)", "Selumetinib", dec).
0.001::p_fc("HIPK2(Y361)", "Selumetinib", dec); 0.2301846744::p_fc("HIPK2(Y361)", "Selumetinib", inc) :- p_occupancy("HIPK2(Y361)", "Selumetinib", inc).
0.4506890702::p_fc("HIPK2(Y361)", "TAK715", dec); 0.001::p_fc("HIPK2(Y361)", "TAK715", inc) :- p_occupancy("HIPK2(Y361)", "TAK715", dec).
0.001::p_fc("HIPK2(Y361)", "TAK715", dec); 0.4506890702::p_fc("HIPK2(Y361)", "TAK715", inc) :- p_occupancy("HIPK2(Y361)", "TAK715", inc).
0.4978549827::p_fc("HIPK2(Y361)", "TBCA", dec); 0.001::p_fc("HIPK2(Y361)", "TBCA", inc) :- p_occupancy("HIPK2(Y361)", "TBCA", dec).
0.001::p_fc("HIPK2(Y361)", "TBCA", dec); 0.4978549827::p_fc("HIPK2(Y361)", "TBCA", inc) :- p_occupancy("HIPK2(Y361)", "TBCA", inc).
0.3253547755::p_fc("HIPK2(Y361)", "TGX221", dec); 0.001::p_fc("HIPK2(Y361)", "TGX221", inc) :- p_occupancy("HIPK2(Y361)", "TGX221", dec).
0.001::p_fc("HIPK2(Y361)", "TGX221", dec); 0.3253547755::p_fc("HIPK2(Y361)", "TGX221", inc) :- p_occupancy("HIPK2(Y361)", "TGX221", inc).
0.5365326739::p_fc("HIPK2(Y361)", "Tofacitinib", dec); 0.001::p_fc("HIPK2(Y361)", "Tofacitinib", inc) :- p_occupancy("HIPK2(Y361)", "Tofacitinib", dec).
0.001::p_fc("HIPK2(Y361)", "Tofacitinib", dec); 0.5365326739::p_fc("HIPK2(Y361)", "Tofacitinib", inc) :- p_occupancy("HIPK2(Y361)", "Tofacitinib", inc).
0.92884092::p_fc("HIPK2(Y361)", "Torin", dec); 0.001::p_fc("HIPK2(Y361)", "Torin", inc) :- p_occupancy("HIPK2(Y361)", "Torin", dec).
0.001::p_fc("HIPK2(Y361)", "Torin", dec); 0.92884092::p_fc("HIPK2(Y361)", "Torin", inc) :- p_occupancy("HIPK2(Y361)", "Torin", inc).
0.3551272103::p_fc("HIPK2(Y361)", "Trametinib", dec); 0.001::p_fc("HIPK2(Y361)", "Trametinib", inc) :- p_occupancy("HIPK2(Y361)", "Trametinib", dec).
0.001::p_fc("HIPK2(Y361)", "Trametinib", dec); 0.3551272103::p_fc("HIPK2(Y361)", "Trametinib", inc) :- p_occupancy("HIPK2(Y361)", "Trametinib", inc).
0.8400465171::p_fc("HIPK2(Y361)", "U73122", dec); 0.001::p_fc("HIPK2(Y361)", "U73122", inc) :- p_occupancy("HIPK2(Y361)", "U73122", dec).
0.001::p_fc("HIPK2(Y361)", "U73122", dec); 0.8400465171::p_fc("HIPK2(Y361)", "U73122", inc) :- p_occupancy("HIPK2(Y361)", "U73122", inc).
0.7580042715::p_fc("HIPK2(Y361)", "Ulixertinib", dec); 0.001::p_fc("HIPK2(Y361)", "Ulixertinib", inc) :- p_occupancy("HIPK2(Y361)", "Ulixertinib", dec).
0.001::p_fc("HIPK2(Y361)", "Ulixertinib", dec); 0.7580042715::p_fc("HIPK2(Y361)", "Ulixertinib", inc) :- p_occupancy("HIPK2(Y361)", "Ulixertinib", inc).
0.016139198::p_fc("HIPK2(Y361)", "Vemurafenib", dec); 0.001::p_fc("HIPK2(Y361)", "Vemurafenib", inc) :- p_occupancy("HIPK2(Y361)", "Vemurafenib", dec).
0.001::p_fc("HIPK2(Y361)", "Vemurafenib", dec); 0.016139198::p_fc("HIPK2(Y361)", "Vemurafenib", inc) :- p_occupancy("HIPK2(Y361)", "Vemurafenib", inc).
0.7183018673::p_fc("PTK2(S29)", "AC220", dec); 0.001::p_fc("PTK2(S29)", "AC220", inc) :- p_occupancy("PTK2(S29)", "AC220", dec).
0.001::p_fc("PTK2(S29)", "AC220", dec); 0.7183018673::p_fc("PTK2(S29)", "AC220", inc) :- p_occupancy("PTK2(S29)", "AC220", inc).
0.4879365781::p_fc("PTK2(S29)", "AT13148", dec); 0.001::p_fc("PTK2(S29)", "AT13148", inc) :- p_occupancy("PTK2(S29)", "AT13148", dec).
0.001::p_fc("PTK2(S29)", "AT13148", dec); 0.4879365781::p_fc("PTK2(S29)", "AT13148", inc) :- p_occupancy("PTK2(S29)", "AT13148", inc).
0.3658912652::p_fc("PTK2(S29)", "AZ20", dec); 0.001::p_fc("PTK2(S29)", "AZ20", inc) :- p_occupancy("PTK2(S29)", "AZ20", dec).
0.001::p_fc("PTK2(S29)", "AZ20", dec); 0.3658912652::p_fc("PTK2(S29)", "AZ20", inc) :- p_occupancy("PTK2(S29)", "AZ20", inc).
0.8716697501::p_fc("PTK2(S29)", "AZD1480", dec); 0.001::p_fc("PTK2(S29)", "AZD1480", inc) :- p_occupancy("PTK2(S29)", "AZD1480", dec).
0.001::p_fc("PTK2(S29)", "AZD1480", dec); 0.8716697501::p_fc("PTK2(S29)", "AZD1480", inc) :- p_occupancy("PTK2(S29)", "AZD1480", inc).
0.4785592493::p_fc("PTK2(S29)", "AZD3759", dec); 0.001::p_fc("PTK2(S29)", "AZD3759", inc) :- p_occupancy("PTK2(S29)", "AZD3759", dec).
0.001::p_fc("PTK2(S29)", "AZD3759", dec); 0.4785592493::p_fc("PTK2(S29)", "AZD3759", inc) :- p_occupancy("PTK2(S29)", "AZD3759", inc).
0.6534581509::p_fc("PTK2(S29)", "AZD5363", dec); 0.001::p_fc("PTK2(S29)", "AZD5363", inc) :- p_occupancy("PTK2(S29)", "AZD5363", dec).
0.001::p_fc("PTK2(S29)", "AZD5363", dec); 0.6534581509::p_fc("PTK2(S29)", "AZD5363", inc) :- p_occupancy("PTK2(S29)", "AZD5363", inc).
0.4513802637::p_fc("PTK2(S29)", "AZD5438", dec); 0.001::p_fc("PTK2(S29)", "AZD5438", inc) :- p_occupancy("PTK2(S29)", "AZD5438", dec).
0.001::p_fc("PTK2(S29)", "AZD5438", dec); 0.4513802637::p_fc("PTK2(S29)", "AZD5438", inc) :- p_occupancy("PTK2(S29)", "AZD5438", inc).
0.1966381473::p_fc("PTK2(S29)", "AZD6482", dec); 0.001::p_fc("PTK2(S29)", "AZD6482", inc) :- p_occupancy("PTK2(S29)", "AZD6482", dec).
0.001::p_fc("PTK2(S29)", "AZD6482", dec); 0.1966381473::p_fc("PTK2(S29)", "AZD6482", inc) :- p_occupancy("PTK2(S29)", "AZD6482", inc).
0.0189162973::p_fc("PTK2(S29)", "AZD6738", dec); 0.001::p_fc("PTK2(S29)", "AZD6738", inc) :- p_occupancy("PTK2(S29)", "AZD6738", dec).
0.001::p_fc("PTK2(S29)", "AZD6738", dec); 0.0189162973::p_fc("PTK2(S29)", "AZD6738", inc) :- p_occupancy("PTK2(S29)", "AZD6738", inc).
0.8961020321::p_fc("PTK2(S29)", "AZD8055", dec); 0.001::p_fc("PTK2(S29)", "AZD8055", inc) :- p_occupancy("PTK2(S29)", "AZD8055", dec).
0.001::p_fc("PTK2(S29)", "AZD8055", dec); 0.8961020321::p_fc("PTK2(S29)", "AZD8055", inc) :- p_occupancy("PTK2(S29)", "AZD8055", inc).
0.9934028504::p_fc("PTK2(S29)", "Amuvatinib", dec); 0.001::p_fc("PTK2(S29)", "Amuvatinib", inc) :- p_occupancy("PTK2(S29)", "Amuvatinib", dec).
0.001::p_fc("PTK2(S29)", "Amuvatinib", dec); 0.9934028504::p_fc("PTK2(S29)", "Amuvatinib", inc) :- p_occupancy("PTK2(S29)", "Amuvatinib", inc).
0.8127258517::p_fc("PTK2(S29)", "BX912", dec); 0.001::p_fc("PTK2(S29)", "BX912", inc) :- p_occupancy("PTK2(S29)", "BX912", dec).
0.001::p_fc("PTK2(S29)", "BX912", dec); 0.8127258517::p_fc("PTK2(S29)", "BX912", inc) :- p_occupancy("PTK2(S29)", "BX912", inc).
0.5690348377::p_fc("PTK2(S29)", "Bosutinib", dec); 0.001::p_fc("PTK2(S29)", "Bosutinib", inc) :- p_occupancy("PTK2(S29)", "Bosutinib", dec).
0.001::p_fc("PTK2(S29)", "Bosutinib", dec); 0.5690348377::p_fc("PTK2(S29)", "Bosutinib", inc) :- p_occupancy("PTK2(S29)", "Bosutinib", inc).
0.1261816196::p_fc("PTK2(S29)", "CAL101", dec); 0.001::p_fc("PTK2(S29)", "CAL101", inc) :- p_occupancy("PTK2(S29)", "CAL101", dec).
0.001::p_fc("PTK2(S29)", "CAL101", dec); 0.1261816196::p_fc("PTK2(S29)", "CAL101", inc) :- p_occupancy("PTK2(S29)", "CAL101", inc).
0.9964295186::p_fc("PTK2(S29)", "CHIR99021", dec); 0.001::p_fc("PTK2(S29)", "CHIR99021", inc) :- p_occupancy("PTK2(S29)", "CHIR99021", dec).
0.001::p_fc("PTK2(S29)", "CHIR99021", dec); 0.9964295186::p_fc("PTK2(S29)", "CHIR99021", inc) :- p_occupancy("PTK2(S29)", "CHIR99021", inc).
0.9902181869::p_fc("PTK2(S29)", "CX4945", dec); 0.001::p_fc("PTK2(S29)", "CX4945", inc) :- p_occupancy("PTK2(S29)", "CX4945", dec).
0.001::p_fc("PTK2(S29)", "CX4945", dec); 0.9902181869::p_fc("PTK2(S29)", "CX4945", inc) :- p_occupancy("PTK2(S29)", "CX4945", inc).
0.1084501039::p_fc("PTK2(S29)", "DNAPK", dec); 0.001::p_fc("PTK2(S29)", "DNAPK", inc) :- p_occupancy("PTK2(S29)", "DNAPK", dec).
0.001::p_fc("PTK2(S29)", "DNAPK", dec); 0.1084501039::p_fc("PTK2(S29)", "DNAPK", inc) :- p_occupancy("PTK2(S29)", "DNAPK", inc).
0.5449208577::p_fc("PTK2(S29)", "Dabrafenib", dec); 0.001::p_fc("PTK2(S29)", "Dabrafenib", inc) :- p_occupancy("PTK2(S29)", "Dabrafenib", dec).
0.001::p_fc("PTK2(S29)", "Dabrafenib", dec); 0.5449208577::p_fc("PTK2(S29)", "Dabrafenib", inc) :- p_occupancy("PTK2(S29)", "Dabrafenib", inc).
0.3705689968::p_fc("PTK2(S29)", "Dasatinib", dec); 0.001::p_fc("PTK2(S29)", "Dasatinib", inc) :- p_occupancy("PTK2(S29)", "Dasatinib", dec).
0.001::p_fc("PTK2(S29)", "Dasatinib", dec); 0.3705689968::p_fc("PTK2(S29)", "Dasatinib", inc) :- p_occupancy("PTK2(S29)", "Dasatinib", inc).
0.6901822957::p_fc("PTK2(S29)", "Edelfosine", dec); 0.001::p_fc("PTK2(S29)", "Edelfosine", inc) :- p_occupancy("PTK2(S29)", "Edelfosine", dec).
0.001::p_fc("PTK2(S29)", "Edelfosine", dec); 0.6901822957::p_fc("PTK2(S29)", "Edelfosine", inc) :- p_occupancy("PTK2(S29)", "Edelfosine", inc).
0.2604650813::p_fc("PTK2(S29)", "FRAX486", dec); 0.001::p_fc("PTK2(S29)", "FRAX486", inc) :- p_occupancy("PTK2(S29)", "FRAX486", dec).
0.001::p_fc("PTK2(S29)", "FRAX486", dec); 0.2604650813::p_fc("PTK2(S29)", "FRAX486", inc) :- p_occupancy("PTK2(S29)", "FRAX486", inc).
0.1156002646::p_fc("PTK2(S29)", "GDC0941", dec); 0.001::p_fc("PTK2(S29)", "GDC0941", inc) :- p_occupancy("PTK2(S29)", "GDC0941", dec).
0.001::p_fc("PTK2(S29)", "GDC0941", dec); 0.1156002646::p_fc("PTK2(S29)", "GDC0941", inc) :- p_occupancy("PTK2(S29)", "GDC0941", inc).
0.8770810798::p_fc("PTK2(S29)", "GDC0994", dec); 0.001::p_fc("PTK2(S29)", "GDC0994", inc) :- p_occupancy("PTK2(S29)", "GDC0994", dec).
0.001::p_fc("PTK2(S29)", "GDC0994", dec); 0.8770810798::p_fc("PTK2(S29)", "GDC0994", inc) :- p_occupancy("PTK2(S29)", "GDC0994", inc).
0.4709462962::p_fc("PTK2(S29)", "GF109203X", dec); 0.001::p_fc("PTK2(S29)", "GF109203X", inc) :- p_occupancy("PTK2(S29)", "GF109203X", dec).
0.001::p_fc("PTK2(S29)", "GF109203X", dec); 0.4709462962::p_fc("PTK2(S29)", "GF109203X", inc) :- p_occupancy("PTK2(S29)", "GF109203X", inc).
0.02493037::p_fc("PTK2(S29)", "GO6983", dec); 0.001::p_fc("PTK2(S29)", "GO6983", inc) :- p_occupancy("PTK2(S29)", "GO6983", dec).
0.001::p_fc("PTK2(S29)", "GO6983", dec); 0.02493037::p_fc("PTK2(S29)", "GO6983", inc) :- p_occupancy("PTK2(S29)", "GO6983", inc).
0.8521645043::p_fc("PTK2(S29)", "GSK2334470", dec); 0.001::p_fc("PTK2(S29)", "GSK2334470", inc) :- p_occupancy("PTK2(S29)", "GSK2334470", dec).
0.001::p_fc("PTK2(S29)", "GSK2334470", dec); 0.8521645043::p_fc("PTK2(S29)", "GSK2334470", inc) :- p_occupancy("PTK2(S29)", "GSK2334470", inc).
0.6435880487::p_fc("PTK2(S29)", "GSK690693", dec); 0.001::p_fc("PTK2(S29)", "GSK690693", inc) :- p_occupancy("PTK2(S29)", "GSK690693", dec).
0.001::p_fc("PTK2(S29)", "GSK690693", dec); 0.6435880487::p_fc("PTK2(S29)", "GSK690693", inc) :- p_occupancy("PTK2(S29)", "GSK690693", inc).
0.4170634166::p_fc("PTK2(S29)", "Go6976", dec); 0.001::p_fc("PTK2(S29)", "Go6976", inc) :- p_occupancy("PTK2(S29)", "Go6976", dec).
0.001::p_fc("PTK2(S29)", "Go6976", dec); 0.4170634166::p_fc("PTK2(S29)", "Go6976", inc) :- p_occupancy("PTK2(S29)", "Go6976", inc).
0.7730383616::p_fc("PTK2(S29)", "H89", dec); 0.001::p_fc("PTK2(S29)", "H89", inc) :- p_occupancy("PTK2(S29)", "H89", dec).
0.001::p_fc("PTK2(S29)", "H89", dec); 0.7730383616::p_fc("PTK2(S29)", "H89", inc) :- p_occupancy("PTK2(S29)", "H89", inc).
0.3471866051::p_fc("PTK2(S29)", "HS173", dec); 0.001::p_fc("PTK2(S29)", "HS173", inc) :- p_occupancy("PTK2(S29)", "HS173", dec).
0.001::p_fc("PTK2(S29)", "HS173", dec); 0.3471866051::p_fc("PTK2(S29)", "HS173", inc) :- p_occupancy("PTK2(S29)", "HS173", inc).
0.7336591407::p_fc("PTK2(S29)", "Ipatasertib", dec); 0.001::p_fc("PTK2(S29)", "Ipatasertib", inc) :- p_occupancy("PTK2(S29)", "Ipatasertib", dec).
0.001::p_fc("PTK2(S29)", "Ipatasertib", dec); 0.7336591407::p_fc("PTK2(S29)", "Ipatasertib", inc) :- p_occupancy("PTK2(S29)", "Ipatasertib", inc).
0.9559850668::p_fc("PTK2(S29)", "JNJ", dec); 0.001::p_fc("PTK2(S29)", "JNJ", inc) :- p_occupancy("PTK2(S29)", "JNJ", dec).
0.001::p_fc("PTK2(S29)", "JNJ", dec); 0.9559850668::p_fc("PTK2(S29)", "JNJ", inc) :- p_occupancy("PTK2(S29)", "JNJ", inc).
0.3659776545::p_fc("PTK2(S29)", "JNK", dec); 0.001::p_fc("PTK2(S29)", "JNK", inc) :- p_occupancy("PTK2(S29)", "JNK", dec).
0.001::p_fc("PTK2(S29)", "JNK", dec); 0.3659776545::p_fc("PTK2(S29)", "JNK", inc) :- p_occupancy("PTK2(S29)", "JNK", inc).
0.8110794016::p_fc("PTK2(S29)", "KD025", dec); 0.001::p_fc("PTK2(S29)", "KD025", inc) :- p_occupancy("PTK2(S29)", "KD025", dec).
0.001::p_fc("PTK2(S29)", "KD025", dec); 0.8110794016::p_fc("PTK2(S29)", "KD025", inc) :- p_occupancy("PTK2(S29)", "KD025", inc).
0.6435880487::p_fc("PTK2(S29)", "KN62", dec); 0.001::p_fc("PTK2(S29)", "KN62", inc) :- p_occupancy("PTK2(S29)", "KN62", dec).
0.001::p_fc("PTK2(S29)", "KN62", dec); 0.6435880487::p_fc("PTK2(S29)", "KN62", inc) :- p_occupancy("PTK2(S29)", "KN62", inc).
0.8302926707::p_fc("PTK2(S29)", "KN93", dec); 0.001::p_fc("PTK2(S29)", "KN93", inc) :- p_occupancy("PTK2(S29)", "KN93", dec).
0.001::p_fc("PTK2(S29)", "KN93", dec); 0.8302926707::p_fc("PTK2(S29)", "KN93", inc) :- p_occupancy("PTK2(S29)", "KN93", inc).
0.6699543509::p_fc("PTK2(S29)", "Ku0063794", dec); 0.001::p_fc("PTK2(S29)", "Ku0063794", inc) :- p_occupancy("PTK2(S29)", "Ku0063794", dec).
0.001::p_fc("PTK2(S29)", "Ku0063794", dec); 0.6699543509::p_fc("PTK2(S29)", "Ku0063794", inc) :- p_occupancy("PTK2(S29)", "Ku0063794", inc).
0.7968783763::p_fc("PTK2(S29)", "LY2090314", dec); 0.001::p_fc("PTK2(S29)", "LY2090314", inc) :- p_occupancy("PTK2(S29)", "LY2090314", dec).
0.001::p_fc("PTK2(S29)", "LY2090314", dec); 0.7968783763::p_fc("PTK2(S29)", "LY2090314", inc) :- p_occupancy("PTK2(S29)", "LY2090314", inc).
0.4811294731::p_fc("PTK2(S29)", "LY2584702", dec); 0.001::p_fc("PTK2(S29)", "LY2584702", inc) :- p_occupancy("PTK2(S29)", "LY2584702", dec).
0.001::p_fc("PTK2(S29)", "LY2584702", dec); 0.4811294731::p_fc("PTK2(S29)", "LY2584702", inc) :- p_occupancy("PTK2(S29)", "LY2584702", inc).
0.998005988::p_fc("PTK2(S29)", "LY2835219", dec); 0.001::p_fc("PTK2(S29)", "LY2835219", inc) :- p_occupancy("PTK2(S29)", "LY2835219", dec).
0.001::p_fc("PTK2(S29)", "LY2835219", dec); 0.998005988::p_fc("PTK2(S29)", "LY2835219", inc) :- p_occupancy("PTK2(S29)", "LY2835219", inc).
0.9883835231::p_fc("PTK2(S29)", "Linsitinib", dec); 0.001::p_fc("PTK2(S29)", "Linsitinib", inc) :- p_occupancy("PTK2(S29)", "Linsitinib", dec).
0.001::p_fc("PTK2(S29)", "Linsitinib", dec); 0.9883835231::p_fc("PTK2(S29)", "Linsitinib", inc) :- p_occupancy("PTK2(S29)", "Linsitinib", inc).
0.7221517532::p_fc("PTK2(S29)", "MK2206", dec); 0.001::p_fc("PTK2(S29)", "MK2206", inc) :- p_occupancy("PTK2(S29)", "MK2206", dec).
0.001::p_fc("PTK2(S29)", "MK2206", dec); 0.7221517532::p_fc("PTK2(S29)", "MK2206", inc) :- p_occupancy("PTK2(S29)", "MK2206", inc).
0.0829261103::p_fc("PTK2(S29)", "NU7441", dec); 0.001::p_fc("PTK2(S29)", "NU7441", inc) :- p_occupancy("PTK2(S29)", "NU7441", dec).
0.001::p_fc("PTK2(S29)", "NU7441", dec); 0.0829261103::p_fc("PTK2(S29)", "NU7441", inc) :- p_occupancy("PTK2(S29)", "NU7441", inc).
0.9400166294::p_fc("PTK2(S29)", "PD153035", dec); 0.001::p_fc("PTK2(S29)", "PD153035", inc) :- p_occupancy("PTK2(S29)", "PD153035", dec).
0.001::p_fc("PTK2(S29)", "PD153035", dec); 0.9400166294::p_fc("PTK2(S29)", "PD153035", inc) :- p_occupancy("PTK2(S29)", "PD153035", inc).
0.3768073973::p_fc("PTK2(S29)", "PF3758309", dec); 0.001::p_fc("PTK2(S29)", "PF3758309", inc) :- p_occupancy("PTK2(S29)", "PF3758309", dec).
0.001::p_fc("PTK2(S29)", "PF3758309", dec); 0.3768073973::p_fc("PTK2(S29)", "PF3758309", inc) :- p_occupancy("PTK2(S29)", "PF3758309", inc).
0.4879861279::p_fc("PTK2(S29)", "PF4708671", dec); 0.001::p_fc("PTK2(S29)", "PF4708671", inc) :- p_occupancy("PTK2(S29)", "PF4708671", dec).
0.001::p_fc("PTK2(S29)", "PF4708671", dec); 0.4879861279::p_fc("PTK2(S29)", "PF4708671", inc) :- p_occupancy("PTK2(S29)", "PF4708671", inc).
0.5256358607::p_fc("PTK2(S29)", "PH797804", dec); 0.001::p_fc("PTK2(S29)", "PH797804", inc) :- p_occupancy("PTK2(S29)", "PH797804", dec).
0.001::p_fc("PTK2(S29)", "PH797804", dec); 0.5256358607::p_fc("PTK2(S29)", "PH797804", inc) :- p_occupancy("PTK2(S29)", "PH797804", inc).
0.0387305384::p_fc("PTK2(S29)", "PIK294", dec); 0.001::p_fc("PTK2(S29)", "PIK294", inc) :- p_occupancy("PTK2(S29)", "PIK294", dec).
0.001::p_fc("PTK2(S29)", "PIK294", dec); 0.0387305384::p_fc("PTK2(S29)", "PIK294", inc) :- p_occupancy("PTK2(S29)", "PIK294", inc).
0.6435880487::p_fc("PTK2(S29)", "Ribociclib", dec); 0.001::p_fc("PTK2(S29)", "Ribociclib", inc) :- p_occupancy("PTK2(S29)", "Ribociclib", dec).
0.001::p_fc("PTK2(S29)", "Ribociclib", dec); 0.6435880487::p_fc("PTK2(S29)", "Ribociclib", inc) :- p_occupancy("PTK2(S29)", "Ribociclib", inc).
0.1230895002::p_fc("PTK2(S29)", "Ripasudil", dec); 0.001::p_fc("PTK2(S29)", "Ripasudil", inc) :- p_occupancy("PTK2(S29)", "Ripasudil", dec).
0.001::p_fc("PTK2(S29)", "Ripasudil", dec); 0.1230895002::p_fc("PTK2(S29)", "Ripasudil", inc) :- p_occupancy("PTK2(S29)", "Ripasudil", inc).
0.4091863434::p_fc("PTK2(S29)", "SP600125", dec); 0.001::p_fc("PTK2(S29)", "SP600125", inc) :- p_occupancy("PTK2(S29)", "SP600125", dec).
0.001::p_fc("PTK2(S29)", "SP600125", dec); 0.4091863434::p_fc("PTK2(S29)", "SP600125", inc) :- p_occupancy("PTK2(S29)", "SP600125", inc).
0.8684300506::p_fc("PTK2(S29)", "Selumetinib", dec); 0.001::p_fc("PTK2(S29)", "Selumetinib", inc) :- p_occupancy("PTK2(S29)", "Selumetinib", dec).
0.001::p_fc("PTK2(S29)", "Selumetinib", dec); 0.8684300506::p_fc("PTK2(S29)", "Selumetinib", inc) :- p_occupancy("PTK2(S29)", "Selumetinib", inc).
0.3714254918::p_fc("PTK2(S29)", "TAK715", dec); 0.001::p_fc("PTK2(S29)", "TAK715", inc) :- p_occupancy("PTK2(S29)", "TAK715", dec).
0.001::p_fc("PTK2(S29)", "TAK715", dec); 0.3714254918::p_fc("PTK2(S29)", "TAK715", inc) :- p_occupancy("PTK2(S29)", "TAK715", inc).
0.6898372398::p_fc("PTK2(S29)", "TBCA", dec); 0.001::p_fc("PTK2(S29)", "TBCA", inc) :- p_occupancy("PTK2(S29)", "TBCA", dec).
0.001::p_fc("PTK2(S29)", "TBCA", dec); 0.6898372398::p_fc("PTK2(S29)", "TBCA", inc) :- p_occupancy("PTK2(S29)", "TBCA", inc).
0.4093575432::p_fc("PTK2(S29)", "TGX221", dec); 0.001::p_fc("PTK2(S29)", "TGX221", inc) :- p_occupancy("PTK2(S29)", "TGX221", dec).
0.001::p_fc("PTK2(S29)", "TGX221", dec); 0.4093575432::p_fc("PTK2(S29)", "TGX221", inc) :- p_occupancy("PTK2(S29)", "TGX221", inc).
0.4665355894::p_fc("PTK2(S29)", "Tofacitinib", dec); 0.001::p_fc("PTK2(S29)", "Tofacitinib", inc) :- p_occupancy("PTK2(S29)", "Tofacitinib", dec).
0.001::p_fc("PTK2(S29)", "Tofacitinib", dec); 0.4665355894::p_fc("PTK2(S29)", "Tofacitinib", inc) :- p_occupancy("PTK2(S29)", "Tofacitinib", inc).
0.1986936852::p_fc("PTK2(S29)", "Torin", dec); 0.001::p_fc("PTK2(S29)", "Torin", inc) :- p_occupancy("PTK2(S29)", "Torin", dec).
0.001::p_fc("PTK2(S29)", "Torin", dec); 0.1986936852::p_fc("PTK2(S29)", "Torin", inc) :- p_occupancy("PTK2(S29)", "Torin", inc).
0.3649052799::p_fc("PTK2(S29)", "Trametinib", dec); 0.001::p_fc("PTK2(S29)", "Trametinib", inc) :- p_occupancy("PTK2(S29)", "Trametinib", dec).
0.001::p_fc("PTK2(S29)", "Trametinib", dec); 0.3649052799::p_fc("PTK2(S29)", "Trametinib", inc) :- p_occupancy("PTK2(S29)", "Trametinib", inc).
0.6887118594::p_fc("PTK2(S29)", "U73122", dec); 0.001::p_fc("PTK2(S29)", "U73122", inc) :- p_occupancy("PTK2(S29)", "U73122", dec).
0.001::p_fc("PTK2(S29)", "U73122", dec); 0.6887118594::p_fc("PTK2(S29)", "U73122", inc) :- p_occupancy("PTK2(S29)", "U73122", inc).
0.708547448::p_fc("PTK2(S29)", "Ulixertinib", dec); 0.001::p_fc("PTK2(S29)", "Ulixertinib", inc) :- p_occupancy("PTK2(S29)", "Ulixertinib", dec).
0.001::p_fc("PTK2(S29)", "Ulixertinib", dec); 0.708547448::p_fc("PTK2(S29)", "Ulixertinib", inc) :- p_occupancy("PTK2(S29)", "Ulixertinib", inc).
0.2211900525::p_fc("PTK2(S29)", "Vemurafenib", dec); 0.001::p_fc("PTK2(S29)", "Vemurafenib", inc) :- p_occupancy("PTK2(S29)", "Vemurafenib", dec).
0.001::p_fc("PTK2(S29)", "Vemurafenib", dec); 0.2211900525::p_fc("PTK2(S29)", "Vemurafenib", inc) :- p_occupancy("PTK2(S29)", "Vemurafenib", inc).
0.9779363174::p_fc("PTK2(S722)", "AC220", dec); 0.001::p_fc("PTK2(S722)", "AC220", inc) :- p_occupancy("PTK2(S722)", "AC220", dec).
0.001::p_fc("PTK2(S722)", "AC220", dec); 0.9779363174::p_fc("PTK2(S722)", "AC220", inc) :- p_occupancy("PTK2(S722)", "AC220", inc).
0.8201857674::p_fc("PTK2(S722)", "AT13148", dec); 0.001::p_fc("PTK2(S722)", "AT13148", inc) :- p_occupancy("PTK2(S722)", "AT13148", dec).
0.001::p_fc("PTK2(S722)", "AT13148", dec); 0.8201857674::p_fc("PTK2(S722)", "AT13148", inc) :- p_occupancy("PTK2(S722)", "AT13148", inc).
0.8201857674::p_fc("PTK2(S722)", "AZ20", dec); 0.001::p_fc("PTK2(S722)", "AZ20", inc) :- p_occupancy("PTK2(S722)", "AZ20", dec).
0.001::p_fc("PTK2(S722)", "AZ20", dec); 0.8201857674::p_fc("PTK2(S722)", "AZ20", inc) :- p_occupancy("PTK2(S722)", "AZ20", inc).
0.8201857674::p_fc("PTK2(S722)", "AZD1480", dec); 0.001::p_fc("PTK2(S722)", "AZD1480", inc) :- p_occupancy("PTK2(S722)", "AZD1480", dec).
0.001::p_fc("PTK2(S722)", "AZD1480", dec); 0.8201857674::p_fc("PTK2(S722)", "AZD1480", inc) :- p_occupancy("PTK2(S722)", "AZD1480", inc).
0.9450015442::p_fc("PTK2(S722)", "AZD3759", dec); 0.001::p_fc("PTK2(S722)", "AZD3759", inc) :- p_occupancy("PTK2(S722)", "AZD3759", dec).
0.001::p_fc("PTK2(S722)", "AZD3759", dec); 0.9450015442::p_fc("PTK2(S722)", "AZD3759", inc) :- p_occupancy("PTK2(S722)", "AZD3759", inc).
0.791674345::p_fc("PTK2(S722)", "AZD5363", dec); 0.001::p_fc("PTK2(S722)", "AZD5363", inc) :- p_occupancy("PTK2(S722)", "AZD5363", dec).
0.001::p_fc("PTK2(S722)", "AZD5363", dec); 0.791674345::p_fc("PTK2(S722)", "AZD5363", inc) :- p_occupancy("PTK2(S722)", "AZD5363", inc).
0.1703808741::p_fc("PTK2(S722)", "AZD5438", dec); 0.001::p_fc("PTK2(S722)", "AZD5438", inc) :- p_occupancy("PTK2(S722)", "AZD5438", dec).
0.001::p_fc("PTK2(S722)", "AZD5438", dec); 0.1703808741::p_fc("PTK2(S722)", "AZD5438", inc) :- p_occupancy("PTK2(S722)", "AZD5438", inc).
0.8201857674::p_fc("PTK2(S722)", "AZD6482", dec); 0.001::p_fc("PTK2(S722)", "AZD6482", inc) :- p_occupancy("PTK2(S722)", "AZD6482", dec).
0.001::p_fc("PTK2(S722)", "AZD6482", dec); 0.8201857674::p_fc("PTK2(S722)", "AZD6482", inc) :- p_occupancy("PTK2(S722)", "AZD6482", inc).
0.8201857674::p_fc("PTK2(S722)", "AZD6738", dec); 0.001::p_fc("PTK2(S722)", "AZD6738", inc) :- p_occupancy("PTK2(S722)", "AZD6738", dec).
0.001::p_fc("PTK2(S722)", "AZD6738", dec); 0.8201857674::p_fc("PTK2(S722)", "AZD6738", inc) :- p_occupancy("PTK2(S722)", "AZD6738", inc).
0.8425024298::p_fc("PTK2(S722)", "AZD8055", dec); 0.001::p_fc("PTK2(S722)", "AZD8055", inc) :- p_occupancy("PTK2(S722)", "AZD8055", dec).
0.001::p_fc("PTK2(S722)", "AZD8055", dec); 0.8425024298::p_fc("PTK2(S722)", "AZD8055", inc) :- p_occupancy("PTK2(S722)", "AZD8055", inc).
0.2095739016::p_fc("PTK2(S722)", "Amuvatinib", dec); 0.001::p_fc("PTK2(S722)", "Amuvatinib", inc) :- p_occupancy("PTK2(S722)", "Amuvatinib", dec).
0.001::p_fc("PTK2(S722)", "Amuvatinib", dec); 0.2095739016::p_fc("PTK2(S722)", "Amuvatinib", inc) :- p_occupancy("PTK2(S722)", "Amuvatinib", inc).
0.8201857674::p_fc("PTK2(S722)", "BX912", dec); 0.001::p_fc("PTK2(S722)", "BX912", inc) :- p_occupancy("PTK2(S722)", "BX912", dec).
0.001::p_fc("PTK2(S722)", "BX912", dec); 0.8201857674::p_fc("PTK2(S722)", "BX912", inc) :- p_occupancy("PTK2(S722)", "BX912", inc).
0.8201857674::p_fc("PTK2(S722)", "Bosutinib", dec); 0.001::p_fc("PTK2(S722)", "Bosutinib", inc) :- p_occupancy("PTK2(S722)", "Bosutinib", dec).
0.001::p_fc("PTK2(S722)", "Bosutinib", dec); 0.8201857674::p_fc("PTK2(S722)", "Bosutinib", inc) :- p_occupancy("PTK2(S722)", "Bosutinib", inc).
0.8201857674::p_fc("PTK2(S722)", "CAL101", dec); 0.001::p_fc("PTK2(S722)", "CAL101", inc) :- p_occupancy("PTK2(S722)", "CAL101", dec).
0.001::p_fc("PTK2(S722)", "CAL101", dec); 0.8201857674::p_fc("PTK2(S722)", "CAL101", inc) :- p_occupancy("PTK2(S722)", "CAL101", inc).
0.7633613486::p_fc("PTK2(S722)", "CHIR99021", dec); 0.001::p_fc("PTK2(S722)", "CHIR99021", inc) :- p_occupancy("PTK2(S722)", "CHIR99021", dec).
0.001::p_fc("PTK2(S722)", "CHIR99021", dec); 0.7633613486::p_fc("PTK2(S722)", "CHIR99021", inc) :- p_occupancy("PTK2(S722)", "CHIR99021", inc).
0.9543115451::p_fc("PTK2(S722)", "CX4945", dec); 0.001::p_fc("PTK2(S722)", "CX4945", inc) :- p_occupancy("PTK2(S722)", "CX4945", dec).
0.001::p_fc("PTK2(S722)", "CX4945", dec); 0.9543115451::p_fc("PTK2(S722)", "CX4945", inc) :- p_occupancy("PTK2(S722)", "CX4945", inc).
0.8201857674::p_fc("PTK2(S722)", "DNAPK", dec); 0.001::p_fc("PTK2(S722)", "DNAPK", inc) :- p_occupancy("PTK2(S722)", "DNAPK", dec).
0.001::p_fc("PTK2(S722)", "DNAPK", dec); 0.8201857674::p_fc("PTK2(S722)", "DNAPK", inc) :- p_occupancy("PTK2(S722)", "DNAPK", inc).
0.8201857674::p_fc("PTK2(S722)", "Dabrafenib", dec); 0.001::p_fc("PTK2(S722)", "Dabrafenib", inc) :- p_occupancy("PTK2(S722)", "Dabrafenib", dec).
0.001::p_fc("PTK2(S722)", "Dabrafenib", dec); 0.8201857674::p_fc("PTK2(S722)", "Dabrafenib", inc) :- p_occupancy("PTK2(S722)", "Dabrafenib", inc).
0.8201857674::p_fc("PTK2(S722)", "Dasatinib", dec); 0.001::p_fc("PTK2(S722)", "Dasatinib", inc) :- p_occupancy("PTK2(S722)", "Dasatinib", dec).
0.001::p_fc("PTK2(S722)", "Dasatinib", dec); 0.8201857674::p_fc("PTK2(S722)", "Dasatinib", inc) :- p_occupancy("PTK2(S722)", "Dasatinib", inc).
0.8201857674::p_fc("PTK2(S722)", "Edelfosine", dec); 0.001::p_fc("PTK2(S722)", "Edelfosine", inc) :- p_occupancy("PTK2(S722)", "Edelfosine", dec).
0.001::p_fc("PTK2(S722)", "Edelfosine", dec); 0.8201857674::p_fc("PTK2(S722)", "Edelfosine", inc) :- p_occupancy("PTK2(S722)", "Edelfosine", inc).
0.2893815989::p_fc("PTK2(S722)", "FRAX486", dec); 0.001::p_fc("PTK2(S722)", "FRAX486", inc) :- p_occupancy("PTK2(S722)", "FRAX486", dec).
0.001::p_fc("PTK2(S722)", "FRAX486", dec); 0.2893815989::p_fc("PTK2(S722)", "FRAX486", inc) :- p_occupancy("PTK2(S722)", "FRAX486", inc).
0.8201857674::p_fc("PTK2(S722)", "GDC0941", dec); 0.001::p_fc("PTK2(S722)", "GDC0941", inc) :- p_occupancy("PTK2(S722)", "GDC0941", dec).
0.001::p_fc("PTK2(S722)", "GDC0941", dec); 0.8201857674::p_fc("PTK2(S722)", "GDC0941", inc) :- p_occupancy("PTK2(S722)", "GDC0941", inc).
0.4728174068::p_fc("PTK2(S722)", "GDC0994", dec); 0.001::p_fc("PTK2(S722)", "GDC0994", inc) :- p_occupancy("PTK2(S722)", "GDC0994", dec).
0.001::p_fc("PTK2(S722)", "GDC0994", dec); 0.4728174068::p_fc("PTK2(S722)", "GDC0994", inc) :- p_occupancy("PTK2(S722)", "GDC0994", inc).
0.8201857674::p_fc("PTK2(S722)", "GF109203X", dec); 0.001::p_fc("PTK2(S722)", "GF109203X", inc) :- p_occupancy("PTK2(S722)", "GF109203X", dec).
0.001::p_fc("PTK2(S722)", "GF109203X", dec); 0.8201857674::p_fc("PTK2(S722)", "GF109203X", inc) :- p_occupancy("PTK2(S722)", "GF109203X", inc).
0.8201857674::p_fc("PTK2(S722)", "GO6983", dec); 0.001::p_fc("PTK2(S722)", "GO6983", inc) :- p_occupancy("PTK2(S722)", "GO6983", dec).
0.001::p_fc("PTK2(S722)", "GO6983", dec); 0.8201857674::p_fc("PTK2(S722)", "GO6983", inc) :- p_occupancy("PTK2(S722)", "GO6983", inc).
0.9725490259::p_fc("PTK2(S722)", "GSK2334470", dec); 0.001::p_fc("PTK2(S722)", "GSK2334470", inc) :- p_occupancy("PTK2(S722)", "GSK2334470", dec).
0.001::p_fc("PTK2(S722)", "GSK2334470", dec); 0.9725490259::p_fc("PTK2(S722)", "GSK2334470", inc) :- p_occupancy("PTK2(S722)", "GSK2334470", inc).
0.1333465353::p_fc("PTK2(S722)", "GSK690693", dec); 0.001::p_fc("PTK2(S722)", "GSK690693", inc) :- p_occupancy("PTK2(S722)", "GSK690693", dec).
0.001::p_fc("PTK2(S722)", "GSK690693", dec); 0.1333465353::p_fc("PTK2(S722)", "GSK690693", inc) :- p_occupancy("PTK2(S722)", "GSK690693", inc).
0.9842483672::p_fc("PTK2(S722)", "Go6976", dec); 0.001::p_fc("PTK2(S722)", "Go6976", inc) :- p_occupancy("PTK2(S722)", "Go6976", dec).
0.001::p_fc("PTK2(S722)", "Go6976", dec); 0.9842483672::p_fc("PTK2(S722)", "Go6976", inc) :- p_occupancy("PTK2(S722)", "Go6976", inc).
0.8201857674::p_fc("PTK2(S722)", "H89", dec); 0.001::p_fc("PTK2(S722)", "H89", inc) :- p_occupancy("PTK2(S722)", "H89", dec).
0.001::p_fc("PTK2(S722)", "H89", dec); 0.8201857674::p_fc("PTK2(S722)", "H89", inc) :- p_occupancy("PTK2(S722)", "H89", inc).
0.9836872704::p_fc("PTK2(S722)", "HS173", dec); 0.001::p_fc("PTK2(S722)", "HS173", inc) :- p_occupancy("PTK2(S722)", "HS173", dec).
0.001::p_fc("PTK2(S722)", "HS173", dec); 0.9836872704::p_fc("PTK2(S722)", "HS173", inc) :- p_occupancy("PTK2(S722)", "HS173", inc).
0.9704597396::p_fc("PTK2(S722)", "Ipatasertib", dec); 0.001::p_fc("PTK2(S722)", "Ipatasertib", inc) :- p_occupancy("PTK2(S722)", "Ipatasertib", dec).
0.001::p_fc("PTK2(S722)", "Ipatasertib", dec); 0.9704597396::p_fc("PTK2(S722)", "Ipatasertib", inc) :- p_occupancy("PTK2(S722)", "Ipatasertib", inc).
0.9943645873::p_fc("PTK2(S722)", "JNJ", dec); 0.001::p_fc("PTK2(S722)", "JNJ", inc) :- p_occupancy("PTK2(S722)", "JNJ", dec).
0.001::p_fc("PTK2(S722)", "JNJ", dec); 0.9943645873::p_fc("PTK2(S722)", "JNJ", inc) :- p_occupancy("PTK2(S722)", "JNJ", inc).
0.9921601525::p_fc("PTK2(S722)", "JNK", dec); 0.001::p_fc("PTK2(S722)", "JNK", inc) :- p_occupancy("PTK2(S722)", "JNK", dec).
0.001::p_fc("PTK2(S722)", "JNK", dec); 0.9921601525::p_fc("PTK2(S722)", "JNK", inc) :- p_occupancy("PTK2(S722)", "JNK", inc).
0.8201857674::p_fc("PTK2(S722)", "KD025", dec); 0.001::p_fc("PTK2(S722)", "KD025", inc) :- p_occupancy("PTK2(S722)", "KD025", dec).
0.001::p_fc("PTK2(S722)", "KD025", dec); 0.8201857674::p_fc("PTK2(S722)", "KD025", inc) :- p_occupancy("PTK2(S722)", "KD025", inc).
0.8201857674::p_fc("PTK2(S722)", "KN62", dec); 0.001::p_fc("PTK2(S722)", "KN62", inc) :- p_occupancy("PTK2(S722)", "KN62", dec).
0.001::p_fc("PTK2(S722)", "KN62", dec); 0.8201857674::p_fc("PTK2(S722)", "KN62", inc) :- p_occupancy("PTK2(S722)", "KN62", inc).
0.9424047156::p_fc("PTK2(S722)", "KN93", dec); 0.001::p_fc("PTK2(S722)", "KN93", inc) :- p_occupancy("PTK2(S722)", "KN93", dec).
0.001::p_fc("PTK2(S722)", "KN93", dec); 0.9424047156::p_fc("PTK2(S722)", "KN93", inc) :- p_occupancy("PTK2(S722)", "KN93", inc).
0.2735983614::p_fc("PTK2(S722)", "Ku0063794", dec); 0.001::p_fc("PTK2(S722)", "Ku0063794", inc) :- p_occupancy("PTK2(S722)", "Ku0063794", dec).
0.001::p_fc("PTK2(S722)", "Ku0063794", dec); 0.2735983614::p_fc("PTK2(S722)", "Ku0063794", inc) :- p_occupancy("PTK2(S722)", "Ku0063794", inc).
0.8201857674::p_fc("PTK2(S722)", "LY2090314", dec); 0.001::p_fc("PTK2(S722)", "LY2090314", inc) :- p_occupancy("PTK2(S722)", "LY2090314", dec).
0.001::p_fc("PTK2(S722)", "LY2090314", dec); 0.8201857674::p_fc("PTK2(S722)", "LY2090314", inc) :- p_occupancy("PTK2(S722)", "LY2090314", inc).
0.1251312194::p_fc("PTK2(S722)", "LY2584702", dec); 0.001::p_fc("PTK2(S722)", "LY2584702", inc) :- p_occupancy("PTK2(S722)", "LY2584702", dec).
0.001::p_fc("PTK2(S722)", "LY2584702", dec); 0.1251312194::p_fc("PTK2(S722)", "LY2584702", inc) :- p_occupancy("PTK2(S722)", "LY2584702", inc).
0.8201857674::p_fc("PTK2(S722)", "LY2835219", dec); 0.001::p_fc("PTK2(S722)", "LY2835219", inc) :- p_occupancy("PTK2(S722)", "LY2835219", dec).
0.001::p_fc("PTK2(S722)", "LY2835219", dec); 0.8201857674::p_fc("PTK2(S722)", "LY2835219", inc) :- p_occupancy("PTK2(S722)", "LY2835219", inc).
0.8201857674::p_fc("PTK2(S722)", "Linsitinib", dec); 0.001::p_fc("PTK2(S722)", "Linsitinib", inc) :- p_occupancy("PTK2(S722)", "Linsitinib", dec).
0.001::p_fc("PTK2(S722)", "Linsitinib", dec); 0.8201857674::p_fc("PTK2(S722)", "Linsitinib", inc) :- p_occupancy("PTK2(S722)", "Linsitinib", inc).
0.8201857674::p_fc("PTK2(S722)", "MK2206", dec); 0.001::p_fc("PTK2(S722)", "MK2206", inc) :- p_occupancy("PTK2(S722)", "MK2206", dec).
0.001::p_fc("PTK2(S722)", "MK2206", dec); 0.8201857674::p_fc("PTK2(S722)", "MK2206", inc) :- p_occupancy("PTK2(S722)", "MK2206", inc).
0.8201857674::p_fc("PTK2(S722)", "NU7441", dec); 0.001::p_fc("PTK2(S722)", "NU7441", inc) :- p_occupancy("PTK2(S722)", "NU7441", dec).
0.001::p_fc("PTK2(S722)", "NU7441", dec); 0.8201857674::p_fc("PTK2(S722)", "NU7441", inc) :- p_occupancy("PTK2(S722)", "NU7441", inc).
0.3667240929::p_fc("PTK2(S722)", "PD153035", dec); 0.001::p_fc("PTK2(S722)", "PD153035", inc) :- p_occupancy("PTK2(S722)", "PD153035", dec).
0.001::p_fc("PTK2(S722)", "PD153035", dec); 0.3667240929::p_fc("PTK2(S722)", "PD153035", inc) :- p_occupancy("PTK2(S722)", "PD153035", inc).
0.3139972301::p_fc("PTK2(S722)", "PF3758309", dec); 0.001::p_fc("PTK2(S722)", "PF3758309", inc) :- p_occupancy("PTK2(S722)", "PF3758309", dec).
0.001::p_fc("PTK2(S722)", "PF3758309", dec); 0.3139972301::p_fc("PTK2(S722)", "PF3758309", inc) :- p_occupancy("PTK2(S722)", "PF3758309", inc).
0.9662501272::p_fc("PTK2(S722)", "PF4708671", dec); 0.001::p_fc("PTK2(S722)", "PF4708671", inc) :- p_occupancy("PTK2(S722)", "PF4708671", dec).
0.001::p_fc("PTK2(S722)", "PF4708671", dec); 0.9662501272::p_fc("PTK2(S722)", "PF4708671", inc) :- p_occupancy("PTK2(S722)", "PF4708671", inc).
0.4859147472::p_fc("PTK2(S722)", "PH797804", dec); 0.001::p_fc("PTK2(S722)", "PH797804", inc) :- p_occupancy("PTK2(S722)", "PH797804", dec).
0.001::p_fc("PTK2(S722)", "PH797804", dec); 0.4859147472::p_fc("PTK2(S722)", "PH797804", inc) :- p_occupancy("PTK2(S722)", "PH797804", inc).
0.8201857674::p_fc("PTK2(S722)", "PIK294", dec); 0.001::p_fc("PTK2(S722)", "PIK294", inc) :- p_occupancy("PTK2(S722)", "PIK294", dec).
0.001::p_fc("PTK2(S722)", "PIK294", dec); 0.8201857674::p_fc("PTK2(S722)", "PIK294", inc) :- p_occupancy("PTK2(S722)", "PIK294", inc).
0.3054849519::p_fc("PTK2(S722)", "Ribociclib", dec); 0.001::p_fc("PTK2(S722)", "Ribociclib", inc) :- p_occupancy("PTK2(S722)", "Ribociclib", dec).
0.001::p_fc("PTK2(S722)", "Ribociclib", dec); 0.3054849519::p_fc("PTK2(S722)", "Ribociclib", inc) :- p_occupancy("PTK2(S722)", "Ribociclib", inc).
0.8201857674::p_fc("PTK2(S722)", "Ripasudil", dec); 0.001::p_fc("PTK2(S722)", "Ripasudil", inc) :- p_occupancy("PTK2(S722)", "Ripasudil", dec).
0.001::p_fc("PTK2(S722)", "Ripasudil", dec); 0.8201857674::p_fc("PTK2(S722)", "Ripasudil", inc) :- p_occupancy("PTK2(S722)", "Ripasudil", inc).
0.8201857674::p_fc("PTK2(S722)", "SP600125", dec); 0.001::p_fc("PTK2(S722)", "SP600125", inc) :- p_occupancy("PTK2(S722)", "SP600125", dec).
0.001::p_fc("PTK2(S722)", "SP600125", dec); 0.8201857674::p_fc("PTK2(S722)", "SP600125", inc) :- p_occupancy("PTK2(S722)", "SP600125", inc).
0.7536603209::p_fc("PTK2(S722)", "Selumetinib", dec); 0.001::p_fc("PTK2(S722)", "Selumetinib", inc) :- p_occupancy("PTK2(S722)", "Selumetinib", dec).
0.001::p_fc("PTK2(S722)", "Selumetinib", dec); 0.7536603209::p_fc("PTK2(S722)", "Selumetinib", inc) :- p_occupancy("PTK2(S722)", "Selumetinib", inc).
0.8201857674::p_fc("PTK2(S722)", "TAK715", dec); 0.001::p_fc("PTK2(S722)", "TAK715", inc) :- p_occupancy("PTK2(S722)", "TAK715", dec).
0.001::p_fc("PTK2(S722)", "TAK715", dec); 0.8201857674::p_fc("PTK2(S722)", "TAK715", inc) :- p_occupancy("PTK2(S722)", "TAK715", inc).
0.8201857674::p_fc("PTK2(S722)", "TBCA", dec); 0.001::p_fc("PTK2(S722)", "TBCA", inc) :- p_occupancy("PTK2(S722)", "TBCA", dec).
0.001::p_fc("PTK2(S722)", "TBCA", dec); 0.8201857674::p_fc("PTK2(S722)", "TBCA", inc) :- p_occupancy("PTK2(S722)", "TBCA", inc).
0.9964249292::p_fc("PTK2(S722)", "TGX221", dec); 0.001::p_fc("PTK2(S722)", "TGX221", inc) :- p_occupancy("PTK2(S722)", "TGX221", dec).
0.001::p_fc("PTK2(S722)", "TGX221", dec); 0.9964249292::p_fc("PTK2(S722)", "TGX221", inc) :- p_occupancy("PTK2(S722)", "TGX221", inc).
0.8201857674::p_fc("PTK2(S722)", "Tofacitinib", dec); 0.001::p_fc("PTK2(S722)", "Tofacitinib", inc) :- p_occupancy("PTK2(S722)", "Tofacitinib", dec).
0.001::p_fc("PTK2(S722)", "Tofacitinib", dec); 0.8201857674::p_fc("PTK2(S722)", "Tofacitinib", inc) :- p_occupancy("PTK2(S722)", "Tofacitinib", inc).
0.6359501357::p_fc("PTK2(S722)", "Torin", dec); 0.001::p_fc("PTK2(S722)", "Torin", inc) :- p_occupancy("PTK2(S722)", "Torin", dec).
0.001::p_fc("PTK2(S722)", "Torin", dec); 0.6359501357::p_fc("PTK2(S722)", "Torin", inc) :- p_occupancy("PTK2(S722)", "Torin", inc).
0.5465637866::p_fc("PTK2(S722)", "Trametinib", dec); 0.001::p_fc("PTK2(S722)", "Trametinib", inc) :- p_occupancy("PTK2(S722)", "Trametinib", dec).
0.001::p_fc("PTK2(S722)", "Trametinib", dec); 0.5465637866::p_fc("PTK2(S722)", "Trametinib", inc) :- p_occupancy("PTK2(S722)", "Trametinib", inc).
0.0740383513::p_fc("PTK2(S722)", "U73122", dec); 0.001::p_fc("PTK2(S722)", "U73122", inc) :- p_occupancy("PTK2(S722)", "U73122", dec).
0.001::p_fc("PTK2(S722)", "U73122", dec); 0.0740383513::p_fc("PTK2(S722)", "U73122", inc) :- p_occupancy("PTK2(S722)", "U73122", inc).
0.2639328965::p_fc("PTK2(S722)", "Ulixertinib", dec); 0.001::p_fc("PTK2(S722)", "Ulixertinib", inc) :- p_occupancy("PTK2(S722)", "Ulixertinib", dec).
0.001::p_fc("PTK2(S722)", "Ulixertinib", dec); 0.2639328965::p_fc("PTK2(S722)", "Ulixertinib", inc) :- p_occupancy("PTK2(S722)", "Ulixertinib", inc).
0.8201857674::p_fc("PTK2(S722)", "Vemurafenib", dec); 0.001::p_fc("PTK2(S722)", "Vemurafenib", inc) :- p_occupancy("PTK2(S722)", "Vemurafenib", dec).
0.001::p_fc("PTK2(S722)", "Vemurafenib", dec); 0.8201857674::p_fc("PTK2(S722)", "Vemurafenib", inc) :- p_occupancy("PTK2(S722)", "Vemurafenib", inc).
0.001::p_fc("PTK2(S843)", "AC220", dec); 0.001::p_fc("PTK2(S843)", "AC220", inc) :- p_occupancy("PTK2(S843)", "AC220", dec).
0.001::p_fc("PTK2(S843)", "AC220", dec); 0.001::p_fc("PTK2(S843)", "AC220", inc) :- p_occupancy("PTK2(S843)", "AC220", inc).
0.001::p_fc("PTK2(S843)", "AT13148", dec); 0.001::p_fc("PTK2(S843)", "AT13148", inc) :- p_occupancy("PTK2(S843)", "AT13148", dec).
0.001::p_fc("PTK2(S843)", "AT13148", dec); 0.001::p_fc("PTK2(S843)", "AT13148", inc) :- p_occupancy("PTK2(S843)", "AT13148", inc).
0.001::p_fc("PTK2(S843)", "AZ20", dec); 0.001::p_fc("PTK2(S843)", "AZ20", inc) :- p_occupancy("PTK2(S843)", "AZ20", dec).
0.001::p_fc("PTK2(S843)", "AZ20", dec); 0.001::p_fc("PTK2(S843)", "AZ20", inc) :- p_occupancy("PTK2(S843)", "AZ20", inc).
0.001::p_fc("PTK2(S843)", "AZD1480", dec); 0.001::p_fc("PTK2(S843)", "AZD1480", inc) :- p_occupancy("PTK2(S843)", "AZD1480", dec).
0.001::p_fc("PTK2(S843)", "AZD1480", dec); 0.001::p_fc("PTK2(S843)", "AZD1480", inc) :- p_occupancy("PTK2(S843)", "AZD1480", inc).
0.001::p_fc("PTK2(S843)", "AZD3759", dec); 0.001::p_fc("PTK2(S843)", "AZD3759", inc) :- p_occupancy("PTK2(S843)", "AZD3759", dec).
0.001::p_fc("PTK2(S843)", "AZD3759", dec); 0.001::p_fc("PTK2(S843)", "AZD3759", inc) :- p_occupancy("PTK2(S843)", "AZD3759", inc).
0.001::p_fc("PTK2(S843)", "AZD5363", dec); 0.001::p_fc("PTK2(S843)", "AZD5363", inc) :- p_occupancy("PTK2(S843)", "AZD5363", dec).
0.001::p_fc("PTK2(S843)", "AZD5363", dec); 0.001::p_fc("PTK2(S843)", "AZD5363", inc) :- p_occupancy("PTK2(S843)", "AZD5363", inc).
0.993270665::p_fc("PTK2(S843)", "AZD5438", dec); 0.001::p_fc("PTK2(S843)", "AZD5438", inc) :- p_occupancy("PTK2(S843)", "AZD5438", dec).
0.001::p_fc("PTK2(S843)", "AZD5438", dec); 0.993270665::p_fc("PTK2(S843)", "AZD5438", inc) :- p_occupancy("PTK2(S843)", "AZD5438", inc).
0.001::p_fc("PTK2(S843)", "AZD6482", dec); 0.001::p_fc("PTK2(S843)", "AZD6482", inc) :- p_occupancy("PTK2(S843)", "AZD6482", dec).
0.001::p_fc("PTK2(S843)", "AZD6482", dec); 0.001::p_fc("PTK2(S843)", "AZD6482", inc) :- p_occupancy("PTK2(S843)", "AZD6482", inc).
0.001::p_fc("PTK2(S843)", "AZD6738", dec); 0.001::p_fc("PTK2(S843)", "AZD6738", inc) :- p_occupancy("PTK2(S843)", "AZD6738", dec).
0.001::p_fc("PTK2(S843)", "AZD6738", dec); 0.001::p_fc("PTK2(S843)", "AZD6738", inc) :- p_occupancy("PTK2(S843)", "AZD6738", inc).
0.001::p_fc("PTK2(S843)", "AZD8055", dec); 0.001::p_fc("PTK2(S843)", "AZD8055", inc) :- p_occupancy("PTK2(S843)", "AZD8055", dec).
0.001::p_fc("PTK2(S843)", "AZD8055", dec); 0.001::p_fc("PTK2(S843)", "AZD8055", inc) :- p_occupancy("PTK2(S843)", "AZD8055", inc).
0.001::p_fc("PTK2(S843)", "Amuvatinib", dec); 0.001::p_fc("PTK2(S843)", "Amuvatinib", inc) :- p_occupancy("PTK2(S843)", "Amuvatinib", dec).
0.001::p_fc("PTK2(S843)", "Amuvatinib", dec); 0.001::p_fc("PTK2(S843)", "Amuvatinib", inc) :- p_occupancy("PTK2(S843)", "Amuvatinib", inc).
0.001::p_fc("PTK2(S843)", "BX912", dec); 0.001::p_fc("PTK2(S843)", "BX912", inc) :- p_occupancy("PTK2(S843)", "BX912", dec).
0.001::p_fc("PTK2(S843)", "BX912", dec); 0.001::p_fc("PTK2(S843)", "BX912", inc) :- p_occupancy("PTK2(S843)", "BX912", inc).
0.001::p_fc("PTK2(S843)", "Bosutinib", dec); 0.001::p_fc("PTK2(S843)", "Bosutinib", inc) :- p_occupancy("PTK2(S843)", "Bosutinib", dec).
0.001::p_fc("PTK2(S843)", "Bosutinib", dec); 0.001::p_fc("PTK2(S843)", "Bosutinib", inc) :- p_occupancy("PTK2(S843)", "Bosutinib", inc).
0.001::p_fc("PTK2(S843)", "CAL101", dec); 0.001::p_fc("PTK2(S843)", "CAL101", inc) :- p_occupancy("PTK2(S843)", "CAL101", dec).
0.001::p_fc("PTK2(S843)", "CAL101", dec); 0.001::p_fc("PTK2(S843)", "CAL101", inc) :- p_occupancy("PTK2(S843)", "CAL101", inc).
0.001::p_fc("PTK2(S843)", "CHIR99021", dec); 0.001::p_fc("PTK2(S843)", "CHIR99021", inc) :- p_occupancy("PTK2(S843)", "CHIR99021", dec).
0.001::p_fc("PTK2(S843)", "CHIR99021", dec); 0.001::p_fc("PTK2(S843)", "CHIR99021", inc) :- p_occupancy("PTK2(S843)", "CHIR99021", inc).
0.001::p_fc("PTK2(S843)", "CX4945", dec); 0.001::p_fc("PTK2(S843)", "CX4945", inc) :- p_occupancy("PTK2(S843)", "CX4945", dec).
0.001::p_fc("PTK2(S843)", "CX4945", dec); 0.001::p_fc("PTK2(S843)", "CX4945", inc) :- p_occupancy("PTK2(S843)", "CX4945", inc).
0.001::p_fc("PTK2(S843)", "DNAPK", dec); 0.001::p_fc("PTK2(S843)", "DNAPK", inc) :- p_occupancy("PTK2(S843)", "DNAPK", dec).
0.001::p_fc("PTK2(S843)", "DNAPK", dec); 0.001::p_fc("PTK2(S843)", "DNAPK", inc) :- p_occupancy("PTK2(S843)", "DNAPK", inc).
0.001::p_fc("PTK2(S843)", "Dabrafenib", dec); 0.001::p_fc("PTK2(S843)", "Dabrafenib", inc) :- p_occupancy("PTK2(S843)", "Dabrafenib", dec).
0.001::p_fc("PTK2(S843)", "Dabrafenib", dec); 0.001::p_fc("PTK2(S843)", "Dabrafenib", inc) :- p_occupancy("PTK2(S843)", "Dabrafenib", inc).
0.001::p_fc("PTK2(S843)", "Dasatinib", dec); 0.001::p_fc("PTK2(S843)", "Dasatinib", inc) :- p_occupancy("PTK2(S843)", "Dasatinib", dec).
0.001::p_fc("PTK2(S843)", "Dasatinib", dec); 0.001::p_fc("PTK2(S843)", "Dasatinib", inc) :- p_occupancy("PTK2(S843)", "Dasatinib", inc).
0.001::p_fc("PTK2(S843)", "Edelfosine", dec); 0.001::p_fc("PTK2(S843)", "Edelfosine", inc) :- p_occupancy("PTK2(S843)", "Edelfosine", dec).
0.001::p_fc("PTK2(S843)", "Edelfosine", dec); 0.001::p_fc("PTK2(S843)", "Edelfosine", inc) :- p_occupancy("PTK2(S843)", "Edelfosine", inc).
0.9977670832::p_fc("PTK2(S843)", "FRAX486", dec); 0.001::p_fc("PTK2(S843)", "FRAX486", inc) :- p_occupancy("PTK2(S843)", "FRAX486", dec).
0.001::p_fc("PTK2(S843)", "FRAX486", dec); 0.9977670832::p_fc("PTK2(S843)", "FRAX486", inc) :- p_occupancy("PTK2(S843)", "FRAX486", inc).
0.001::p_fc("PTK2(S843)", "GDC0941", dec); 0.001::p_fc("PTK2(S843)", "GDC0941", inc) :- p_occupancy("PTK2(S843)", "GDC0941", dec).
0.001::p_fc("PTK2(S843)", "GDC0941", dec); 0.001::p_fc("PTK2(S843)", "GDC0941", inc) :- p_occupancy("PTK2(S843)", "GDC0941", inc).
0.001::p_fc("PTK2(S843)", "GDC0994", dec); 0.001::p_fc("PTK2(S843)", "GDC0994", inc) :- p_occupancy("PTK2(S843)", "GDC0994", dec).
0.001::p_fc("PTK2(S843)", "GDC0994", dec); 0.001::p_fc("PTK2(S843)", "GDC0994", inc) :- p_occupancy("PTK2(S843)", "GDC0994", inc).
0.001::p_fc("PTK2(S843)", "GF109203X", dec); 0.001::p_fc("PTK2(S843)", "GF109203X", inc) :- p_occupancy("PTK2(S843)", "GF109203X", dec).
0.001::p_fc("PTK2(S843)", "GF109203X", dec); 0.001::p_fc("PTK2(S843)", "GF109203X", inc) :- p_occupancy("PTK2(S843)", "GF109203X", inc).
0.001::p_fc("PTK2(S843)", "GO6983", dec); 0.001::p_fc("PTK2(S843)", "GO6983", inc) :- p_occupancy("PTK2(S843)", "GO6983", dec).
0.001::p_fc("PTK2(S843)", "GO6983", dec); 0.001::p_fc("PTK2(S843)", "GO6983", inc) :- p_occupancy("PTK2(S843)", "GO6983", inc).
0.001::p_fc("PTK2(S843)", "GSK2334470", dec); 0.001::p_fc("PTK2(S843)", "GSK2334470", inc) :- p_occupancy("PTK2(S843)", "GSK2334470", dec).
0.001::p_fc("PTK2(S843)", "GSK2334470", dec); 0.001::p_fc("PTK2(S843)", "GSK2334470", inc) :- p_occupancy("PTK2(S843)", "GSK2334470", inc).
0.001::p_fc("PTK2(S843)", "GSK690693", dec); 0.001::p_fc("PTK2(S843)", "GSK690693", inc) :- p_occupancy("PTK2(S843)", "GSK690693", dec).
0.001::p_fc("PTK2(S843)", "GSK690693", dec); 0.001::p_fc("PTK2(S843)", "GSK690693", inc) :- p_occupancy("PTK2(S843)", "GSK690693", inc).
0.001::p_fc("PTK2(S843)", "Go6976", dec); 0.001::p_fc("PTK2(S843)", "Go6976", inc) :- p_occupancy("PTK2(S843)", "Go6976", dec).
0.001::p_fc("PTK2(S843)", "Go6976", dec); 0.001::p_fc("PTK2(S843)", "Go6976", inc) :- p_occupancy("PTK2(S843)", "Go6976", inc).
0.001::p_fc("PTK2(S843)", "H89", dec); 0.001::p_fc("PTK2(S843)", "H89", inc) :- p_occupancy("PTK2(S843)", "H89", dec).
0.001::p_fc("PTK2(S843)", "H89", dec); 0.001::p_fc("PTK2(S843)", "H89", inc) :- p_occupancy("PTK2(S843)", "H89", inc).
0.001::p_fc("PTK2(S843)", "HS173", dec); 0.001::p_fc("PTK2(S843)", "HS173", inc) :- p_occupancy("PTK2(S843)", "HS173", dec).
0.001::p_fc("PTK2(S843)", "HS173", dec); 0.001::p_fc("PTK2(S843)", "HS173", inc) :- p_occupancy("PTK2(S843)", "HS173", inc).
0.001::p_fc("PTK2(S843)", "Ipatasertib", dec); 0.001::p_fc("PTK2(S843)", "Ipatasertib", inc) :- p_occupancy("PTK2(S843)", "Ipatasertib", dec).
0.001::p_fc("PTK2(S843)", "Ipatasertib", dec); 0.001::p_fc("PTK2(S843)", "Ipatasertib", inc) :- p_occupancy("PTK2(S843)", "Ipatasertib", inc).
0.001::p_fc("PTK2(S843)", "JNJ", dec); 0.001::p_fc("PTK2(S843)", "JNJ", inc) :- p_occupancy("PTK2(S843)", "JNJ", dec).
0.001::p_fc("PTK2(S843)", "JNJ", dec); 0.001::p_fc("PTK2(S843)", "JNJ", inc) :- p_occupancy("PTK2(S843)", "JNJ", inc).
0.001::p_fc("PTK2(S843)", "JNK", dec); 0.001::p_fc("PTK2(S843)", "JNK", inc) :- p_occupancy("PTK2(S843)", "JNK", dec).
0.001::p_fc("PTK2(S843)", "JNK", dec); 0.001::p_fc("PTK2(S843)", "JNK", inc) :- p_occupancy("PTK2(S843)", "JNK", inc).
0.001::p_fc("PTK2(S843)", "KD025", dec); 0.001::p_fc("PTK2(S843)", "KD025", inc) :- p_occupancy("PTK2(S843)", "KD025", dec).
0.001::p_fc("PTK2(S843)", "KD025", dec); 0.001::p_fc("PTK2(S843)", "KD025", inc) :- p_occupancy("PTK2(S843)", "KD025", inc).
0.001::p_fc("PTK2(S843)", "KN62", dec); 0.001::p_fc("PTK2(S843)", "KN62", inc) :- p_occupancy("PTK2(S843)", "KN62", dec).
0.001::p_fc("PTK2(S843)", "KN62", dec); 0.001::p_fc("PTK2(S843)", "KN62", inc) :- p_occupancy("PTK2(S843)", "KN62", inc).
0.001::p_fc("PTK2(S843)", "KN93", dec); 0.001::p_fc("PTK2(S843)", "KN93", inc) :- p_occupancy("PTK2(S843)", "KN93", dec).
0.001::p_fc("PTK2(S843)", "KN93", dec); 0.001::p_fc("PTK2(S843)", "KN93", inc) :- p_occupancy("PTK2(S843)", "KN93", inc).
0.9979582125::p_fc("PTK2(S843)", "Ku0063794", dec); 0.001::p_fc("PTK2(S843)", "Ku0063794", inc) :- p_occupancy("PTK2(S843)", "Ku0063794", dec).
0.001::p_fc("PTK2(S843)", "Ku0063794", dec); 0.9979582125::p_fc("PTK2(S843)", "Ku0063794", inc) :- p_occupancy("PTK2(S843)", "Ku0063794", inc).
0.001::p_fc("PTK2(S843)", "LY2090314", dec); 0.001::p_fc("PTK2(S843)", "LY2090314", inc) :- p_occupancy("PTK2(S843)", "LY2090314", dec).
0.001::p_fc("PTK2(S843)", "LY2090314", dec); 0.001::p_fc("PTK2(S843)", "LY2090314", inc) :- p_occupancy("PTK2(S843)", "LY2090314", inc).
0.001::p_fc("PTK2(S843)", "LY2584702", dec); 0.001::p_fc("PTK2(S843)", "LY2584702", inc) :- p_occupancy("PTK2(S843)", "LY2584702", dec).
0.001::p_fc("PTK2(S843)", "LY2584702", dec); 0.001::p_fc("PTK2(S843)", "LY2584702", inc) :- p_occupancy("PTK2(S843)", "LY2584702", inc).
0.001::p_fc("PTK2(S843)", "LY2835219", dec); 0.001::p_fc("PTK2(S843)", "LY2835219", inc) :- p_occupancy("PTK2(S843)", "LY2835219", dec).
0.001::p_fc("PTK2(S843)", "LY2835219", dec); 0.001::p_fc("PTK2(S843)", "LY2835219", inc) :- p_occupancy("PTK2(S843)", "LY2835219", inc).
0.001::p_fc("PTK2(S843)", "Linsitinib", dec); 0.001::p_fc("PTK2(S843)", "Linsitinib", inc) :- p_occupancy("PTK2(S843)", "Linsitinib", dec).
0.001::p_fc("PTK2(S843)", "Linsitinib", dec); 0.001::p_fc("PTK2(S843)", "Linsitinib", inc) :- p_occupancy("PTK2(S843)", "Linsitinib", inc).
0.001::p_fc("PTK2(S843)", "MK2206", dec); 0.001::p_fc("PTK2(S843)", "MK2206", inc) :- p_occupancy("PTK2(S843)", "MK2206", dec).
0.001::p_fc("PTK2(S843)", "MK2206", dec); 0.001::p_fc("PTK2(S843)", "MK2206", inc) :- p_occupancy("PTK2(S843)", "MK2206", inc).
0.001::p_fc("PTK2(S843)", "NU7441", dec); 0.001::p_fc("PTK2(S843)", "NU7441", inc) :- p_occupancy("PTK2(S843)", "NU7441", dec).
0.001::p_fc("PTK2(S843)", "NU7441", dec); 0.001::p_fc("PTK2(S843)", "NU7441", inc) :- p_occupancy("PTK2(S843)", "NU7441", inc).
0.9980014235::p_fc("PTK2(S843)", "PD153035", dec); 0.001::p_fc("PTK2(S843)", "PD153035", inc) :- p_occupancy("PTK2(S843)", "PD153035", dec).
0.001::p_fc("PTK2(S843)", "PD153035", dec); 0.9980014235::p_fc("PTK2(S843)", "PD153035", inc) :- p_occupancy("PTK2(S843)", "PD153035", inc).
0.9869151298::p_fc("PTK2(S843)", "PF3758309", dec); 0.001::p_fc("PTK2(S843)", "PF3758309", inc) :- p_occupancy("PTK2(S843)", "PF3758309", dec).
0.001::p_fc("PTK2(S843)", "PF3758309", dec); 0.9869151298::p_fc("PTK2(S843)", "PF3758309", inc) :- p_occupancy("PTK2(S843)", "PF3758309", inc).
0.001::p_fc("PTK2(S843)", "PF4708671", dec); 0.001::p_fc("PTK2(S843)", "PF4708671", inc) :- p_occupancy("PTK2(S843)", "PF4708671", dec).
0.001::p_fc("PTK2(S843)", "PF4708671", dec); 0.001::p_fc("PTK2(S843)", "PF4708671", inc) :- p_occupancy("PTK2(S843)", "PF4708671", inc).
0.001::p_fc("PTK2(S843)", "PH797804", dec); 0.001::p_fc("PTK2(S843)", "PH797804", inc) :- p_occupancy("PTK2(S843)", "PH797804", dec).
0.001::p_fc("PTK2(S843)", "PH797804", dec); 0.001::p_fc("PTK2(S843)", "PH797804", inc) :- p_occupancy("PTK2(S843)", "PH797804", inc).
0.001::p_fc("PTK2(S843)", "PIK294", dec); 0.001::p_fc("PTK2(S843)", "PIK294", inc) :- p_occupancy("PTK2(S843)", "PIK294", dec).
0.001::p_fc("PTK2(S843)", "PIK294", dec); 0.001::p_fc("PTK2(S843)", "PIK294", inc) :- p_occupancy("PTK2(S843)", "PIK294", inc).
0.001::p_fc("PTK2(S843)", "Ribociclib", dec); 0.001::p_fc("PTK2(S843)", "Ribociclib", inc) :- p_occupancy("PTK2(S843)", "Ribociclib", dec).
0.001::p_fc("PTK2(S843)", "Ribociclib", dec); 0.001::p_fc("PTK2(S843)", "Ribociclib", inc) :- p_occupancy("PTK2(S843)", "Ribociclib", inc).
0.001::p_fc("PTK2(S843)", "Ripasudil", dec); 0.001::p_fc("PTK2(S843)", "Ripasudil", inc) :- p_occupancy("PTK2(S843)", "Ripasudil", dec).
0.001::p_fc("PTK2(S843)", "Ripasudil", dec); 0.001::p_fc("PTK2(S843)", "Ripasudil", inc) :- p_occupancy("PTK2(S843)", "Ripasudil", inc).
0.001::p_fc("PTK2(S843)", "SP600125", dec); 0.001::p_fc("PTK2(S843)", "SP600125", inc) :- p_occupancy("PTK2(S843)", "SP600125", dec).
0.001::p_fc("PTK2(S843)", "SP600125", dec); 0.001::p_fc("PTK2(S843)", "SP600125", inc) :- p_occupancy("PTK2(S843)", "SP600125", inc).
0.001::p_fc("PTK2(S843)", "Selumetinib", dec); 0.001::p_fc("PTK2(S843)", "Selumetinib", inc) :- p_occupancy("PTK2(S843)", "Selumetinib", dec).
0.001::p_fc("PTK2(S843)", "Selumetinib", dec); 0.001::p_fc("PTK2(S843)", "Selumetinib", inc) :- p_occupancy("PTK2(S843)", "Selumetinib", inc).
0.001::p_fc("PTK2(S843)", "TAK715", dec); 0.001::p_fc("PTK2(S843)", "TAK715", inc) :- p_occupancy("PTK2(S843)", "TAK715", dec).
0.001::p_fc("PTK2(S843)", "TAK715", dec); 0.001::p_fc("PTK2(S843)", "TAK715", inc) :- p_occupancy("PTK2(S843)", "TAK715", inc).
0.001::p_fc("PTK2(S843)", "TBCA", dec); 0.001::p_fc("PTK2(S843)", "TBCA", inc) :- p_occupancy("PTK2(S843)", "TBCA", dec).
0.001::p_fc("PTK2(S843)", "TBCA", dec); 0.001::p_fc("PTK2(S843)", "TBCA", inc) :- p_occupancy("PTK2(S843)", "TBCA", inc).
0.001::p_fc("PTK2(S843)", "TGX221", dec); 0.001::p_fc("PTK2(S843)", "TGX221", inc) :- p_occupancy("PTK2(S843)", "TGX221", dec).
0.001::p_fc("PTK2(S843)", "TGX221", dec); 0.001::p_fc("PTK2(S843)", "TGX221", inc) :- p_occupancy("PTK2(S843)", "TGX221", inc).
0.001::p_fc("PTK2(S843)", "Tofacitinib", dec); 0.001::p_fc("PTK2(S843)", "Tofacitinib", inc) :- p_occupancy("PTK2(S843)", "Tofacitinib", dec).
0.001::p_fc("PTK2(S843)", "Tofacitinib", dec); 0.001::p_fc("PTK2(S843)", "Tofacitinib", inc) :- p_occupancy("PTK2(S843)", "Tofacitinib", inc).
0.997988508::p_fc("PTK2(S843)", "Torin", dec); 0.001::p_fc("PTK2(S843)", "Torin", inc) :- p_occupancy("PTK2(S843)", "Torin", dec).
0.001::p_fc("PTK2(S843)", "Torin", dec); 0.997988508::p_fc("PTK2(S843)", "Torin", inc) :- p_occupancy("PTK2(S843)", "Torin", inc).
0.9980043548::p_fc("PTK2(S843)", "Trametinib", dec); 0.001::p_fc("PTK2(S843)", "Trametinib", inc) :- p_occupancy("PTK2(S843)", "Trametinib", dec).
0.001::p_fc("PTK2(S843)", "Trametinib", dec); 0.9980043548::p_fc("PTK2(S843)", "Trametinib", inc) :- p_occupancy("PTK2(S843)", "Trametinib", inc).
0.001::p_fc("PTK2(S843)", "U73122", dec); 0.001::p_fc("PTK2(S843)", "U73122", inc) :- p_occupancy("PTK2(S843)", "U73122", dec).
0.001::p_fc("PTK2(S843)", "U73122", dec); 0.001::p_fc("PTK2(S843)", "U73122", inc) :- p_occupancy("PTK2(S843)", "U73122", inc).
0.001::p_fc("PTK2(S843)", "Ulixertinib", dec); 0.001::p_fc("PTK2(S843)", "Ulixertinib", inc) :- p_occupancy("PTK2(S843)", "Ulixertinib", dec).
0.001::p_fc("PTK2(S843)", "Ulixertinib", dec); 0.001::p_fc("PTK2(S843)", "Ulixertinib", inc) :- p_occupancy("PTK2(S843)", "Ulixertinib", inc).
0.001::p_fc("PTK2(S843)", "Vemurafenib", dec); 0.001::p_fc("PTK2(S843)", "Vemurafenib", inc) :- p_occupancy("PTK2(S843)", "Vemurafenib", dec).
0.001::p_fc("PTK2(S843)", "Vemurafenib", dec); 0.001::p_fc("PTK2(S843)", "Vemurafenib", inc) :- p_occupancy("PTK2(S843)", "Vemurafenib", inc).
0.9950263084::p_fc("PTK2(S910)", "AC220", dec); 0.001::p_fc("PTK2(S910)", "AC220", inc) :- p_occupancy("PTK2(S910)", "AC220", dec).
0.001::p_fc("PTK2(S910)", "AC220", dec); 0.9950263084::p_fc("PTK2(S910)", "AC220", inc) :- p_occupancy("PTK2(S910)", "AC220", inc).
0.3216506063::p_fc("PTK2(S910)", "AT13148", dec); 0.001::p_fc("PTK2(S910)", "AT13148", inc) :- p_occupancy("PTK2(S910)", "AT13148", dec).
0.001::p_fc("PTK2(S910)", "AT13148", dec); 0.3216506063::p_fc("PTK2(S910)", "AT13148", inc) :- p_occupancy("PTK2(S910)", "AT13148", inc).
0.0649564598::p_fc("PTK2(S910)", "AZ20", dec); 0.001::p_fc("PTK2(S910)", "AZ20", inc) :- p_occupancy("PTK2(S910)", "AZ20", dec).
0.001::p_fc("PTK2(S910)", "AZ20", dec); 0.0649564598::p_fc("PTK2(S910)", "AZ20", inc) :- p_occupancy("PTK2(S910)", "AZ20", inc).
0.8339870682::p_fc("PTK2(S910)", "AZD1480", dec); 0.001::p_fc("PTK2(S910)", "AZD1480", inc) :- p_occupancy("PTK2(S910)", "AZD1480", dec).
0.001::p_fc("PTK2(S910)", "AZD1480", dec); 0.8339870682::p_fc("PTK2(S910)", "AZD1480", inc) :- p_occupancy("PTK2(S910)", "AZD1480", inc).
0.5272957611::p_fc("PTK2(S910)", "AZD3759", dec); 0.001::p_fc("PTK2(S910)", "AZD3759", inc) :- p_occupancy("PTK2(S910)", "AZD3759", dec).
0.001::p_fc("PTK2(S910)", "AZD3759", dec); 0.5272957611::p_fc("PTK2(S910)", "AZD3759", inc) :- p_occupancy("PTK2(S910)", "AZD3759", inc).
0.8875147759::p_fc("PTK2(S910)", "AZD5363", dec); 0.001::p_fc("PTK2(S910)", "AZD5363", inc) :- p_occupancy("PTK2(S910)", "AZD5363", dec).
0.001::p_fc("PTK2(S910)", "AZD5363", dec); 0.8875147759::p_fc("PTK2(S910)", "AZD5363", inc) :- p_occupancy("PTK2(S910)", "AZD5363", inc).
0.2895195703::p_fc("PTK2(S910)", "AZD5438", dec); 0.001::p_fc("PTK2(S910)", "AZD5438", inc) :- p_occupancy("PTK2(S910)", "AZD5438", dec).
0.001::p_fc("PTK2(S910)", "AZD5438", dec); 0.2895195703::p_fc("PTK2(S910)", "AZD5438", inc) :- p_occupancy("PTK2(S910)", "AZD5438", inc).
0.2059588083::p_fc("PTK2(S910)", "AZD6482", dec); 0.001::p_fc("PTK2(S910)", "AZD6482", inc) :- p_occupancy("PTK2(S910)", "AZD6482", dec).
0.001::p_fc("PTK2(S910)", "AZD6482", dec); 0.2059588083::p_fc("PTK2(S910)", "AZD6482", inc) :- p_occupancy("PTK2(S910)", "AZD6482", inc).
0.0093909505::p_fc("PTK2(S910)", "AZD6738", dec); 0.001::p_fc("PTK2(S910)", "AZD6738", inc) :- p_occupancy("PTK2(S910)", "AZD6738", dec).
0.001::p_fc("PTK2(S910)", "AZD6738", dec); 0.0093909505::p_fc("PTK2(S910)", "AZD6738", inc) :- p_occupancy("PTK2(S910)", "AZD6738", inc).
0.9897511731::p_fc("PTK2(S910)", "AZD8055", dec); 0.001::p_fc("PTK2(S910)", "AZD8055", inc) :- p_occupancy("PTK2(S910)", "AZD8055", dec).
0.001::p_fc("PTK2(S910)", "AZD8055", dec); 0.9897511731::p_fc("PTK2(S910)", "AZD8055", inc) :- p_occupancy("PTK2(S910)", "AZD8055", inc).
0.1926141689::p_fc("PTK2(S910)", "Amuvatinib", dec); 0.001::p_fc("PTK2(S910)", "Amuvatinib", inc) :- p_occupancy("PTK2(S910)", "Amuvatinib", dec).
0.001::p_fc("PTK2(S910)", "Amuvatinib", dec); 0.1926141689::p_fc("PTK2(S910)", "Amuvatinib", inc) :- p_occupancy("PTK2(S910)", "Amuvatinib", inc).
0.3496446144::p_fc("PTK2(S910)", "BX912", dec); 0.001::p_fc("PTK2(S910)", "BX912", inc) :- p_occupancy("PTK2(S910)", "BX912", dec).
0.001::p_fc("PTK2(S910)", "BX912", dec); 0.3496446144::p_fc("PTK2(S910)", "BX912", inc) :- p_occupancy("PTK2(S910)", "BX912", inc).
0.521769616::p_fc("PTK2(S910)", "Bosutinib", dec); 0.001::p_fc("PTK2(S910)", "Bosutinib", inc) :- p_occupancy("PTK2(S910)", "Bosutinib", dec).
0.001::p_fc("PTK2(S910)", "Bosutinib", dec); 0.521769616::p_fc("PTK2(S910)", "Bosutinib", inc) :- p_occupancy("PTK2(S910)", "Bosutinib", inc).
0.3515276563::p_fc("PTK2(S910)", "CAL101", dec); 0.001::p_fc("PTK2(S910)", "CAL101", inc) :- p_occupancy("PTK2(S910)", "CAL101", dec).
0.001::p_fc("PTK2(S910)", "CAL101", dec); 0.3515276563::p_fc("PTK2(S910)", "CAL101", inc) :- p_occupancy("PTK2(S910)", "CAL101", inc).
0.678985521::p_fc("PTK2(S910)", "CHIR99021", dec); 0.001::p_fc("PTK2(S910)", "CHIR99021", inc) :- p_occupancy("PTK2(S910)", "CHIR99021", dec).
0.001::p_fc("PTK2(S910)", "CHIR99021", dec); 0.678985521::p_fc("PTK2(S910)", "CHIR99021", inc) :- p_occupancy("PTK2(S910)", "CHIR99021", inc).
0.7304490499::p_fc("PTK2(S910)", "CX4945", dec); 0.001::p_fc("PTK2(S910)", "CX4945", inc) :- p_occupancy("PTK2(S910)", "CX4945", dec).
0.001::p_fc("PTK2(S910)", "CX4945", dec); 0.7304490499::p_fc("PTK2(S910)", "CX4945", inc) :- p_occupancy("PTK2(S910)", "CX4945", inc).
0.8399366741::p_fc("PTK2(S910)", "DNAPK", dec); 0.001::p_fc("PTK2(S910)", "DNAPK", inc) :- p_occupancy("PTK2(S910)", "DNAPK", dec).
0.001::p_fc("PTK2(S910)", "DNAPK", dec); 0.8399366741::p_fc("PTK2(S910)", "DNAPK", inc) :- p_occupancy("PTK2(S910)", "DNAPK", inc).
0.7593019847::p_fc("PTK2(S910)", "Dabrafenib", dec); 0.001::p_fc("PTK2(S910)", "Dabrafenib", inc) :- p_occupancy("PTK2(S910)", "Dabrafenib", dec).
0.001::p_fc("PTK2(S910)", "Dabrafenib", dec); 0.7593019847::p_fc("PTK2(S910)", "Dabrafenib", inc) :- p_occupancy("PTK2(S910)", "Dabrafenib", inc).
0.3609259422::p_fc("PTK2(S910)", "Dasatinib", dec); 0.001::p_fc("PTK2(S910)", "Dasatinib", inc) :- p_occupancy("PTK2(S910)", "Dasatinib", dec).
0.001::p_fc("PTK2(S910)", "Dasatinib", dec); 0.3609259422::p_fc("PTK2(S910)", "Dasatinib", inc) :- p_occupancy("PTK2(S910)", "Dasatinib", inc).
0.9559968748::p_fc("PTK2(S910)", "Edelfosine", dec); 0.001::p_fc("PTK2(S910)", "Edelfosine", inc) :- p_occupancy("PTK2(S910)", "Edelfosine", dec).
0.001::p_fc("PTK2(S910)", "Edelfosine", dec); 0.9559968748::p_fc("PTK2(S910)", "Edelfosine", inc) :- p_occupancy("PTK2(S910)", "Edelfosine", inc).
0.4694197361::p_fc("PTK2(S910)", "FRAX486", dec); 0.001::p_fc("PTK2(S910)", "FRAX486", inc) :- p_occupancy("PTK2(S910)", "FRAX486", dec).
0.001::p_fc("PTK2(S910)", "FRAX486", dec); 0.4694197361::p_fc("PTK2(S910)", "FRAX486", inc) :- p_occupancy("PTK2(S910)", "FRAX486", inc).
0.216818571::p_fc("PTK2(S910)", "GDC0941", dec); 0.001::p_fc("PTK2(S910)", "GDC0941", inc) :- p_occupancy("PTK2(S910)", "GDC0941", dec).
0.001::p_fc("PTK2(S910)", "GDC0941", dec); 0.216818571::p_fc("PTK2(S910)", "GDC0941", inc) :- p_occupancy("PTK2(S910)", "GDC0941", inc).
0.9816540655::p_fc("PTK2(S910)", "GDC0994", dec); 0.001::p_fc("PTK2(S910)", "GDC0994", inc) :- p_occupancy("PTK2(S910)", "GDC0994", dec).
0.001::p_fc("PTK2(S910)", "GDC0994", dec); 0.9816540655::p_fc("PTK2(S910)", "GDC0994", inc) :- p_occupancy("PTK2(S910)", "GDC0994", inc).
0.6046840079::p_fc("PTK2(S910)", "GF109203X", dec); 0.001::p_fc("PTK2(S910)", "GF109203X", inc) :- p_occupancy("PTK2(S910)", "GF109203X", dec).
0.001::p_fc("PTK2(S910)", "GF109203X", dec); 0.6046840079::p_fc("PTK2(S910)", "GF109203X", inc) :- p_occupancy("PTK2(S910)", "GF109203X", inc).
0.4150946059::p_fc("PTK2(S910)", "GO6983", dec); 0.001::p_fc("PTK2(S910)", "GO6983", inc) :- p_occupancy("PTK2(S910)", "GO6983", dec).
0.001::p_fc("PTK2(S910)", "GO6983", dec); 0.4150946059::p_fc("PTK2(S910)", "GO6983", inc) :- p_occupancy("PTK2(S910)", "GO6983", inc).
0.9337276481::p_fc("PTK2(S910)", "GSK2334470", dec); 0.001::p_fc("PTK2(S910)", "GSK2334470", inc) :- p_occupancy("PTK2(S910)", "GSK2334470", dec).
0.001::p_fc("PTK2(S910)", "GSK2334470", dec); 0.9337276481::p_fc("PTK2(S910)", "GSK2334470", inc) :- p_occupancy("PTK2(S910)", "GSK2334470", inc).
0.0069445867::p_fc("PTK2(S910)", "GSK690693", dec); 0.001::p_fc("PTK2(S910)", "GSK690693", inc) :- p_occupancy("PTK2(S910)", "GSK690693", dec).
0.001::p_fc("PTK2(S910)", "GSK690693", dec); 0.0069445867::p_fc("PTK2(S910)", "GSK690693", inc) :- p_occupancy("PTK2(S910)", "GSK690693", inc).
0.9593785228::p_fc("PTK2(S910)", "Go6976", dec); 0.001::p_fc("PTK2(S910)", "Go6976", inc) :- p_occupancy("PTK2(S910)", "Go6976", dec).
0.001::p_fc("PTK2(S910)", "Go6976", dec); 0.9593785228::p_fc("PTK2(S910)", "Go6976", inc) :- p_occupancy("PTK2(S910)", "Go6976", inc).
0.0310907238::p_fc("PTK2(S910)", "H89", dec); 0.001::p_fc("PTK2(S910)", "H89", inc) :- p_occupancy("PTK2(S910)", "H89", dec).
0.001::p_fc("PTK2(S910)", "H89", dec); 0.0310907238::p_fc("PTK2(S910)", "H89", inc) :- p_occupancy("PTK2(S910)", "H89", inc).
0.3159981085::p_fc("PTK2(S910)", "HS173", dec); 0.001::p_fc("PTK2(S910)", "HS173", inc) :- p_occupancy("PTK2(S910)", "HS173", dec).
0.001::p_fc("PTK2(S910)", "HS173", dec); 0.3159981085::p_fc("PTK2(S910)", "HS173", inc) :- p_occupancy("PTK2(S910)", "HS173", inc).
0.9284252563::p_fc("PTK2(S910)", "Ipatasertib", dec); 0.001::p_fc("PTK2(S910)", "Ipatasertib", inc) :- p_occupancy("PTK2(S910)", "Ipatasertib", dec).
0.001::p_fc("PTK2(S910)", "Ipatasertib", dec); 0.9284252563::p_fc("PTK2(S910)", "Ipatasertib", inc) :- p_occupancy("PTK2(S910)", "Ipatasertib", inc).
0.52891667::p_fc("PTK2(S910)", "JNJ", dec); 0.001::p_fc("PTK2(S910)", "JNJ", inc) :- p_occupancy("PTK2(S910)", "JNJ", dec).
0.001::p_fc("PTK2(S910)", "JNJ", dec); 0.52891667::p_fc("PTK2(S910)", "JNJ", inc) :- p_occupancy("PTK2(S910)", "JNJ", inc).
0.653424062::p_fc("PTK2(S910)", "JNK", dec); 0.001::p_fc("PTK2(S910)", "JNK", inc) :- p_occupancy("PTK2(S910)", "JNK", dec).
0.001::p_fc("PTK2(S910)", "JNK", dec); 0.653424062::p_fc("PTK2(S910)", "JNK", inc) :- p_occupancy("PTK2(S910)", "JNK", inc).
0.9710394177::p_fc("PTK2(S910)", "KD025", dec); 0.001::p_fc("PTK2(S910)", "KD025", inc) :- p_occupancy("PTK2(S910)", "KD025", dec).
0.001::p_fc("PTK2(S910)", "KD025", dec); 0.9710394177::p_fc("PTK2(S910)", "KD025", inc) :- p_occupancy("PTK2(S910)", "KD025", inc).
0.0176779838::p_fc("PTK2(S910)", "KN62", dec); 0.001::p_fc("PTK2(S910)", "KN62", inc) :- p_occupancy("PTK2(S910)", "KN62", dec).
0.001::p_fc("PTK2(S910)", "KN62", dec); 0.0176779838::p_fc("PTK2(S910)", "KN62", inc) :- p_occupancy("PTK2(S910)", "KN62", inc).
0.6479908972::p_fc("PTK2(S910)", "KN93", dec); 0.001::p_fc("PTK2(S910)", "KN93", inc) :- p_occupancy("PTK2(S910)", "KN93", dec).
0.001::p_fc("PTK2(S910)", "KN93", dec); 0.6479908972::p_fc("PTK2(S910)", "KN93", inc) :- p_occupancy("PTK2(S910)", "KN93", inc).
0.260210494::p_fc("PTK2(S910)", "Ku0063794", dec); 0.001::p_fc("PTK2(S910)", "Ku0063794", inc) :- p_occupancy("PTK2(S910)", "Ku0063794", dec).
0.001::p_fc("PTK2(S910)", "Ku0063794", dec); 0.260210494::p_fc("PTK2(S910)", "Ku0063794", inc) :- p_occupancy("PTK2(S910)", "Ku0063794", inc).
0.4775253153::p_fc("PTK2(S910)", "LY2090314", dec); 0.001::p_fc("PTK2(S910)", "LY2090314", inc) :- p_occupancy("PTK2(S910)", "LY2090314", dec).
0.001::p_fc("PTK2(S910)", "LY2090314", dec); 0.4775253153::p_fc("PTK2(S910)", "LY2090314", inc) :- p_occupancy("PTK2(S910)", "LY2090314", inc).
0.4799166583::p_fc("PTK2(S910)", "LY2584702", dec); 0.001::p_fc("PTK2(S910)", "LY2584702", inc) :- p_occupancy("PTK2(S910)", "LY2584702", dec).
0.001::p_fc("PTK2(S910)", "LY2584702", dec); 0.4799166583::p_fc("PTK2(S910)", "LY2584702", inc) :- p_occupancy("PTK2(S910)", "LY2584702", inc).
0.4991395554::p_fc("PTK2(S910)", "LY2835219", dec); 0.001::p_fc("PTK2(S910)", "LY2835219", inc) :- p_occupancy("PTK2(S910)", "LY2835219", dec).
0.001::p_fc("PTK2(S910)", "LY2835219", dec); 0.4991395554::p_fc("PTK2(S910)", "LY2835219", inc) :- p_occupancy("PTK2(S910)", "LY2835219", inc).
0.1098122152::p_fc("PTK2(S910)", "Linsitinib", dec); 0.001::p_fc("PTK2(S910)", "Linsitinib", inc) :- p_occupancy("PTK2(S910)", "Linsitinib", dec).
0.001::p_fc("PTK2(S910)", "Linsitinib", dec); 0.1098122152::p_fc("PTK2(S910)", "Linsitinib", inc) :- p_occupancy("PTK2(S910)", "Linsitinib", inc).
0.0941798417::p_fc("PTK2(S910)", "MK2206", dec); 0.001::p_fc("PTK2(S910)", "MK2206", inc) :- p_occupancy("PTK2(S910)", "MK2206", dec).
0.001::p_fc("PTK2(S910)", "MK2206", dec); 0.0941798417::p_fc("PTK2(S910)", "MK2206", inc) :- p_occupancy("PTK2(S910)", "MK2206", inc).
0.550340087::p_fc("PTK2(S910)", "NU7441", dec); 0.001::p_fc("PTK2(S910)", "NU7441", inc) :- p_occupancy("PTK2(S910)", "NU7441", dec).
0.001::p_fc("PTK2(S910)", "NU7441", dec); 0.550340087::p_fc("PTK2(S910)", "NU7441", inc) :- p_occupancy("PTK2(S910)", "NU7441", inc).
0.151296506::p_fc("PTK2(S910)", "PD153035", dec); 0.001::p_fc("PTK2(S910)", "PD153035", inc) :- p_occupancy("PTK2(S910)", "PD153035", dec).
0.001::p_fc("PTK2(S910)", "PD153035", dec); 0.151296506::p_fc("PTK2(S910)", "PD153035", inc) :- p_occupancy("PTK2(S910)", "PD153035", inc).
0.8607378627::p_fc("PTK2(S910)", "PF3758309", dec); 0.001::p_fc("PTK2(S910)", "PF3758309", inc) :- p_occupancy("PTK2(S910)", "PF3758309", dec).
0.001::p_fc("PTK2(S910)", "PF3758309", dec); 0.8607378627::p_fc("PTK2(S910)", "PF3758309", inc) :- p_occupancy("PTK2(S910)", "PF3758309", inc).
0.1974269956::p_fc("PTK2(S910)", "PF4708671", dec); 0.001::p_fc("PTK2(S910)", "PF4708671", inc) :- p_occupancy("PTK2(S910)", "PF4708671", dec).
0.001::p_fc("PTK2(S910)", "PF4708671", dec); 0.1974269956::p_fc("PTK2(S910)", "PF4708671", inc) :- p_occupancy("PTK2(S910)", "PF4708671", inc).
0.887087389::p_fc("PTK2(S910)", "PH797804", dec); 0.001::p_fc("PTK2(S910)", "PH797804", inc) :- p_occupancy("PTK2(S910)", "PH797804", dec).
0.001::p_fc("PTK2(S910)", "PH797804", dec); 0.887087389::p_fc("PTK2(S910)", "PH797804", inc) :- p_occupancy("PTK2(S910)", "PH797804", inc).
0.9368542555::p_fc("PTK2(S910)", "PIK294", dec); 0.001::p_fc("PTK2(S910)", "PIK294", inc) :- p_occupancy("PTK2(S910)", "PIK294", dec).
0.001::p_fc("PTK2(S910)", "PIK294", dec); 0.9368542555::p_fc("PTK2(S910)", "PIK294", inc) :- p_occupancy("PTK2(S910)", "PIK294", inc).
0.8393706639::p_fc("PTK2(S910)", "Ribociclib", dec); 0.001::p_fc("PTK2(S910)", "Ribociclib", inc) :- p_occupancy("PTK2(S910)", "Ribociclib", dec).
0.001::p_fc("PTK2(S910)", "Ribociclib", dec); 0.8393706639::p_fc("PTK2(S910)", "Ribociclib", inc) :- p_occupancy("PTK2(S910)", "Ribociclib", inc).
0.8362445061::p_fc("PTK2(S910)", "Ripasudil", dec); 0.001::p_fc("PTK2(S910)", "Ripasudil", inc) :- p_occupancy("PTK2(S910)", "Ripasudil", dec).
0.001::p_fc("PTK2(S910)", "Ripasudil", dec); 0.8362445061::p_fc("PTK2(S910)", "Ripasudil", inc) :- p_occupancy("PTK2(S910)", "Ripasudil", inc).
0.2479909696::p_fc("PTK2(S910)", "SP600125", dec); 0.001::p_fc("PTK2(S910)", "SP600125", inc) :- p_occupancy("PTK2(S910)", "SP600125", dec).
0.001::p_fc("PTK2(S910)", "SP600125", dec); 0.2479909696::p_fc("PTK2(S910)", "SP600125", inc) :- p_occupancy("PTK2(S910)", "SP600125", inc).
0.989318787::p_fc("PTK2(S910)", "Selumetinib", dec); 0.001::p_fc("PTK2(S910)", "Selumetinib", inc) :- p_occupancy("PTK2(S910)", "Selumetinib", dec).
0.001::p_fc("PTK2(S910)", "Selumetinib", dec); 0.989318787::p_fc("PTK2(S910)", "Selumetinib", inc) :- p_occupancy("PTK2(S910)", "Selumetinib", inc).
0.9390560816::p_fc("PTK2(S910)", "TAK715", dec); 0.001::p_fc("PTK2(S910)", "TAK715", inc) :- p_occupancy("PTK2(S910)", "TAK715", dec).
0.001::p_fc("PTK2(S910)", "TAK715", dec); 0.9390560816::p_fc("PTK2(S910)", "TAK715", inc) :- p_occupancy("PTK2(S910)", "TAK715", inc).
0.2302646365::p_fc("PTK2(S910)", "TBCA", dec); 0.001::p_fc("PTK2(S910)", "TBCA", inc) :- p_occupancy("PTK2(S910)", "TBCA", dec).
0.001::p_fc("PTK2(S910)", "TBCA", dec); 0.2302646365::p_fc("PTK2(S910)", "TBCA", inc) :- p_occupancy("PTK2(S910)", "TBCA", inc).
0.8587454078::p_fc("PTK2(S910)", "TGX221", dec); 0.001::p_fc("PTK2(S910)", "TGX221", inc) :- p_occupancy("PTK2(S910)", "TGX221", dec).
0.001::p_fc("PTK2(S910)", "TGX221", dec); 0.8587454078::p_fc("PTK2(S910)", "TGX221", inc) :- p_occupancy("PTK2(S910)", "TGX221", inc).
0.6805857216::p_fc("PTK2(S910)", "Tofacitinib", dec); 0.001::p_fc("PTK2(S910)", "Tofacitinib", inc) :- p_occupancy("PTK2(S910)", "Tofacitinib", dec).
0.001::p_fc("PTK2(S910)", "Tofacitinib", dec); 0.6805857216::p_fc("PTK2(S910)", "Tofacitinib", inc) :- p_occupancy("PTK2(S910)", "Tofacitinib", inc).
0.6165177739::p_fc("PTK2(S910)", "Torin", dec); 0.001::p_fc("PTK2(S910)", "Torin", inc) :- p_occupancy("PTK2(S910)", "Torin", dec).
0.001::p_fc("PTK2(S910)", "Torin", dec); 0.6165177739::p_fc("PTK2(S910)", "Torin", inc) :- p_occupancy("PTK2(S910)", "Torin", inc).
0.7059498817::p_fc("PTK2(S910)", "Trametinib", dec); 0.001::p_fc("PTK2(S910)", "Trametinib", inc) :- p_occupancy("PTK2(S910)", "Trametinib", dec).
0.001::p_fc("PTK2(S910)", "Trametinib", dec); 0.7059498817::p_fc("PTK2(S910)", "Trametinib", inc) :- p_occupancy("PTK2(S910)", "Trametinib", inc).
0.9768735222::p_fc("PTK2(S910)", "U73122", dec); 0.001::p_fc("PTK2(S910)", "U73122", inc) :- p_occupancy("PTK2(S910)", "U73122", dec).
0.001::p_fc("PTK2(S910)", "U73122", dec); 0.9768735222::p_fc("PTK2(S910)", "U73122", inc) :- p_occupancy("PTK2(S910)", "U73122", inc).
0.9570424098::p_fc("PTK2(S910)", "Ulixertinib", dec); 0.001::p_fc("PTK2(S910)", "Ulixertinib", inc) :- p_occupancy("PTK2(S910)", "Ulixertinib", dec).
0.001::p_fc("PTK2(S910)", "Ulixertinib", dec); 0.9570424098::p_fc("PTK2(S910)", "Ulixertinib", inc) :- p_occupancy("PTK2(S910)", "Ulixertinib", inc).
0.1333938921::p_fc("PTK2(S910)", "Vemurafenib", dec); 0.001::p_fc("PTK2(S910)", "Vemurafenib", inc) :- p_occupancy("PTK2(S910)", "Vemurafenib", dec).
0.001::p_fc("PTK2(S910)", "Vemurafenib", dec); 0.1333938921::p_fc("PTK2(S910)", "Vemurafenib", inc) :- p_occupancy("PTK2(S910)", "Vemurafenib", inc).
0.9828624991::p_fc("PTPRG(S995)", "AC220", dec); 0.001::p_fc("PTPRG(S995)", "AC220", inc) :- p_occupancy("PTPRG(S995)", "AC220", dec).
0.001::p_fc("PTPRG(S995)", "AC220", dec); 0.9828624991::p_fc("PTPRG(S995)", "AC220", inc) :- p_occupancy("PTPRG(S995)", "AC220", inc).
0.3733476595::p_fc("PTPRG(S995)", "AT13148", dec); 0.001::p_fc("PTPRG(S995)", "AT13148", inc) :- p_occupancy("PTPRG(S995)", "AT13148", dec).
0.001::p_fc("PTPRG(S995)", "AT13148", dec); 0.3733476595::p_fc("PTPRG(S995)", "AT13148", inc) :- p_occupancy("PTPRG(S995)", "AT13148", inc).
0.2856771751::p_fc("PTPRG(S995)", "AZ20", dec); 0.001::p_fc("PTPRG(S995)", "AZ20", inc) :- p_occupancy("PTPRG(S995)", "AZ20", dec).
0.001::p_fc("PTPRG(S995)", "AZ20", dec); 0.2856771751::p_fc("PTPRG(S995)", "AZ20", inc) :- p_occupancy("PTPRG(S995)", "AZ20", inc).
0.0020742244::p_fc("PTPRG(S995)", "AZD1480", dec); 0.001::p_fc("PTPRG(S995)", "AZD1480", inc) :- p_occupancy("PTPRG(S995)", "AZD1480", dec).
0.001::p_fc("PTPRG(S995)", "AZD1480", dec); 0.0020742244::p_fc("PTPRG(S995)", "AZD1480", inc) :- p_occupancy("PTPRG(S995)", "AZD1480", inc).
0.3686749487::p_fc("PTPRG(S995)", "AZD3759", dec); 0.001::p_fc("PTPRG(S995)", "AZD3759", inc) :- p_occupancy("PTPRG(S995)", "AZD3759", dec).
0.001::p_fc("PTPRG(S995)", "AZD3759", dec); 0.3686749487::p_fc("PTPRG(S995)", "AZD3759", inc) :- p_occupancy("PTPRG(S995)", "AZD3759", inc).
0.3126529816::p_fc("PTPRG(S995)", "AZD5363", dec); 0.001::p_fc("PTPRG(S995)", "AZD5363", inc) :- p_occupancy("PTPRG(S995)", "AZD5363", dec).
0.001::p_fc("PTPRG(S995)", "AZD5363", dec); 0.3126529816::p_fc("PTPRG(S995)", "AZD5363", inc) :- p_occupancy("PTPRG(S995)", "AZD5363", inc).
0.206877942::p_fc("PTPRG(S995)", "AZD5438", dec); 0.001::p_fc("PTPRG(S995)", "AZD5438", inc) :- p_occupancy("PTPRG(S995)", "AZD5438", dec).
0.001::p_fc("PTPRG(S995)", "AZD5438", dec); 0.206877942::p_fc("PTPRG(S995)", "AZD5438", inc) :- p_occupancy("PTPRG(S995)", "AZD5438", inc).
0.0817555889::p_fc("PTPRG(S995)", "AZD6482", dec); 0.001::p_fc("PTPRG(S995)", "AZD6482", inc) :- p_occupancy("PTPRG(S995)", "AZD6482", dec).
0.001::p_fc("PTPRG(S995)", "AZD6482", dec); 0.0817555889::p_fc("PTPRG(S995)", "AZD6482", inc) :- p_occupancy("PTPRG(S995)", "AZD6482", inc).
0.6468660379::p_fc("PTPRG(S995)", "AZD6738", dec); 0.001::p_fc("PTPRG(S995)", "AZD6738", inc) :- p_occupancy("PTPRG(S995)", "AZD6738", dec).
0.001::p_fc("PTPRG(S995)", "AZD6738", dec); 0.6468660379::p_fc("PTPRG(S995)", "AZD6738", inc) :- p_occupancy("PTPRG(S995)", "AZD6738", inc).
0.0175007274::p_fc("PTPRG(S995)", "AZD8055", dec); 0.001::p_fc("PTPRG(S995)", "AZD8055", inc) :- p_occupancy("PTPRG(S995)", "AZD8055", dec).
0.001::p_fc("PTPRG(S995)", "AZD8055", dec); 0.0175007274::p_fc("PTPRG(S995)", "AZD8055", inc) :- p_occupancy("PTPRG(S995)", "AZD8055", inc).
0.1808788972::p_fc("PTPRG(S995)", "Amuvatinib", dec); 0.001::p_fc("PTPRG(S995)", "Amuvatinib", inc) :- p_occupancy("PTPRG(S995)", "Amuvatinib", dec).
0.001::p_fc("PTPRG(S995)", "Amuvatinib", dec); 0.1808788972::p_fc("PTPRG(S995)", "Amuvatinib", inc) :- p_occupancy("PTPRG(S995)", "Amuvatinib", inc).
0.0145628458::p_fc("PTPRG(S995)", "BX912", dec); 0.001::p_fc("PTPRG(S995)", "BX912", inc) :- p_occupancy("PTPRG(S995)", "BX912", dec).
0.001::p_fc("PTPRG(S995)", "BX912", dec); 0.0145628458::p_fc("PTPRG(S995)", "BX912", inc) :- p_occupancy("PTPRG(S995)", "BX912", inc).
0.881219228::p_fc("PTPRG(S995)", "Bosutinib", dec); 0.001::p_fc("PTPRG(S995)", "Bosutinib", inc) :- p_occupancy("PTPRG(S995)", "Bosutinib", dec).
0.001::p_fc("PTPRG(S995)", "Bosutinib", dec); 0.881219228::p_fc("PTPRG(S995)", "Bosutinib", inc) :- p_occupancy("PTPRG(S995)", "Bosutinib", inc).
0.8448459651::p_fc("PTPRG(S995)", "CAL101", dec); 0.001::p_fc("PTPRG(S995)", "CAL101", inc) :- p_occupancy("PTPRG(S995)", "CAL101", dec).
0.001::p_fc("PTPRG(S995)", "CAL101", dec); 0.8448459651::p_fc("PTPRG(S995)", "CAL101", inc) :- p_occupancy("PTPRG(S995)", "CAL101", inc).
0.0083477723::p_fc("PTPRG(S995)", "CHIR99021", dec); 0.001::p_fc("PTPRG(S995)", "CHIR99021", inc) :- p_occupancy("PTPRG(S995)", "CHIR99021", dec).
0.001::p_fc("PTPRG(S995)", "CHIR99021", dec); 0.0083477723::p_fc("PTPRG(S995)", "CHIR99021", inc) :- p_occupancy("PTPRG(S995)", "CHIR99021", inc).
0.024945273::p_fc("PTPRG(S995)", "CX4945", dec); 0.001::p_fc("PTPRG(S995)", "CX4945", inc) :- p_occupancy("PTPRG(S995)", "CX4945", dec).
0.001::p_fc("PTPRG(S995)", "CX4945", dec); 0.024945273::p_fc("PTPRG(S995)", "CX4945", inc) :- p_occupancy("PTPRG(S995)", "CX4945", inc).
0.3514782035::p_fc("PTPRG(S995)", "DNAPK", dec); 0.001::p_fc("PTPRG(S995)", "DNAPK", inc) :- p_occupancy("PTPRG(S995)", "DNAPK", dec).
0.001::p_fc("PTPRG(S995)", "DNAPK", dec); 0.3514782035::p_fc("PTPRG(S995)", "DNAPK", inc) :- p_occupancy("PTPRG(S995)", "DNAPK", inc).
0.4611202009::p_fc("PTPRG(S995)", "Dabrafenib", dec); 0.001::p_fc("PTPRG(S995)", "Dabrafenib", inc) :- p_occupancy("PTPRG(S995)", "Dabrafenib", dec).
0.001::p_fc("PTPRG(S995)", "Dabrafenib", dec); 0.4611202009::p_fc("PTPRG(S995)", "Dabrafenib", inc) :- p_occupancy("PTPRG(S995)", "Dabrafenib", inc).
0.6372992957::p_fc("PTPRG(S995)", "Dasatinib", dec); 0.001::p_fc("PTPRG(S995)", "Dasatinib", inc) :- p_occupancy("PTPRG(S995)", "Dasatinib", dec).
0.001::p_fc("PTPRG(S995)", "Dasatinib", dec); 0.6372992957::p_fc("PTPRG(S995)", "Dasatinib", inc) :- p_occupancy("PTPRG(S995)", "Dasatinib", inc).
0.3468018383::p_fc("PTPRG(S995)", "Edelfosine", dec); 0.001::p_fc("PTPRG(S995)", "Edelfosine", inc) :- p_occupancy("PTPRG(S995)", "Edelfosine", dec).
0.001::p_fc("PTPRG(S995)", "Edelfosine", dec); 0.3468018383::p_fc("PTPRG(S995)", "Edelfosine", inc) :- p_occupancy("PTPRG(S995)", "Edelfosine", inc).
0.3253641924::p_fc("PTPRG(S995)", "FRAX486", dec); 0.001::p_fc("PTPRG(S995)", "FRAX486", inc) :- p_occupancy("PTPRG(S995)", "FRAX486", dec).
0.001::p_fc("PTPRG(S995)", "FRAX486", dec); 0.3253641924::p_fc("PTPRG(S995)", "FRAX486", inc) :- p_occupancy("PTPRG(S995)", "FRAX486", inc).
0.1092181517::p_fc("PTPRG(S995)", "GDC0941", dec); 0.001::p_fc("PTPRG(S995)", "GDC0941", inc) :- p_occupancy("PTPRG(S995)", "GDC0941", dec).
0.001::p_fc("PTPRG(S995)", "GDC0941", dec); 0.1092181517::p_fc("PTPRG(S995)", "GDC0941", inc) :- p_occupancy("PTPRG(S995)", "GDC0941", inc).
0.1986022561::p_fc("PTPRG(S995)", "GDC0994", dec); 0.001::p_fc("PTPRG(S995)", "GDC0994", inc) :- p_occupancy("PTPRG(S995)", "GDC0994", dec).
0.001::p_fc("PTPRG(S995)", "GDC0994", dec); 0.1986022561::p_fc("PTPRG(S995)", "GDC0994", inc) :- p_occupancy("PTPRG(S995)", "GDC0994", inc).
0.5126727595::p_fc("PTPRG(S995)", "GF109203X", dec); 0.001::p_fc("PTPRG(S995)", "GF109203X", inc) :- p_occupancy("PTPRG(S995)", "GF109203X", dec).
0.001::p_fc("PTPRG(S995)", "GF109203X", dec); 0.5126727595::p_fc("PTPRG(S995)", "GF109203X", inc) :- p_occupancy("PTPRG(S995)", "GF109203X", inc).
0.589223803::p_fc("PTPRG(S995)", "GO6983", dec); 0.001::p_fc("PTPRG(S995)", "GO6983", inc) :- p_occupancy("PTPRG(S995)", "GO6983", dec).
0.001::p_fc("PTPRG(S995)", "GO6983", dec); 0.589223803::p_fc("PTPRG(S995)", "GO6983", inc) :- p_occupancy("PTPRG(S995)", "GO6983", inc).
0.0747156967::p_fc("PTPRG(S995)", "GSK2334470", dec); 0.001::p_fc("PTPRG(S995)", "GSK2334470", inc) :- p_occupancy("PTPRG(S995)", "GSK2334470", dec).
0.001::p_fc("PTPRG(S995)", "GSK2334470", dec); 0.0747156967::p_fc("PTPRG(S995)", "GSK2334470", inc) :- p_occupancy("PTPRG(S995)", "GSK2334470", inc).
0.4892107482::p_fc("PTPRG(S995)", "GSK690693", dec); 0.001::p_fc("PTPRG(S995)", "GSK690693", inc) :- p_occupancy("PTPRG(S995)", "GSK690693", dec).
0.001::p_fc("PTPRG(S995)", "GSK690693", dec); 0.4892107482::p_fc("PTPRG(S995)", "GSK690693", inc) :- p_occupancy("PTPRG(S995)", "GSK690693", inc).
0.8675223257::p_fc("PTPRG(S995)", "Go6976", dec); 0.001::p_fc("PTPRG(S995)", "Go6976", inc) :- p_occupancy("PTPRG(S995)", "Go6976", dec).
0.001::p_fc("PTPRG(S995)", "Go6976", dec); 0.8675223257::p_fc("PTPRG(S995)", "Go6976", inc) :- p_occupancy("PTPRG(S995)", "Go6976", inc).
0.6024264631::p_fc("PTPRG(S995)", "H89", dec); 0.001::p_fc("PTPRG(S995)", "H89", inc) :- p_occupancy("PTPRG(S995)", "H89", dec).
0.001::p_fc("PTPRG(S995)", "H89", dec); 0.6024264631::p_fc("PTPRG(S995)", "H89", inc) :- p_occupancy("PTPRG(S995)", "H89", inc).
0.3417022009::p_fc("PTPRG(S995)", "HS173", dec); 0.001::p_fc("PTPRG(S995)", "HS173", inc) :- p_occupancy("PTPRG(S995)", "HS173", dec).
0.001::p_fc("PTPRG(S995)", "HS173", dec); 0.3417022009::p_fc("PTPRG(S995)", "HS173", inc) :- p_occupancy("PTPRG(S995)", "HS173", inc).
0.0022559943::p_fc("PTPRG(S995)", "Ipatasertib", dec); 0.001::p_fc("PTPRG(S995)", "Ipatasertib", inc) :- p_occupancy("PTPRG(S995)", "Ipatasertib", dec).
0.001::p_fc("PTPRG(S995)", "Ipatasertib", dec); 0.0022559943::p_fc("PTPRG(S995)", "Ipatasertib", inc) :- p_occupancy("PTPRG(S995)", "Ipatasertib", inc).
0.9067413274::p_fc("PTPRG(S995)", "JNJ", dec); 0.001::p_fc("PTPRG(S995)", "JNJ", inc) :- p_occupancy("PTPRG(S995)", "JNJ", dec).
0.001::p_fc("PTPRG(S995)", "JNJ", dec); 0.9067413274::p_fc("PTPRG(S995)", "JNJ", inc) :- p_occupancy("PTPRG(S995)", "JNJ", inc).
0.7431187138::p_fc("PTPRG(S995)", "JNK", dec); 0.001::p_fc("PTPRG(S995)", "JNK", inc) :- p_occupancy("PTPRG(S995)", "JNK", dec).
0.001::p_fc("PTPRG(S995)", "JNK", dec); 0.7431187138::p_fc("PTPRG(S995)", "JNK", inc) :- p_occupancy("PTPRG(S995)", "JNK", inc).
0.687305045::p_fc("PTPRG(S995)", "KD025", dec); 0.001::p_fc("PTPRG(S995)", "KD025", inc) :- p_occupancy("PTPRG(S995)", "KD025", dec).
0.001::p_fc("PTPRG(S995)", "KD025", dec); 0.687305045::p_fc("PTPRG(S995)", "KD025", inc) :- p_occupancy("PTPRG(S995)", "KD025", inc).
0.802888725::p_fc("PTPRG(S995)", "KN62", dec); 0.001::p_fc("PTPRG(S995)", "KN62", inc) :- p_occupancy("PTPRG(S995)", "KN62", dec).
0.001::p_fc("PTPRG(S995)", "KN62", dec); 0.802888725::p_fc("PTPRG(S995)", "KN62", inc) :- p_occupancy("PTPRG(S995)", "KN62", inc).
0.457110525::p_fc("PTPRG(S995)", "KN93", dec); 0.001::p_fc("PTPRG(S995)", "KN93", inc) :- p_occupancy("PTPRG(S995)", "KN93", dec).
0.001::p_fc("PTPRG(S995)", "KN93", dec); 0.457110525::p_fc("PTPRG(S995)", "KN93", inc) :- p_occupancy("PTPRG(S995)", "KN93", inc).
0.9388790502::p_fc("PTPRG(S995)", "Ku0063794", dec); 0.001::p_fc("PTPRG(S995)", "Ku0063794", inc) :- p_occupancy("PTPRG(S995)", "Ku0063794", dec).
0.001::p_fc("PTPRG(S995)", "Ku0063794", dec); 0.9388790502::p_fc("PTPRG(S995)", "Ku0063794", inc) :- p_occupancy("PTPRG(S995)", "Ku0063794", inc).
0.2780501517::p_fc("PTPRG(S995)", "LY2090314", dec); 0.001::p_fc("PTPRG(S995)", "LY2090314", inc) :- p_occupancy("PTPRG(S995)", "LY2090314", dec).
0.001::p_fc("PTPRG(S995)", "LY2090314", dec); 0.2780501517::p_fc("PTPRG(S995)", "LY2090314", inc) :- p_occupancy("PTPRG(S995)", "LY2090314", inc).
0.7708101476::p_fc("PTPRG(S995)", "LY2584702", dec); 0.001::p_fc("PTPRG(S995)", "LY2584702", inc) :- p_occupancy("PTPRG(S995)", "LY2584702", dec).
0.001::p_fc("PTPRG(S995)", "LY2584702", dec); 0.7708101476::p_fc("PTPRG(S995)", "LY2584702", inc) :- p_occupancy("PTPRG(S995)", "LY2584702", inc).
0.5501190102::p_fc("PTPRG(S995)", "LY2835219", dec); 0.001::p_fc("PTPRG(S995)", "LY2835219", inc) :- p_occupancy("PTPRG(S995)", "LY2835219", dec).
0.001::p_fc("PTPRG(S995)", "LY2835219", dec); 0.5501190102::p_fc("PTPRG(S995)", "LY2835219", inc) :- p_occupancy("PTPRG(S995)", "LY2835219", inc).
0.31199445::p_fc("PTPRG(S995)", "Linsitinib", dec); 0.001::p_fc("PTPRG(S995)", "Linsitinib", inc) :- p_occupancy("PTPRG(S995)", "Linsitinib", dec).
0.001::p_fc("PTPRG(S995)", "Linsitinib", dec); 0.31199445::p_fc("PTPRG(S995)", "Linsitinib", inc) :- p_occupancy("PTPRG(S995)", "Linsitinib", inc).
0.4884245758::p_fc("PTPRG(S995)", "MK2206", dec); 0.001::p_fc("PTPRG(S995)", "MK2206", inc) :- p_occupancy("PTPRG(S995)", "MK2206", dec).
0.001::p_fc("PTPRG(S995)", "MK2206", dec); 0.4884245758::p_fc("PTPRG(S995)", "MK2206", inc) :- p_occupancy("PTPRG(S995)", "MK2206", inc).
0.5840288368::p_fc("PTPRG(S995)", "NU7441", dec); 0.001::p_fc("PTPRG(S995)", "NU7441", inc) :- p_occupancy("PTPRG(S995)", "NU7441", dec).
0.001::p_fc("PTPRG(S995)", "NU7441", dec); 0.5840288368::p_fc("PTPRG(S995)", "NU7441", inc) :- p_occupancy("PTPRG(S995)", "NU7441", inc).
0.9114521055::p_fc("PTPRG(S995)", "PD153035", dec); 0.001::p_fc("PTPRG(S995)", "PD153035", inc) :- p_occupancy("PTPRG(S995)", "PD153035", dec).
0.001::p_fc("PTPRG(S995)", "PD153035", dec); 0.9114521055::p_fc("PTPRG(S995)", "PD153035", inc) :- p_occupancy("PTPRG(S995)", "PD153035", inc).
0.9935868099::p_fc("PTPRG(S995)", "PF3758309", dec); 0.001::p_fc("PTPRG(S995)", "PF3758309", inc) :- p_occupancy("PTPRG(S995)", "PF3758309", dec).
0.001::p_fc("PTPRG(S995)", "PF3758309", dec); 0.9935868099::p_fc("PTPRG(S995)", "PF3758309", inc) :- p_occupancy("PTPRG(S995)", "PF3758309", inc).
0.3047187122::p_fc("PTPRG(S995)", "PF4708671", dec); 0.001::p_fc("PTPRG(S995)", "PF4708671", inc) :- p_occupancy("PTPRG(S995)", "PF4708671", dec).
0.001::p_fc("PTPRG(S995)", "PF4708671", dec); 0.3047187122::p_fc("PTPRG(S995)", "PF4708671", inc) :- p_occupancy("PTPRG(S995)", "PF4708671", inc).
0.0652618694::p_fc("PTPRG(S995)", "PH797804", dec); 0.001::p_fc("PTPRG(S995)", "PH797804", inc) :- p_occupancy("PTPRG(S995)", "PH797804", dec).
0.001::p_fc("PTPRG(S995)", "PH797804", dec); 0.0652618694::p_fc("PTPRG(S995)", "PH797804", inc) :- p_occupancy("PTPRG(S995)", "PH797804", inc).
0.040472002::p_fc("PTPRG(S995)", "PIK294", dec); 0.001::p_fc("PTPRG(S995)", "PIK294", inc) :- p_occupancy("PTPRG(S995)", "PIK294", dec).
0.001::p_fc("PTPRG(S995)", "PIK294", dec); 0.040472002::p_fc("PTPRG(S995)", "PIK294", inc) :- p_occupancy("PTPRG(S995)", "PIK294", inc).
0.1118489389::p_fc("PTPRG(S995)", "Ribociclib", dec); 0.001::p_fc("PTPRG(S995)", "Ribociclib", inc) :- p_occupancy("PTPRG(S995)", "Ribociclib", dec).
0.001::p_fc("PTPRG(S995)", "Ribociclib", dec); 0.1118489389::p_fc("PTPRG(S995)", "Ribociclib", inc) :- p_occupancy("PTPRG(S995)", "Ribociclib", inc).
0.4652510621::p_fc("PTPRG(S995)", "Ripasudil", dec); 0.001::p_fc("PTPRG(S995)", "Ripasudil", inc) :- p_occupancy("PTPRG(S995)", "Ripasudil", dec).
0.001::p_fc("PTPRG(S995)", "Ripasudil", dec); 0.4652510621::p_fc("PTPRG(S995)", "Ripasudil", inc) :- p_occupancy("PTPRG(S995)", "Ripasudil", inc).
0.8470685205::p_fc("PTPRG(S995)", "SP600125", dec); 0.001::p_fc("PTPRG(S995)", "SP600125", inc) :- p_occupancy("PTPRG(S995)", "SP600125", dec).
0.001::p_fc("PTPRG(S995)", "SP600125", dec); 0.8470685205::p_fc("PTPRG(S995)", "SP600125", inc) :- p_occupancy("PTPRG(S995)", "SP600125", inc).
0.988168552::p_fc("PTPRG(S995)", "Selumetinib", dec); 0.001::p_fc("PTPRG(S995)", "Selumetinib", inc) :- p_occupancy("PTPRG(S995)", "Selumetinib", dec).
0.001::p_fc("PTPRG(S995)", "Selumetinib", dec); 0.988168552::p_fc("PTPRG(S995)", "Selumetinib", inc) :- p_occupancy("PTPRG(S995)", "Selumetinib", inc).
0.7305567364::p_fc("PTPRG(S995)", "TAK715", dec); 0.001::p_fc("PTPRG(S995)", "TAK715", inc) :- p_occupancy("PTPRG(S995)", "TAK715", dec).
0.001::p_fc("PTPRG(S995)", "TAK715", dec); 0.7305567364::p_fc("PTPRG(S995)", "TAK715", inc) :- p_occupancy("PTPRG(S995)", "TAK715", inc).
0.8953113895::p_fc("PTPRG(S995)", "TBCA", dec); 0.001::p_fc("PTPRG(S995)", "TBCA", inc) :- p_occupancy("PTPRG(S995)", "TBCA", dec).
0.001::p_fc("PTPRG(S995)", "TBCA", dec); 0.8953113895::p_fc("PTPRG(S995)", "TBCA", inc) :- p_occupancy("PTPRG(S995)", "TBCA", inc).
0.5757162795::p_fc("PTPRG(S995)", "TGX221", dec); 0.001::p_fc("PTPRG(S995)", "TGX221", inc) :- p_occupancy("PTPRG(S995)", "TGX221", dec).
0.001::p_fc("PTPRG(S995)", "TGX221", dec); 0.5757162795::p_fc("PTPRG(S995)", "TGX221", inc) :- p_occupancy("PTPRG(S995)", "TGX221", inc).
0.1576942963::p_fc("PTPRG(S995)", "Tofacitinib", dec); 0.001::p_fc("PTPRG(S995)", "Tofacitinib", inc) :- p_occupancy("PTPRG(S995)", "Tofacitinib", dec).
0.001::p_fc("PTPRG(S995)", "Tofacitinib", dec); 0.1576942963::p_fc("PTPRG(S995)", "Tofacitinib", inc) :- p_occupancy("PTPRG(S995)", "Tofacitinib", inc).
0.5460709687::p_fc("PTPRG(S995)", "Torin", dec); 0.001::p_fc("PTPRG(S995)", "Torin", inc) :- p_occupancy("PTPRG(S995)", "Torin", dec).
0.001::p_fc("PTPRG(S995)", "Torin", dec); 0.5460709687::p_fc("PTPRG(S995)", "Torin", inc) :- p_occupancy("PTPRG(S995)", "Torin", inc).
0.8811360439::p_fc("PTPRG(S995)", "Trametinib", dec); 0.001::p_fc("PTPRG(S995)", "Trametinib", inc) :- p_occupancy("PTPRG(S995)", "Trametinib", dec).
0.001::p_fc("PTPRG(S995)", "Trametinib", dec); 0.8811360439::p_fc("PTPRG(S995)", "Trametinib", inc) :- p_occupancy("PTPRG(S995)", "Trametinib", inc).
0.3800709894::p_fc("PTPRG(S995)", "U73122", dec); 0.001::p_fc("PTPRG(S995)", "U73122", inc) :- p_occupancy("PTPRG(S995)", "U73122", dec).
0.001::p_fc("PTPRG(S995)", "U73122", dec); 0.3800709894::p_fc("PTPRG(S995)", "U73122", inc) :- p_occupancy("PTPRG(S995)", "U73122", inc).
0.6346853923::p_fc("PTPRG(S995)", "Ulixertinib", dec); 0.001::p_fc("PTPRG(S995)", "Ulixertinib", inc) :- p_occupancy("PTPRG(S995)", "Ulixertinib", dec).
0.001::p_fc("PTPRG(S995)", "Ulixertinib", dec); 0.6346853923::p_fc("PTPRG(S995)", "Ulixertinib", inc) :- p_occupancy("PTPRG(S995)", "Ulixertinib", inc).
0.9891710104::p_fc("PTPRG(S995)", "Vemurafenib", dec); 0.001::p_fc("PTPRG(S995)", "Vemurafenib", inc) :- p_occupancy("PTPRG(S995)", "Vemurafenib", dec).
0.001::p_fc("PTPRG(S995)", "Vemurafenib", dec); 0.9891710104::p_fc("PTPRG(S995)", "Vemurafenib", inc) :- p_occupancy("PTPRG(S995)", "Vemurafenib", inc).
0.0223689678::p_fc("PTTG1IP(Y174)", "AC220", dec); 0.001::p_fc("PTTG1IP(Y174)", "AC220", inc) :- p_occupancy("PTTG1IP(Y174)", "AC220", dec).
0.001::p_fc("PTTG1IP(Y174)", "AC220", dec); 0.0223689678::p_fc("PTTG1IP(Y174)", "AC220", inc) :- p_occupancy("PTTG1IP(Y174)", "AC220", inc).
0.4580916279::p_fc("PTTG1IP(Y174)", "AT13148", dec); 0.001::p_fc("PTTG1IP(Y174)", "AT13148", inc) :- p_occupancy("PTTG1IP(Y174)", "AT13148", dec).
0.001::p_fc("PTTG1IP(Y174)", "AT13148", dec); 0.4580916279::p_fc("PTTG1IP(Y174)", "AT13148", inc) :- p_occupancy("PTTG1IP(Y174)", "AT13148", inc).
0.4284118133::p_fc("PTTG1IP(Y174)", "AZ20", dec); 0.001::p_fc("PTTG1IP(Y174)", "AZ20", inc) :- p_occupancy("PTTG1IP(Y174)", "AZ20", dec).
0.001::p_fc("PTTG1IP(Y174)", "AZ20", dec); 0.4284118133::p_fc("PTTG1IP(Y174)", "AZ20", inc) :- p_occupancy("PTTG1IP(Y174)", "AZ20", inc).
0.8663047357::p_fc("PTTG1IP(Y174)", "AZD1480", dec); 0.001::p_fc("PTTG1IP(Y174)", "AZD1480", inc) :- p_occupancy("PTTG1IP(Y174)", "AZD1480", dec).
0.001::p_fc("PTTG1IP(Y174)", "AZD1480", dec); 0.8663047357::p_fc("PTTG1IP(Y174)", "AZD1480", inc) :- p_occupancy("PTTG1IP(Y174)", "AZD1480", inc).
0.9980017744::p_fc("PTTG1IP(Y174)", "AZD3759", dec); 0.001::p_fc("PTTG1IP(Y174)", "AZD3759", inc) :- p_occupancy("PTTG1IP(Y174)", "AZD3759", dec).
0.001::p_fc("PTTG1IP(Y174)", "AZD3759", dec); 0.9980017744::p_fc("PTTG1IP(Y174)", "AZD3759", inc) :- p_occupancy("PTTG1IP(Y174)", "AZD3759", inc).
0.8503234834::p_fc("PTTG1IP(Y174)", "AZD5363", dec); 0.001::p_fc("PTTG1IP(Y174)", "AZD5363", inc) :- p_occupancy("PTTG1IP(Y174)", "AZD5363", dec).
0.001::p_fc("PTTG1IP(Y174)", "AZD5363", dec); 0.8503234834::p_fc("PTTG1IP(Y174)", "AZD5363", inc) :- p_occupancy("PTTG1IP(Y174)", "AZD5363", inc).
0.6873261211::p_fc("PTTG1IP(Y174)", "AZD5438", dec); 0.001::p_fc("PTTG1IP(Y174)", "AZD5438", inc) :- p_occupancy("PTTG1IP(Y174)", "AZD5438", dec).
0.001::p_fc("PTTG1IP(Y174)", "AZD5438", dec); 0.6873261211::p_fc("PTTG1IP(Y174)", "AZD5438", inc) :- p_occupancy("PTTG1IP(Y174)", "AZD5438", inc).
0.5699535421::p_fc("PTTG1IP(Y174)", "AZD6482", dec); 0.001::p_fc("PTTG1IP(Y174)", "AZD6482", inc) :- p_occupancy("PTTG1IP(Y174)", "AZD6482", dec).
0.001::p_fc("PTTG1IP(Y174)", "AZD6482", dec); 0.5699535421::p_fc("PTTG1IP(Y174)", "AZD6482", inc) :- p_occupancy("PTTG1IP(Y174)", "AZD6482", inc).
0.2826782486::p_fc("PTTG1IP(Y174)", "AZD6738", dec); 0.001::p_fc("PTTG1IP(Y174)", "AZD6738", inc) :- p_occupancy("PTTG1IP(Y174)", "AZD6738", dec).
0.001::p_fc("PTTG1IP(Y174)", "AZD6738", dec); 0.2826782486::p_fc("PTTG1IP(Y174)", "AZD6738", inc) :- p_occupancy("PTTG1IP(Y174)", "AZD6738", inc).
0.5124266709::p_fc("PTTG1IP(Y174)", "AZD8055", dec); 0.001::p_fc("PTTG1IP(Y174)", "AZD8055", inc) :- p_occupancy("PTTG1IP(Y174)", "AZD8055", dec).
0.001::p_fc("PTTG1IP(Y174)", "AZD8055", dec); 0.5124266709::p_fc("PTTG1IP(Y174)", "AZD8055", inc) :- p_occupancy("PTTG1IP(Y174)", "AZD8055", inc).
0.7579646581::p_fc("PTTG1IP(Y174)", "Amuvatinib", dec); 0.001::p_fc("PTTG1IP(Y174)", "Amuvatinib", inc) :- p_occupancy("PTTG1IP(Y174)", "Amuvatinib", dec).
0.001::p_fc("PTTG1IP(Y174)", "Amuvatinib", dec); 0.7579646581::p_fc("PTTG1IP(Y174)", "Amuvatinib", inc) :- p_occupancy("PTTG1IP(Y174)", "Amuvatinib", inc).
0.7666181059::p_fc("PTTG1IP(Y174)", "BX912", dec); 0.001::p_fc("PTTG1IP(Y174)", "BX912", inc) :- p_occupancy("PTTG1IP(Y174)", "BX912", dec).
0.001::p_fc("PTTG1IP(Y174)", "BX912", dec); 0.7666181059::p_fc("PTTG1IP(Y174)", "BX912", inc) :- p_occupancy("PTTG1IP(Y174)", "BX912", inc).
0.2454108331::p_fc("PTTG1IP(Y174)", "Bosutinib", dec); 0.001::p_fc("PTTG1IP(Y174)", "Bosutinib", inc) :- p_occupancy("PTTG1IP(Y174)", "Bosutinib", dec).
0.001::p_fc("PTTG1IP(Y174)", "Bosutinib", dec); 0.2454108331::p_fc("PTTG1IP(Y174)", "Bosutinib", inc) :- p_occupancy("PTTG1IP(Y174)", "Bosutinib", inc).
0.2255344623::p_fc("PTTG1IP(Y174)", "CAL101", dec); 0.001::p_fc("PTTG1IP(Y174)", "CAL101", inc) :- p_occupancy("PTTG1IP(Y174)", "CAL101", dec).
0.001::p_fc("PTTG1IP(Y174)", "CAL101", dec); 0.2255344623::p_fc("PTTG1IP(Y174)", "CAL101", inc) :- p_occupancy("PTTG1IP(Y174)", "CAL101", inc).
0.489484829::p_fc("PTTG1IP(Y174)", "CHIR99021", dec); 0.001::p_fc("PTTG1IP(Y174)", "CHIR99021", inc) :- p_occupancy("PTTG1IP(Y174)", "CHIR99021", dec).
0.001::p_fc("PTTG1IP(Y174)", "CHIR99021", dec); 0.489484829::p_fc("PTTG1IP(Y174)", "CHIR99021", inc) :- p_occupancy("PTTG1IP(Y174)", "CHIR99021", inc).
0.5229503746::p_fc("PTTG1IP(Y174)", "CX4945", dec); 0.001::p_fc("PTTG1IP(Y174)", "CX4945", inc) :- p_occupancy("PTTG1IP(Y174)", "CX4945", dec).
0.001::p_fc("PTTG1IP(Y174)", "CX4945", dec); 0.5229503746::p_fc("PTTG1IP(Y174)", "CX4945", inc) :- p_occupancy("PTTG1IP(Y174)", "CX4945", inc).
0.6400742923::p_fc("PTTG1IP(Y174)", "DNAPK", dec); 0.001::p_fc("PTTG1IP(Y174)", "DNAPK", inc) :- p_occupancy("PTTG1IP(Y174)", "DNAPK", dec).
0.001::p_fc("PTTG1IP(Y174)", "DNAPK", dec); 0.6400742923::p_fc("PTTG1IP(Y174)", "DNAPK", inc) :- p_occupancy("PTTG1IP(Y174)", "DNAPK", inc).
0.852988196::p_fc("PTTG1IP(Y174)", "Dabrafenib", dec); 0.001::p_fc("PTTG1IP(Y174)", "Dabrafenib", inc) :- p_occupancy("PTTG1IP(Y174)", "Dabrafenib", dec).
0.001::p_fc("PTTG1IP(Y174)", "Dabrafenib", dec); 0.852988196::p_fc("PTTG1IP(Y174)", "Dabrafenib", inc) :- p_occupancy("PTTG1IP(Y174)", "Dabrafenib", inc).
0.0959528884::p_fc("PTTG1IP(Y174)", "Dasatinib", dec); 0.001::p_fc("PTTG1IP(Y174)", "Dasatinib", inc) :- p_occupancy("PTTG1IP(Y174)", "Dasatinib", dec).
0.001::p_fc("PTTG1IP(Y174)", "Dasatinib", dec); 0.0959528884::p_fc("PTTG1IP(Y174)", "Dasatinib", inc) :- p_occupancy("PTTG1IP(Y174)", "Dasatinib", inc).
0.2381557106::p_fc("PTTG1IP(Y174)", "Edelfosine", dec); 0.001::p_fc("PTTG1IP(Y174)", "Edelfosine", inc) :- p_occupancy("PTTG1IP(Y174)", "Edelfosine", dec).
0.001::p_fc("PTTG1IP(Y174)", "Edelfosine", dec); 0.2381557106::p_fc("PTTG1IP(Y174)", "Edelfosine", inc) :- p_occupancy("PTTG1IP(Y174)", "Edelfosine", inc).
0.4583339272::p_fc("PTTG1IP(Y174)", "FRAX486", dec); 0.001::p_fc("PTTG1IP(Y174)", "FRAX486", inc) :- p_occupancy("PTTG1IP(Y174)", "FRAX486", dec).
0.001::p_fc("PTTG1IP(Y174)", "FRAX486", dec); 0.4583339272::p_fc("PTTG1IP(Y174)", "FRAX486", inc) :- p_occupancy("PTTG1IP(Y174)", "FRAX486", inc).
0.2754835653::p_fc("PTTG1IP(Y174)", "GDC0941", dec); 0.001::p_fc("PTTG1IP(Y174)", "GDC0941", inc) :- p_occupancy("PTTG1IP(Y174)", "GDC0941", dec).
0.001::p_fc("PTTG1IP(Y174)", "GDC0941", dec); 0.2754835653::p_fc("PTTG1IP(Y174)", "GDC0941", inc) :- p_occupancy("PTTG1IP(Y174)", "GDC0941", inc).
0.4799181578::p_fc("PTTG1IP(Y174)", "GDC0994", dec); 0.001::p_fc("PTTG1IP(Y174)", "GDC0994", inc) :- p_occupancy("PTTG1IP(Y174)", "GDC0994", dec).
0.001::p_fc("PTTG1IP(Y174)", "GDC0994", dec); 0.4799181578::p_fc("PTTG1IP(Y174)", "GDC0994", inc) :- p_occupancy("PTTG1IP(Y174)", "GDC0994", inc).
0.6346086458::p_fc("PTTG1IP(Y174)", "GF109203X", dec); 0.001::p_fc("PTTG1IP(Y174)", "GF109203X", inc) :- p_occupancy("PTTG1IP(Y174)", "GF109203X", dec).
0.001::p_fc("PTTG1IP(Y174)", "GF109203X", dec); 0.6346086458::p_fc("PTTG1IP(Y174)", "GF109203X", inc) :- p_occupancy("PTTG1IP(Y174)", "GF109203X", inc).
0.1806396396::p_fc("PTTG1IP(Y174)", "GO6983", dec); 0.001::p_fc("PTTG1IP(Y174)", "GO6983", inc) :- p_occupancy("PTTG1IP(Y174)", "GO6983", dec).
0.001::p_fc("PTTG1IP(Y174)", "GO6983", dec); 0.1806396396::p_fc("PTTG1IP(Y174)", "GO6983", inc) :- p_occupancy("PTTG1IP(Y174)", "GO6983", inc).
0.9224927761::p_fc("PTTG1IP(Y174)", "GSK2334470", dec); 0.001::p_fc("PTTG1IP(Y174)", "GSK2334470", inc) :- p_occupancy("PTTG1IP(Y174)", "GSK2334470", dec).
0.001::p_fc("PTTG1IP(Y174)", "GSK2334470", dec); 0.9224927761::p_fc("PTTG1IP(Y174)", "GSK2334470", inc) :- p_occupancy("PTTG1IP(Y174)", "GSK2334470", inc).
0.7695796151::p_fc("PTTG1IP(Y174)", "GSK690693", dec); 0.001::p_fc("PTTG1IP(Y174)", "GSK690693", inc) :- p_occupancy("PTTG1IP(Y174)", "GSK690693", dec).
0.001::p_fc("PTTG1IP(Y174)", "GSK690693", dec); 0.7695796151::p_fc("PTTG1IP(Y174)", "GSK690693", inc) :- p_occupancy("PTTG1IP(Y174)", "GSK690693", inc).
0.3116611273::p_fc("PTTG1IP(Y174)", "Go6976", dec); 0.001::p_fc("PTTG1IP(Y174)", "Go6976", inc) :- p_occupancy("PTTG1IP(Y174)", "Go6976", dec).
0.001::p_fc("PTTG1IP(Y174)", "Go6976", dec); 0.3116611273::p_fc("PTTG1IP(Y174)", "Go6976", inc) :- p_occupancy("PTTG1IP(Y174)", "Go6976", inc).
0.457216568::p_fc("PTTG1IP(Y174)", "H89", dec); 0.001::p_fc("PTTG1IP(Y174)", "H89", inc) :- p_occupancy("PTTG1IP(Y174)", "H89", dec).
0.001::p_fc("PTTG1IP(Y174)", "H89", dec); 0.457216568::p_fc("PTTG1IP(Y174)", "H89", inc) :- p_occupancy("PTTG1IP(Y174)", "H89", inc).
0.1375889258::p_fc("PTTG1IP(Y174)", "HS173", dec); 0.001::p_fc("PTTG1IP(Y174)", "HS173", inc) :- p_occupancy("PTTG1IP(Y174)", "HS173", dec).
0.001::p_fc("PTTG1IP(Y174)", "HS173", dec); 0.1375889258::p_fc("PTTG1IP(Y174)", "HS173", inc) :- p_occupancy("PTTG1IP(Y174)", "HS173", inc).
0.6236318912::p_fc("PTTG1IP(Y174)", "Ipatasertib", dec); 0.001::p_fc("PTTG1IP(Y174)", "Ipatasertib", inc) :- p_occupancy("PTTG1IP(Y174)", "Ipatasertib", dec).
0.001::p_fc("PTTG1IP(Y174)", "Ipatasertib", dec); 0.6236318912::p_fc("PTTG1IP(Y174)", "Ipatasertib", inc) :- p_occupancy("PTTG1IP(Y174)", "Ipatasertib", inc).
0.2726505248::p_fc("PTTG1IP(Y174)", "JNJ", dec); 0.001::p_fc("PTTG1IP(Y174)", "JNJ", inc) :- p_occupancy("PTTG1IP(Y174)", "JNJ", dec).
0.001::p_fc("PTTG1IP(Y174)", "JNJ", dec); 0.2726505248::p_fc("PTTG1IP(Y174)", "JNJ", inc) :- p_occupancy("PTTG1IP(Y174)", "JNJ", inc).
0.2725407544::p_fc("PTTG1IP(Y174)", "JNK", dec); 0.001::p_fc("PTTG1IP(Y174)", "JNK", inc) :- p_occupancy("PTTG1IP(Y174)", "JNK", dec).
0.001::p_fc("PTTG1IP(Y174)", "JNK", dec); 0.2725407544::p_fc("PTTG1IP(Y174)", "JNK", inc) :- p_occupancy("PTTG1IP(Y174)", "JNK", inc).
0.2022044295::p_fc("PTTG1IP(Y174)", "KD025", dec); 0.001::p_fc("PTTG1IP(Y174)", "KD025", inc) :- p_occupancy("PTTG1IP(Y174)", "KD025", dec).
0.001::p_fc("PTTG1IP(Y174)", "KD025", dec); 0.2022044295::p_fc("PTTG1IP(Y174)", "KD025", inc) :- p_occupancy("PTTG1IP(Y174)", "KD025", inc).
0.4865758307::p_fc("PTTG1IP(Y174)", "KN62", dec); 0.001::p_fc("PTTG1IP(Y174)", "KN62", inc) :- p_occupancy("PTTG1IP(Y174)", "KN62", dec).
0.001::p_fc("PTTG1IP(Y174)", "KN62", dec); 0.4865758307::p_fc("PTTG1IP(Y174)", "KN62", inc) :- p_occupancy("PTTG1IP(Y174)", "KN62", inc).
0.9126935589::p_fc("PTTG1IP(Y174)", "KN93", dec); 0.001::p_fc("PTTG1IP(Y174)", "KN93", inc) :- p_occupancy("PTTG1IP(Y174)", "KN93", dec).
0.001::p_fc("PTTG1IP(Y174)", "KN93", dec); 0.9126935589::p_fc("PTTG1IP(Y174)", "KN93", inc) :- p_occupancy("PTTG1IP(Y174)", "KN93", inc).
0.1472364475::p_fc("PTTG1IP(Y174)", "Ku0063794", dec); 0.001::p_fc("PTTG1IP(Y174)", "Ku0063794", inc) :- p_occupancy("PTTG1IP(Y174)", "Ku0063794", dec).
0.001::p_fc("PTTG1IP(Y174)", "Ku0063794", dec); 0.1472364475::p_fc("PTTG1IP(Y174)", "Ku0063794", inc) :- p_occupancy("PTTG1IP(Y174)", "Ku0063794", inc).
0.2624824105::p_fc("PTTG1IP(Y174)", "LY2090314", dec); 0.001::p_fc("PTTG1IP(Y174)", "LY2090314", inc) :- p_occupancy("PTTG1IP(Y174)", "LY2090314", dec).
0.001::p_fc("PTTG1IP(Y174)", "LY2090314", dec); 0.2624824105::p_fc("PTTG1IP(Y174)", "LY2090314", inc) :- p_occupancy("PTTG1IP(Y174)", "LY2090314", inc).
0.2466749744::p_fc("PTTG1IP(Y174)", "LY2584702", dec); 0.001::p_fc("PTTG1IP(Y174)", "LY2584702", inc) :- p_occupancy("PTTG1IP(Y174)", "LY2584702", dec).
0.001::p_fc("PTTG1IP(Y174)", "LY2584702", dec); 0.2466749744::p_fc("PTTG1IP(Y174)", "LY2584702", inc) :- p_occupancy("PTTG1IP(Y174)", "LY2584702", inc).
0.4245092442::p_fc("PTTG1IP(Y174)", "LY2835219", dec); 0.001::p_fc("PTTG1IP(Y174)", "LY2835219", inc) :- p_occupancy("PTTG1IP(Y174)", "LY2835219", dec).
0.001::p_fc("PTTG1IP(Y174)", "LY2835219", dec); 0.4245092442::p_fc("PTTG1IP(Y174)", "LY2835219", inc) :- p_occupancy("PTTG1IP(Y174)", "LY2835219", inc).
0.9084824356::p_fc("PTTG1IP(Y174)", "Linsitinib", dec); 0.001::p_fc("PTTG1IP(Y174)", "Linsitinib", inc) :- p_occupancy("PTTG1IP(Y174)", "Linsitinib", dec).
0.001::p_fc("PTTG1IP(Y174)", "Linsitinib", dec); 0.9084824356::p_fc("PTTG1IP(Y174)", "Linsitinib", inc) :- p_occupancy("PTTG1IP(Y174)", "Linsitinib", inc).
0.5679305543::p_fc("PTTG1IP(Y174)", "MK2206", dec); 0.001::p_fc("PTTG1IP(Y174)", "MK2206", inc) :- p_occupancy("PTTG1IP(Y174)", "MK2206", dec).
0.001::p_fc("PTTG1IP(Y174)", "MK2206", dec); 0.5679305543::p_fc("PTTG1IP(Y174)", "MK2206", inc) :- p_occupancy("PTTG1IP(Y174)", "MK2206", inc).
0.6879164478::p_fc("PTTG1IP(Y174)", "NU7441", dec); 0.001::p_fc("PTTG1IP(Y174)", "NU7441", inc) :- p_occupancy("PTTG1IP(Y174)", "NU7441", dec).
0.001::p_fc("PTTG1IP(Y174)", "NU7441", dec); 0.6879164478::p_fc("PTTG1IP(Y174)", "NU7441", inc) :- p_occupancy("PTTG1IP(Y174)", "NU7441", inc).
0.5520059246::p_fc("PTTG1IP(Y174)", "PD153035", dec); 0.001::p_fc("PTTG1IP(Y174)", "PD153035", inc) :- p_occupancy("PTTG1IP(Y174)", "PD153035", dec).
0.001::p_fc("PTTG1IP(Y174)", "PD153035", dec); 0.5520059246::p_fc("PTTG1IP(Y174)", "PD153035", inc) :- p_occupancy("PTTG1IP(Y174)", "PD153035", inc).
0.3696041817::p_fc("PTTG1IP(Y174)", "PF3758309", dec); 0.001::p_fc("PTTG1IP(Y174)", "PF3758309", inc) :- p_occupancy("PTTG1IP(Y174)", "PF3758309", dec).
0.001::p_fc("PTTG1IP(Y174)", "PF3758309", dec); 0.3696041817::p_fc("PTTG1IP(Y174)", "PF3758309", inc) :- p_occupancy("PTTG1IP(Y174)", "PF3758309", inc).
0.3469836173::p_fc("PTTG1IP(Y174)", "PF4708671", dec); 0.001::p_fc("PTTG1IP(Y174)", "PF4708671", inc) :- p_occupancy("PTTG1IP(Y174)", "PF4708671", dec).
0.001::p_fc("PTTG1IP(Y174)", "PF4708671", dec); 0.3469836173::p_fc("PTTG1IP(Y174)", "PF4708671", inc) :- p_occupancy("PTTG1IP(Y174)", "PF4708671", inc).
0.1177838567::p_fc("PTTG1IP(Y174)", "PH797804", dec); 0.001::p_fc("PTTG1IP(Y174)", "PH797804", inc) :- p_occupancy("PTTG1IP(Y174)", "PH797804", dec).
0.001::p_fc("PTTG1IP(Y174)", "PH797804", dec); 0.1177838567::p_fc("PTTG1IP(Y174)", "PH797804", inc) :- p_occupancy("PTTG1IP(Y174)", "PH797804", inc).
0.2302445783::p_fc("PTTG1IP(Y174)", "PIK294", dec); 0.001::p_fc("PTTG1IP(Y174)", "PIK294", inc) :- p_occupancy("PTTG1IP(Y174)", "PIK294", dec).
0.001::p_fc("PTTG1IP(Y174)", "PIK294", dec); 0.2302445783::p_fc("PTTG1IP(Y174)", "PIK294", inc) :- p_occupancy("PTTG1IP(Y174)", "PIK294", inc).
0.9803021089::p_fc("PTTG1IP(Y174)", "Ribociclib", dec); 0.001::p_fc("PTTG1IP(Y174)", "Ribociclib", inc) :- p_occupancy("PTTG1IP(Y174)", "Ribociclib", dec).
0.001::p_fc("PTTG1IP(Y174)", "Ribociclib", dec); 0.9803021089::p_fc("PTTG1IP(Y174)", "Ribociclib", inc) :- p_occupancy("PTTG1IP(Y174)", "Ribociclib", inc).
0.1195590859::p_fc("PTTG1IP(Y174)", "Ripasudil", dec); 0.001::p_fc("PTTG1IP(Y174)", "Ripasudil", inc) :- p_occupancy("PTTG1IP(Y174)", "Ripasudil", dec).
0.001::p_fc("PTTG1IP(Y174)", "Ripasudil", dec); 0.1195590859::p_fc("PTTG1IP(Y174)", "Ripasudil", inc) :- p_occupancy("PTTG1IP(Y174)", "Ripasudil", inc).
0.1493977444::p_fc("PTTG1IP(Y174)", "SP600125", dec); 0.001::p_fc("PTTG1IP(Y174)", "SP600125", inc) :- p_occupancy("PTTG1IP(Y174)", "SP600125", dec).
0.001::p_fc("PTTG1IP(Y174)", "SP600125", dec); 0.1493977444::p_fc("PTTG1IP(Y174)", "SP600125", inc) :- p_occupancy("PTTG1IP(Y174)", "SP600125", inc).
0.0558146448::p_fc("PTTG1IP(Y174)", "Selumetinib", dec); 0.001::p_fc("PTTG1IP(Y174)", "Selumetinib", inc) :- p_occupancy("PTTG1IP(Y174)", "Selumetinib", dec).
0.001::p_fc("PTTG1IP(Y174)", "Selumetinib", dec); 0.0558146448::p_fc("PTTG1IP(Y174)", "Selumetinib", inc) :- p_occupancy("PTTG1IP(Y174)", "Selumetinib", inc).
0.431820959::p_fc("PTTG1IP(Y174)", "TAK715", dec); 0.001::p_fc("PTTG1IP(Y174)", "TAK715", inc) :- p_occupancy("PTTG1IP(Y174)", "TAK715", dec).
0.001::p_fc("PTTG1IP(Y174)", "TAK715", dec); 0.431820959::p_fc("PTTG1IP(Y174)", "TAK715", inc) :- p_occupancy("PTTG1IP(Y174)", "TAK715", inc).
0.322948624::p_fc("PTTG1IP(Y174)", "TBCA", dec); 0.001::p_fc("PTTG1IP(Y174)", "TBCA", inc) :- p_occupancy("PTTG1IP(Y174)", "TBCA", dec).
0.001::p_fc("PTTG1IP(Y174)", "TBCA", dec); 0.322948624::p_fc("PTTG1IP(Y174)", "TBCA", inc) :- p_occupancy("PTTG1IP(Y174)", "TBCA", inc).
0.1325765823::p_fc("PTTG1IP(Y174)", "TGX221", dec); 0.001::p_fc("PTTG1IP(Y174)", "TGX221", inc) :- p_occupancy("PTTG1IP(Y174)", "TGX221", dec).
0.001::p_fc("PTTG1IP(Y174)", "TGX221", dec); 0.1325765823::p_fc("PTTG1IP(Y174)", "TGX221", inc) :- p_occupancy("PTTG1IP(Y174)", "TGX221", inc).
0.9069958707::p_fc("PTTG1IP(Y174)", "Tofacitinib", dec); 0.001::p_fc("PTTG1IP(Y174)", "Tofacitinib", inc) :- p_occupancy("PTTG1IP(Y174)", "Tofacitinib", dec).
0.001::p_fc("PTTG1IP(Y174)", "Tofacitinib", dec); 0.9069958707::p_fc("PTTG1IP(Y174)", "Tofacitinib", inc) :- p_occupancy("PTTG1IP(Y174)", "Tofacitinib", inc).
0.3838299641::p_fc("PTTG1IP(Y174)", "Torin", dec); 0.001::p_fc("PTTG1IP(Y174)", "Torin", inc) :- p_occupancy("PTTG1IP(Y174)", "Torin", dec).
0.001::p_fc("PTTG1IP(Y174)", "Torin", dec); 0.3838299641::p_fc("PTTG1IP(Y174)", "Torin", inc) :- p_occupancy("PTTG1IP(Y174)", "Torin", inc).
0.2373976324::p_fc("PTTG1IP(Y174)", "Trametinib", dec); 0.001::p_fc("PTTG1IP(Y174)", "Trametinib", inc) :- p_occupancy("PTTG1IP(Y174)", "Trametinib", dec).
0.001::p_fc("PTTG1IP(Y174)", "Trametinib", dec); 0.2373976324::p_fc("PTTG1IP(Y174)", "Trametinib", inc) :- p_occupancy("PTTG1IP(Y174)", "Trametinib", inc).
0.4646979052::p_fc("PTTG1IP(Y174)", "U73122", dec); 0.001::p_fc("PTTG1IP(Y174)", "U73122", inc) :- p_occupancy("PTTG1IP(Y174)", "U73122", dec).
0.001::p_fc("PTTG1IP(Y174)", "U73122", dec); 0.4646979052::p_fc("PTTG1IP(Y174)", "U73122", inc) :- p_occupancy("PTTG1IP(Y174)", "U73122", inc).
0.6250866782::p_fc("PTTG1IP(Y174)", "Ulixertinib", dec); 0.001::p_fc("PTTG1IP(Y174)", "Ulixertinib", inc) :- p_occupancy("PTTG1IP(Y174)", "Ulixertinib", dec).
0.001::p_fc("PTTG1IP(Y174)", "Ulixertinib", dec); 0.6250866782::p_fc("PTTG1IP(Y174)", "Ulixertinib", inc) :- p_occupancy("PTTG1IP(Y174)", "Ulixertinib", inc).
0.5677720535::p_fc("PTTG1IP(Y174)", "Vemurafenib", dec); 0.001::p_fc("PTTG1IP(Y174)", "Vemurafenib", inc) :- p_occupancy("PTTG1IP(Y174)", "Vemurafenib", dec).
0.001::p_fc("PTTG1IP(Y174)", "Vemurafenib", dec); 0.5677720535::p_fc("PTTG1IP(Y174)", "Vemurafenib", inc) :- p_occupancy("PTTG1IP(Y174)", "Vemurafenib", inc).
0.7990318119::p_fc("PXN(Y118)", "AC220", dec); 0.001::p_fc("PXN(Y118)", "AC220", inc) :- p_occupancy("PXN(Y118)", "AC220", dec).
0.001::p_fc("PXN(Y118)", "AC220", dec); 0.7990318119::p_fc("PXN(Y118)", "AC220", inc) :- p_occupancy("PXN(Y118)", "AC220", inc).
0.9745277138::p_fc("PXN(Y118)", "AT13148", dec); 0.001::p_fc("PXN(Y118)", "AT13148", inc) :- p_occupancy("PXN(Y118)", "AT13148", dec).
0.001::p_fc("PXN(Y118)", "AT13148", dec); 0.9745277138::p_fc("PXN(Y118)", "AT13148", inc) :- p_occupancy("PXN(Y118)", "AT13148", inc).
0.9193514301::p_fc("PXN(Y118)", "AZ20", dec); 0.001::p_fc("PXN(Y118)", "AZ20", inc) :- p_occupancy("PXN(Y118)", "AZ20", dec).
0.001::p_fc("PXN(Y118)", "AZ20", dec); 0.9193514301::p_fc("PXN(Y118)", "AZ20", inc) :- p_occupancy("PXN(Y118)", "AZ20", inc).
0.6698929164::p_fc("PXN(Y118)", "AZD1480", dec); 0.001::p_fc("PXN(Y118)", "AZD1480", inc) :- p_occupancy("PXN(Y118)", "AZD1480", dec).
0.001::p_fc("PXN(Y118)", "AZD1480", dec); 0.6698929164::p_fc("PXN(Y118)", "AZD1480", inc) :- p_occupancy("PXN(Y118)", "AZD1480", inc).
0.7859032554::p_fc("PXN(Y118)", "AZD3759", dec); 0.001::p_fc("PXN(Y118)", "AZD3759", inc) :- p_occupancy("PXN(Y118)", "AZD3759", dec).
0.001::p_fc("PXN(Y118)", "AZD3759", dec); 0.7859032554::p_fc("PXN(Y118)", "AZD3759", inc) :- p_occupancy("PXN(Y118)", "AZD3759", inc).
0.0473171562::p_fc("PXN(Y118)", "AZD5363", dec); 0.001::p_fc("PXN(Y118)", "AZD5363", inc) :- p_occupancy("PXN(Y118)", "AZD5363", dec).
0.001::p_fc("PXN(Y118)", "AZD5363", dec); 0.0473171562::p_fc("PXN(Y118)", "AZD5363", inc) :- p_occupancy("PXN(Y118)", "AZD5363", inc).
0.1483212948::p_fc("PXN(Y118)", "AZD5438", dec); 0.001::p_fc("PXN(Y118)", "AZD5438", inc) :- p_occupancy("PXN(Y118)", "AZD5438", dec).
0.001::p_fc("PXN(Y118)", "AZD5438", dec); 0.1483212948::p_fc("PXN(Y118)", "AZD5438", inc) :- p_occupancy("PXN(Y118)", "AZD5438", inc).
0.7842786627::p_fc("PXN(Y118)", "AZD6482", dec); 0.001::p_fc("PXN(Y118)", "AZD6482", inc) :- p_occupancy("PXN(Y118)", "AZD6482", dec).
0.001::p_fc("PXN(Y118)", "AZD6482", dec); 0.7842786627::p_fc("PXN(Y118)", "AZD6482", inc) :- p_occupancy("PXN(Y118)", "AZD6482", inc).
0.7198510541::p_fc("PXN(Y118)", "AZD6738", dec); 0.001::p_fc("PXN(Y118)", "AZD6738", inc) :- p_occupancy("PXN(Y118)", "AZD6738", dec).
0.001::p_fc("PXN(Y118)", "AZD6738", dec); 0.7198510541::p_fc("PXN(Y118)", "AZD6738", inc) :- p_occupancy("PXN(Y118)", "AZD6738", inc).
0.8696990403::p_fc("PXN(Y118)", "AZD8055", dec); 0.001::p_fc("PXN(Y118)", "AZD8055", inc) :- p_occupancy("PXN(Y118)", "AZD8055", dec).
0.001::p_fc("PXN(Y118)", "AZD8055", dec); 0.8696990403::p_fc("PXN(Y118)", "AZD8055", inc) :- p_occupancy("PXN(Y118)", "AZD8055", inc).
0.4980701745::p_fc("PXN(Y118)", "Amuvatinib", dec); 0.001::p_fc("PXN(Y118)", "Amuvatinib", inc) :- p_occupancy("PXN(Y118)", "Amuvatinib", dec).
0.001::p_fc("PXN(Y118)", "Amuvatinib", dec); 0.4980701745::p_fc("PXN(Y118)", "Amuvatinib", inc) :- p_occupancy("PXN(Y118)", "Amuvatinib", inc).
0.6149853028::p_fc("PXN(Y118)", "BX912", dec); 0.001::p_fc("PXN(Y118)", "BX912", inc) :- p_occupancy("PXN(Y118)", "BX912", dec).
0.001::p_fc("PXN(Y118)", "BX912", dec); 0.6149853028::p_fc("PXN(Y118)", "BX912", inc) :- p_occupancy("PXN(Y118)", "BX912", inc).
0.7457796785::p_fc("PXN(Y118)", "Bosutinib", dec); 0.001::p_fc("PXN(Y118)", "Bosutinib", inc) :- p_occupancy("PXN(Y118)", "Bosutinib", dec).
0.001::p_fc("PXN(Y118)", "Bosutinib", dec); 0.7457796785::p_fc("PXN(Y118)", "Bosutinib", inc) :- p_occupancy("PXN(Y118)", "Bosutinib", inc).
0.0872576313::p_fc("PXN(Y118)", "CAL101", dec); 0.001::p_fc("PXN(Y118)", "CAL101", inc) :- p_occupancy("PXN(Y118)", "CAL101", dec).
0.001::p_fc("PXN(Y118)", "CAL101", dec); 0.0872576313::p_fc("PXN(Y118)", "CAL101", inc) :- p_occupancy("PXN(Y118)", "CAL101", inc).
0.4299303449::p_fc("PXN(Y118)", "CHIR99021", dec); 0.001::p_fc("PXN(Y118)", "CHIR99021", inc) :- p_occupancy("PXN(Y118)", "CHIR99021", dec).
0.001::p_fc("PXN(Y118)", "CHIR99021", dec); 0.4299303449::p_fc("PXN(Y118)", "CHIR99021", inc) :- p_occupancy("PXN(Y118)", "CHIR99021", inc).
0.607827222::p_fc("PXN(Y118)", "CX4945", dec); 0.001::p_fc("PXN(Y118)", "CX4945", inc) :- p_occupancy("PXN(Y118)", "CX4945", dec).
0.001::p_fc("PXN(Y118)", "CX4945", dec); 0.607827222::p_fc("PXN(Y118)", "CX4945", inc) :- p_occupancy("PXN(Y118)", "CX4945", inc).
0.1510574186::p_fc("PXN(Y118)", "DNAPK", dec); 0.001::p_fc("PXN(Y118)", "DNAPK", inc) :- p_occupancy("PXN(Y118)", "DNAPK", dec).
0.001::p_fc("PXN(Y118)", "DNAPK", dec); 0.1510574186::p_fc("PXN(Y118)", "DNAPK", inc) :- p_occupancy("PXN(Y118)", "DNAPK", inc).
0.4348465991::p_fc("PXN(Y118)", "Dabrafenib", dec); 0.001::p_fc("PXN(Y118)", "Dabrafenib", inc) :- p_occupancy("PXN(Y118)", "Dabrafenib", dec).
0.001::p_fc("PXN(Y118)", "Dabrafenib", dec); 0.4348465991::p_fc("PXN(Y118)", "Dabrafenib", inc) :- p_occupancy("PXN(Y118)", "Dabrafenib", inc).
0.16295774::p_fc("PXN(Y118)", "Dasatinib", dec); 0.001::p_fc("PXN(Y118)", "Dasatinib", inc) :- p_occupancy("PXN(Y118)", "Dasatinib", dec).
0.001::p_fc("PXN(Y118)", "Dasatinib", dec); 0.16295774::p_fc("PXN(Y118)", "Dasatinib", inc) :- p_occupancy("PXN(Y118)", "Dasatinib", inc).
0.872937187::p_fc("PXN(Y118)", "Edelfosine", dec); 0.001::p_fc("PXN(Y118)", "Edelfosine", inc) :- p_occupancy("PXN(Y118)", "Edelfosine", dec).
0.001::p_fc("PXN(Y118)", "Edelfosine", dec); 0.872937187::p_fc("PXN(Y118)", "Edelfosine", inc) :- p_occupancy("PXN(Y118)", "Edelfosine", inc).
0.5358098288::p_fc("PXN(Y118)", "FRAX486", dec); 0.001::p_fc("PXN(Y118)", "FRAX486", inc) :- p_occupancy("PXN(Y118)", "FRAX486", dec).
0.001::p_fc("PXN(Y118)", "FRAX486", dec); 0.5358098288::p_fc("PXN(Y118)", "FRAX486", inc) :- p_occupancy("PXN(Y118)", "FRAX486", inc).
0.1158253172::p_fc("PXN(Y118)", "GDC0941", dec); 0.001::p_fc("PXN(Y118)", "GDC0941", inc) :- p_occupancy("PXN(Y118)", "GDC0941", dec).
0.001::p_fc("PXN(Y118)", "GDC0941", dec); 0.1158253172::p_fc("PXN(Y118)", "GDC0941", inc) :- p_occupancy("PXN(Y118)", "GDC0941", inc).
0.0295429843::p_fc("PXN(Y118)", "GDC0994", dec); 0.001::p_fc("PXN(Y118)", "GDC0994", inc) :- p_occupancy("PXN(Y118)", "GDC0994", dec).
0.001::p_fc("PXN(Y118)", "GDC0994", dec); 0.0295429843::p_fc("PXN(Y118)", "GDC0994", inc) :- p_occupancy("PXN(Y118)", "GDC0994", inc).
0.5364919836::p_fc("PXN(Y118)", "GF109203X", dec); 0.001::p_fc("PXN(Y118)", "GF109203X", inc) :- p_occupancy("PXN(Y118)", "GF109203X", dec).
0.001::p_fc("PXN(Y118)", "GF109203X", dec); 0.5364919836::p_fc("PXN(Y118)", "GF109203X", inc) :- p_occupancy("PXN(Y118)", "GF109203X", inc).
0.9886554808::p_fc("PXN(Y118)", "GO6983", dec); 0.001::p_fc("PXN(Y118)", "GO6983", inc) :- p_occupancy("PXN(Y118)", "GO6983", dec).
0.001::p_fc("PXN(Y118)", "GO6983", dec); 0.9886554808::p_fc("PXN(Y118)", "GO6983", inc) :- p_occupancy("PXN(Y118)", "GO6983", inc).
0.9845000223::p_fc("PXN(Y118)", "GSK2334470", dec); 0.001::p_fc("PXN(Y118)", "GSK2334470", inc) :- p_occupancy("PXN(Y118)", "GSK2334470", dec).
0.001::p_fc("PXN(Y118)", "GSK2334470", dec); 0.9845000223::p_fc("PXN(Y118)", "GSK2334470", inc) :- p_occupancy("PXN(Y118)", "GSK2334470", inc).
0.9688154022::p_fc("PXN(Y118)", "GSK690693", dec); 0.001::p_fc("PXN(Y118)", "GSK690693", inc) :- p_occupancy("PXN(Y118)", "GSK690693", dec).
0.001::p_fc("PXN(Y118)", "GSK690693", dec); 0.9688154022::p_fc("PXN(Y118)", "GSK690693", inc) :- p_occupancy("PXN(Y118)", "GSK690693", inc).
0.6811809715::p_fc("PXN(Y118)", "Go6976", dec); 0.001::p_fc("PXN(Y118)", "Go6976", inc) :- p_occupancy("PXN(Y118)", "Go6976", dec).
0.001::p_fc("PXN(Y118)", "Go6976", dec); 0.6811809715::p_fc("PXN(Y118)", "Go6976", inc) :- p_occupancy("PXN(Y118)", "Go6976", inc).
0.7655880737::p_fc("PXN(Y118)", "H89", dec); 0.001::p_fc("PXN(Y118)", "H89", inc) :- p_occupancy("PXN(Y118)", "H89", dec).
0.001::p_fc("PXN(Y118)", "H89", dec); 0.7655880737::p_fc("PXN(Y118)", "H89", inc) :- p_occupancy("PXN(Y118)", "H89", inc).
0.0257486774::p_fc("PXN(Y118)", "HS173", dec); 0.001::p_fc("PXN(Y118)", "HS173", inc) :- p_occupancy("PXN(Y118)", "HS173", dec).
0.001::p_fc("PXN(Y118)", "HS173", dec); 0.0257486774::p_fc("PXN(Y118)", "HS173", inc) :- p_occupancy("PXN(Y118)", "HS173", inc).
0.8491142349::p_fc("PXN(Y118)", "Ipatasertib", dec); 0.001::p_fc("PXN(Y118)", "Ipatasertib", inc) :- p_occupancy("PXN(Y118)", "Ipatasertib", dec).
0.001::p_fc("PXN(Y118)", "Ipatasertib", dec); 0.8491142349::p_fc("PXN(Y118)", "Ipatasertib", inc) :- p_occupancy("PXN(Y118)", "Ipatasertib", inc).
0.4796922228::p_fc("PXN(Y118)", "JNJ", dec); 0.001::p_fc("PXN(Y118)", "JNJ", inc) :- p_occupancy("PXN(Y118)", "JNJ", dec).
0.001::p_fc("PXN(Y118)", "JNJ", dec); 0.4796922228::p_fc("PXN(Y118)", "JNJ", inc) :- p_occupancy("PXN(Y118)", "JNJ", inc).
0.958380312::p_fc("PXN(Y118)", "JNK", dec); 0.001::p_fc("PXN(Y118)", "JNK", inc) :- p_occupancy("PXN(Y118)", "JNK", dec).
0.001::p_fc("PXN(Y118)", "JNK", dec); 0.958380312::p_fc("PXN(Y118)", "JNK", inc) :- p_occupancy("PXN(Y118)", "JNK", inc).
0.9038958798::p_fc("PXN(Y118)", "KD025", dec); 0.001::p_fc("PXN(Y118)", "KD025", inc) :- p_occupancy("PXN(Y118)", "KD025", dec).
0.001::p_fc("PXN(Y118)", "KD025", dec); 0.9038958798::p_fc("PXN(Y118)", "KD025", inc) :- p_occupancy("PXN(Y118)", "KD025", inc).
0.8964992324::p_fc("PXN(Y118)", "KN62", dec); 0.001::p_fc("PXN(Y118)", "KN62", inc) :- p_occupancy("PXN(Y118)", "KN62", dec).
0.001::p_fc("PXN(Y118)", "KN62", dec); 0.8964992324::p_fc("PXN(Y118)", "KN62", inc) :- p_occupancy("PXN(Y118)", "KN62", inc).
0.5333676254::p_fc("PXN(Y118)", "KN93", dec); 0.001::p_fc("PXN(Y118)", "KN93", inc) :- p_occupancy("PXN(Y118)", "KN93", dec).
0.001::p_fc("PXN(Y118)", "KN93", dec); 0.5333676254::p_fc("PXN(Y118)", "KN93", inc) :- p_occupancy("PXN(Y118)", "KN93", inc).
0.107124801::p_fc("PXN(Y118)", "Ku0063794", dec); 0.001::p_fc("PXN(Y118)", "Ku0063794", inc) :- p_occupancy("PXN(Y118)", "Ku0063794", dec).
0.001::p_fc("PXN(Y118)", "Ku0063794", dec); 0.107124801::p_fc("PXN(Y118)", "Ku0063794", inc) :- p_occupancy("PXN(Y118)", "Ku0063794", inc).
0.2229511614::p_fc("PXN(Y118)", "LY2090314", dec); 0.001::p_fc("PXN(Y118)", "LY2090314", inc) :- p_occupancy("PXN(Y118)", "LY2090314", dec).
0.001::p_fc("PXN(Y118)", "LY2090314", dec); 0.2229511614::p_fc("PXN(Y118)", "LY2090314", inc) :- p_occupancy("PXN(Y118)", "LY2090314", inc).
0.1749285642::p_fc("PXN(Y118)", "LY2584702", dec); 0.001::p_fc("PXN(Y118)", "LY2584702", inc) :- p_occupancy("PXN(Y118)", "LY2584702", dec).
0.001::p_fc("PXN(Y118)", "LY2584702", dec); 0.1749285642::p_fc("PXN(Y118)", "LY2584702", inc) :- p_occupancy("PXN(Y118)", "LY2584702", inc).
0.5692102353::p_fc("PXN(Y118)", "LY2835219", dec); 0.001::p_fc("PXN(Y118)", "LY2835219", inc) :- p_occupancy("PXN(Y118)", "LY2835219", dec).
0.001::p_fc("PXN(Y118)", "LY2835219", dec); 0.5692102353::p_fc("PXN(Y118)", "LY2835219", inc) :- p_occupancy("PXN(Y118)", "LY2835219", inc).
0.7951419268::p_fc("PXN(Y118)", "Linsitinib", dec); 0.001::p_fc("PXN(Y118)", "Linsitinib", inc) :- p_occupancy("PXN(Y118)", "Linsitinib", dec).
0.001::p_fc("PXN(Y118)", "Linsitinib", dec); 0.7951419268::p_fc("PXN(Y118)", "Linsitinib", inc) :- p_occupancy("PXN(Y118)", "Linsitinib", inc).
0.4068845674::p_fc("PXN(Y118)", "MK2206", dec); 0.001::p_fc("PXN(Y118)", "MK2206", inc) :- p_occupancy("PXN(Y118)", "MK2206", dec).
0.001::p_fc("PXN(Y118)", "MK2206", dec); 0.4068845674::p_fc("PXN(Y118)", "MK2206", inc) :- p_occupancy("PXN(Y118)", "MK2206", inc).
0.5685244682::p_fc("PXN(Y118)", "NU7441", dec); 0.001::p_fc("PXN(Y118)", "NU7441", inc) :- p_occupancy("PXN(Y118)", "NU7441", dec).
0.001::p_fc("PXN(Y118)", "NU7441", dec); 0.5685244682::p_fc("PXN(Y118)", "NU7441", inc) :- p_occupancy("PXN(Y118)", "NU7441", inc).
0.8496270729::p_fc("PXN(Y118)", "PD153035", dec); 0.001::p_fc("PXN(Y118)", "PD153035", inc) :- p_occupancy("PXN(Y118)", "PD153035", dec).
0.001::p_fc("PXN(Y118)", "PD153035", dec); 0.8496270729::p_fc("PXN(Y118)", "PD153035", inc) :- p_occupancy("PXN(Y118)", "PD153035", inc).
0.6999337605::p_fc("PXN(Y118)", "PF3758309", dec); 0.001::p_fc("PXN(Y118)", "PF3758309", inc) :- p_occupancy("PXN(Y118)", "PF3758309", dec).
0.001::p_fc("PXN(Y118)", "PF3758309", dec); 0.6999337605::p_fc("PXN(Y118)", "PF3758309", inc) :- p_occupancy("PXN(Y118)", "PF3758309", inc).
0.559738021::p_fc("PXN(Y118)", "PF4708671", dec); 0.001::p_fc("PXN(Y118)", "PF4708671", inc) :- p_occupancy("PXN(Y118)", "PF4708671", dec).
0.001::p_fc("PXN(Y118)", "PF4708671", dec); 0.559738021::p_fc("PXN(Y118)", "PF4708671", inc) :- p_occupancy("PXN(Y118)", "PF4708671", inc).
0.8049994437::p_fc("PXN(Y118)", "PH797804", dec); 0.001::p_fc("PXN(Y118)", "PH797804", inc) :- p_occupancy("PXN(Y118)", "PH797804", dec).
0.001::p_fc("PXN(Y118)", "PH797804", dec); 0.8049994437::p_fc("PXN(Y118)", "PH797804", inc) :- p_occupancy("PXN(Y118)", "PH797804", inc).
0.5029661892::p_fc("PXN(Y118)", "PIK294", dec); 0.001::p_fc("PXN(Y118)", "PIK294", inc) :- p_occupancy("PXN(Y118)", "PIK294", dec).
0.001::p_fc("PXN(Y118)", "PIK294", dec); 0.5029661892::p_fc("PXN(Y118)", "PIK294", inc) :- p_occupancy("PXN(Y118)", "PIK294", inc).
0.0804264439::p_fc("PXN(Y118)", "Ribociclib", dec); 0.001::p_fc("PXN(Y118)", "Ribociclib", inc) :- p_occupancy("PXN(Y118)", "Ribociclib", dec).
0.001::p_fc("PXN(Y118)", "Ribociclib", dec); 0.0804264439::p_fc("PXN(Y118)", "Ribociclib", inc) :- p_occupancy("PXN(Y118)", "Ribociclib", inc).
0.8249205976::p_fc("PXN(Y118)", "Ripasudil", dec); 0.001::p_fc("PXN(Y118)", "Ripasudil", inc) :- p_occupancy("PXN(Y118)", "Ripasudil", dec).
0.001::p_fc("PXN(Y118)", "Ripasudil", dec); 0.8249205976::p_fc("PXN(Y118)", "Ripasudil", inc) :- p_occupancy("PXN(Y118)", "Ripasudil", inc).
0.7132014227::p_fc("PXN(Y118)", "SP600125", dec); 0.001::p_fc("PXN(Y118)", "SP600125", inc) :- p_occupancy("PXN(Y118)", "SP600125", dec).
0.001::p_fc("PXN(Y118)", "SP600125", dec); 0.7132014227::p_fc("PXN(Y118)", "SP600125", inc) :- p_occupancy("PXN(Y118)", "SP600125", inc).
0.7318037943::p_fc("PXN(Y118)", "Selumetinib", dec); 0.001::p_fc("PXN(Y118)", "Selumetinib", inc) :- p_occupancy("PXN(Y118)", "Selumetinib", dec).
0.001::p_fc("PXN(Y118)", "Selumetinib", dec); 0.7318037943::p_fc("PXN(Y118)", "Selumetinib", inc) :- p_occupancy("PXN(Y118)", "Selumetinib", inc).
0.8343916102::p_fc("PXN(Y118)", "TAK715", dec); 0.001::p_fc("PXN(Y118)", "TAK715", inc) :- p_occupancy("PXN(Y118)", "TAK715", dec).
0.001::p_fc("PXN(Y118)", "TAK715", dec); 0.8343916102::p_fc("PXN(Y118)", "TAK715", inc) :- p_occupancy("PXN(Y118)", "TAK715", inc).
0.3477858477::p_fc("PXN(Y118)", "TBCA", dec); 0.001::p_fc("PXN(Y118)", "TBCA", inc) :- p_occupancy("PXN(Y118)", "TBCA", dec).
0.001::p_fc("PXN(Y118)", "TBCA", dec); 0.3477858477::p_fc("PXN(Y118)", "TBCA", inc) :- p_occupancy("PXN(Y118)", "TBCA", inc).
0.1023572969::p_fc("PXN(Y118)", "TGX221", dec); 0.001::p_fc("PXN(Y118)", "TGX221", inc) :- p_occupancy("PXN(Y118)", "TGX221", dec).
0.001::p_fc("PXN(Y118)", "TGX221", dec); 0.1023572969::p_fc("PXN(Y118)", "TGX221", inc) :- p_occupancy("PXN(Y118)", "TGX221", inc).
0.7421760513::p_fc("PXN(Y118)", "Tofacitinib", dec); 0.001::p_fc("PXN(Y118)", "Tofacitinib", inc) :- p_occupancy("PXN(Y118)", "Tofacitinib", dec).
0.001::p_fc("PXN(Y118)", "Tofacitinib", dec); 0.7421760513::p_fc("PXN(Y118)", "Tofacitinib", inc) :- p_occupancy("PXN(Y118)", "Tofacitinib", inc).
0.7492206943::p_fc("PXN(Y118)", "Torin", dec); 0.001::p_fc("PXN(Y118)", "Torin", inc) :- p_occupancy("PXN(Y118)", "Torin", dec).
0.001::p_fc("PXN(Y118)", "Torin", dec); 0.7492206943::p_fc("PXN(Y118)", "Torin", inc) :- p_occupancy("PXN(Y118)", "Torin", inc).
0.6956848103::p_fc("PXN(Y118)", "Trametinib", dec); 0.001::p_fc("PXN(Y118)", "Trametinib", inc) :- p_occupancy("PXN(Y118)", "Trametinib", dec).
0.001::p_fc("PXN(Y118)", "Trametinib", dec); 0.6956848103::p_fc("PXN(Y118)", "Trametinib", inc) :- p_occupancy("PXN(Y118)", "Trametinib", inc).
0.8427643561::p_fc("PXN(Y118)", "U73122", dec); 0.001::p_fc("PXN(Y118)", "U73122", inc) :- p_occupancy("PXN(Y118)", "U73122", dec).
0.001::p_fc("PXN(Y118)", "U73122", dec); 0.8427643561::p_fc("PXN(Y118)", "U73122", inc) :- p_occupancy("PXN(Y118)", "U73122", inc).
0.7649267863::p_fc("PXN(Y118)", "Ulixertinib", dec); 0.001::p_fc("PXN(Y118)", "Ulixertinib", inc) :- p_occupancy("PXN(Y118)", "Ulixertinib", dec).
0.001::p_fc("PXN(Y118)", "Ulixertinib", dec); 0.7649267863::p_fc("PXN(Y118)", "Ulixertinib", inc) :- p_occupancy("PXN(Y118)", "Ulixertinib", inc).
0.5034332414::p_fc("PXN(Y118)", "Vemurafenib", dec); 0.001::p_fc("PXN(Y118)", "Vemurafenib", inc) :- p_occupancy("PXN(Y118)", "Vemurafenib", dec).
0.001::p_fc("PXN(Y118)", "Vemurafenib", dec); 0.5034332414::p_fc("PXN(Y118)", "Vemurafenib", inc) :- p_occupancy("PXN(Y118)", "Vemurafenib", inc).
0.045072311::p_fc("PXN(Y88)", "AC220", dec); 0.001::p_fc("PXN(Y88)", "AC220", inc) :- p_occupancy("PXN(Y88)", "AC220", dec).
0.001::p_fc("PXN(Y88)", "AC220", dec); 0.045072311::p_fc("PXN(Y88)", "AC220", inc) :- p_occupancy("PXN(Y88)", "AC220", inc).
0.0196429508::p_fc("PXN(Y88)", "AT13148", dec); 0.001::p_fc("PXN(Y88)", "AT13148", inc) :- p_occupancy("PXN(Y88)", "AT13148", dec).
0.001::p_fc("PXN(Y88)", "AT13148", dec); 0.0196429508::p_fc("PXN(Y88)", "AT13148", inc) :- p_occupancy("PXN(Y88)", "AT13148", inc).
0.128956476::p_fc("PXN(Y88)", "AZ20", dec); 0.001::p_fc("PXN(Y88)", "AZ20", inc) :- p_occupancy("PXN(Y88)", "AZ20", dec).
0.001::p_fc("PXN(Y88)", "AZ20", dec); 0.128956476::p_fc("PXN(Y88)", "AZ20", inc) :- p_occupancy("PXN(Y88)", "AZ20", inc).
0.0425155124::p_fc("PXN(Y88)", "AZD1480", dec); 0.001::p_fc("PXN(Y88)", "AZD1480", inc) :- p_occupancy("PXN(Y88)", "AZD1480", dec).
0.001::p_fc("PXN(Y88)", "AZD1480", dec); 0.0425155124::p_fc("PXN(Y88)", "AZD1480", inc) :- p_occupancy("PXN(Y88)", "AZD1480", inc).
0.9937334108::p_fc("PXN(Y88)", "AZD3759", dec); 0.001::p_fc("PXN(Y88)", "AZD3759", inc) :- p_occupancy("PXN(Y88)", "AZD3759", dec).
0.001::p_fc("PXN(Y88)", "AZD3759", dec); 0.9937334108::p_fc("PXN(Y88)", "AZD3759", inc) :- p_occupancy("PXN(Y88)", "AZD3759", inc).
0.1323230316::p_fc("PXN(Y88)", "AZD5363", dec); 0.001::p_fc("PXN(Y88)", "AZD5363", inc) :- p_occupancy("PXN(Y88)", "AZD5363", dec).
0.001::p_fc("PXN(Y88)", "AZD5363", dec); 0.1323230316::p_fc("PXN(Y88)", "AZD5363", inc) :- p_occupancy("PXN(Y88)", "AZD5363", inc).
0.9954919546::p_fc("PXN(Y88)", "AZD5438", dec); 0.001::p_fc("PXN(Y88)", "AZD5438", inc) :- p_occupancy("PXN(Y88)", "AZD5438", dec).
0.001::p_fc("PXN(Y88)", "AZD5438", dec); 0.9954919546::p_fc("PXN(Y88)", "AZD5438", inc) :- p_occupancy("PXN(Y88)", "AZD5438", inc).
0.9327471868::p_fc("PXN(Y88)", "AZD6482", dec); 0.001::p_fc("PXN(Y88)", "AZD6482", inc) :- p_occupancy("PXN(Y88)", "AZD6482", dec).
0.001::p_fc("PXN(Y88)", "AZD6482", dec); 0.9327471868::p_fc("PXN(Y88)", "AZD6482", inc) :- p_occupancy("PXN(Y88)", "AZD6482", inc).
0.9285729151::p_fc("PXN(Y88)", "AZD6738", dec); 0.001::p_fc("PXN(Y88)", "AZD6738", inc) :- p_occupancy("PXN(Y88)", "AZD6738", dec).
0.001::p_fc("PXN(Y88)", "AZD6738", dec); 0.9285729151::p_fc("PXN(Y88)", "AZD6738", inc) :- p_occupancy("PXN(Y88)", "AZD6738", inc).
0.6792966159::p_fc("PXN(Y88)", "AZD8055", dec); 0.001::p_fc("PXN(Y88)", "AZD8055", inc) :- p_occupancy("PXN(Y88)", "AZD8055", dec).
0.001::p_fc("PXN(Y88)", "AZD8055", dec); 0.6792966159::p_fc("PXN(Y88)", "AZD8055", inc) :- p_occupancy("PXN(Y88)", "AZD8055", inc).
0.963253619::p_fc("PXN(Y88)", "Amuvatinib", dec); 0.001::p_fc("PXN(Y88)", "Amuvatinib", inc) :- p_occupancy("PXN(Y88)", "Amuvatinib", dec).
0.001::p_fc("PXN(Y88)", "Amuvatinib", dec); 0.963253619::p_fc("PXN(Y88)", "Amuvatinib", inc) :- p_occupancy("PXN(Y88)", "Amuvatinib", inc).
0.061258542::p_fc("PXN(Y88)", "BX912", dec); 0.001::p_fc("PXN(Y88)", "BX912", inc) :- p_occupancy("PXN(Y88)", "BX912", dec).
0.001::p_fc("PXN(Y88)", "BX912", dec); 0.061258542::p_fc("PXN(Y88)", "BX912", inc) :- p_occupancy("PXN(Y88)", "BX912", inc).
0.9744081668::p_fc("PXN(Y88)", "Bosutinib", dec); 0.001::p_fc("PXN(Y88)", "Bosutinib", inc) :- p_occupancy("PXN(Y88)", "Bosutinib", dec).
0.001::p_fc("PXN(Y88)", "Bosutinib", dec); 0.9744081668::p_fc("PXN(Y88)", "Bosutinib", inc) :- p_occupancy("PXN(Y88)", "Bosutinib", inc).
0.3585246065::p_fc("PXN(Y88)", "CAL101", dec); 0.001::p_fc("PXN(Y88)", "CAL101", inc) :- p_occupancy("PXN(Y88)", "CAL101", dec).
0.001::p_fc("PXN(Y88)", "CAL101", dec); 0.3585246065::p_fc("PXN(Y88)", "CAL101", inc) :- p_occupancy("PXN(Y88)", "CAL101", inc).
0.1867990666::p_fc("PXN(Y88)", "CHIR99021", dec); 0.001::p_fc("PXN(Y88)", "CHIR99021", inc) :- p_occupancy("PXN(Y88)", "CHIR99021", dec).
0.001::p_fc("PXN(Y88)", "CHIR99021", dec); 0.1867990666::p_fc("PXN(Y88)", "CHIR99021", inc) :- p_occupancy("PXN(Y88)", "CHIR99021", inc).
0.7859039415::p_fc("PXN(Y88)", "CX4945", dec); 0.001::p_fc("PXN(Y88)", "CX4945", inc) :- p_occupancy("PXN(Y88)", "CX4945", dec).
0.001::p_fc("PXN(Y88)", "CX4945", dec); 0.7859039415::p_fc("PXN(Y88)", "CX4945", inc) :- p_occupancy("PXN(Y88)", "CX4945", inc).
0.4939988032::p_fc("PXN(Y88)", "DNAPK", dec); 0.001::p_fc("PXN(Y88)", "DNAPK", inc) :- p_occupancy("PXN(Y88)", "DNAPK", dec).
0.001::p_fc("PXN(Y88)", "DNAPK", dec); 0.4939988032::p_fc("PXN(Y88)", "DNAPK", inc) :- p_occupancy("PXN(Y88)", "DNAPK", inc).
0.0709023451::p_fc("PXN(Y88)", "Dabrafenib", dec); 0.001::p_fc("PXN(Y88)", "Dabrafenib", inc) :- p_occupancy("PXN(Y88)", "Dabrafenib", dec).
0.001::p_fc("PXN(Y88)", "Dabrafenib", dec); 0.0709023451::p_fc("PXN(Y88)", "Dabrafenib", inc) :- p_occupancy("PXN(Y88)", "Dabrafenib", inc).
0.9562792417::p_fc("PXN(Y88)", "Dasatinib", dec); 0.001::p_fc("PXN(Y88)", "Dasatinib", inc) :- p_occupancy("PXN(Y88)", "Dasatinib", dec).
0.001::p_fc("PXN(Y88)", "Dasatinib", dec); 0.9562792417::p_fc("PXN(Y88)", "Dasatinib", inc) :- p_occupancy("PXN(Y88)", "Dasatinib", inc).
0.3986210122::p_fc("PXN(Y88)", "Edelfosine", dec); 0.001::p_fc("PXN(Y88)", "Edelfosine", inc) :- p_occupancy("PXN(Y88)", "Edelfosine", dec).
0.001::p_fc("PXN(Y88)", "Edelfosine", dec); 0.3986210122::p_fc("PXN(Y88)", "Edelfosine", inc) :- p_occupancy("PXN(Y88)", "Edelfosine", inc).
0.9979172644::p_fc("PXN(Y88)", "FRAX486", dec); 0.001::p_fc("PXN(Y88)", "FRAX486", inc) :- p_occupancy("PXN(Y88)", "FRAX486", dec).
0.001::p_fc("PXN(Y88)", "FRAX486", dec); 0.9979172644::p_fc("PXN(Y88)", "FRAX486", inc) :- p_occupancy("PXN(Y88)", "FRAX486", inc).
0.3726814554::p_fc("PXN(Y88)", "GDC0941", dec); 0.001::p_fc("PXN(Y88)", "GDC0941", inc) :- p_occupancy("PXN(Y88)", "GDC0941", dec).
0.001::p_fc("PXN(Y88)", "GDC0941", dec); 0.3726814554::p_fc("PXN(Y88)", "GDC0941", inc) :- p_occupancy("PXN(Y88)", "GDC0941", inc).
0.0271119856::p_fc("PXN(Y88)", "GDC0994", dec); 0.001::p_fc("PXN(Y88)", "GDC0994", inc) :- p_occupancy("PXN(Y88)", "GDC0994", dec).
0.001::p_fc("PXN(Y88)", "GDC0994", dec); 0.0271119856::p_fc("PXN(Y88)", "GDC0994", inc) :- p_occupancy("PXN(Y88)", "GDC0994", inc).
0.9980029918::p_fc("PXN(Y88)", "GF109203X", dec); 0.001::p_fc("PXN(Y88)", "GF109203X", inc) :- p_occupancy("PXN(Y88)", "GF109203X", dec).
0.001::p_fc("PXN(Y88)", "GF109203X", dec); 0.9980029918::p_fc("PXN(Y88)", "GF109203X", inc) :- p_occupancy("PXN(Y88)", "GF109203X", inc).
0.1672384825::p_fc("PXN(Y88)", "GO6983", dec); 0.001::p_fc("PXN(Y88)", "GO6983", inc) :- p_occupancy("PXN(Y88)", "GO6983", dec).
0.001::p_fc("PXN(Y88)", "GO6983", dec); 0.1672384825::p_fc("PXN(Y88)", "GO6983", inc) :- p_occupancy("PXN(Y88)", "GO6983", inc).
0.9273601759::p_fc("PXN(Y88)", "GSK2334470", dec); 0.001::p_fc("PXN(Y88)", "GSK2334470", inc) :- p_occupancy("PXN(Y88)", "GSK2334470", dec).
0.001::p_fc("PXN(Y88)", "GSK2334470", dec); 0.9273601759::p_fc("PXN(Y88)", "GSK2334470", inc) :- p_occupancy("PXN(Y88)", "GSK2334470", inc).
0.3844601127::p_fc("PXN(Y88)", "GSK690693", dec); 0.001::p_fc("PXN(Y88)", "GSK690693", inc) :- p_occupancy("PXN(Y88)", "GSK690693", dec).
0.001::p_fc("PXN(Y88)", "GSK690693", dec); 0.3844601127::p_fc("PXN(Y88)", "GSK690693", inc) :- p_occupancy("PXN(Y88)", "GSK690693", inc).
0.4461621878::p_fc("PXN(Y88)", "Go6976", dec); 0.001::p_fc("PXN(Y88)", "Go6976", inc) :- p_occupancy("PXN(Y88)", "Go6976", dec).
0.001::p_fc("PXN(Y88)", "Go6976", dec); 0.4461621878::p_fc("PXN(Y88)", "Go6976", inc) :- p_occupancy("PXN(Y88)", "Go6976", inc).
0.6482998084::p_fc("PXN(Y88)", "H89", dec); 0.001::p_fc("PXN(Y88)", "H89", inc) :- p_occupancy("PXN(Y88)", "H89", dec).
0.001::p_fc("PXN(Y88)", "H89", dec); 0.6482998084::p_fc("PXN(Y88)", "H89", inc) :- p_occupancy("PXN(Y88)", "H89", inc).
0.0596391905::p_fc("PXN(Y88)", "HS173", dec); 0.001::p_fc("PXN(Y88)", "HS173", inc) :- p_occupancy("PXN(Y88)", "HS173", dec).
0.001::p_fc("PXN(Y88)", "HS173", dec); 0.0596391905::p_fc("PXN(Y88)", "HS173", inc) :- p_occupancy("PXN(Y88)", "HS173", inc).
0.9974515104::p_fc("PXN(Y88)", "Ipatasertib", dec); 0.001::p_fc("PXN(Y88)", "Ipatasertib", inc) :- p_occupancy("PXN(Y88)", "Ipatasertib", dec).
0.001::p_fc("PXN(Y88)", "Ipatasertib", dec); 0.9974515104::p_fc("PXN(Y88)", "Ipatasertib", inc) :- p_occupancy("PXN(Y88)", "Ipatasertib", inc).
0.9979438102::p_fc("PXN(Y88)", "JNJ", dec); 0.001::p_fc("PXN(Y88)", "JNJ", inc) :- p_occupancy("PXN(Y88)", "JNJ", dec).
0.001::p_fc("PXN(Y88)", "JNJ", dec); 0.9979438102::p_fc("PXN(Y88)", "JNJ", inc) :- p_occupancy("PXN(Y88)", "JNJ", inc).
0.5875026475::p_fc("PXN(Y88)", "JNK", dec); 0.001::p_fc("PXN(Y88)", "JNK", inc) :- p_occupancy("PXN(Y88)", "JNK", dec).
0.001::p_fc("PXN(Y88)", "JNK", dec); 0.5875026475::p_fc("PXN(Y88)", "JNK", inc) :- p_occupancy("PXN(Y88)", "JNK", inc).
0.8497204082::p_fc("PXN(Y88)", "KD025", dec); 0.001::p_fc("PXN(Y88)", "KD025", inc) :- p_occupancy("PXN(Y88)", "KD025", dec).
0.001::p_fc("PXN(Y88)", "KD025", dec); 0.8497204082::p_fc("PXN(Y88)", "KD025", inc) :- p_occupancy("PXN(Y88)", "KD025", inc).
0.9975801321::p_fc("PXN(Y88)", "KN62", dec); 0.001::p_fc("PXN(Y88)", "KN62", inc) :- p_occupancy("PXN(Y88)", "KN62", dec).
0.001::p_fc("PXN(Y88)", "KN62", dec); 0.9975801321::p_fc("PXN(Y88)", "KN62", inc) :- p_occupancy("PXN(Y88)", "KN62", inc).
0.2664081838::p_fc("PXN(Y88)", "KN93", dec); 0.001::p_fc("PXN(Y88)", "KN93", inc) :- p_occupancy("PXN(Y88)", "KN93", dec).
0.001::p_fc("PXN(Y88)", "KN93", dec); 0.2664081838::p_fc("PXN(Y88)", "KN93", inc) :- p_occupancy("PXN(Y88)", "KN93", inc).
0.9899566561::p_fc("PXN(Y88)", "Ku0063794", dec); 0.001::p_fc("PXN(Y88)", "Ku0063794", inc) :- p_occupancy("PXN(Y88)", "Ku0063794", dec).
0.001::p_fc("PXN(Y88)", "Ku0063794", dec); 0.9899566561::p_fc("PXN(Y88)", "Ku0063794", inc) :- p_occupancy("PXN(Y88)", "Ku0063794", inc).
0.2835115945::p_fc("PXN(Y88)", "LY2090314", dec); 0.001::p_fc("PXN(Y88)", "LY2090314", inc) :- p_occupancy("PXN(Y88)", "LY2090314", dec).
0.001::p_fc("PXN(Y88)", "LY2090314", dec); 0.2835115945::p_fc("PXN(Y88)", "LY2090314", inc) :- p_occupancy("PXN(Y88)", "LY2090314", inc).
0.4235015861::p_fc("PXN(Y88)", "LY2584702", dec); 0.001::p_fc("PXN(Y88)", "LY2584702", inc) :- p_occupancy("PXN(Y88)", "LY2584702", dec).
0.001::p_fc("PXN(Y88)", "LY2584702", dec); 0.4235015861::p_fc("PXN(Y88)", "LY2584702", inc) :- p_occupancy("PXN(Y88)", "LY2584702", inc).
0.9901869485::p_fc("PXN(Y88)", "LY2835219", dec); 0.001::p_fc("PXN(Y88)", "LY2835219", inc) :- p_occupancy("PXN(Y88)", "LY2835219", dec).
0.001::p_fc("PXN(Y88)", "LY2835219", dec); 0.9901869485::p_fc("PXN(Y88)", "LY2835219", inc) :- p_occupancy("PXN(Y88)", "LY2835219", inc).
0.9921023091::p_fc("PXN(Y88)", "Linsitinib", dec); 0.001::p_fc("PXN(Y88)", "Linsitinib", inc) :- p_occupancy("PXN(Y88)", "Linsitinib", dec).
0.001::p_fc("PXN(Y88)", "Linsitinib", dec); 0.9921023091::p_fc("PXN(Y88)", "Linsitinib", inc) :- p_occupancy("PXN(Y88)", "Linsitinib", inc).
0.1537365292::p_fc("PXN(Y88)", "MK2206", dec); 0.001::p_fc("PXN(Y88)", "MK2206", inc) :- p_occupancy("PXN(Y88)", "MK2206", dec).
0.001::p_fc("PXN(Y88)", "MK2206", dec); 0.1537365292::p_fc("PXN(Y88)", "MK2206", inc) :- p_occupancy("PXN(Y88)", "MK2206", inc).
0.5962127133::p_fc("PXN(Y88)", "NU7441", dec); 0.001::p_fc("PXN(Y88)", "NU7441", inc) :- p_occupancy("PXN(Y88)", "NU7441", dec).
0.001::p_fc("PXN(Y88)", "NU7441", dec); 0.5962127133::p_fc("PXN(Y88)", "NU7441", inc) :- p_occupancy("PXN(Y88)", "NU7441", inc).
0.1856029187::p_fc("PXN(Y88)", "PD153035", dec); 0.001::p_fc("PXN(Y88)", "PD153035", inc) :- p_occupancy("PXN(Y88)", "PD153035", dec).
0.001::p_fc("PXN(Y88)", "PD153035", dec); 0.1856029187::p_fc("PXN(Y88)", "PD153035", inc) :- p_occupancy("PXN(Y88)", "PD153035", inc).
0.780731235::p_fc("PXN(Y88)", "PF3758309", dec); 0.001::p_fc("PXN(Y88)", "PF3758309", inc) :- p_occupancy("PXN(Y88)", "PF3758309", dec).
0.001::p_fc("PXN(Y88)", "PF3758309", dec); 0.780731235::p_fc("PXN(Y88)", "PF3758309", inc) :- p_occupancy("PXN(Y88)", "PF3758309", inc).
0.1111829043::p_fc("PXN(Y88)", "PF4708671", dec); 0.001::p_fc("PXN(Y88)", "PF4708671", inc) :- p_occupancy("PXN(Y88)", "PF4708671", dec).
0.001::p_fc("PXN(Y88)", "PF4708671", dec); 0.1111829043::p_fc("PXN(Y88)", "PF4708671", inc) :- p_occupancy("PXN(Y88)", "PF4708671", inc).
0.0960919966::p_fc("PXN(Y88)", "PH797804", dec); 0.001::p_fc("PXN(Y88)", "PH797804", inc) :- p_occupancy("PXN(Y88)", "PH797804", dec).
0.001::p_fc("PXN(Y88)", "PH797804", dec); 0.0960919966::p_fc("PXN(Y88)", "PH797804", inc) :- p_occupancy("PXN(Y88)", "PH797804", inc).
0.5586315039::p_fc("PXN(Y88)", "PIK294", dec); 0.001::p_fc("PXN(Y88)", "PIK294", inc) :- p_occupancy("PXN(Y88)", "PIK294", dec).
0.001::p_fc("PXN(Y88)", "PIK294", dec); 0.5586315039::p_fc("PXN(Y88)", "PIK294", inc) :- p_occupancy("PXN(Y88)", "PIK294", inc).
0.9976070235::p_fc("PXN(Y88)", "Ribociclib", dec); 0.001::p_fc("PXN(Y88)", "Ribociclib", inc) :- p_occupancy("PXN(Y88)", "Ribociclib", dec).
0.001::p_fc("PXN(Y88)", "Ribociclib", dec); 0.9976070235::p_fc("PXN(Y88)", "Ribociclib", inc) :- p_occupancy("PXN(Y88)", "Ribociclib", inc).
0.3140053655::p_fc("PXN(Y88)", "Ripasudil", dec); 0.001::p_fc("PXN(Y88)", "Ripasudil", inc) :- p_occupancy("PXN(Y88)", "Ripasudil", dec).
0.001::p_fc("PXN(Y88)", "Ripasudil", dec); 0.3140053655::p_fc("PXN(Y88)", "Ripasudil", inc) :- p_occupancy("PXN(Y88)", "Ripasudil", inc).
0.0343767079::p_fc("PXN(Y88)", "SP600125", dec); 0.001::p_fc("PXN(Y88)", "SP600125", inc) :- p_occupancy("PXN(Y88)", "SP600125", dec).
0.001::p_fc("PXN(Y88)", "SP600125", dec); 0.0343767079::p_fc("PXN(Y88)", "SP600125", inc) :- p_occupancy("PXN(Y88)", "SP600125", inc).
0.1994208977::p_fc("PXN(Y88)", "Selumetinib", dec); 0.001::p_fc("PXN(Y88)", "Selumetinib", inc) :- p_occupancy("PXN(Y88)", "Selumetinib", dec).
0.001::p_fc("PXN(Y88)", "Selumetinib", dec); 0.1994208977::p_fc("PXN(Y88)", "Selumetinib", inc) :- p_occupancy("PXN(Y88)", "Selumetinib", inc).
0.27791512::p_fc("PXN(Y88)", "TAK715", dec); 0.001::p_fc("PXN(Y88)", "TAK715", inc) :- p_occupancy("PXN(Y88)", "TAK715", dec).
0.001::p_fc("PXN(Y88)", "TAK715", dec); 0.27791512::p_fc("PXN(Y88)", "TAK715", inc) :- p_occupancy("PXN(Y88)", "TAK715", inc).
0.094638743::p_fc("PXN(Y88)", "TBCA", dec); 0.001::p_fc("PXN(Y88)", "TBCA", inc) :- p_occupancy("PXN(Y88)", "TBCA", dec).
0.001::p_fc("PXN(Y88)", "TBCA", dec); 0.094638743::p_fc("PXN(Y88)", "TBCA", inc) :- p_occupancy("PXN(Y88)", "TBCA", inc).
0.6949722168::p_fc("PXN(Y88)", "TGX221", dec); 0.001::p_fc("PXN(Y88)", "TGX221", inc) :- p_occupancy("PXN(Y88)", "TGX221", dec).
0.001::p_fc("PXN(Y88)", "TGX221", dec); 0.6949722168::p_fc("PXN(Y88)", "TGX221", inc) :- p_occupancy("PXN(Y88)", "TGX221", inc).
0.7863931688::p_fc("PXN(Y88)", "Tofacitinib", dec); 0.001::p_fc("PXN(Y88)", "Tofacitinib", inc) :- p_occupancy("PXN(Y88)", "Tofacitinib", dec).
0.001::p_fc("PXN(Y88)", "Tofacitinib", dec); 0.7863931688::p_fc("PXN(Y88)", "Tofacitinib", inc) :- p_occupancy("PXN(Y88)", "Tofacitinib", inc).
0.9979973019::p_fc("PXN(Y88)", "Torin", dec); 0.001::p_fc("PXN(Y88)", "Torin", inc) :- p_occupancy("PXN(Y88)", "Torin", dec).
0.001::p_fc("PXN(Y88)", "Torin", dec); 0.9979973019::p_fc("PXN(Y88)", "Torin", inc) :- p_occupancy("PXN(Y88)", "Torin", inc).
0.9933934156::p_fc("PXN(Y88)", "Trametinib", dec); 0.001::p_fc("PXN(Y88)", "Trametinib", inc) :- p_occupancy("PXN(Y88)", "Trametinib", dec).
0.001::p_fc("PXN(Y88)", "Trametinib", dec); 0.9933934156::p_fc("PXN(Y88)", "Trametinib", inc) :- p_occupancy("PXN(Y88)", "Trametinib", inc).
0.551474061::p_fc("PXN(Y88)", "U73122", dec); 0.001::p_fc("PXN(Y88)", "U73122", inc) :- p_occupancy("PXN(Y88)", "U73122", dec).
0.001::p_fc("PXN(Y88)", "U73122", dec); 0.551474061::p_fc("PXN(Y88)", "U73122", inc) :- p_occupancy("PXN(Y88)", "U73122", inc).
0.7986084537::p_fc("PXN(Y88)", "Ulixertinib", dec); 0.001::p_fc("PXN(Y88)", "Ulixertinib", inc) :- p_occupancy("PXN(Y88)", "Ulixertinib", dec).
0.001::p_fc("PXN(Y88)", "Ulixertinib", dec); 0.7986084537::p_fc("PXN(Y88)", "Ulixertinib", inc) :- p_occupancy("PXN(Y88)", "Ulixertinib", inc).
0.7056009474::p_fc("PXN(Y88)", "Vemurafenib", dec); 0.001::p_fc("PXN(Y88)", "Vemurafenib", inc) :- p_occupancy("PXN(Y88)", "Vemurafenib", dec).
0.001::p_fc("PXN(Y88)", "Vemurafenib", dec); 0.7056009474::p_fc("PXN(Y88)", "Vemurafenib", inc) :- p_occupancy("PXN(Y88)", "Vemurafenib", inc).
0.9289738868::p_fc("RBM39(Y95)", "AC220", dec); 0.001::p_fc("RBM39(Y95)", "AC220", inc) :- p_occupancy("RBM39(Y95)", "AC220", dec).
0.001::p_fc("RBM39(Y95)", "AC220", dec); 0.9289738868::p_fc("RBM39(Y95)", "AC220", inc) :- p_occupancy("RBM39(Y95)", "AC220", inc).
0.7603236851::p_fc("RBM39(Y95)", "AT13148", dec); 0.001::p_fc("RBM39(Y95)", "AT13148", inc) :- p_occupancy("RBM39(Y95)", "AT13148", dec).
0.001::p_fc("RBM39(Y95)", "AT13148", dec); 0.7603236851::p_fc("RBM39(Y95)", "AT13148", inc) :- p_occupancy("RBM39(Y95)", "AT13148", inc).
0.5140955475::p_fc("RBM39(Y95)", "AZ20", dec); 0.001::p_fc("RBM39(Y95)", "AZ20", inc) :- p_occupancy("RBM39(Y95)", "AZ20", dec).
0.001::p_fc("RBM39(Y95)", "AZ20", dec); 0.5140955475::p_fc("RBM39(Y95)", "AZ20", inc) :- p_occupancy("RBM39(Y95)", "AZ20", inc).
0.6123475053::p_fc("RBM39(Y95)", "AZD1480", dec); 0.001::p_fc("RBM39(Y95)", "AZD1480", inc) :- p_occupancy("RBM39(Y95)", "AZD1480", dec).
0.001::p_fc("RBM39(Y95)", "AZD1480", dec); 0.6123475053::p_fc("RBM39(Y95)", "AZD1480", inc) :- p_occupancy("RBM39(Y95)", "AZD1480", inc).
0.5469778542::p_fc("RBM39(Y95)", "AZD3759", dec); 0.001::p_fc("RBM39(Y95)", "AZD3759", inc) :- p_occupancy("RBM39(Y95)", "AZD3759", dec).
0.001::p_fc("RBM39(Y95)", "AZD3759", dec); 0.5469778542::p_fc("RBM39(Y95)", "AZD3759", inc) :- p_occupancy("RBM39(Y95)", "AZD3759", inc).
0.9525753979::p_fc("RBM39(Y95)", "AZD5363", dec); 0.001::p_fc("RBM39(Y95)", "AZD5363", inc) :- p_occupancy("RBM39(Y95)", "AZD5363", dec).
0.001::p_fc("RBM39(Y95)", "AZD5363", dec); 0.9525753979::p_fc("RBM39(Y95)", "AZD5363", inc) :- p_occupancy("RBM39(Y95)", "AZD5363", inc).
0.4287618872::p_fc("RBM39(Y95)", "AZD5438", dec); 0.001::p_fc("RBM39(Y95)", "AZD5438", inc) :- p_occupancy("RBM39(Y95)", "AZD5438", dec).
0.001::p_fc("RBM39(Y95)", "AZD5438", dec); 0.4287618872::p_fc("RBM39(Y95)", "AZD5438", inc) :- p_occupancy("RBM39(Y95)", "AZD5438", inc).
0.0314880998::p_fc("RBM39(Y95)", "AZD6482", dec); 0.001::p_fc("RBM39(Y95)", "AZD6482", inc) :- p_occupancy("RBM39(Y95)", "AZD6482", dec).
0.001::p_fc("RBM39(Y95)", "AZD6482", dec); 0.0314880998::p_fc("RBM39(Y95)", "AZD6482", inc) :- p_occupancy("RBM39(Y95)", "AZD6482", inc).
0.5685327433::p_fc("RBM39(Y95)", "AZD6738", dec); 0.001::p_fc("RBM39(Y95)", "AZD6738", inc) :- p_occupancy("RBM39(Y95)", "AZD6738", dec).
0.001::p_fc("RBM39(Y95)", "AZD6738", dec); 0.5685327433::p_fc("RBM39(Y95)", "AZD6738", inc) :- p_occupancy("RBM39(Y95)", "AZD6738", inc).
0.998005988::p_fc("RBM39(Y95)", "AZD8055", dec); 0.001::p_fc("RBM39(Y95)", "AZD8055", inc) :- p_occupancy("RBM39(Y95)", "AZD8055", dec).
0.001::p_fc("RBM39(Y95)", "AZD8055", dec); 0.998005988::p_fc("RBM39(Y95)", "AZD8055", inc) :- p_occupancy("RBM39(Y95)", "AZD8055", inc).
0.7399555775::p_fc("RBM39(Y95)", "Amuvatinib", dec); 0.001::p_fc("RBM39(Y95)", "Amuvatinib", inc) :- p_occupancy("RBM39(Y95)", "Amuvatinib", dec).
0.001::p_fc("RBM39(Y95)", "Amuvatinib", dec); 0.7399555775::p_fc("RBM39(Y95)", "Amuvatinib", inc) :- p_occupancy("RBM39(Y95)", "Amuvatinib", inc).
0.377175284::p_fc("RBM39(Y95)", "BX912", dec); 0.001::p_fc("RBM39(Y95)", "BX912", inc) :- p_occupancy("RBM39(Y95)", "BX912", dec).
0.001::p_fc("RBM39(Y95)", "BX912", dec); 0.377175284::p_fc("RBM39(Y95)", "BX912", inc) :- p_occupancy("RBM39(Y95)", "BX912", inc).
0.2874110572::p_fc("RBM39(Y95)", "Bosutinib", dec); 0.001::p_fc("RBM39(Y95)", "Bosutinib", inc) :- p_occupancy("RBM39(Y95)", "Bosutinib", dec).
0.001::p_fc("RBM39(Y95)", "Bosutinib", dec); 0.2874110572::p_fc("RBM39(Y95)", "Bosutinib", inc) :- p_occupancy("RBM39(Y95)", "Bosutinib", inc).
0.4661741296::p_fc("RBM39(Y95)", "CAL101", dec); 0.001::p_fc("RBM39(Y95)", "CAL101", inc) :- p_occupancy("RBM39(Y95)", "CAL101", dec).
0.001::p_fc("RBM39(Y95)", "CAL101", dec); 0.4661741296::p_fc("RBM39(Y95)", "CAL101", inc) :- p_occupancy("RBM39(Y95)", "CAL101", inc).
0.3532874411::p_fc("RBM39(Y95)", "CHIR99021", dec); 0.001::p_fc("RBM39(Y95)", "CHIR99021", inc) :- p_occupancy("RBM39(Y95)", "CHIR99021", dec).
0.001::p_fc("RBM39(Y95)", "CHIR99021", dec); 0.3532874411::p_fc("RBM39(Y95)", "CHIR99021", inc) :- p_occupancy("RBM39(Y95)", "CHIR99021", inc).
0.4994798655::p_fc("RBM39(Y95)", "CX4945", dec); 0.001::p_fc("RBM39(Y95)", "CX4945", inc) :- p_occupancy("RBM39(Y95)", "CX4945", dec).
0.001::p_fc("RBM39(Y95)", "CX4945", dec); 0.4994798655::p_fc("RBM39(Y95)", "CX4945", inc) :- p_occupancy("RBM39(Y95)", "CX4945", inc).
0.1675490164::p_fc("RBM39(Y95)", "DNAPK", dec); 0.001::p_fc("RBM39(Y95)", "DNAPK", inc) :- p_occupancy("RBM39(Y95)", "DNAPK", dec).
0.001::p_fc("RBM39(Y95)", "DNAPK", dec); 0.1675490164::p_fc("RBM39(Y95)", "DNAPK", inc) :- p_occupancy("RBM39(Y95)", "DNAPK", inc).
0.1996427939::p_fc("RBM39(Y95)", "Dabrafenib", dec); 0.001::p_fc("RBM39(Y95)", "Dabrafenib", inc) :- p_occupancy("RBM39(Y95)", "Dabrafenib", dec).
0.001::p_fc("RBM39(Y95)", "Dabrafenib", dec); 0.1996427939::p_fc("RBM39(Y95)", "Dabrafenib", inc) :- p_occupancy("RBM39(Y95)", "Dabrafenib", inc).
0.0617466769::p_fc("RBM39(Y95)", "Dasatinib", dec); 0.001::p_fc("RBM39(Y95)", "Dasatinib", inc) :- p_occupancy("RBM39(Y95)", "Dasatinib", dec).
0.001::p_fc("RBM39(Y95)", "Dasatinib", dec); 0.0617466769::p_fc("RBM39(Y95)", "Dasatinib", inc) :- p_occupancy("RBM39(Y95)", "Dasatinib", inc).
0.9694875074::p_fc("RBM39(Y95)", "Edelfosine", dec); 0.001::p_fc("RBM39(Y95)", "Edelfosine", inc) :- p_occupancy("RBM39(Y95)", "Edelfosine", dec).
0.001::p_fc("RBM39(Y95)", "Edelfosine", dec); 0.9694875074::p_fc("RBM39(Y95)", "Edelfosine", inc) :- p_occupancy("RBM39(Y95)", "Edelfosine", inc).
0.5757407166::p_fc("RBM39(Y95)", "FRAX486", dec); 0.001::p_fc("RBM39(Y95)", "FRAX486", inc) :- p_occupancy("RBM39(Y95)", "FRAX486", dec).
0.001::p_fc("RBM39(Y95)", "FRAX486", dec); 0.5757407166::p_fc("RBM39(Y95)", "FRAX486", inc) :- p_occupancy("RBM39(Y95)", "FRAX486", inc).
0.9673600459::p_fc("RBM39(Y95)", "GDC0941", dec); 0.001::p_fc("RBM39(Y95)", "GDC0941", inc) :- p_occupancy("RBM39(Y95)", "GDC0941", dec).
0.001::p_fc("RBM39(Y95)", "GDC0941", dec); 0.9673600459::p_fc("RBM39(Y95)", "GDC0941", inc) :- p_occupancy("RBM39(Y95)", "GDC0941", inc).
0.0218218778::p_fc("RBM39(Y95)", "GDC0994", dec); 0.001::p_fc("RBM39(Y95)", "GDC0994", inc) :- p_occupancy("RBM39(Y95)", "GDC0994", dec).
0.001::p_fc("RBM39(Y95)", "GDC0994", dec); 0.0218218778::p_fc("RBM39(Y95)", "GDC0994", inc) :- p_occupancy("RBM39(Y95)", "GDC0994", inc).
0.6800525894::p_fc("RBM39(Y95)", "GF109203X", dec); 0.001::p_fc("RBM39(Y95)", "GF109203X", inc) :- p_occupancy("RBM39(Y95)", "GF109203X", dec).
0.001::p_fc("RBM39(Y95)", "GF109203X", dec); 0.6800525894::p_fc("RBM39(Y95)", "GF109203X", inc) :- p_occupancy("RBM39(Y95)", "GF109203X", inc).
0.998005988::p_fc("RBM39(Y95)", "GO6983", dec); 0.001::p_fc("RBM39(Y95)", "GO6983", inc) :- p_occupancy("RBM39(Y95)", "GO6983", dec).
0.001::p_fc("RBM39(Y95)", "GO6983", dec); 0.998005988::p_fc("RBM39(Y95)", "GO6983", inc) :- p_occupancy("RBM39(Y95)", "GO6983", inc).
0.1140965347::p_fc("RBM39(Y95)", "GSK2334470", dec); 0.001::p_fc("RBM39(Y95)", "GSK2334470", inc) :- p_occupancy("RBM39(Y95)", "GSK2334470", dec).
0.001::p_fc("RBM39(Y95)", "GSK2334470", dec); 0.1140965347::p_fc("RBM39(Y95)", "GSK2334470", inc) :- p_occupancy("RBM39(Y95)", "GSK2334470", inc).
0.9106442518::p_fc("RBM39(Y95)", "GSK690693", dec); 0.001::p_fc("RBM39(Y95)", "GSK690693", inc) :- p_occupancy("RBM39(Y95)", "GSK690693", dec).
0.001::p_fc("RBM39(Y95)", "GSK690693", dec); 0.9106442518::p_fc("RBM39(Y95)", "GSK690693", inc) :- p_occupancy("RBM39(Y95)", "GSK690693", inc).
0.3978824066::p_fc("RBM39(Y95)", "Go6976", dec); 0.001::p_fc("RBM39(Y95)", "Go6976", inc) :- p_occupancy("RBM39(Y95)", "Go6976", dec).
0.001::p_fc("RBM39(Y95)", "Go6976", dec); 0.3978824066::p_fc("RBM39(Y95)", "Go6976", inc) :- p_occupancy("RBM39(Y95)", "Go6976", inc).
0.1131283238::p_fc("RBM39(Y95)", "H89", dec); 0.001::p_fc("RBM39(Y95)", "H89", inc) :- p_occupancy("RBM39(Y95)", "H89", dec).
0.001::p_fc("RBM39(Y95)", "H89", dec); 0.1131283238::p_fc("RBM39(Y95)", "H89", inc) :- p_occupancy("RBM39(Y95)", "H89", inc).
0.303148833::p_fc("RBM39(Y95)", "HS173", dec); 0.001::p_fc("RBM39(Y95)", "HS173", inc) :- p_occupancy("RBM39(Y95)", "HS173", dec).
0.001::p_fc("RBM39(Y95)", "HS173", dec); 0.303148833::p_fc("RBM39(Y95)", "HS173", inc) :- p_occupancy("RBM39(Y95)", "HS173", inc).
0.2269089809::p_fc("RBM39(Y95)", "Ipatasertib", dec); 0.001::p_fc("RBM39(Y95)", "Ipatasertib", inc) :- p_occupancy("RBM39(Y95)", "Ipatasertib", dec).
0.001::p_fc("RBM39(Y95)", "Ipatasertib", dec); 0.2269089809::p_fc("RBM39(Y95)", "Ipatasertib", inc) :- p_occupancy("RBM39(Y95)", "Ipatasertib", inc).
0.1605372715::p_fc("RBM39(Y95)", "JNJ", dec); 0.001::p_fc("RBM39(Y95)", "JNJ", inc) :- p_occupancy("RBM39(Y95)", "JNJ", dec).
0.001::p_fc("RBM39(Y95)", "JNJ", dec); 0.1605372715::p_fc("RBM39(Y95)", "JNJ", inc) :- p_occupancy("RBM39(Y95)", "JNJ", inc).
0.9959146526::p_fc("RBM39(Y95)", "JNK", dec); 0.001::p_fc("RBM39(Y95)", "JNK", inc) :- p_occupancy("RBM39(Y95)", "JNK", dec).
0.001::p_fc("RBM39(Y95)", "JNK", dec); 0.9959146526::p_fc("RBM39(Y95)", "JNK", inc) :- p_occupancy("RBM39(Y95)", "JNK", inc).
0.9682702127::p_fc("RBM39(Y95)", "KD025", dec); 0.001::p_fc("RBM39(Y95)", "KD025", inc) :- p_occupancy("RBM39(Y95)", "KD025", dec).
0.001::p_fc("RBM39(Y95)", "KD025", dec); 0.9682702127::p_fc("RBM39(Y95)", "KD025", inc) :- p_occupancy("RBM39(Y95)", "KD025", inc).
0.6553757855::p_fc("RBM39(Y95)", "KN62", dec); 0.001::p_fc("RBM39(Y95)", "KN62", inc) :- p_occupancy("RBM39(Y95)", "KN62", dec).
0.001::p_fc("RBM39(Y95)", "KN62", dec); 0.6553757855::p_fc("RBM39(Y95)", "KN62", inc) :- p_occupancy("RBM39(Y95)", "KN62", inc).
0.1781503159::p_fc("RBM39(Y95)", "KN93", dec); 0.001::p_fc("RBM39(Y95)", "KN93", inc) :- p_occupancy("RBM39(Y95)", "KN93", dec).
0.001::p_fc("RBM39(Y95)", "KN93", dec); 0.1781503159::p_fc("RBM39(Y95)", "KN93", inc) :- p_occupancy("RBM39(Y95)", "KN93", inc).
0.5055630777::p_fc("RBM39(Y95)", "Ku0063794", dec); 0.001::p_fc("RBM39(Y95)", "Ku0063794", inc) :- p_occupancy("RBM39(Y95)", "Ku0063794", dec).
0.001::p_fc("RBM39(Y95)", "Ku0063794", dec); 0.5055630777::p_fc("RBM39(Y95)", "Ku0063794", inc) :- p_occupancy("RBM39(Y95)", "Ku0063794", inc).
0.0523057646::p_fc("RBM39(Y95)", "LY2090314", dec); 0.001::p_fc("RBM39(Y95)", "LY2090314", inc) :- p_occupancy("RBM39(Y95)", "LY2090314", dec).
0.001::p_fc("RBM39(Y95)", "LY2090314", dec); 0.0523057646::p_fc("RBM39(Y95)", "LY2090314", inc) :- p_occupancy("RBM39(Y95)", "LY2090314", inc).
0.0888338681::p_fc("RBM39(Y95)", "LY2584702", dec); 0.001::p_fc("RBM39(Y95)", "LY2584702", inc) :- p_occupancy("RBM39(Y95)", "LY2584702", dec).
0.001::p_fc("RBM39(Y95)", "LY2584702", dec); 0.0888338681::p_fc("RBM39(Y95)", "LY2584702", inc) :- p_occupancy("RBM39(Y95)", "LY2584702", inc).
0.3286010709::p_fc("RBM39(Y95)", "LY2835219", dec); 0.001::p_fc("RBM39(Y95)", "LY2835219", inc) :- p_occupancy("RBM39(Y95)", "LY2835219", dec).
0.001::p_fc("RBM39(Y95)", "LY2835219", dec); 0.3286010709::p_fc("RBM39(Y95)", "LY2835219", inc) :- p_occupancy("RBM39(Y95)", "LY2835219", inc).
0.4947350646::p_fc("RBM39(Y95)", "Linsitinib", dec); 0.001::p_fc("RBM39(Y95)", "Linsitinib", inc) :- p_occupancy("RBM39(Y95)", "Linsitinib", dec).
0.001::p_fc("RBM39(Y95)", "Linsitinib", dec); 0.4947350646::p_fc("RBM39(Y95)", "Linsitinib", inc) :- p_occupancy("RBM39(Y95)", "Linsitinib", inc).
0.1410442495::p_fc("RBM39(Y95)", "MK2206", dec); 0.001::p_fc("RBM39(Y95)", "MK2206", inc) :- p_occupancy("RBM39(Y95)", "MK2206", dec).
0.001::p_fc("RBM39(Y95)", "MK2206", dec); 0.1410442495::p_fc("RBM39(Y95)", "MK2206", inc) :- p_occupancy("RBM39(Y95)", "MK2206", inc).
0.2284442067::p_fc("RBM39(Y95)", "NU7441", dec); 0.001::p_fc("RBM39(Y95)", "NU7441", inc) :- p_occupancy("RBM39(Y95)", "NU7441", dec).
0.001::p_fc("RBM39(Y95)", "NU7441", dec); 0.2284442067::p_fc("RBM39(Y95)", "NU7441", inc) :- p_occupancy("RBM39(Y95)", "NU7441", inc).
0.533098155::p_fc("RBM39(Y95)", "PD153035", dec); 0.001::p_fc("RBM39(Y95)", "PD153035", inc) :- p_occupancy("RBM39(Y95)", "PD153035", dec).
0.001::p_fc("RBM39(Y95)", "PD153035", dec); 0.533098155::p_fc("RBM39(Y95)", "PD153035", inc) :- p_occupancy("RBM39(Y95)", "PD153035", inc).
0.9980048955::p_fc("RBM39(Y95)", "PF3758309", dec); 0.001::p_fc("RBM39(Y95)", "PF3758309", inc) :- p_occupancy("RBM39(Y95)", "PF3758309", dec).
0.001::p_fc("RBM39(Y95)", "PF3758309", dec); 0.9980048955::p_fc("RBM39(Y95)", "PF3758309", inc) :- p_occupancy("RBM39(Y95)", "PF3758309", inc).
0.6430215668::p_fc("RBM39(Y95)", "PF4708671", dec); 0.001::p_fc("RBM39(Y95)", "PF4708671", inc) :- p_occupancy("RBM39(Y95)", "PF4708671", dec).
0.001::p_fc("RBM39(Y95)", "PF4708671", dec); 0.6430215668::p_fc("RBM39(Y95)", "PF4708671", inc) :- p_occupancy("RBM39(Y95)", "PF4708671", inc).
0.8149516939::p_fc("RBM39(Y95)", "PH797804", dec); 0.001::p_fc("RBM39(Y95)", "PH797804", inc) :- p_occupancy("RBM39(Y95)", "PH797804", dec).
0.001::p_fc("RBM39(Y95)", "PH797804", dec); 0.8149516939::p_fc("RBM39(Y95)", "PH797804", inc) :- p_occupancy("RBM39(Y95)", "PH797804", inc).
0.3563268073::p_fc("RBM39(Y95)", "PIK294", dec); 0.001::p_fc("RBM39(Y95)", "PIK294", inc) :- p_occupancy("RBM39(Y95)", "PIK294", dec).
0.001::p_fc("RBM39(Y95)", "PIK294", dec); 0.3563268073::p_fc("RBM39(Y95)", "PIK294", inc) :- p_occupancy("RBM39(Y95)", "PIK294", inc).
0.1192131479::p_fc("RBM39(Y95)", "Ribociclib", dec); 0.001::p_fc("RBM39(Y95)", "Ribociclib", inc) :- p_occupancy("RBM39(Y95)", "Ribociclib", dec).
0.001::p_fc("RBM39(Y95)", "Ribociclib", dec); 0.1192131479::p_fc("RBM39(Y95)", "Ribociclib", inc) :- p_occupancy("RBM39(Y95)", "Ribociclib", inc).
0.7270279032::p_fc("RBM39(Y95)", "Ripasudil", dec); 0.001::p_fc("RBM39(Y95)", "Ripasudil", inc) :- p_occupancy("RBM39(Y95)", "Ripasudil", dec).
0.001::p_fc("RBM39(Y95)", "Ripasudil", dec); 0.7270279032::p_fc("RBM39(Y95)", "Ripasudil", inc) :- p_occupancy("RBM39(Y95)", "Ripasudil", inc).
0.6165632388::p_fc("RBM39(Y95)", "SP600125", dec); 0.001::p_fc("RBM39(Y95)", "SP600125", inc) :- p_occupancy("RBM39(Y95)", "SP600125", dec).
0.001::p_fc("RBM39(Y95)", "SP600125", dec); 0.6165632388::p_fc("RBM39(Y95)", "SP600125", inc) :- p_occupancy("RBM39(Y95)", "SP600125", inc).
0.5509140895::p_fc("RBM39(Y95)", "Selumetinib", dec); 0.001::p_fc("RBM39(Y95)", "Selumetinib", inc) :- p_occupancy("RBM39(Y95)", "Selumetinib", dec).
0.001::p_fc("RBM39(Y95)", "Selumetinib", dec); 0.5509140895::p_fc("RBM39(Y95)", "Selumetinib", inc) :- p_occupancy("RBM39(Y95)", "Selumetinib", inc).
0.1086205133::p_fc("RBM39(Y95)", "TAK715", dec); 0.001::p_fc("RBM39(Y95)", "TAK715", inc) :- p_occupancy("RBM39(Y95)", "TAK715", dec).
0.001::p_fc("RBM39(Y95)", "TAK715", dec); 0.1086205133::p_fc("RBM39(Y95)", "TAK715", inc) :- p_occupancy("RBM39(Y95)", "TAK715", inc).
0.503342422::p_fc("RBM39(Y95)", "TBCA", dec); 0.001::p_fc("RBM39(Y95)", "TBCA", inc) :- p_occupancy("RBM39(Y95)", "TBCA", dec).
0.001::p_fc("RBM39(Y95)", "TBCA", dec); 0.503342422::p_fc("RBM39(Y95)", "TBCA", inc) :- p_occupancy("RBM39(Y95)", "TBCA", inc).
0.1871227431::p_fc("RBM39(Y95)", "TGX221", dec); 0.001::p_fc("RBM39(Y95)", "TGX221", inc) :- p_occupancy("RBM39(Y95)", "TGX221", dec).
0.001::p_fc("RBM39(Y95)", "TGX221", dec); 0.1871227431::p_fc("RBM39(Y95)", "TGX221", inc) :- p_occupancy("RBM39(Y95)", "TGX221", inc).
0.4701929986::p_fc("RBM39(Y95)", "Tofacitinib", dec); 0.001::p_fc("RBM39(Y95)", "Tofacitinib", inc) :- p_occupancy("RBM39(Y95)", "Tofacitinib", dec).
0.001::p_fc("RBM39(Y95)", "Tofacitinib", dec); 0.4701929986::p_fc("RBM39(Y95)", "Tofacitinib", inc) :- p_occupancy("RBM39(Y95)", "Tofacitinib", inc).
0.3563704925::p_fc("RBM39(Y95)", "Torin", dec); 0.001::p_fc("RBM39(Y95)", "Torin", inc) :- p_occupancy("RBM39(Y95)", "Torin", dec).
0.001::p_fc("RBM39(Y95)", "Torin", dec); 0.3563704925::p_fc("RBM39(Y95)", "Torin", inc) :- p_occupancy("RBM39(Y95)", "Torin", inc).
0.7690239818::p_fc("RBM39(Y95)", "Trametinib", dec); 0.001::p_fc("RBM39(Y95)", "Trametinib", inc) :- p_occupancy("RBM39(Y95)", "Trametinib", dec).
0.001::p_fc("RBM39(Y95)", "Trametinib", dec); 0.7690239818::p_fc("RBM39(Y95)", "Trametinib", inc) :- p_occupancy("RBM39(Y95)", "Trametinib", inc).
0.3681290172::p_fc("RBM39(Y95)", "U73122", dec); 0.001::p_fc("RBM39(Y95)", "U73122", inc) :- p_occupancy("RBM39(Y95)", "U73122", dec).
0.001::p_fc("RBM39(Y95)", "U73122", dec); 0.3681290172::p_fc("RBM39(Y95)", "U73122", inc) :- p_occupancy("RBM39(Y95)", "U73122", inc).
0.8806306744::p_fc("RBM39(Y95)", "Ulixertinib", dec); 0.001::p_fc("RBM39(Y95)", "Ulixertinib", inc) :- p_occupancy("RBM39(Y95)", "Ulixertinib", dec).
0.001::p_fc("RBM39(Y95)", "Ulixertinib", dec); 0.8806306744::p_fc("RBM39(Y95)", "Ulixertinib", inc) :- p_occupancy("RBM39(Y95)", "Ulixertinib", inc).
0.2903413201::p_fc("RBM39(Y95)", "Vemurafenib", dec); 0.001::p_fc("RBM39(Y95)", "Vemurafenib", inc) :- p_occupancy("RBM39(Y95)", "Vemurafenib", dec).
0.001::p_fc("RBM39(Y95)", "Vemurafenib", dec); 0.2903413201::p_fc("RBM39(Y95)", "Vemurafenib", inc) :- p_occupancy("RBM39(Y95)", "Vemurafenib", inc).
0.761060614::p_fc("SRC(S17)", "AC220", dec); 0.001::p_fc("SRC(S17)", "AC220", inc) :- p_occupancy("SRC(S17)", "AC220", dec).
0.001::p_fc("SRC(S17)", "AC220", dec); 0.761060614::p_fc("SRC(S17)", "AC220", inc) :- p_occupancy("SRC(S17)", "AC220", inc).
0.9976475485::p_fc("SRC(S17)", "AT13148", dec); 0.001::p_fc("SRC(S17)", "AT13148", inc) :- p_occupancy("SRC(S17)", "AT13148", dec).
0.001::p_fc("SRC(S17)", "AT13148", dec); 0.9976475485::p_fc("SRC(S17)", "AT13148", inc) :- p_occupancy("SRC(S17)", "AT13148", inc).
0.9865085392::p_fc("SRC(S17)", "AZ20", dec); 0.001::p_fc("SRC(S17)", "AZ20", inc) :- p_occupancy("SRC(S17)", "AZ20", dec).
0.001::p_fc("SRC(S17)", "AZ20", dec); 0.9865085392::p_fc("SRC(S17)", "AZ20", inc) :- p_occupancy("SRC(S17)", "AZ20", inc).
0.6241392593::p_fc("SRC(S17)", "AZD1480", dec); 0.001::p_fc("SRC(S17)", "AZD1480", inc) :- p_occupancy("SRC(S17)", "AZD1480", dec).
0.001::p_fc("SRC(S17)", "AZD1480", dec); 0.6241392593::p_fc("SRC(S17)", "AZD1480", inc) :- p_occupancy("SRC(S17)", "AZD1480", inc).
0.8611894619::p_fc("SRC(S17)", "AZD3759", dec); 0.001::p_fc("SRC(S17)", "AZD3759", inc) :- p_occupancy("SRC(S17)", "AZD3759", dec).
0.001::p_fc("SRC(S17)", "AZD3759", dec); 0.8611894619::p_fc("SRC(S17)", "AZD3759", inc) :- p_occupancy("SRC(S17)", "AZD3759", inc).
0.2404175363::p_fc("SRC(S17)", "AZD5363", dec); 0.001::p_fc("SRC(S17)", "AZD5363", inc) :- p_occupancy("SRC(S17)", "AZD5363", dec).
0.001::p_fc("SRC(S17)", "AZD5363", dec); 0.2404175363::p_fc("SRC(S17)", "AZD5363", inc) :- p_occupancy("SRC(S17)", "AZD5363", inc).
0.2940151626::p_fc("SRC(S17)", "AZD5438", dec); 0.001::p_fc("SRC(S17)", "AZD5438", inc) :- p_occupancy("SRC(S17)", "AZD5438", dec).
0.001::p_fc("SRC(S17)", "AZD5438", dec); 0.2940151626::p_fc("SRC(S17)", "AZD5438", inc) :- p_occupancy("SRC(S17)", "AZD5438", inc).
0.8974580532::p_fc("SRC(S17)", "AZD6482", dec); 0.001::p_fc("SRC(S17)", "AZD6482", inc) :- p_occupancy("SRC(S17)", "AZD6482", dec).
0.001::p_fc("SRC(S17)", "AZD6482", dec); 0.8974580532::p_fc("SRC(S17)", "AZD6482", inc) :- p_occupancy("SRC(S17)", "AZD6482", inc).
0.6349582407::p_fc("SRC(S17)", "AZD6738", dec); 0.001::p_fc("SRC(S17)", "AZD6738", inc) :- p_occupancy("SRC(S17)", "AZD6738", dec).
0.001::p_fc("SRC(S17)", "AZD6738", dec); 0.6349582407::p_fc("SRC(S17)", "AZD6738", inc) :- p_occupancy("SRC(S17)", "AZD6738", inc).
0.997998487::p_fc("SRC(S17)", "AZD8055", dec); 0.001::p_fc("SRC(S17)", "AZD8055", inc) :- p_occupancy("SRC(S17)", "AZD8055", dec).
0.001::p_fc("SRC(S17)", "AZD8055", dec); 0.997998487::p_fc("SRC(S17)", "AZD8055", inc) :- p_occupancy("SRC(S17)", "AZD8055", inc).
0.0190302677::p_fc("SRC(S17)", "Amuvatinib", dec); 0.001::p_fc("SRC(S17)", "Amuvatinib", inc) :- p_occupancy("SRC(S17)", "Amuvatinib", dec).
0.001::p_fc("SRC(S17)", "Amuvatinib", dec); 0.0190302677::p_fc("SRC(S17)", "Amuvatinib", inc) :- p_occupancy("SRC(S17)", "Amuvatinib", inc).
0.6341846441::p_fc("SRC(S17)", "BX912", dec); 0.001::p_fc("SRC(S17)", "BX912", inc) :- p_occupancy("SRC(S17)", "BX912", dec).
0.001::p_fc("SRC(S17)", "BX912", dec); 0.6341846441::p_fc("SRC(S17)", "BX912", inc) :- p_occupancy("SRC(S17)", "BX912", inc).
0.7936869129::p_fc("SRC(S17)", "Bosutinib", dec); 0.001::p_fc("SRC(S17)", "Bosutinib", inc) :- p_occupancy("SRC(S17)", "Bosutinib", dec).
0.001::p_fc("SRC(S17)", "Bosutinib", dec); 0.7936869129::p_fc("SRC(S17)", "Bosutinib", inc) :- p_occupancy("SRC(S17)", "Bosutinib", inc).
0.2833950507::p_fc("SRC(S17)", "CAL101", dec); 0.001::p_fc("SRC(S17)", "CAL101", inc) :- p_occupancy("SRC(S17)", "CAL101", dec).
0.001::p_fc("SRC(S17)", "CAL101", dec); 0.2833950507::p_fc("SRC(S17)", "CAL101", inc) :- p_occupancy("SRC(S17)", "CAL101", inc).
0.8966172969::p_fc("SRC(S17)", "CHIR99021", dec); 0.001::p_fc("SRC(S17)", "CHIR99021", inc) :- p_occupancy("SRC(S17)", "CHIR99021", dec).
0.001::p_fc("SRC(S17)", "CHIR99021", dec); 0.8966172969::p_fc("SRC(S17)", "CHIR99021", inc) :- p_occupancy("SRC(S17)", "CHIR99021", inc).
0.1951320211::p_fc("SRC(S17)", "CX4945", dec); 0.001::p_fc("SRC(S17)", "CX4945", inc) :- p_occupancy("SRC(S17)", "CX4945", dec).
0.001::p_fc("SRC(S17)", "CX4945", dec); 0.1951320211::p_fc("SRC(S17)", "CX4945", inc) :- p_occupancy("SRC(S17)", "CX4945", inc).
0.9878507016::p_fc("SRC(S17)", "DNAPK", dec); 0.001::p_fc("SRC(S17)", "DNAPK", inc) :- p_occupancy("SRC(S17)", "DNAPK", dec).
0.001::p_fc("SRC(S17)", "DNAPK", dec); 0.9878507016::p_fc("SRC(S17)", "DNAPK", inc) :- p_occupancy("SRC(S17)", "DNAPK", inc).
0.4311055158::p_fc("SRC(S17)", "Dabrafenib", dec); 0.001::p_fc("SRC(S17)", "Dabrafenib", inc) :- p_occupancy("SRC(S17)", "Dabrafenib", dec).
0.001::p_fc("SRC(S17)", "Dabrafenib", dec); 0.4311055158::p_fc("SRC(S17)", "Dabrafenib", inc) :- p_occupancy("SRC(S17)", "Dabrafenib", inc).
0.9979677133::p_fc("SRC(S17)", "Dasatinib", dec); 0.001::p_fc("SRC(S17)", "Dasatinib", inc) :- p_occupancy("SRC(S17)", "Dasatinib", dec).
0.001::p_fc("SRC(S17)", "Dasatinib", dec); 0.9979677133::p_fc("SRC(S17)", "Dasatinib", inc) :- p_occupancy("SRC(S17)", "Dasatinib", inc).
0.8887074543::p_fc("SRC(S17)", "Edelfosine", dec); 0.001::p_fc("SRC(S17)", "Edelfosine", inc) :- p_occupancy("SRC(S17)", "Edelfosine", dec).
0.001::p_fc("SRC(S17)", "Edelfosine", dec); 0.8887074543::p_fc("SRC(S17)", "Edelfosine", inc) :- p_occupancy("SRC(S17)", "Edelfosine", inc).
0.5576153527::p_fc("SRC(S17)", "FRAX486", dec); 0.001::p_fc("SRC(S17)", "FRAX486", inc) :- p_occupancy("SRC(S17)", "FRAX486", dec).
0.001::p_fc("SRC(S17)", "FRAX486", dec); 0.5576153527::p_fc("SRC(S17)", "FRAX486", inc) :- p_occupancy("SRC(S17)", "FRAX486", inc).
0.6687890628::p_fc("SRC(S17)", "GDC0941", dec); 0.001::p_fc("SRC(S17)", "GDC0941", inc) :- p_occupancy("SRC(S17)", "GDC0941", dec).
0.001::p_fc("SRC(S17)", "GDC0941", dec); 0.6687890628::p_fc("SRC(S17)", "GDC0941", inc) :- p_occupancy("SRC(S17)", "GDC0941", inc).
0.9980013659::p_fc("SRC(S17)", "GDC0994", dec); 0.001::p_fc("SRC(S17)", "GDC0994", inc) :- p_occupancy("SRC(S17)", "GDC0994", dec).
0.001::p_fc("SRC(S17)", "GDC0994", dec); 0.9980013659::p_fc("SRC(S17)", "GDC0994", inc) :- p_occupancy("SRC(S17)", "GDC0994", inc).
0.9467127731::p_fc("SRC(S17)", "GF109203X", dec); 0.001::p_fc("SRC(S17)", "GF109203X", inc) :- p_occupancy("SRC(S17)", "GF109203X", dec).
0.001::p_fc("SRC(S17)", "GF109203X", dec); 0.9467127731::p_fc("SRC(S17)", "GF109203X", inc) :- p_occupancy("SRC(S17)", "GF109203X", inc).
0.9913858851::p_fc("SRC(S17)", "GO6983", dec); 0.001::p_fc("SRC(S17)", "GO6983", inc) :- p_occupancy("SRC(S17)", "GO6983", dec).
0.001::p_fc("SRC(S17)", "GO6983", dec); 0.9913858851::p_fc("SRC(S17)", "GO6983", inc) :- p_occupancy("SRC(S17)", "GO6983", inc).
0.9443459134::p_fc("SRC(S17)", "GSK2334470", dec); 0.001::p_fc("SRC(S17)", "GSK2334470", inc) :- p_occupancy("SRC(S17)", "GSK2334470", dec).
0.001::p_fc("SRC(S17)", "GSK2334470", dec); 0.9443459134::p_fc("SRC(S17)", "GSK2334470", inc) :- p_occupancy("SRC(S17)", "GSK2334470", inc).
0.8396612041::p_fc("SRC(S17)", "GSK690693", dec); 0.001::p_fc("SRC(S17)", "GSK690693", inc) :- p_occupancy("SRC(S17)", "GSK690693", dec).
0.001::p_fc("SRC(S17)", "GSK690693", dec); 0.8396612041::p_fc("SRC(S17)", "GSK690693", inc) :- p_occupancy("SRC(S17)", "GSK690693", inc).
0.1266560769::p_fc("SRC(S17)", "Go6976", dec); 0.001::p_fc("SRC(S17)", "Go6976", inc) :- p_occupancy("SRC(S17)", "Go6976", dec).
0.001::p_fc("SRC(S17)", "Go6976", dec); 0.1266560769::p_fc("SRC(S17)", "Go6976", inc) :- p_occupancy("SRC(S17)", "Go6976", inc).
0.509079349::p_fc("SRC(S17)", "H89", dec); 0.001::p_fc("SRC(S17)", "H89", inc) :- p_occupancy("SRC(S17)", "H89", dec).
0.001::p_fc("SRC(S17)", "H89", dec); 0.509079349::p_fc("SRC(S17)", "H89", inc) :- p_occupancy("SRC(S17)", "H89", inc).
0.3305220588::p_fc("SRC(S17)", "HS173", dec); 0.001::p_fc("SRC(S17)", "HS173", inc) :- p_occupancy("SRC(S17)", "HS173", dec).
0.001::p_fc("SRC(S17)", "HS173", dec); 0.3305220588::p_fc("SRC(S17)", "HS173", inc) :- p_occupancy("SRC(S17)", "HS173", inc).
0.7917123411::p_fc("SRC(S17)", "Ipatasertib", dec); 0.001::p_fc("SRC(S17)", "Ipatasertib", inc) :- p_occupancy("SRC(S17)", "Ipatasertib", dec).
0.001::p_fc("SRC(S17)", "Ipatasertib", dec); 0.7917123411::p_fc("SRC(S17)", "Ipatasertib", inc) :- p_occupancy("SRC(S17)", "Ipatasertib", inc).
0.958978579::p_fc("SRC(S17)", "JNJ", dec); 0.001::p_fc("SRC(S17)", "JNJ", inc) :- p_occupancy("SRC(S17)", "JNJ", dec).
0.001::p_fc("SRC(S17)", "JNJ", dec); 0.958978579::p_fc("SRC(S17)", "JNJ", inc) :- p_occupancy("SRC(S17)", "JNJ", inc).
0.544230498::p_fc("SRC(S17)", "JNK", dec); 0.001::p_fc("SRC(S17)", "JNK", inc) :- p_occupancy("SRC(S17)", "JNK", dec).
0.001::p_fc("SRC(S17)", "JNK", dec); 0.544230498::p_fc("SRC(S17)", "JNK", inc) :- p_occupancy("SRC(S17)", "JNK", inc).
0.8783125041::p_fc("SRC(S17)", "KD025", dec); 0.001::p_fc("SRC(S17)", "KD025", inc) :- p_occupancy("SRC(S17)", "KD025", dec).
0.001::p_fc("SRC(S17)", "KD025", dec); 0.8783125041::p_fc("SRC(S17)", "KD025", inc) :- p_occupancy("SRC(S17)", "KD025", inc).
0.1283251101::p_fc("SRC(S17)", "KN62", dec); 0.001::p_fc("SRC(S17)", "KN62", inc) :- p_occupancy("SRC(S17)", "KN62", dec).
0.001::p_fc("SRC(S17)", "KN62", dec); 0.1283251101::p_fc("SRC(S17)", "KN62", inc) :- p_occupancy("SRC(S17)", "KN62", inc).
0.0253729127::p_fc("SRC(S17)", "KN93", dec); 0.001::p_fc("SRC(S17)", "KN93", inc) :- p_occupancy("SRC(S17)", "KN93", dec).
0.001::p_fc("SRC(S17)", "KN93", dec); 0.0253729127::p_fc("SRC(S17)", "KN93", inc) :- p_occupancy("SRC(S17)", "KN93", inc).
0.9458347638::p_fc("SRC(S17)", "Ku0063794", dec); 0.001::p_fc("SRC(S17)", "Ku0063794", inc) :- p_occupancy("SRC(S17)", "Ku0063794", dec).
0.001::p_fc("SRC(S17)", "Ku0063794", dec); 0.9458347638::p_fc("SRC(S17)", "Ku0063794", inc) :- p_occupancy("SRC(S17)", "Ku0063794", inc).
0.5865601534::p_fc("SRC(S17)", "LY2090314", dec); 0.001::p_fc("SRC(S17)", "LY2090314", inc) :- p_occupancy("SRC(S17)", "LY2090314", dec).
0.001::p_fc("SRC(S17)", "LY2090314", dec); 0.5865601534::p_fc("SRC(S17)", "LY2090314", inc) :- p_occupancy("SRC(S17)", "LY2090314", inc).
0.8420812067::p_fc("SRC(S17)", "LY2584702", dec); 0.001::p_fc("SRC(S17)", "LY2584702", inc) :- p_occupancy("SRC(S17)", "LY2584702", dec).
0.001::p_fc("SRC(S17)", "LY2584702", dec); 0.8420812067::p_fc("SRC(S17)", "LY2584702", inc) :- p_occupancy("SRC(S17)", "LY2584702", inc).
0.8202941978::p_fc("SRC(S17)", "LY2835219", dec); 0.001::p_fc("SRC(S17)", "LY2835219", inc) :- p_occupancy("SRC(S17)", "LY2835219", dec).
0.001::p_fc("SRC(S17)", "LY2835219", dec); 0.8202941978::p_fc("SRC(S17)", "LY2835219", inc) :- p_occupancy("SRC(S17)", "LY2835219", inc).
0.7081493228::p_fc("SRC(S17)", "Linsitinib", dec); 0.001::p_fc("SRC(S17)", "Linsitinib", inc) :- p_occupancy("SRC(S17)", "Linsitinib", dec).
0.001::p_fc("SRC(S17)", "Linsitinib", dec); 0.7081493228::p_fc("SRC(S17)", "Linsitinib", inc) :- p_occupancy("SRC(S17)", "Linsitinib", inc).
0.8875340777::p_fc("SRC(S17)", "MK2206", dec); 0.001::p_fc("SRC(S17)", "MK2206", inc) :- p_occupancy("SRC(S17)", "MK2206", dec).
0.001::p_fc("SRC(S17)", "MK2206", dec); 0.8875340777::p_fc("SRC(S17)", "MK2206", inc) :- p_occupancy("SRC(S17)", "MK2206", inc).
0.9316045197::p_fc("SRC(S17)", "NU7441", dec); 0.001::p_fc("SRC(S17)", "NU7441", inc) :- p_occupancy("SRC(S17)", "NU7441", dec).
0.001::p_fc("SRC(S17)", "NU7441", dec); 0.9316045197::p_fc("SRC(S17)", "NU7441", inc) :- p_occupancy("SRC(S17)", "NU7441", inc).
0.7758909292::p_fc("SRC(S17)", "PD153035", dec); 0.001::p_fc("SRC(S17)", "PD153035", inc) :- p_occupancy("SRC(S17)", "PD153035", dec).
0.001::p_fc("SRC(S17)", "PD153035", dec); 0.7758909292::p_fc("SRC(S17)", "PD153035", inc) :- p_occupancy("SRC(S17)", "PD153035", inc).
0.3494405616::p_fc("SRC(S17)", "PF3758309", dec); 0.001::p_fc("SRC(S17)", "PF3758309", inc) :- p_occupancy("SRC(S17)", "PF3758309", dec).
0.001::p_fc("SRC(S17)", "PF3758309", dec); 0.3494405616::p_fc("SRC(S17)", "PF3758309", inc) :- p_occupancy("SRC(S17)", "PF3758309", inc).
0.9968761375::p_fc("SRC(S17)", "PF4708671", dec); 0.001::p_fc("SRC(S17)", "PF4708671", inc) :- p_occupancy("SRC(S17)", "PF4708671", dec).
0.001::p_fc("SRC(S17)", "PF4708671", dec); 0.9968761375::p_fc("SRC(S17)", "PF4708671", inc) :- p_occupancy("SRC(S17)", "PF4708671", inc).
0.8276835432::p_fc("SRC(S17)", "PH797804", dec); 0.001::p_fc("SRC(S17)", "PH797804", inc) :- p_occupancy("SRC(S17)", "PH797804", dec).
0.001::p_fc("SRC(S17)", "PH797804", dec); 0.8276835432::p_fc("SRC(S17)", "PH797804", inc) :- p_occupancy("SRC(S17)", "PH797804", inc).
0.7347188409::p_fc("SRC(S17)", "PIK294", dec); 0.001::p_fc("SRC(S17)", "PIK294", inc) :- p_occupancy("SRC(S17)", "PIK294", dec).
0.001::p_fc("SRC(S17)", "PIK294", dec); 0.7347188409::p_fc("SRC(S17)", "PIK294", inc) :- p_occupancy("SRC(S17)", "PIK294", inc).
0.053131714::p_fc("SRC(S17)", "Ribociclib", dec); 0.001::p_fc("SRC(S17)", "Ribociclib", inc) :- p_occupancy("SRC(S17)", "Ribociclib", dec).
0.001::p_fc("SRC(S17)", "Ribociclib", dec); 0.053131714::p_fc("SRC(S17)", "Ribociclib", inc) :- p_occupancy("SRC(S17)", "Ribociclib", inc).
0.7746951234::p_fc("SRC(S17)", "Ripasudil", dec); 0.001::p_fc("SRC(S17)", "Ripasudil", inc) :- p_occupancy("SRC(S17)", "Ripasudil", dec).
0.001::p_fc("SRC(S17)", "Ripasudil", dec); 0.7746951234::p_fc("SRC(S17)", "Ripasudil", inc) :- p_occupancy("SRC(S17)", "Ripasudil", inc).
0.7908395135::p_fc("SRC(S17)", "SP600125", dec); 0.001::p_fc("SRC(S17)", "SP600125", inc) :- p_occupancy("SRC(S17)", "SP600125", dec).
0.001::p_fc("SRC(S17)", "SP600125", dec); 0.7908395135::p_fc("SRC(S17)", "SP600125", inc) :- p_occupancy("SRC(S17)", "SP600125", inc).
0.9964434874::p_fc("SRC(S17)", "Selumetinib", dec); 0.001::p_fc("SRC(S17)", "Selumetinib", inc) :- p_occupancy("SRC(S17)", "Selumetinib", dec).
0.001::p_fc("SRC(S17)", "Selumetinib", dec); 0.9964434874::p_fc("SRC(S17)", "Selumetinib", inc) :- p_occupancy("SRC(S17)", "Selumetinib", inc).
0.7662381427::p_fc("SRC(S17)", "TAK715", dec); 0.001::p_fc("SRC(S17)", "TAK715", inc) :- p_occupancy("SRC(S17)", "TAK715", dec).
0.001::p_fc("SRC(S17)", "TAK715", dec); 0.7662381427::p_fc("SRC(S17)", "TAK715", inc) :- p_occupancy("SRC(S17)", "TAK715", inc).
0.8858549484::p_fc("SRC(S17)", "TBCA", dec); 0.001::p_fc("SRC(S17)", "TBCA", inc) :- p_occupancy("SRC(S17)", "TBCA", dec).
0.001::p_fc("SRC(S17)", "TBCA", dec); 0.8858549484::p_fc("SRC(S17)", "TBCA", inc) :- p_occupancy("SRC(S17)", "TBCA", inc).
0.9469923821::p_fc("SRC(S17)", "TGX221", dec); 0.001::p_fc("SRC(S17)", "TGX221", inc) :- p_occupancy("SRC(S17)", "TGX221", dec).
0.001::p_fc("SRC(S17)", "TGX221", dec); 0.9469923821::p_fc("SRC(S17)", "TGX221", inc) :- p_occupancy("SRC(S17)", "TGX221", inc).
0.1788290309::p_fc("SRC(S17)", "Tofacitinib", dec); 0.001::p_fc("SRC(S17)", "Tofacitinib", inc) :- p_occupancy("SRC(S17)", "Tofacitinib", dec).
0.001::p_fc("SRC(S17)", "Tofacitinib", dec); 0.1788290309::p_fc("SRC(S17)", "Tofacitinib", inc) :- p_occupancy("SRC(S17)", "Tofacitinib", inc).
0.8666228543::p_fc("SRC(S17)", "Torin", dec); 0.001::p_fc("SRC(S17)", "Torin", inc) :- p_occupancy("SRC(S17)", "Torin", dec).
0.001::p_fc("SRC(S17)", "Torin", dec); 0.8666228543::p_fc("SRC(S17)", "Torin", inc) :- p_occupancy("SRC(S17)", "Torin", inc).
0.926707674::p_fc("SRC(S17)", "Trametinib", dec); 0.001::p_fc("SRC(S17)", "Trametinib", inc) :- p_occupancy("SRC(S17)", "Trametinib", dec).
0.001::p_fc("SRC(S17)", "Trametinib", dec); 0.926707674::p_fc("SRC(S17)", "Trametinib", inc) :- p_occupancy("SRC(S17)", "Trametinib", inc).
0.9841303785::p_fc("SRC(S17)", "U73122", dec); 0.001::p_fc("SRC(S17)", "U73122", inc) :- p_occupancy("SRC(S17)", "U73122", dec).
0.001::p_fc("SRC(S17)", "U73122", dec); 0.9841303785::p_fc("SRC(S17)", "U73122", inc) :- p_occupancy("SRC(S17)", "U73122", inc).
0.9980059879::p_fc("SRC(S17)", "Ulixertinib", dec); 0.001::p_fc("SRC(S17)", "Ulixertinib", inc) :- p_occupancy("SRC(S17)", "Ulixertinib", dec).
0.001::p_fc("SRC(S17)", "Ulixertinib", dec); 0.9980059879::p_fc("SRC(S17)", "Ulixertinib", inc) :- p_occupancy("SRC(S17)", "Ulixertinib", inc).
0.9854475121::p_fc("SRC(S17)", "Vemurafenib", dec); 0.001::p_fc("SRC(S17)", "Vemurafenib", inc) :- p_occupancy("SRC(S17)", "Vemurafenib", dec).
0.001::p_fc("SRC(S17)", "Vemurafenib", dec); 0.9854475121::p_fc("SRC(S17)", "Vemurafenib", inc) :- p_occupancy("SRC(S17)", "Vemurafenib", inc).
0.8870595439::p_fc("SRC(S75)", "AC220", dec); 0.001::p_fc("SRC(S75)", "AC220", inc) :- p_occupancy("SRC(S75)", "AC220", dec).
0.001::p_fc("SRC(S75)", "AC220", dec); 0.8870595439::p_fc("SRC(S75)", "AC220", inc) :- p_occupancy("SRC(S75)", "AC220", inc).
0.9110487742::p_fc("SRC(S75)", "AT13148", dec); 0.001::p_fc("SRC(S75)", "AT13148", inc) :- p_occupancy("SRC(S75)", "AT13148", dec).
0.001::p_fc("SRC(S75)", "AT13148", dec); 0.9110487742::p_fc("SRC(S75)", "AT13148", inc) :- p_occupancy("SRC(S75)", "AT13148", inc).
0.4159181193::p_fc("SRC(S75)", "AZ20", dec); 0.001::p_fc("SRC(S75)", "AZ20", inc) :- p_occupancy("SRC(S75)", "AZ20", dec).
0.001::p_fc("SRC(S75)", "AZ20", dec); 0.4159181193::p_fc("SRC(S75)", "AZ20", inc) :- p_occupancy("SRC(S75)", "AZ20", inc).
0.2088909645::p_fc("SRC(S75)", "AZD1480", dec); 0.001::p_fc("SRC(S75)", "AZD1480", inc) :- p_occupancy("SRC(S75)", "AZD1480", dec).
0.001::p_fc("SRC(S75)", "AZD1480", dec); 0.2088909645::p_fc("SRC(S75)", "AZD1480", inc) :- p_occupancy("SRC(S75)", "AZD1480", inc).
0.8009021082::p_fc("SRC(S75)", "AZD3759", dec); 0.001::p_fc("SRC(S75)", "AZD3759", inc) :- p_occupancy("SRC(S75)", "AZD3759", dec).
0.001::p_fc("SRC(S75)", "AZD3759", dec); 0.8009021082::p_fc("SRC(S75)", "AZD3759", inc) :- p_occupancy("SRC(S75)", "AZD3759", inc).
0.5956275107::p_fc("SRC(S75)", "AZD5363", dec); 0.001::p_fc("SRC(S75)", "AZD5363", inc) :- p_occupancy("SRC(S75)", "AZD5363", dec).
0.001::p_fc("SRC(S75)", "AZD5363", dec); 0.5956275107::p_fc("SRC(S75)", "AZD5363", inc) :- p_occupancy("SRC(S75)", "AZD5363", inc).
0.4938940512::p_fc("SRC(S75)", "AZD5438", dec); 0.001::p_fc("SRC(S75)", "AZD5438", inc) :- p_occupancy("SRC(S75)", "AZD5438", dec).
0.001::p_fc("SRC(S75)", "AZD5438", dec); 0.4938940512::p_fc("SRC(S75)", "AZD5438", inc) :- p_occupancy("SRC(S75)", "AZD5438", inc).
0.8042000395::p_fc("SRC(S75)", "AZD6482", dec); 0.001::p_fc("SRC(S75)", "AZD6482", inc) :- p_occupancy("SRC(S75)", "AZD6482", dec).
0.001::p_fc("SRC(S75)", "AZD6482", dec); 0.8042000395::p_fc("SRC(S75)", "AZD6482", inc) :- p_occupancy("SRC(S75)", "AZD6482", inc).
0.4069481744::p_fc("SRC(S75)", "AZD6738", dec); 0.001::p_fc("SRC(S75)", "AZD6738", inc) :- p_occupancy("SRC(S75)", "AZD6738", dec).
0.001::p_fc("SRC(S75)", "AZD6738", dec); 0.4069481744::p_fc("SRC(S75)", "AZD6738", inc) :- p_occupancy("SRC(S75)", "AZD6738", inc).
0.6016987036::p_fc("SRC(S75)", "AZD8055", dec); 0.001::p_fc("SRC(S75)", "AZD8055", inc) :- p_occupancy("SRC(S75)", "AZD8055", dec).
0.001::p_fc("SRC(S75)", "AZD8055", dec); 0.6016987036::p_fc("SRC(S75)", "AZD8055", inc) :- p_occupancy("SRC(S75)", "AZD8055", inc).
0.3166895024::p_fc("SRC(S75)", "Amuvatinib", dec); 0.001::p_fc("SRC(S75)", "Amuvatinib", inc) :- p_occupancy("SRC(S75)", "Amuvatinib", dec).
0.001::p_fc("SRC(S75)", "Amuvatinib", dec); 0.3166895024::p_fc("SRC(S75)", "Amuvatinib", inc) :- p_occupancy("SRC(S75)", "Amuvatinib", inc).
0.0733277203::p_fc("SRC(S75)", "BX912", dec); 0.001::p_fc("SRC(S75)", "BX912", inc) :- p_occupancy("SRC(S75)", "BX912", dec).
0.001::p_fc("SRC(S75)", "BX912", dec); 0.0733277203::p_fc("SRC(S75)", "BX912", inc) :- p_occupancy("SRC(S75)", "BX912", inc).
0.341737095::p_fc("SRC(S75)", "Bosutinib", dec); 0.001::p_fc("SRC(S75)", "Bosutinib", inc) :- p_occupancy("SRC(S75)", "Bosutinib", dec).
0.001::p_fc("SRC(S75)", "Bosutinib", dec); 0.341737095::p_fc("SRC(S75)", "Bosutinib", inc) :- p_occupancy("SRC(S75)", "Bosutinib", inc).
0.6757215101::p_fc("SRC(S75)", "CAL101", dec); 0.001::p_fc("SRC(S75)", "CAL101", inc) :- p_occupancy("SRC(S75)", "CAL101", dec).
0.001::p_fc("SRC(S75)", "CAL101", dec); 0.6757215101::p_fc("SRC(S75)", "CAL101", inc) :- p_occupancy("SRC(S75)", "CAL101", inc).
0.784039463::p_fc("SRC(S75)", "CHIR99021", dec); 0.001::p_fc("SRC(S75)", "CHIR99021", inc) :- p_occupancy("SRC(S75)", "CHIR99021", dec).
0.001::p_fc("SRC(S75)", "CHIR99021", dec); 0.784039463::p_fc("SRC(S75)", "CHIR99021", inc) :- p_occupancy("SRC(S75)", "CHIR99021", inc).
0.4672195804::p_fc("SRC(S75)", "CX4945", dec); 0.001::p_fc("SRC(S75)", "CX4945", inc) :- p_occupancy("SRC(S75)", "CX4945", dec).
0.001::p_fc("SRC(S75)", "CX4945", dec); 0.4672195804::p_fc("SRC(S75)", "CX4945", inc) :- p_occupancy("SRC(S75)", "CX4945", inc).
0.3357610755::p_fc("SRC(S75)", "DNAPK", dec); 0.001::p_fc("SRC(S75)", "DNAPK", inc) :- p_occupancy("SRC(S75)", "DNAPK", dec).
0.001::p_fc("SRC(S75)", "DNAPK", dec); 0.3357610755::p_fc("SRC(S75)", "DNAPK", inc) :- p_occupancy("SRC(S75)", "DNAPK", inc).
0.4332905302::p_fc("SRC(S75)", "Dabrafenib", dec); 0.001::p_fc("SRC(S75)", "Dabrafenib", inc) :- p_occupancy("SRC(S75)", "Dabrafenib", dec).
0.001::p_fc("SRC(S75)", "Dabrafenib", dec); 0.4332905302::p_fc("SRC(S75)", "Dabrafenib", inc) :- p_occupancy("SRC(S75)", "Dabrafenib", inc).
0.6972744814::p_fc("SRC(S75)", "Dasatinib", dec); 0.001::p_fc("SRC(S75)", "Dasatinib", inc) :- p_occupancy("SRC(S75)", "Dasatinib", dec).
0.001::p_fc("SRC(S75)", "Dasatinib", dec); 0.6972744814::p_fc("SRC(S75)", "Dasatinib", inc) :- p_occupancy("SRC(S75)", "Dasatinib", inc).
0.1707977388::p_fc("SRC(S75)", "Edelfosine", dec); 0.001::p_fc("SRC(S75)", "Edelfosine", inc) :- p_occupancy("SRC(S75)", "Edelfosine", dec).
0.001::p_fc("SRC(S75)", "Edelfosine", dec); 0.1707977388::p_fc("SRC(S75)", "Edelfosine", inc) :- p_occupancy("SRC(S75)", "Edelfosine", inc).
0.6354207639::p_fc("SRC(S75)", "FRAX486", dec); 0.001::p_fc("SRC(S75)", "FRAX486", inc) :- p_occupancy("SRC(S75)", "FRAX486", dec).
0.001::p_fc("SRC(S75)", "FRAX486", dec); 0.6354207639::p_fc("SRC(S75)", "FRAX486", inc) :- p_occupancy("SRC(S75)", "FRAX486", inc).
0.1205792461::p_fc("SRC(S75)", "GDC0941", dec); 0.001::p_fc("SRC(S75)", "GDC0941", inc) :- p_occupancy("SRC(S75)", "GDC0941", dec).
0.001::p_fc("SRC(S75)", "GDC0941", dec); 0.1205792461::p_fc("SRC(S75)", "GDC0941", inc) :- p_occupancy("SRC(S75)", "GDC0941", inc).
0.9252526847::p_fc("SRC(S75)", "GDC0994", dec); 0.001::p_fc("SRC(S75)", "GDC0994", inc) :- p_occupancy("SRC(S75)", "GDC0994", dec).
0.001::p_fc("SRC(S75)", "GDC0994", dec); 0.9252526847::p_fc("SRC(S75)", "GDC0994", inc) :- p_occupancy("SRC(S75)", "GDC0994", inc).
0.6679153819::p_fc("SRC(S75)", "GF109203X", dec); 0.001::p_fc("SRC(S75)", "GF109203X", inc) :- p_occupancy("SRC(S75)", "GF109203X", dec).
0.001::p_fc("SRC(S75)", "GF109203X", dec); 0.6679153819::p_fc("SRC(S75)", "GF109203X", inc) :- p_occupancy("SRC(S75)", "GF109203X", inc).
0.8555180429::p_fc("SRC(S75)", "GO6983", dec); 0.001::p_fc("SRC(S75)", "GO6983", inc) :- p_occupancy("SRC(S75)", "GO6983", dec).
0.001::p_fc("SRC(S75)", "GO6983", dec); 0.8555180429::p_fc("SRC(S75)", "GO6983", inc) :- p_occupancy("SRC(S75)", "GO6983", inc).
0.8793691315::p_fc("SRC(S75)", "GSK2334470", dec); 0.001::p_fc("SRC(S75)", "GSK2334470", inc) :- p_occupancy("SRC(S75)", "GSK2334470", dec).
0.001::p_fc("SRC(S75)", "GSK2334470", dec); 0.8793691315::p_fc("SRC(S75)", "GSK2334470", inc) :- p_occupancy("SRC(S75)", "GSK2334470", inc).
0.6580319443::p_fc("SRC(S75)", "GSK690693", dec); 0.001::p_fc("SRC(S75)", "GSK690693", inc) :- p_occupancy("SRC(S75)", "GSK690693", dec).
0.001::p_fc("SRC(S75)", "GSK690693", dec); 0.6580319443::p_fc("SRC(S75)", "GSK690693", inc) :- p_occupancy("SRC(S75)", "GSK690693", inc).
0.1217867236::p_fc("SRC(S75)", "Go6976", dec); 0.001::p_fc("SRC(S75)", "Go6976", inc) :- p_occupancy("SRC(S75)", "Go6976", dec).
0.001::p_fc("SRC(S75)", "Go6976", dec); 0.1217867236::p_fc("SRC(S75)", "Go6976", inc) :- p_occupancy("SRC(S75)", "Go6976", inc).
0.3296181639::p_fc("SRC(S75)", "H89", dec); 0.001::p_fc("SRC(S75)", "H89", inc) :- p_occupancy("SRC(S75)", "H89", dec).
0.001::p_fc("SRC(S75)", "H89", dec); 0.3296181639::p_fc("SRC(S75)", "H89", inc) :- p_occupancy("SRC(S75)", "H89", inc).
0.211072234::p_fc("SRC(S75)", "HS173", dec); 0.001::p_fc("SRC(S75)", "HS173", inc) :- p_occupancy("SRC(S75)", "HS173", dec).
0.001::p_fc("SRC(S75)", "HS173", dec); 0.211072234::p_fc("SRC(S75)", "HS173", inc) :- p_occupancy("SRC(S75)", "HS173", inc).
0.0894024645::p_fc("SRC(S75)", "Ipatasertib", dec); 0.001::p_fc("SRC(S75)", "Ipatasertib", inc) :- p_occupancy("SRC(S75)", "Ipatasertib", dec).
0.001::p_fc("SRC(S75)", "Ipatasertib", dec); 0.0894024645::p_fc("SRC(S75)", "Ipatasertib", inc) :- p_occupancy("SRC(S75)", "Ipatasertib", inc).
0.9533691394::p_fc("SRC(S75)", "JNJ", dec); 0.001::p_fc("SRC(S75)", "JNJ", inc) :- p_occupancy("SRC(S75)", "JNJ", dec).
0.001::p_fc("SRC(S75)", "JNJ", dec); 0.9533691394::p_fc("SRC(S75)", "JNJ", inc) :- p_occupancy("SRC(S75)", "JNJ", inc).
0.2999630001::p_fc("SRC(S75)", "JNK", dec); 0.001::p_fc("SRC(S75)", "JNK", inc) :- p_occupancy("SRC(S75)", "JNK", dec).
0.001::p_fc("SRC(S75)", "JNK", dec); 0.2999630001::p_fc("SRC(S75)", "JNK", inc) :- p_occupancy("SRC(S75)", "JNK", inc).
0.4501403062::p_fc("SRC(S75)", "KD025", dec); 0.001::p_fc("SRC(S75)", "KD025", inc) :- p_occupancy("SRC(S75)", "KD025", dec).
0.001::p_fc("SRC(S75)", "KD025", dec); 0.4501403062::p_fc("SRC(S75)", "KD025", inc) :- p_occupancy("SRC(S75)", "KD025", inc).
0.5258568915::p_fc("SRC(S75)", "KN62", dec); 0.001::p_fc("SRC(S75)", "KN62", inc) :- p_occupancy("SRC(S75)", "KN62", dec).
0.001::p_fc("SRC(S75)", "KN62", dec); 0.5258568915::p_fc("SRC(S75)", "KN62", inc) :- p_occupancy("SRC(S75)", "KN62", inc).
0.8555180429::p_fc("SRC(S75)", "KN93", dec); 0.001::p_fc("SRC(S75)", "KN93", inc) :- p_occupancy("SRC(S75)", "KN93", dec).
0.001::p_fc("SRC(S75)", "KN93", dec); 0.8555180429::p_fc("SRC(S75)", "KN93", inc) :- p_occupancy("SRC(S75)", "KN93", inc).
0.4531757281::p_fc("SRC(S75)", "Ku0063794", dec); 0.001::p_fc("SRC(S75)", "Ku0063794", inc) :- p_occupancy("SRC(S75)", "Ku0063794", dec).
0.001::p_fc("SRC(S75)", "Ku0063794", dec); 0.4531757281::p_fc("SRC(S75)", "Ku0063794", inc) :- p_occupancy("SRC(S75)", "Ku0063794", inc).
0.4142261909::p_fc("SRC(S75)", "LY2090314", dec); 0.001::p_fc("SRC(S75)", "LY2090314", inc) :- p_occupancy("SRC(S75)", "LY2090314", dec).
0.001::p_fc("SRC(S75)", "LY2090314", dec); 0.4142261909::p_fc("SRC(S75)", "LY2090314", inc) :- p_occupancy("SRC(S75)", "LY2090314", inc).
0.5639554845::p_fc("SRC(S75)", "LY2584702", dec); 0.001::p_fc("SRC(S75)", "LY2584702", inc) :- p_occupancy("SRC(S75)", "LY2584702", dec).
0.001::p_fc("SRC(S75)", "LY2584702", dec); 0.5639554845::p_fc("SRC(S75)", "LY2584702", inc) :- p_occupancy("SRC(S75)", "LY2584702", inc).
0.4436181538::p_fc("SRC(S75)", "LY2835219", dec); 0.001::p_fc("SRC(S75)", "LY2835219", inc) :- p_occupancy("SRC(S75)", "LY2835219", dec).
0.001::p_fc("SRC(S75)", "LY2835219", dec); 0.4436181538::p_fc("SRC(S75)", "LY2835219", inc) :- p_occupancy("SRC(S75)", "LY2835219", inc).
0.8820619676::p_fc("SRC(S75)", "Linsitinib", dec); 0.001::p_fc("SRC(S75)", "Linsitinib", inc) :- p_occupancy("SRC(S75)", "Linsitinib", dec).
0.001::p_fc("SRC(S75)", "Linsitinib", dec); 0.8820619676::p_fc("SRC(S75)", "Linsitinib", inc) :- p_occupancy("SRC(S75)", "Linsitinib", inc).
0.737215362::p_fc("SRC(S75)", "MK2206", dec); 0.001::p_fc("SRC(S75)", "MK2206", inc) :- p_occupancy("SRC(S75)", "MK2206", dec).
0.001::p_fc("SRC(S75)", "MK2206", dec); 0.737215362::p_fc("SRC(S75)", "MK2206", inc) :- p_occupancy("SRC(S75)", "MK2206", inc).
0.3131867245::p_fc("SRC(S75)", "NU7441", dec); 0.001::p_fc("SRC(S75)", "NU7441", inc) :- p_occupancy("SRC(S75)", "NU7441", dec).
0.001::p_fc("SRC(S75)", "NU7441", dec); 0.3131867245::p_fc("SRC(S75)", "NU7441", inc) :- p_occupancy("SRC(S75)", "NU7441", inc).
0.7255124816::p_fc("SRC(S75)", "PD153035", dec); 0.001::p_fc("SRC(S75)", "PD153035", inc) :- p_occupancy("SRC(S75)", "PD153035", dec).
0.001::p_fc("SRC(S75)", "PD153035", dec); 0.7255124816::p_fc("SRC(S75)", "PD153035", inc) :- p_occupancy("SRC(S75)", "PD153035", inc).
0.2226757336::p_fc("SRC(S75)", "PF3758309", dec); 0.001::p_fc("SRC(S75)", "PF3758309", inc) :- p_occupancy("SRC(S75)", "PF3758309", dec).
0.001::p_fc("SRC(S75)", "PF3758309", dec); 0.2226757336::p_fc("SRC(S75)", "PF3758309", inc) :- p_occupancy("SRC(S75)", "PF3758309", inc).
0.5284157443::p_fc("SRC(S75)", "PF4708671", dec); 0.001::p_fc("SRC(S75)", "PF4708671", inc) :- p_occupancy("SRC(S75)", "PF4708671", dec).
0.001::p_fc("SRC(S75)", "PF4708671", dec); 0.5284157443::p_fc("SRC(S75)", "PF4708671", inc) :- p_occupancy("SRC(S75)", "PF4708671", inc).
0.3016324776::p_fc("SRC(S75)", "PH797804", dec); 0.001::p_fc("SRC(S75)", "PH797804", inc) :- p_occupancy("SRC(S75)", "PH797804", dec).
0.001::p_fc("SRC(S75)", "PH797804", dec); 0.3016324776::p_fc("SRC(S75)", "PH797804", inc) :- p_occupancy("SRC(S75)", "PH797804", inc).
0.6815713124::p_fc("SRC(S75)", "PIK294", dec); 0.001::p_fc("SRC(S75)", "PIK294", inc) :- p_occupancy("SRC(S75)", "PIK294", dec).
0.001::p_fc("SRC(S75)", "PIK294", dec); 0.6815713124::p_fc("SRC(S75)", "PIK294", inc) :- p_occupancy("SRC(S75)", "PIK294", inc).
0.5670374198::p_fc("SRC(S75)", "Ribociclib", dec); 0.001::p_fc("SRC(S75)", "Ribociclib", inc) :- p_occupancy("SRC(S75)", "Ribociclib", dec).
0.001::p_fc("SRC(S75)", "Ribociclib", dec); 0.5670374198::p_fc("SRC(S75)", "Ribociclib", inc) :- p_occupancy("SRC(S75)", "Ribociclib", inc).
0.8059973326::p_fc("SRC(S75)", "Ripasudil", dec); 0.001::p_fc("SRC(S75)", "Ripasudil", inc) :- p_occupancy("SRC(S75)", "Ripasudil", dec).
0.001::p_fc("SRC(S75)", "Ripasudil", dec); 0.8059973326::p_fc("SRC(S75)", "Ripasudil", inc) :- p_occupancy("SRC(S75)", "Ripasudil", inc).
0.5778756999::p_fc("SRC(S75)", "SP600125", dec); 0.001::p_fc("SRC(S75)", "SP600125", inc) :- p_occupancy("SRC(S75)", "SP600125", dec).
0.001::p_fc("SRC(S75)", "SP600125", dec); 0.5778756999::p_fc("SRC(S75)", "SP600125", inc) :- p_occupancy("SRC(S75)", "SP600125", inc).
0.4118362988::p_fc("SRC(S75)", "Selumetinib", dec); 0.001::p_fc("SRC(S75)", "Selumetinib", inc) :- p_occupancy("SRC(S75)", "Selumetinib", dec).
0.001::p_fc("SRC(S75)", "Selumetinib", dec); 0.4118362988::p_fc("SRC(S75)", "Selumetinib", inc) :- p_occupancy("SRC(S75)", "Selumetinib", inc).
0.9116918341::p_fc("SRC(S75)", "TAK715", dec); 0.001::p_fc("SRC(S75)", "TAK715", inc) :- p_occupancy("SRC(S75)", "TAK715", dec).
0.001::p_fc("SRC(S75)", "TAK715", dec); 0.9116918341::p_fc("SRC(S75)", "TAK715", inc) :- p_occupancy("SRC(S75)", "TAK715", inc).
0.8555180429::p_fc("SRC(S75)", "TBCA", dec); 0.001::p_fc("SRC(S75)", "TBCA", inc) :- p_occupancy("SRC(S75)", "TBCA", dec).
0.001::p_fc("SRC(S75)", "TBCA", dec); 0.8555180429::p_fc("SRC(S75)", "TBCA", inc) :- p_occupancy("SRC(S75)", "TBCA", inc).
0.3265219626::p_fc("SRC(S75)", "TGX221", dec); 0.001::p_fc("SRC(S75)", "TGX221", inc) :- p_occupancy("SRC(S75)", "TGX221", dec).
0.001::p_fc("SRC(S75)", "TGX221", dec); 0.3265219626::p_fc("SRC(S75)", "TGX221", inc) :- p_occupancy("SRC(S75)", "TGX221", inc).
0.8560007711::p_fc("SRC(S75)", "Tofacitinib", dec); 0.001::p_fc("SRC(S75)", "Tofacitinib", inc) :- p_occupancy("SRC(S75)", "Tofacitinib", dec).
0.001::p_fc("SRC(S75)", "Tofacitinib", dec); 0.8560007711::p_fc("SRC(S75)", "Tofacitinib", inc) :- p_occupancy("SRC(S75)", "Tofacitinib", inc).
0.4779838831::p_fc("SRC(S75)", "Torin", dec); 0.001::p_fc("SRC(S75)", "Torin", inc) :- p_occupancy("SRC(S75)", "Torin", dec).
0.001::p_fc("SRC(S75)", "Torin", dec); 0.4779838831::p_fc("SRC(S75)", "Torin", inc) :- p_occupancy("SRC(S75)", "Torin", inc).
0.6480720743::p_fc("SRC(S75)", "Trametinib", dec); 0.001::p_fc("SRC(S75)", "Trametinib", inc) :- p_occupancy("SRC(S75)", "Trametinib", dec).
0.001::p_fc("SRC(S75)", "Trametinib", dec); 0.6480720743::p_fc("SRC(S75)", "Trametinib", inc) :- p_occupancy("SRC(S75)", "Trametinib", inc).
0.7535248847::p_fc("SRC(S75)", "U73122", dec); 0.001::p_fc("SRC(S75)", "U73122", inc) :- p_occupancy("SRC(S75)", "U73122", dec).
0.001::p_fc("SRC(S75)", "U73122", dec); 0.7535248847::p_fc("SRC(S75)", "U73122", inc) :- p_occupancy("SRC(S75)", "U73122", inc).
0.5646284087::p_fc("SRC(S75)", "Ulixertinib", dec); 0.001::p_fc("SRC(S75)", "Ulixertinib", inc) :- p_occupancy("SRC(S75)", "Ulixertinib", dec).
0.001::p_fc("SRC(S75)", "Ulixertinib", dec); 0.5646284087::p_fc("SRC(S75)", "Ulixertinib", inc) :- p_occupancy("SRC(S75)", "Ulixertinib", inc).
0.515024544::p_fc("SRC(S75)", "Vemurafenib", dec); 0.001::p_fc("SRC(S75)", "Vemurafenib", inc) :- p_occupancy("SRC(S75)", "Vemurafenib", dec).
0.001::p_fc("SRC(S75)", "Vemurafenib", dec); 0.515024544::p_fc("SRC(S75)", "Vemurafenib", inc) :- p_occupancy("SRC(S75)", "Vemurafenib", inc).
0.3411940544::p_fc("ABI1(Y213)", "AC220", dec); 0.3411940544::p_fc("ABI1(Y213)", "AC220", inc) :- phosphosite("ABI1(Y213)").
0.4769078997::p_fc("ABI1(Y213)", "AT13148", dec); 0.4769078997::p_fc("ABI1(Y213)", "AT13148", inc) :- phosphosite("ABI1(Y213)").
0.4936175879::p_fc("ABI1(Y213)", "AZ20", dec); 0.4936175879::p_fc("ABI1(Y213)", "AZ20", inc) :- phosphosite("ABI1(Y213)").
0.2613417045::p_fc("ABI1(Y213)", "AZD1480", dec); 0.2613417045::p_fc("ABI1(Y213)", "AZD1480", inc) :- phosphosite("ABI1(Y213)").
0.3538398098::p_fc("ABI1(Y213)", "AZD3759", dec); 0.3538398098::p_fc("ABI1(Y213)", "AZD3759", inc) :- phosphosite("ABI1(Y213)").
0.4606889401::p_fc("ABI1(Y213)", "AZD5363", dec); 0.4606889401::p_fc("ABI1(Y213)", "AZD5363", inc) :- phosphosite("ABI1(Y213)").
0.1030974286::p_fc("ABI1(Y213)", "AZD5438", dec); 0.1030974286::p_fc("ABI1(Y213)", "AZD5438", inc) :- phosphosite("ABI1(Y213)").
0.1563464859::p_fc("ABI1(Y213)", "AZD6482", dec); 0.1563464859::p_fc("ABI1(Y213)", "AZD6482", inc) :- phosphosite("ABI1(Y213)").
0.313182423::p_fc("ABI1(Y213)", "AZD6738", dec); 0.313182423::p_fc("ABI1(Y213)", "AZD6738", inc) :- phosphosite("ABI1(Y213)").
0.2911154162::p_fc("ABI1(Y213)", "AZD8055", dec); 0.2911154162::p_fc("ABI1(Y213)", "AZD8055", inc) :- phosphosite("ABI1(Y213)").
0.3068980767::p_fc("ABI1(Y213)", "Amuvatinib", dec); 0.3068980767::p_fc("ABI1(Y213)", "Amuvatinib", inc) :- phosphosite("ABI1(Y213)").
0.3085945801::p_fc("ABI1(Y213)", "BX912", dec); 0.3085945801::p_fc("ABI1(Y213)", "BX912", inc) :- phosphosite("ABI1(Y213)").
0.0009991975::p_fc("ABI1(Y213)", "Bosutinib", dec); 0.0009991975::p_fc("ABI1(Y213)", "Bosutinib", inc) :- phosphosite("ABI1(Y213)").
0.1735582393::p_fc("ABI1(Y213)", "CAL101", dec); 0.1735582393::p_fc("ABI1(Y213)", "CAL101", inc) :- phosphosite("ABI1(Y213)").
0.490303932::p_fc("ABI1(Y213)", "CHIR99021", dec); 0.490303932::p_fc("ABI1(Y213)", "CHIR99021", inc) :- phosphosite("ABI1(Y213)").
0.285762653::p_fc("ABI1(Y213)", "CX4945", dec); 0.285762653::p_fc("ABI1(Y213)", "CX4945", inc) :- phosphosite("ABI1(Y213)").
0.3446289283::p_fc("ABI1(Y213)", "DNAPK", dec); 0.3446289283::p_fc("ABI1(Y213)", "DNAPK", inc) :- phosphosite("ABI1(Y213)").
0.1364644553::p_fc("ABI1(Y213)", "Dabrafenib", dec); 0.1364644553::p_fc("ABI1(Y213)", "Dabrafenib", inc) :- phosphosite("ABI1(Y213)").
0.0009971135::p_fc("ABI1(Y213)", "Dasatinib", dec); 0.0009971135::p_fc("ABI1(Y213)", "Dasatinib", inc) :- phosphosite("ABI1(Y213)").
0.4304907147::p_fc("ABI1(Y213)", "Edelfosine", dec); 0.4304907147::p_fc("ABI1(Y213)", "Edelfosine", inc) :- phosphosite("ABI1(Y213)").
0.1881967309::p_fc("ABI1(Y213)", "FRAX486", dec); 0.1881967309::p_fc("ABI1(Y213)", "FRAX486", inc) :- phosphosite("ABI1(Y213)").
0.0844322073::p_fc("ABI1(Y213)", "GDC0941", dec); 0.0844322073::p_fc("ABI1(Y213)", "GDC0941", inc) :- phosphosite("ABI1(Y213)").
0.3281593906::p_fc("ABI1(Y213)", "GDC0994", dec); 0.3281593906::p_fc("ABI1(Y213)", "GDC0994", inc) :- phosphosite("ABI1(Y213)").
0.4339863939::p_fc("ABI1(Y213)", "GF109203X", dec); 0.4339863939::p_fc("ABI1(Y213)", "GF109203X", inc) :- phosphosite("ABI1(Y213)").
0.3010520045::p_fc("ABI1(Y213)", "GO6983", dec); 0.3010520045::p_fc("ABI1(Y213)", "GO6983", inc) :- phosphosite("ABI1(Y213)").
0.0770215128::p_fc("ABI1(Y213)", "GSK2334470", dec); 0.0770215128::p_fc("ABI1(Y213)", "GSK2334470", inc) :- phosphosite("ABI1(Y213)").
0.2049414826::p_fc("ABI1(Y213)", "GSK690693", dec); 0.2049414826::p_fc("ABI1(Y213)", "GSK690693", inc) :- phosphosite("ABI1(Y213)").
0.2551864589::p_fc("ABI1(Y213)", "Go6976", dec); 0.2551864589::p_fc("ABI1(Y213)", "Go6976", inc) :- phosphosite("ABI1(Y213)").
0.2398311621::p_fc("ABI1(Y213)", "H89", dec); 0.2398311621::p_fc("ABI1(Y213)", "H89", inc) :- phosphosite("ABI1(Y213)").
0.0805734935::p_fc("ABI1(Y213)", "HS173", dec); 0.0805734935::p_fc("ABI1(Y213)", "HS173", inc) :- phosphosite("ABI1(Y213)").
0.3847144568::p_fc("ABI1(Y213)", "Ipatasertib", dec); 0.3847144568::p_fc("ABI1(Y213)", "Ipatasertib", inc) :- phosphosite("ABI1(Y213)").
0.486921019::p_fc("ABI1(Y213)", "JNJ", dec); 0.486921019::p_fc("ABI1(Y213)", "JNJ", inc) :- phosphosite("ABI1(Y213)").
0.4907300968::p_fc("ABI1(Y213)", "JNK", dec); 0.4907300968::p_fc("ABI1(Y213)", "JNK", inc) :- phosphosite("ABI1(Y213)").
0.2372826926::p_fc("ABI1(Y213)", "KD025", dec); 0.2372826926::p_fc("ABI1(Y213)", "KD025", inc) :- phosphosite("ABI1(Y213)").
0.2571757009::p_fc("ABI1(Y213)", "KN62", dec); 0.2571757009::p_fc("ABI1(Y213)", "KN62", inc) :- phosphosite("ABI1(Y213)").
0.177738954::p_fc("ABI1(Y213)", "KN93", dec); 0.177738954::p_fc("ABI1(Y213)", "KN93", inc) :- phosphosite("ABI1(Y213)").
0.4178836019::p_fc("ABI1(Y213)", "Ku0063794", dec); 0.4178836019::p_fc("ABI1(Y213)", "Ku0063794", inc) :- phosphosite("ABI1(Y213)").
0.4390518128::p_fc("ABI1(Y213)", "LY2090314", dec); 0.4390518128::p_fc("ABI1(Y213)", "LY2090314", inc) :- phosphosite("ABI1(Y213)").
0.1506907742::p_fc("ABI1(Y213)", "LY2584702", dec); 0.1506907742::p_fc("ABI1(Y213)", "LY2584702", inc) :- phosphosite("ABI1(Y213)").
0.0502855904::p_fc("ABI1(Y213)", "LY2835219", dec); 0.0502855904::p_fc("ABI1(Y213)", "LY2835219", inc) :- phosphosite("ABI1(Y213)").
0.259678295::p_fc("ABI1(Y213)", "Linsitinib", dec); 0.259678295::p_fc("ABI1(Y213)", "Linsitinib", inc) :- phosphosite("ABI1(Y213)").
0.2272236763::p_fc("ABI1(Y213)", "MK2206", dec); 0.2272236763::p_fc("ABI1(Y213)", "MK2206", inc) :- phosphosite("ABI1(Y213)").
0.1537133464::p_fc("ABI1(Y213)", "NU7441", dec); 0.1537133464::p_fc("ABI1(Y213)", "NU7441", inc) :- phosphosite("ABI1(Y213)").
0.1303692745::p_fc("ABI1(Y213)", "PD153035", dec); 0.1303692745::p_fc("ABI1(Y213)", "PD153035", inc) :- phosphosite("ABI1(Y213)").
0.0010750236::p_fc("ABI1(Y213)", "PF3758309", dec); 0.0010750236::p_fc("ABI1(Y213)", "PF3758309", inc) :- phosphosite("ABI1(Y213)").
0.1338131477::p_fc("ABI1(Y213)", "PF4708671", dec); 0.1338131477::p_fc("ABI1(Y213)", "PF4708671", inc) :- phosphosite("ABI1(Y213)").
0.0466100231::p_fc("ABI1(Y213)", "PH797804", dec); 0.0466100231::p_fc("ABI1(Y213)", "PH797804", inc) :- phosphosite("ABI1(Y213)").
0.4519473476::p_fc("ABI1(Y213)", "PIK294", dec); 0.4519473476::p_fc("ABI1(Y213)", "PIK294", inc) :- phosphosite("ABI1(Y213)").
0.2874120349::p_fc("ABI1(Y213)", "Ribociclib", dec); 0.2874120349::p_fc("ABI1(Y213)", "Ribociclib", inc) :- phosphosite("ABI1(Y213)").
0.1924752659::p_fc("ABI1(Y213)", "Ripasudil", dec); 0.1924752659::p_fc("ABI1(Y213)", "Ripasudil", inc) :- phosphosite("ABI1(Y213)").
0.4889311729::p_fc("ABI1(Y213)", "SP600125", dec); 0.4889311729::p_fc("ABI1(Y213)", "SP600125", inc) :- phosphosite("ABI1(Y213)").
0.2253082524::p_fc("ABI1(Y213)", "Selumetinib", dec); 0.2253082524::p_fc("ABI1(Y213)", "Selumetinib", inc) :- phosphosite("ABI1(Y213)").
0.3046448186::p_fc("ABI1(Y213)", "TAK715", dec); 0.3046448186::p_fc("ABI1(Y213)", "TAK715", inc) :- phosphosite("ABI1(Y213)").
0.2800436462::p_fc("ABI1(Y213)", "TBCA", dec); 0.2800436462::p_fc("ABI1(Y213)", "TBCA", inc) :- phosphosite("ABI1(Y213)").
0.1278047619::p_fc("ABI1(Y213)", "TGX221", dec); 0.1278047619::p_fc("ABI1(Y213)", "TGX221", inc) :- phosphosite("ABI1(Y213)").
0.3142379839::p_fc("ABI1(Y213)", "Tofacitinib", dec); 0.3142379839::p_fc("ABI1(Y213)", "Tofacitinib", inc) :- phosphosite("ABI1(Y213)").
0.0351748721::p_fc("ABI1(Y213)", "Torin", dec); 0.0351748721::p_fc("ABI1(Y213)", "Torin", inc) :- phosphosite("ABI1(Y213)").
0.4504773984::p_fc("ABI1(Y213)", "Trametinib", dec); 0.4504773984::p_fc("ABI1(Y213)", "Trametinib", inc) :- phosphosite("ABI1(Y213)").
0.3256486798::p_fc("ABI1(Y213)", "U73122", dec); 0.3256486798::p_fc("ABI1(Y213)", "U73122", inc) :- phosphosite("ABI1(Y213)").
0.3960361463::p_fc("ABI1(Y213)", "Ulixertinib", dec); 0.3960361463::p_fc("ABI1(Y213)", "Ulixertinib", inc) :- phosphosite("ABI1(Y213)").
0.0578815791::p_fc("ABI1(Y213)", "Vemurafenib", dec); 0.0578815791::p_fc("ABI1(Y213)", "Vemurafenib", inc) :- phosphosite("ABI1(Y213)").
0.1317402264::p_fc("ABL1(S569)", "AC220", dec); 0.1317402264::p_fc("ABL1(S569)", "AC220", inc) :- phosphosite("ABL1(S569)").
0.3920542167::p_fc("ABL1(S569)", "AT13148", dec); 0.3920542167::p_fc("ABL1(S569)", "AT13148", inc) :- phosphosite("ABL1(S569)").
0.4712938133::p_fc("ABL1(S569)", "AZ20", dec); 0.4712938133::p_fc("ABL1(S569)", "AZ20", inc) :- phosphosite("ABL1(S569)").
0.3758444785::p_fc("ABL1(S569)", "AZD1480", dec); 0.3758444785::p_fc("ABL1(S569)", "AZD1480", inc) :- phosphosite("ABL1(S569)").
0.2003963524::p_fc("ABL1(S569)", "AZD3759", dec); 0.2003963524::p_fc("ABL1(S569)", "AZD3759", inc) :- phosphosite("ABL1(S569)").
0.3447900226::p_fc("ABL1(S569)", "AZD5363", dec); 0.3447900226::p_fc("ABL1(S569)", "AZD5363", inc) :- phosphosite("ABL1(S569)").
0.1713319751::p_fc("ABL1(S569)", "AZD5438", dec); 0.1713319751::p_fc("ABL1(S569)", "AZD5438", inc) :- phosphosite("ABL1(S569)").
0.3353970608::p_fc("ABL1(S569)", "AZD6482", dec); 0.3353970608::p_fc("ABL1(S569)", "AZD6482", inc) :- phosphosite("ABL1(S569)").
0.2775934768::p_fc("ABL1(S569)", "AZD6738", dec); 0.2775934768::p_fc("ABL1(S569)", "AZD6738", inc) :- phosphosite("ABL1(S569)").
0.4355928553::p_fc("ABL1(S569)", "AZD8055", dec); 0.4355928553::p_fc("ABL1(S569)", "AZD8055", inc) :- phosphosite("ABL1(S569)").
0.129613564::p_fc("ABL1(S569)", "Amuvatinib", dec); 0.129613564::p_fc("ABL1(S569)", "Amuvatinib", inc) :- phosphosite("ABL1(S569)").
0.4591224247::p_fc("ABL1(S569)", "BX912", dec); 0.4591224247::p_fc("ABL1(S569)", "BX912", inc) :- phosphosite("ABL1(S569)").
0.0846916666::p_fc("ABL1(S569)", "Bosutinib", dec); 0.0846916666::p_fc("ABL1(S569)", "Bosutinib", inc) :- phosphosite("ABL1(S569)").
0.3679822066::p_fc("ABL1(S569)", "CAL101", dec); 0.3679822066::p_fc("ABL1(S569)", "CAL101", inc) :- phosphosite("ABL1(S569)").
0.0333726188::p_fc("ABL1(S569)", "CHIR99021", dec); 0.0333726188::p_fc("ABL1(S569)", "CHIR99021", inc) :- phosphosite("ABL1(S569)").
0.4609334589::p_fc("ABL1(S569)", "CX4945", dec); 0.4609334589::p_fc("ABL1(S569)", "CX4945", inc) :- phosphosite("ABL1(S569)").
0.3937000353::p_fc("ABL1(S569)", "DNAPK", dec); 0.3937000353::p_fc("ABL1(S569)", "DNAPK", inc) :- phosphosite("ABL1(S569)").
0.3841054423::p_fc("ABL1(S569)", "Dabrafenib", dec); 0.3841054423::p_fc("ABL1(S569)", "Dabrafenib", inc) :- phosphosite("ABL1(S569)").
0.3049421133::p_fc("ABL1(S569)", "Dasatinib", dec); 0.3049421133::p_fc("ABL1(S569)", "Dasatinib", inc) :- phosphosite("ABL1(S569)").
0.0037435718::p_fc("ABL1(S569)", "Edelfosine", dec); 0.0037435718::p_fc("ABL1(S569)", "Edelfosine", inc) :- phosphosite("ABL1(S569)").
0.4012714486::p_fc("ABL1(S569)", "FRAX486", dec); 0.4012714486::p_fc("ABL1(S569)", "FRAX486", inc) :- phosphosite("ABL1(S569)").
0.3082322829::p_fc("ABL1(S569)", "GDC0941", dec); 0.3082322829::p_fc("ABL1(S569)", "GDC0941", inc) :- phosphosite("ABL1(S569)").
0.4637963787::p_fc("ABL1(S569)", "GDC0994", dec); 0.4637963787::p_fc("ABL1(S569)", "GDC0994", inc) :- phosphosite("ABL1(S569)").
0.2837605939::p_fc("ABL1(S569)", "GF109203X", dec); 0.2837605939::p_fc("ABL1(S569)", "GF109203X", inc) :- phosphosite("ABL1(S569)").
0.3226323508::p_fc("ABL1(S569)", "GO6983", dec); 0.3226323508::p_fc("ABL1(S569)", "GO6983", inc) :- phosphosite("ABL1(S569)").
0.3491111142::p_fc("ABL1(S569)", "GSK2334470", dec); 0.3491111142::p_fc("ABL1(S569)", "GSK2334470", inc) :- phosphosite("ABL1(S569)").
0.0308380816::p_fc("ABL1(S569)", "GSK690693", dec); 0.0308380816::p_fc("ABL1(S569)", "GSK690693", inc) :- phosphosite("ABL1(S569)").
0.1435434236::p_fc("ABL1(S569)", "Go6976", dec); 0.1435434236::p_fc("ABL1(S569)", "Go6976", inc) :- phosphosite("ABL1(S569)").
0.1761061248::p_fc("ABL1(S569)", "H89", dec); 0.1761061248::p_fc("ABL1(S569)", "H89", inc) :- phosphosite("ABL1(S569)").
0.1841247112::p_fc("ABL1(S569)", "HS173", dec); 0.1841247112::p_fc("ABL1(S569)", "HS173", inc) :- phosphosite("ABL1(S569)").
0.4318396203::p_fc("ABL1(S569)", "Ipatasertib", dec); 0.4318396203::p_fc("ABL1(S569)", "Ipatasertib", inc) :- phosphosite("ABL1(S569)").
0.0431647735::p_fc("ABL1(S569)", "JNJ", dec); 0.0431647735::p_fc("ABL1(S569)", "JNJ", inc) :- phosphosite("ABL1(S569)").
0.3744022444::p_fc("ABL1(S569)", "JNK", dec); 0.3744022444::p_fc("ABL1(S569)", "JNK", inc) :- phosphosite("ABL1(S569)").
0.2587356795::p_fc("ABL1(S569)", "KD025", dec); 0.2587356795::p_fc("ABL1(S569)", "KD025", inc) :- phosphosite("ABL1(S569)").
0.2814814719::p_fc("ABL1(S569)", "KN62", dec); 0.2814814719::p_fc("ABL1(S569)", "KN62", inc) :- phosphosite("ABL1(S569)").
0.3498722382::p_fc("ABL1(S569)", "KN93", dec); 0.3498722382::p_fc("ABL1(S569)", "KN93", inc) :- phosphosite("ABL1(S569)").
0.4915351145::p_fc("ABL1(S569)", "Ku0063794", dec); 0.4915351145::p_fc("ABL1(S569)", "Ku0063794", inc) :- phosphosite("ABL1(S569)").
0.0018573941::p_fc("ABL1(S569)", "LY2090314", dec); 0.0018573941::p_fc("ABL1(S569)", "LY2090314", inc) :- phosphosite("ABL1(S569)").
0.2850951921::p_fc("ABL1(S569)", "LY2584702", dec); 0.2850951921::p_fc("ABL1(S569)", "LY2584702", inc) :- phosphosite("ABL1(S569)").
0.3003275229::p_fc("ABL1(S569)", "LY2835219", dec); 0.3003275229::p_fc("ABL1(S569)", "LY2835219", inc) :- phosphosite("ABL1(S569)").
0.3480306421::p_fc("ABL1(S569)", "Linsitinib", dec); 0.3480306421::p_fc("ABL1(S569)", "Linsitinib", inc) :- phosphosite("ABL1(S569)").
0.3601477468::p_fc("ABL1(S569)", "MK2206", dec); 0.3601477468::p_fc("ABL1(S569)", "MK2206", inc) :- phosphosite("ABL1(S569)").
0.3338776666::p_fc("ABL1(S569)", "NU7441", dec); 0.3338776666::p_fc("ABL1(S569)", "NU7441", inc) :- phosphosite("ABL1(S569)").
0.1187099057::p_fc("ABL1(S569)", "PD153035", dec); 0.1187099057::p_fc("ABL1(S569)", "PD153035", inc) :- phosphosite("ABL1(S569)").
0.1265044533::p_fc("ABL1(S569)", "PF3758309", dec); 0.1265044533::p_fc("ABL1(S569)", "PF3758309", inc) :- phosphosite("ABL1(S569)").
0.1177299398::p_fc("ABL1(S569)", "PF4708671", dec); 0.1177299398::p_fc("ABL1(S569)", "PF4708671", inc) :- phosphosite("ABL1(S569)").
0.0494062649::p_fc("ABL1(S569)", "PH797804", dec); 0.0494062649::p_fc("ABL1(S569)", "PH797804", inc) :- phosphosite("ABL1(S569)").
0.4796452625::p_fc("ABL1(S569)", "PIK294", dec); 0.4796452625::p_fc("ABL1(S569)", "PIK294", inc) :- phosphosite("ABL1(S569)").
0.1425934241::p_fc("ABL1(S569)", "Ribociclib", dec); 0.1425934241::p_fc("ABL1(S569)", "Ribociclib", inc) :- phosphosite("ABL1(S569)").
0.0951727239::p_fc("ABL1(S569)", "Ripasudil", dec); 0.0951727239::p_fc("ABL1(S569)", "Ripasudil", inc) :- phosphosite("ABL1(S569)").
0.0513902728::p_fc("ABL1(S569)", "SP600125", dec); 0.0513902728::p_fc("ABL1(S569)", "SP600125", inc) :- phosphosite("ABL1(S569)").
0.4553110951::p_fc("ABL1(S569)", "Selumetinib", dec); 0.4553110951::p_fc("ABL1(S569)", "Selumetinib", inc) :- phosphosite("ABL1(S569)").
0.3722677899::p_fc("ABL1(S569)", "TAK715", dec); 0.3722677899::p_fc("ABL1(S569)", "TAK715", inc) :- phosphosite("ABL1(S569)").
0.3133393142::p_fc("ABL1(S569)", "TBCA", dec); 0.3133393142::p_fc("ABL1(S569)", "TBCA", inc) :- phosphosite("ABL1(S569)").
0.4302142891::p_fc("ABL1(S569)", "TGX221", dec); 0.4302142891::p_fc("ABL1(S569)", "TGX221", inc) :- phosphosite("ABL1(S569)").
0.3880905455::p_fc("ABL1(S569)", "Tofacitinib", dec); 0.3880905455::p_fc("ABL1(S569)", "Tofacitinib", inc) :- phosphosite("ABL1(S569)").
0.2400763614::p_fc("ABL1(S569)", "Torin", dec); 0.2400763614::p_fc("ABL1(S569)", "Torin", inc) :- phosphosite("ABL1(S569)").
0.4916909766::p_fc("ABL1(S569)", "Trametinib", dec); 0.4916909766::p_fc("ABL1(S569)", "Trametinib", inc) :- phosphosite("ABL1(S569)").
0.1237279308::p_fc("ABL1(S569)", "U73122", dec); 0.1237279308::p_fc("ABL1(S569)", "U73122", inc) :- phosphosite("ABL1(S569)").
0.3054758854::p_fc("ABL1(S569)", "Ulixertinib", dec); 0.3054758854::p_fc("ABL1(S569)", "Ulixertinib", inc) :- phosphosite("ABL1(S569)").
0.047029447::p_fc("ABL1(S569)", "Vemurafenib", dec); 0.047029447::p_fc("ABL1(S569)", "Vemurafenib", inc) :- phosphosite("ABL1(S569)").
0.4113208405::p_fc("ABL1(S718)", "AC220", dec); 0.4113208405::p_fc("ABL1(S718)", "AC220", inc) :- phosphosite("ABL1(S718)").
0.2600998631::p_fc("ABL1(S718)", "AT13148", dec); 0.2600998631::p_fc("ABL1(S718)", "AT13148", inc) :- phosphosite("ABL1(S718)").
0.392677982::p_fc("ABL1(S718)", "AZ20", dec); 0.392677982::p_fc("ABL1(S718)", "AZ20", inc) :- phosphosite("ABL1(S718)").
0.3173567729::p_fc("ABL1(S718)", "AZD1480", dec); 0.3173567729::p_fc("ABL1(S718)", "AZD1480", inc) :- phosphosite("ABL1(S718)").
0.3949089239::p_fc("ABL1(S718)", "AZD3759", dec); 0.3949089239::p_fc("ABL1(S718)", "AZD3759", inc) :- phosphosite("ABL1(S718)").
0.3375796868::p_fc("ABL1(S718)", "AZD5363", dec); 0.3375796868::p_fc("ABL1(S718)", "AZD5363", inc) :- phosphosite("ABL1(S718)").
0.2888987564::p_fc("ABL1(S718)", "AZD5438", dec); 0.2888987564::p_fc("ABL1(S718)", "AZD5438", inc) :- phosphosite("ABL1(S718)").
0.3928717768::p_fc("ABL1(S718)", "AZD6482", dec); 0.3928717768::p_fc("ABL1(S718)", "AZD6482", inc) :- phosphosite("ABL1(S718)").
0.2471174946::p_fc("ABL1(S718)", "AZD6738", dec); 0.2471174946::p_fc("ABL1(S718)", "AZD6738", inc) :- phosphosite("ABL1(S718)").
0.004427364::p_fc("ABL1(S718)", "AZD8055", dec); 0.004427364::p_fc("ABL1(S718)", "AZD8055", inc) :- phosphosite("ABL1(S718)").
0.4008170667::p_fc("ABL1(S718)", "Amuvatinib", dec); 0.4008170667::p_fc("ABL1(S718)", "Amuvatinib", inc) :- phosphosite("ABL1(S718)").
0.3253672957::p_fc("ABL1(S718)", "BX912", dec); 0.3253672957::p_fc("ABL1(S718)", "BX912", inc) :- phosphosite("ABL1(S718)").
0.333402742::p_fc("ABL1(S718)", "Bosutinib", dec); 0.333402742::p_fc("ABL1(S718)", "Bosutinib", inc) :- phosphosite("ABL1(S718)").
0.2094067231::p_fc("ABL1(S718)", "CAL101", dec); 0.2094067231::p_fc("ABL1(S718)", "CAL101", inc) :- phosphosite("ABL1(S718)").
0.3694884606::p_fc("ABL1(S718)", "CHIR99021", dec); 0.3694884606::p_fc("ABL1(S718)", "CHIR99021", inc) :- phosphosite("ABL1(S718)").
0.0529780792::p_fc("ABL1(S718)", "CX4945", dec); 0.0529780792::p_fc("ABL1(S718)", "CX4945", inc) :- phosphosite("ABL1(S718)").
0.4265986359::p_fc("ABL1(S718)", "DNAPK", dec); 0.4265986359::p_fc("ABL1(S718)", "DNAPK", inc) :- phosphosite("ABL1(S718)").
0.4475711378::p_fc("ABL1(S718)", "Dabrafenib", dec); 0.4475711378::p_fc("ABL1(S718)", "Dabrafenib", inc) :- phosphosite("ABL1(S718)").
0.3449705624::p_fc("ABL1(S718)", "Dasatinib", dec); 0.3449705624::p_fc("ABL1(S718)", "Dasatinib", inc) :- phosphosite("ABL1(S718)").
0.2184784968::p_fc("ABL1(S718)", "Edelfosine", dec); 0.2184784968::p_fc("ABL1(S718)", "Edelfosine", inc) :- phosphosite("ABL1(S718)").
0.1792470191::p_fc("ABL1(S718)", "FRAX486", dec); 0.1792470191::p_fc("ABL1(S718)", "FRAX486", inc) :- phosphosite("ABL1(S718)").
0.4528082148::p_fc("ABL1(S718)", "GDC0941", dec); 0.4528082148::p_fc("ABL1(S718)", "GDC0941", inc) :- phosphosite("ABL1(S718)").
0.1031655393::p_fc("ABL1(S718)", "GDC0994", dec); 0.1031655393::p_fc("ABL1(S718)", "GDC0994", inc) :- phosphosite("ABL1(S718)").
0.3332629451::p_fc("ABL1(S718)", "GF109203X", dec); 0.3332629451::p_fc("ABL1(S718)", "GF109203X", inc) :- phosphosite("ABL1(S718)").
0.0116128152::p_fc("ABL1(S718)", "GO6983", dec); 0.0116128152::p_fc("ABL1(S718)", "GO6983", inc) :- phosphosite("ABL1(S718)").
0.1999071486::p_fc("ABL1(S718)", "GSK2334470", dec); 0.1999071486::p_fc("ABL1(S718)", "GSK2334470", inc) :- phosphosite("ABL1(S718)").
0.3975340512::p_fc("ABL1(S718)", "GSK690693", dec); 0.3975340512::p_fc("ABL1(S718)", "GSK690693", inc) :- phosphosite("ABL1(S718)").
0.3758192387::p_fc("ABL1(S718)", "Go6976", dec); 0.3758192387::p_fc("ABL1(S718)", "Go6976", inc) :- phosphosite("ABL1(S718)").
0.3385921594::p_fc("ABL1(S718)", "H89", dec); 0.3385921594::p_fc("ABL1(S718)", "H89", inc) :- phosphosite("ABL1(S718)").
0.4656677952::p_fc("ABL1(S718)", "HS173", dec); 0.4656677952::p_fc("ABL1(S718)", "HS173", inc) :- phosphosite("ABL1(S718)").
0.1861751362::p_fc("ABL1(S718)", "Ipatasertib", dec); 0.1861751362::p_fc("ABL1(S718)", "Ipatasertib", inc) :- phosphosite("ABL1(S718)").
0.4869096009::p_fc("ABL1(S718)", "JNJ", dec); 0.4869096009::p_fc("ABL1(S718)", "JNJ", inc) :- phosphosite("ABL1(S718)").
0.1832779945::p_fc("ABL1(S718)", "JNK", dec); 0.1832779945::p_fc("ABL1(S718)", "JNK", inc) :- phosphosite("ABL1(S718)").
0.4408162506::p_fc("ABL1(S718)", "KD025", dec); 0.4408162506::p_fc("ABL1(S718)", "KD025", inc) :- phosphosite("ABL1(S718)").
0.4933229656::p_fc("ABL1(S718)", "KN62", dec); 0.4933229656::p_fc("ABL1(S718)", "KN62", inc) :- phosphosite("ABL1(S718)").
0.4814403323::p_fc("ABL1(S718)", "KN93", dec); 0.4814403323::p_fc("ABL1(S718)", "KN93", inc) :- phosphosite("ABL1(S718)").
0.4842084341::p_fc("ABL1(S718)", "Ku0063794", dec); 0.4842084341::p_fc("ABL1(S718)", "Ku0063794", inc) :- phosphosite("ABL1(S718)").
0.1708041527::p_fc("ABL1(S718)", "LY2090314", dec); 0.1708041527::p_fc("ABL1(S718)", "LY2090314", inc) :- phosphosite("ABL1(S718)").
0.1418757646::p_fc("ABL1(S718)", "LY2584702", dec); 0.1418757646::p_fc("ABL1(S718)", "LY2584702", inc) :- phosphosite("ABL1(S718)").
0.4893183118::p_fc("ABL1(S718)", "LY2835219", dec); 0.4893183118::p_fc("ABL1(S718)", "LY2835219", inc) :- phosphosite("ABL1(S718)").
0.2778043106::p_fc("ABL1(S718)", "Linsitinib", dec); 0.2778043106::p_fc("ABL1(S718)", "Linsitinib", inc) :- phosphosite("ABL1(S718)").
0.4009195747::p_fc("ABL1(S718)", "MK2206", dec); 0.4009195747::p_fc("ABL1(S718)", "MK2206", inc) :- phosphosite("ABL1(S718)").
0.3757124857::p_fc("ABL1(S718)", "NU7441", dec); 0.3757124857::p_fc("ABL1(S718)", "NU7441", inc) :- phosphosite("ABL1(S718)").
0.3898412502::p_fc("ABL1(S718)", "PD153035", dec); 0.3898412502::p_fc("ABL1(S718)", "PD153035", inc) :- phosphosite("ABL1(S718)").
0.0692935744::p_fc("ABL1(S718)", "PF3758309", dec); 0.0692935744::p_fc("ABL1(S718)", "PF3758309", inc) :- phosphosite("ABL1(S718)").
0.3648191353::p_fc("ABL1(S718)", "PF4708671", dec); 0.3648191353::p_fc("ABL1(S718)", "PF4708671", inc) :- phosphosite("ABL1(S718)").
0.1140653984::p_fc("ABL1(S718)", "PH797804", dec); 0.1140653984::p_fc("ABL1(S718)", "PH797804", inc) :- phosphosite("ABL1(S718)").
0.4419808864::p_fc("ABL1(S718)", "PIK294", dec); 0.4419808864::p_fc("ABL1(S718)", "PIK294", inc) :- phosphosite("ABL1(S718)").
0.4965692812::p_fc("ABL1(S718)", "Ribociclib", dec); 0.4965692812::p_fc("ABL1(S718)", "Ribociclib", inc) :- phosphosite("ABL1(S718)").
0.2535729174::p_fc("ABL1(S718)", "Ripasudil", dec); 0.2535729174::p_fc("ABL1(S718)", "Ripasudil", inc) :- phosphosite("ABL1(S718)").
0.424072785::p_fc("ABL1(S718)", "SP600125", dec); 0.424072785::p_fc("ABL1(S718)", "SP600125", inc) :- phosphosite("ABL1(S718)").
0.4330209973::p_fc("ABL1(S718)", "Selumetinib", dec); 0.4330209973::p_fc("ABL1(S718)", "Selumetinib", inc) :- phosphosite("ABL1(S718)").
0.1117650159::p_fc("ABL1(S718)", "TAK715", dec); 0.1117650159::p_fc("ABL1(S718)", "TAK715", inc) :- phosphosite("ABL1(S718)").
0.3995119914::p_fc("ABL1(S718)", "TBCA", dec); 0.3995119914::p_fc("ABL1(S718)", "TBCA", inc) :- phosphosite("ABL1(S718)").
0.3942496438::p_fc("ABL1(S718)", "TGX221", dec); 0.3942496438::p_fc("ABL1(S718)", "TGX221", inc) :- phosphosite("ABL1(S718)").
0.2687657585::p_fc("ABL1(S718)", "Tofacitinib", dec); 0.2687657585::p_fc("ABL1(S718)", "Tofacitinib", inc) :- phosphosite("ABL1(S718)").
0.0636425735::p_fc("ABL1(S718)", "Torin", dec); 0.0636425735::p_fc("ABL1(S718)", "Torin", inc) :- phosphosite("ABL1(S718)").
0.2112502455::p_fc("ABL1(S718)", "Trametinib", dec); 0.2112502455::p_fc("ABL1(S718)", "Trametinib", inc) :- phosphosite("ABL1(S718)").
0.1323956433::p_fc("ABL1(S718)", "U73122", dec); 0.1323956433::p_fc("ABL1(S718)", "U73122", inc) :- phosphosite("ABL1(S718)").
0.0032791478::p_fc("ABL1(S718)", "Ulixertinib", dec); 0.0032791478::p_fc("ABL1(S718)", "Ulixertinib", inc) :- phosphosite("ABL1(S718)").
0.4591835851::p_fc("ABL1(S718)", "Vemurafenib", dec); 0.4591835851::p_fc("ABL1(S718)", "Vemurafenib", inc) :- phosphosite("ABL1(S718)").
0.2857890186::p_fc("ABL1(T735)", "AC220", dec); 0.2857890186::p_fc("ABL1(T735)", "AC220", inc) :- phosphosite("ABL1(T735)").
0.0238785134::p_fc("ABL1(T735)", "AT13148", dec); 0.0238785134::p_fc("ABL1(T735)", "AT13148", inc) :- phosphosite("ABL1(T735)").
0.333130495::p_fc("ABL1(T735)", "AZ20", dec); 0.333130495::p_fc("ABL1(T735)", "AZ20", inc) :- phosphosite("ABL1(T735)").
0.0025636813::p_fc("ABL1(T735)", "AZD1480", dec); 0.0025636813::p_fc("ABL1(T735)", "AZD1480", inc) :- phosphosite("ABL1(T735)").
0.3782639415::p_fc("ABL1(T735)", "AZD3759", dec); 0.3782639415::p_fc("ABL1(T735)", "AZD3759", inc) :- phosphosite("ABL1(T735)").
0.000997006::p_fc("ABL1(T735)", "AZD5363", dec); 0.000997006::p_fc("ABL1(T735)", "AZD5363", inc) :- phosphosite("ABL1(T735)").
0.0009970324::p_fc("ABL1(T735)", "AZD5438", dec); 0.0009970324::p_fc("ABL1(T735)", "AZD5438", inc) :- phosphosite("ABL1(T735)").
0.2661398594::p_fc("ABL1(T735)", "AZD6482", dec); 0.2661398594::p_fc("ABL1(T735)", "AZD6482", inc) :- phosphosite("ABL1(T735)").
0.4779607715::p_fc("ABL1(T735)", "AZD6738", dec); 0.4779607715::p_fc("ABL1(T735)", "AZD6738", inc) :- phosphosite("ABL1(T735)").
0.2003091942::p_fc("ABL1(T735)", "AZD8055", dec); 0.2003091942::p_fc("ABL1(T735)", "AZD8055", inc) :- phosphosite("ABL1(T735)").
0.0714934157::p_fc("ABL1(T735)", "Amuvatinib", dec); 0.0714934157::p_fc("ABL1(T735)", "Amuvatinib", inc) :- phosphosite("ABL1(T735)").
0.000997006::p_fc("ABL1(T735)", "BX912", dec); 0.000997006::p_fc("ABL1(T735)", "BX912", inc) :- phosphosite("ABL1(T735)").
0.4028935375::p_fc("ABL1(T735)", "Bosutinib", dec); 0.4028935375::p_fc("ABL1(T735)", "Bosutinib", inc) :- phosphosite("ABL1(T735)").
0.0034282785::p_fc("ABL1(T735)", "CAL101", dec); 0.0034282785::p_fc("ABL1(T735)", "CAL101", inc) :- phosphosite("ABL1(T735)").
0.0010166506::p_fc("ABL1(T735)", "CHIR99021", dec); 0.0010166506::p_fc("ABL1(T735)", "CHIR99021", inc) :- phosphosite("ABL1(T735)").
0.0196725935::p_fc("ABL1(T735)", "CX4945", dec); 0.0196725935::p_fc("ABL1(T735)", "CX4945", inc) :- phosphosite("ABL1(T735)").
0.3424163244::p_fc("ABL1(T735)", "DNAPK", dec); 0.3424163244::p_fc("ABL1(T735)", "DNAPK", inc) :- phosphosite("ABL1(T735)").
0.4385956616::p_fc("ABL1(T735)", "Dabrafenib", dec); 0.4385956616::p_fc("ABL1(T735)", "Dabrafenib", inc) :- phosphosite("ABL1(T735)").
0.0609550952::p_fc("ABL1(T735)", "Dasatinib", dec); 0.0609550952::p_fc("ABL1(T735)", "Dasatinib", inc) :- phosphosite("ABL1(T735)").
0.3371823772::p_fc("ABL1(T735)", "Edelfosine", dec); 0.3371823772::p_fc("ABL1(T735)", "Edelfosine", inc) :- phosphosite("ABL1(T735)").
0.0699929895::p_fc("ABL1(T735)", "FRAX486", dec); 0.0699929895::p_fc("ABL1(T735)", "FRAX486", inc) :- phosphosite("ABL1(T735)").
0.1035110027::p_fc("ABL1(T735)", "GDC0941", dec); 0.1035110027::p_fc("ABL1(T735)", "GDC0941", inc) :- phosphosite("ABL1(T735)").
0.438926318::p_fc("ABL1(T735)", "GDC0994", dec); 0.438926318::p_fc("ABL1(T735)", "GDC0994", inc) :- phosphosite("ABL1(T735)").
0.4337855981::p_fc("ABL1(T735)", "GF109203X", dec); 0.4337855981::p_fc("ABL1(T735)", "GF109203X", inc) :- phosphosite("ABL1(T735)").
0.0576471315::p_fc("ABL1(T735)", "GO6983", dec); 0.0576471315::p_fc("ABL1(T735)", "GO6983", inc) :- phosphosite("ABL1(T735)").
0.000997006::p_fc("ABL1(T735)", "GSK2334470", dec); 0.000997006::p_fc("ABL1(T735)", "GSK2334470", inc) :- phosphosite("ABL1(T735)").
0.3876352323::p_fc("ABL1(T735)", "GSK690693", dec); 0.3876352323::p_fc("ABL1(T735)", "GSK690693", inc) :- phosphosite("ABL1(T735)").
0.0993381868::p_fc("ABL1(T735)", "Go6976", dec); 0.0993381868::p_fc("ABL1(T735)", "Go6976", inc) :- phosphosite("ABL1(T735)").
0.3752944988::p_fc("ABL1(T735)", "H89", dec); 0.3752944988::p_fc("ABL1(T735)", "H89", inc) :- phosphosite("ABL1(T735)").
0.3524962574::p_fc("ABL1(T735)", "HS173", dec); 0.3524962574::p_fc("ABL1(T735)", "HS173", inc) :- phosphosite("ABL1(T735)").
0.0009978468::p_fc("ABL1(T735)", "Ipatasertib", dec); 0.0009978468::p_fc("ABL1(T735)", "Ipatasertib", inc) :- phosphosite("ABL1(T735)").
0.216475304::p_fc("ABL1(T735)", "JNJ", dec); 0.216475304::p_fc("ABL1(T735)", "JNJ", inc) :- phosphosite("ABL1(T735)").
0.3131209627::p_fc("ABL1(T735)", "JNK", dec); 0.3131209627::p_fc("ABL1(T735)", "JNK", inc) :- phosphosite("ABL1(T735)").
0.3124525031::p_fc("ABL1(T735)", "KD025", dec); 0.3124525031::p_fc("ABL1(T735)", "KD025", inc) :- phosphosite("ABL1(T735)").
0.1292034495::p_fc("ABL1(T735)", "KN62", dec); 0.1292034495::p_fc("ABL1(T735)", "KN62", inc) :- phosphosite("ABL1(T735)").
0.0019869243::p_fc("ABL1(T735)", "KN93", dec); 0.0019869243::p_fc("ABL1(T735)", "KN93", inc) :- phosphosite("ABL1(T735)").
0.0017158652::p_fc("ABL1(T735)", "Ku0063794", dec); 0.0017158652::p_fc("ABL1(T735)", "Ku0063794", inc) :- phosphosite("ABL1(T735)").
0.0142886356::p_fc("ABL1(T735)", "LY2090314", dec); 0.0142886356::p_fc("ABL1(T735)", "LY2090314", inc) :- phosphosite("ABL1(T735)").
0.2684479014::p_fc("ABL1(T735)", "LY2584702", dec); 0.2684479014::p_fc("ABL1(T735)", "LY2584702", inc) :- phosphosite("ABL1(T735)").
0.3798087435::p_fc("ABL1(T735)", "LY2835219", dec); 0.3798087435::p_fc("ABL1(T735)", "LY2835219", inc) :- phosphosite("ABL1(T735)").
0.3803806922::p_fc("ABL1(T735)", "Linsitinib", dec); 0.3803806922::p_fc("ABL1(T735)", "Linsitinib", inc) :- phosphosite("ABL1(T735)").
0.1254271863::p_fc("ABL1(T735)", "MK2206", dec); 0.1254271863::p_fc("ABL1(T735)", "MK2206", inc) :- phosphosite("ABL1(T735)").
0.1116330748::p_fc("ABL1(T735)", "NU7441", dec); 0.1116330748::p_fc("ABL1(T735)", "NU7441", inc) :- phosphosite("ABL1(T735)").
0.3454287187::p_fc("ABL1(T735)", "PD153035", dec); 0.3454287187::p_fc("ABL1(T735)", "PD153035", inc) :- phosphosite("ABL1(T735)").
0.436703804::p_fc("ABL1(T735)", "PF3758309", dec); 0.436703804::p_fc("ABL1(T735)", "PF3758309", inc) :- phosphosite("ABL1(T735)").
0.3594167335::p_fc("ABL1(T735)", "PF4708671", dec); 0.3594167335::p_fc("ABL1(T735)", "PF4708671", inc) :- phosphosite("ABL1(T735)").
0.0589466344::p_fc("ABL1(T735)", "PH797804", dec); 0.0589466344::p_fc("ABL1(T735)", "PH797804", inc) :- phosphosite("ABL1(T735)").
0.0012258713::p_fc("ABL1(T735)", "PIK294", dec); 0.0012258713::p_fc("ABL1(T735)", "PIK294", inc) :- phosphosite("ABL1(T735)").
0.2730683397::p_fc("ABL1(T735)", "Ribociclib", dec); 0.2730683397::p_fc("ABL1(T735)", "Ribociclib", inc) :- phosphosite("ABL1(T735)").
0.4753176716::p_fc("ABL1(T735)", "Ripasudil", dec); 0.4753176716::p_fc("ABL1(T735)", "Ripasudil", inc) :- phosphosite("ABL1(T735)").
0.430278132::p_fc("ABL1(T735)", "SP600125", dec); 0.430278132::p_fc("ABL1(T735)", "SP600125", inc) :- phosphosite("ABL1(T735)").
0.110859077::p_fc("ABL1(T735)", "Selumetinib", dec); 0.110859077::p_fc("ABL1(T735)", "Selumetinib", inc) :- phosphosite("ABL1(T735)").
0.3927908656::p_fc("ABL1(T735)", "TAK715", dec); 0.3927908656::p_fc("ABL1(T735)", "TAK715", inc) :- phosphosite("ABL1(T735)").
0.2713112754::p_fc("ABL1(T735)", "TBCA", dec); 0.2713112754::p_fc("ABL1(T735)", "TBCA", inc) :- phosphosite("ABL1(T735)").
0.4300813184::p_fc("ABL1(T735)", "TGX221", dec); 0.4300813184::p_fc("ABL1(T735)", "TGX221", inc) :- phosphosite("ABL1(T735)").
0.0010191413::p_fc("ABL1(T735)", "Tofacitinib", dec); 0.0010191413::p_fc("ABL1(T735)", "Tofacitinib", inc) :- phosphosite("ABL1(T735)").
0.0852754459::p_fc("ABL1(T735)", "Torin", dec); 0.0852754459::p_fc("ABL1(T735)", "Torin", inc) :- phosphosite("ABL1(T735)").
0.0543639075::p_fc("ABL1(T735)", "Trametinib", dec); 0.0543639075::p_fc("ABL1(T735)", "Trametinib", inc) :- phosphosite("ABL1(T735)").
0.2626218177::p_fc("ABL1(T735)", "U73122", dec); 0.2626218177::p_fc("ABL1(T735)", "U73122", inc) :- phosphosite("ABL1(T735)").
0.3508213513::p_fc("ABL1(T735)", "Ulixertinib", dec); 0.3508213513::p_fc("ABL1(T735)", "Ulixertinib", inc) :- phosphosite("ABL1(T735)").
0.3308448559::p_fc("ABL1(T735)", "Vemurafenib", dec); 0.3308448559::p_fc("ABL1(T735)", "Vemurafenib", inc) :- phosphosite("ABL1(T735)").
0.1655650242::p_fc("ANXA2P2(Y24)", "AC220", dec); 0.1655650242::p_fc("ANXA2P2(Y24)", "AC220", inc) :- phosphosite("ANXA2P2(Y24)").
0.4767306433::p_fc("ANXA2P2(Y24)", "AT13148", dec); 0.4767306433::p_fc("ANXA2P2(Y24)", "AT13148", inc) :- phosphosite("ANXA2P2(Y24)").
0.449412709::p_fc("ANXA2P2(Y24)", "AZ20", dec); 0.449412709::p_fc("ANXA2P2(Y24)", "AZ20", inc) :- phosphosite("ANXA2P2(Y24)").
0.1359820136::p_fc("ANXA2P2(Y24)", "AZD1480", dec); 0.1359820136::p_fc("ANXA2P2(Y24)", "AZD1480", inc) :- phosphosite("ANXA2P2(Y24)").
0.3508322301::p_fc("ANXA2P2(Y24)", "AZD3759", dec); 0.3508322301::p_fc("ANXA2P2(Y24)", "AZD3759", inc) :- phosphosite("ANXA2P2(Y24)").
0.0572422502::p_fc("ANXA2P2(Y24)", "AZD5363", dec); 0.0572422502::p_fc("ANXA2P2(Y24)", "AZD5363", inc) :- phosphosite("ANXA2P2(Y24)").
0.1362761166::p_fc("ANXA2P2(Y24)", "AZD5438", dec); 0.1362761166::p_fc("ANXA2P2(Y24)", "AZD5438", inc) :- phosphosite("ANXA2P2(Y24)").
0.1537719067::p_fc("ANXA2P2(Y24)", "AZD6482", dec); 0.1537719067::p_fc("ANXA2P2(Y24)", "AZD6482", inc) :- phosphosite("ANXA2P2(Y24)").
0.3476400343::p_fc("ANXA2P2(Y24)", "AZD6738", dec); 0.3476400343::p_fc("ANXA2P2(Y24)", "AZD6738", inc) :- phosphosite("ANXA2P2(Y24)").
0.0273060542::p_fc("ANXA2P2(Y24)", "AZD8055", dec); 0.0273060542::p_fc("ANXA2P2(Y24)", "AZD8055", inc) :- phosphosite("ANXA2P2(Y24)").
0.3773503623::p_fc("ANXA2P2(Y24)", "Amuvatinib", dec); 0.3773503623::p_fc("ANXA2P2(Y24)", "Amuvatinib", inc) :- phosphosite("ANXA2P2(Y24)").
0.0935687102::p_fc("ANXA2P2(Y24)", "BX912", dec); 0.0935687102::p_fc("ANXA2P2(Y24)", "BX912", inc) :- phosphosite("ANXA2P2(Y24)").
0.2942993606::p_fc("ANXA2P2(Y24)", "Bosutinib", dec); 0.2942993606::p_fc("ANXA2P2(Y24)", "Bosutinib", inc) :- phosphosite("ANXA2P2(Y24)").
0.0103360483::p_fc("ANXA2P2(Y24)", "CAL101", dec); 0.0103360483::p_fc("ANXA2P2(Y24)", "CAL101", inc) :- phosphosite("ANXA2P2(Y24)").
0.0884745185::p_fc("ANXA2P2(Y24)", "CHIR99021", dec); 0.0884745185::p_fc("ANXA2P2(Y24)", "CHIR99021", inc) :- phosphosite("ANXA2P2(Y24)").
0.4384922763::p_fc("ANXA2P2(Y24)", "CX4945", dec); 0.4384922763::p_fc("ANXA2P2(Y24)", "CX4945", inc) :- phosphosite("ANXA2P2(Y24)").
0.1383829056::p_fc("ANXA2P2(Y24)", "DNAPK", dec); 0.1383829056::p_fc("ANXA2P2(Y24)", "DNAPK", inc) :- phosphosite("ANXA2P2(Y24)").
0.1718574953::p_fc("ANXA2P2(Y24)", "Dabrafenib", dec); 0.1718574953::p_fc("ANXA2P2(Y24)", "Dabrafenib", inc) :- phosphosite("ANXA2P2(Y24)").
0.2284976388::p_fc("ANXA2P2(Y24)", "Dasatinib", dec); 0.2284976388::p_fc("ANXA2P2(Y24)", "Dasatinib", inc) :- phosphosite("ANXA2P2(Y24)").
0.204993824::p_fc("ANXA2P2(Y24)", "Edelfosine", dec); 0.204993824::p_fc("ANXA2P2(Y24)", "Edelfosine", inc) :- phosphosite("ANXA2P2(Y24)").
0.0962238791::p_fc("ANXA2P2(Y24)", "FRAX486", dec); 0.0962238791::p_fc("ANXA2P2(Y24)", "FRAX486", inc) :- phosphosite("ANXA2P2(Y24)").
0.0012195977::p_fc("ANXA2P2(Y24)", "GDC0941", dec); 0.0012195977::p_fc("ANXA2P2(Y24)", "GDC0941", inc) :- phosphosite("ANXA2P2(Y24)").
0.4891943757::p_fc("ANXA2P2(Y24)", "GDC0994", dec); 0.4891943757::p_fc("ANXA2P2(Y24)", "GDC0994", inc) :- phosphosite("ANXA2P2(Y24)").
0.2358742487::p_fc("ANXA2P2(Y24)", "GF109203X", dec); 0.2358742487::p_fc("ANXA2P2(Y24)", "GF109203X", inc) :- phosphosite("ANXA2P2(Y24)").
0.0329548471::p_fc("ANXA2P2(Y24)", "GO6983", dec); 0.0329548471::p_fc("ANXA2P2(Y24)", "GO6983", inc) :- phosphosite("ANXA2P2(Y24)").
0.0085097231::p_fc("ANXA2P2(Y24)", "GSK2334470", dec); 0.0085097231::p_fc("ANXA2P2(Y24)", "GSK2334470", inc) :- phosphosite("ANXA2P2(Y24)").
0.291535556::p_fc("ANXA2P2(Y24)", "GSK690693", dec); 0.291535556::p_fc("ANXA2P2(Y24)", "GSK690693", inc) :- phosphosite("ANXA2P2(Y24)").
0.275723623::p_fc("ANXA2P2(Y24)", "Go6976", dec); 0.275723623::p_fc("ANXA2P2(Y24)", "Go6976", inc) :- phosphosite("ANXA2P2(Y24)").
0.465481404::p_fc("ANXA2P2(Y24)", "H89", dec); 0.465481404::p_fc("ANXA2P2(Y24)", "H89", inc) :- phosphosite("ANXA2P2(Y24)").
0.0229648054::p_fc("ANXA2P2(Y24)", "HS173", dec); 0.0229648054::p_fc("ANXA2P2(Y24)", "HS173", inc) :- phosphosite("ANXA2P2(Y24)").
0.0245751519::p_fc("ANXA2P2(Y24)", "Ipatasertib", dec); 0.0245751519::p_fc("ANXA2P2(Y24)", "Ipatasertib", inc) :- phosphosite("ANXA2P2(Y24)").
0.1490074092::p_fc("ANXA2P2(Y24)", "JNJ", dec); 0.1490074092::p_fc("ANXA2P2(Y24)", "JNJ", inc) :- phosphosite("ANXA2P2(Y24)").
0.1908062485::p_fc("ANXA2P2(Y24)", "JNK", dec); 0.1908062485::p_fc("ANXA2P2(Y24)", "JNK", inc) :- phosphosite("ANXA2P2(Y24)").
0.0658967238::p_fc("ANXA2P2(Y24)", "KD025", dec); 0.0658967238::p_fc("ANXA2P2(Y24)", "KD025", inc) :- phosphosite("ANXA2P2(Y24)").
0.2334299187::p_fc("ANXA2P2(Y24)", "KN62", dec); 0.2334299187::p_fc("ANXA2P2(Y24)", "KN62", inc) :- phosphosite("ANXA2P2(Y24)").
0.1061471669::p_fc("ANXA2P2(Y24)", "KN93", dec); 0.1061471669::p_fc("ANXA2P2(Y24)", "KN93", inc) :- phosphosite("ANXA2P2(Y24)").
0.3547160484::p_fc("ANXA2P2(Y24)", "Ku0063794", dec); 0.3547160484::p_fc("ANXA2P2(Y24)", "Ku0063794", inc) :- phosphosite("ANXA2P2(Y24)").
0.0159244179::p_fc("ANXA2P2(Y24)", "LY2090314", dec); 0.0159244179::p_fc("ANXA2P2(Y24)", "LY2090314", inc) :- phosphosite("ANXA2P2(Y24)").
0.3790313567::p_fc("ANXA2P2(Y24)", "LY2584702", dec); 0.3790313567::p_fc("ANXA2P2(Y24)", "LY2584702", inc) :- phosphosite("ANXA2P2(Y24)").
0.4660766189::p_fc("ANXA2P2(Y24)", "LY2835219", dec); 0.4660766189::p_fc("ANXA2P2(Y24)", "LY2835219", inc) :- phosphosite("ANXA2P2(Y24)").
0.2119513984::p_fc("ANXA2P2(Y24)", "Linsitinib", dec); 0.2119513984::p_fc("ANXA2P2(Y24)", "Linsitinib", inc) :- phosphosite("ANXA2P2(Y24)").
0.3010052032::p_fc("ANXA2P2(Y24)", "MK2206", dec); 0.3010052032::p_fc("ANXA2P2(Y24)", "MK2206", inc) :- phosphosite("ANXA2P2(Y24)").
0.4367589456::p_fc("ANXA2P2(Y24)", "NU7441", dec); 0.4367589456::p_fc("ANXA2P2(Y24)", "NU7441", inc) :- phosphosite("ANXA2P2(Y24)").
0.2706200082::p_fc("ANXA2P2(Y24)", "PD153035", dec); 0.2706200082::p_fc("ANXA2P2(Y24)", "PD153035", inc) :- phosphosite("ANXA2P2(Y24)").
0.3075764048::p_fc("ANXA2P2(Y24)", "PF3758309", dec); 0.3075764048::p_fc("ANXA2P2(Y24)", "PF3758309", inc) :- phosphosite("ANXA2P2(Y24)").
0.1560311061::p_fc("ANXA2P2(Y24)", "PF4708671", dec); 0.1560311061::p_fc("ANXA2P2(Y24)", "PF4708671", inc) :- phosphosite("ANXA2P2(Y24)").
0.3123182196::p_fc("ANXA2P2(Y24)", "PH797804", dec); 0.3123182196::p_fc("ANXA2P2(Y24)", "PH797804", inc) :- phosphosite("ANXA2P2(Y24)").
0.0699332026::p_fc("ANXA2P2(Y24)", "PIK294", dec); 0.0699332026::p_fc("ANXA2P2(Y24)", "PIK294", inc) :- phosphosite("ANXA2P2(Y24)").
0.3898958138::p_fc("ANXA2P2(Y24)", "Ribociclib", dec); 0.3898958138::p_fc("ANXA2P2(Y24)", "Ribociclib", inc) :- phosphosite("ANXA2P2(Y24)").
0.2130255218::p_fc("ANXA2P2(Y24)", "Ripasudil", dec); 0.2130255218::p_fc("ANXA2P2(Y24)", "Ripasudil", inc) :- phosphosite("ANXA2P2(Y24)").
0.2705990163::p_fc("ANXA2P2(Y24)", "SP600125", dec); 0.2705990163::p_fc("ANXA2P2(Y24)", "SP600125", inc) :- phosphosite("ANXA2P2(Y24)").
0.2034550908::p_fc("ANXA2P2(Y24)", "Selumetinib", dec); 0.2034550908::p_fc("ANXA2P2(Y24)", "Selumetinib", inc) :- phosphosite("ANXA2P2(Y24)").
0.0890967407::p_fc("ANXA2P2(Y24)", "TAK715", dec); 0.0890967407::p_fc("ANXA2P2(Y24)", "TAK715", inc) :- phosphosite("ANXA2P2(Y24)").
0.1613905158::p_fc("ANXA2P2(Y24)", "TBCA", dec); 0.1613905158::p_fc("ANXA2P2(Y24)", "TBCA", inc) :- phosphosite("ANXA2P2(Y24)").
0.3781953136::p_fc("ANXA2P2(Y24)", "TGX221", dec); 0.3781953136::p_fc("ANXA2P2(Y24)", "TGX221", inc) :- phosphosite("ANXA2P2(Y24)").
0.2020228765::p_fc("ANXA2P2(Y24)", "Tofacitinib", dec); 0.2020228765::p_fc("ANXA2P2(Y24)", "Tofacitinib", inc) :- phosphosite("ANXA2P2(Y24)").
0.4526703131::p_fc("ANXA2P2(Y24)", "Torin", dec); 0.4526703131::p_fc("ANXA2P2(Y24)", "Torin", inc) :- phosphosite("ANXA2P2(Y24)").
0.1388565418::p_fc("ANXA2P2(Y24)", "Trametinib", dec); 0.1388565418::p_fc("ANXA2P2(Y24)", "Trametinib", inc) :- phosphosite("ANXA2P2(Y24)").
0.1057848092::p_fc("ANXA2P2(Y24)", "U73122", dec); 0.1057848092::p_fc("ANXA2P2(Y24)", "U73122", inc) :- phosphosite("ANXA2P2(Y24)").
0.3612066375::p_fc("ANXA2P2(Y24)", "Ulixertinib", dec); 0.3612066375::p_fc("ANXA2P2(Y24)", "Ulixertinib", inc) :- phosphosite("ANXA2P2(Y24)").
0.2413419626::p_fc("ANXA2P2(Y24)", "Vemurafenib", dec); 0.2413419626::p_fc("ANXA2P2(Y24)", "Vemurafenib", inc) :- phosphosite("ANXA2P2(Y24)").
0.0771062912::p_fc("ATF1(S198)", "AC220", dec); 0.0771062912::p_fc("ATF1(S198)", "AC220", inc) :- phosphosite("ATF1(S198)").
0.39632183::p_fc("ATF1(S198)", "AT13148", dec); 0.39632183::p_fc("ATF1(S198)", "AT13148", inc) :- phosphosite("ATF1(S198)").
0.0786843181::p_fc("ATF1(S198)", "AZ20", dec); 0.0786843181::p_fc("ATF1(S198)", "AZ20", inc) :- phosphosite("ATF1(S198)").
0.4845769423::p_fc("ATF1(S198)", "AZD1480", dec); 0.4845769423::p_fc("ATF1(S198)", "AZD1480", inc) :- phosphosite("ATF1(S198)").
0.3533267473::p_fc("ATF1(S198)", "AZD3759", dec); 0.3533267473::p_fc("ATF1(S198)", "AZD3759", inc) :- phosphosite("ATF1(S198)").
0.4325643816::p_fc("ATF1(S198)", "AZD5363", dec); 0.4325643816::p_fc("ATF1(S198)", "AZD5363", inc) :- phosphosite("ATF1(S198)").
0.0012238065::p_fc("ATF1(S198)", "AZD5438", dec); 0.0012238065::p_fc("ATF1(S198)", "AZD5438", inc) :- phosphosite("ATF1(S198)").
0.2344211221::p_fc("ATF1(S198)", "AZD6482", dec); 0.2344211221::p_fc("ATF1(S198)", "AZD6482", inc) :- phosphosite("ATF1(S198)").
0.0644169499::p_fc("ATF1(S198)", "AZD6738", dec); 0.0644169499::p_fc("ATF1(S198)", "AZD6738", inc) :- phosphosite("ATF1(S198)").
0.1865767913::p_fc("ATF1(S198)", "AZD8055", dec); 0.1865767913::p_fc("ATF1(S198)", "AZD8055", inc) :- phosphosite("ATF1(S198)").
0.2625411826::p_fc("ATF1(S198)", "Amuvatinib", dec); 0.2625411826::p_fc("ATF1(S198)", "Amuvatinib", inc) :- phosphosite("ATF1(S198)").
0.1708424632::p_fc("ATF1(S198)", "BX912", dec); 0.1708424632::p_fc("ATF1(S198)", "BX912", inc) :- phosphosite("ATF1(S198)").
0.4396852387::p_fc("ATF1(S198)", "Bosutinib", dec); 0.4396852387::p_fc("ATF1(S198)", "Bosutinib", inc) :- phosphosite("ATF1(S198)").
0.4972726888::p_fc("ATF1(S198)", "CAL101", dec); 0.4972726888::p_fc("ATF1(S198)", "CAL101", inc) :- phosphosite("ATF1(S198)").
0.4722498639::p_fc("ATF1(S198)", "CHIR99021", dec); 0.4722498639::p_fc("ATF1(S198)", "CHIR99021", inc) :- phosphosite("ATF1(S198)").
0.1787638214::p_fc("ATF1(S198)", "CX4945", dec); 0.1787638214::p_fc("ATF1(S198)", "CX4945", inc) :- phosphosite("ATF1(S198)").
0.4059591265::p_fc("ATF1(S198)", "DNAPK", dec); 0.4059591265::p_fc("ATF1(S198)", "DNAPK", inc) :- phosphosite("ATF1(S198)").
0.3809739956::p_fc("ATF1(S198)", "Dabrafenib", dec); 0.3809739956::p_fc("ATF1(S198)", "Dabrafenib", inc) :- phosphosite("ATF1(S198)").
0.3680580935::p_fc("ATF1(S198)", "Dasatinib", dec); 0.3680580935::p_fc("ATF1(S198)", "Dasatinib", inc) :- phosphosite("ATF1(S198)").
0.4022943922::p_fc("ATF1(S198)", "Edelfosine", dec); 0.4022943922::p_fc("ATF1(S198)", "Edelfosine", inc) :- phosphosite("ATF1(S198)").
0.2863315475::p_fc("ATF1(S198)", "FRAX486", dec); 0.2863315475::p_fc("ATF1(S198)", "FRAX486", inc) :- phosphosite("ATF1(S198)").
0.48922472::p_fc("ATF1(S198)", "GDC0941", dec); 0.48922472::p_fc("ATF1(S198)", "GDC0941", inc) :- phosphosite("ATF1(S198)").
0.4117972208::p_fc("ATF1(S198)", "GDC0994", dec); 0.4117972208::p_fc("ATF1(S198)", "GDC0994", inc) :- phosphosite("ATF1(S198)").
0.4619434944::p_fc("ATF1(S198)", "GF109203X", dec); 0.4619434944::p_fc("ATF1(S198)", "GF109203X", inc) :- phosphosite("ATF1(S198)").
0.2775689114::p_fc("ATF1(S198)", "GO6983", dec); 0.2775689114::p_fc("ATF1(S198)", "GO6983", inc) :- phosphosite("ATF1(S198)").
0.4799369053::p_fc("ATF1(S198)", "GSK2334470", dec); 0.4799369053::p_fc("ATF1(S198)", "GSK2334470", inc) :- phosphosite("ATF1(S198)").
0.2444289952::p_fc("ATF1(S198)", "GSK690693", dec); 0.2444289952::p_fc("ATF1(S198)", "GSK690693", inc) :- phosphosite("ATF1(S198)").
0.278818309::p_fc("ATF1(S198)", "Go6976", dec); 0.278818309::p_fc("ATF1(S198)", "Go6976", inc) :- phosphosite("ATF1(S198)").
0.3970139288::p_fc("ATF1(S198)", "H89", dec); 0.3970139288::p_fc("ATF1(S198)", "H89", inc) :- phosphosite("ATF1(S198)").
0.0780541181::p_fc("ATF1(S198)", "HS173", dec); 0.0780541181::p_fc("ATF1(S198)", "HS173", inc) :- phosphosite("ATF1(S198)").
0.389482799::p_fc("ATF1(S198)", "Ipatasertib", dec); 0.389482799::p_fc("ATF1(S198)", "Ipatasertib", inc) :- phosphosite("ATF1(S198)").
0.3679927205::p_fc("ATF1(S198)", "JNJ", dec); 0.3679927205::p_fc("ATF1(S198)", "JNJ", inc) :- phosphosite("ATF1(S198)").
0.1025745894::p_fc("ATF1(S198)", "JNK", dec); 0.1025745894::p_fc("ATF1(S198)", "JNK", inc) :- phosphosite("ATF1(S198)").
0.0206173973::p_fc("ATF1(S198)", "KD025", dec); 0.0206173973::p_fc("ATF1(S198)", "KD025", inc) :- phosphosite("ATF1(S198)").
0.1724013019::p_fc("ATF1(S198)", "KN62", dec); 0.1724013019::p_fc("ATF1(S198)", "KN62", inc) :- phosphosite("ATF1(S198)").
0.4961354831::p_fc("ATF1(S198)", "KN93", dec); 0.4961354831::p_fc("ATF1(S198)", "KN93", inc) :- phosphosite("ATF1(S198)").
0.1088429723::p_fc("ATF1(S198)", "Ku0063794", dec); 0.1088429723::p_fc("ATF1(S198)", "Ku0063794", inc) :- phosphosite("ATF1(S198)").
0.1411393736::p_fc("ATF1(S198)", "LY2090314", dec); 0.1411393736::p_fc("ATF1(S198)", "LY2090314", inc) :- phosphosite("ATF1(S198)").
0.3343303311::p_fc("ATF1(S198)", "LY2584702", dec); 0.3343303311::p_fc("ATF1(S198)", "LY2584702", inc) :- phosphosite("ATF1(S198)").
0.0392553643::p_fc("ATF1(S198)", "LY2835219", dec); 0.0392553643::p_fc("ATF1(S198)", "LY2835219", inc) :- phosphosite("ATF1(S198)").
0.0729509839::p_fc("ATF1(S198)", "Linsitinib", dec); 0.0729509839::p_fc("ATF1(S198)", "Linsitinib", inc) :- phosphosite("ATF1(S198)").
0.2382642941::p_fc("ATF1(S198)", "MK2206", dec); 0.2382642941::p_fc("ATF1(S198)", "MK2206", inc) :- phosphosite("ATF1(S198)").
0.4412244941::p_fc("ATF1(S198)", "NU7441", dec); 0.4412244941::p_fc("ATF1(S198)", "NU7441", inc) :- phosphosite("ATF1(S198)").
0.0147793591::p_fc("ATF1(S198)", "PD153035", dec); 0.0147793591::p_fc("ATF1(S198)", "PD153035", inc) :- phosphosite("ATF1(S198)").
0.0457586099::p_fc("ATF1(S198)", "PF3758309", dec); 0.0457586099::p_fc("ATF1(S198)", "PF3758309", inc) :- phosphosite("ATF1(S198)").
0.4695304193::p_fc("ATF1(S198)", "PF4708671", dec); 0.4695304193::p_fc("ATF1(S198)", "PF4708671", inc) :- phosphosite("ATF1(S198)").
0.4582872469::p_fc("ATF1(S198)", "PH797804", dec); 0.4582872469::p_fc("ATF1(S198)", "PH797804", inc) :- phosphosite("ATF1(S198)").
0.2548136001::p_fc("ATF1(S198)", "PIK294", dec); 0.2548136001::p_fc("ATF1(S198)", "PIK294", inc) :- phosphosite("ATF1(S198)").
0.2921983793::p_fc("ATF1(S198)", "Ribociclib", dec); 0.2921983793::p_fc("ATF1(S198)", "Ribociclib", inc) :- phosphosite("ATF1(S198)").
0.3134197725::p_fc("ATF1(S198)", "Ripasudil", dec); 0.3134197725::p_fc("ATF1(S198)", "Ripasudil", inc) :- phosphosite("ATF1(S198)").
0.4394847052::p_fc("ATF1(S198)", "SP600125", dec); 0.4394847052::p_fc("ATF1(S198)", "SP600125", inc) :- phosphosite("ATF1(S198)").
0.3827232718::p_fc("ATF1(S198)", "Selumetinib", dec); 0.3827232718::p_fc("ATF1(S198)", "Selumetinib", inc) :- phosphosite("ATF1(S198)").
0.2680524026::p_fc("ATF1(S198)", "TAK715", dec); 0.2680524026::p_fc("ATF1(S198)", "TAK715", inc) :- phosphosite("ATF1(S198)").
0.4021250658::p_fc("ATF1(S198)", "TBCA", dec); 0.4021250658::p_fc("ATF1(S198)", "TBCA", inc) :- phosphosite("ATF1(S198)").
0.3319072135::p_fc("ATF1(S198)", "TGX221", dec); 0.3319072135::p_fc("ATF1(S198)", "TGX221", inc) :- phosphosite("ATF1(S198)").
0.4552086191::p_fc("ATF1(S198)", "Tofacitinib", dec); 0.4552086191::p_fc("ATF1(S198)", "Tofacitinib", inc) :- phosphosite("ATF1(S198)").
0.255006964::p_fc("ATF1(S198)", "Torin", dec); 0.255006964::p_fc("ATF1(S198)", "Torin", inc) :- phosphosite("ATF1(S198)").
0.3525538872::p_fc("ATF1(S198)", "Trametinib", dec); 0.3525538872::p_fc("ATF1(S198)", "Trametinib", inc) :- phosphosite("ATF1(S198)").
0.1028754556::p_fc("ATF1(S198)", "U73122", dec); 0.1028754556::p_fc("ATF1(S198)", "U73122", inc) :- phosphosite("ATF1(S198)").
0.1409261149::p_fc("ATF1(S198)", "Ulixertinib", dec); 0.1409261149::p_fc("ATF1(S198)", "Ulixertinib", inc) :- phosphosite("ATF1(S198)").
0.3395710084::p_fc("ATF1(S198)", "Vemurafenib", dec); 0.3395710084::p_fc("ATF1(S198)", "Vemurafenib", inc) :- phosphosite("ATF1(S198)").
0.0288358703::p_fc("BCLAF1(Y284)", "AC220", dec); 0.0288358703::p_fc("BCLAF1(Y284)", "AC220", inc) :- phosphosite("BCLAF1(Y284)").
0.0136961938::p_fc("BCLAF1(Y284)", "AT13148", dec); 0.0136961938::p_fc("BCLAF1(Y284)", "AT13148", inc) :- phosphosite("BCLAF1(Y284)").
0.0506522617::p_fc("BCLAF1(Y284)", "AZ20", dec); 0.0506522617::p_fc("BCLAF1(Y284)", "AZ20", inc) :- phosphosite("BCLAF1(Y284)").
0.066691319::p_fc("BCLAF1(Y284)", "AZD1480", dec); 0.066691319::p_fc("BCLAF1(Y284)", "AZD1480", inc) :- phosphosite("BCLAF1(Y284)").
0.3438674006::p_fc("BCLAF1(Y284)", "AZD3759", dec); 0.3438674006::p_fc("BCLAF1(Y284)", "AZD3759", inc) :- phosphosite("BCLAF1(Y284)").
0.1920992553::p_fc("BCLAF1(Y284)", "AZD5363", dec); 0.1920992553::p_fc("BCLAF1(Y284)", "AZD5363", inc) :- phosphosite("BCLAF1(Y284)").
0.0576603831::p_fc("BCLAF1(Y284)", "AZD5438", dec); 0.0576603831::p_fc("BCLAF1(Y284)", "AZD5438", inc) :- phosphosite("BCLAF1(Y284)").
0.0057376471::p_fc("BCLAF1(Y284)", "AZD6482", dec); 0.0057376471::p_fc("BCLAF1(Y284)", "AZD6482", inc) :- phosphosite("BCLAF1(Y284)").
0.4858069966::p_fc("BCLAF1(Y284)", "AZD6738", dec); 0.4858069966::p_fc("BCLAF1(Y284)", "AZD6738", inc) :- phosphosite("BCLAF1(Y284)").
0.0113456805::p_fc("BCLAF1(Y284)", "AZD8055", dec); 0.0113456805::p_fc("BCLAF1(Y284)", "AZD8055", inc) :- phosphosite("BCLAF1(Y284)").
0.4719158051::p_fc("BCLAF1(Y284)", "Amuvatinib", dec); 0.4719158051::p_fc("BCLAF1(Y284)", "Amuvatinib", inc) :- phosphosite("BCLAF1(Y284)").
0.0217897278::p_fc("BCLAF1(Y284)", "BX912", dec); 0.0217897278::p_fc("BCLAF1(Y284)", "BX912", inc) :- phosphosite("BCLAF1(Y284)").
0.1120626137::p_fc("BCLAF1(Y284)", "Bosutinib", dec); 0.1120626137::p_fc("BCLAF1(Y284)", "Bosutinib", inc) :- phosphosite("BCLAF1(Y284)").
0.3306847892::p_fc("BCLAF1(Y284)", "CAL101", dec); 0.3306847892::p_fc("BCLAF1(Y284)", "CAL101", inc) :- phosphosite("BCLAF1(Y284)").
0.055408603::p_fc("BCLAF1(Y284)", "CHIR99021", dec); 0.055408603::p_fc("BCLAF1(Y284)", "CHIR99021", inc) :- phosphosite("BCLAF1(Y284)").
0.000999103::p_fc("BCLAF1(Y284)", "CX4945", dec); 0.000999103::p_fc("BCLAF1(Y284)", "CX4945", inc) :- phosphosite("BCLAF1(Y284)").
0.3982419529::p_fc("BCLAF1(Y284)", "DNAPK", dec); 0.3982419529::p_fc("BCLAF1(Y284)", "DNAPK", inc) :- phosphosite("BCLAF1(Y284)").
0.0427214813::p_fc("BCLAF1(Y284)", "Dabrafenib", dec); 0.0427214813::p_fc("BCLAF1(Y284)", "Dabrafenib", inc) :- phosphosite("BCLAF1(Y284)").
0.002428287::p_fc("BCLAF1(Y284)", "Dasatinib", dec); 0.002428287::p_fc("BCLAF1(Y284)", "Dasatinib", inc) :- phosphosite("BCLAF1(Y284)").
0.0009970691::p_fc("BCLAF1(Y284)", "Edelfosine", dec); 0.0009970691::p_fc("BCLAF1(Y284)", "Edelfosine", inc) :- phosphosite("BCLAF1(Y284)").
0.3077196733::p_fc("BCLAF1(Y284)", "FRAX486", dec); 0.3077196733::p_fc("BCLAF1(Y284)", "FRAX486", inc) :- phosphosite("BCLAF1(Y284)").
0.0009970126::p_fc("BCLAF1(Y284)", "GDC0941", dec); 0.0009970126::p_fc("BCLAF1(Y284)", "GDC0941", inc) :- phosphosite("BCLAF1(Y284)").
0.0865024273::p_fc("BCLAF1(Y284)", "GDC0994", dec); 0.0865024273::p_fc("BCLAF1(Y284)", "GDC0994", inc) :- phosphosite("BCLAF1(Y284)").
0.1505456502::p_fc("BCLAF1(Y284)", "GF109203X", dec); 0.1505456502::p_fc("BCLAF1(Y284)", "GF109203X", inc) :- phosphosite("BCLAF1(Y284)").
0.0009970163::p_fc("BCLAF1(Y284)", "GO6983", dec); 0.0009970163::p_fc("BCLAF1(Y284)", "GO6983", inc) :- phosphosite("BCLAF1(Y284)").
0.0028805981::p_fc("BCLAF1(Y284)", "GSK2334470", dec); 0.0028805981::p_fc("BCLAF1(Y284)", "GSK2334470", inc) :- phosphosite("BCLAF1(Y284)").
0.2231519129::p_fc("BCLAF1(Y284)", "GSK690693", dec); 0.2231519129::p_fc("BCLAF1(Y284)", "GSK690693", inc) :- phosphosite("BCLAF1(Y284)").
0.0010376249::p_fc("BCLAF1(Y284)", "Go6976", dec); 0.0010376249::p_fc("BCLAF1(Y284)", "Go6976", inc) :- phosphosite("BCLAF1(Y284)").
0.424872245::p_fc("BCLAF1(Y284)", "H89", dec); 0.424872245::p_fc("BCLAF1(Y284)", "H89", inc) :- phosphosite("BCLAF1(Y284)").
0.4709447998::p_fc("BCLAF1(Y284)", "HS173", dec); 0.4709447998::p_fc("BCLAF1(Y284)", "HS173", inc) :- phosphosite("BCLAF1(Y284)").
0.053225043::p_fc("BCLAF1(Y284)", "Ipatasertib", dec); 0.053225043::p_fc("BCLAF1(Y284)", "Ipatasertib", inc) :- phosphosite("BCLAF1(Y284)").
0.4531726877::p_fc("BCLAF1(Y284)", "JNJ", dec); 0.4531726877::p_fc("BCLAF1(Y284)", "JNJ", inc) :- phosphosite("BCLAF1(Y284)").
0.40653579::p_fc("BCLAF1(Y284)", "JNK", dec); 0.40653579::p_fc("BCLAF1(Y284)", "JNK", inc) :- phosphosite("BCLAF1(Y284)").
0.258996207::p_fc("BCLAF1(Y284)", "KD025", dec); 0.258996207::p_fc("BCLAF1(Y284)", "KD025", inc) :- phosphosite("BCLAF1(Y284)").
0.0550491621::p_fc("BCLAF1(Y284)", "KN62", dec); 0.0550491621::p_fc("BCLAF1(Y284)", "KN62", inc) :- phosphosite("BCLAF1(Y284)").
0.0009970066::p_fc("BCLAF1(Y284)", "KN93", dec); 0.0009970066::p_fc("BCLAF1(Y284)", "KN93", inc) :- phosphosite("BCLAF1(Y284)").
0.1113606717::p_fc("BCLAF1(Y284)", "Ku0063794", dec); 0.1113606717::p_fc("BCLAF1(Y284)", "Ku0063794", inc) :- phosphosite("BCLAF1(Y284)").
0.0047297518::p_fc("BCLAF1(Y284)", "LY2090314", dec); 0.0047297518::p_fc("BCLAF1(Y284)", "LY2090314", inc) :- phosphosite("BCLAF1(Y284)").
0.0017833565::p_fc("BCLAF1(Y284)", "LY2584702", dec); 0.0017833565::p_fc("BCLAF1(Y284)", "LY2584702", inc) :- phosphosite("BCLAF1(Y284)").
0.2934867766::p_fc("BCLAF1(Y284)", "LY2835219", dec); 0.2934867766::p_fc("BCLAF1(Y284)", "LY2835219", inc) :- phosphosite("BCLAF1(Y284)").
0.0611639911::p_fc("BCLAF1(Y284)", "Linsitinib", dec); 0.0611639911::p_fc("BCLAF1(Y284)", "Linsitinib", inc) :- phosphosite("BCLAF1(Y284)").
0.0318069211::p_fc("BCLAF1(Y284)", "MK2206", dec); 0.0318069211::p_fc("BCLAF1(Y284)", "MK2206", inc) :- phosphosite("BCLAF1(Y284)").
0.1132517613::p_fc("BCLAF1(Y284)", "NU7441", dec); 0.1132517613::p_fc("BCLAF1(Y284)", "NU7441", inc) :- phosphosite("BCLAF1(Y284)").
0.2834056714::p_fc("BCLAF1(Y284)", "PD153035", dec); 0.2834056714::p_fc("BCLAF1(Y284)", "PD153035", inc) :- phosphosite("BCLAF1(Y284)").
0.4546597722::p_fc("BCLAF1(Y284)", "PF3758309", dec); 0.4546597722::p_fc("BCLAF1(Y284)", "PF3758309", inc) :- phosphosite("BCLAF1(Y284)").
0.2913471181::p_fc("BCLAF1(Y284)", "PF4708671", dec); 0.2913471181::p_fc("BCLAF1(Y284)", "PF4708671", inc) :- phosphosite("BCLAF1(Y284)").
0.3303609257::p_fc("BCLAF1(Y284)", "PH797804", dec); 0.3303609257::p_fc("BCLAF1(Y284)", "PH797804", inc) :- phosphosite("BCLAF1(Y284)").
0.2877863378::p_fc("BCLAF1(Y284)", "PIK294", dec); 0.2877863378::p_fc("BCLAF1(Y284)", "PIK294", inc) :- phosphosite("BCLAF1(Y284)").
0.0132085522::p_fc("BCLAF1(Y284)", "Ribociclib", dec); 0.0132085522::p_fc("BCLAF1(Y284)", "Ribociclib", inc) :- phosphosite("BCLAF1(Y284)").
0.0075776591::p_fc("BCLAF1(Y284)", "Ripasudil", dec); 0.0075776591::p_fc("BCLAF1(Y284)", "Ripasudil", inc) :- phosphosite("BCLAF1(Y284)").
0.0081168728::p_fc("BCLAF1(Y284)", "SP600125", dec); 0.0081168728::p_fc("BCLAF1(Y284)", "SP600125", inc) :- phosphosite("BCLAF1(Y284)").
0.0423118154::p_fc("BCLAF1(Y284)", "Selumetinib", dec); 0.0423118154::p_fc("BCLAF1(Y284)", "Selumetinib", inc) :- phosphosite("BCLAF1(Y284)").
0.0189026509::p_fc("BCLAF1(Y284)", "TAK715", dec); 0.0189026509::p_fc("BCLAF1(Y284)", "TAK715", inc) :- phosphosite("BCLAF1(Y284)").
0.0116506953::p_fc("BCLAF1(Y284)", "TBCA", dec); 0.0116506953::p_fc("BCLAF1(Y284)", "TBCA", inc) :- phosphosite("BCLAF1(Y284)").
0.1803839505::p_fc("BCLAF1(Y284)", "TGX221", dec); 0.1803839505::p_fc("BCLAF1(Y284)", "TGX221", inc) :- phosphosite("BCLAF1(Y284)").
0.1825579985::p_fc("BCLAF1(Y284)", "Tofacitinib", dec); 0.1825579985::p_fc("BCLAF1(Y284)", "Tofacitinib", inc) :- phosphosite("BCLAF1(Y284)").
0.2288993651::p_fc("BCLAF1(Y284)", "Torin", dec); 0.2288993651::p_fc("BCLAF1(Y284)", "Torin", inc) :- phosphosite("BCLAF1(Y284)").
0.3912778298::p_fc("BCLAF1(Y284)", "Trametinib", dec); 0.3912778298::p_fc("BCLAF1(Y284)", "Trametinib", inc) :- phosphosite("BCLAF1(Y284)").
0.0873361607::p_fc("BCLAF1(Y284)", "U73122", dec); 0.0873361607::p_fc("BCLAF1(Y284)", "U73122", inc) :- phosphosite("BCLAF1(Y284)").
0.445058897::p_fc("BCLAF1(Y284)", "Ulixertinib", dec); 0.445058897::p_fc("BCLAF1(Y284)", "Ulixertinib", inc) :- phosphosite("BCLAF1(Y284)").
0.0359324869::p_fc("BCLAF1(Y284)", "Vemurafenib", dec); 0.0359324869::p_fc("BCLAF1(Y284)", "Vemurafenib", inc) :- phosphosite("BCLAF1(Y284)").
0.1699283955::p_fc("HIPK2(Y361)", "AC220", dec); 0.1699283955::p_fc("HIPK2(Y361)", "AC220", inc) :- phosphosite("HIPK2(Y361)").
0.4729563144::p_fc("HIPK2(Y361)", "AT13148", dec); 0.4729563144::p_fc("HIPK2(Y361)", "AT13148", inc) :- phosphosite("HIPK2(Y361)").
0.0502044621::p_fc("HIPK2(Y361)", "AZ20", dec); 0.0502044621::p_fc("HIPK2(Y361)", "AZ20", inc) :- phosphosite("HIPK2(Y361)").
0.3266331976::p_fc("HIPK2(Y361)", "AZD1480", dec); 0.3266331976::p_fc("HIPK2(Y361)", "AZD1480", inc) :- phosphosite("HIPK2(Y361)").
0.0038628026::p_fc("HIPK2(Y361)", "AZD3759", dec); 0.0038628026::p_fc("HIPK2(Y361)", "AZD3759", inc) :- phosphosite("HIPK2(Y361)").
0.1271423723::p_fc("HIPK2(Y361)", "AZD5363", dec); 0.1271423723::p_fc("HIPK2(Y361)", "AZD5363", inc) :- phosphosite("HIPK2(Y361)").
0.2709498634::p_fc("HIPK2(Y361)", "AZD5438", dec); 0.2709498634::p_fc("HIPK2(Y361)", "AZD5438", inc) :- phosphosite("HIPK2(Y361)").
0.3929905615::p_fc("HIPK2(Y361)", "AZD6482", dec); 0.3929905615::p_fc("HIPK2(Y361)", "AZD6482", inc) :- phosphosite("HIPK2(Y361)").
0.28014346::p_fc("HIPK2(Y361)", "AZD6738", dec); 0.28014346::p_fc("HIPK2(Y361)", "AZD6738", inc) :- phosphosite("HIPK2(Y361)").
0.0010991321::p_fc("HIPK2(Y361)", "AZD8055", dec); 0.0010991321::p_fc("HIPK2(Y361)", "AZD8055", inc) :- phosphosite("HIPK2(Y361)").
0.0057683408::p_fc("HIPK2(Y361)", "Amuvatinib", dec); 0.0057683408::p_fc("HIPK2(Y361)", "Amuvatinib", inc) :- phosphosite("HIPK2(Y361)").
0.1858081996::p_fc("HIPK2(Y361)", "BX912", dec); 0.1858081996::p_fc("HIPK2(Y361)", "BX912", inc) :- phosphosite("HIPK2(Y361)").
0.1941303646::p_fc("HIPK2(Y361)", "Bosutinib", dec); 0.1941303646::p_fc("HIPK2(Y361)", "Bosutinib", inc) :- phosphosite("HIPK2(Y361)").
0.3458795105::p_fc("HIPK2(Y361)", "CAL101", dec); 0.3458795105::p_fc("HIPK2(Y361)", "CAL101", inc) :- phosphosite("HIPK2(Y361)").
0.1277767391::p_fc("HIPK2(Y361)", "CHIR99021", dec); 0.1277767391::p_fc("HIPK2(Y361)", "CHIR99021", inc) :- phosphosite("HIPK2(Y361)").
0.1268695539::p_fc("HIPK2(Y361)", "CX4945", dec); 0.1268695539::p_fc("HIPK2(Y361)", "CX4945", inc) :- phosphosite("HIPK2(Y361)").
0.4117952792::p_fc("HIPK2(Y361)", "DNAPK", dec); 0.4117952792::p_fc("HIPK2(Y361)", "DNAPK", inc) :- phosphosite("HIPK2(Y361)").
0.3086537518::p_fc("HIPK2(Y361)", "Dabrafenib", dec); 0.3086537518::p_fc("HIPK2(Y361)", "Dabrafenib", inc) :- phosphosite("HIPK2(Y361)").
0.4866994567::p_fc("HIPK2(Y361)", "Dasatinib", dec); 0.4866994567::p_fc("HIPK2(Y361)", "Dasatinib", inc) :- phosphosite("HIPK2(Y361)").
0.139017085::p_fc("HIPK2(Y361)", "Edelfosine", dec); 0.139017085::p_fc("HIPK2(Y361)", "Edelfosine", inc) :- phosphosite("HIPK2(Y361)").
0.2550333308::p_fc("HIPK2(Y361)", "FRAX486", dec); 0.2550333308::p_fc("HIPK2(Y361)", "FRAX486", inc) :- phosphosite("HIPK2(Y361)").
0.1012311719::p_fc("HIPK2(Y361)", "GDC0941", dec); 0.1012311719::p_fc("HIPK2(Y361)", "GDC0941", inc) :- phosphosite("HIPK2(Y361)").
0.1219101702::p_fc("HIPK2(Y361)", "GDC0994", dec); 0.1219101702::p_fc("HIPK2(Y361)", "GDC0994", inc) :- phosphosite("HIPK2(Y361)").
0.055759321::p_fc("HIPK2(Y361)", "GF109203X", dec); 0.055759321::p_fc("HIPK2(Y361)", "GF109203X", inc) :- phosphosite("HIPK2(Y361)").
0.1380298636::p_fc("HIPK2(Y361)", "GO6983", dec); 0.1380298636::p_fc("HIPK2(Y361)", "GO6983", inc) :- phosphosite("HIPK2(Y361)").
0.0011002467::p_fc("HIPK2(Y361)", "GSK2334470", dec); 0.0011002467::p_fc("HIPK2(Y361)", "GSK2334470", inc) :- phosphosite("HIPK2(Y361)").
0.1317615467::p_fc("HIPK2(Y361)", "GSK690693", dec); 0.1317615467::p_fc("HIPK2(Y361)", "GSK690693", inc) :- phosphosite("HIPK2(Y361)").
0.4016273093::p_fc("HIPK2(Y361)", "Go6976", dec); 0.4016273093::p_fc("HIPK2(Y361)", "Go6976", inc) :- phosphosite("HIPK2(Y361)").
0.3887712387::p_fc("HIPK2(Y361)", "H89", dec); 0.3887712387::p_fc("HIPK2(Y361)", "H89", inc) :- phosphosite("HIPK2(Y361)").
0.1213997886::p_fc("HIPK2(Y361)", "HS173", dec); 0.1213997886::p_fc("HIPK2(Y361)", "HS173", inc) :- phosphosite("HIPK2(Y361)").
0.1958130757::p_fc("HIPK2(Y361)", "Ipatasertib", dec); 0.1958130757::p_fc("HIPK2(Y361)", "Ipatasertib", inc) :- phosphosite("HIPK2(Y361)").
0.2702799082::p_fc("HIPK2(Y361)", "JNJ", dec); 0.2702799082::p_fc("HIPK2(Y361)", "JNJ", inc) :- phosphosite("HIPK2(Y361)").
0.1316174182::p_fc("HIPK2(Y361)", "JNK", dec); 0.1316174182::p_fc("HIPK2(Y361)", "JNK", inc) :- phosphosite("HIPK2(Y361)").
0.1443212178::p_fc("HIPK2(Y361)", "KD025", dec); 0.1443212178::p_fc("HIPK2(Y361)", "KD025", inc) :- phosphosite("HIPK2(Y361)").
0.1310786691::p_fc("HIPK2(Y361)", "KN62", dec); 0.1310786691::p_fc("HIPK2(Y361)", "KN62", inc) :- phosphosite("HIPK2(Y361)").
0.171251796::p_fc("HIPK2(Y361)", "KN93", dec); 0.171251796::p_fc("HIPK2(Y361)", "KN93", inc) :- phosphosite("HIPK2(Y361)").
0.0753870048::p_fc("HIPK2(Y361)", "Ku0063794", dec); 0.0753870048::p_fc("HIPK2(Y361)", "Ku0063794", inc) :- phosphosite("HIPK2(Y361)").
0.2607276552::p_fc("HIPK2(Y361)", "LY2090314", dec); 0.2607276552::p_fc("HIPK2(Y361)", "LY2090314", inc) :- phosphosite("HIPK2(Y361)").
0.2037083711::p_fc("HIPK2(Y361)", "LY2584702", dec); 0.2037083711::p_fc("HIPK2(Y361)", "LY2584702", inc) :- phosphosite("HIPK2(Y361)").
0.3646075255::p_fc("HIPK2(Y361)", "LY2835219", dec); 0.3646075255::p_fc("HIPK2(Y361)", "LY2835219", inc) :- phosphosite("HIPK2(Y361)").
0.0968929894::p_fc("HIPK2(Y361)", "Linsitinib", dec); 0.0968929894::p_fc("HIPK2(Y361)", "Linsitinib", inc) :- phosphosite("HIPK2(Y361)").
0.4151495937::p_fc("HIPK2(Y361)", "MK2206", dec); 0.4151495937::p_fc("HIPK2(Y361)", "MK2206", inc) :- phosphosite("HIPK2(Y361)").
0.2600103626::p_fc("HIPK2(Y361)", "NU7441", dec); 0.2600103626::p_fc("HIPK2(Y361)", "NU7441", inc) :- phosphosite("HIPK2(Y361)").
0.4173977632::p_fc("HIPK2(Y361)", "PD153035", dec); 0.4173977632::p_fc("HIPK2(Y361)", "PD153035", inc) :- phosphosite("HIPK2(Y361)").
0.0009970165::p_fc("HIPK2(Y361)", "PF3758309", dec); 0.0009970165::p_fc("HIPK2(Y361)", "PF3758309", inc) :- phosphosite("HIPK2(Y361)").
0.0744016783::p_fc("HIPK2(Y361)", "PF4708671", dec); 0.0744016783::p_fc("HIPK2(Y361)", "PF4708671", inc) :- phosphosite("HIPK2(Y361)").
0.2118009287::p_fc("HIPK2(Y361)", "PH797804", dec); 0.2118009287::p_fc("HIPK2(Y361)", "PH797804", inc) :- phosphosite("HIPK2(Y361)").
0.2528351715::p_fc("HIPK2(Y361)", "PIK294", dec); 0.2528351715::p_fc("HIPK2(Y361)", "PIK294", inc) :- phosphosite("HIPK2(Y361)").
0.1221467776::p_fc("HIPK2(Y361)", "Ribociclib", dec); 0.1221467776::p_fc("HIPK2(Y361)", "Ribociclib", inc) :- phosphosite("HIPK2(Y361)").
0.4292137637::p_fc("HIPK2(Y361)", "Ripasudil", dec); 0.4292137637::p_fc("HIPK2(Y361)", "Ripasudil", inc) :- phosphosite("HIPK2(Y361)").
0.1039648536::p_fc("HIPK2(Y361)", "SP600125", dec); 0.1039648536::p_fc("HIPK2(Y361)", "SP600125", inc) :- phosphosite("HIPK2(Y361)").
0.3849076628::p_fc("HIPK2(Y361)", "Selumetinib", dec); 0.3849076628::p_fc("HIPK2(Y361)", "Selumetinib", inc) :- phosphosite("HIPK2(Y361)").
0.2746554649::p_fc("HIPK2(Y361)", "TAK715", dec); 0.2746554649::p_fc("HIPK2(Y361)", "TAK715", inc) :- phosphosite("HIPK2(Y361)").
0.2510725087::p_fc("HIPK2(Y361)", "TBCA", dec); 0.2510725087::p_fc("HIPK2(Y361)", "TBCA", inc) :- phosphosite("HIPK2(Y361)").
0.3373226123::p_fc("HIPK2(Y361)", "TGX221", dec); 0.3373226123::p_fc("HIPK2(Y361)", "TGX221", inc) :- phosphosite("HIPK2(Y361)").
0.2317336631::p_fc("HIPK2(Y361)", "Tofacitinib", dec); 0.2317336631::p_fc("HIPK2(Y361)", "Tofacitinib", inc) :- phosphosite("HIPK2(Y361)").
0.03557954::p_fc("HIPK2(Y361)", "Torin", dec); 0.03557954::p_fc("HIPK2(Y361)", "Torin", inc) :- phosphosite("HIPK2(Y361)").
0.3224363949::p_fc("HIPK2(Y361)", "Trametinib", dec); 0.3224363949::p_fc("HIPK2(Y361)", "Trametinib", inc) :- phosphosite("HIPK2(Y361)").
0.0799767414::p_fc("HIPK2(Y361)", "U73122", dec); 0.0799767414::p_fc("HIPK2(Y361)", "U73122", inc) :- phosphosite("HIPK2(Y361)").
0.1209978642::p_fc("HIPK2(Y361)", "Ulixertinib", dec); 0.1209978642::p_fc("HIPK2(Y361)", "Ulixertinib", inc) :- phosphosite("HIPK2(Y361)").
0.491930401::p_fc("HIPK2(Y361)", "Vemurafenib", dec); 0.491930401::p_fc("HIPK2(Y361)", "Vemurafenib", inc) :- phosphosite("HIPK2(Y361)").
0.1408490663::p_fc("PTK2(S29)", "AC220", dec); 0.1408490663::p_fc("PTK2(S29)", "AC220", inc) :- phosphosite("PTK2(S29)").
0.2560317109::p_fc("PTK2(S29)", "AT13148", dec); 0.2560317109::p_fc("PTK2(S29)", "AT13148", inc) :- phosphosite("PTK2(S29)").
0.3170543674::p_fc("PTK2(S29)", "AZ20", dec); 0.3170543674::p_fc("PTK2(S29)", "AZ20", inc) :- phosphosite("PTK2(S29)").
0.064165125::p_fc("PTK2(S29)", "AZD1480", dec); 0.064165125::p_fc("PTK2(S29)", "AZD1480", inc) :- phosphosite("PTK2(S29)").
0.2607203754::p_fc("PTK2(S29)", "AZD3759", dec); 0.2607203754::p_fc("PTK2(S29)", "AZD3759", inc) :- phosphosite("PTK2(S29)").
0.1732709245::p_fc("PTK2(S29)", "AZD5363", dec); 0.1732709245::p_fc("PTK2(S29)", "AZD5363", inc) :- phosphosite("PTK2(S29)").
0.2743098681::p_fc("PTK2(S29)", "AZD5438", dec); 0.2743098681::p_fc("PTK2(S29)", "AZD5438", inc) :- phosphosite("PTK2(S29)").
0.4016809264::p_fc("PTK2(S29)", "AZD6482", dec); 0.4016809264::p_fc("PTK2(S29)", "AZD6482", inc) :- phosphosite("PTK2(S29)").
0.4905418513::p_fc("PTK2(S29)", "AZD6738", dec); 0.4905418513::p_fc("PTK2(S29)", "AZD6738", inc) :- phosphosite("PTK2(S29)").
0.0519489839::p_fc("PTK2(S29)", "AZD8055", dec); 0.0519489839::p_fc("PTK2(S29)", "AZD8055", inc) :- phosphosite("PTK2(S29)").
0.0032985748::p_fc("PTK2(S29)", "Amuvatinib", dec); 0.0032985748::p_fc("PTK2(S29)", "Amuvatinib", inc) :- phosphosite("PTK2(S29)").
0.0936370741::p_fc("PTK2(S29)", "BX912", dec); 0.0936370741::p_fc("PTK2(S29)", "BX912", inc) :- phosphosite("PTK2(S29)").
0.2154825812::p_fc("PTK2(S29)", "Bosutinib", dec); 0.2154825812::p_fc("PTK2(S29)", "Bosutinib", inc) :- phosphosite("PTK2(S29)").
0.4369091902::p_fc("PTK2(S29)", "CAL101", dec); 0.4369091902::p_fc("PTK2(S29)", "CAL101", inc) :- phosphosite("PTK2(S29)").
0.0017852407::p_fc("PTK2(S29)", "CHIR99021", dec); 0.0017852407::p_fc("PTK2(S29)", "CHIR99021", inc) :- phosphosite("PTK2(S29)").
0.0048909065::p_fc("PTK2(S29)", "CX4945", dec); 0.0048909065::p_fc("PTK2(S29)", "CX4945", inc) :- phosphosite("PTK2(S29)").
0.4457749481::p_fc("PTK2(S29)", "DNAPK", dec); 0.4457749481::p_fc("PTK2(S29)", "DNAPK", inc) :- phosphosite("PTK2(S29)").
0.2275395711::p_fc("PTK2(S29)", "Dabrafenib", dec); 0.2275395711::p_fc("PTK2(S29)", "Dabrafenib", inc) :- phosphosite("PTK2(S29)").
0.3147155016::p_fc("PTK2(S29)", "Dasatinib", dec); 0.3147155016::p_fc("PTK2(S29)", "Dasatinib", inc) :- phosphosite("PTK2(S29)").
0.1549088521::p_fc("PTK2(S29)", "Edelfosine", dec); 0.1549088521::p_fc("PTK2(S29)", "Edelfosine", inc) :- phosphosite("PTK2(S29)").
0.3697674594::p_fc("PTK2(S29)", "FRAX486", dec); 0.3697674594::p_fc("PTK2(S29)", "FRAX486", inc) :- phosphosite("PTK2(S29)").
0.4421998677::p_fc("PTK2(S29)", "GDC0941", dec); 0.4421998677::p_fc("PTK2(S29)", "GDC0941", inc) :- phosphosite("PTK2(S29)").
0.0614594601::p_fc("PTK2(S29)", "GDC0994", dec); 0.0614594601::p_fc("PTK2(S29)", "GDC0994", inc) :- phosphosite("PTK2(S29)").
0.2645268519::p_fc("PTK2(S29)", "GF109203X", dec); 0.2645268519::p_fc("PTK2(S29)", "GF109203X", inc) :- phosphosite("PTK2(S29)").
0.487534815::p_fc("PTK2(S29)", "GO6983", dec); 0.487534815::p_fc("PTK2(S29)", "GO6983", inc) :- phosphosite("PTK2(S29)").
0.0739177479::p_fc("PTK2(S29)", "GSK2334470", dec); 0.0739177479::p_fc("PTK2(S29)", "GSK2334470", inc) :- phosphosite("PTK2(S29)").
0.1782059756::p_fc("PTK2(S29)", "GSK690693", dec); 0.1782059756::p_fc("PTK2(S29)", "GSK690693", inc) :- phosphosite("PTK2(S29)").
0.2914682917::p_fc("PTK2(S29)", "Go6976", dec); 0.2914682917::p_fc("PTK2(S29)", "Go6976", inc) :- phosphosite("PTK2(S29)").
0.1134808192::p_fc("PTK2(S29)", "H89", dec); 0.1134808192::p_fc("PTK2(S29)", "H89", inc) :- phosphosite("PTK2(S29)").
0.3264066975::p_fc("PTK2(S29)", "HS173", dec); 0.3264066975::p_fc("PTK2(S29)", "HS173", inc) :- phosphosite("PTK2(S29)").
0.1331704296::p_fc("PTK2(S29)", "Ipatasertib", dec); 0.1331704296::p_fc("PTK2(S29)", "Ipatasertib", inc) :- phosphosite("PTK2(S29)").
0.0220074666::p_fc("PTK2(S29)", "JNJ", dec); 0.0220074666::p_fc("PTK2(S29)", "JNJ", inc) :- phosphosite("PTK2(S29)").
0.3170111727::p_fc("PTK2(S29)", "JNK", dec); 0.3170111727::p_fc("PTK2(S29)", "JNK", inc) :- phosphosite("PTK2(S29)").
0.0944602992::p_fc("PTK2(S29)", "KD025", dec); 0.0944602992::p_fc("PTK2(S29)", "KD025", inc) :- phosphosite("PTK2(S29)").
0.1782059756::p_fc("PTK2(S29)", "KN62", dec); 0.1782059756::p_fc("PTK2(S29)", "KN62", inc) :- phosphosite("PTK2(S29)").
0.0848536646::p_fc("PTK2(S29)", "KN93", dec); 0.0848536646::p_fc("PTK2(S29)", "KN93", inc) :- phosphosite("PTK2(S29)").
0.1650228245::p_fc("PTK2(S29)", "Ku0063794", dec); 0.1650228245::p_fc("PTK2(S29)", "Ku0063794", inc) :- phosphosite("PTK2(S29)").
0.1015608119::p_fc("PTK2(S29)", "LY2090314", dec); 0.1015608119::p_fc("PTK2(S29)", "LY2090314", inc) :- phosphosite("PTK2(S29)").
0.2594352635::p_fc("PTK2(S29)", "LY2584702", dec); 0.2594352635::p_fc("PTK2(S29)", "LY2584702", inc) :- phosphosite("PTK2(S29)").
0.000997006::p_fc("PTK2(S29)", "LY2835219", dec); 0.000997006::p_fc("PTK2(S29)", "LY2835219", inc) :- phosphosite("PTK2(S29)").
0.0058082384::p_fc("PTK2(S29)", "Linsitinib", dec); 0.0058082384::p_fc("PTK2(S29)", "Linsitinib", inc) :- phosphosite("PTK2(S29)").
0.1389241234::p_fc("PTK2(S29)", "MK2206", dec); 0.1389241234::p_fc("PTK2(S29)", "MK2206", inc) :- phosphosite("PTK2(S29)").
0.4585369448::p_fc("PTK2(S29)", "NU7441", dec); 0.4585369448::p_fc("PTK2(S29)", "NU7441", inc) :- phosphosite("PTK2(S29)").
0.0299916853::p_fc("PTK2(S29)", "PD153035", dec); 0.0299916853::p_fc("PTK2(S29)", "PD153035", inc) :- phosphosite("PTK2(S29)").
0.3115963013::p_fc("PTK2(S29)", "PF3758309", dec); 0.3115963013::p_fc("PTK2(S29)", "PF3758309", inc) :- phosphosite("PTK2(S29)").
0.2560069361::p_fc("PTK2(S29)", "PF4708671", dec); 0.2560069361::p_fc("PTK2(S29)", "PF4708671", inc) :- phosphosite("PTK2(S29)").
0.2371820696::p_fc("PTK2(S29)", "PH797804", dec); 0.2371820696::p_fc("PTK2(S29)", "PH797804", inc) :- phosphosite("PTK2(S29)").
0.4806347308::p_fc("PTK2(S29)", "PIK294", dec); 0.4806347308::p_fc("PTK2(S29)", "PIK294", inc) :- phosphosite("PTK2(S29)").
0.1782059756::p_fc("PTK2(S29)", "Ribociclib", dec); 0.1782059756::p_fc("PTK2(S29)", "Ribociclib", inc) :- phosphosite("PTK2(S29)").
0.4384552499::p_fc("PTK2(S29)", "Ripasudil", dec); 0.4384552499::p_fc("PTK2(S29)", "Ripasudil", inc) :- phosphosite("PTK2(S29)").
0.2954068283::p_fc("PTK2(S29)", "SP600125", dec); 0.2954068283::p_fc("PTK2(S29)", "SP600125", inc) :- phosphosite("PTK2(S29)").
0.0657849747::p_fc("PTK2(S29)", "Selumetinib", dec); 0.0657849747::p_fc("PTK2(S29)", "Selumetinib", inc) :- phosphosite("PTK2(S29)").
0.3142872541::p_fc("PTK2(S29)", "TAK715", dec); 0.3142872541::p_fc("PTK2(S29)", "TAK715", inc) :- phosphosite("PTK2(S29)").
0.1550813801::p_fc("PTK2(S29)", "TBCA", dec); 0.1550813801::p_fc("PTK2(S29)", "TBCA", inc) :- phosphosite("PTK2(S29)").
0.2953212284::p_fc("PTK2(S29)", "TGX221", dec); 0.2953212284::p_fc("PTK2(S29)", "TGX221", inc) :- phosphosite("PTK2(S29)").
0.2667322053::p_fc("PTK2(S29)", "Tofacitinib", dec); 0.2667322053::p_fc("PTK2(S29)", "Tofacitinib", inc) :- phosphosite("PTK2(S29)").
0.4006531574::p_fc("PTK2(S29)", "Torin", dec); 0.4006531574::p_fc("PTK2(S29)", "Torin", inc) :- phosphosite("PTK2(S29)").
0.3175473601::p_fc("PTK2(S29)", "Trametinib", dec); 0.3175473601::p_fc("PTK2(S29)", "Trametinib", inc) :- phosphosite("PTK2(S29)").
0.1556440703::p_fc("PTK2(S29)", "U73122", dec); 0.1556440703::p_fc("PTK2(S29)", "U73122", inc) :- phosphosite("PTK2(S29)").
0.145726276::p_fc("PTK2(S29)", "Ulixertinib", dec); 0.145726276::p_fc("PTK2(S29)", "Ulixertinib", inc) :- phosphosite("PTK2(S29)").
0.3894049738::p_fc("PTK2(S29)", "Vemurafenib", dec); 0.3894049738::p_fc("PTK2(S29)", "Vemurafenib", inc) :- phosphosite("PTK2(S29)").
0.0110318413::p_fc("PTK2(S722)", "AC220", dec); 0.0110318413::p_fc("PTK2(S722)", "AC220", inc) :- phosphosite("PTK2(S722)").
0.0899071163::p_fc("PTK2(S722)", "AT13148", dec); 0.0899071163::p_fc("PTK2(S722)", "AT13148", inc) :- phosphosite("PTK2(S722)").
0.0899071163::p_fc("PTK2(S722)", "AZ20", dec); 0.0899071163::p_fc("PTK2(S722)", "AZ20", inc) :- phosphosite("PTK2(S722)").
0.0899071163::p_fc("PTK2(S722)", "AZD1480", dec); 0.0899071163::p_fc("PTK2(S722)", "AZD1480", inc) :- phosphosite("PTK2(S722)").
0.0274992279::p_fc("PTK2(S722)", "AZD3759", dec); 0.0274992279::p_fc("PTK2(S722)", "AZD3759", inc) :- phosphosite("PTK2(S722)").
0.1041628275::p_fc("PTK2(S722)", "AZD5363", dec); 0.1041628275::p_fc("PTK2(S722)", "AZD5363", inc) :- phosphosite("PTK2(S722)").
0.414809563::p_fc("PTK2(S722)", "AZD5438", dec); 0.414809563::p_fc("PTK2(S722)", "AZD5438", inc) :- phosphosite("PTK2(S722)").
0.0899071163::p_fc("PTK2(S722)", "AZD6482", dec); 0.0899071163::p_fc("PTK2(S722)", "AZD6482", inc) :- phosphosite("PTK2(S722)").
0.0899071163::p_fc("PTK2(S722)", "AZD6738", dec); 0.0899071163::p_fc("PTK2(S722)", "AZD6738", inc) :- phosphosite("PTK2(S722)").
0.0787487851::p_fc("PTK2(S722)", "AZD8055", dec); 0.0787487851::p_fc("PTK2(S722)", "AZD8055", inc) :- phosphosite("PTK2(S722)").
0.3952130492::p_fc("PTK2(S722)", "Amuvatinib", dec); 0.3952130492::p_fc("PTK2(S722)", "Amuvatinib", inc) :- phosphosite("PTK2(S722)").
0.0899071163::p_fc("PTK2(S722)", "BX912", dec); 0.0899071163::p_fc("PTK2(S722)", "BX912", inc) :- phosphosite("PTK2(S722)").
0.0899071163::p_fc("PTK2(S722)", "Bosutinib", dec); 0.0899071163::p_fc("PTK2(S722)", "Bosutinib", inc) :- phosphosite("PTK2(S722)").
0.0899071163::p_fc("PTK2(S722)", "CAL101", dec); 0.0899071163::p_fc("PTK2(S722)", "CAL101", inc) :- phosphosite("PTK2(S722)").
0.1183193257::p_fc("PTK2(S722)", "CHIR99021", dec); 0.1183193257::p_fc("PTK2(S722)", "CHIR99021", inc) :- phosphosite("PTK2(S722)").
0.0228442275::p_fc("PTK2(S722)", "CX4945", dec); 0.0228442275::p_fc("PTK2(S722)", "CX4945", inc) :- phosphosite("PTK2(S722)").
0.0899071163::p_fc("PTK2(S722)", "DNAPK", dec); 0.0899071163::p_fc("PTK2(S722)", "DNAPK", inc) :- phosphosite("PTK2(S722)").
0.0899071163::p_fc("PTK2(S722)", "Dabrafenib", dec); 0.0899071163::p_fc("PTK2(S722)", "Dabrafenib", inc) :- phosphosite("PTK2(S722)").
0.0899071163::p_fc("PTK2(S722)", "Dasatinib", dec); 0.0899071163::p_fc("PTK2(S722)", "Dasatinib", inc) :- phosphosite("PTK2(S722)").
0.0899071163::p_fc("PTK2(S722)", "Edelfosine", dec); 0.0899071163::p_fc("PTK2(S722)", "Edelfosine", inc) :- phosphosite("PTK2(S722)").
0.3553092005::p_fc("PTK2(S722)", "FRAX486", dec); 0.3553092005::p_fc("PTK2(S722)", "FRAX486", inc) :- phosphosite("PTK2(S722)").
0.0899071163::p_fc("PTK2(S722)", "GDC0941", dec); 0.0899071163::p_fc("PTK2(S722)", "GDC0941", inc) :- phosphosite("PTK2(S722)").
0.2635912966::p_fc("PTK2(S722)", "GDC0994", dec); 0.2635912966::p_fc("PTK2(S722)", "GDC0994", inc) :- phosphosite("PTK2(S722)").
0.0899071163::p_fc("PTK2(S722)", "GF109203X", dec); 0.0899071163::p_fc("PTK2(S722)", "GF109203X", inc) :- phosphosite("PTK2(S722)").
0.0899071163::p_fc("PTK2(S722)", "GO6983", dec); 0.0899071163::p_fc("PTK2(S722)", "GO6983", inc) :- phosphosite("PTK2(S722)").
0.013725487::p_fc("PTK2(S722)", "GSK2334470", dec); 0.013725487::p_fc("PTK2(S722)", "GSK2334470", inc) :- phosphosite("PTK2(S722)").
0.4333267324::p_fc("PTK2(S722)", "GSK690693", dec); 0.4333267324::p_fc("PTK2(S722)", "GSK690693", inc) :- phosphosite("PTK2(S722)").
0.0078758164::p_fc("PTK2(S722)", "Go6976", dec); 0.0078758164::p_fc("PTK2(S722)", "Go6976", inc) :- phosphosite("PTK2(S722)").
0.0899071163::p_fc("PTK2(S722)", "H89", dec); 0.0899071163::p_fc("PTK2(S722)", "H89", inc) :- phosphosite("PTK2(S722)").
0.0081563648::p_fc("PTK2(S722)", "HS173", dec); 0.0081563648::p_fc("PTK2(S722)", "HS173", inc) :- phosphosite("PTK2(S722)").
0.0147701302::p_fc("PTK2(S722)", "Ipatasertib", dec); 0.0147701302::p_fc("PTK2(S722)", "Ipatasertib", inc) :- phosphosite("PTK2(S722)").
0.0028177064::p_fc("PTK2(S722)", "JNJ", dec); 0.0028177064::p_fc("PTK2(S722)", "JNJ", inc) :- phosphosite("PTK2(S722)").
0.0039199237::p_fc("PTK2(S722)", "JNK", dec); 0.0039199237::p_fc("PTK2(S722)", "JNK", inc) :- phosphosite("PTK2(S722)").
0.0899071163::p_fc("PTK2(S722)", "KD025", dec); 0.0899071163::p_fc("PTK2(S722)", "KD025", inc) :- phosphosite("PTK2(S722)").
0.0899071163::p_fc("PTK2(S722)", "KN62", dec); 0.0899071163::p_fc("PTK2(S722)", "KN62", inc) :- phosphosite("PTK2(S722)").
0.0287976422::p_fc("PTK2(S722)", "KN93", dec); 0.0287976422::p_fc("PTK2(S722)", "KN93", inc) :- phosphosite("PTK2(S722)").
0.3632008193::p_fc("PTK2(S722)", "Ku0063794", dec); 0.3632008193::p_fc("PTK2(S722)", "Ku0063794", inc) :- phosphosite("PTK2(S722)").
0.0899071163::p_fc("PTK2(S722)", "LY2090314", dec); 0.0899071163::p_fc("PTK2(S722)", "LY2090314", inc) :- phosphosite("PTK2(S722)").
0.4374343903::p_fc("PTK2(S722)", "LY2584702", dec); 0.4374343903::p_fc("PTK2(S722)", "LY2584702", inc) :- phosphosite("PTK2(S722)").
0.0899071163::p_fc("PTK2(S722)", "LY2835219", dec); 0.0899071163::p_fc("PTK2(S722)", "LY2835219", inc) :- phosphosite("PTK2(S722)").
0.0899071163::p_fc("PTK2(S722)", "Linsitinib", dec); 0.0899071163::p_fc("PTK2(S722)", "Linsitinib", inc) :- phosphosite("PTK2(S722)").
0.0899071163::p_fc("PTK2(S722)", "MK2206", dec); 0.0899071163::p_fc("PTK2(S722)", "MK2206", inc) :- phosphosite("PTK2(S722)").
0.0899071163::p_fc("PTK2(S722)", "NU7441", dec); 0.0899071163::p_fc("PTK2(S722)", "NU7441", inc) :- phosphosite("PTK2(S722)").
0.3166379535::p_fc("PTK2(S722)", "PD153035", dec); 0.3166379535::p_fc("PTK2(S722)", "PD153035", inc) :- phosphosite("PTK2(S722)").
0.343001385::p_fc("PTK2(S722)", "PF3758309", dec); 0.343001385::p_fc("PTK2(S722)", "PF3758309", inc) :- phosphosite("PTK2(S722)").
0.0168749364::p_fc("PTK2(S722)", "PF4708671", dec); 0.0168749364::p_fc("PTK2(S722)", "PF4708671", inc) :- phosphosite("PTK2(S722)").
0.2570426264::p_fc("PTK2(S722)", "PH797804", dec); 0.2570426264::p_fc("PTK2(S722)", "PH797804", inc) :- phosphosite("PTK2(S722)").
0.0899071163::p_fc("PTK2(S722)", "PIK294", dec); 0.0899071163::p_fc("PTK2(S722)", "PIK294", inc) :- phosphosite("PTK2(S722)").
0.347257524::p_fc("PTK2(S722)", "Ribociclib", dec); 0.347257524::p_fc("PTK2(S722)", "Ribociclib", inc) :- phosphosite("PTK2(S722)").
0.0899071163::p_fc("PTK2(S722)", "Ripasudil", dec); 0.0899071163::p_fc("PTK2(S722)", "Ripasudil", inc) :- phosphosite("PTK2(S722)").
0.0899071163::p_fc("PTK2(S722)", "SP600125", dec); 0.0899071163::p_fc("PTK2(S722)", "SP600125", inc) :- phosphosite("PTK2(S722)").
0.1231698396::p_fc("PTK2(S722)", "Selumetinib", dec); 0.1231698396::p_fc("PTK2(S722)", "Selumetinib", inc) :- phosphosite("PTK2(S722)").
0.0899071163::p_fc("PTK2(S722)", "TAK715", dec); 0.0899071163::p_fc("PTK2(S722)", "TAK715", inc) :- phosphosite("PTK2(S722)").
0.0899071163::p_fc("PTK2(S722)", "TBCA", dec); 0.0899071163::p_fc("PTK2(S722)", "TBCA", inc) :- phosphosite("PTK2(S722)").
0.0017875354::p_fc("PTK2(S722)", "TGX221", dec); 0.0017875354::p_fc("PTK2(S722)", "TGX221", inc) :- phosphosite("PTK2(S722)").
0.0899071163::p_fc("PTK2(S722)", "Tofacitinib", dec); 0.0899071163::p_fc("PTK2(S722)", "Tofacitinib", inc) :- phosphosite("PTK2(S722)").
0.1820249321::p_fc("PTK2(S722)", "Torin", dec); 0.1820249321::p_fc("PTK2(S722)", "Torin", inc) :- phosphosite("PTK2(S722)").
0.2267181067::p_fc("PTK2(S722)", "Trametinib", dec); 0.2267181067::p_fc("PTK2(S722)", "Trametinib", inc) :- phosphosite("PTK2(S722)").
0.4629808244::p_fc("PTK2(S722)", "U73122", dec); 0.4629808244::p_fc("PTK2(S722)", "U73122", inc) :- phosphosite("PTK2(S722)").
0.3680335518::p_fc("PTK2(S722)", "Ulixertinib", dec); 0.3680335518::p_fc("PTK2(S722)", "Ulixertinib", inc) :- phosphosite("PTK2(S722)").
0.0899071163::p_fc("PTK2(S722)", "Vemurafenib", dec); 0.0899071163::p_fc("PTK2(S722)", "Vemurafenib", inc) :- phosphosite("PTK2(S722)").
0.4995::p_fc("PTK2(S843)", "AC220", dec); 0.4995::p_fc("PTK2(S843)", "AC220", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "AT13148", dec); 0.4995::p_fc("PTK2(S843)", "AT13148", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "AZ20", dec); 0.4995::p_fc("PTK2(S843)", "AZ20", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "AZD1480", dec); 0.4995::p_fc("PTK2(S843)", "AZD1480", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "AZD3759", dec); 0.4995::p_fc("PTK2(S843)", "AZD3759", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "AZD5363", dec); 0.4995::p_fc("PTK2(S843)", "AZD5363", inc) :- phosphosite("PTK2(S843)").
0.0033646675::p_fc("PTK2(S843)", "AZD5438", dec); 0.0033646675::p_fc("PTK2(S843)", "AZD5438", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "AZD6482", dec); 0.4995::p_fc("PTK2(S843)", "AZD6482", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "AZD6738", dec); 0.4995::p_fc("PTK2(S843)", "AZD6738", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "AZD8055", dec); 0.4995::p_fc("PTK2(S843)", "AZD8055", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "Amuvatinib", dec); 0.4995::p_fc("PTK2(S843)", "Amuvatinib", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "BX912", dec); 0.4995::p_fc("PTK2(S843)", "BX912", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "Bosutinib", dec); 0.4995::p_fc("PTK2(S843)", "Bosutinib", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "CAL101", dec); 0.4995::p_fc("PTK2(S843)", "CAL101", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "CHIR99021", dec); 0.4995::p_fc("PTK2(S843)", "CHIR99021", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "CX4945", dec); 0.4995::p_fc("PTK2(S843)", "CX4945", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "DNAPK", dec); 0.4995::p_fc("PTK2(S843)", "DNAPK", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "Dabrafenib", dec); 0.4995::p_fc("PTK2(S843)", "Dabrafenib", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "Dasatinib", dec); 0.4995::p_fc("PTK2(S843)", "Dasatinib", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "Edelfosine", dec); 0.4995::p_fc("PTK2(S843)", "Edelfosine", inc) :- phosphosite("PTK2(S843)").
0.0011164584::p_fc("PTK2(S843)", "FRAX486", dec); 0.0011164584::p_fc("PTK2(S843)", "FRAX486", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "GDC0941", dec); 0.4995::p_fc("PTK2(S843)", "GDC0941", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "GDC0994", dec); 0.4995::p_fc("PTK2(S843)", "GDC0994", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "GF109203X", dec); 0.4995::p_fc("PTK2(S843)", "GF109203X", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "GO6983", dec); 0.4995::p_fc("PTK2(S843)", "GO6983", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "GSK2334470", dec); 0.4995::p_fc("PTK2(S843)", "GSK2334470", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "GSK690693", dec); 0.4995::p_fc("PTK2(S843)", "GSK690693", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "Go6976", dec); 0.4995::p_fc("PTK2(S843)", "Go6976", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "H89", dec); 0.4995::p_fc("PTK2(S843)", "H89", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "HS173", dec); 0.4995::p_fc("PTK2(S843)", "HS173", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "Ipatasertib", dec); 0.4995::p_fc("PTK2(S843)", "Ipatasertib", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "JNJ", dec); 0.4995::p_fc("PTK2(S843)", "JNJ", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "JNK", dec); 0.4995::p_fc("PTK2(S843)", "JNK", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "KD025", dec); 0.4995::p_fc("PTK2(S843)", "KD025", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "KN62", dec); 0.4995::p_fc("PTK2(S843)", "KN62", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "KN93", dec); 0.4995::p_fc("PTK2(S843)", "KN93", inc) :- phosphosite("PTK2(S843)").
0.0010208937::p_fc("PTK2(S843)", "Ku0063794", dec); 0.0010208937::p_fc("PTK2(S843)", "Ku0063794", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "LY2090314", dec); 0.4995::p_fc("PTK2(S843)", "LY2090314", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "LY2584702", dec); 0.4995::p_fc("PTK2(S843)", "LY2584702", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "LY2835219", dec); 0.4995::p_fc("PTK2(S843)", "LY2835219", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "Linsitinib", dec); 0.4995::p_fc("PTK2(S843)", "Linsitinib", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "MK2206", dec); 0.4995::p_fc("PTK2(S843)", "MK2206", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "NU7441", dec); 0.4995::p_fc("PTK2(S843)", "NU7441", inc) :- phosphosite("PTK2(S843)").
0.0009992883::p_fc("PTK2(S843)", "PD153035", dec); 0.0009992883::p_fc("PTK2(S843)", "PD153035", inc) :- phosphosite("PTK2(S843)").
0.0065424351::p_fc("PTK2(S843)", "PF3758309", dec); 0.0065424351::p_fc("PTK2(S843)", "PF3758309", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "PF4708671", dec); 0.4995::p_fc("PTK2(S843)", "PF4708671", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "PH797804", dec); 0.4995::p_fc("PTK2(S843)", "PH797804", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "PIK294", dec); 0.4995::p_fc("PTK2(S843)", "PIK294", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "Ribociclib", dec); 0.4995::p_fc("PTK2(S843)", "Ribociclib", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "Ripasudil", dec); 0.4995::p_fc("PTK2(S843)", "Ripasudil", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "SP600125", dec); 0.4995::p_fc("PTK2(S843)", "SP600125", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "Selumetinib", dec); 0.4995::p_fc("PTK2(S843)", "Selumetinib", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "TAK715", dec); 0.4995::p_fc("PTK2(S843)", "TAK715", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "TBCA", dec); 0.4995::p_fc("PTK2(S843)", "TBCA", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "TGX221", dec); 0.4995::p_fc("PTK2(S843)", "TGX221", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "Tofacitinib", dec); 0.4995::p_fc("PTK2(S843)", "Tofacitinib", inc) :- phosphosite("PTK2(S843)").
0.001005746::p_fc("PTK2(S843)", "Torin", dec); 0.001005746::p_fc("PTK2(S843)", "Torin", inc) :- phosphosite("PTK2(S843)").
0.0009978226::p_fc("PTK2(S843)", "Trametinib", dec); 0.0009978226::p_fc("PTK2(S843)", "Trametinib", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "U73122", dec); 0.4995::p_fc("PTK2(S843)", "U73122", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "Ulixertinib", dec); 0.4995::p_fc("PTK2(S843)", "Ulixertinib", inc) :- phosphosite("PTK2(S843)").
0.4995::p_fc("PTK2(S843)", "Vemurafenib", dec); 0.4995::p_fc("PTK2(S843)", "Vemurafenib", inc) :- phosphosite("PTK2(S843)").
0.0024868458::p_fc("PTK2(S910)", "AC220", dec); 0.0024868458::p_fc("PTK2(S910)", "AC220", inc) :- phosphosite("PTK2(S910)").
0.3391746969::p_fc("PTK2(S910)", "AT13148", dec); 0.3391746969::p_fc("PTK2(S910)", "AT13148", inc) :- phosphosite("PTK2(S910)").
0.4675217701::p_fc("PTK2(S910)", "AZ20", dec); 0.4675217701::p_fc("PTK2(S910)", "AZ20", inc) :- phosphosite("PTK2(S910)").
0.0830064659::p_fc("PTK2(S910)", "AZD1480", dec); 0.0830064659::p_fc("PTK2(S910)", "AZD1480", inc) :- phosphosite("PTK2(S910)").
0.2363521195::p_fc("PTK2(S910)", "AZD3759", dec); 0.2363521195::p_fc("PTK2(S910)", "AZD3759", inc) :- phosphosite("PTK2(S910)").
0.056242612::p_fc("PTK2(S910)", "AZD5363", dec); 0.056242612::p_fc("PTK2(S910)", "AZD5363", inc) :- phosphosite("PTK2(S910)").
0.3552402148::p_fc("PTK2(S910)", "AZD5438", dec); 0.3552402148::p_fc("PTK2(S910)", "AZD5438", inc) :- phosphosite("PTK2(S910)").
0.3970205959::p_fc("PTK2(S910)", "AZD6482", dec); 0.3970205959::p_fc("PTK2(S910)", "AZD6482", inc) :- phosphosite("PTK2(S910)").
0.4953045248::p_fc("PTK2(S910)", "AZD6738", dec); 0.4953045248::p_fc("PTK2(S910)", "AZD6738", inc) :- phosphosite("PTK2(S910)").
0.0051244135::p_fc("PTK2(S910)", "AZD8055", dec); 0.0051244135::p_fc("PTK2(S910)", "AZD8055", inc) :- phosphosite("PTK2(S910)").
0.4036929156::p_fc("PTK2(S910)", "Amuvatinib", dec); 0.4036929156::p_fc("PTK2(S910)", "Amuvatinib", inc) :- phosphosite("PTK2(S910)").
0.3251776928::p_fc("PTK2(S910)", "BX912", dec); 0.3251776928::p_fc("PTK2(S910)", "BX912", inc) :- phosphosite("PTK2(S910)").
0.239115192::p_fc("PTK2(S910)", "Bosutinib", dec); 0.239115192::p_fc("PTK2(S910)", "Bosutinib", inc) :- phosphosite("PTK2(S910)").
0.3242361719::p_fc("PTK2(S910)", "CAL101", dec); 0.3242361719::p_fc("PTK2(S910)", "CAL101", inc) :- phosphosite("PTK2(S910)").
0.1605072395::p_fc("PTK2(S910)", "CHIR99021", dec); 0.1605072395::p_fc("PTK2(S910)", "CHIR99021", inc) :- phosphosite("PTK2(S910)").
0.1347754751::p_fc("PTK2(S910)", "CX4945", dec); 0.1347754751::p_fc("PTK2(S910)", "CX4945", inc) :- phosphosite("PTK2(S910)").
0.080031663::p_fc("PTK2(S910)", "DNAPK", dec); 0.080031663::p_fc("PTK2(S910)", "DNAPK", inc) :- phosphosite("PTK2(S910)").
0.1203490076::p_fc("PTK2(S910)", "Dabrafenib", dec); 0.1203490076::p_fc("PTK2(S910)", "Dabrafenib", inc) :- phosphosite("PTK2(S910)").
0.3195370289::p_fc("PTK2(S910)", "Dasatinib", dec); 0.3195370289::p_fc("PTK2(S910)", "Dasatinib", inc) :- phosphosite("PTK2(S910)").
0.0220015626::p_fc("PTK2(S910)", "Edelfosine", dec); 0.0220015626::p_fc("PTK2(S910)", "Edelfosine", inc) :- phosphosite("PTK2(S910)").
0.265290132::p_fc("PTK2(S910)", "FRAX486", dec); 0.265290132::p_fc("PTK2(S910)", "FRAX486", inc) :- phosphosite("PTK2(S910)").
0.3915907145::p_fc("PTK2(S910)", "GDC0941", dec); 0.3915907145::p_fc("PTK2(S910)", "GDC0941", inc) :- phosphosite("PTK2(S910)").
0.0091729672::p_fc("PTK2(S910)", "GDC0994", dec); 0.0091729672::p_fc("PTK2(S910)", "GDC0994", inc) :- phosphosite("PTK2(S910)").
0.197657996::p_fc("PTK2(S910)", "GF109203X", dec); 0.197657996::p_fc("PTK2(S910)", "GF109203X", inc) :- phosphosite("PTK2(S910)").
0.292452697::p_fc("PTK2(S910)", "GO6983", dec); 0.292452697::p_fc("PTK2(S910)", "GO6983", inc) :- phosphosite("PTK2(S910)").
0.0331361759::p_fc("PTK2(S910)", "GSK2334470", dec); 0.0331361759::p_fc("PTK2(S910)", "GSK2334470", inc) :- phosphosite("PTK2(S910)").
0.4965277066::p_fc("PTK2(S910)", "GSK690693", dec); 0.4965277066::p_fc("PTK2(S910)", "GSK690693", inc) :- phosphosite("PTK2(S910)").
0.0203107386::p_fc("PTK2(S910)", "Go6976", dec); 0.0203107386::p_fc("PTK2(S910)", "Go6976", inc) :- phosphosite("PTK2(S910)").
0.4844546381::p_fc("PTK2(S910)", "H89", dec); 0.4844546381::p_fc("PTK2(S910)", "H89", inc) :- phosphosite("PTK2(S910)").
0.3420009457::p_fc("PTK2(S910)", "HS173", dec); 0.3420009457::p_fc("PTK2(S910)", "HS173", inc) :- phosphosite("PTK2(S910)").
0.0357873718::p_fc("PTK2(S910)", "Ipatasertib", dec); 0.0357873718::p_fc("PTK2(S910)", "Ipatasertib", inc) :- phosphosite("PTK2(S910)").
0.235541665::p_fc("PTK2(S910)", "JNJ", dec); 0.235541665::p_fc("PTK2(S910)", "JNJ", inc) :- phosphosite("PTK2(S910)").
0.173287969::p_fc("PTK2(S910)", "JNK", dec); 0.173287969::p_fc("PTK2(S910)", "JNK", inc) :- phosphosite("PTK2(S910)").
0.0144802912::p_fc("PTK2(S910)", "KD025", dec); 0.0144802912::p_fc("PTK2(S910)", "KD025", inc) :- phosphosite("PTK2(S910)").
0.4911610081::p_fc("PTK2(S910)", "KN62", dec); 0.4911610081::p_fc("PTK2(S910)", "KN62", inc) :- phosphosite("PTK2(S910)").
0.1760045514::p_fc("PTK2(S910)", "KN93", dec); 0.1760045514::p_fc("PTK2(S910)", "KN93", inc) :- phosphosite("PTK2(S910)").
0.369894753::p_fc("PTK2(S910)", "Ku0063794", dec); 0.369894753::p_fc("PTK2(S910)", "Ku0063794", inc) :- phosphosite("PTK2(S910)").
0.2612373424::p_fc("PTK2(S910)", "LY2090314", dec); 0.2612373424::p_fc("PTK2(S910)", "LY2090314", inc) :- phosphosite("PTK2(S910)").
0.2600416709::p_fc("PTK2(S910)", "LY2584702", dec); 0.2600416709::p_fc("PTK2(S910)", "LY2584702", inc) :- phosphosite("PTK2(S910)").
0.2504302223::p_fc("PTK2(S910)", "LY2835219", dec); 0.2504302223::p_fc("PTK2(S910)", "LY2835219", inc) :- phosphosite("PTK2(S910)").
0.4450938924::p_fc("PTK2(S910)", "Linsitinib", dec); 0.4450938924::p_fc("PTK2(S910)", "Linsitinib", inc) :- phosphosite("PTK2(S910)").
0.4529100791::p_fc("PTK2(S910)", "MK2206", dec); 0.4529100791::p_fc("PTK2(S910)", "MK2206", inc) :- phosphosite("PTK2(S910)").
0.2248299565::p_fc("PTK2(S910)", "NU7441", dec); 0.2248299565::p_fc("PTK2(S910)", "NU7441", inc) :- phosphosite("PTK2(S910)").
0.424351747::p_fc("PTK2(S910)", "PD153035", dec); 0.424351747::p_fc("PTK2(S910)", "PD153035", inc) :- phosphosite("PTK2(S910)").
0.0696310686::p_fc("PTK2(S910)", "PF3758309", dec); 0.0696310686::p_fc("PTK2(S910)", "PF3758309", inc) :- phosphosite("PTK2(S910)").
0.4012865022::p_fc("PTK2(S910)", "PF4708671", dec); 0.4012865022::p_fc("PTK2(S910)", "PF4708671", inc) :- phosphosite("PTK2(S910)").
0.0564563055::p_fc("PTK2(S910)", "PH797804", dec); 0.0564563055::p_fc("PTK2(S910)", "PH797804", inc) :- phosphosite("PTK2(S910)").
0.0315728722::p_fc("PTK2(S910)", "PIK294", dec); 0.0315728722::p_fc("PTK2(S910)", "PIK294", inc) :- phosphosite("PTK2(S910)").
0.0803146681::p_fc("PTK2(S910)", "Ribociclib", dec); 0.0803146681::p_fc("PTK2(S910)", "Ribociclib", inc) :- phosphosite("PTK2(S910)").
0.081877747::p_fc("PTK2(S910)", "Ripasudil", dec); 0.081877747::p_fc("PTK2(S910)", "Ripasudil", inc) :- phosphosite("PTK2(S910)").
0.3760045152::p_fc("PTK2(S910)", "SP600125", dec); 0.3760045152::p_fc("PTK2(S910)", "SP600125", inc) :- phosphosite("PTK2(S910)").
0.0053406065::p_fc("PTK2(S910)", "Selumetinib", dec); 0.0053406065::p_fc("PTK2(S910)", "Selumetinib", inc) :- phosphosite("PTK2(S910)").
0.0304719592::p_fc("PTK2(S910)", "TAK715", dec); 0.0304719592::p_fc("PTK2(S910)", "TAK715", inc) :- phosphosite("PTK2(S910)").
0.3848676818::p_fc("PTK2(S910)", "TBCA", dec); 0.3848676818::p_fc("PTK2(S910)", "TBCA", inc) :- phosphosite("PTK2(S910)").
0.0706272961::p_fc("PTK2(S910)", "TGX221", dec); 0.0706272961::p_fc("PTK2(S910)", "TGX221", inc) :- phosphosite("PTK2(S910)").
0.1597071392::p_fc("PTK2(S910)", "Tofacitinib", dec); 0.1597071392::p_fc("PTK2(S910)", "Tofacitinib", inc) :- phosphosite("PTK2(S910)").
0.191741113::p_fc("PTK2(S910)", "Torin", dec); 0.191741113::p_fc("PTK2(S910)", "Torin", inc) :- phosphosite("PTK2(S910)").
0.1470250591::p_fc("PTK2(S910)", "Trametinib", dec); 0.1470250591::p_fc("PTK2(S910)", "Trametinib", inc) :- phosphosite("PTK2(S910)").
0.0115632389::p_fc("PTK2(S910)", "U73122", dec); 0.0115632389::p_fc("PTK2(S910)", "U73122", inc) :- phosphosite("PTK2(S910)").
0.0214787951::p_fc("PTK2(S910)", "Ulixertinib", dec); 0.0214787951::p_fc("PTK2(S910)", "Ulixertinib", inc) :- phosphosite("PTK2(S910)").
0.433303054::p_fc("PTK2(S910)", "Vemurafenib", dec); 0.433303054::p_fc("PTK2(S910)", "Vemurafenib", inc) :- phosphosite("PTK2(S910)").
0.0085687505::p_fc("PTPRG(S995)", "AC220", dec); 0.0085687505::p_fc("PTPRG(S995)", "AC220", inc) :- phosphosite("PTPRG(S995)").
0.3133261702::p_fc("PTPRG(S995)", "AT13148", dec); 0.3133261702::p_fc("PTPRG(S995)", "AT13148", inc) :- phosphosite("PTPRG(S995)").
0.3571614124::p_fc("PTPRG(S995)", "AZ20", dec); 0.3571614124::p_fc("PTPRG(S995)", "AZ20", inc) :- phosphosite("PTPRG(S995)").
0.4989628878::p_fc("PTPRG(S995)", "AZD1480", dec); 0.4989628878::p_fc("PTPRG(S995)", "AZD1480", inc) :- phosphosite("PTPRG(S995)").
0.3156625257::p_fc("PTPRG(S995)", "AZD3759", dec); 0.3156625257::p_fc("PTPRG(S995)", "AZD3759", inc) :- phosphosite("PTPRG(S995)").
0.3436735092::p_fc("PTPRG(S995)", "AZD5363", dec); 0.3436735092::p_fc("PTPRG(S995)", "AZD5363", inc) :- phosphosite("PTPRG(S995)").
0.396561029::p_fc("PTPRG(S995)", "AZD5438", dec); 0.396561029::p_fc("PTPRG(S995)", "AZD5438", inc) :- phosphosite("PTPRG(S995)").
0.4591222055::p_fc("PTPRG(S995)", "AZD6482", dec); 0.4591222055::p_fc("PTPRG(S995)", "AZD6482", inc) :- phosphosite("PTPRG(S995)").
0.176566981::p_fc("PTPRG(S995)", "AZD6738", dec); 0.176566981::p_fc("PTPRG(S995)", "AZD6738", inc) :- phosphosite("PTPRG(S995)").
0.4912496363::p_fc("PTPRG(S995)", "AZD8055", dec); 0.4912496363::p_fc("PTPRG(S995)", "AZD8055", inc) :- phosphosite("PTPRG(S995)").
0.4095605514::p_fc("PTPRG(S995)", "Amuvatinib", dec); 0.4095605514::p_fc("PTPRG(S995)", "Amuvatinib", inc) :- phosphosite("PTPRG(S995)").
0.4927185771::p_fc("PTPRG(S995)", "BX912", dec); 0.4927185771::p_fc("PTPRG(S995)", "BX912", inc) :- phosphosite("PTPRG(S995)").
0.059390386::p_fc("PTPRG(S995)", "Bosutinib", dec); 0.059390386::p_fc("PTPRG(S995)", "Bosutinib", inc) :- phosphosite("PTPRG(S995)").
0.0775770174::p_fc("PTPRG(S995)", "CAL101", dec); 0.0775770174::p_fc("PTPRG(S995)", "CAL101", inc) :- phosphosite("PTPRG(S995)").
0.4958261139::p_fc("PTPRG(S995)", "CHIR99021", dec); 0.4958261139::p_fc("PTPRG(S995)", "CHIR99021", inc) :- phosphosite("PTPRG(S995)").
0.4875273635::p_fc("PTPRG(S995)", "CX4945", dec); 0.4875273635::p_fc("PTPRG(S995)", "CX4945", inc) :- phosphosite("PTPRG(S995)").
0.3242608983::p_fc("PTPRG(S995)", "DNAPK", dec); 0.3242608983::p_fc("PTPRG(S995)", "DNAPK", inc) :- phosphosite("PTPRG(S995)").
0.2694398996::p_fc("PTPRG(S995)", "Dabrafenib", dec); 0.2694398996::p_fc("PTPRG(S995)", "Dabrafenib", inc) :- phosphosite("PTPRG(S995)").
0.1813503521::p_fc("PTPRG(S995)", "Dasatinib", dec); 0.1813503521::p_fc("PTPRG(S995)", "Dasatinib", inc) :- phosphosite("PTPRG(S995)").
0.3265990809::p_fc("PTPRG(S995)", "Edelfosine", dec); 0.3265990809::p_fc("PTPRG(S995)", "Edelfosine", inc) :- phosphosite("PTPRG(S995)").
0.3373179038::p_fc("PTPRG(S995)", "FRAX486", dec); 0.3373179038::p_fc("PTPRG(S995)", "FRAX486", inc) :- phosphosite("PTPRG(S995)").
0.4453909242::p_fc("PTPRG(S995)", "GDC0941", dec); 0.4453909242::p_fc("PTPRG(S995)", "GDC0941", inc) :- phosphosite("PTPRG(S995)").
0.4006988719::p_fc("PTPRG(S995)", "GDC0994", dec); 0.4006988719::p_fc("PTPRG(S995)", "GDC0994", inc) :- phosphosite("PTPRG(S995)").
0.2436636202::p_fc("PTPRG(S995)", "GF109203X", dec); 0.2436636202::p_fc("PTPRG(S995)", "GF109203X", inc) :- phosphosite("PTPRG(S995)").
0.2053880985::p_fc("PTPRG(S995)", "GO6983", dec); 0.2053880985::p_fc("PTPRG(S995)", "GO6983", inc) :- phosphosite("PTPRG(S995)").
0.4626421516::p_fc("PTPRG(S995)", "GSK2334470", dec); 0.4626421516::p_fc("PTPRG(S995)", "GSK2334470", inc) :- phosphosite("PTPRG(S995)").
0.2553946259::p_fc("PTPRG(S995)", "GSK690693", dec); 0.2553946259::p_fc("PTPRG(S995)", "GSK690693", inc) :- phosphosite("PTPRG(S995)").
0.0662388372::p_fc("PTPRG(S995)", "Go6976", dec); 0.0662388372::p_fc("PTPRG(S995)", "Go6976", inc) :- phosphosite("PTPRG(S995)").
0.1987867685::p_fc("PTPRG(S995)", "H89", dec); 0.1987867685::p_fc("PTPRG(S995)", "H89", inc) :- phosphosite("PTPRG(S995)").
0.3291488996::p_fc("PTPRG(S995)", "HS173", dec); 0.3291488996::p_fc("PTPRG(S995)", "HS173", inc) :- phosphosite("PTPRG(S995)").
0.4988720029::p_fc("PTPRG(S995)", "Ipatasertib", dec); 0.4988720029::p_fc("PTPRG(S995)", "Ipatasertib", inc) :- phosphosite("PTPRG(S995)").
0.0466293363::p_fc("PTPRG(S995)", "JNJ", dec); 0.0466293363::p_fc("PTPRG(S995)", "JNJ", inc) :- phosphosite("PTPRG(S995)").
0.1284406431::p_fc("PTPRG(S995)", "JNK", dec); 0.1284406431::p_fc("PTPRG(S995)", "JNK", inc) :- phosphosite("PTPRG(S995)").
0.1563474775::p_fc("PTPRG(S995)", "KD025", dec); 0.1563474775::p_fc("PTPRG(S995)", "KD025", inc) :- phosphosite("PTPRG(S995)").
0.0985556375::p_fc("PTPRG(S995)", "KN62", dec); 0.0985556375::p_fc("PTPRG(S995)", "KN62", inc) :- phosphosite("PTPRG(S995)").
0.2714447375::p_fc("PTPRG(S995)", "KN93", dec); 0.2714447375::p_fc("PTPRG(S995)", "KN93", inc) :- phosphosite("PTPRG(S995)").
0.0305604749::p_fc("PTPRG(S995)", "Ku0063794", dec); 0.0305604749::p_fc("PTPRG(S995)", "Ku0063794", inc) :- phosphosite("PTPRG(S995)").
0.3609749242::p_fc("PTPRG(S995)", "LY2090314", dec); 0.3609749242::p_fc("PTPRG(S995)", "LY2090314", inc) :- phosphosite("PTPRG(S995)").
0.1145949262::p_fc("PTPRG(S995)", "LY2584702", dec); 0.1145949262::p_fc("PTPRG(S995)", "LY2584702", inc) :- phosphosite("PTPRG(S995)").
0.2249404949::p_fc("PTPRG(S995)", "LY2835219", dec); 0.2249404949::p_fc("PTPRG(S995)", "LY2835219", inc) :- phosphosite("PTPRG(S995)").
0.344002775::p_fc("PTPRG(S995)", "Linsitinib", dec); 0.344002775::p_fc("PTPRG(S995)", "Linsitinib", inc) :- phosphosite("PTPRG(S995)").
0.2557877121::p_fc("PTPRG(S995)", "MK2206", dec); 0.2557877121::p_fc("PTPRG(S995)", "MK2206", inc) :- phosphosite("PTPRG(S995)").
0.2079855816::p_fc("PTPRG(S995)", "NU7441", dec); 0.2079855816::p_fc("PTPRG(S995)", "NU7441", inc) :- phosphosite("PTPRG(S995)").
0.0442739473::p_fc("PTPRG(S995)", "PD153035", dec); 0.0442739473::p_fc("PTPRG(S995)", "PD153035", inc) :- phosphosite("PTPRG(S995)").
0.0032065951::p_fc("PTPRG(S995)", "PF3758309", dec); 0.0032065951::p_fc("PTPRG(S995)", "PF3758309", inc) :- phosphosite("PTPRG(S995)").
0.3476406439::p_fc("PTPRG(S995)", "PF4708671", dec); 0.3476406439::p_fc("PTPRG(S995)", "PF4708671", inc) :- phosphosite("PTPRG(S995)").
0.4673690653::p_fc("PTPRG(S995)", "PH797804", dec); 0.4673690653::p_fc("PTPRG(S995)", "PH797804", inc) :- phosphosite("PTPRG(S995)").
0.479763999::p_fc("PTPRG(S995)", "PIK294", dec); 0.479763999::p_fc("PTPRG(S995)", "PIK294", inc) :- phosphosite("PTPRG(S995)").
0.4440755305::p_fc("PTPRG(S995)", "Ribociclib", dec); 0.4440755305::p_fc("PTPRG(S995)", "Ribociclib", inc) :- phosphosite("PTPRG(S995)").
0.2673744689::p_fc("PTPRG(S995)", "Ripasudil", dec); 0.2673744689::p_fc("PTPRG(S995)", "Ripasudil", inc) :- phosphosite("PTPRG(S995)").
0.0764657398::p_fc("PTPRG(S995)", "SP600125", dec); 0.0764657398::p_fc("PTPRG(S995)", "SP600125", inc) :- phosphosite("PTPRG(S995)").
0.005915724::p_fc("PTPRG(S995)", "Selumetinib", dec); 0.005915724::p_fc("PTPRG(S995)", "Selumetinib", inc) :- phosphosite("PTPRG(S995)").
0.1347216318::p_fc("PTPRG(S995)", "TAK715", dec); 0.1347216318::p_fc("PTPRG(S995)", "TAK715", inc) :- phosphosite("PTPRG(S995)").
0.0523443052::p_fc("PTPRG(S995)", "TBCA", dec); 0.0523443052::p_fc("PTPRG(S995)", "TBCA", inc) :- phosphosite("PTPRG(S995)").
0.2121418603::p_fc("PTPRG(S995)", "TGX221", dec); 0.2121418603::p_fc("PTPRG(S995)", "TGX221", inc) :- phosphosite("PTPRG(S995)").
0.4211528518::p_fc("PTPRG(S995)", "Tofacitinib", dec); 0.4211528518::p_fc("PTPRG(S995)", "Tofacitinib", inc) :- phosphosite("PTPRG(S995)").
0.2269645156::p_fc("PTPRG(S995)", "Torin", dec); 0.2269645156::p_fc("PTPRG(S995)", "Torin", inc) :- phosphosite("PTPRG(S995)").
0.0594319781::p_fc("PTPRG(S995)", "Trametinib", dec); 0.0594319781::p_fc("PTPRG(S995)", "Trametinib", inc) :- phosphosite("PTPRG(S995)").
0.3099645053::p_fc("PTPRG(S995)", "U73122", dec); 0.3099645053::p_fc("PTPRG(S995)", "U73122", inc) :- phosphosite("PTPRG(S995)").
0.1826573038::p_fc("PTPRG(S995)", "Ulixertinib", dec); 0.1826573038::p_fc("PTPRG(S995)", "Ulixertinib", inc) :- phosphosite("PTPRG(S995)").
0.0054144948::p_fc("PTPRG(S995)", "Vemurafenib", dec); 0.0054144948::p_fc("PTPRG(S995)", "Vemurafenib", inc) :- phosphosite("PTPRG(S995)").
0.4888155161::p_fc("PTTG1IP(Y174)", "AC220", dec); 0.4888155161::p_fc("PTTG1IP(Y174)", "AC220", inc) :- phosphosite("PTTG1IP(Y174)").
0.270954186::p_fc("PTTG1IP(Y174)", "AT13148", dec); 0.270954186::p_fc("PTTG1IP(Y174)", "AT13148", inc) :- phosphosite("PTTG1IP(Y174)").
0.2857940934::p_fc("PTTG1IP(Y174)", "AZ20", dec); 0.2857940934::p_fc("PTTG1IP(Y174)", "AZ20", inc) :- phosphosite("PTTG1IP(Y174)").
0.0668476321::p_fc("PTTG1IP(Y174)", "AZD1480", dec); 0.0668476321::p_fc("PTTG1IP(Y174)", "AZD1480", inc) :- phosphosite("PTTG1IP(Y174)").
0.0009991128::p_fc("PTTG1IP(Y174)", "AZD3759", dec); 0.0009991128::p_fc("PTTG1IP(Y174)", "AZD3759", inc) :- phosphosite("PTTG1IP(Y174)").
0.0748382583::p_fc("PTTG1IP(Y174)", "AZD5363", dec); 0.0748382583::p_fc("PTTG1IP(Y174)", "AZD5363", inc) :- phosphosite("PTTG1IP(Y174)").
0.1563369394::p_fc("PTTG1IP(Y174)", "AZD5438", dec); 0.1563369394::p_fc("PTTG1IP(Y174)", "AZD5438", inc) :- phosphosite("PTTG1IP(Y174)").
0.215023229::p_fc("PTTG1IP(Y174)", "AZD6482", dec); 0.215023229::p_fc("PTTG1IP(Y174)", "AZD6482", inc) :- phosphosite("PTTG1IP(Y174)").
0.3586608757::p_fc("PTTG1IP(Y174)", "AZD6738", dec); 0.3586608757::p_fc("PTTG1IP(Y174)", "AZD6738", inc) :- phosphosite("PTTG1IP(Y174)").
0.2437866646::p_fc("PTTG1IP(Y174)", "AZD8055", dec); 0.2437866646::p_fc("PTTG1IP(Y174)", "AZD8055", inc) :- phosphosite("PTTG1IP(Y174)").
0.121017671::p_fc("PTTG1IP(Y174)", "Amuvatinib", dec); 0.121017671::p_fc("PTTG1IP(Y174)", "Amuvatinib", inc) :- phosphosite("PTTG1IP(Y174)").
0.1166909471::p_fc("PTTG1IP(Y174)", "BX912", dec); 0.1166909471::p_fc("PTTG1IP(Y174)", "BX912", inc) :- phosphosite("PTTG1IP(Y174)").
0.3772945835::p_fc("PTTG1IP(Y174)", "Bosutinib", dec); 0.3772945835::p_fc("PTTG1IP(Y174)", "Bosutinib", inc) :- phosphosite("PTTG1IP(Y174)").
0.3872327689::p_fc("PTTG1IP(Y174)", "CAL101", dec); 0.3872327689::p_fc("PTTG1IP(Y174)", "CAL101", inc) :- phosphosite("PTTG1IP(Y174)").
0.2552575855::p_fc("PTTG1IP(Y174)", "CHIR99021", dec); 0.2552575855::p_fc("PTTG1IP(Y174)", "CHIR99021", inc) :- phosphosite("PTTG1IP(Y174)").
0.2385248127::p_fc("PTTG1IP(Y174)", "CX4945", dec); 0.2385248127::p_fc("PTTG1IP(Y174)", "CX4945", inc) :- phosphosite("PTTG1IP(Y174)").
0.1799628539::p_fc("PTTG1IP(Y174)", "DNAPK", dec); 0.1799628539::p_fc("PTTG1IP(Y174)", "DNAPK", inc) :- phosphosite("PTTG1IP(Y174)").
0.073505902::p_fc("PTTG1IP(Y174)", "Dabrafenib", dec); 0.073505902::p_fc("PTTG1IP(Y174)", "Dabrafenib", inc) :- phosphosite("PTTG1IP(Y174)").
0.4520235558::p_fc("PTTG1IP(Y174)", "Dasatinib", dec); 0.4520235558::p_fc("PTTG1IP(Y174)", "Dasatinib", inc) :- phosphosite("PTTG1IP(Y174)").
0.3809221447::p_fc("PTTG1IP(Y174)", "Edelfosine", dec); 0.3809221447::p_fc("PTTG1IP(Y174)", "Edelfosine", inc) :- phosphosite("PTTG1IP(Y174)").
0.2708330364::p_fc("PTTG1IP(Y174)", "FRAX486", dec); 0.2708330364::p_fc("PTTG1IP(Y174)", "FRAX486", inc) :- phosphosite("PTTG1IP(Y174)").
0.3622582173::p_fc("PTTG1IP(Y174)", "GDC0941", dec); 0.3622582173::p_fc("PTTG1IP(Y174)", "GDC0941", inc) :- phosphosite("PTTG1IP(Y174)").
0.2600409211::p_fc("PTTG1IP(Y174)", "GDC0994", dec); 0.2600409211::p_fc("PTTG1IP(Y174)", "GDC0994", inc) :- phosphosite("PTTG1IP(Y174)").
0.1826956771::p_fc("PTTG1IP(Y174)", "GF109203X", dec); 0.1826956771::p_fc("PTTG1IP(Y174)", "GF109203X", inc) :- phosphosite("PTTG1IP(Y174)").
0.4096801802::p_fc("PTTG1IP(Y174)", "GO6983", dec); 0.4096801802::p_fc("PTTG1IP(Y174)", "GO6983", inc) :- phosphosite("PTTG1IP(Y174)").
0.0387536119::p_fc("PTTG1IP(Y174)", "GSK2334470", dec); 0.0387536119::p_fc("PTTG1IP(Y174)", "GSK2334470", inc) :- phosphosite("PTTG1IP(Y174)").
0.1152101924::p_fc("PTTG1IP(Y174)", "GSK690693", dec); 0.1152101924::p_fc("PTTG1IP(Y174)", "GSK690693", inc) :- phosphosite("PTTG1IP(Y174)").
0.3441694364::p_fc("PTTG1IP(Y174)", "Go6976", dec); 0.3441694364::p_fc("PTTG1IP(Y174)", "Go6976", inc) :- phosphosite("PTTG1IP(Y174)").
0.271391716::p_fc("PTTG1IP(Y174)", "H89", dec); 0.271391716::p_fc("PTTG1IP(Y174)", "H89", inc) :- phosphosite("PTTG1IP(Y174)").
0.4312055371::p_fc("PTTG1IP(Y174)", "HS173", dec); 0.4312055371::p_fc("PTTG1IP(Y174)", "HS173", inc) :- phosphosite("PTTG1IP(Y174)").
0.1881840544::p_fc("PTTG1IP(Y174)", "Ipatasertib", dec); 0.1881840544::p_fc("PTTG1IP(Y174)", "Ipatasertib", inc) :- phosphosite("PTTG1IP(Y174)").
0.3636747376::p_fc("PTTG1IP(Y174)", "JNJ", dec); 0.3636747376::p_fc("PTTG1IP(Y174)", "JNJ", inc) :- phosphosite("PTTG1IP(Y174)").
0.3637296228::p_fc("PTTG1IP(Y174)", "JNK", dec); 0.3637296228::p_fc("PTTG1IP(Y174)", "JNK", inc) :- phosphosite("PTTG1IP(Y174)").
0.3988977852::p_fc("PTTG1IP(Y174)", "KD025", dec); 0.3988977852::p_fc("PTTG1IP(Y174)", "KD025", inc) :- phosphosite("PTTG1IP(Y174)").
0.2567120847::p_fc("PTTG1IP(Y174)", "KN62", dec); 0.2567120847::p_fc("PTTG1IP(Y174)", "KN62", inc) :- phosphosite("PTTG1IP(Y174)").
0.0436532205::p_fc("PTTG1IP(Y174)", "KN93", dec); 0.0436532205::p_fc("PTTG1IP(Y174)", "KN93", inc) :- phosphosite("PTTG1IP(Y174)").
0.4263817762::p_fc("PTTG1IP(Y174)", "Ku0063794", dec); 0.4263817762::p_fc("PTTG1IP(Y174)", "Ku0063794", inc) :- phosphosite("PTTG1IP(Y174)").
0.3687587947::p_fc("PTTG1IP(Y174)", "LY2090314", dec); 0.3687587947::p_fc("PTTG1IP(Y174)", "LY2090314", inc) :- phosphosite("PTTG1IP(Y174)").
0.3766625128::p_fc("PTTG1IP(Y174)", "LY2584702", dec); 0.3766625128::p_fc("PTTG1IP(Y174)", "LY2584702", inc) :- phosphosite("PTTG1IP(Y174)").
0.2877453779::p_fc("PTTG1IP(Y174)", "LY2835219", dec); 0.2877453779::p_fc("PTTG1IP(Y174)", "LY2835219", inc) :- phosphosite("PTTG1IP(Y174)").
0.0457587822::p_fc("PTTG1IP(Y174)", "Linsitinib", dec); 0.0457587822::p_fc("PTTG1IP(Y174)", "Linsitinib", inc) :- phosphosite("PTTG1IP(Y174)").
0.2160347228::p_fc("PTTG1IP(Y174)", "MK2206", dec); 0.2160347228::p_fc("PTTG1IP(Y174)", "MK2206", inc) :- phosphosite("PTTG1IP(Y174)").
0.1560417761::p_fc("PTTG1IP(Y174)", "NU7441", dec); 0.1560417761::p_fc("PTTG1IP(Y174)", "NU7441", inc) :- phosphosite("PTTG1IP(Y174)").
0.2239970377::p_fc("PTTG1IP(Y174)", "PD153035", dec); 0.2239970377::p_fc("PTTG1IP(Y174)", "PD153035", inc) :- phosphosite("PTTG1IP(Y174)").
0.3151979091::p_fc("PTTG1IP(Y174)", "PF3758309", dec); 0.3151979091::p_fc("PTTG1IP(Y174)", "PF3758309", inc) :- phosphosite("PTTG1IP(Y174)").
0.3265081914::p_fc("PTTG1IP(Y174)", "PF4708671", dec); 0.3265081914::p_fc("PTTG1IP(Y174)", "PF4708671", inc) :- phosphosite("PTTG1IP(Y174)").
0.4411080716::p_fc("PTTG1IP(Y174)", "PH797804", dec); 0.4411080716::p_fc("PTTG1IP(Y174)", "PH797804", inc) :- phosphosite("PTTG1IP(Y174)").
0.3848777109::p_fc("PTTG1IP(Y174)", "PIK294", dec); 0.3848777109::p_fc("PTTG1IP(Y174)", "PIK294", inc) :- phosphosite("PTTG1IP(Y174)").
0.0098489455::p_fc("PTTG1IP(Y174)", "Ribociclib", dec); 0.0098489455::p_fc("PTTG1IP(Y174)", "Ribociclib", inc) :- phosphosite("PTTG1IP(Y174)").
0.4402204571::p_fc("PTTG1IP(Y174)", "Ripasudil", dec); 0.4402204571::p_fc("PTTG1IP(Y174)", "Ripasudil", inc) :- phosphosite("PTTG1IP(Y174)").
0.4253011278::p_fc("PTTG1IP(Y174)", "SP600125", dec); 0.4253011278::p_fc("PTTG1IP(Y174)", "SP600125", inc) :- phosphosite("PTTG1IP(Y174)").
0.4720926776::p_fc("PTTG1IP(Y174)", "Selumetinib", dec); 0.4720926776::p_fc("PTTG1IP(Y174)", "Selumetinib", inc) :- phosphosite("PTTG1IP(Y174)").
0.2840895205::p_fc("PTTG1IP(Y174)", "TAK715", dec); 0.2840895205::p_fc("PTTG1IP(Y174)", "TAK715", inc) :- phosphosite("PTTG1IP(Y174)").
0.338525688::p_fc("PTTG1IP(Y174)", "TBCA", dec); 0.338525688::p_fc("PTTG1IP(Y174)", "TBCA", inc) :- phosphosite("PTTG1IP(Y174)").
0.4337117089::p_fc("PTTG1IP(Y174)", "TGX221", dec); 0.4337117089::p_fc("PTTG1IP(Y174)", "TGX221", inc) :- phosphosite("PTTG1IP(Y174)").
0.0465020647::p_fc("PTTG1IP(Y174)", "Tofacitinib", dec); 0.0465020647::p_fc("PTTG1IP(Y174)", "Tofacitinib", inc) :- phosphosite("PTTG1IP(Y174)").
0.3080850179::p_fc("PTTG1IP(Y174)", "Torin", dec); 0.3080850179::p_fc("PTTG1IP(Y174)", "Torin", inc) :- phosphosite("PTTG1IP(Y174)").
0.3813011838::p_fc("PTTG1IP(Y174)", "Trametinib", dec); 0.3813011838::p_fc("PTTG1IP(Y174)", "Trametinib", inc) :- phosphosite("PTTG1IP(Y174)").
0.2676510474::p_fc("PTTG1IP(Y174)", "U73122", dec); 0.2676510474::p_fc("PTTG1IP(Y174)", "U73122", inc) :- phosphosite("PTTG1IP(Y174)").
0.1874566609::p_fc("PTTG1IP(Y174)", "Ulixertinib", dec); 0.1874566609::p_fc("PTTG1IP(Y174)", "Ulixertinib", inc) :- phosphosite("PTTG1IP(Y174)").
0.2161139732::p_fc("PTTG1IP(Y174)", "Vemurafenib", dec); 0.2161139732::p_fc("PTTG1IP(Y174)", "Vemurafenib", inc) :- phosphosite("PTTG1IP(Y174)").
0.100484094::p_fc("PXN(Y118)", "AC220", dec); 0.100484094::p_fc("PXN(Y118)", "AC220", inc) :- phosphosite("PXN(Y118)").
0.0127361431::p_fc("PXN(Y118)", "AT13148", dec); 0.0127361431::p_fc("PXN(Y118)", "AT13148", inc) :- phosphosite("PXN(Y118)").
0.0403242849::p_fc("PXN(Y118)", "AZ20", dec); 0.0403242849::p_fc("PXN(Y118)", "AZ20", inc) :- phosphosite("PXN(Y118)").
0.1650535418::p_fc("PXN(Y118)", "AZD1480", dec); 0.1650535418::p_fc("PXN(Y118)", "AZD1480", inc) :- phosphosite("PXN(Y118)").
0.1070483723::p_fc("PXN(Y118)", "AZD3759", dec); 0.1070483723::p_fc("PXN(Y118)", "AZD3759", inc) :- phosphosite("PXN(Y118)").
0.4763414219::p_fc("PXN(Y118)", "AZD5363", dec); 0.4763414219::p_fc("PXN(Y118)", "AZD5363", inc) :- phosphosite("PXN(Y118)").
0.4258393526::p_fc("PXN(Y118)", "AZD5438", dec); 0.4258393526::p_fc("PXN(Y118)", "AZD5438", inc) :- phosphosite("PXN(Y118)").
0.1078606687::p_fc("PXN(Y118)", "AZD6482", dec); 0.1078606687::p_fc("PXN(Y118)", "AZD6482", inc) :- phosphosite("PXN(Y118)").
0.140074473::p_fc("PXN(Y118)", "AZD6738", dec); 0.140074473::p_fc("PXN(Y118)", "AZD6738", inc) :- phosphosite("PXN(Y118)").
0.0651504799::p_fc("PXN(Y118)", "AZD8055", dec); 0.0651504799::p_fc("PXN(Y118)", "AZD8055", inc) :- phosphosite("PXN(Y118)").
0.2509649128::p_fc("PXN(Y118)", "Amuvatinib", dec); 0.2509649128::p_fc("PXN(Y118)", "Amuvatinib", inc) :- phosphosite("PXN(Y118)").
0.1925073486::p_fc("PXN(Y118)", "BX912", dec); 0.1925073486::p_fc("PXN(Y118)", "BX912", inc) :- phosphosite("PXN(Y118)").
0.1271101607::p_fc("PXN(Y118)", "Bosutinib", dec); 0.1271101607::p_fc("PXN(Y118)", "Bosutinib", inc) :- phosphosite("PXN(Y118)").
0.4563711844::p_fc("PXN(Y118)", "CAL101", dec); 0.4563711844::p_fc("PXN(Y118)", "CAL101", inc) :- phosphosite("PXN(Y118)").
0.2850348275::p_fc("PXN(Y118)", "CHIR99021", dec); 0.2850348275::p_fc("PXN(Y118)", "CHIR99021", inc) :- phosphosite("PXN(Y118)").
0.196086389::p_fc("PXN(Y118)", "CX4945", dec); 0.196086389::p_fc("PXN(Y118)", "CX4945", inc) :- phosphosite("PXN(Y118)").
0.4244712907::p_fc("PXN(Y118)", "DNAPK", dec); 0.4244712907::p_fc("PXN(Y118)", "DNAPK", inc) :- phosphosite("PXN(Y118)").
0.2825767005::p_fc("PXN(Y118)", "Dabrafenib", dec); 0.2825767005::p_fc("PXN(Y118)", "Dabrafenib", inc) :- phosphosite("PXN(Y118)").
0.41852113::p_fc("PXN(Y118)", "Dasatinib", dec); 0.41852113::p_fc("PXN(Y118)", "Dasatinib", inc) :- phosphosite("PXN(Y118)").
0.0635314065::p_fc("PXN(Y118)", "Edelfosine", dec); 0.0635314065::p_fc("PXN(Y118)", "Edelfosine", inc) :- phosphosite("PXN(Y118)").
0.2320950856::p_fc("PXN(Y118)", "FRAX486", dec); 0.2320950856::p_fc("PXN(Y118)", "FRAX486", inc) :- phosphosite("PXN(Y118)").
0.4420873414::p_fc("PXN(Y118)", "GDC0941", dec); 0.4420873414::p_fc("PXN(Y118)", "GDC0941", inc) :- phosphosite("PXN(Y118)").
0.4852285079::p_fc("PXN(Y118)", "GDC0994", dec); 0.4852285079::p_fc("PXN(Y118)", "GDC0994", inc) :- phosphosite("PXN(Y118)").
0.2317540082::p_fc("PXN(Y118)", "GF109203X", dec); 0.2317540082::p_fc("PXN(Y118)", "GF109203X", inc) :- phosphosite("PXN(Y118)").
0.0056722596::p_fc("PXN(Y118)", "GO6983", dec); 0.0056722596::p_fc("PXN(Y118)", "GO6983", inc) :- phosphosite("PXN(Y118)").
0.0077499889::p_fc("PXN(Y118)", "GSK2334470", dec); 0.0077499889::p_fc("PXN(Y118)", "GSK2334470", inc) :- phosphosite("PXN(Y118)").
0.0155922989::p_fc("PXN(Y118)", "GSK690693", dec); 0.0155922989::p_fc("PXN(Y118)", "GSK690693", inc) :- phosphosite("PXN(Y118)").
0.1594095143::p_fc("PXN(Y118)", "Go6976", dec); 0.1594095143::p_fc("PXN(Y118)", "Go6976", inc) :- phosphosite("PXN(Y118)").
0.1172059631::p_fc("PXN(Y118)", "H89", dec); 0.1172059631::p_fc("PXN(Y118)", "H89", inc) :- phosphosite("PXN(Y118)").
0.4871256613::p_fc("PXN(Y118)", "HS173", dec); 0.4871256613::p_fc("PXN(Y118)", "HS173", inc) :- phosphosite("PXN(Y118)").
0.0754428825::p_fc("PXN(Y118)", "Ipatasertib", dec); 0.0754428825::p_fc("PXN(Y118)", "Ipatasertib", inc) :- phosphosite("PXN(Y118)").
0.2601538886::p_fc("PXN(Y118)", "JNJ", dec); 0.2601538886::p_fc("PXN(Y118)", "JNJ", inc) :- phosphosite("PXN(Y118)").
0.020809844::p_fc("PXN(Y118)", "JNK", dec); 0.020809844::p_fc("PXN(Y118)", "JNK", inc) :- phosphosite("PXN(Y118)").
0.0480520601::p_fc("PXN(Y118)", "KD025", dec); 0.0480520601::p_fc("PXN(Y118)", "KD025", inc) :- phosphosite("PXN(Y118)").
0.0517503838::p_fc("PXN(Y118)", "KN62", dec); 0.0517503838::p_fc("PXN(Y118)", "KN62", inc) :- phosphosite("PXN(Y118)").
0.2333161873::p_fc("PXN(Y118)", "KN93", dec); 0.2333161873::p_fc("PXN(Y118)", "KN93", inc) :- phosphosite("PXN(Y118)").
0.4464375995::p_fc("PXN(Y118)", "Ku0063794", dec); 0.4464375995::p_fc("PXN(Y118)", "Ku0063794", inc) :- phosphosite("PXN(Y118)").
0.3885244193::p_fc("PXN(Y118)", "LY2090314", dec); 0.3885244193::p_fc("PXN(Y118)", "LY2090314", inc) :- phosphosite("PXN(Y118)").
0.4125357179::p_fc("PXN(Y118)", "LY2584702", dec); 0.4125357179::p_fc("PXN(Y118)", "LY2584702", inc) :- phosphosite("PXN(Y118)").
0.2153948824::p_fc("PXN(Y118)", "LY2835219", dec); 0.2153948824::p_fc("PXN(Y118)", "LY2835219", inc) :- phosphosite("PXN(Y118)").
0.1024290366::p_fc("PXN(Y118)", "Linsitinib", dec); 0.1024290366::p_fc("PXN(Y118)", "Linsitinib", inc) :- phosphosite("PXN(Y118)").
0.2965577163::p_fc("PXN(Y118)", "MK2206", dec); 0.2965577163::p_fc("PXN(Y118)", "MK2206", inc) :- phosphosite("PXN(Y118)").
0.2157377659::p_fc("PXN(Y118)", "NU7441", dec); 0.2157377659::p_fc("PXN(Y118)", "NU7441", inc) :- phosphosite("PXN(Y118)").
0.0751864635::p_fc("PXN(Y118)", "PD153035", dec); 0.0751864635::p_fc("PXN(Y118)", "PD153035", inc) :- phosphosite("PXN(Y118)").
0.1500331197::p_fc("PXN(Y118)", "PF3758309", dec); 0.1500331197::p_fc("PXN(Y118)", "PF3758309", inc) :- phosphosite("PXN(Y118)").
0.2201309895::p_fc("PXN(Y118)", "PF4708671", dec); 0.2201309895::p_fc("PXN(Y118)", "PF4708671", inc) :- phosphosite("PXN(Y118)").
0.0975002782::p_fc("PXN(Y118)", "PH797804", dec); 0.0975002782::p_fc("PXN(Y118)", "PH797804", inc) :- phosphosite("PXN(Y118)").
0.2485169054::p_fc("PXN(Y118)", "PIK294", dec); 0.2485169054::p_fc("PXN(Y118)", "PIK294", inc) :- phosphosite("PXN(Y118)").
0.4597867781::p_fc("PXN(Y118)", "Ribociclib", dec); 0.4597867781::p_fc("PXN(Y118)", "Ribociclib", inc) :- phosphosite("PXN(Y118)").
0.0875397012::p_fc("PXN(Y118)", "Ripasudil", dec); 0.0875397012::p_fc("PXN(Y118)", "Ripasudil", inc) :- phosphosite("PXN(Y118)").
0.1433992886::p_fc("PXN(Y118)", "SP600125", dec); 0.1433992886::p_fc("PXN(Y118)", "SP600125", inc) :- phosphosite("PXN(Y118)").
0.1340981029::p_fc("PXN(Y118)", "Selumetinib", dec); 0.1340981029::p_fc("PXN(Y118)", "Selumetinib", inc) :- phosphosite("PXN(Y118)").
0.0828041949::p_fc("PXN(Y118)", "TAK715", dec); 0.0828041949::p_fc("PXN(Y118)", "TAK715", inc) :- phosphosite("PXN(Y118)").
0.3261070762::p_fc("PXN(Y118)", "TBCA", dec); 0.3261070762::p_fc("PXN(Y118)", "TBCA", inc) :- phosphosite("PXN(Y118)").
0.4488213516::p_fc("PXN(Y118)", "TGX221", dec); 0.4488213516::p_fc("PXN(Y118)", "TGX221", inc) :- phosphosite("PXN(Y118)").
0.1289119743::p_fc("PXN(Y118)", "Tofacitinib", dec); 0.1289119743::p_fc("PXN(Y118)", "Tofacitinib", inc) :- phosphosite("PXN(Y118)").
0.1253896528::p_fc("PXN(Y118)", "Torin", dec); 0.1253896528::p_fc("PXN(Y118)", "Torin", inc) :- phosphosite("PXN(Y118)").
0.1521575948::p_fc("PXN(Y118)", "Trametinib", dec); 0.1521575948::p_fc("PXN(Y118)", "Trametinib", inc) :- phosphosite("PXN(Y118)").
0.078617822::p_fc("PXN(Y118)", "U73122", dec); 0.078617822::p_fc("PXN(Y118)", "U73122", inc) :- phosphosite("PXN(Y118)").
0.1175366068::p_fc("PXN(Y118)", "Ulixertinib", dec); 0.1175366068::p_fc("PXN(Y118)", "Ulixertinib", inc) :- phosphosite("PXN(Y118)").
0.2482833793::p_fc("PXN(Y118)", "Vemurafenib", dec); 0.2482833793::p_fc("PXN(Y118)", "Vemurafenib", inc) :- phosphosite("PXN(Y118)").
0.4774638445::p_fc("PXN(Y88)", "AC220", dec); 0.4774638445::p_fc("PXN(Y88)", "AC220", inc) :- phosphosite("PXN(Y88)").
0.4901785246::p_fc("PXN(Y88)", "AT13148", dec); 0.4901785246::p_fc("PXN(Y88)", "AT13148", inc) :- phosphosite("PXN(Y88)").
0.435521762::p_fc("PXN(Y88)", "AZ20", dec); 0.435521762::p_fc("PXN(Y88)", "AZ20", inc) :- phosphosite("PXN(Y88)").
0.4787422438::p_fc("PXN(Y88)", "AZD1480", dec); 0.4787422438::p_fc("PXN(Y88)", "AZD1480", inc) :- phosphosite("PXN(Y88)").
0.0031332946::p_fc("PXN(Y88)", "AZD3759", dec); 0.0031332946::p_fc("PXN(Y88)", "AZD3759", inc) :- phosphosite("PXN(Y88)").
0.4338384842::p_fc("PXN(Y88)", "AZD5363", dec); 0.4338384842::p_fc("PXN(Y88)", "AZD5363", inc) :- phosphosite("PXN(Y88)").
0.0022540227::p_fc("PXN(Y88)", "AZD5438", dec); 0.0022540227::p_fc("PXN(Y88)", "AZD5438", inc) :- phosphosite("PXN(Y88)").
0.0336264066::p_fc("PXN(Y88)", "AZD6482", dec); 0.0336264066::p_fc("PXN(Y88)", "AZD6482", inc) :- phosphosite("PXN(Y88)").
0.0357135425::p_fc("PXN(Y88)", "AZD6738", dec); 0.0357135425::p_fc("PXN(Y88)", "AZD6738", inc) :- phosphosite("PXN(Y88)").
0.160351692::p_fc("PXN(Y88)", "AZD8055", dec); 0.160351692::p_fc("PXN(Y88)", "AZD8055", inc) :- phosphosite("PXN(Y88)").
0.0183731905::p_fc("PXN(Y88)", "Amuvatinib", dec); 0.0183731905::p_fc("PXN(Y88)", "Amuvatinib", inc) :- phosphosite("PXN(Y88)").
0.469370729::p_fc("PXN(Y88)", "BX912", dec); 0.469370729::p_fc("PXN(Y88)", "BX912", inc) :- phosphosite("PXN(Y88)").
0.0127959166::p_fc("PXN(Y88)", "Bosutinib", dec); 0.0127959166::p_fc("PXN(Y88)", "Bosutinib", inc) :- phosphosite("PXN(Y88)").
0.3207376967::p_fc("PXN(Y88)", "CAL101", dec); 0.3207376967::p_fc("PXN(Y88)", "CAL101", inc) :- phosphosite("PXN(Y88)").
0.4066004667::p_fc("PXN(Y88)", "CHIR99021", dec); 0.4066004667::p_fc("PXN(Y88)", "CHIR99021", inc) :- phosphosite("PXN(Y88)").
0.1070480293::p_fc("PXN(Y88)", "CX4945", dec); 0.1070480293::p_fc("PXN(Y88)", "CX4945", inc) :- phosphosite("PXN(Y88)").
0.2530005984::p_fc("PXN(Y88)", "DNAPK", dec); 0.2530005984::p_fc("PXN(Y88)", "DNAPK", inc) :- phosphosite("PXN(Y88)").
0.4645488274::p_fc("PXN(Y88)", "Dabrafenib", dec); 0.4645488274::p_fc("PXN(Y88)", "Dabrafenib", inc) :- phosphosite("PXN(Y88)").
0.0218603792::p_fc("PXN(Y88)", "Dasatinib", dec); 0.0218603792::p_fc("PXN(Y88)", "Dasatinib", inc) :- phosphosite("PXN(Y88)").
0.3006894939::p_fc("PXN(Y88)", "Edelfosine", dec); 0.3006894939::p_fc("PXN(Y88)", "Edelfosine", inc) :- phosphosite("PXN(Y88)").
0.0010413678::p_fc("PXN(Y88)", "FRAX486", dec); 0.0010413678::p_fc("PXN(Y88)", "FRAX486", inc) :- phosphosite("PXN(Y88)").
0.3136592723::p_fc("PXN(Y88)", "GDC0941", dec); 0.3136592723::p_fc("PXN(Y88)", "GDC0941", inc) :- phosphosite("PXN(Y88)").
0.4864440072::p_fc("PXN(Y88)", "GDC0994", dec); 0.4864440072::p_fc("PXN(Y88)", "GDC0994", inc) :- phosphosite("PXN(Y88)").
0.0009985041::p_fc("PXN(Y88)", "GF109203X", dec); 0.0009985041::p_fc("PXN(Y88)", "GF109203X", inc) :- phosphosite("PXN(Y88)").
0.4163807588::p_fc("PXN(Y88)", "GO6983", dec); 0.4163807588::p_fc("PXN(Y88)", "GO6983", inc) :- phosphosite("PXN(Y88)").
0.0363199121::p_fc("PXN(Y88)", "GSK2334470", dec); 0.0363199121::p_fc("PXN(Y88)", "GSK2334470", inc) :- phosphosite("PXN(Y88)").
0.3077699436::p_fc("PXN(Y88)", "GSK690693", dec); 0.3077699436::p_fc("PXN(Y88)", "GSK690693", inc) :- phosphosite("PXN(Y88)").
0.2769189061::p_fc("PXN(Y88)", "Go6976", dec); 0.2769189061::p_fc("PXN(Y88)", "Go6976", inc) :- phosphosite("PXN(Y88)").
0.1758500958::p_fc("PXN(Y88)", "H89", dec); 0.1758500958::p_fc("PXN(Y88)", "H89", inc) :- phosphosite("PXN(Y88)").
0.4701804047::p_fc("PXN(Y88)", "HS173", dec); 0.4701804047::p_fc("PXN(Y88)", "HS173", inc) :- phosphosite("PXN(Y88)").
0.0012742448::p_fc("PXN(Y88)", "Ipatasertib", dec); 0.0012742448::p_fc("PXN(Y88)", "Ipatasertib", inc) :- phosphosite("PXN(Y88)").
0.0010280949::p_fc("PXN(Y88)", "JNJ", dec); 0.0010280949::p_fc("PXN(Y88)", "JNJ", inc) :- phosphosite("PXN(Y88)").
0.2062486763::p_fc("PXN(Y88)", "JNK", dec); 0.2062486763::p_fc("PXN(Y88)", "JNK", inc) :- phosphosite("PXN(Y88)").
0.0751397959::p_fc("PXN(Y88)", "KD025", dec); 0.0751397959::p_fc("PXN(Y88)", "KD025", inc) :- phosphosite("PXN(Y88)").
0.001209934::p_fc("PXN(Y88)", "KN62", dec); 0.001209934::p_fc("PXN(Y88)", "KN62", inc) :- phosphosite("PXN(Y88)").
0.3667959081::p_fc("PXN(Y88)", "KN93", dec); 0.3667959081::p_fc("PXN(Y88)", "KN93", inc) :- phosphosite("PXN(Y88)").
0.005021672::p_fc("PXN(Y88)", "Ku0063794", dec); 0.005021672::p_fc("PXN(Y88)", "Ku0063794", inc) :- phosphosite("PXN(Y88)").
0.3582442027::p_fc("PXN(Y88)", "LY2090314", dec); 0.3582442027::p_fc("PXN(Y88)", "LY2090314", inc) :- phosphosite("PXN(Y88)").
0.288249207::p_fc("PXN(Y88)", "LY2584702", dec); 0.288249207::p_fc("PXN(Y88)", "LY2584702", inc) :- phosphosite("PXN(Y88)").
0.0049065258::p_fc("PXN(Y88)", "LY2835219", dec); 0.0049065258::p_fc("PXN(Y88)", "LY2835219", inc) :- phosphosite("PXN(Y88)").
0.0039488455::p_fc("PXN(Y88)", "Linsitinib", dec); 0.0039488455::p_fc("PXN(Y88)", "Linsitinib", inc) :- phosphosite("PXN(Y88)").
0.4231317354::p_fc("PXN(Y88)", "MK2206", dec); 0.4231317354::p_fc("PXN(Y88)", "MK2206", inc) :- phosphosite("PXN(Y88)").
0.2018936433::p_fc("PXN(Y88)", "NU7441", dec); 0.2018936433::p_fc("PXN(Y88)", "NU7441", inc) :- phosphosite("PXN(Y88)").
0.4071985407::p_fc("PXN(Y88)", "PD153035", dec); 0.4071985407::p_fc("PXN(Y88)", "PD153035", inc) :- phosphosite("PXN(Y88)").
0.1096343825::p_fc("PXN(Y88)", "PF3758309", dec); 0.1096343825::p_fc("PXN(Y88)", "PF3758309", inc) :- phosphosite("PXN(Y88)").
0.4444085478::p_fc("PXN(Y88)", "PF4708671", dec); 0.4444085478::p_fc("PXN(Y88)", "PF4708671", inc) :- phosphosite("PXN(Y88)").
0.4519540017::p_fc("PXN(Y88)", "PH797804", dec); 0.4519540017::p_fc("PXN(Y88)", "PH797804", inc) :- phosphosite("PXN(Y88)").
0.2206842481::p_fc("PXN(Y88)", "PIK294", dec); 0.2206842481::p_fc("PXN(Y88)", "PIK294", inc) :- phosphosite("PXN(Y88)").
0.0011964883::p_fc("PXN(Y88)", "Ribociclib", dec); 0.0011964883::p_fc("PXN(Y88)", "Ribociclib", inc) :- phosphosite("PXN(Y88)").
0.3429973173::p_fc("PXN(Y88)", "Ripasudil", dec); 0.3429973173::p_fc("PXN(Y88)", "Ripasudil", inc) :- phosphosite("PXN(Y88)").
0.4828116461::p_fc("PXN(Y88)", "SP600125", dec); 0.4828116461::p_fc("PXN(Y88)", "SP600125", inc) :- phosphosite("PXN(Y88)").
0.4002895512::p_fc("PXN(Y88)", "Selumetinib", dec); 0.4002895512::p_fc("PXN(Y88)", "Selumetinib", inc) :- phosphosite("PXN(Y88)").
0.36104244::p_fc("PXN(Y88)", "TAK715", dec); 0.36104244::p_fc("PXN(Y88)", "TAK715", inc) :- phosphosite("PXN(Y88)").
0.4526806285::p_fc("PXN(Y88)", "TBCA", dec); 0.4526806285::p_fc("PXN(Y88)", "TBCA", inc) :- phosphosite("PXN(Y88)").
0.1525138916::p_fc("PXN(Y88)", "TGX221", dec); 0.1525138916::p_fc("PXN(Y88)", "TGX221", inc) :- phosphosite("PXN(Y88)").
0.1068034156::p_fc("PXN(Y88)", "Tofacitinib", dec); 0.1068034156::p_fc("PXN(Y88)", "Tofacitinib", inc) :- phosphosite("PXN(Y88)").
0.0010013491::p_fc("PXN(Y88)", "Torin", dec); 0.0010013491::p_fc("PXN(Y88)", "Torin", inc) :- phosphosite("PXN(Y88)").
0.0033032922::p_fc("PXN(Y88)", "Trametinib", dec); 0.0033032922::p_fc("PXN(Y88)", "Trametinib", inc) :- phosphosite("PXN(Y88)").
0.2242629695::p_fc("PXN(Y88)", "U73122", dec); 0.2242629695::p_fc("PXN(Y88)", "U73122", inc) :- phosphosite("PXN(Y88)").
0.1006957732::p_fc("PXN(Y88)", "Ulixertinib", dec); 0.1006957732::p_fc("PXN(Y88)", "Ulixertinib", inc) :- phosphosite("PXN(Y88)").
0.1471995263::p_fc("PXN(Y88)", "Vemurafenib", dec); 0.1471995263::p_fc("PXN(Y88)", "Vemurafenib", inc) :- phosphosite("PXN(Y88)").
0.0355130566::p_fc("RBM39(Y95)", "AC220", dec); 0.0355130566::p_fc("RBM39(Y95)", "AC220", inc) :- phosphosite("RBM39(Y95)").
0.1198381575::p_fc("RBM39(Y95)", "AT13148", dec); 0.1198381575::p_fc("RBM39(Y95)", "AT13148", inc) :- phosphosite("RBM39(Y95)").
0.2429522263::p_fc("RBM39(Y95)", "AZ20", dec); 0.2429522263::p_fc("RBM39(Y95)", "AZ20", inc) :- phosphosite("RBM39(Y95)").
0.1938262473::p_fc("RBM39(Y95)", "AZD1480", dec); 0.1938262473::p_fc("RBM39(Y95)", "AZD1480", inc) :- phosphosite("RBM39(Y95)").
0.2265110729::p_fc("RBM39(Y95)", "AZD3759", dec); 0.2265110729::p_fc("RBM39(Y95)", "AZD3759", inc) :- phosphosite("RBM39(Y95)").
0.023712301::p_fc("RBM39(Y95)", "AZD5363", dec); 0.023712301::p_fc("RBM39(Y95)", "AZD5363", inc) :- phosphosite("RBM39(Y95)").
0.2856190564::p_fc("RBM39(Y95)", "AZD5438", dec); 0.2856190564::p_fc("RBM39(Y95)", "AZD5438", inc) :- phosphosite("RBM39(Y95)").
0.4842559501::p_fc("RBM39(Y95)", "AZD6482", dec); 0.4842559501::p_fc("RBM39(Y95)", "AZD6482", inc) :- phosphosite("RBM39(Y95)").
0.2157336283::p_fc("RBM39(Y95)", "AZD6738", dec); 0.2157336283::p_fc("RBM39(Y95)", "AZD6738", inc) :- phosphosite("RBM39(Y95)").
0.000997006::p_fc("RBM39(Y95)", "AZD8055", dec); 0.000997006::p_fc("RBM39(Y95)", "AZD8055", inc) :- phosphosite("RBM39(Y95)").
0.1300222112::p_fc("RBM39(Y95)", "Amuvatinib", dec); 0.1300222112::p_fc("RBM39(Y95)", "Amuvatinib", inc) :- phosphosite("RBM39(Y95)").
0.311412358::p_fc("RBM39(Y95)", "BX912", dec); 0.311412358::p_fc("RBM39(Y95)", "BX912", inc) :- phosphosite("RBM39(Y95)").
0.3562944714::p_fc("RBM39(Y95)", "Bosutinib", dec); 0.3562944714::p_fc("RBM39(Y95)", "Bosutinib", inc) :- phosphosite("RBM39(Y95)").
0.2669129352::p_fc("RBM39(Y95)", "CAL101", dec); 0.2669129352::p_fc("RBM39(Y95)", "CAL101", inc) :- phosphosite("RBM39(Y95)").
0.3233562795::p_fc("RBM39(Y95)", "CHIR99021", dec); 0.3233562795::p_fc("RBM39(Y95)", "CHIR99021", inc) :- phosphosite("RBM39(Y95)").
0.2502600673::p_fc("RBM39(Y95)", "CX4945", dec); 0.2502600673::p_fc("RBM39(Y95)", "CX4945", inc) :- phosphosite("RBM39(Y95)").
0.4162254918::p_fc("RBM39(Y95)", "DNAPK", dec); 0.4162254918::p_fc("RBM39(Y95)", "DNAPK", inc) :- phosphosite("RBM39(Y95)").
0.400178603::p_fc("RBM39(Y95)", "Dabrafenib", dec); 0.400178603::p_fc("RBM39(Y95)", "Dabrafenib", inc) :- phosphosite("RBM39(Y95)").
0.4691266615::p_fc("RBM39(Y95)", "Dasatinib", dec); 0.4691266615::p_fc("RBM39(Y95)", "Dasatinib", inc) :- phosphosite("RBM39(Y95)").
0.0152562463::p_fc("RBM39(Y95)", "Edelfosine", dec); 0.0152562463::p_fc("RBM39(Y95)", "Edelfosine", inc) :- phosphosite("RBM39(Y95)").
0.2121296417::p_fc("RBM39(Y95)", "FRAX486", dec); 0.2121296417::p_fc("RBM39(Y95)", "FRAX486", inc) :- phosphosite("RBM39(Y95)").
0.0163199771::p_fc("RBM39(Y95)", "GDC0941", dec); 0.0163199771::p_fc("RBM39(Y95)", "GDC0941", inc) :- phosphosite("RBM39(Y95)").
0.4890890611::p_fc("RBM39(Y95)", "GDC0994", dec); 0.4890890611::p_fc("RBM39(Y95)", "GDC0994", inc) :- phosphosite("RBM39(Y95)").
0.1599737053::p_fc("RBM39(Y95)", "GF109203X", dec); 0.1599737053::p_fc("RBM39(Y95)", "GF109203X", inc) :- phosphosite("RBM39(Y95)").
0.000997006::p_fc("RBM39(Y95)", "GO6983", dec); 0.000997006::p_fc("RBM39(Y95)", "GO6983", inc) :- phosphosite("RBM39(Y95)").
0.4429517326::p_fc("RBM39(Y95)", "GSK2334470", dec); 0.4429517326::p_fc("RBM39(Y95)", "GSK2334470", inc) :- phosphosite("RBM39(Y95)").
0.0446778741::p_fc("RBM39(Y95)", "GSK690693", dec); 0.0446778741::p_fc("RBM39(Y95)", "GSK690693", inc) :- phosphosite("RBM39(Y95)").
0.3010587967::p_fc("RBM39(Y95)", "Go6976", dec); 0.3010587967::p_fc("RBM39(Y95)", "Go6976", inc) :- phosphosite("RBM39(Y95)").
0.4434358381::p_fc("RBM39(Y95)", "H89", dec); 0.4434358381::p_fc("RBM39(Y95)", "H89", inc) :- phosphosite("RBM39(Y95)").
0.3484255835::p_fc("RBM39(Y95)", "HS173", dec); 0.3484255835::p_fc("RBM39(Y95)", "HS173", inc) :- phosphosite("RBM39(Y95)").
0.3865455096::p_fc("RBM39(Y95)", "Ipatasertib", dec); 0.3865455096::p_fc("RBM39(Y95)", "Ipatasertib", inc) :- phosphosite("RBM39(Y95)").
0.4197313643::p_fc("RBM39(Y95)", "JNJ", dec); 0.4197313643::p_fc("RBM39(Y95)", "JNJ", inc) :- phosphosite("RBM39(Y95)").
0.0020426737::p_fc("RBM39(Y95)", "JNK", dec); 0.0020426737::p_fc("RBM39(Y95)", "JNK", inc) :- phosphosite("RBM39(Y95)").
0.0158648937::p_fc("RBM39(Y95)", "KD025", dec); 0.0158648937::p_fc("RBM39(Y95)", "KD025", inc) :- phosphosite("RBM39(Y95)").
0.1723121072::p_fc("RBM39(Y95)", "KN62", dec); 0.1723121072::p_fc("RBM39(Y95)", "KN62", inc) :- phosphosite("RBM39(Y95)").
0.4109248421::p_fc("RBM39(Y95)", "KN93", dec); 0.4109248421::p_fc("RBM39(Y95)", "KN93", inc) :- phosphosite("RBM39(Y95)").
0.2472184612::p_fc("RBM39(Y95)", "Ku0063794", dec); 0.2472184612::p_fc("RBM39(Y95)", "Ku0063794", inc) :- phosphosite("RBM39(Y95)").
0.4738471177::p_fc("RBM39(Y95)", "LY2090314", dec); 0.4738471177::p_fc("RBM39(Y95)", "LY2090314", inc) :- phosphosite("RBM39(Y95)").
0.455583066::p_fc("RBM39(Y95)", "LY2584702", dec); 0.455583066::p_fc("RBM39(Y95)", "LY2584702", inc) :- phosphosite("RBM39(Y95)").
0.3356994646::p_fc("RBM39(Y95)", "LY2835219", dec); 0.3356994646::p_fc("RBM39(Y95)", "LY2835219", inc) :- phosphosite("RBM39(Y95)").
0.2526324677::p_fc("RBM39(Y95)", "Linsitinib", dec); 0.2526324677::p_fc("RBM39(Y95)", "Linsitinib", inc) :- phosphosite("RBM39(Y95)").
0.4294778752::p_fc("RBM39(Y95)", "MK2206", dec); 0.4294778752::p_fc("RBM39(Y95)", "MK2206", inc) :- phosphosite("RBM39(Y95)").
0.3857778967::p_fc("RBM39(Y95)", "NU7441", dec); 0.3857778967::p_fc("RBM39(Y95)", "NU7441", inc) :- phosphosite("RBM39(Y95)").
0.2334509225::p_fc("RBM39(Y95)", "PD153035", dec); 0.2334509225::p_fc("RBM39(Y95)", "PD153035", inc) :- phosphosite("RBM39(Y95)").
0.0009975523::p_fc("RBM39(Y95)", "PF3758309", dec); 0.0009975523::p_fc("RBM39(Y95)", "PF3758309", inc) :- phosphosite("RBM39(Y95)").
0.1784892166::p_fc("RBM39(Y95)", "PF4708671", dec); 0.1784892166::p_fc("RBM39(Y95)", "PF4708671", inc) :- phosphosite("RBM39(Y95)").
0.0925241531::p_fc("RBM39(Y95)", "PH797804", dec); 0.0925241531::p_fc("RBM39(Y95)", "PH797804", inc) :- phosphosite("RBM39(Y95)").
0.3218365964::p_fc("RBM39(Y95)", "PIK294", dec); 0.3218365964::p_fc("RBM39(Y95)", "PIK294", inc) :- phosphosite("RBM39(Y95)").
0.440393426::p_fc("RBM39(Y95)", "Ribociclib", dec); 0.440393426::p_fc("RBM39(Y95)", "Ribociclib", inc) :- phosphosite("RBM39(Y95)").
0.1364860484::p_fc("RBM39(Y95)", "Ripasudil", dec); 0.1364860484::p_fc("RBM39(Y95)", "Ripasudil", inc) :- phosphosite("RBM39(Y95)").
0.1917183806::p_fc("RBM39(Y95)", "SP600125", dec); 0.1917183806::p_fc("RBM39(Y95)", "SP600125", inc) :- phosphosite("RBM39(Y95)").
0.2245429553::p_fc("RBM39(Y95)", "Selumetinib", dec); 0.2245429553::p_fc("RBM39(Y95)", "Selumetinib", inc) :- phosphosite("RBM39(Y95)").
0.4456897433::p_fc("RBM39(Y95)", "TAK715", dec); 0.4456897433::p_fc("RBM39(Y95)", "TAK715", inc) :- phosphosite("RBM39(Y95)").
0.248328789::p_fc("RBM39(Y95)", "TBCA", dec); 0.248328789::p_fc("RBM39(Y95)", "TBCA", inc) :- phosphosite("RBM39(Y95)").
0.4064386284::p_fc("RBM39(Y95)", "TGX221", dec); 0.4064386284::p_fc("RBM39(Y95)", "TGX221", inc) :- phosphosite("RBM39(Y95)").
0.2649035007::p_fc("RBM39(Y95)", "Tofacitinib", dec); 0.2649035007::p_fc("RBM39(Y95)", "Tofacitinib", inc) :- phosphosite("RBM39(Y95)").
0.3218147537::p_fc("RBM39(Y95)", "Torin", dec); 0.3218147537::p_fc("RBM39(Y95)", "Torin", inc) :- phosphosite("RBM39(Y95)").
0.1154880091::p_fc("RBM39(Y95)", "Trametinib", dec); 0.1154880091::p_fc("RBM39(Y95)", "Trametinib", inc) :- phosphosite("RBM39(Y95)").
0.3159354914::p_fc("RBM39(Y95)", "U73122", dec); 0.3159354914::p_fc("RBM39(Y95)", "U73122", inc) :- phosphosite("RBM39(Y95)").
0.0596846628::p_fc("RBM39(Y95)", "Ulixertinib", dec); 0.0596846628::p_fc("RBM39(Y95)", "Ulixertinib", inc) :- phosphosite("RBM39(Y95)").
0.35482934::p_fc("RBM39(Y95)", "Vemurafenib", dec); 0.35482934::p_fc("RBM39(Y95)", "Vemurafenib", inc) :- phosphosite("RBM39(Y95)").
0.119469693::p_fc("SRC(S17)", "AC220", dec); 0.119469693::p_fc("SRC(S17)", "AC220", inc) :- phosphosite("SRC(S17)").
0.0011762258::p_fc("SRC(S17)", "AT13148", dec); 0.0011762258::p_fc("SRC(S17)", "AT13148", inc) :- phosphosite("SRC(S17)").
0.0067457304::p_fc("SRC(S17)", "AZ20", dec); 0.0067457304::p_fc("SRC(S17)", "AZ20", inc) :- phosphosite("SRC(S17)").
0.1879303704::p_fc("SRC(S17)", "AZD1480", dec); 0.1879303704::p_fc("SRC(S17)", "AZD1480", inc) :- phosphosite("SRC(S17)").
0.069405269::p_fc("SRC(S17)", "AZD3759", dec); 0.069405269::p_fc("SRC(S17)", "AZD3759", inc) :- phosphosite("SRC(S17)").
0.3797912318::p_fc("SRC(S17)", "AZD5363", dec); 0.3797912318::p_fc("SRC(S17)", "AZD5363", inc) :- phosphosite("SRC(S17)").
0.3529924187::p_fc("SRC(S17)", "AZD5438", dec); 0.3529924187::p_fc("SRC(S17)", "AZD5438", inc) :- phosphosite("SRC(S17)").
0.0512709734::p_fc("SRC(S17)", "AZD6482", dec); 0.0512709734::p_fc("SRC(S17)", "AZD6482", inc) :- phosphosite("SRC(S17)").
0.1825208796::p_fc("SRC(S17)", "AZD6738", dec); 0.1825208796::p_fc("SRC(S17)", "AZD6738", inc) :- phosphosite("SRC(S17)").
0.0010007565::p_fc("SRC(S17)", "AZD8055", dec); 0.0010007565::p_fc("SRC(S17)", "AZD8055", inc) :- phosphosite("SRC(S17)").
0.4904848662::p_fc("SRC(S17)", "Amuvatinib", dec); 0.4904848662::p_fc("SRC(S17)", "Amuvatinib", inc) :- phosphosite("SRC(S17)").
0.182907678::p_fc("SRC(S17)", "BX912", dec); 0.182907678::p_fc("SRC(S17)", "BX912", inc) :- phosphosite("SRC(S17)").
0.1031565435::p_fc("SRC(S17)", "Bosutinib", dec); 0.1031565435::p_fc("SRC(S17)", "Bosutinib", inc) :- phosphosite("SRC(S17)").
0.3583024746::p_fc("SRC(S17)", "CAL101", dec); 0.3583024746::p_fc("SRC(S17)", "CAL101", inc) :- phosphosite("SRC(S17)").
0.0516913516::p_fc("SRC(S17)", "CHIR99021", dec); 0.0516913516::p_fc("SRC(S17)", "CHIR99021", inc) :- phosphosite("SRC(S17)").
0.4024339894::p_fc("SRC(S17)", "CX4945", dec); 0.4024339894::p_fc("SRC(S17)", "CX4945", inc) :- phosphosite("SRC(S17)").
0.0060746492::p_fc("SRC(S17)", "DNAPK", dec); 0.0060746492::p_fc("SRC(S17)", "DNAPK", inc) :- phosphosite("SRC(S17)").
0.2844472421::p_fc("SRC(S17)", "Dabrafenib", dec); 0.2844472421::p_fc("SRC(S17)", "Dabrafenib", inc) :- phosphosite("SRC(S17)").
0.0010161434::p_fc("SRC(S17)", "Dasatinib", dec); 0.0010161434::p_fc("SRC(S17)", "Dasatinib", inc) :- phosphosite("SRC(S17)").
0.0556462729::p_fc("SRC(S17)", "Edelfosine", dec); 0.0556462729::p_fc("SRC(S17)", "Edelfosine", inc) :- phosphosite("SRC(S17)").
0.2211923237::p_fc("SRC(S17)", "FRAX486", dec); 0.2211923237::p_fc("SRC(S17)", "FRAX486", inc) :- phosphosite("SRC(S17)").
0.1656054686::p_fc("SRC(S17)", "GDC0941", dec); 0.1656054686::p_fc("SRC(S17)", "GDC0941", inc) :- phosphosite("SRC(S17)").
0.0009993171::p_fc("SRC(S17)", "GDC0994", dec); 0.0009993171::p_fc("SRC(S17)", "GDC0994", inc) :- phosphosite("SRC(S17)").
0.0266436134::p_fc("SRC(S17)", "GF109203X", dec); 0.0266436134::p_fc("SRC(S17)", "GF109203X", inc) :- phosphosite("SRC(S17)").
0.0043070574::p_fc("SRC(S17)", "GO6983", dec); 0.0043070574::p_fc("SRC(S17)", "GO6983", inc) :- phosphosite("SRC(S17)").
0.0278270433::p_fc("SRC(S17)", "GSK2334470", dec); 0.0278270433::p_fc("SRC(S17)", "GSK2334470", inc) :- phosphosite("SRC(S17)").
0.080169398::p_fc("SRC(S17)", "GSK690693", dec); 0.080169398::p_fc("SRC(S17)", "GSK690693", inc) :- phosphosite("SRC(S17)").
0.4366719615::p_fc("SRC(S17)", "Go6976", dec); 0.4366719615::p_fc("SRC(S17)", "Go6976", inc) :- phosphosite("SRC(S17)").
0.2454603255::p_fc("SRC(S17)", "H89", dec); 0.2454603255::p_fc("SRC(S17)", "H89", inc) :- phosphosite("SRC(S17)").
0.3347389706::p_fc("SRC(S17)", "HS173", dec); 0.3347389706::p_fc("SRC(S17)", "HS173", inc) :- phosphosite("SRC(S17)").
0.1041438294::p_fc("SRC(S17)", "Ipatasertib", dec); 0.1041438294::p_fc("SRC(S17)", "Ipatasertib", inc) :- phosphosite("SRC(S17)").
0.0205107105::p_fc("SRC(S17)", "JNJ", dec); 0.0205107105::p_fc("SRC(S17)", "JNJ", inc) :- phosphosite("SRC(S17)").
0.227884751::p_fc("SRC(S17)", "JNK", dec); 0.227884751::p_fc("SRC(S17)", "JNK", inc) :- phosphosite("SRC(S17)").
0.0608437479::p_fc("SRC(S17)", "KD025", dec); 0.0608437479::p_fc("SRC(S17)", "KD025", inc) :- phosphosite("SRC(S17)").
0.435837445::p_fc("SRC(S17)", "KN62", dec); 0.435837445::p_fc("SRC(S17)", "KN62", inc) :- phosphosite("SRC(S17)").
0.4873135437::p_fc("SRC(S17)", "KN93", dec); 0.4873135437::p_fc("SRC(S17)", "KN93", inc) :- phosphosite("SRC(S17)").
0.0270826181::p_fc("SRC(S17)", "Ku0063794", dec); 0.0270826181::p_fc("SRC(S17)", "Ku0063794", inc) :- phosphosite("SRC(S17)").
0.2067199233::p_fc("SRC(S17)", "LY2090314", dec); 0.2067199233::p_fc("SRC(S17)", "LY2090314", inc) :- phosphosite("SRC(S17)").
0.0789593967::p_fc("SRC(S17)", "LY2584702", dec); 0.0789593967::p_fc("SRC(S17)", "LY2584702", inc) :- phosphosite("SRC(S17)").
0.0898529011::p_fc("SRC(S17)", "LY2835219", dec); 0.0898529011::p_fc("SRC(S17)", "LY2835219", inc) :- phosphosite("SRC(S17)").
0.1459253386::p_fc("SRC(S17)", "Linsitinib", dec); 0.1459253386::p_fc("SRC(S17)", "Linsitinib", inc) :- phosphosite("SRC(S17)").
0.0562329612::p_fc("SRC(S17)", "MK2206", dec); 0.0562329612::p_fc("SRC(S17)", "MK2206", inc) :- phosphosite("SRC(S17)").
0.0341977402::p_fc("SRC(S17)", "NU7441", dec); 0.0341977402::p_fc("SRC(S17)", "NU7441", inc) :- phosphosite("SRC(S17)").
0.1120545354::p_fc("SRC(S17)", "PD153035", dec); 0.1120545354::p_fc("SRC(S17)", "PD153035", inc) :- phosphosite("SRC(S17)").
0.3252797192::p_fc("SRC(S17)", "PF3758309", dec); 0.3252797192::p_fc("SRC(S17)", "PF3758309", inc) :- phosphosite("SRC(S17)").
0.0015619313::p_fc("SRC(S17)", "PF4708671", dec); 0.0015619313::p_fc("SRC(S17)", "PF4708671", inc) :- phosphosite("SRC(S17)").
0.0861582284::p_fc("SRC(S17)", "PH797804", dec); 0.0861582284::p_fc("SRC(S17)", "PH797804", inc) :- phosphosite("SRC(S17)").
0.1326405795::p_fc("SRC(S17)", "PIK294", dec); 0.1326405795::p_fc("SRC(S17)", "PIK294", inc) :- phosphosite("SRC(S17)").
0.473434143::p_fc("SRC(S17)", "Ribociclib", dec); 0.473434143::p_fc("SRC(S17)", "Ribociclib", inc) :- phosphosite("SRC(S17)").
0.1126524383::p_fc("SRC(S17)", "Ripasudil", dec); 0.1126524383::p_fc("SRC(S17)", "Ripasudil", inc) :- phosphosite("SRC(S17)").
0.1045802433::p_fc("SRC(S17)", "SP600125", dec); 0.1045802433::p_fc("SRC(S17)", "SP600125", inc) :- phosphosite("SRC(S17)").
0.0017782563::p_fc("SRC(S17)", "Selumetinib", dec); 0.0017782563::p_fc("SRC(S17)", "Selumetinib", inc) :- phosphosite("SRC(S17)").
0.1168809286::p_fc("SRC(S17)", "TAK715", dec); 0.1168809286::p_fc("SRC(S17)", "TAK715", inc) :- phosphosite("SRC(S17)").
0.0570725258::p_fc("SRC(S17)", "TBCA", dec); 0.0570725258::p_fc("SRC(S17)", "TBCA", inc) :- phosphosite("SRC(S17)").
0.026503809::p_fc("SRC(S17)", "TGX221", dec); 0.026503809::p_fc("SRC(S17)", "TGX221", inc) :- phosphosite("SRC(S17)").
0.4105854846::p_fc("SRC(S17)", "Tofacitinib", dec); 0.4105854846::p_fc("SRC(S17)", "Tofacitinib", inc) :- phosphosite("SRC(S17)").
0.0666885729::p_fc("SRC(S17)", "Torin", dec); 0.0666885729::p_fc("SRC(S17)", "Torin", inc) :- phosphosite("SRC(S17)").
0.036646163::p_fc("SRC(S17)", "Trametinib", dec); 0.036646163::p_fc("SRC(S17)", "Trametinib", inc) :- phosphosite("SRC(S17)").
0.0079348108::p_fc("SRC(S17)", "U73122", dec); 0.0079348108::p_fc("SRC(S17)", "U73122", inc) :- phosphosite("SRC(S17)").
0.000997006::p_fc("SRC(S17)", "Ulixertinib", dec); 0.000997006::p_fc("SRC(S17)", "Ulixertinib", inc) :- phosphosite("SRC(S17)").
0.0072762439::p_fc("SRC(S17)", "Vemurafenib", dec); 0.0072762439::p_fc("SRC(S17)", "Vemurafenib", inc) :- phosphosite("SRC(S17)").
0.0564702281::p_fc("SRC(S75)", "AC220", dec); 0.0564702281::p_fc("SRC(S75)", "AC220", inc) :- phosphosite("SRC(S75)").
0.0444756129::p_fc("SRC(S75)", "AT13148", dec); 0.0444756129::p_fc("SRC(S75)", "AT13148", inc) :- phosphosite("SRC(S75)").
0.2920409403::p_fc("SRC(S75)", "AZ20", dec); 0.2920409403::p_fc("SRC(S75)", "AZ20", inc) :- phosphosite("SRC(S75)").
0.3955545178::p_fc("SRC(S75)", "AZD1480", dec); 0.3955545178::p_fc("SRC(S75)", "AZD1480", inc) :- phosphosite("SRC(S75)").
0.0995489459::p_fc("SRC(S75)", "AZD3759", dec); 0.0995489459::p_fc("SRC(S75)", "AZD3759", inc) :- phosphosite("SRC(S75)").
0.2021862446::p_fc("SRC(S75)", "AZD5363", dec); 0.2021862446::p_fc("SRC(S75)", "AZD5363", inc) :- phosphosite("SRC(S75)").
0.2530529744::p_fc("SRC(S75)", "AZD5438", dec); 0.2530529744::p_fc("SRC(S75)", "AZD5438", inc) :- phosphosite("SRC(S75)").
0.0978999802::p_fc("SRC(S75)", "AZD6482", dec); 0.0978999802::p_fc("SRC(S75)", "AZD6482", inc) :- phosphosite("SRC(S75)").
0.2965259128::p_fc("SRC(S75)", "AZD6738", dec); 0.2965259128::p_fc("SRC(S75)", "AZD6738", inc) :- phosphosite("SRC(S75)").
0.1991506482::p_fc("SRC(S75)", "AZD8055", dec); 0.1991506482::p_fc("SRC(S75)", "AZD8055", inc) :- phosphosite("SRC(S75)").
0.3416552488::p_fc("SRC(S75)", "Amuvatinib", dec); 0.3416552488::p_fc("SRC(S75)", "Amuvatinib", inc) :- phosphosite("SRC(S75)").
0.4633361398::p_fc("SRC(S75)", "BX912", dec); 0.4633361398::p_fc("SRC(S75)", "BX912", inc) :- phosphosite("SRC(S75)").
0.3291314525::p_fc("SRC(S75)", "Bosutinib", dec); 0.3291314525::p_fc("SRC(S75)", "Bosutinib", inc) :- phosphosite("SRC(S75)").
0.162139245::p_fc("SRC(S75)", "CAL101", dec); 0.162139245::p_fc("SRC(S75)", "CAL101", inc) :- phosphosite("SRC(S75)").
0.1079802685::p_fc("SRC(S75)", "CHIR99021", dec); 0.1079802685::p_fc("SRC(S75)", "CHIR99021", inc) :- phosphosite("SRC(S75)").
0.2663902098::p_fc("SRC(S75)", "CX4945", dec); 0.2663902098::p_fc("SRC(S75)", "CX4945", inc) :- phosphosite("SRC(S75)").
0.3321194623::p_fc("SRC(S75)", "DNAPK", dec); 0.3321194623::p_fc("SRC(S75)", "DNAPK", inc) :- phosphosite("SRC(S75)").
0.2833547349::p_fc("SRC(S75)", "Dabrafenib", dec); 0.2833547349::p_fc("SRC(S75)", "Dabrafenib", inc) :- phosphosite("SRC(S75)").
0.1513627593::p_fc("SRC(S75)", "Dasatinib", dec); 0.1513627593::p_fc("SRC(S75)", "Dasatinib", inc) :- phosphosite("SRC(S75)").
0.4146011306::p_fc("SRC(S75)", "Edelfosine", dec); 0.4146011306::p_fc("SRC(S75)", "Edelfosine", inc) :- phosphosite("SRC(S75)").
0.182289618::p_fc("SRC(S75)", "FRAX486", dec); 0.182289618::p_fc("SRC(S75)", "FRAX486", inc) :- phosphosite("SRC(S75)").
0.439710377::p_fc("SRC(S75)", "GDC0941", dec); 0.439710377::p_fc("SRC(S75)", "GDC0941", inc) :- phosphosite("SRC(S75)").
0.0373736576::p_fc("SRC(S75)", "GDC0994", dec); 0.0373736576::p_fc("SRC(S75)", "GDC0994", inc) :- phosphosite("SRC(S75)").
0.1660423091::p_fc("SRC(S75)", "GF109203X", dec); 0.1660423091::p_fc("SRC(S75)", "GF109203X", inc) :- phosphosite("SRC(S75)").
0.0722409785::p_fc("SRC(S75)", "GO6983", dec); 0.0722409785::p_fc("SRC(S75)", "GO6983", inc) :- phosphosite("SRC(S75)").
0.0603154343::p_fc("SRC(S75)", "GSK2334470", dec); 0.0603154343::p_fc("SRC(S75)", "GSK2334470", inc) :- phosphosite("SRC(S75)").
0.1709840278::p_fc("SRC(S75)", "GSK690693", dec); 0.1709840278::p_fc("SRC(S75)", "GSK690693", inc) :- phosphosite("SRC(S75)").
0.4391066382::p_fc("SRC(S75)", "Go6976", dec); 0.4391066382::p_fc("SRC(S75)", "Go6976", inc) :- phosphosite("SRC(S75)").
0.335190918::p_fc("SRC(S75)", "H89", dec); 0.335190918::p_fc("SRC(S75)", "H89", inc) :- phosphosite("SRC(S75)").
0.394463883::p_fc("SRC(S75)", "HS173", dec); 0.394463883::p_fc("SRC(S75)", "HS173", inc) :- phosphosite("SRC(S75)").
0.4552987677::p_fc("SRC(S75)", "Ipatasertib", dec); 0.4552987677::p_fc("SRC(S75)", "Ipatasertib", inc) :- phosphosite("SRC(S75)").
0.0233154303::p_fc("SRC(S75)", "JNJ", dec); 0.0233154303::p_fc("SRC(S75)", "JNJ", inc) :- phosphosite("SRC(S75)").
0.3500184999::p_fc("SRC(S75)", "JNK", dec); 0.3500184999::p_fc("SRC(S75)", "JNK", inc) :- phosphosite("SRC(S75)").
0.2749298469::p_fc("SRC(S75)", "KD025", dec); 0.2749298469::p_fc("SRC(S75)", "KD025", inc) :- phosphosite("SRC(S75)").
0.2370715542::p_fc("SRC(S75)", "KN62", dec); 0.2370715542::p_fc("SRC(S75)", "KN62", inc) :- phosphosite("SRC(S75)").
0.0722409785::p_fc("SRC(S75)", "KN93", dec); 0.0722409785::p_fc("SRC(S75)", "KN93", inc) :- phosphosite("SRC(S75)").
0.273412136::p_fc("SRC(S75)", "Ku0063794", dec); 0.273412136::p_fc("SRC(S75)", "Ku0063794", inc) :- phosphosite("SRC(S75)").
0.2928869045::p_fc("SRC(S75)", "LY2090314", dec); 0.2928869045::p_fc("SRC(S75)", "LY2090314", inc) :- phosphosite("SRC(S75)").
0.2180222577::p_fc("SRC(S75)", "LY2584702", dec); 0.2180222577::p_fc("SRC(S75)", "LY2584702", inc) :- phosphosite("SRC(S75)").
0.2781909231::p_fc("SRC(S75)", "LY2835219", dec); 0.2781909231::p_fc("SRC(S75)", "LY2835219", inc) :- phosphosite("SRC(S75)").
0.0589690162::p_fc("SRC(S75)", "Linsitinib", dec); 0.0589690162::p_fc("SRC(S75)", "Linsitinib", inc) :- phosphosite("SRC(S75)").
0.131392319::p_fc("SRC(S75)", "MK2206", dec); 0.131392319::p_fc("SRC(S75)", "MK2206", inc) :- phosphosite("SRC(S75)").
0.3434066377::p_fc("SRC(S75)", "NU7441", dec); 0.3434066377::p_fc("SRC(S75)", "NU7441", inc) :- phosphosite("SRC(S75)").
0.1372437592::p_fc("SRC(S75)", "PD153035", dec); 0.1372437592::p_fc("SRC(S75)", "PD153035", inc) :- phosphosite("SRC(S75)").
0.3886621332::p_fc("SRC(S75)", "PF3758309", dec); 0.3886621332::p_fc("SRC(S75)", "PF3758309", inc) :- phosphosite("SRC(S75)").
0.2357921279::p_fc("SRC(S75)", "PF4708671", dec); 0.2357921279::p_fc("SRC(S75)", "PF4708671", inc) :- phosphosite("SRC(S75)").
0.3491837612::p_fc("SRC(S75)", "PH797804", dec); 0.3491837612::p_fc("SRC(S75)", "PH797804", inc) :- phosphosite("SRC(S75)").
0.1592143438::p_fc("SRC(S75)", "PIK294", dec); 0.1592143438::p_fc("SRC(S75)", "PIK294", inc) :- phosphosite("SRC(S75)").
0.2164812901::p_fc("SRC(S75)", "Ribociclib", dec); 0.2164812901::p_fc("SRC(S75)", "Ribociclib", inc) :- phosphosite("SRC(S75)").
0.0970013337::p_fc("SRC(S75)", "Ripasudil", dec); 0.0970013337::p_fc("SRC(S75)", "Ripasudil", inc) :- phosphosite("SRC(S75)").
0.21106215::p_fc("SRC(S75)", "SP600125", dec); 0.21106215::p_fc("SRC(S75)", "SP600125", inc) :- phosphosite("SRC(S75)").
0.2940818506::p_fc("SRC(S75)", "Selumetinib", dec); 0.2940818506::p_fc("SRC(S75)", "Selumetinib", inc) :- phosphosite("SRC(S75)").
0.0441540829::p_fc("SRC(S75)", "TAK715", dec); 0.0441540829::p_fc("SRC(S75)", "TAK715", inc) :- phosphosite("SRC(S75)").
0.0722409785::p_fc("SRC(S75)", "TBCA", dec); 0.0722409785::p_fc("SRC(S75)", "TBCA", inc) :- phosphosite("SRC(S75)").
0.3367390187::p_fc("SRC(S75)", "TGX221", dec); 0.3367390187::p_fc("SRC(S75)", "TGX221", inc) :- phosphosite("SRC(S75)").
0.0719996145::p_fc("SRC(S75)", "Tofacitinib", dec); 0.0719996145::p_fc("SRC(S75)", "Tofacitinib", inc) :- phosphosite("SRC(S75)").
0.2610080585::p_fc("SRC(S75)", "Torin", dec); 0.2610080585::p_fc("SRC(S75)", "Torin", inc) :- phosphosite("SRC(S75)").
0.1759639629::p_fc("SRC(S75)", "Trametinib", dec); 0.1759639629::p_fc("SRC(S75)", "Trametinib", inc) :- phosphosite("SRC(S75)").
0.1232375577::p_fc("SRC(S75)", "U73122", dec); 0.1232375577::p_fc("SRC(S75)", "U73122", inc) :- phosphosite("SRC(S75)").
0.2176857957::p_fc("SRC(S75)", "Ulixertinib", dec); 0.2176857957::p_fc("SRC(S75)", "Ulixertinib", inc) :- phosphosite("SRC(S75)").
0.242487728::p_fc("SRC(S75)", "Vemurafenib", dec); 0.242487728::p_fc("SRC(S75)", "Vemurafenib", inc) :- phosphosite("SRC(S75)").

%%% probabilistic attributes (unknown) %%%
%%t(0.33)::p_function(P, p_dec); t(0.33)::p_function(P, p_inc).
t(0.33)::p_function("PTK2(S722)", p_dec); t(0.33)::p_function("PTK2(S722)", p_inc).
t(0.33)::p_function("ABL1(S718)", p_dec); t(0.33)::p_function("ABL1(S718)", p_inc).
t(0.33)::p_function("PTPRG(S995)", p_dec); t(0.33)::p_function("PTPRG(S995)", p_inc).
t(0.33)::p_function("PTK2(S29)", p_dec); t(0.33)::p_function("PTK2(S29)", p_inc).
t(0.33)::p_function("RBM39(Y95)", p_dec); t(0.33)::p_function("RBM39(Y95)", p_inc).
t(0.33)::p_function("ANXA2P2(Y24)", p_dec); t(0.33)::p_function("ANXA2P2(Y24)", p_inc).
t(0.33)::p_function("PTTG1IP(Y174)", p_dec); t(0.33)::p_function("PTTG1IP(Y174)", p_inc).
t(0.33)::p_function("BCLAF1(Y284)", p_dec); t(0.33)::p_function("BCLAF1(Y284)", p_inc).
t(0.33)::p_function("ATF1(S198)", p_dec); t(0.33)::p_function("ATF1(S198)", p_inc).

% activity
% t(0.33, E, S)::e_activity(E, S, dec); t(0.33, E, S)::e_activity(E, S, inc) :- enzyme(E). % value = _dA = [dec | base | inc] (prior, E/S-level)

%%% occupancy aggregation rule (cpd, P-level, E-level)
% auxiliary variables (value = [true | false])
0.001::occ_dec(P, S) :- phosphosite(P).
0.001::occ_inc(P, S) :- phosphosite(P).
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
0.001::act_dec(E0, S) :- enzyme(E0).
0.001::act_inc(E0, S) :- enzyme(E0).
0.001::act_dec(E0, S) :- p_regulates(P, E0).
0.001::act_inc(E0, S) :- p_regulates(P, E0).

0.001::act_inc(E0, S) :- inhibits(S, E0).
t(0.9, E0)::act_dec(E0, S) :- inhibits(S, E0).
t(0.7, P, E0)::act_dec(E0, S) :- p_regulates(P, E0), p_function(P, p_inc), p_occupancy(P, S, dec).
t(0.7, P, E0)::act_dec(E0, S) :- p_regulates(P, E0), p_function(P, p_dec), p_occupancy(P, S, inc).
t(0.7, P, E0)::act_inc(E0, S) :- p_regulates(P, E0), p_function(P, p_inc), p_occupancy(P, S, inc).
t(0.7, P, E0)::act_inc(E0, S) :- p_regulates(P, E0), p_function(P, p_dec), p_occupancy(P, S, dec).

% aggregation (value = _dO = [dec | base | inc])
t(1.0, E0)::e_activity(E0, S, dec); t(0.0, E0)::e_activity(E0, S, inc) :- act_dec(E0, S), \+ act_inc(E0, S).
t(0.0, E0)::e_activity(E0, S, dec); t(1.0, E0)::e_activity(E0, S, inc) :- \+ act_dec(E0, S), act_inc(E0, S).
t(0.5, E0)::e_activity(E0, S, dec); t(0.5, E0)::e_activity(E0, S, inc) :- act_dec(E0, S), act_inc(E0, S).
t(0.0, E0)::e_activity(E0, S, dec); t(0.0, E0)::e_activity(E0, S, inc) :- \+ act_dec(E0, S), \+ act_inc(E0, S).

evidence(p_fc("ABI1(Y213)", "CHIR99021", inc)).
evidence(e_ksea("ABL1", "CHIR99021", dec)).