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
0.6495357991::e_ksea("ABL1", "AC220", dec); 0.001::e_ksea("ABL1", "AC220", inc) :- e_activity("ABL1", "AC220", dec).
0.001::e_ksea("ABL1", "AC220", dec); 0.6495357991::e_ksea("ABL1", "AC220", inc) :- e_activity("ABL1", "AC220", inc).
0.5917946928::e_ksea("ABL1", "AT13148", dec); 0.001::e_ksea("ABL1", "AT13148", inc) :- e_activity("ABL1", "AT13148", dec).
0.001::e_ksea("ABL1", "AT13148", dec); 0.5917946928::e_ksea("ABL1", "AT13148", inc) :- e_activity("ABL1", "AT13148", inc).
0.6526967571::e_ksea("ABL1", "AZ20", dec); 0.001::e_ksea("ABL1", "AZ20", inc) :- e_activity("ABL1", "AZ20", dec).
0.001::e_ksea("ABL1", "AZ20", dec); 0.6526967571::e_ksea("ABL1", "AZ20", inc) :- e_activity("ABL1", "AZ20", inc).
0.5706596882::e_ksea("ABL1", "AZD1480", dec); 0.001::e_ksea("ABL1", "AZD1480", inc) :- e_activity("ABL1", "AZD1480", dec).
0.001::e_ksea("ABL1", "AZD1480", dec); 0.5706596882::e_ksea("ABL1", "AZD1480", inc) :- e_activity("ABL1", "AZD1480", inc).
0.8374156347::e_ksea("ABL1", "AZD3759", dec); 0.001::e_ksea("ABL1", "AZD3759", inc) :- e_activity("ABL1", "AZD3759", dec).
0.001::e_ksea("ABL1", "AZD3759", dec); 0.8374156347::e_ksea("ABL1", "AZD3759", inc) :- e_activity("ABL1", "AZD3759", inc).
0.7315696235::e_ksea("ABL1", "AZD5363", dec); 0.001::e_ksea("ABL1", "AZD5363", inc) :- e_activity("ABL1", "AZD5363", dec).
0.001::e_ksea("ABL1", "AZD5363", dec); 0.7315696235::e_ksea("ABL1", "AZD5363", inc) :- e_activity("ABL1", "AZD5363", inc).
0.6037315408::e_ksea("ABL1", "AZD5438", dec); 0.001::e_ksea("ABL1", "AZD5438", inc) :- e_activity("ABL1", "AZD5438", dec).
0.001::e_ksea("ABL1", "AZD5438", dec); 0.6037315408::e_ksea("ABL1", "AZD5438", inc) :- e_activity("ABL1", "AZD5438", inc).
0.811765732::e_ksea("ABL1", "AZD6482", dec); 0.001::e_ksea("ABL1", "AZD6482", inc) :- e_activity("ABL1", "AZD6482", dec).
0.001::e_ksea("ABL1", "AZD6482", dec); 0.811765732::e_ksea("ABL1", "AZD6482", inc) :- e_activity("ABL1", "AZD6482", inc).
0.5073468877::e_ksea("ABL1", "AZD6738", dec); 0.001::e_ksea("ABL1", "AZD6738", inc) :- e_activity("ABL1", "AZD6738", dec).
0.001::e_ksea("ABL1", "AZD6738", dec); 0.5073468877::e_ksea("ABL1", "AZD6738", inc) :- e_activity("ABL1", "AZD6738", inc).
0.6243519816::e_ksea("ABL1", "AZD8055", dec); 0.001::e_ksea("ABL1", "AZD8055", inc) :- e_activity("ABL1", "AZD8055", dec).
0.001::e_ksea("ABL1", "AZD8055", dec); 0.6243519816::e_ksea("ABL1", "AZD8055", inc) :- e_activity("ABL1", "AZD8055", inc).
0.7055614293::e_ksea("ABL1", "Amuvatinib", dec); 0.001::e_ksea("ABL1", "Amuvatinib", inc) :- e_activity("ABL1", "Amuvatinib", dec).
0.001::e_ksea("ABL1", "Amuvatinib", dec); 0.7055614293::e_ksea("ABL1", "Amuvatinib", inc) :- e_activity("ABL1", "Amuvatinib", inc).
0.6265774284::e_ksea("ABL1", "BX912", dec); 0.001::e_ksea("ABL1", "BX912", inc) :- e_activity("ABL1", "BX912", dec).
0.001::e_ksea("ABL1", "BX912", dec); 0.6265774284::e_ksea("ABL1", "BX912", inc) :- e_activity("ABL1", "BX912", inc).
0.98714926::e_ksea("ABL1", "Bosutinib", dec); 0.001::e_ksea("ABL1", "Bosutinib", inc) :- e_activity("ABL1", "Bosutinib", dec).
0.001::e_ksea("ABL1", "Bosutinib", dec); 0.98714926::e_ksea("ABL1", "Bosutinib", inc) :- e_activity("ABL1", "Bosutinib", inc).
0.5533133511::e_ksea("ABL1", "CAL101", dec); 0.001::e_ksea("ABL1", "CAL101", inc) :- e_activity("ABL1", "CAL101", dec).
0.001::e_ksea("ABL1", "CAL101", dec); 0.5533133511::e_ksea("ABL1", "CAL101", inc) :- e_activity("ABL1", "CAL101", inc).
0.7846236651::e_ksea("ABL1", "CHIR99021", dec); 0.001::e_ksea("ABL1", "CHIR99021", inc) :- e_activity("ABL1", "CHIR99021", dec).
0.001::e_ksea("ABL1", "CHIR99021", dec); 0.7846236651::e_ksea("ABL1", "CHIR99021", inc) :- e_activity("ABL1", "CHIR99021", inc).
0.7812654751::e_ksea("ABL1", "CX4945", dec); 0.001::e_ksea("ABL1", "CX4945", inc) :- e_activity("ABL1", "CX4945", dec).
0.001::e_ksea("ABL1", "CX4945", dec); 0.7812654751::e_ksea("ABL1", "CX4945", inc) :- e_activity("ABL1", "CX4945", inc).
0.7136127558::e_ksea("ABL1", "DNAPK", dec); 0.001::e_ksea("ABL1", "DNAPK", inc) :- e_activity("ABL1", "DNAPK", dec).
0.001::e_ksea("ABL1", "DNAPK", dec); 0.7136127558::e_ksea("ABL1", "DNAPK", inc) :- e_activity("ABL1", "DNAPK", inc).
0.7377697441::e_ksea("ABL1", "Dabrafenib", dec); 0.001::e_ksea("ABL1", "Dabrafenib", inc) :- e_activity("ABL1", "Dabrafenib", dec).
0.001::e_ksea("ABL1", "Dabrafenib", dec); 0.7377697441::e_ksea("ABL1", "Dabrafenib", inc) :- e_activity("ABL1", "Dabrafenib", inc).
0.9987612659::e_ksea("ABL1", "Dasatinib", dec); 0.001::e_ksea("ABL1", "Dasatinib", inc) :- e_activity("ABL1", "Dasatinib", dec).
0.001::e_ksea("ABL1", "Dasatinib", dec); 0.9987612659::e_ksea("ABL1", "Dasatinib", inc) :- e_activity("ABL1", "Dasatinib", inc).
0.5124778531::e_ksea("ABL1", "Edelfosine", dec); 0.001::e_ksea("ABL1", "Edelfosine", inc) :- e_activity("ABL1", "Edelfosine", dec).
0.001::e_ksea("ABL1", "Edelfosine", dec); 0.5124778531::e_ksea("ABL1", "Edelfosine", inc) :- e_activity("ABL1", "Edelfosine", inc).
0.9852877594::e_ksea("ABL1", "FRAX486", dec); 0.001::e_ksea("ABL1", "FRAX486", inc) :- e_activity("ABL1", "FRAX486", dec).
0.001::e_ksea("ABL1", "FRAX486", dec); 0.9852877594::e_ksea("ABL1", "FRAX486", inc) :- e_activity("ABL1", "FRAX486", inc).
0.7960011926::e_ksea("ABL1", "GDC0941", dec); 0.001::e_ksea("ABL1", "GDC0941", inc) :- e_activity("ABL1", "GDC0941", dec).
0.001::e_ksea("ABL1", "GDC0941", dec); 0.7960011926::e_ksea("ABL1", "GDC0941", inc) :- e_activity("ABL1", "GDC0941", inc).
0.8671377079::e_ksea("ABL1", "GDC0994", dec); 0.001::e_ksea("ABL1", "GDC0994", inc) :- e_activity("ABL1", "GDC0994", dec).
0.001::e_ksea("ABL1", "GDC0994", dec); 0.8671377079::e_ksea("ABL1", "GDC0994", inc) :- e_activity("ABL1", "GDC0994", inc).
0.6405069878::e_ksea("ABL1", "GF109203X", dec); 0.001::e_ksea("ABL1", "GF109203X", inc) :- e_activity("ABL1", "GF109203X", dec).
0.001::e_ksea("ABL1", "GF109203X", dec); 0.6405069878::e_ksea("ABL1", "GF109203X", inc) :- e_activity("ABL1", "GF109203X", inc).
0.5072410486::e_ksea("ABL1", "GO6983", dec); 0.001::e_ksea("ABL1", "GO6983", inc) :- e_activity("ABL1", "GO6983", dec).
0.001::e_ksea("ABL1", "GO6983", dec); 0.5072410486::e_ksea("ABL1", "GO6983", inc) :- e_activity("ABL1", "GO6983", inc).
0.5112090864::e_ksea("ABL1", "GSK2334470", dec); 0.001::e_ksea("ABL1", "GSK2334470", inc) :- e_activity("ABL1", "GSK2334470", dec).
0.001::e_ksea("ABL1", "GSK2334470", dec); 0.5112090864::e_ksea("ABL1", "GSK2334470", inc) :- e_activity("ABL1", "GSK2334470", inc).
0.5618116312::e_ksea("ABL1", "GSK690693", dec); 0.001::e_ksea("ABL1", "GSK690693", inc) :- e_activity("ABL1", "GSK690693", dec).
0.001::e_ksea("ABL1", "GSK690693", dec); 0.5618116312::e_ksea("ABL1", "GSK690693", inc) :- e_activity("ABL1", "GSK690693", inc).
0.6325805268::e_ksea("ABL1", "Go6976", dec); 0.001::e_ksea("ABL1", "Go6976", inc) :- e_activity("ABL1", "Go6976", dec).
0.001::e_ksea("ABL1", "Go6976", dec); 0.6325805268::e_ksea("ABL1", "Go6976", inc) :- e_activity("ABL1", "Go6976", inc).
0.5246682831::e_ksea("ABL1", "H89", dec); 0.001::e_ksea("ABL1", "H89", inc) :- e_activity("ABL1", "H89", dec).
0.001::e_ksea("ABL1", "H89", dec); 0.5246682831::e_ksea("ABL1", "H89", inc) :- e_activity("ABL1", "H89", inc).
0.6282139351::e_ksea("ABL1", "HS173", dec); 0.001::e_ksea("ABL1", "HS173", inc) :- e_activity("ABL1", "HS173", dec).
0.001::e_ksea("ABL1", "HS173", dec); 0.6282139351::e_ksea("ABL1", "HS173", inc) :- e_activity("ABL1", "HS173", inc).
0.7587481144::e_ksea("ABL1", "Ipatasertib", dec); 0.001::e_ksea("ABL1", "Ipatasertib", inc) :- e_activity("ABL1", "Ipatasertib", dec).
0.001::e_ksea("ABL1", "Ipatasertib", dec); 0.7587481144::e_ksea("ABL1", "Ipatasertib", inc) :- e_activity("ABL1", "Ipatasertib", inc).
0.737492792::e_ksea("ABL1", "JNJ", dec); 0.001::e_ksea("ABL1", "JNJ", inc) :- e_activity("ABL1", "JNJ", dec).
0.001::e_ksea("ABL1", "JNJ", dec); 0.737492792::e_ksea("ABL1", "JNJ", inc) :- e_activity("ABL1", "JNJ", inc).
0.5877910519::e_ksea("ABL1", "JNK", dec); 0.001::e_ksea("ABL1", "JNK", inc) :- e_activity("ABL1", "JNK", dec).
0.001::e_ksea("ABL1", "JNK", dec); 0.5877910519::e_ksea("ABL1", "JNK", inc) :- e_activity("ABL1", "JNK", inc).
0.6537214928::e_ksea("ABL1", "KD025", dec); 0.001::e_ksea("ABL1", "KD025", inc) :- e_activity("ABL1", "KD025", dec).
0.001::e_ksea("ABL1", "KD025", dec); 0.6537214928::e_ksea("ABL1", "KD025", inc) :- e_activity("ABL1", "KD025", inc).
0.8150577976::e_ksea("ABL1", "KN62", dec); 0.001::e_ksea("ABL1", "KN62", inc) :- e_activity("ABL1", "KN62", dec).
0.001::e_ksea("ABL1", "KN62", dec); 0.8150577976::e_ksea("ABL1", "KN62", inc) :- e_activity("ABL1", "KN62", inc).
0.7195886651::e_ksea("ABL1", "KN93", dec); 0.001::e_ksea("ABL1", "KN93", inc) :- e_activity("ABL1", "KN93", dec).
0.001::e_ksea("ABL1", "KN93", dec); 0.7195886651::e_ksea("ABL1", "KN93", inc) :- e_activity("ABL1", "KN93", inc).
0.5930970236::e_ksea("ABL1", "Ku0063794", dec); 0.001::e_ksea("ABL1", "Ku0063794", inc) :- e_activity("ABL1", "Ku0063794", dec).
0.001::e_ksea("ABL1", "Ku0063794", dec); 0.5930970236::e_ksea("ABL1", "Ku0063794", inc) :- e_activity("ABL1", "Ku0063794", inc).
0.5540528903::e_ksea("ABL1", "LY2090314", dec); 0.001::e_ksea("ABL1", "LY2090314", inc) :- e_activity("ABL1", "LY2090314", dec).
0.001::e_ksea("ABL1", "LY2090314", dec); 0.5540528903::e_ksea("ABL1", "LY2090314", inc) :- e_activity("ABL1", "LY2090314", inc).
0.8268720004::e_ksea("ABL1", "LY2584702", dec); 0.001::e_ksea("ABL1", "LY2584702", inc) :- e_activity("ABL1", "LY2584702", dec).
0.001::e_ksea("ABL1", "LY2584702", dec); 0.8268720004::e_ksea("ABL1", "LY2584702", inc) :- e_activity("ABL1", "LY2584702", inc).
0.6864132105::e_ksea("ABL1", "LY2835219", dec); 0.001::e_ksea("ABL1", "LY2835219", inc) :- e_activity("ABL1", "LY2835219", dec).
0.001::e_ksea("ABL1", "LY2835219", dec); 0.6864132105::e_ksea("ABL1", "LY2835219", inc) :- e_activity("ABL1", "LY2835219", inc).
0.7194060505::e_ksea("ABL1", "Linsitinib", dec); 0.001::e_ksea("ABL1", "Linsitinib", inc) :- e_activity("ABL1", "Linsitinib", dec).
0.001::e_ksea("ABL1", "Linsitinib", dec); 0.7194060505::e_ksea("ABL1", "Linsitinib", inc) :- e_activity("ABL1", "Linsitinib", inc).
0.659487624::e_ksea("ABL1", "MK2206", dec); 0.001::e_ksea("ABL1", "MK2206", inc) :- e_activity("ABL1", "MK2206", dec).
0.001::e_ksea("ABL1", "MK2206", dec); 0.659487624::e_ksea("ABL1", "MK2206", inc) :- e_activity("ABL1", "MK2206", inc).
0.5718635718::e_ksea("ABL1", "NU7441", dec); 0.001::e_ksea("ABL1", "NU7441", inc) :- e_activity("ABL1", "NU7441", dec).
0.001::e_ksea("ABL1", "NU7441", dec); 0.5718635718::e_ksea("ABL1", "NU7441", inc) :- e_activity("ABL1", "NU7441", inc).
0.6246073271::e_ksea("ABL1", "PD153035", dec); 0.001::e_ksea("ABL1", "PD153035", inc) :- e_activity("ABL1", "PD153035", dec).
0.001::e_ksea("ABL1", "PD153035", dec); 0.6246073271::e_ksea("ABL1", "PD153035", inc) :- e_activity("ABL1", "PD153035", inc).
0.5689247608::e_ksea("ABL1", "PF3758309", dec); 0.001::e_ksea("ABL1", "PF3758309", inc) :- e_activity("ABL1", "PF3758309", dec).
0.001::e_ksea("ABL1", "PF3758309", dec); 0.5689247608::e_ksea("ABL1", "PF3758309", inc) :- e_activity("ABL1", "PF3758309", inc).
0.5125498866::e_ksea("ABL1", "PF4708671", dec); 0.001::e_ksea("ABL1", "PF4708671", inc) :- e_activity("ABL1", "PF4708671", dec).
0.001::e_ksea("ABL1", "PF4708671", dec); 0.5125498866::e_ksea("ABL1", "PF4708671", inc) :- e_activity("ABL1", "PF4708671", inc).
0.5722907195::e_ksea("ABL1", "PH797804", dec); 0.001::e_ksea("ABL1", "PH797804", inc) :- e_activity("ABL1", "PH797804", dec).
0.001::e_ksea("ABL1", "PH797804", dec); 0.5722907195::e_ksea("ABL1", "PH797804", inc) :- e_activity("ABL1", "PH797804", inc).
0.6018008812::e_ksea("ABL1", "PIK294", dec); 0.001::e_ksea("ABL1", "PIK294", inc) :- e_activity("ABL1", "PIK294", dec).
0.001::e_ksea("ABL1", "PIK294", dec); 0.6018008812::e_ksea("ABL1", "PIK294", inc) :- e_activity("ABL1", "PIK294", inc).
0.752548373::e_ksea("ABL1", "Ribociclib", dec); 0.001::e_ksea("ABL1", "Ribociclib", inc) :- e_activity("ABL1", "Ribociclib", dec).
0.001::e_ksea("ABL1", "Ribociclib", dec); 0.752548373::e_ksea("ABL1", "Ribociclib", inc) :- e_activity("ABL1", "Ribociclib", inc).
0.6414439703::e_ksea("ABL1", "Ripasudil", dec); 0.001::e_ksea("ABL1", "Ripasudil", inc) :- e_activity("ABL1", "Ripasudil", dec).
0.001::e_ksea("ABL1", "Ripasudil", dec); 0.6414439703::e_ksea("ABL1", "Ripasudil", inc) :- e_activity("ABL1", "Ripasudil", inc).
0.5843516809::e_ksea("ABL1", "SP600125", dec); 0.001::e_ksea("ABL1", "SP600125", inc) :- e_activity("ABL1", "SP600125", dec).
0.001::e_ksea("ABL1", "SP600125", dec); 0.5843516809::e_ksea("ABL1", "SP600125", inc) :- e_activity("ABL1", "SP600125", inc).
0.5009811659::e_ksea("ABL1", "Selumetinib", dec); 0.001::e_ksea("ABL1", "Selumetinib", inc) :- e_activity("ABL1", "Selumetinib", dec).
0.001::e_ksea("ABL1", "Selumetinib", dec); 0.5009811659::e_ksea("ABL1", "Selumetinib", inc) :- e_activity("ABL1", "Selumetinib", inc).
0.6795272855::e_ksea("ABL1", "TAK715", dec); 0.001::e_ksea("ABL1", "TAK715", inc) :- e_activity("ABL1", "TAK715", dec).
0.001::e_ksea("ABL1", "TAK715", dec); 0.6795272855::e_ksea("ABL1", "TAK715", inc) :- e_activity("ABL1", "TAK715", inc).
0.533669282::e_ksea("ABL1", "TBCA", dec); 0.001::e_ksea("ABL1", "TBCA", inc) :- e_activity("ABL1", "TBCA", dec).
0.001::e_ksea("ABL1", "TBCA", dec); 0.533669282::e_ksea("ABL1", "TBCA", inc) :- e_activity("ABL1", "TBCA", inc).
0.5539183359::e_ksea("ABL1", "TGX221", dec); 0.001::e_ksea("ABL1", "TGX221", inc) :- e_activity("ABL1", "TGX221", dec).
0.001::e_ksea("ABL1", "TGX221", dec); 0.5539183359::e_ksea("ABL1", "TGX221", inc) :- e_activity("ABL1", "TGX221", inc).
0.7576025624::e_ksea("ABL1", "Tofacitinib", dec); 0.001::e_ksea("ABL1", "Tofacitinib", inc) :- e_activity("ABL1", "Tofacitinib", dec).
0.001::e_ksea("ABL1", "Tofacitinib", dec); 0.7576025624::e_ksea("ABL1", "Tofacitinib", inc) :- e_activity("ABL1", "Tofacitinib", inc).
0.6707977339::e_ksea("ABL1", "Torin", dec); 0.001::e_ksea("ABL1", "Torin", inc) :- e_activity("ABL1", "Torin", dec).
0.001::e_ksea("ABL1", "Torin", dec); 0.6707977339::e_ksea("ABL1", "Torin", inc) :- e_activity("ABL1", "Torin", inc).
0.5327146618::e_ksea("ABL1", "Trametinib", dec); 0.001::e_ksea("ABL1", "Trametinib", inc) :- e_activity("ABL1", "Trametinib", dec).
0.001::e_ksea("ABL1", "Trametinib", dec); 0.5327146618::e_ksea("ABL1", "Trametinib", inc) :- e_activity("ABL1", "Trametinib", inc).
0.5486799131::e_ksea("ABL1", "U73122", dec); 0.001::e_ksea("ABL1", "U73122", inc) :- e_activity("ABL1", "U73122", dec).
0.001::e_ksea("ABL1", "U73122", dec); 0.5486799131::e_ksea("ABL1", "U73122", inc) :- e_activity("ABL1", "U73122", inc).
0.60976657::e_ksea("ABL1", "Ulixertinib", dec); 0.001::e_ksea("ABL1", "Ulixertinib", inc) :- e_activity("ABL1", "Ulixertinib", dec).
0.001::e_ksea("ABL1", "Ulixertinib", dec); 0.60976657::e_ksea("ABL1", "Ulixertinib", inc) :- e_activity("ABL1", "Ulixertinib", inc).
0.509461097::e_ksea("ABL1", "Vemurafenib", dec); 0.001::e_ksea("ABL1", "Vemurafenib", inc) :- e_activity("ABL1", "Vemurafenib", dec).
0.001::e_ksea("ABL1", "Vemurafenib", dec); 0.509461097::e_ksea("ABL1", "Vemurafenib", inc) :- e_activity("ABL1", "Vemurafenib", inc).
0.5203971212::e_ksea("FYN", "AC220", dec); 0.001::e_ksea("FYN", "AC220", inc) :- e_activity("FYN", "AC220", dec).
0.001::e_ksea("FYN", "AC220", dec); 0.5203971212::e_ksea("FYN", "AC220", inc) :- e_activity("FYN", "AC220", inc).
0.5955742227::e_ksea("FYN", "AT13148", dec); 0.001::e_ksea("FYN", "AT13148", inc) :- e_activity("FYN", "AT13148", dec).
0.001::e_ksea("FYN", "AT13148", dec); 0.5955742227::e_ksea("FYN", "AT13148", inc) :- e_activity("FYN", "AT13148", inc).
0.5814854874::e_ksea("FYN", "AZ20", dec); 0.001::e_ksea("FYN", "AZ20", inc) :- e_activity("FYN", "AZ20", dec).
0.001::e_ksea("FYN", "AZ20", dec); 0.5814854874::e_ksea("FYN", "AZ20", inc) :- e_activity("FYN", "AZ20", inc).
0.5127780674::e_ksea("FYN", "AZD1480", dec); 0.001::e_ksea("FYN", "AZD1480", inc) :- e_activity("FYN", "AZD1480", dec).
0.001::e_ksea("FYN", "AZD1480", dec); 0.5127780674::e_ksea("FYN", "AZD1480", inc) :- e_activity("FYN", "AZD1480", inc).
0.6050154211::e_ksea("FYN", "AZD3759", dec); 0.001::e_ksea("FYN", "AZD3759", inc) :- e_activity("FYN", "AZD3759", dec).
0.001::e_ksea("FYN", "AZD3759", dec); 0.6050154211::e_ksea("FYN", "AZD3759", inc) :- e_activity("FYN", "AZD3759", inc).
0.5345072137::e_ksea("FYN", "AZD5363", dec); 0.001::e_ksea("FYN", "AZD5363", inc) :- e_activity("FYN", "AZD5363", dec).
0.001::e_ksea("FYN", "AZD5363", dec); 0.5345072137::e_ksea("FYN", "AZD5363", inc) :- e_activity("FYN", "AZD5363", inc).
0.5251574102::e_ksea("FYN", "AZD5438", dec); 0.001::e_ksea("FYN", "AZD5438", inc) :- e_activity("FYN", "AZD5438", dec).
0.001::e_ksea("FYN", "AZD5438", dec); 0.5251574102::e_ksea("FYN", "AZD5438", inc) :- e_activity("FYN", "AZD5438", inc).
0.6045822374::e_ksea("FYN", "AZD6482", dec); 0.001::e_ksea("FYN", "AZD6482", inc) :- e_activity("FYN", "AZD6482", dec).
0.001::e_ksea("FYN", "AZD6482", dec); 0.6045822374::e_ksea("FYN", "AZD6482", inc) :- e_activity("FYN", "AZD6482", inc).
0.5542381833::e_ksea("FYN", "AZD6738", dec); 0.001::e_ksea("FYN", "AZD6738", inc) :- e_activity("FYN", "AZD6738", dec).
0.001::e_ksea("FYN", "AZD6738", dec); 0.5542381833::e_ksea("FYN", "AZD6738", inc) :- e_activity("FYN", "AZD6738", inc).
0.5397816905::e_ksea("FYN", "AZD8055", dec); 0.001::e_ksea("FYN", "AZD8055", inc) :- e_activity("FYN", "AZD8055", dec).
0.001::e_ksea("FYN", "AZD8055", dec); 0.5397816905::e_ksea("FYN", "AZD8055", inc) :- e_activity("FYN", "AZD8055", inc).
0.5768424359::e_ksea("FYN", "Amuvatinib", dec); 0.001::e_ksea("FYN", "Amuvatinib", inc) :- e_activity("FYN", "Amuvatinib", dec).
0.001::e_ksea("FYN", "Amuvatinib", dec); 0.5768424359::e_ksea("FYN", "Amuvatinib", inc) :- e_activity("FYN", "Amuvatinib", inc).
0.5436942116::e_ksea("FYN", "BX912", dec); 0.001::e_ksea("FYN", "BX912", inc) :- e_activity("FYN", "BX912", dec).
0.001::e_ksea("FYN", "BX912", dec); 0.5436942116::e_ksea("FYN", "BX912", inc) :- e_activity("FYN", "BX912", inc).
0.5772080345::e_ksea("FYN", "Bosutinib", dec); 0.001::e_ksea("FYN", "Bosutinib", inc) :- e_activity("FYN", "Bosutinib", dec).
0.001::e_ksea("FYN", "Bosutinib", dec); 0.5772080345::e_ksea("FYN", "Bosutinib", inc) :- e_activity("FYN", "Bosutinib", inc).
0.5274481345::e_ksea("FYN", "CAL101", dec); 0.001::e_ksea("FYN", "CAL101", inc) :- e_activity("FYN", "CAL101", dec).
0.001::e_ksea("FYN", "CAL101", dec); 0.5274481345::e_ksea("FYN", "CAL101", inc) :- e_activity("FYN", "CAL101", inc).
0.5564367322::e_ksea("FYN", "CHIR99021", dec); 0.001::e_ksea("FYN", "CHIR99021", inc) :- e_activity("FYN", "CHIR99021", dec).
0.001::e_ksea("FYN", "CHIR99021", dec); 0.5564367322::e_ksea("FYN", "CHIR99021", inc) :- e_activity("FYN", "CHIR99021", inc).
0.6642288622::e_ksea("FYN", "CX4945", dec); 0.001::e_ksea("FYN", "CX4945", inc) :- e_activity("FYN", "CX4945", dec).
0.001::e_ksea("FYN", "CX4945", dec); 0.6642288622::e_ksea("FYN", "CX4945", inc) :- e_activity("FYN", "CX4945", inc).
0.513209335::e_ksea("FYN", "DNAPK", dec); 0.001::e_ksea("FYN", "DNAPK", inc) :- e_activity("FYN", "DNAPK", dec).
0.001::e_ksea("FYN", "DNAPK", dec); 0.513209335::e_ksea("FYN", "DNAPK", inc) :- e_activity("FYN", "DNAPK", inc).
0.5725408425::e_ksea("FYN", "Dabrafenib", dec); 0.001::e_ksea("FYN", "Dabrafenib", inc) :- e_activity("FYN", "Dabrafenib", dec).
0.001::e_ksea("FYN", "Dabrafenib", dec); 0.5725408425::e_ksea("FYN", "Dabrafenib", inc) :- e_activity("FYN", "Dabrafenib", inc).
0.5143716479::e_ksea("FYN", "Dasatinib", dec); 0.001::e_ksea("FYN", "Dasatinib", inc) :- e_activity("FYN", "Dasatinib", dec).
0.001::e_ksea("FYN", "Dasatinib", dec); 0.5143716479::e_ksea("FYN", "Dasatinib", inc) :- e_activity("FYN", "Dasatinib", inc).
0.5073660209::e_ksea("FYN", "Edelfosine", dec); 0.001::e_ksea("FYN", "Edelfosine", inc) :- e_activity("FYN", "Edelfosine", dec).
0.001::e_ksea("FYN", "Edelfosine", dec); 0.5073660209::e_ksea("FYN", "Edelfosine", inc) :- e_activity("FYN", "Edelfosine", inc).
0.5495492068::e_ksea("FYN", "FRAX486", dec); 0.001::e_ksea("FYN", "FRAX486", inc) :- e_activity("FYN", "FRAX486", dec).
0.001::e_ksea("FYN", "FRAX486", dec); 0.5495492068::e_ksea("FYN", "FRAX486", inc) :- e_activity("FYN", "FRAX486", inc).
0.5346297006::e_ksea("FYN", "GDC0941", dec); 0.001::e_ksea("FYN", "GDC0941", inc) :- e_activity("FYN", "GDC0941", dec).
0.001::e_ksea("FYN", "GDC0941", dec); 0.5346297006::e_ksea("FYN", "GDC0941", inc) :- e_activity("FYN", "GDC0941", inc).
0.5504879271::e_ksea("FYN", "GDC0994", dec); 0.001::e_ksea("FYN", "GDC0994", inc) :- e_activity("FYN", "GDC0994", dec).
0.001::e_ksea("FYN", "GDC0994", dec); 0.5504879271::e_ksea("FYN", "GDC0994", inc) :- e_activity("FYN", "GDC0994", inc).
0.5300638521::e_ksea("FYN", "GF109203X", dec); 0.001::e_ksea("FYN", "GF109203X", inc) :- e_activity("FYN", "GF109203X", dec).
0.001::e_ksea("FYN", "GF109203X", dec); 0.5300638521::e_ksea("FYN", "GF109203X", inc) :- e_activity("FYN", "GF109203X", inc).
0.5167651135::e_ksea("FYN", "GO6983", dec); 0.001::e_ksea("FYN", "GO6983", inc) :- e_activity("FYN", "GO6983", dec).
0.001::e_ksea("FYN", "GO6983", dec); 0.5167651135::e_ksea("FYN", "GO6983", inc) :- e_activity("FYN", "GO6983", inc).
0.583557175::e_ksea("FYN", "GSK2334470", dec); 0.001::e_ksea("FYN", "GSK2334470", inc) :- e_activity("FYN", "GSK2334470", dec).
0.001::e_ksea("FYN", "GSK2334470", dec); 0.583557175::e_ksea("FYN", "GSK2334470", inc) :- e_activity("FYN", "GSK2334470", inc).
0.6191150698::e_ksea("FYN", "GSK690693", dec); 0.001::e_ksea("FYN", "GSK690693", inc) :- e_activity("FYN", "GSK690693", dec).
0.001::e_ksea("FYN", "GSK690693", dec); 0.6191150698::e_ksea("FYN", "GSK690693", inc) :- e_activity("FYN", "GSK690693", inc).
0.5154596375::e_ksea("FYN", "Go6976", dec); 0.001::e_ksea("FYN", "Go6976", inc) :- e_activity("FYN", "Go6976", dec).
0.001::e_ksea("FYN", "Go6976", dec); 0.5154596375::e_ksea("FYN", "Go6976", inc) :- e_activity("FYN", "Go6976", inc).
0.5161195935::e_ksea("FYN", "H89", dec); 0.001::e_ksea("FYN", "H89", inc) :- e_activity("FYN", "H89", dec).
0.001::e_ksea("FYN", "H89", dec); 0.5161195935::e_ksea("FYN", "H89", inc) :- e_activity("FYN", "H89", inc).
0.5097614616::e_ksea("FYN", "HS173", dec); 0.001::e_ksea("FYN", "HS173", inc) :- e_activity("FYN", "HS173", dec).
0.001::e_ksea("FYN", "HS173", dec); 0.5097614616::e_ksea("FYN", "HS173", inc) :- e_activity("FYN", "HS173", inc).
0.5534533203::e_ksea("FYN", "Ipatasertib", dec); 0.001::e_ksea("FYN", "Ipatasertib", inc) :- e_activity("FYN", "Ipatasertib", dec).
0.001::e_ksea("FYN", "Ipatasertib", dec); 0.5534533203::e_ksea("FYN", "Ipatasertib", inc) :- e_activity("FYN", "Ipatasertib", inc).
0.512947828::e_ksea("FYN", "JNJ", dec); 0.001::e_ksea("FYN", "JNJ", inc) :- e_activity("FYN", "JNJ", dec).
0.001::e_ksea("FYN", "JNJ", dec); 0.512947828::e_ksea("FYN", "JNJ", inc) :- e_activity("FYN", "JNJ", inc).
0.6606339354::e_ksea("FYN", "JNK", dec); 0.001::e_ksea("FYN", "JNK", inc) :- e_activity("FYN", "JNK", dec).
0.001::e_ksea("FYN", "JNK", dec); 0.6606339354::e_ksea("FYN", "JNK", inc) :- e_activity("FYN", "JNK", inc).
0.5815598896::e_ksea("FYN", "KD025", dec); 0.001::e_ksea("FYN", "KD025", inc) :- e_activity("FYN", "KD025", dec).
0.001::e_ksea("FYN", "KD025", dec); 0.5815598896::e_ksea("FYN", "KD025", inc) :- e_activity("FYN", "KD025", inc).
0.641169638::e_ksea("FYN", "KN62", dec); 0.001::e_ksea("FYN", "KN62", inc) :- e_activity("FYN", "KN62", dec).
0.001::e_ksea("FYN", "KN62", dec); 0.641169638::e_ksea("FYN", "KN62", inc) :- e_activity("FYN", "KN62", inc).
0.650203364::e_ksea("FYN", "KN93", dec); 0.001::e_ksea("FYN", "KN93", inc) :- e_activity("FYN", "KN93", dec).
0.001::e_ksea("FYN", "KN93", dec); 0.650203364::e_ksea("FYN", "KN93", inc) :- e_activity("FYN", "KN93", inc).
0.5338106407::e_ksea("FYN", "Ku0063794", dec); 0.001::e_ksea("FYN", "Ku0063794", inc) :- e_activity("FYN", "Ku0063794", dec).
0.001::e_ksea("FYN", "Ku0063794", dec); 0.5338106407::e_ksea("FYN", "Ku0063794", inc) :- e_activity("FYN", "Ku0063794", inc).
0.5460247443::e_ksea("FYN", "LY2090314", dec); 0.001::e_ksea("FYN", "LY2090314", inc) :- e_activity("FYN", "LY2090314", dec).
0.001::e_ksea("FYN", "LY2090314", dec); 0.5460247443::e_ksea("FYN", "LY2090314", inc) :- e_activity("FYN", "LY2090314", inc).
0.5822241186::e_ksea("FYN", "LY2584702", dec); 0.001::e_ksea("FYN", "LY2584702", inc) :- e_activity("FYN", "LY2584702", dec).
0.001::e_ksea("FYN", "LY2584702", dec); 0.5822241186::e_ksea("FYN", "LY2584702", inc) :- e_activity("FYN", "LY2584702", inc).
0.5669051864::e_ksea("FYN", "LY2835219", dec); 0.001::e_ksea("FYN", "LY2835219", inc) :- e_activity("FYN", "LY2835219", dec).
0.001::e_ksea("FYN", "LY2835219", dec); 0.5669051864::e_ksea("FYN", "LY2835219", inc) :- e_activity("FYN", "LY2835219", inc).
0.6503083091::e_ksea("FYN", "Linsitinib", dec); 0.001::e_ksea("FYN", "Linsitinib", inc) :- e_activity("FYN", "Linsitinib", dec).
0.001::e_ksea("FYN", "Linsitinib", dec); 0.6503083091::e_ksea("FYN", "Linsitinib", inc) :- e_activity("FYN", "Linsitinib", inc).
0.5893517184::e_ksea("FYN", "MK2206", dec); 0.001::e_ksea("FYN", "MK2206", inc) :- e_activity("FYN", "MK2206", dec).
0.001::e_ksea("FYN", "MK2206", dec); 0.5893517184::e_ksea("FYN", "MK2206", inc) :- e_activity("FYN", "MK2206", inc).
0.52171586::e_ksea("FYN", "NU7441", dec); 0.001::e_ksea("FYN", "NU7441", inc) :- e_activity("FYN", "NU7441", dec).
0.001::e_ksea("FYN", "NU7441", dec); 0.52171586::e_ksea("FYN", "NU7441", inc) :- e_activity("FYN", "NU7441", inc).
0.5170392129::e_ksea("FYN", "PD153035", dec); 0.001::e_ksea("FYN", "PD153035", inc) :- e_activity("FYN", "PD153035", dec).
0.001::e_ksea("FYN", "PD153035", dec); 0.5170392129::e_ksea("FYN", "PD153035", inc) :- e_activity("FYN", "PD153035", inc).
0.5045027526::e_ksea("FYN", "PF3758309", dec); 0.001::e_ksea("FYN", "PF3758309", inc) :- e_activity("FYN", "PF3758309", dec).
0.001::e_ksea("FYN", "PF3758309", dec); 0.5045027526::e_ksea("FYN", "PF3758309", inc) :- e_activity("FYN", "PF3758309", inc).
0.6139953136::e_ksea("FYN", "PF4708671", dec); 0.001::e_ksea("FYN", "PF4708671", inc) :- e_activity("FYN", "PF4708671", dec).
0.001::e_ksea("FYN", "PF4708671", dec); 0.6139953136::e_ksea("FYN", "PF4708671", inc) :- e_activity("FYN", "PF4708671", inc).
0.5282258595::e_ksea("FYN", "PH797804", dec); 0.001::e_ksea("FYN", "PH797804", inc) :- e_activity("FYN", "PH797804", dec).
0.001::e_ksea("FYN", "PH797804", dec); 0.5282258595::e_ksea("FYN", "PH797804", inc) :- e_activity("FYN", "PH797804", inc).
0.5223717051::e_ksea("FYN", "PIK294", dec); 0.001::e_ksea("FYN", "PIK294", inc) :- e_activity("FYN", "PIK294", dec).
0.001::e_ksea("FYN", "PIK294", dec); 0.5223717051::e_ksea("FYN", "PIK294", inc) :- e_activity("FYN", "PIK294", inc).
0.5249122783::e_ksea("FYN", "Ribociclib", dec); 0.001::e_ksea("FYN", "Ribociclib", inc) :- e_activity("FYN", "Ribociclib", dec).
0.001::e_ksea("FYN", "Ribociclib", dec); 0.5249122783::e_ksea("FYN", "Ribociclib", inc) :- e_activity("FYN", "Ribociclib", inc).
0.5857462475::e_ksea("FYN", "Ripasudil", dec); 0.001::e_ksea("FYN", "Ripasudil", inc) :- e_activity("FYN", "Ripasudil", dec).
0.001::e_ksea("FYN", "Ripasudil", dec); 0.5857462475::e_ksea("FYN", "Ripasudil", inc) :- e_activity("FYN", "Ripasudil", inc).
0.5149566088::e_ksea("FYN", "SP600125", dec); 0.001::e_ksea("FYN", "SP600125", inc) :- e_activity("FYN", "SP600125", dec).
0.001::e_ksea("FYN", "SP600125", dec); 0.5149566088::e_ksea("FYN", "SP600125", inc) :- e_activity("FYN", "SP600125", inc).
0.5205914289::e_ksea("FYN", "Selumetinib", dec); 0.001::e_ksea("FYN", "Selumetinib", inc) :- e_activity("FYN", "Selumetinib", dec).
0.001::e_ksea("FYN", "Selumetinib", dec); 0.5205914289::e_ksea("FYN", "Selumetinib", inc) :- e_activity("FYN", "Selumetinib", inc).
0.5175965583::e_ksea("FYN", "TAK715", dec); 0.001::e_ksea("FYN", "TAK715", inc) :- e_activity("FYN", "TAK715", dec).
0.001::e_ksea("FYN", "TAK715", dec); 0.5175965583::e_ksea("FYN", "TAK715", inc) :- e_activity("FYN", "TAK715", inc).
0.5700160402::e_ksea("FYN", "TBCA", dec); 0.001::e_ksea("FYN", "TBCA", inc) :- e_activity("FYN", "TBCA", dec).
0.001::e_ksea("FYN", "TBCA", dec); 0.5700160402::e_ksea("FYN", "TBCA", inc) :- e_activity("FYN", "TBCA", inc).
0.513898009::e_ksea("FYN", "TGX221", dec); 0.001::e_ksea("FYN", "TGX221", inc) :- e_activity("FYN", "TGX221", dec).
0.001::e_ksea("FYN", "TGX221", dec); 0.513898009::e_ksea("FYN", "TGX221", inc) :- e_activity("FYN", "TGX221", inc).
0.5667347359::e_ksea("FYN", "Tofacitinib", dec); 0.001::e_ksea("FYN", "Tofacitinib", inc) :- e_activity("FYN", "Tofacitinib", dec).
0.001::e_ksea("FYN", "Tofacitinib", dec); 0.5667347359::e_ksea("FYN", "Tofacitinib", inc) :- e_activity("FYN", "Tofacitinib", inc).
0.5866966226::e_ksea("FYN", "Torin", dec); 0.001::e_ksea("FYN", "Torin", inc) :- e_activity("FYN", "Torin", dec).
0.001::e_ksea("FYN", "Torin", dec); 0.5866966226::e_ksea("FYN", "Torin", inc) :- e_activity("FYN", "Torin", inc).
0.5525381353::e_ksea("FYN", "Trametinib", dec); 0.001::e_ksea("FYN", "Trametinib", inc) :- e_activity("FYN", "Trametinib", dec).
0.001::e_ksea("FYN", "Trametinib", dec); 0.5525381353::e_ksea("FYN", "Trametinib", inc) :- e_activity("FYN", "Trametinib", inc).
0.5069235369::e_ksea("FYN", "U73122", dec); 0.001::e_ksea("FYN", "U73122", inc) :- e_activity("FYN", "U73122", dec).
0.001::e_ksea("FYN", "U73122", dec); 0.5069235369::e_ksea("FYN", "U73122", inc) :- e_activity("FYN", "U73122", inc).
0.5073795973::e_ksea("FYN", "Ulixertinib", dec); 0.001::e_ksea("FYN", "Ulixertinib", inc) :- e_activity("FYN", "Ulixertinib", dec).
0.001::e_ksea("FYN", "Ulixertinib", dec); 0.5073795973::e_ksea("FYN", "Ulixertinib", inc) :- e_activity("FYN", "Ulixertinib", inc).
0.5422674681::e_ksea("FYN", "Vemurafenib", dec); 0.001::e_ksea("FYN", "Vemurafenib", inc) :- e_activity("FYN", "Vemurafenib", dec).
0.001::e_ksea("FYN", "Vemurafenib", dec); 0.5422674681::e_ksea("FYN", "Vemurafenib", inc) :- e_activity("FYN", "Vemurafenib", inc).
0.6563190115::e_ksea("HIPK2", "AC220", dec); 0.001::e_ksea("HIPK2", "AC220", inc) :- e_activity("HIPK2", "AC220", dec).
0.001::e_ksea("HIPK2", "AC220", dec); 0.6563190115::e_ksea("HIPK2", "AC220", inc) :- e_activity("HIPK2", "AC220", inc).
0.7007085147::e_ksea("HIPK2", "AT13148", dec); 0.001::e_ksea("HIPK2", "AT13148", inc) :- e_activity("HIPK2", "AT13148", dec).
0.001::e_ksea("HIPK2", "AT13148", dec); 0.7007085147::e_ksea("HIPK2", "AT13148", inc) :- e_activity("HIPK2", "AT13148", inc).
0.6645592463::e_ksea("HIPK2", "AZ20", dec); 0.001::e_ksea("HIPK2", "AZ20", inc) :- e_activity("HIPK2", "AZ20", dec).
0.001::e_ksea("HIPK2", "AZ20", dec); 0.6645592463::e_ksea("HIPK2", "AZ20", inc) :- e_activity("HIPK2", "AZ20", inc).
0.9687231675::e_ksea("HIPK2", "AZD1480", dec); 0.001::e_ksea("HIPK2", "AZD1480", inc) :- e_activity("HIPK2", "AZD1480", dec).
0.001::e_ksea("HIPK2", "AZD1480", dec); 0.9687231675::e_ksea("HIPK2", "AZD1480", inc) :- e_activity("HIPK2", "AZD1480", inc).
0.8772329773::e_ksea("HIPK2", "AZD3759", dec); 0.001::e_ksea("HIPK2", "AZD3759", inc) :- e_activity("HIPK2", "AZD3759", dec).
0.001::e_ksea("HIPK2", "AZD3759", dec); 0.8772329773::e_ksea("HIPK2", "AZD3759", inc) :- e_activity("HIPK2", "AZD3759", inc).
0.9838710672::e_ksea("HIPK2", "AZD5363", dec); 0.001::e_ksea("HIPK2", "AZD5363", inc) :- e_activity("HIPK2", "AZD5363", dec).
0.001::e_ksea("HIPK2", "AZD5363", dec); 0.9838710672::e_ksea("HIPK2", "AZD5363", inc) :- e_activity("HIPK2", "AZD5363", inc).
0.9979426482::e_ksea("HIPK2", "AZD5438", dec); 0.001::e_ksea("HIPK2", "AZD5438", inc) :- e_activity("HIPK2", "AZD5438", dec).
0.001::e_ksea("HIPK2", "AZD5438", dec); 0.9979426482::e_ksea("HIPK2", "AZD5438", inc) :- e_activity("HIPK2", "AZD5438", inc).
0.7675624122::e_ksea("HIPK2", "AZD6482", dec); 0.001::e_ksea("HIPK2", "AZD6482", inc) :- e_activity("HIPK2", "AZD6482", dec).
0.001::e_ksea("HIPK2", "AZD6482", dec); 0.7675624122::e_ksea("HIPK2", "AZD6482", inc) :- e_activity("HIPK2", "AZD6482", inc).
0.801736786::e_ksea("HIPK2", "AZD6738", dec); 0.001::e_ksea("HIPK2", "AZD6738", inc) :- e_activity("HIPK2", "AZD6738", dec).
0.001::e_ksea("HIPK2", "AZD6738", dec); 0.801736786::e_ksea("HIPK2", "AZD6738", inc) :- e_activity("HIPK2", "AZD6738", inc).
0.7419364393::e_ksea("HIPK2", "AZD8055", dec); 0.001::e_ksea("HIPK2", "AZD8055", inc) :- e_activity("HIPK2", "AZD8055", dec).
0.001::e_ksea("HIPK2", "AZD8055", dec); 0.7419364393::e_ksea("HIPK2", "AZD8055", inc) :- e_activity("HIPK2", "AZD8055", inc).
0.539589258::e_ksea("HIPK2", "Amuvatinib", dec); 0.001::e_ksea("HIPK2", "Amuvatinib", inc) :- e_activity("HIPK2", "Amuvatinib", dec).
0.001::e_ksea("HIPK2", "Amuvatinib", dec); 0.539589258::e_ksea("HIPK2", "Amuvatinib", inc) :- e_activity("HIPK2", "Amuvatinib", inc).
0.9392765504::e_ksea("HIPK2", "BX912", dec); 0.001::e_ksea("HIPK2", "BX912", inc) :- e_activity("HIPK2", "BX912", dec).
0.001::e_ksea("HIPK2", "BX912", dec); 0.9392765504::e_ksea("HIPK2", "BX912", inc) :- e_activity("HIPK2", "BX912", inc).
0.6875094106::e_ksea("HIPK2", "Bosutinib", dec); 0.001::e_ksea("HIPK2", "Bosutinib", inc) :- e_activity("HIPK2", "Bosutinib", dec).
0.001::e_ksea("HIPK2", "Bosutinib", dec); 0.6875094106::e_ksea("HIPK2", "Bosutinib", inc) :- e_activity("HIPK2", "Bosutinib", inc).
0.6970164585::e_ksea("HIPK2", "CAL101", dec); 0.001::e_ksea("HIPK2", "CAL101", inc) :- e_activity("HIPK2", "CAL101", dec).
0.001::e_ksea("HIPK2", "CAL101", dec); 0.6970164585::e_ksea("HIPK2", "CAL101", inc) :- e_activity("HIPK2", "CAL101", inc).
0.9091403298::e_ksea("HIPK2", "CHIR99021", dec); 0.001::e_ksea("HIPK2", "CHIR99021", inc) :- e_activity("HIPK2", "CHIR99021", dec).
0.001::e_ksea("HIPK2", "CHIR99021", dec); 0.9091403298::e_ksea("HIPK2", "CHIR99021", inc) :- e_activity("HIPK2", "CHIR99021", inc).
0.9013559256::e_ksea("HIPK2", "CX4945", dec); 0.001::e_ksea("HIPK2", "CX4945", inc) :- e_activity("HIPK2", "CX4945", dec).
0.001::e_ksea("HIPK2", "CX4945", dec); 0.9013559256::e_ksea("HIPK2", "CX4945", inc) :- e_activity("HIPK2", "CX4945", inc).
0.5391890675::e_ksea("HIPK2", "DNAPK", dec); 0.001::e_ksea("HIPK2", "DNAPK", inc) :- e_activity("HIPK2", "DNAPK", dec).
0.001::e_ksea("HIPK2", "DNAPK", dec); 0.5391890675::e_ksea("HIPK2", "DNAPK", inc) :- e_activity("HIPK2", "DNAPK", inc).
0.6211157088::e_ksea("HIPK2", "Dabrafenib", dec); 0.001::e_ksea("HIPK2", "Dabrafenib", inc) :- e_activity("HIPK2", "Dabrafenib", dec).
0.001::e_ksea("HIPK2", "Dabrafenib", dec); 0.6211157088::e_ksea("HIPK2", "Dabrafenib", inc) :- e_activity("HIPK2", "Dabrafenib", inc).
0.6957195394::e_ksea("HIPK2", "Dasatinib", dec); 0.001::e_ksea("HIPK2", "Dasatinib", inc) :- e_activity("HIPK2", "Dasatinib", dec).
0.001::e_ksea("HIPK2", "Dasatinib", dec); 0.6957195394::e_ksea("HIPK2", "Dasatinib", inc) :- e_activity("HIPK2", "Dasatinib", inc).
0.6407120502::e_ksea("HIPK2", "Edelfosine", dec); 0.001::e_ksea("HIPK2", "Edelfosine", inc) :- e_activity("HIPK2", "Edelfosine", dec).
0.001::e_ksea("HIPK2", "Edelfosine", dec); 0.6407120502::e_ksea("HIPK2", "Edelfosine", inc) :- e_activity("HIPK2", "Edelfosine", inc).
0.9734415195::e_ksea("HIPK2", "FRAX486", dec); 0.001::e_ksea("HIPK2", "FRAX486", inc) :- e_activity("HIPK2", "FRAX486", dec).
0.001::e_ksea("HIPK2", "FRAX486", dec); 0.9734415195::e_ksea("HIPK2", "FRAX486", inc) :- e_activity("HIPK2", "FRAX486", inc).
0.9497606991::e_ksea("HIPK2", "GDC0941", dec); 0.001::e_ksea("HIPK2", "GDC0941", inc) :- e_activity("HIPK2", "GDC0941", dec).
0.001::e_ksea("HIPK2", "GDC0941", dec); 0.9497606991::e_ksea("HIPK2", "GDC0941", inc) :- e_activity("HIPK2", "GDC0941", inc).
0.9165674249::e_ksea("HIPK2", "GDC0994", dec); 0.001::e_ksea("HIPK2", "GDC0994", inc) :- e_activity("HIPK2", "GDC0994", dec).
0.001::e_ksea("HIPK2", "GDC0994", dec); 0.9165674249::e_ksea("HIPK2", "GDC0994", inc) :- e_activity("HIPK2", "GDC0994", inc).
0.8439374691::e_ksea("HIPK2", "GF109203X", dec); 0.001::e_ksea("HIPK2", "GF109203X", inc) :- e_activity("HIPK2", "GF109203X", dec).
0.001::e_ksea("HIPK2", "GF109203X", dec); 0.8439374691::e_ksea("HIPK2", "GF109203X", inc) :- e_activity("HIPK2", "GF109203X", inc).
0.8924446399::e_ksea("HIPK2", "GO6983", dec); 0.001::e_ksea("HIPK2", "GO6983", inc) :- e_activity("HIPK2", "GO6983", dec).
0.001::e_ksea("HIPK2", "GO6983", dec); 0.8924446399::e_ksea("HIPK2", "GO6983", inc) :- e_activity("HIPK2", "GO6983", inc).
0.8683607778::e_ksea("HIPK2", "GSK2334470", dec); 0.001::e_ksea("HIPK2", "GSK2334470", inc) :- e_activity("HIPK2", "GSK2334470", dec).
0.001::e_ksea("HIPK2", "GSK2334470", dec); 0.8683607778::e_ksea("HIPK2", "GSK2334470", inc) :- e_activity("HIPK2", "GSK2334470", inc).
0.6922901887::e_ksea("HIPK2", "GSK690693", dec); 0.001::e_ksea("HIPK2", "GSK690693", inc) :- e_activity("HIPK2", "GSK690693", dec).
0.001::e_ksea("HIPK2", "GSK690693", dec); 0.6922901887::e_ksea("HIPK2", "GSK690693", inc) :- e_activity("HIPK2", "GSK690693", inc).
0.7830057793::e_ksea("HIPK2", "Go6976", dec); 0.001::e_ksea("HIPK2", "Go6976", inc) :- e_activity("HIPK2", "Go6976", dec).
0.001::e_ksea("HIPK2", "Go6976", dec); 0.7830057793::e_ksea("HIPK2", "Go6976", inc) :- e_activity("HIPK2", "Go6976", inc).
0.749977283::e_ksea("HIPK2", "H89", dec); 0.001::e_ksea("HIPK2", "H89", inc) :- e_activity("HIPK2", "H89", dec).
0.001::e_ksea("HIPK2", "H89", dec); 0.749977283::e_ksea("HIPK2", "H89", inc) :- e_activity("HIPK2", "H89", inc).
0.7793728185::e_ksea("HIPK2", "HS173", dec); 0.001::e_ksea("HIPK2", "HS173", inc) :- e_activity("HIPK2", "HS173", dec).
0.001::e_ksea("HIPK2", "HS173", dec); 0.7793728185::e_ksea("HIPK2", "HS173", inc) :- e_activity("HIPK2", "HS173", inc).
0.895519261::e_ksea("HIPK2", "Ipatasertib", dec); 0.001::e_ksea("HIPK2", "Ipatasertib", inc) :- e_activity("HIPK2", "Ipatasertib", dec).
0.001::e_ksea("HIPK2", "Ipatasertib", dec); 0.895519261::e_ksea("HIPK2", "Ipatasertib", inc) :- e_activity("HIPK2", "Ipatasertib", inc).
0.8134943588::e_ksea("HIPK2", "JNJ", dec); 0.001::e_ksea("HIPK2", "JNJ", inc) :- e_activity("HIPK2", "JNJ", dec).
0.001::e_ksea("HIPK2", "JNJ", dec); 0.8134943588::e_ksea("HIPK2", "JNJ", inc) :- e_activity("HIPK2", "JNJ", inc).
0.6769710154::e_ksea("HIPK2", "JNK", dec); 0.001::e_ksea("HIPK2", "JNK", inc) :- e_activity("HIPK2", "JNK", dec).
0.001::e_ksea("HIPK2", "JNK", dec); 0.6769710154::e_ksea("HIPK2", "JNK", inc) :- e_activity("HIPK2", "JNK", inc).
0.8021783318::e_ksea("HIPK2", "KD025", dec); 0.001::e_ksea("HIPK2", "KD025", inc) :- e_activity("HIPK2", "KD025", dec).
0.001::e_ksea("HIPK2", "KD025", dec); 0.8021783318::e_ksea("HIPK2", "KD025", inc) :- e_activity("HIPK2", "KD025", inc).
0.9399679477::e_ksea("HIPK2", "KN62", dec); 0.001::e_ksea("HIPK2", "KN62", inc) :- e_activity("HIPK2", "KN62", dec).
0.001::e_ksea("HIPK2", "KN62", dec); 0.9399679477::e_ksea("HIPK2", "KN62", inc) :- e_activity("HIPK2", "KN62", inc).
0.7407988295::e_ksea("HIPK2", "KN93", dec); 0.001::e_ksea("HIPK2", "KN93", inc) :- e_activity("HIPK2", "KN93", dec).
0.001::e_ksea("HIPK2", "KN93", dec); 0.7407988295::e_ksea("HIPK2", "KN93", inc) :- e_activity("HIPK2", "KN93", inc).
0.742362278::e_ksea("HIPK2", "Ku0063794", dec); 0.001::e_ksea("HIPK2", "Ku0063794", inc) :- e_activity("HIPK2", "Ku0063794", dec).
0.001::e_ksea("HIPK2", "Ku0063794", dec); 0.742362278::e_ksea("HIPK2", "Ku0063794", inc) :- e_activity("HIPK2", "Ku0063794", inc).
0.9640966691::e_ksea("HIPK2", "LY2090314", dec); 0.001::e_ksea("HIPK2", "LY2090314", inc) :- e_activity("HIPK2", "LY2090314", dec).
0.001::e_ksea("HIPK2", "LY2090314", dec); 0.9640966691::e_ksea("HIPK2", "LY2090314", inc) :- e_activity("HIPK2", "LY2090314", inc).
0.89551467::e_ksea("HIPK2", "LY2584702", dec); 0.001::e_ksea("HIPK2", "LY2584702", inc) :- e_activity("HIPK2", "LY2584702", dec).
0.001::e_ksea("HIPK2", "LY2584702", dec); 0.89551467::e_ksea("HIPK2", "LY2584702", inc) :- e_activity("HIPK2", "LY2584702", inc).
0.5228748103::e_ksea("HIPK2", "LY2835219", dec); 0.001::e_ksea("HIPK2", "LY2835219", inc) :- e_activity("HIPK2", "LY2835219", dec).
0.001::e_ksea("HIPK2", "LY2835219", dec); 0.5228748103::e_ksea("HIPK2", "LY2835219", inc) :- e_activity("HIPK2", "LY2835219", inc).
0.5814494528::e_ksea("HIPK2", "Linsitinib", dec); 0.001::e_ksea("HIPK2", "Linsitinib", inc) :- e_activity("HIPK2", "Linsitinib", dec).
0.001::e_ksea("HIPK2", "Linsitinib", dec); 0.5814494528::e_ksea("HIPK2", "Linsitinib", inc) :- e_activity("HIPK2", "Linsitinib", inc).
0.5822803016::e_ksea("HIPK2", "MK2206", dec); 0.001::e_ksea("HIPK2", "MK2206", inc) :- e_activity("HIPK2", "MK2206", dec).
0.001::e_ksea("HIPK2", "MK2206", dec); 0.5822803016::e_ksea("HIPK2", "MK2206", inc) :- e_activity("HIPK2", "MK2206", inc).
0.5547785546::e_ksea("HIPK2", "NU7441", dec); 0.001::e_ksea("HIPK2", "NU7441", inc) :- e_activity("HIPK2", "NU7441", dec).
0.001::e_ksea("HIPK2", "NU7441", dec); 0.5547785546::e_ksea("HIPK2", "NU7441", inc) :- e_activity("HIPK2", "NU7441", inc).
0.6930539252::e_ksea("HIPK2", "PD153035", dec); 0.001::e_ksea("HIPK2", "PD153035", inc) :- e_activity("HIPK2", "PD153035", dec).
0.001::e_ksea("HIPK2", "PD153035", dec); 0.6930539252::e_ksea("HIPK2", "PD153035", inc) :- e_activity("HIPK2", "PD153035", inc).
0.9948242968::e_ksea("HIPK2", "PF3758309", dec); 0.001::e_ksea("HIPK2", "PF3758309", inc) :- e_activity("HIPK2", "PF3758309", dec).
0.001::e_ksea("HIPK2", "PF3758309", dec); 0.9948242968::e_ksea("HIPK2", "PF3758309", inc) :- e_activity("HIPK2", "PF3758309", inc).
0.7855279583::e_ksea("HIPK2", "PF4708671", dec); 0.001::e_ksea("HIPK2", "PF4708671", inc) :- e_activity("HIPK2", "PF4708671", dec).
0.001::e_ksea("HIPK2", "PF4708671", dec); 0.7855279583::e_ksea("HIPK2", "PF4708671", inc) :- e_activity("HIPK2", "PF4708671", inc).
0.5921922898::e_ksea("HIPK2", "PH797804", dec); 0.001::e_ksea("HIPK2", "PH797804", inc) :- e_activity("HIPK2", "PH797804", dec).
0.001::e_ksea("HIPK2", "PH797804", dec); 0.5921922898::e_ksea("HIPK2", "PH797804", inc) :- e_activity("HIPK2", "PH797804", inc).
0.9183055527::e_ksea("HIPK2", "PIK294", dec); 0.001::e_ksea("HIPK2", "PIK294", inc) :- e_activity("HIPK2", "PIK294", dec).
0.001::e_ksea("HIPK2", "PIK294", dec); 0.9183055527::e_ksea("HIPK2", "PIK294", inc) :- e_activity("HIPK2", "PIK294", inc).
0.5373949299::e_ksea("HIPK2", "Ribociclib", dec); 0.001::e_ksea("HIPK2", "Ribociclib", inc) :- e_activity("HIPK2", "Ribociclib", dec).
0.001::e_ksea("HIPK2", "Ribociclib", dec); 0.5373949299::e_ksea("HIPK2", "Ribociclib", inc) :- e_activity("HIPK2", "Ribociclib", inc).
0.9303111409::e_ksea("HIPK2", "Ripasudil", dec); 0.001::e_ksea("HIPK2", "Ripasudil", inc) :- e_activity("HIPK2", "Ripasudil", dec).
0.001::e_ksea("HIPK2", "Ripasudil", dec); 0.9303111409::e_ksea("HIPK2", "Ripasudil", inc) :- e_activity("HIPK2", "Ripasudil", inc).
0.8837635392::e_ksea("HIPK2", "SP600125", dec); 0.001::e_ksea("HIPK2", "SP600125", inc) :- e_activity("HIPK2", "SP600125", dec).
0.001::e_ksea("HIPK2", "SP600125", dec); 0.8837635392::e_ksea("HIPK2", "SP600125", inc) :- e_activity("HIPK2", "SP600125", inc).
0.5739050063::e_ksea("HIPK2", "Selumetinib", dec); 0.001::e_ksea("HIPK2", "Selumetinib", inc) :- e_activity("HIPK2", "Selumetinib", dec).
0.001::e_ksea("HIPK2", "Selumetinib", dec); 0.5739050063::e_ksea("HIPK2", "Selumetinib", inc) :- e_activity("HIPK2", "Selumetinib", inc).
0.800291612::e_ksea("HIPK2", "TAK715", dec); 0.001::e_ksea("HIPK2", "TAK715", inc) :- e_activity("HIPK2", "TAK715", dec).
0.001::e_ksea("HIPK2", "TAK715", dec); 0.800291612::e_ksea("HIPK2", "TAK715", inc) :- e_activity("HIPK2", "TAK715", inc).
0.6986976554::e_ksea("HIPK2", "TBCA", dec); 0.001::e_ksea("HIPK2", "TBCA", inc) :- e_activity("HIPK2", "TBCA", dec).
0.001::e_ksea("HIPK2", "TBCA", dec); 0.6986976554::e_ksea("HIPK2", "TBCA", inc) :- e_activity("HIPK2", "TBCA", inc).
0.8095446594::e_ksea("HIPK2", "TGX221", dec); 0.001::e_ksea("HIPK2", "TGX221", inc) :- e_activity("HIPK2", "TGX221", dec).
0.001::e_ksea("HIPK2", "TGX221", dec); 0.8095446594::e_ksea("HIPK2", "TGX221", inc) :- e_activity("HIPK2", "TGX221", inc).
0.6543948008::e_ksea("HIPK2", "Tofacitinib", dec); 0.001::e_ksea("HIPK2", "Tofacitinib", inc) :- e_activity("HIPK2", "Tofacitinib", dec).
0.001::e_ksea("HIPK2", "Tofacitinib", dec); 0.6543948008::e_ksea("HIPK2", "Tofacitinib", inc) :- e_activity("HIPK2", "Tofacitinib", inc).
0.5691831743::e_ksea("HIPK2", "Torin", dec); 0.001::e_ksea("HIPK2", "Torin", inc) :- e_activity("HIPK2", "Torin", dec).
0.001::e_ksea("HIPK2", "Torin", dec); 0.5691831743::e_ksea("HIPK2", "Torin", inc) :- e_activity("HIPK2", "Torin", inc).
0.7633752575::e_ksea("HIPK2", "Trametinib", dec); 0.001::e_ksea("HIPK2", "Trametinib", inc) :- e_activity("HIPK2", "Trametinib", dec).
0.001::e_ksea("HIPK2", "Trametinib", dec); 0.7633752575::e_ksea("HIPK2", "Trametinib", inc) :- e_activity("HIPK2", "Trametinib", inc).
0.5694267976::e_ksea("HIPK2", "U73122", dec); 0.001::e_ksea("HIPK2", "U73122", inc) :- e_activity("HIPK2", "U73122", dec).
0.001::e_ksea("HIPK2", "U73122", dec); 0.5694267976::e_ksea("HIPK2", "U73122", inc) :- e_activity("HIPK2", "U73122", inc).
0.5691954321::e_ksea("HIPK2", "Ulixertinib", dec); 0.001::e_ksea("HIPK2", "Ulixertinib", inc) :- e_activity("HIPK2", "Ulixertinib", dec).
0.001::e_ksea("HIPK2", "Ulixertinib", dec); 0.5691954321::e_ksea("HIPK2", "Ulixertinib", inc) :- e_activity("HIPK2", "Ulixertinib", inc).
0.6286624615::e_ksea("HIPK2", "Vemurafenib", dec); 0.001::e_ksea("HIPK2", "Vemurafenib", inc) :- e_activity("HIPK2", "Vemurafenib", dec).
0.001::e_ksea("HIPK2", "Vemurafenib", dec); 0.6286624615::e_ksea("HIPK2", "Vemurafenib", inc) :- e_activity("HIPK2", "Vemurafenib", inc).
0.5075575613::e_ksea("PTK2", "AC220", dec); 0.001::e_ksea("PTK2", "AC220", inc) :- e_activity("PTK2", "AC220", dec).
0.001::e_ksea("PTK2", "AC220", dec); 0.5075575613::e_ksea("PTK2", "AC220", inc) :- e_activity("PTK2", "AC220", inc).
0.667607332::e_ksea("PTK2", "AT13148", dec); 0.001::e_ksea("PTK2", "AT13148", inc) :- e_activity("PTK2", "AT13148", dec).
0.001::e_ksea("PTK2", "AT13148", dec); 0.667607332::e_ksea("PTK2", "AT13148", inc) :- e_activity("PTK2", "AT13148", inc).
0.6657862864::e_ksea("PTK2", "AZ20", dec); 0.001::e_ksea("PTK2", "AZ20", inc) :- e_activity("PTK2", "AZ20", dec).
0.001::e_ksea("PTK2", "AZ20", dec); 0.6657862864::e_ksea("PTK2", "AZ20", inc) :- e_activity("PTK2", "AZ20", inc).
0.7943734951::e_ksea("PTK2", "AZD1480", dec); 0.001::e_ksea("PTK2", "AZD1480", inc) :- e_activity("PTK2", "AZD1480", dec).
0.001::e_ksea("PTK2", "AZD1480", dec); 0.7943734951::e_ksea("PTK2", "AZD1480", inc) :- e_activity("PTK2", "AZD1480", inc).
0.7399868597::e_ksea("PTK2", "AZD3759", dec); 0.001::e_ksea("PTK2", "AZD3759", inc) :- e_activity("PTK2", "AZD3759", dec).
0.001::e_ksea("PTK2", "AZD3759", dec); 0.7399868597::e_ksea("PTK2", "AZD3759", inc) :- e_activity("PTK2", "AZD3759", inc).
0.7926848235::e_ksea("PTK2", "AZD5363", dec); 0.001::e_ksea("PTK2", "AZD5363", inc) :- e_activity("PTK2", "AZD5363", dec).
0.001::e_ksea("PTK2", "AZD5363", dec); 0.7926848235::e_ksea("PTK2", "AZD5363", inc) :- e_activity("PTK2", "AZD5363", inc).
0.5295208728::e_ksea("PTK2", "AZD5438", dec); 0.001::e_ksea("PTK2", "AZD5438", inc) :- e_activity("PTK2", "AZD5438", dec).
0.001::e_ksea("PTK2", "AZD5438", dec); 0.5295208728::e_ksea("PTK2", "AZD5438", inc) :- e_activity("PTK2", "AZD5438", inc).
0.7621577458::e_ksea("PTK2", "AZD6482", dec); 0.001::e_ksea("PTK2", "AZD6482", inc) :- e_activity("PTK2", "AZD6482", dec).
0.001::e_ksea("PTK2", "AZD6482", dec); 0.7621577458::e_ksea("PTK2", "AZD6482", inc) :- e_activity("PTK2", "AZD6482", inc).
0.6135638986::e_ksea("PTK2", "AZD6738", dec); 0.001::e_ksea("PTK2", "AZD6738", inc) :- e_activity("PTK2", "AZD6738", dec).
0.001::e_ksea("PTK2", "AZD6738", dec); 0.6135638986::e_ksea("PTK2", "AZD6738", inc) :- e_activity("PTK2", "AZD6738", inc).
0.7436982987::e_ksea("PTK2", "AZD8055", dec); 0.001::e_ksea("PTK2", "AZD8055", inc) :- e_activity("PTK2", "AZD8055", dec).
0.001::e_ksea("PTK2", "AZD8055", dec); 0.7436982987::e_ksea("PTK2", "AZD8055", inc) :- e_activity("PTK2", "AZD8055", inc).
0.594296762::e_ksea("PTK2", "Amuvatinib", dec); 0.001::e_ksea("PTK2", "Amuvatinib", inc) :- e_activity("PTK2", "Amuvatinib", dec).
0.001::e_ksea("PTK2", "Amuvatinib", dec); 0.594296762::e_ksea("PTK2", "Amuvatinib", inc) :- e_activity("PTK2", "Amuvatinib", inc).
0.794359227::e_ksea("PTK2", "BX912", dec); 0.001::e_ksea("PTK2", "BX912", inc) :- e_activity("PTK2", "BX912", dec).
0.001::e_ksea("PTK2", "BX912", dec); 0.794359227::e_ksea("PTK2", "BX912", inc) :- e_activity("PTK2", "BX912", inc).
0.5528212103::e_ksea("PTK2", "Bosutinib", dec); 0.001::e_ksea("PTK2", "Bosutinib", inc) :- e_activity("PTK2", "Bosutinib", dec).
0.001::e_ksea("PTK2", "Bosutinib", dec); 0.5528212103::e_ksea("PTK2", "Bosutinib", inc) :- e_activity("PTK2", "Bosutinib", inc).
0.6730733627::e_ksea("PTK2", "CAL101", dec); 0.001::e_ksea("PTK2", "CAL101", inc) :- e_activity("PTK2", "CAL101", dec).
0.001::e_ksea("PTK2", "CAL101", dec); 0.6730733627::e_ksea("PTK2", "CAL101", inc) :- e_activity("PTK2", "CAL101", inc).
0.676640444::e_ksea("PTK2", "CHIR99021", dec); 0.001::e_ksea("PTK2", "CHIR99021", inc) :- e_activity("PTK2", "CHIR99021", dec).
0.001::e_ksea("PTK2", "CHIR99021", dec); 0.676640444::e_ksea("PTK2", "CHIR99021", inc) :- e_activity("PTK2", "CHIR99021", inc).
0.591701047::e_ksea("PTK2", "CX4945", dec); 0.001::e_ksea("PTK2", "CX4945", inc) :- e_activity("PTK2", "CX4945", dec).
0.001::e_ksea("PTK2", "CX4945", dec); 0.591701047::e_ksea("PTK2", "CX4945", inc) :- e_activity("PTK2", "CX4945", inc).
0.6268898028::e_ksea("PTK2", "DNAPK", dec); 0.001::e_ksea("PTK2", "DNAPK", inc) :- e_activity("PTK2", "DNAPK", dec).
0.001::e_ksea("PTK2", "DNAPK", dec); 0.6268898028::e_ksea("PTK2", "DNAPK", inc) :- e_activity("PTK2", "DNAPK", inc).
0.6691337249::e_ksea("PTK2", "Dabrafenib", dec); 0.001::e_ksea("PTK2", "Dabrafenib", inc) :- e_activity("PTK2", "Dabrafenib", dec).
0.001::e_ksea("PTK2", "Dabrafenib", dec); 0.6691337249::e_ksea("PTK2", "Dabrafenib", inc) :- e_activity("PTK2", "Dabrafenib", inc).
0.5401296847::e_ksea("PTK2", "Dasatinib", dec); 0.001::e_ksea("PTK2", "Dasatinib", inc) :- e_activity("PTK2", "Dasatinib", dec).
0.001::e_ksea("PTK2", "Dasatinib", dec); 0.5401296847::e_ksea("PTK2", "Dasatinib", inc) :- e_activity("PTK2", "Dasatinib", inc).
0.5849132984::e_ksea("PTK2", "Edelfosine", dec); 0.001::e_ksea("PTK2", "Edelfosine", inc) :- e_activity("PTK2", "Edelfosine", dec).
0.001::e_ksea("PTK2", "Edelfosine", dec); 0.5849132984::e_ksea("PTK2", "Edelfosine", inc) :- e_activity("PTK2", "Edelfosine", inc).
0.6644302942::e_ksea("PTK2", "FRAX486", dec); 0.001::e_ksea("PTK2", "FRAX486", inc) :- e_activity("PTK2", "FRAX486", dec).
0.001::e_ksea("PTK2", "FRAX486", dec); 0.6644302942::e_ksea("PTK2", "FRAX486", inc) :- e_activity("PTK2", "FRAX486", inc).
0.6854377562::e_ksea("PTK2", "GDC0941", dec); 0.001::e_ksea("PTK2", "GDC0941", inc) :- e_activity("PTK2", "GDC0941", dec).
0.001::e_ksea("PTK2", "GDC0941", dec); 0.6854377562::e_ksea("PTK2", "GDC0941", inc) :- e_activity("PTK2", "GDC0941", inc).
0.7764153631::e_ksea("PTK2", "GDC0994", dec); 0.001::e_ksea("PTK2", "GDC0994", inc) :- e_activity("PTK2", "GDC0994", dec).
0.001::e_ksea("PTK2", "GDC0994", dec); 0.7764153631::e_ksea("PTK2", "GDC0994", inc) :- e_activity("PTK2", "GDC0994", inc).
0.6555173::e_ksea("PTK2", "GF109203X", dec); 0.001::e_ksea("PTK2", "GF109203X", inc) :- e_activity("PTK2", "GF109203X", dec).
0.001::e_ksea("PTK2", "GF109203X", dec); 0.6555173::e_ksea("PTK2", "GF109203X", inc) :- e_activity("PTK2", "GF109203X", inc).
0.5272752915::e_ksea("PTK2", "GO6983", dec); 0.001::e_ksea("PTK2", "GO6983", inc) :- e_activity("PTK2", "GO6983", dec).
0.001::e_ksea("PTK2", "GO6983", dec); 0.5272752915::e_ksea("PTK2", "GO6983", inc) :- e_activity("PTK2", "GO6983", inc).
0.7951430752::e_ksea("PTK2", "GSK2334470", dec); 0.001::e_ksea("PTK2", "GSK2334470", inc) :- e_activity("PTK2", "GSK2334470", dec).
0.001::e_ksea("PTK2", "GSK2334470", dec); 0.7951430752::e_ksea("PTK2", "GSK2334470", inc) :- e_activity("PTK2", "GSK2334470", inc).
0.5479377275::e_ksea("PTK2", "GSK690693", dec); 0.001::e_ksea("PTK2", "GSK690693", inc) :- e_activity("PTK2", "GSK690693", dec).
0.001::e_ksea("PTK2", "GSK690693", dec); 0.5479377275::e_ksea("PTK2", "GSK690693", inc) :- e_activity("PTK2", "GSK690693", inc).
0.6255148146::e_ksea("PTK2", "Go6976", dec); 0.001::e_ksea("PTK2", "Go6976", inc) :- e_activity("PTK2", "Go6976", dec).
0.001::e_ksea("PTK2", "Go6976", dec); 0.6255148146::e_ksea("PTK2", "Go6976", inc) :- e_activity("PTK2", "Go6976", inc).
0.5942989525::e_ksea("PTK2", "H89", dec); 0.001::e_ksea("PTK2", "H89", inc) :- e_activity("PTK2", "H89", dec).
0.001::e_ksea("PTK2", "H89", dec); 0.5942989525::e_ksea("PTK2", "H89", inc) :- e_activity("PTK2", "H89", inc).
0.5326785006::e_ksea("PTK2", "HS173", dec); 0.001::e_ksea("PTK2", "HS173", inc) :- e_activity("PTK2", "HS173", dec).
0.001::e_ksea("PTK2", "HS173", dec); 0.5326785006::e_ksea("PTK2", "HS173", inc) :- e_activity("PTK2", "HS173", inc).
0.7986858302::e_ksea("PTK2", "Ipatasertib", dec); 0.001::e_ksea("PTK2", "Ipatasertib", inc) :- e_activity("PTK2", "Ipatasertib", dec).
0.001::e_ksea("PTK2", "Ipatasertib", dec); 0.7986858302::e_ksea("PTK2", "Ipatasertib", inc) :- e_activity("PTK2", "Ipatasertib", inc).
0.6088048383::e_ksea("PTK2", "JNJ", dec); 0.001::e_ksea("PTK2", "JNJ", inc) :- e_activity("PTK2", "JNJ", dec).
0.001::e_ksea("PTK2", "JNJ", dec); 0.6088048383::e_ksea("PTK2", "JNJ", inc) :- e_activity("PTK2", "JNJ", inc).
0.6682523098::e_ksea("PTK2", "JNK", dec); 0.001::e_ksea("PTK2", "JNK", inc) :- e_activity("PTK2", "JNK", dec).
0.001::e_ksea("PTK2", "JNK", dec); 0.6682523098::e_ksea("PTK2", "JNK", inc) :- e_activity("PTK2", "JNK", inc).
0.7466550485::e_ksea("PTK2", "KD025", dec); 0.001::e_ksea("PTK2", "KD025", inc) :- e_activity("PTK2", "KD025", dec).
0.001::e_ksea("PTK2", "KD025", dec); 0.7466550485::e_ksea("PTK2", "KD025", inc) :- e_activity("PTK2", "KD025", inc).
0.7294251245::e_ksea("PTK2", "KN62", dec); 0.001::e_ksea("PTK2", "KN62", inc) :- e_activity("PTK2", "KN62", dec).
0.001::e_ksea("PTK2", "KN62", dec); 0.7294251245::e_ksea("PTK2", "KN62", inc) :- e_activity("PTK2", "KN62", inc).
0.5599325159::e_ksea("PTK2", "KN93", dec); 0.001::e_ksea("PTK2", "KN93", inc) :- e_activity("PTK2", "KN93", dec).
0.001::e_ksea("PTK2", "KN93", dec); 0.5599325159::e_ksea("PTK2", "KN93", inc) :- e_activity("PTK2", "KN93", inc).
0.5602283211::e_ksea("PTK2", "Ku0063794", dec); 0.001::e_ksea("PTK2", "Ku0063794", inc) :- e_activity("PTK2", "Ku0063794", dec).
0.001::e_ksea("PTK2", "Ku0063794", dec); 0.5602283211::e_ksea("PTK2", "Ku0063794", inc) :- e_activity("PTK2", "Ku0063794", inc).
0.7772443351::e_ksea("PTK2", "LY2090314", dec); 0.001::e_ksea("PTK2", "LY2090314", inc) :- e_activity("PTK2", "LY2090314", dec).
0.001::e_ksea("PTK2", "LY2090314", dec); 0.7772443351::e_ksea("PTK2", "LY2090314", inc) :- e_activity("PTK2", "LY2090314", inc).
0.7707833478::e_ksea("PTK2", "LY2584702", dec); 0.001::e_ksea("PTK2", "LY2584702", inc) :- e_activity("PTK2", "LY2584702", dec).
0.001::e_ksea("PTK2", "LY2584702", dec); 0.7707833478::e_ksea("PTK2", "LY2584702", inc) :- e_activity("PTK2", "LY2584702", inc).
0.6913706244::e_ksea("PTK2", "LY2835219", dec); 0.001::e_ksea("PTK2", "LY2835219", inc) :- e_activity("PTK2", "LY2835219", dec).
0.001::e_ksea("PTK2", "LY2835219", dec); 0.6913706244::e_ksea("PTK2", "LY2835219", inc) :- e_activity("PTK2", "LY2835219", inc).
0.6473485453::e_ksea("PTK2", "Linsitinib", dec); 0.001::e_ksea("PTK2", "Linsitinib", inc) :- e_activity("PTK2", "Linsitinib", dec).
0.001::e_ksea("PTK2", "Linsitinib", dec); 0.6473485453::e_ksea("PTK2", "Linsitinib", inc) :- e_activity("PTK2", "Linsitinib", inc).
0.5961677101::e_ksea("PTK2", "MK2206", dec); 0.001::e_ksea("PTK2", "MK2206", inc) :- e_activity("PTK2", "MK2206", dec).
0.001::e_ksea("PTK2", "MK2206", dec); 0.5961677101::e_ksea("PTK2", "MK2206", inc) :- e_activity("PTK2", "MK2206", inc).
0.6947820839::e_ksea("PTK2", "NU7441", dec); 0.001::e_ksea("PTK2", "NU7441", inc) :- e_activity("PTK2", "NU7441", dec).
0.001::e_ksea("PTK2", "NU7441", dec); 0.6947820839::e_ksea("PTK2", "NU7441", inc) :- e_activity("PTK2", "NU7441", inc).
0.7032022484::e_ksea("PTK2", "PD153035", dec); 0.001::e_ksea("PTK2", "PD153035", inc) :- e_activity("PTK2", "PD153035", dec).
0.001::e_ksea("PTK2", "PD153035", dec); 0.7032022484::e_ksea("PTK2", "PD153035", inc) :- e_activity("PTK2", "PD153035", inc).
0.5863641637::e_ksea("PTK2", "PF3758309", dec); 0.001::e_ksea("PTK2", "PF3758309", inc) :- e_activity("PTK2", "PF3758309", dec).
0.001::e_ksea("PTK2", "PF3758309", dec); 0.5863641637::e_ksea("PTK2", "PF3758309", inc) :- e_activity("PTK2", "PF3758309", inc).
0.534602158::e_ksea("PTK2", "PF4708671", dec); 0.001::e_ksea("PTK2", "PF4708671", inc) :- e_activity("PTK2", "PF4708671", dec).
0.001::e_ksea("PTK2", "PF4708671", dec); 0.534602158::e_ksea("PTK2", "PF4708671", inc) :- e_activity("PTK2", "PF4708671", inc).
0.5592751693::e_ksea("PTK2", "PH797804", dec); 0.001::e_ksea("PTK2", "PH797804", inc) :- e_activity("PTK2", "PH797804", dec).
0.001::e_ksea("PTK2", "PH797804", dec); 0.5592751693::e_ksea("PTK2", "PH797804", inc) :- e_activity("PTK2", "PH797804", inc).
0.6974906619::e_ksea("PTK2", "PIK294", dec); 0.001::e_ksea("PTK2", "PIK294", inc) :- e_activity("PTK2", "PIK294", dec).
0.001::e_ksea("PTK2", "PIK294", dec); 0.6974906619::e_ksea("PTK2", "PIK294", inc) :- e_activity("PTK2", "PIK294", inc).
0.73643891::e_ksea("PTK2", "Ribociclib", dec); 0.001::e_ksea("PTK2", "Ribociclib", inc) :- e_activity("PTK2", "Ribociclib", dec).
0.001::e_ksea("PTK2", "Ribociclib", dec); 0.73643891::e_ksea("PTK2", "Ribociclib", inc) :- e_activity("PTK2", "Ribociclib", inc).
0.6122557546::e_ksea("PTK2", "Ripasudil", dec); 0.001::e_ksea("PTK2", "Ripasudil", inc) :- e_activity("PTK2", "Ripasudil", dec).
0.001::e_ksea("PTK2", "Ripasudil", dec); 0.6122557546::e_ksea("PTK2", "Ripasudil", inc) :- e_activity("PTK2", "Ripasudil", inc).
0.5838103715::e_ksea("PTK2", "SP600125", dec); 0.001::e_ksea("PTK2", "SP600125", inc) :- e_activity("PTK2", "SP600125", dec).
0.001::e_ksea("PTK2", "SP600125", dec); 0.5838103715::e_ksea("PTK2", "SP600125", inc) :- e_activity("PTK2", "SP600125", inc).
0.6512957211::e_ksea("PTK2", "Selumetinib", dec); 0.001::e_ksea("PTK2", "Selumetinib", inc) :- e_activity("PTK2", "Selumetinib", dec).
0.001::e_ksea("PTK2", "Selumetinib", dec); 0.6512957211::e_ksea("PTK2", "Selumetinib", inc) :- e_activity("PTK2", "Selumetinib", inc).
0.7871489971::e_ksea("PTK2", "TAK715", dec); 0.001::e_ksea("PTK2", "TAK715", inc) :- e_activity("PTK2", "TAK715", dec).
0.001::e_ksea("PTK2", "TAK715", dec); 0.7871489971::e_ksea("PTK2", "TAK715", inc) :- e_activity("PTK2", "TAK715", inc).
0.6661478718::e_ksea("PTK2", "TBCA", dec); 0.001::e_ksea("PTK2", "TBCA", inc) :- e_activity("PTK2", "TBCA", dec).
0.001::e_ksea("PTK2", "TBCA", dec); 0.6661478718::e_ksea("PTK2", "TBCA", inc) :- e_activity("PTK2", "TBCA", inc).
0.6520608621::e_ksea("PTK2", "TGX221", dec); 0.001::e_ksea("PTK2", "TGX221", inc) :- e_activity("PTK2", "TGX221", dec).
0.001::e_ksea("PTK2", "TGX221", dec); 0.6520608621::e_ksea("PTK2", "TGX221", inc) :- e_activity("PTK2", "TGX221", inc).
0.7914692874::e_ksea("PTK2", "Tofacitinib", dec); 0.001::e_ksea("PTK2", "Tofacitinib", inc) :- e_activity("PTK2", "Tofacitinib", dec).
0.001::e_ksea("PTK2", "Tofacitinib", dec); 0.7914692874::e_ksea("PTK2", "Tofacitinib", inc) :- e_activity("PTK2", "Tofacitinib", inc).
0.5486494176::e_ksea("PTK2", "Torin", dec); 0.001::e_ksea("PTK2", "Torin", inc) :- e_activity("PTK2", "Torin", dec).
0.001::e_ksea("PTK2", "Torin", dec); 0.5486494176::e_ksea("PTK2", "Torin", inc) :- e_activity("PTK2", "Torin", inc).
0.5455014849::e_ksea("PTK2", "Trametinib", dec); 0.001::e_ksea("PTK2", "Trametinib", inc) :- e_activity("PTK2", "Trametinib", dec).
0.001::e_ksea("PTK2", "Trametinib", dec); 0.5455014849::e_ksea("PTK2", "Trametinib", inc) :- e_activity("PTK2", "Trametinib", inc).
0.5542301271::e_ksea("PTK2", "U73122", dec); 0.001::e_ksea("PTK2", "U73122", inc) :- e_activity("PTK2", "U73122", dec).
0.001::e_ksea("PTK2", "U73122", dec); 0.5542301271::e_ksea("PTK2", "U73122", inc) :- e_activity("PTK2", "U73122", inc).
0.5152613814::e_ksea("PTK2", "Ulixertinib", dec); 0.001::e_ksea("PTK2", "Ulixertinib", inc) :- e_activity("PTK2", "Ulixertinib", dec).
0.001::e_ksea("PTK2", "Ulixertinib", dec); 0.5152613814::e_ksea("PTK2", "Ulixertinib", inc) :- e_activity("PTK2", "Ulixertinib", inc).
0.7207071798::e_ksea("PTK2", "Vemurafenib", dec); 0.001::e_ksea("PTK2", "Vemurafenib", inc) :- e_activity("PTK2", "Vemurafenib", dec).
0.001::e_ksea("PTK2", "Vemurafenib", dec); 0.7207071798::e_ksea("PTK2", "Vemurafenib", inc) :- e_activity("PTK2", "Vemurafenib", inc).
0.5211207774::e_ksea("PTK6", "AC220", dec); 0.001::e_ksea("PTK6", "AC220", inc) :- e_activity("PTK6", "AC220", dec).
0.001::e_ksea("PTK6", "AC220", dec); 0.5211207774::e_ksea("PTK6", "AC220", inc) :- e_activity("PTK6", "AC220", inc).
0.6748028734::e_ksea("PTK6", "AT13148", dec); 0.001::e_ksea("PTK6", "AT13148", inc) :- e_activity("PTK6", "AT13148", dec).
0.001::e_ksea("PTK6", "AT13148", dec); 0.6748028734::e_ksea("PTK6", "AT13148", inc) :- e_activity("PTK6", "AT13148", inc).
0.6535386761::e_ksea("PTK6", "AZ20", dec); 0.001::e_ksea("PTK6", "AZ20", inc) :- e_activity("PTK6", "AZ20", dec).
0.001::e_ksea("PTK6", "AZ20", dec); 0.6535386761::e_ksea("PTK6", "AZ20", inc) :- e_activity("PTK6", "AZ20", inc).
0.6897464008::e_ksea("PTK6", "AZD1480", dec); 0.001::e_ksea("PTK6", "AZD1480", inc) :- e_activity("PTK6", "AZD1480", dec).
0.001::e_ksea("PTK6", "AZD1480", dec); 0.6897464008::e_ksea("PTK6", "AZD1480", inc) :- e_activity("PTK6", "AZD1480", inc).
0.7584207981::e_ksea("PTK6", "AZD3759", dec); 0.001::e_ksea("PTK6", "AZD3759", inc) :- e_activity("PTK6", "AZD3759", dec).
0.001::e_ksea("PTK6", "AZD3759", dec); 0.7584207981::e_ksea("PTK6", "AZD3759", inc) :- e_activity("PTK6", "AZD3759", inc).
0.7279289957::e_ksea("PTK6", "AZD5363", dec); 0.001::e_ksea("PTK6", "AZD5363", inc) :- e_activity("PTK6", "AZD5363", dec).
0.001::e_ksea("PTK6", "AZD5363", dec); 0.7279289957::e_ksea("PTK6", "AZD5363", inc) :- e_activity("PTK6", "AZD5363", inc).
0.5743145809::e_ksea("PTK6", "AZD5438", dec); 0.001::e_ksea("PTK6", "AZD5438", inc) :- e_activity("PTK6", "AZD5438", dec).
0.001::e_ksea("PTK6", "AZD5438", dec); 0.5743145809::e_ksea("PTK6", "AZD5438", inc) :- e_activity("PTK6", "AZD5438", inc).
0.5693978426::e_ksea("PTK6", "AZD6482", dec); 0.001::e_ksea("PTK6", "AZD6482", inc) :- e_activity("PTK6", "AZD6482", dec).
0.001::e_ksea("PTK6", "AZD6482", dec); 0.5693978426::e_ksea("PTK6", "AZD6482", inc) :- e_activity("PTK6", "AZD6482", inc).
0.6957569461::e_ksea("PTK6", "AZD6738", dec); 0.001::e_ksea("PTK6", "AZD6738", inc) :- e_activity("PTK6", "AZD6738", dec).
0.001::e_ksea("PTK6", "AZD6738", dec); 0.6957569461::e_ksea("PTK6", "AZD6738", inc) :- e_activity("PTK6", "AZD6738", inc).
0.6034265116::e_ksea("PTK6", "AZD8055", dec); 0.001::e_ksea("PTK6", "AZD8055", inc) :- e_activity("PTK6", "AZD8055", dec).
0.001::e_ksea("PTK6", "AZD8055", dec); 0.6034265116::e_ksea("PTK6", "AZD8055", inc) :- e_activity("PTK6", "AZD8055", inc).
0.6331014746::e_ksea("PTK6", "Amuvatinib", dec); 0.001::e_ksea("PTK6", "Amuvatinib", inc) :- e_activity("PTK6", "Amuvatinib", dec).
0.001::e_ksea("PTK6", "Amuvatinib", dec); 0.6331014746::e_ksea("PTK6", "Amuvatinib", inc) :- e_activity("PTK6", "Amuvatinib", inc).
0.6934136257::e_ksea("PTK6", "BX912", dec); 0.001::e_ksea("PTK6", "BX912", inc) :- e_activity("PTK6", "BX912", dec).
0.001::e_ksea("PTK6", "BX912", dec); 0.6934136257::e_ksea("PTK6", "BX912", inc) :- e_activity("PTK6", "BX912", inc).
0.742269992::e_ksea("PTK6", "Bosutinib", dec); 0.001::e_ksea("PTK6", "Bosutinib", inc) :- e_activity("PTK6", "Bosutinib", dec).
0.001::e_ksea("PTK6", "Bosutinib", dec); 0.742269992::e_ksea("PTK6", "Bosutinib", inc) :- e_activity("PTK6", "Bosutinib", inc).
0.519782646::e_ksea("PTK6", "CAL101", dec); 0.001::e_ksea("PTK6", "CAL101", inc) :- e_activity("PTK6", "CAL101", dec).
0.001::e_ksea("PTK6", "CAL101", dec); 0.519782646::e_ksea("PTK6", "CAL101", inc) :- e_activity("PTK6", "CAL101", inc).
0.7313105817::e_ksea("PTK6", "CHIR99021", dec); 0.001::e_ksea("PTK6", "CHIR99021", inc) :- e_activity("PTK6", "CHIR99021", dec).
0.001::e_ksea("PTK6", "CHIR99021", dec); 0.7313105817::e_ksea("PTK6", "CHIR99021", inc) :- e_activity("PTK6", "CHIR99021", inc).
0.7722697345::e_ksea("PTK6", "CX4945", dec); 0.001::e_ksea("PTK6", "CX4945", inc) :- e_activity("PTK6", "CX4945", dec).
0.001::e_ksea("PTK6", "CX4945", dec); 0.7722697345::e_ksea("PTK6", "CX4945", inc) :- e_activity("PTK6", "CX4945", inc).
0.7549637876::e_ksea("PTK6", "DNAPK", dec); 0.001::e_ksea("PTK6", "DNAPK", inc) :- e_activity("PTK6", "DNAPK", dec).
0.001::e_ksea("PTK6", "DNAPK", dec); 0.7549637876::e_ksea("PTK6", "DNAPK", inc) :- e_activity("PTK6", "DNAPK", inc).
0.7076444247::e_ksea("PTK6", "Dabrafenib", dec); 0.001::e_ksea("PTK6", "Dabrafenib", inc) :- e_activity("PTK6", "Dabrafenib", dec).
0.001::e_ksea("PTK6", "Dabrafenib", dec); 0.7076444247::e_ksea("PTK6", "Dabrafenib", inc) :- e_activity("PTK6", "Dabrafenib", inc).
0.7161040569::e_ksea("PTK6", "Dasatinib", dec); 0.001::e_ksea("PTK6", "Dasatinib", inc) :- e_activity("PTK6", "Dasatinib", dec).
0.001::e_ksea("PTK6", "Dasatinib", dec); 0.7161040569::e_ksea("PTK6", "Dasatinib", inc) :- e_activity("PTK6", "Dasatinib", inc).
0.5964405484::e_ksea("PTK6", "Edelfosine", dec); 0.001::e_ksea("PTK6", "Edelfosine", inc) :- e_activity("PTK6", "Edelfosine", dec).
0.001::e_ksea("PTK6", "Edelfosine", dec); 0.5964405484::e_ksea("PTK6", "Edelfosine", inc) :- e_activity("PTK6", "Edelfosine", inc).
0.6047371096::e_ksea("PTK6", "FRAX486", dec); 0.001::e_ksea("PTK6", "FRAX486", inc) :- e_activity("PTK6", "FRAX486", dec).
0.001::e_ksea("PTK6", "FRAX486", dec); 0.6047371096::e_ksea("PTK6", "FRAX486", inc) :- e_activity("PTK6", "FRAX486", inc).
0.5475266676::e_ksea("PTK6", "GDC0941", dec); 0.001::e_ksea("PTK6", "GDC0941", inc) :- e_activity("PTK6", "GDC0941", dec).
0.001::e_ksea("PTK6", "GDC0941", dec); 0.5475266676::e_ksea("PTK6", "GDC0941", inc) :- e_activity("PTK6", "GDC0941", inc).
0.6455096136::e_ksea("PTK6", "GDC0994", dec); 0.001::e_ksea("PTK6", "GDC0994", inc) :- e_activity("PTK6", "GDC0994", dec).
0.001::e_ksea("PTK6", "GDC0994", dec); 0.6455096136::e_ksea("PTK6", "GDC0994", inc) :- e_activity("PTK6", "GDC0994", inc).
0.7156665578::e_ksea("PTK6", "GF109203X", dec); 0.001::e_ksea("PTK6", "GF109203X", inc) :- e_activity("PTK6", "GF109203X", dec).
0.001::e_ksea("PTK6", "GF109203X", dec); 0.7156665578::e_ksea("PTK6", "GF109203X", inc) :- e_activity("PTK6", "GF109203X", inc).
0.6535374861::e_ksea("PTK6", "GO6983", dec); 0.001::e_ksea("PTK6", "GO6983", inc) :- e_activity("PTK6", "GO6983", dec).
0.001::e_ksea("PTK6", "GO6983", dec); 0.6535374861::e_ksea("PTK6", "GO6983", inc) :- e_activity("PTK6", "GO6983", inc).
0.6242287599::e_ksea("PTK6", "GSK2334470", dec); 0.001::e_ksea("PTK6", "GSK2334470", inc) :- e_activity("PTK6", "GSK2334470", dec).
0.001::e_ksea("PTK6", "GSK2334470", dec); 0.6242287599::e_ksea("PTK6", "GSK2334470", inc) :- e_activity("PTK6", "GSK2334470", inc).
0.7526203098::e_ksea("PTK6", "GSK690693", dec); 0.001::e_ksea("PTK6", "GSK690693", inc) :- e_activity("PTK6", "GSK690693", dec).
0.001::e_ksea("PTK6", "GSK690693", dec); 0.7526203098::e_ksea("PTK6", "GSK690693", inc) :- e_activity("PTK6", "GSK690693", inc).
0.6024966626::e_ksea("PTK6", "Go6976", dec); 0.001::e_ksea("PTK6", "Go6976", inc) :- e_activity("PTK6", "Go6976", dec).
0.001::e_ksea("PTK6", "Go6976", dec); 0.6024966626::e_ksea("PTK6", "Go6976", inc) :- e_activity("PTK6", "Go6976", inc).
0.7662721249::e_ksea("PTK6", "H89", dec); 0.001::e_ksea("PTK6", "H89", inc) :- e_activity("PTK6", "H89", dec).
0.001::e_ksea("PTK6", "H89", dec); 0.7662721249::e_ksea("PTK6", "H89", inc) :- e_activity("PTK6", "H89", inc).
0.7440731196::e_ksea("PTK6", "HS173", dec); 0.001::e_ksea("PTK6", "HS173", inc) :- e_activity("PTK6", "HS173", dec).
0.001::e_ksea("PTK6", "HS173", dec); 0.7440731196::e_ksea("PTK6", "HS173", inc) :- e_activity("PTK6", "HS173", inc).
0.6719605978::e_ksea("PTK6", "Ipatasertib", dec); 0.001::e_ksea("PTK6", "Ipatasertib", inc) :- e_activity("PTK6", "Ipatasertib", dec).
0.001::e_ksea("PTK6", "Ipatasertib", dec); 0.6719605978::e_ksea("PTK6", "Ipatasertib", inc) :- e_activity("PTK6", "Ipatasertib", inc).
0.6937944195::e_ksea("PTK6", "JNJ", dec); 0.001::e_ksea("PTK6", "JNJ", inc) :- e_activity("PTK6", "JNJ", dec).
0.001::e_ksea("PTK6", "JNJ", dec); 0.6937944195::e_ksea("PTK6", "JNJ", inc) :- e_activity("PTK6", "JNJ", inc).
0.5282729095::e_ksea("PTK6", "JNK", dec); 0.001::e_ksea("PTK6", "JNK", inc) :- e_activity("PTK6", "JNK", dec).
0.001::e_ksea("PTK6", "JNK", dec); 0.5282729095::e_ksea("PTK6", "JNK", inc) :- e_activity("PTK6", "JNK", inc).
0.6652582131::e_ksea("PTK6", "KD025", dec); 0.001::e_ksea("PTK6", "KD025", inc) :- e_activity("PTK6", "KD025", dec).
0.001::e_ksea("PTK6", "KD025", dec); 0.6652582131::e_ksea("PTK6", "KD025", inc) :- e_activity("PTK6", "KD025", inc).
0.7608153169::e_ksea("PTK6", "KN62", dec); 0.001::e_ksea("PTK6", "KN62", inc) :- e_activity("PTK6", "KN62", dec).
0.001::e_ksea("PTK6", "KN62", dec); 0.7608153169::e_ksea("PTK6", "KN62", inc) :- e_activity("PTK6", "KN62", inc).
0.6946867717::e_ksea("PTK6", "KN93", dec); 0.001::e_ksea("PTK6", "KN93", inc) :- e_activity("PTK6", "KN93", dec).
0.001::e_ksea("PTK6", "KN93", dec); 0.6946867717::e_ksea("PTK6", "KN93", inc) :- e_activity("PTK6", "KN93", inc).
0.7274673068::e_ksea("PTK6", "Ku0063794", dec); 0.001::e_ksea("PTK6", "Ku0063794", inc) :- e_activity("PTK6", "Ku0063794", dec).
0.001::e_ksea("PTK6", "Ku0063794", dec); 0.7274673068::e_ksea("PTK6", "Ku0063794", inc) :- e_activity("PTK6", "Ku0063794", inc).
0.7244303173::e_ksea("PTK6", "LY2090314", dec); 0.001::e_ksea("PTK6", "LY2090314", inc) :- e_activity("PTK6", "LY2090314", dec).
0.001::e_ksea("PTK6", "LY2090314", dec); 0.7244303173::e_ksea("PTK6", "LY2090314", inc) :- e_activity("PTK6", "LY2090314", inc).
0.6623745833::e_ksea("PTK6", "LY2584702", dec); 0.001::e_ksea("PTK6", "LY2584702", inc) :- e_activity("PTK6", "LY2584702", dec).
0.001::e_ksea("PTK6", "LY2584702", dec); 0.6623745833::e_ksea("PTK6", "LY2584702", inc) :- e_activity("PTK6", "LY2584702", inc).
0.7317642185::e_ksea("PTK6", "LY2835219", dec); 0.001::e_ksea("PTK6", "LY2835219", inc) :- e_activity("PTK6", "LY2835219", dec).
0.001::e_ksea("PTK6", "LY2835219", dec); 0.7317642185::e_ksea("PTK6", "LY2835219", inc) :- e_activity("PTK6", "LY2835219", inc).
0.7553917323::e_ksea("PTK6", "Linsitinib", dec); 0.001::e_ksea("PTK6", "Linsitinib", inc) :- e_activity("PTK6", "Linsitinib", dec).
0.001::e_ksea("PTK6", "Linsitinib", dec); 0.7553917323::e_ksea("PTK6", "Linsitinib", inc) :- e_activity("PTK6", "Linsitinib", inc).
0.6670926693::e_ksea("PTK6", "MK2206", dec); 0.001::e_ksea("PTK6", "MK2206", inc) :- e_activity("PTK6", "MK2206", dec).
0.001::e_ksea("PTK6", "MK2206", dec); 0.6670926693::e_ksea("PTK6", "MK2206", inc) :- e_activity("PTK6", "MK2206", inc).
0.625044611::e_ksea("PTK6", "NU7441", dec); 0.001::e_ksea("PTK6", "NU7441", inc) :- e_activity("PTK6", "NU7441", dec).
0.001::e_ksea("PTK6", "NU7441", dec); 0.625044611::e_ksea("PTK6", "NU7441", inc) :- e_activity("PTK6", "NU7441", inc).
0.7664462829::e_ksea("PTK6", "PD153035", dec); 0.001::e_ksea("PTK6", "PD153035", inc) :- e_activity("PTK6", "PD153035", dec).
0.001::e_ksea("PTK6", "PD153035", dec); 0.7664462829::e_ksea("PTK6", "PD153035", inc) :- e_activity("PTK6", "PD153035", inc).
0.5373601693::e_ksea("PTK6", "PF3758309", dec); 0.001::e_ksea("PTK6", "PF3758309", inc) :- e_activity("PTK6", "PF3758309", dec).
0.001::e_ksea("PTK6", "PF3758309", dec); 0.5373601693::e_ksea("PTK6", "PF3758309", inc) :- e_activity("PTK6", "PF3758309", inc).
0.5389340809::e_ksea("PTK6", "PF4708671", dec); 0.001::e_ksea("PTK6", "PF4708671", inc) :- e_activity("PTK6", "PF4708671", dec).
0.001::e_ksea("PTK6", "PF4708671", dec); 0.5389340809::e_ksea("PTK6", "PF4708671", inc) :- e_activity("PTK6", "PF4708671", inc).
0.5091472372::e_ksea("PTK6", "PH797804", dec); 0.001::e_ksea("PTK6", "PH797804", inc) :- e_activity("PTK6", "PH797804", dec).
0.001::e_ksea("PTK6", "PH797804", dec); 0.5091472372::e_ksea("PTK6", "PH797804", inc) :- e_activity("PTK6", "PH797804", inc).
0.6201685071::e_ksea("PTK6", "PIK294", dec); 0.001::e_ksea("PTK6", "PIK294", inc) :- e_activity("PTK6", "PIK294", dec).
0.001::e_ksea("PTK6", "PIK294", dec); 0.6201685071::e_ksea("PTK6", "PIK294", inc) :- e_activity("PTK6", "PIK294", inc).
0.663612212::e_ksea("PTK6", "Ribociclib", dec); 0.001::e_ksea("PTK6", "Ribociclib", inc) :- e_activity("PTK6", "Ribociclib", dec).
0.001::e_ksea("PTK6", "Ribociclib", dec); 0.663612212::e_ksea("PTK6", "Ribociclib", inc) :- e_activity("PTK6", "Ribociclib", inc).
0.5470830696::e_ksea("PTK6", "Ripasudil", dec); 0.001::e_ksea("PTK6", "Ripasudil", inc) :- e_activity("PTK6", "Ripasudil", dec).
0.001::e_ksea("PTK6", "Ripasudil", dec); 0.5470830696::e_ksea("PTK6", "Ripasudil", inc) :- e_activity("PTK6", "Ripasudil", inc).
0.60838855::e_ksea("PTK6", "SP600125", dec); 0.001::e_ksea("PTK6", "SP600125", inc) :- e_activity("PTK6", "SP600125", dec).
0.001::e_ksea("PTK6", "SP600125", dec); 0.60838855::e_ksea("PTK6", "SP600125", inc) :- e_activity("PTK6", "SP600125", inc).
0.5027470037::e_ksea("PTK6", "Selumetinib", dec); 0.001::e_ksea("PTK6", "Selumetinib", inc) :- e_activity("PTK6", "Selumetinib", dec).
0.001::e_ksea("PTK6", "Selumetinib", dec); 0.5027470037::e_ksea("PTK6", "Selumetinib", inc) :- e_activity("PTK6", "Selumetinib", inc).
0.5639697231::e_ksea("PTK6", "TAK715", dec); 0.001::e_ksea("PTK6", "TAK715", inc) :- e_activity("PTK6", "TAK715", dec).
0.001::e_ksea("PTK6", "TAK715", dec); 0.5639697231::e_ksea("PTK6", "TAK715", inc) :- e_activity("PTK6", "TAK715", inc).
0.6603348661::e_ksea("PTK6", "TBCA", dec); 0.001::e_ksea("PTK6", "TBCA", inc) :- e_activity("PTK6", "TBCA", dec).
0.001::e_ksea("PTK6", "TBCA", dec); 0.6603348661::e_ksea("PTK6", "TBCA", inc) :- e_activity("PTK6", "TBCA", inc).
0.5774145793::e_ksea("PTK6", "TGX221", dec); 0.001::e_ksea("PTK6", "TGX221", inc) :- e_activity("PTK6", "TGX221", dec).
0.001::e_ksea("PTK6", "TGX221", dec); 0.5774145793::e_ksea("PTK6", "TGX221", inc) :- e_activity("PTK6", "TGX221", inc).
0.6617277215::e_ksea("PTK6", "Tofacitinib", dec); 0.001::e_ksea("PTK6", "Tofacitinib", inc) :- e_activity("PTK6", "Tofacitinib", dec).
0.001::e_ksea("PTK6", "Tofacitinib", dec); 0.6617277215::e_ksea("PTK6", "Tofacitinib", inc) :- e_activity("PTK6", "Tofacitinib", inc).
0.6144706928::e_ksea("PTK6", "Torin", dec); 0.001::e_ksea("PTK6", "Torin", inc) :- e_activity("PTK6", "Torin", dec).
0.001::e_ksea("PTK6", "Torin", dec); 0.6144706928::e_ksea("PTK6", "Torin", inc) :- e_activity("PTK6", "Torin", inc).
0.7043266421::e_ksea("PTK6", "Trametinib", dec); 0.001::e_ksea("PTK6", "Trametinib", inc) :- e_activity("PTK6", "Trametinib", dec).
0.001::e_ksea("PTK6", "Trametinib", dec); 0.7043266421::e_ksea("PTK6", "Trametinib", inc) :- e_activity("PTK6", "Trametinib", inc).
0.5947488162::e_ksea("PTK6", "U73122", dec); 0.001::e_ksea("PTK6", "U73122", inc) :- e_activity("PTK6", "U73122", dec).
0.001::e_ksea("PTK6", "U73122", dec); 0.5947488162::e_ksea("PTK6", "U73122", inc) :- e_activity("PTK6", "U73122", inc).
0.5247638393::e_ksea("PTK6", "Ulixertinib", dec); 0.001::e_ksea("PTK6", "Ulixertinib", inc) :- e_activity("PTK6", "Ulixertinib", dec).
0.001::e_ksea("PTK6", "Ulixertinib", dec); 0.5247638393::e_ksea("PTK6", "Ulixertinib", inc) :- e_activity("PTK6", "Ulixertinib", inc).
0.7062873132::e_ksea("PTK6", "Vemurafenib", dec); 0.001::e_ksea("PTK6", "Vemurafenib", inc) :- e_activity("PTK6", "Vemurafenib", dec).
0.001::e_ksea("PTK6", "Vemurafenib", dec); 0.7062873132::e_ksea("PTK6", "Vemurafenib", inc) :- e_activity("PTK6", "Vemurafenib", inc).
0.6001749034::e_ksea("PTPRG", "AC220", dec); 0.001::e_ksea("PTPRG", "AC220", inc) :- e_activity("PTPRG", "AC220", dec).
0.001::e_ksea("PTPRG", "AC220", dec); 0.6001749034::e_ksea("PTPRG", "AC220", inc) :- e_activity("PTPRG", "AC220", inc).
0.5874333314::e_ksea("PTPRG", "AT13148", dec); 0.001::e_ksea("PTPRG", "AT13148", inc) :- e_activity("PTPRG", "AT13148", dec).
0.001::e_ksea("PTPRG", "AT13148", dec); 0.5874333314::e_ksea("PTPRG", "AT13148", inc) :- e_activity("PTPRG", "AT13148", inc).
0.5203142857::e_ksea("PTPRG", "AZ20", dec); 0.001::e_ksea("PTPRG", "AZ20", inc) :- e_activity("PTPRG", "AZ20", dec).
0.001::e_ksea("PTPRG", "AZ20", dec); 0.5203142857::e_ksea("PTPRG", "AZ20", inc) :- e_activity("PTPRG", "AZ20", inc).
0.6956489803::e_ksea("PTPRG", "AZD1480", dec); 0.001::e_ksea("PTPRG", "AZD1480", inc) :- e_activity("PTPRG", "AZD1480", dec).
0.001::e_ksea("PTPRG", "AZD1480", dec); 0.6956489803::e_ksea("PTPRG", "AZD1480", inc) :- e_activity("PTPRG", "AZD1480", inc).
0.5730099101::e_ksea("PTPRG", "AZD3759", dec); 0.001::e_ksea("PTPRG", "AZD3759", inc) :- e_activity("PTPRG", "AZD3759", dec).
0.001::e_ksea("PTPRG", "AZD3759", dec); 0.5730099101::e_ksea("PTPRG", "AZD3759", inc) :- e_activity("PTPRG", "AZD3759", inc).
0.6020568692::e_ksea("PTPRG", "AZD5363", dec); 0.001::e_ksea("PTPRG", "AZD5363", inc) :- e_activity("PTPRG", "AZD5363", dec).
0.001::e_ksea("PTPRG", "AZD5363", dec); 0.6020568692::e_ksea("PTPRG", "AZD5363", inc) :- e_activity("PTPRG", "AZD5363", inc).
0.5895240545::e_ksea("PTPRG", "AZD5438", dec); 0.001::e_ksea("PTPRG", "AZD5438", inc) :- e_activity("PTPRG", "AZD5438", dec).
0.001::e_ksea("PTPRG", "AZD5438", dec); 0.5895240545::e_ksea("PTPRG", "AZD5438", inc) :- e_activity("PTPRG", "AZD5438", inc).
0.594920976::e_ksea("PTPRG", "AZD6482", dec); 0.001::e_ksea("PTPRG", "AZD6482", inc) :- e_activity("PTPRG", "AZD6482", dec).
0.001::e_ksea("PTPRG", "AZD6482", dec); 0.594920976::e_ksea("PTPRG", "AZD6482", inc) :- e_activity("PTPRG", "AZD6482", inc).
0.5001500289::e_ksea("PTPRG", "AZD6738", dec); 0.001::e_ksea("PTPRG", "AZD6738", inc) :- e_activity("PTPRG", "AZD6738", dec).
0.001::e_ksea("PTPRG", "AZD6738", dec); 0.5001500289::e_ksea("PTPRG", "AZD6738", inc) :- e_activity("PTPRG", "AZD6738", inc).
0.5248091467::e_ksea("PTPRG", "AZD8055", dec); 0.001::e_ksea("PTPRG", "AZD8055", inc) :- e_activity("PTPRG", "AZD8055", dec).
0.001::e_ksea("PTPRG", "AZD8055", dec); 0.5248091467::e_ksea("PTPRG", "AZD8055", inc) :- e_activity("PTPRG", "AZD8055", inc).
0.52418215::e_ksea("PTPRG", "Amuvatinib", dec); 0.001::e_ksea("PTPRG", "Amuvatinib", inc) :- e_activity("PTPRG", "Amuvatinib", dec).
0.001::e_ksea("PTPRG", "Amuvatinib", dec); 0.52418215::e_ksea("PTPRG", "Amuvatinib", inc) :- e_activity("PTPRG", "Amuvatinib", inc).
0.7123552285::e_ksea("PTPRG", "BX912", dec); 0.001::e_ksea("PTPRG", "BX912", inc) :- e_activity("PTPRG", "BX912", dec).
0.001::e_ksea("PTPRG", "BX912", dec); 0.7123552285::e_ksea("PTPRG", "BX912", inc) :- e_activity("PTPRG", "BX912", inc).
0.6364757358::e_ksea("PTPRG", "Bosutinib", dec); 0.001::e_ksea("PTPRG", "Bosutinib", inc) :- e_activity("PTPRG", "Bosutinib", dec).
0.001::e_ksea("PTPRG", "Bosutinib", dec); 0.6364757358::e_ksea("PTPRG", "Bosutinib", inc) :- e_activity("PTPRG", "Bosutinib", inc).
0.5038085316::e_ksea("PTPRG", "CAL101", dec); 0.001::e_ksea("PTPRG", "CAL101", inc) :- e_activity("PTPRG", "CAL101", dec).
0.001::e_ksea("PTPRG", "CAL101", dec); 0.5038085316::e_ksea("PTPRG", "CAL101", inc) :- e_activity("PTPRG", "CAL101", inc).
0.6012063514::e_ksea("PTPRG", "CHIR99021", dec); 0.001::e_ksea("PTPRG", "CHIR99021", inc) :- e_activity("PTPRG", "CHIR99021", dec).
0.001::e_ksea("PTPRG", "CHIR99021", dec); 0.6012063514::e_ksea("PTPRG", "CHIR99021", inc) :- e_activity("PTPRG", "CHIR99021", inc).
0.5635883373::e_ksea("PTPRG", "CX4945", dec); 0.001::e_ksea("PTPRG", "CX4945", inc) :- e_activity("PTPRG", "CX4945", dec).
0.001::e_ksea("PTPRG", "CX4945", dec); 0.5635883373::e_ksea("PTPRG", "CX4945", inc) :- e_activity("PTPRG", "CX4945", inc).
0.540421766::e_ksea("PTPRG", "DNAPK", dec); 0.001::e_ksea("PTPRG", "DNAPK", inc) :- e_activity("PTPRG", "DNAPK", dec).
0.001::e_ksea("PTPRG", "DNAPK", dec); 0.540421766::e_ksea("PTPRG", "DNAPK", inc) :- e_activity("PTPRG", "DNAPK", inc).
0.5380727723::e_ksea("PTPRG", "Dabrafenib", dec); 0.001::e_ksea("PTPRG", "Dabrafenib", inc) :- e_activity("PTPRG", "Dabrafenib", dec).
0.001::e_ksea("PTPRG", "Dabrafenib", dec); 0.5380727723::e_ksea("PTPRG", "Dabrafenib", inc) :- e_activity("PTPRG", "Dabrafenib", inc).
0.6355969732::e_ksea("PTPRG", "Dasatinib", dec); 0.001::e_ksea("PTPRG", "Dasatinib", inc) :- e_activity("PTPRG", "Dasatinib", dec).
0.001::e_ksea("PTPRG", "Dasatinib", dec); 0.6355969732::e_ksea("PTPRG", "Dasatinib", inc) :- e_activity("PTPRG", "Dasatinib", inc).
0.5559168923::e_ksea("PTPRG", "Edelfosine", dec); 0.001::e_ksea("PTPRG", "Edelfosine", inc) :- e_activity("PTPRG", "Edelfosine", dec).
0.001::e_ksea("PTPRG", "Edelfosine", dec); 0.5559168923::e_ksea("PTPRG", "Edelfosine", inc) :- e_activity("PTPRG", "Edelfosine", inc).
0.7000573912::e_ksea("PTPRG", "FRAX486", dec); 0.001::e_ksea("PTPRG", "FRAX486", inc) :- e_activity("PTPRG", "FRAX486", dec).
0.001::e_ksea("PTPRG", "FRAX486", dec); 0.7000573912::e_ksea("PTPRG", "FRAX486", inc) :- e_activity("PTPRG", "FRAX486", inc).
0.5948488041::e_ksea("PTPRG", "GDC0941", dec); 0.001::e_ksea("PTPRG", "GDC0941", inc) :- e_activity("PTPRG", "GDC0941", dec).
0.001::e_ksea("PTPRG", "GDC0941", dec); 0.5948488041::e_ksea("PTPRG", "GDC0941", inc) :- e_activity("PTPRG", "GDC0941", inc).
0.6758728479::e_ksea("PTPRG", "GDC0994", dec); 0.001::e_ksea("PTPRG", "GDC0994", inc) :- e_activity("PTPRG", "GDC0994", dec).
0.001::e_ksea("PTPRG", "GDC0994", dec); 0.6758728479::e_ksea("PTPRG", "GDC0994", inc) :- e_activity("PTPRG", "GDC0994", inc).
0.514023231::e_ksea("PTPRG", "GF109203X", dec); 0.001::e_ksea("PTPRG", "GF109203X", inc) :- e_activity("PTPRG", "GF109203X", dec).
0.001::e_ksea("PTPRG", "GF109203X", dec); 0.514023231::e_ksea("PTPRG", "GF109203X", inc) :- e_activity("PTPRG", "GF109203X", inc).
0.5634159123::e_ksea("PTPRG", "GO6983", dec); 0.001::e_ksea("PTPRG", "GO6983", inc) :- e_activity("PTPRG", "GO6983", dec).
0.001::e_ksea("PTPRG", "GO6983", dec); 0.5634159123::e_ksea("PTPRG", "GO6983", inc) :- e_activity("PTPRG", "GO6983", inc).
0.7154288337::e_ksea("PTPRG", "GSK2334470", dec); 0.001::e_ksea("PTPRG", "GSK2334470", inc) :- e_activity("PTPRG", "GSK2334470", dec).
0.001::e_ksea("PTPRG", "GSK2334470", dec); 0.7154288337::e_ksea("PTPRG", "GSK2334470", inc) :- e_activity("PTPRG", "GSK2334470", inc).
0.7042546245::e_ksea("PTPRG", "GSK690693", dec); 0.001::e_ksea("PTPRG", "GSK690693", inc) :- e_activity("PTPRG", "GSK690693", dec).
0.001::e_ksea("PTPRG", "GSK690693", dec); 0.7042546245::e_ksea("PTPRG", "GSK690693", inc) :- e_activity("PTPRG", "GSK690693", inc).
0.5255036131::e_ksea("PTPRG", "Go6976", dec); 0.001::e_ksea("PTPRG", "Go6976", inc) :- e_activity("PTPRG", "Go6976", dec).
0.001::e_ksea("PTPRG", "Go6976", dec); 0.5255036131::e_ksea("PTPRG", "Go6976", inc) :- e_activity("PTPRG", "Go6976", inc).
0.5377912038::e_ksea("PTPRG", "H89", dec); 0.001::e_ksea("PTPRG", "H89", inc) :- e_activity("PTPRG", "H89", dec).
0.001::e_ksea("PTPRG", "H89", dec); 0.5377912038::e_ksea("PTPRG", "H89", inc) :- e_activity("PTPRG", "H89", inc).
0.5220286932::e_ksea("PTPRG", "HS173", dec); 0.001::e_ksea("PTPRG", "HS173", inc) :- e_activity("PTPRG", "HS173", dec).
0.001::e_ksea("PTPRG", "HS173", dec); 0.5220286932::e_ksea("PTPRG", "HS173", inc) :- e_activity("PTPRG", "HS173", inc).
0.701853374::e_ksea("PTPRG", "Ipatasertib", dec); 0.001::e_ksea("PTPRG", "Ipatasertib", inc) :- e_activity("PTPRG", "Ipatasertib", dec).
0.001::e_ksea("PTPRG", "Ipatasertib", dec); 0.701853374::e_ksea("PTPRG", "Ipatasertib", inc) :- e_activity("PTPRG", "Ipatasertib", inc).
0.544594822::e_ksea("PTPRG", "JNJ", dec); 0.001::e_ksea("PTPRG", "JNJ", inc) :- e_activity("PTPRG", "JNJ", dec).
0.001::e_ksea("PTPRG", "JNJ", dec); 0.544594822::e_ksea("PTPRG", "JNJ", inc) :- e_activity("PTPRG", "JNJ", inc).
0.5647778953::e_ksea("PTPRG", "JNK", dec); 0.001::e_ksea("PTPRG", "JNK", inc) :- e_activity("PTPRG", "JNK", dec).
0.001::e_ksea("PTPRG", "JNK", dec); 0.5647778953::e_ksea("PTPRG", "JNK", inc) :- e_activity("PTPRG", "JNK", inc).
0.5746057117::e_ksea("PTPRG", "KD025", dec); 0.001::e_ksea("PTPRG", "KD025", inc) :- e_activity("PTPRG", "KD025", dec).
0.001::e_ksea("PTPRG", "KD025", dec); 0.5746057117::e_ksea("PTPRG", "KD025", inc) :- e_activity("PTPRG", "KD025", inc).
0.5249767864::e_ksea("PTPRG", "KN62", dec); 0.001::e_ksea("PTPRG", "KN62", inc) :- e_activity("PTPRG", "KN62", dec).
0.001::e_ksea("PTPRG", "KN62", dec); 0.5249767864::e_ksea("PTPRG", "KN62", inc) :- e_activity("PTPRG", "KN62", inc).
0.6933526878::e_ksea("PTPRG", "KN93", dec); 0.001::e_ksea("PTPRG", "KN93", inc) :- e_activity("PTPRG", "KN93", dec).
0.001::e_ksea("PTPRG", "KN93", dec); 0.6933526878::e_ksea("PTPRG", "KN93", inc) :- e_activity("PTPRG", "KN93", inc).
0.613994986::e_ksea("PTPRG", "Ku0063794", dec); 0.001::e_ksea("PTPRG", "Ku0063794", inc) :- e_activity("PTPRG", "Ku0063794", dec).
0.001::e_ksea("PTPRG", "Ku0063794", dec); 0.613994986::e_ksea("PTPRG", "Ku0063794", inc) :- e_activity("PTPRG", "Ku0063794", inc).
0.5981862949::e_ksea("PTPRG", "LY2090314", dec); 0.001::e_ksea("PTPRG", "LY2090314", inc) :- e_activity("PTPRG", "LY2090314", dec).
0.001::e_ksea("PTPRG", "LY2090314", dec); 0.5981862949::e_ksea("PTPRG", "LY2090314", inc) :- e_activity("PTPRG", "LY2090314", inc).
0.6262107246::e_ksea("PTPRG", "LY2584702", dec); 0.001::e_ksea("PTPRG", "LY2584702", inc) :- e_activity("PTPRG", "LY2584702", dec).
0.001::e_ksea("PTPRG", "LY2584702", dec); 0.6262107246::e_ksea("PTPRG", "LY2584702", inc) :- e_activity("PTPRG", "LY2584702", inc).
0.5528413145::e_ksea("PTPRG", "LY2835219", dec); 0.001::e_ksea("PTPRG", "LY2835219", inc) :- e_activity("PTPRG", "LY2835219", dec).
0.001::e_ksea("PTPRG", "LY2835219", dec); 0.5528413145::e_ksea("PTPRG", "LY2835219", inc) :- e_activity("PTPRG", "LY2835219", inc).
0.5398269141::e_ksea("PTPRG", "Linsitinib", dec); 0.001::e_ksea("PTPRG", "Linsitinib", inc) :- e_activity("PTPRG", "Linsitinib", dec).
0.001::e_ksea("PTPRG", "Linsitinib", dec); 0.5398269141::e_ksea("PTPRG", "Linsitinib", inc) :- e_activity("PTPRG", "Linsitinib", inc).
0.7465543971::e_ksea("PTPRG", "MK2206", dec); 0.001::e_ksea("PTPRG", "MK2206", inc) :- e_activity("PTPRG", "MK2206", dec).
0.001::e_ksea("PTPRG", "MK2206", dec); 0.7465543971::e_ksea("PTPRG", "MK2206", inc) :- e_activity("PTPRG", "MK2206", inc).
0.543151748::e_ksea("PTPRG", "NU7441", dec); 0.001::e_ksea("PTPRG", "NU7441", inc) :- e_activity("PTPRG", "NU7441", dec).
0.001::e_ksea("PTPRG", "NU7441", dec); 0.543151748::e_ksea("PTPRG", "NU7441", inc) :- e_activity("PTPRG", "NU7441", inc).
0.7086410851::e_ksea("PTPRG", "PD153035", dec); 0.001::e_ksea("PTPRG", "PD153035", inc) :- e_activity("PTPRG", "PD153035", dec).
0.001::e_ksea("PTPRG", "PD153035", dec); 0.7086410851::e_ksea("PTPRG", "PD153035", inc) :- e_activity("PTPRG", "PD153035", inc).
0.7987654904::e_ksea("PTPRG", "PF3758309", dec); 0.001::e_ksea("PTPRG", "PF3758309", inc) :- e_activity("PTPRG", "PF3758309", dec).
0.001::e_ksea("PTPRG", "PF3758309", dec); 0.7987654904::e_ksea("PTPRG", "PF3758309", inc) :- e_activity("PTPRG", "PF3758309", inc).
0.6310313331::e_ksea("PTPRG", "PF4708671", dec); 0.001::e_ksea("PTPRG", "PF4708671", inc) :- e_activity("PTPRG", "PF4708671", dec).
0.001::e_ksea("PTPRG", "PF4708671", dec); 0.6310313331::e_ksea("PTPRG", "PF4708671", inc) :- e_activity("PTPRG", "PF4708671", inc).
0.5411990241::e_ksea("PTPRG", "PH797804", dec); 0.001::e_ksea("PTPRG", "PH797804", inc) :- e_activity("PTPRG", "PH797804", dec).
0.001::e_ksea("PTPRG", "PH797804", dec); 0.5411990241::e_ksea("PTPRG", "PH797804", inc) :- e_activity("PTPRG", "PH797804", inc).
0.6371075182::e_ksea("PTPRG", "PIK294", dec); 0.001::e_ksea("PTPRG", "PIK294", inc) :- e_activity("PTPRG", "PIK294", dec).
0.001::e_ksea("PTPRG", "PIK294", dec); 0.6371075182::e_ksea("PTPRG", "PIK294", inc) :- e_activity("PTPRG", "PIK294", inc).
0.6588959498::e_ksea("PTPRG", "Ribociclib", dec); 0.001::e_ksea("PTPRG", "Ribociclib", inc) :- e_activity("PTPRG", "Ribociclib", dec).
0.001::e_ksea("PTPRG", "Ribociclib", dec); 0.6588959498::e_ksea("PTPRG", "Ribociclib", inc) :- e_activity("PTPRG", "Ribociclib", inc).
0.508051225::e_ksea("PTPRG", "Ripasudil", dec); 0.001::e_ksea("PTPRG", "Ripasudil", inc) :- e_activity("PTPRG", "Ripasudil", dec).
0.001::e_ksea("PTPRG", "Ripasudil", dec); 0.508051225::e_ksea("PTPRG", "Ripasudil", inc) :- e_activity("PTPRG", "Ripasudil", inc).
0.5247251141::e_ksea("PTPRG", "SP600125", dec); 0.001::e_ksea("PTPRG", "SP600125", inc) :- e_activity("PTPRG", "SP600125", dec).
0.001::e_ksea("PTPRG", "SP600125", dec); 0.5247251141::e_ksea("PTPRG", "SP600125", inc) :- e_activity("PTPRG", "SP600125", inc).
0.5391363688::e_ksea("PTPRG", "Selumetinib", dec); 0.001::e_ksea("PTPRG", "Selumetinib", inc) :- e_activity("PTPRG", "Selumetinib", dec).
0.001::e_ksea("PTPRG", "Selumetinib", dec); 0.5391363688::e_ksea("PTPRG", "Selumetinib", inc) :- e_activity("PTPRG", "Selumetinib", inc).
0.5134592503::e_ksea("PTPRG", "TAK715", dec); 0.001::e_ksea("PTPRG", "TAK715", inc) :- e_activity("PTPRG", "TAK715", dec).
0.001::e_ksea("PTPRG", "TAK715", dec); 0.5134592503::e_ksea("PTPRG", "TAK715", inc) :- e_activity("PTPRG", "TAK715", inc).
0.590964172::e_ksea("PTPRG", "TBCA", dec); 0.001::e_ksea("PTPRG", "TBCA", inc) :- e_activity("PTPRG", "TBCA", dec).
0.001::e_ksea("PTPRG", "TBCA", dec); 0.590964172::e_ksea("PTPRG", "TBCA", inc) :- e_activity("PTPRG", "TBCA", inc).
0.5743186779::e_ksea("PTPRG", "TGX221", dec); 0.001::e_ksea("PTPRG", "TGX221", inc) :- e_activity("PTPRG", "TGX221", dec).
0.001::e_ksea("PTPRG", "TGX221", dec); 0.5743186779::e_ksea("PTPRG", "TGX221", inc) :- e_activity("PTPRG", "TGX221", inc).
0.6963495061::e_ksea("PTPRG", "Tofacitinib", dec); 0.001::e_ksea("PTPRG", "Tofacitinib", inc) :- e_activity("PTPRG", "Tofacitinib", dec).
0.001::e_ksea("PTPRG", "Tofacitinib", dec); 0.6963495061::e_ksea("PTPRG", "Tofacitinib", inc) :- e_activity("PTPRG", "Tofacitinib", inc).
0.5947448386::e_ksea("PTPRG", "Torin", dec); 0.001::e_ksea("PTPRG", "Torin", inc) :- e_activity("PTPRG", "Torin", dec).
0.001::e_ksea("PTPRG", "Torin", dec); 0.5947448386::e_ksea("PTPRG", "Torin", inc) :- e_activity("PTPRG", "Torin", inc).
0.6634782909::e_ksea("PTPRG", "Trametinib", dec); 0.001::e_ksea("PTPRG", "Trametinib", inc) :- e_activity("PTPRG", "Trametinib", dec).
0.001::e_ksea("PTPRG", "Trametinib", dec); 0.6634782909::e_ksea("PTPRG", "Trametinib", inc) :- e_activity("PTPRG", "Trametinib", inc).
0.5113478711::e_ksea("PTPRG", "U73122", dec); 0.001::e_ksea("PTPRG", "U73122", inc) :- e_activity("PTPRG", "U73122", dec).
0.001::e_ksea("PTPRG", "U73122", dec); 0.5113478711::e_ksea("PTPRG", "U73122", inc) :- e_activity("PTPRG", "U73122", inc).
0.5282644456::e_ksea("PTPRG", "Ulixertinib", dec); 0.001::e_ksea("PTPRG", "Ulixertinib", inc) :- e_activity("PTPRG", "Ulixertinib", dec).
0.001::e_ksea("PTPRG", "Ulixertinib", dec); 0.5282644456::e_ksea("PTPRG", "Ulixertinib", inc) :- e_activity("PTPRG", "Ulixertinib", inc).
0.5145175024::e_ksea("PTPRG", "Vemurafenib", dec); 0.001::e_ksea("PTPRG", "Vemurafenib", inc) :- e_activity("PTPRG", "Vemurafenib", dec).
0.001::e_ksea("PTPRG", "Vemurafenib", dec); 0.5145175024::e_ksea("PTPRG", "Vemurafenib", inc) :- e_activity("PTPRG", "Vemurafenib", inc).
0.6644502146::e_ksea("PTPRR", "AC220", dec); 0.001::e_ksea("PTPRR", "AC220", inc) :- e_activity("PTPRR", "AC220", dec).
0.001::e_ksea("PTPRR", "AC220", dec); 0.6644502146::e_ksea("PTPRR", "AC220", inc) :- e_activity("PTPRR", "AC220", inc).
0.5992066907::e_ksea("PTPRR", "AT13148", dec); 0.001::e_ksea("PTPRR", "AT13148", inc) :- e_activity("PTPRR", "AT13148", dec).
0.001::e_ksea("PTPRR", "AT13148", dec); 0.5992066907::e_ksea("PTPRR", "AT13148", inc) :- e_activity("PTPRR", "AT13148", inc).
0.646071697::e_ksea("PTPRR", "AZ20", dec); 0.001::e_ksea("PTPRR", "AZ20", inc) :- e_activity("PTPRR", "AZ20", dec).
0.001::e_ksea("PTPRR", "AZ20", dec); 0.646071697::e_ksea("PTPRR", "AZ20", inc) :- e_activity("PTPRR", "AZ20", inc).
0.5168855759::e_ksea("PTPRR", "AZD1480", dec); 0.001::e_ksea("PTPRR", "AZD1480", inc) :- e_activity("PTPRR", "AZD1480", dec).
0.001::e_ksea("PTPRR", "AZD1480", dec); 0.5168855759::e_ksea("PTPRR", "AZD1480", inc) :- e_activity("PTPRR", "AZD1480", inc).
0.6825145969::e_ksea("PTPRR", "AZD3759", dec); 0.001::e_ksea("PTPRR", "AZD3759", inc) :- e_activity("PTPRR", "AZD3759", dec).
0.001::e_ksea("PTPRR", "AZD3759", dec); 0.6825145969::e_ksea("PTPRR", "AZD3759", inc) :- e_activity("PTPRR", "AZD3759", inc).
0.6087088022::e_ksea("PTPRR", "AZD5363", dec); 0.001::e_ksea("PTPRR", "AZD5363", inc) :- e_activity("PTPRR", "AZD5363", dec).
0.001::e_ksea("PTPRR", "AZD5363", dec); 0.6087088022::e_ksea("PTPRR", "AZD5363", inc) :- e_activity("PTPRR", "AZD5363", inc).
0.7899111692::e_ksea("PTPRR", "AZD5438", dec); 0.001::e_ksea("PTPRR", "AZD5438", inc) :- e_activity("PTPRR", "AZD5438", dec).
0.001::e_ksea("PTPRR", "AZD5438", dec); 0.7899111692::e_ksea("PTPRR", "AZD5438", inc) :- e_activity("PTPRR", "AZD5438", inc).
0.7777667384::e_ksea("PTPRR", "AZD6482", dec); 0.001::e_ksea("PTPRR", "AZD6482", inc) :- e_activity("PTPRR", "AZD6482", dec).
0.001::e_ksea("PTPRR", "AZD6482", dec); 0.7777667384::e_ksea("PTPRR", "AZD6482", inc) :- e_activity("PTPRR", "AZD6482", inc).
0.6957880671::e_ksea("PTPRR", "AZD6738", dec); 0.001::e_ksea("PTPRR", "AZD6738", inc) :- e_activity("PTPRR", "AZD6738", dec).
0.001::e_ksea("PTPRR", "AZD6738", dec); 0.6957880671::e_ksea("PTPRR", "AZD6738", inc) :- e_activity("PTPRR", "AZD6738", inc).
0.5031259792::e_ksea("PTPRR", "AZD8055", dec); 0.001::e_ksea("PTPRR", "AZD8055", inc) :- e_activity("PTPRR", "AZD8055", dec).
0.001::e_ksea("PTPRR", "AZD8055", dec); 0.5031259792::e_ksea("PTPRR", "AZD8055", inc) :- e_activity("PTPRR", "AZD8055", inc).
0.6140764767::e_ksea("PTPRR", "Amuvatinib", dec); 0.001::e_ksea("PTPRR", "Amuvatinib", inc) :- e_activity("PTPRR", "Amuvatinib", dec).
0.001::e_ksea("PTPRR", "Amuvatinib", dec); 0.6140764767::e_ksea("PTPRR", "Amuvatinib", inc) :- e_activity("PTPRR", "Amuvatinib", inc).
0.5796302259::e_ksea("PTPRR", "BX912", dec); 0.001::e_ksea("PTPRR", "BX912", inc) :- e_activity("PTPRR", "BX912", dec).
0.001::e_ksea("PTPRR", "BX912", dec); 0.5796302259::e_ksea("PTPRR", "BX912", inc) :- e_activity("PTPRR", "BX912", inc).
0.7194190322::e_ksea("PTPRR", "Bosutinib", dec); 0.001::e_ksea("PTPRR", "Bosutinib", inc) :- e_activity("PTPRR", "Bosutinib", dec).
0.001::e_ksea("PTPRR", "Bosutinib", dec); 0.7194190322::e_ksea("PTPRR", "Bosutinib", inc) :- e_activity("PTPRR", "Bosutinib", inc).
0.5225478548::e_ksea("PTPRR", "CAL101", dec); 0.001::e_ksea("PTPRR", "CAL101", inc) :- e_activity("PTPRR", "CAL101", dec).
0.001::e_ksea("PTPRR", "CAL101", dec); 0.5225478548::e_ksea("PTPRR", "CAL101", inc) :- e_activity("PTPRR", "CAL101", inc).
0.5448789234::e_ksea("PTPRR", "CHIR99021", dec); 0.001::e_ksea("PTPRR", "CHIR99021", inc) :- e_activity("PTPRR", "CHIR99021", dec).
0.001::e_ksea("PTPRR", "CHIR99021", dec); 0.5448789234::e_ksea("PTPRR", "CHIR99021", inc) :- e_activity("PTPRR", "CHIR99021", inc).
0.7489395275::e_ksea("PTPRR", "CX4945", dec); 0.001::e_ksea("PTPRR", "CX4945", inc) :- e_activity("PTPRR", "CX4945", dec).
0.001::e_ksea("PTPRR", "CX4945", dec); 0.7489395275::e_ksea("PTPRR", "CX4945", inc) :- e_activity("PTPRR", "CX4945", inc).
0.5268465306::e_ksea("PTPRR", "DNAPK", dec); 0.001::e_ksea("PTPRR", "DNAPK", inc) :- e_activity("PTPRR", "DNAPK", dec).
0.001::e_ksea("PTPRR", "DNAPK", dec); 0.5268465306::e_ksea("PTPRR", "DNAPK", inc) :- e_activity("PTPRR", "DNAPK", inc).
0.6789788531::e_ksea("PTPRR", "Dabrafenib", dec); 0.001::e_ksea("PTPRR", "Dabrafenib", inc) :- e_activity("PTPRR", "Dabrafenib", dec).
0.001::e_ksea("PTPRR", "Dabrafenib", dec); 0.6789788531::e_ksea("PTPRR", "Dabrafenib", inc) :- e_activity("PTPRR", "Dabrafenib", inc).
0.7084600828::e_ksea("PTPRR", "Dasatinib", dec); 0.001::e_ksea("PTPRR", "Dasatinib", inc) :- e_activity("PTPRR", "Dasatinib", dec).
0.001::e_ksea("PTPRR", "Dasatinib", dec); 0.7084600828::e_ksea("PTPRR", "Dasatinib", inc) :- e_activity("PTPRR", "Dasatinib", inc).
0.6339635206::e_ksea("PTPRR", "Edelfosine", dec); 0.001::e_ksea("PTPRR", "Edelfosine", inc) :- e_activity("PTPRR", "Edelfosine", dec).
0.001::e_ksea("PTPRR", "Edelfosine", dec); 0.6339635206::e_ksea("PTPRR", "Edelfosine", inc) :- e_activity("PTPRR", "Edelfosine", inc).
0.7999998517::e_ksea("PTPRR", "FRAX486", dec); 0.001::e_ksea("PTPRR", "FRAX486", inc) :- e_activity("PTPRR", "FRAX486", dec).
0.001::e_ksea("PTPRR", "FRAX486", dec); 0.7999998517::e_ksea("PTPRR", "FRAX486", inc) :- e_activity("PTPRR", "FRAX486", inc).
0.6448812832::e_ksea("PTPRR", "GDC0941", dec); 0.001::e_ksea("PTPRR", "GDC0941", inc) :- e_activity("PTPRR", "GDC0941", dec).
0.001::e_ksea("PTPRR", "GDC0941", dec); 0.6448812832::e_ksea("PTPRR", "GDC0941", inc) :- e_activity("PTPRR", "GDC0941", inc).
0.5362534887::e_ksea("PTPRR", "GDC0994", dec); 0.001::e_ksea("PTPRR", "GDC0994", inc) :- e_activity("PTPRR", "GDC0994", dec).
0.001::e_ksea("PTPRR", "GDC0994", dec); 0.5362534887::e_ksea("PTPRR", "GDC0994", inc) :- e_activity("PTPRR", "GDC0994", inc).
0.761268914::e_ksea("PTPRR", "GF109203X", dec); 0.001::e_ksea("PTPRR", "GF109203X", inc) :- e_activity("PTPRR", "GF109203X", dec).
0.001::e_ksea("PTPRR", "GF109203X", dec); 0.761268914::e_ksea("PTPRR", "GF109203X", inc) :- e_activity("PTPRR", "GF109203X", inc).
0.5128026894::e_ksea("PTPRR", "GO6983", dec); 0.001::e_ksea("PTPRR", "GO6983", inc) :- e_activity("PTPRR", "GO6983", dec).
0.001::e_ksea("PTPRR", "GO6983", dec); 0.5128026894::e_ksea("PTPRR", "GO6983", inc) :- e_activity("PTPRR", "GO6983", inc).
0.5033478619::e_ksea("PTPRR", "GSK2334470", dec); 0.001::e_ksea("PTPRR", "GSK2334470", inc) :- e_activity("PTPRR", "GSK2334470", dec).
0.001::e_ksea("PTPRR", "GSK2334470", dec); 0.5033478619::e_ksea("PTPRR", "GSK2334470", inc) :- e_activity("PTPRR", "GSK2334470", inc).
0.6277883479::e_ksea("PTPRR", "GSK690693", dec); 0.001::e_ksea("PTPRR", "GSK690693", inc) :- e_activity("PTPRR", "GSK690693", dec).
0.001::e_ksea("PTPRR", "GSK690693", dec); 0.6277883479::e_ksea("PTPRR", "GSK690693", inc) :- e_activity("PTPRR", "GSK690693", inc).
0.5407875686::e_ksea("PTPRR", "Go6976", dec); 0.001::e_ksea("PTPRR", "Go6976", inc) :- e_activity("PTPRR", "Go6976", dec).
0.001::e_ksea("PTPRR", "Go6976", dec); 0.5407875686::e_ksea("PTPRR", "Go6976", inc) :- e_activity("PTPRR", "Go6976", inc).
0.5721586392::e_ksea("PTPRR", "H89", dec); 0.001::e_ksea("PTPRR", "H89", inc) :- e_activity("PTPRR", "H89", dec).
0.001::e_ksea("PTPRR", "H89", dec); 0.5721586392::e_ksea("PTPRR", "H89", inc) :- e_activity("PTPRR", "H89", inc).
0.6860431577::e_ksea("PTPRR", "HS173", dec); 0.001::e_ksea("PTPRR", "HS173", inc) :- e_activity("PTPRR", "HS173", dec).
0.001::e_ksea("PTPRR", "HS173", dec); 0.6860431577::e_ksea("PTPRR", "HS173", inc) :- e_activity("PTPRR", "HS173", inc).
0.7828142991::e_ksea("PTPRR", "Ipatasertib", dec); 0.001::e_ksea("PTPRR", "Ipatasertib", inc) :- e_activity("PTPRR", "Ipatasertib", dec).
0.001::e_ksea("PTPRR", "Ipatasertib", dec); 0.7828142991::e_ksea("PTPRR", "Ipatasertib", inc) :- e_activity("PTPRR", "Ipatasertib", inc).
0.7010896498::e_ksea("PTPRR", "JNJ", dec); 0.001::e_ksea("PTPRR", "JNJ", inc) :- e_activity("PTPRR", "JNJ", dec).
0.001::e_ksea("PTPRR", "JNJ", dec); 0.7010896498::e_ksea("PTPRR", "JNJ", inc) :- e_activity("PTPRR", "JNJ", inc).
0.6120344439::e_ksea("PTPRR", "JNK", dec); 0.001::e_ksea("PTPRR", "JNK", inc) :- e_activity("PTPRR", "JNK", dec).
0.001::e_ksea("PTPRR", "JNK", dec); 0.6120344439::e_ksea("PTPRR", "JNK", inc) :- e_activity("PTPRR", "JNK", inc).
0.614744805::e_ksea("PTPRR", "KD025", dec); 0.001::e_ksea("PTPRR", "KD025", inc) :- e_activity("PTPRR", "KD025", dec).
0.001::e_ksea("PTPRR", "KD025", dec); 0.614744805::e_ksea("PTPRR", "KD025", inc) :- e_activity("PTPRR", "KD025", inc).
0.7738631002::e_ksea("PTPRR", "KN62", dec); 0.001::e_ksea("PTPRR", "KN62", inc) :- e_activity("PTPRR", "KN62", dec).
0.001::e_ksea("PTPRR", "KN62", dec); 0.7738631002::e_ksea("PTPRR", "KN62", inc) :- e_activity("PTPRR", "KN62", inc).
0.6685371511::e_ksea("PTPRR", "KN93", dec); 0.001::e_ksea("PTPRR", "KN93", inc) :- e_activity("PTPRR", "KN93", dec).
0.001::e_ksea("PTPRR", "KN93", dec); 0.6685371511::e_ksea("PTPRR", "KN93", inc) :- e_activity("PTPRR", "KN93", inc).
0.7713742711::e_ksea("PTPRR", "Ku0063794", dec); 0.001::e_ksea("PTPRR", "Ku0063794", inc) :- e_activity("PTPRR", "Ku0063794", dec).
0.001::e_ksea("PTPRR", "Ku0063794", dec); 0.7713742711::e_ksea("PTPRR", "Ku0063794", inc) :- e_activity("PTPRR", "Ku0063794", inc).
0.6972012566::e_ksea("PTPRR", "LY2090314", dec); 0.001::e_ksea("PTPRR", "LY2090314", inc) :- e_activity("PTPRR", "LY2090314", dec).
0.001::e_ksea("PTPRR", "LY2090314", dec); 0.6972012566::e_ksea("PTPRR", "LY2090314", inc) :- e_activity("PTPRR", "LY2090314", inc).
0.6462630326::e_ksea("PTPRR", "LY2584702", dec); 0.001::e_ksea("PTPRR", "LY2584702", inc) :- e_activity("PTPRR", "LY2584702", dec).
0.001::e_ksea("PTPRR", "LY2584702", dec); 0.6462630326::e_ksea("PTPRR", "LY2584702", inc) :- e_activity("PTPRR", "LY2584702", inc).
0.6673592461::e_ksea("PTPRR", "LY2835219", dec); 0.001::e_ksea("PTPRR", "LY2835219", inc) :- e_activity("PTPRR", "LY2835219", dec).
0.001::e_ksea("PTPRR", "LY2835219", dec); 0.6673592461::e_ksea("PTPRR", "LY2835219", inc) :- e_activity("PTPRR", "LY2835219", inc).
0.5463136342::e_ksea("PTPRR", "Linsitinib", dec); 0.001::e_ksea("PTPRR", "Linsitinib", inc) :- e_activity("PTPRR", "Linsitinib", dec).
0.001::e_ksea("PTPRR", "Linsitinib", dec); 0.5463136342::e_ksea("PTPRR", "Linsitinib", inc) :- e_activity("PTPRR", "Linsitinib", inc).
0.682516142::e_ksea("PTPRR", "MK2206", dec); 0.001::e_ksea("PTPRR", "MK2206", inc) :- e_activity("PTPRR", "MK2206", dec).
0.001::e_ksea("PTPRR", "MK2206", dec); 0.682516142::e_ksea("PTPRR", "MK2206", inc) :- e_activity("PTPRR", "MK2206", inc).
0.5751226217::e_ksea("PTPRR", "NU7441", dec); 0.001::e_ksea("PTPRR", "NU7441", inc) :- e_activity("PTPRR", "NU7441", dec).
0.001::e_ksea("PTPRR", "NU7441", dec); 0.5751226217::e_ksea("PTPRR", "NU7441", inc) :- e_activity("PTPRR", "NU7441", inc).
0.575758162::e_ksea("PTPRR", "PD153035", dec); 0.001::e_ksea("PTPRR", "PD153035", inc) :- e_activity("PTPRR", "PD153035", dec).
0.001::e_ksea("PTPRR", "PD153035", dec); 0.575758162::e_ksea("PTPRR", "PD153035", inc) :- e_activity("PTPRR", "PD153035", inc).
0.7807562071::e_ksea("PTPRR", "PF3758309", dec); 0.001::e_ksea("PTPRR", "PF3758309", inc) :- e_activity("PTPRR", "PF3758309", dec).
0.001::e_ksea("PTPRR", "PF3758309", dec); 0.7807562071::e_ksea("PTPRR", "PF3758309", inc) :- e_activity("PTPRR", "PF3758309", inc).
0.543263287::e_ksea("PTPRR", "PF4708671", dec); 0.001::e_ksea("PTPRR", "PF4708671", inc) :- e_activity("PTPRR", "PF4708671", dec).
0.001::e_ksea("PTPRR", "PF4708671", dec); 0.543263287::e_ksea("PTPRR", "PF4708671", inc) :- e_activity("PTPRR", "PF4708671", inc).
0.5181588988::e_ksea("PTPRR", "PH797804", dec); 0.001::e_ksea("PTPRR", "PH797804", inc) :- e_activity("PTPRR", "PH797804", dec).
0.001::e_ksea("PTPRR", "PH797804", dec); 0.5181588988::e_ksea("PTPRR", "PH797804", inc) :- e_activity("PTPRR", "PH797804", inc).
0.5377559167::e_ksea("PTPRR", "PIK294", dec); 0.001::e_ksea("PTPRR", "PIK294", inc) :- e_activity("PTPRR", "PIK294", dec).
0.001::e_ksea("PTPRR", "PIK294", dec); 0.5377559167::e_ksea("PTPRR", "PIK294", inc) :- e_activity("PTPRR", "PIK294", inc).
0.7574081284::e_ksea("PTPRR", "Ribociclib", dec); 0.001::e_ksea("PTPRR", "Ribociclib", inc) :- e_activity("PTPRR", "Ribociclib", dec).
0.001::e_ksea("PTPRR", "Ribociclib", dec); 0.7574081284::e_ksea("PTPRR", "Ribociclib", inc) :- e_activity("PTPRR", "Ribociclib", inc).
0.6279417398::e_ksea("PTPRR", "Ripasudil", dec); 0.001::e_ksea("PTPRR", "Ripasudil", inc) :- e_activity("PTPRR", "Ripasudil", dec).
0.001::e_ksea("PTPRR", "Ripasudil", dec); 0.6279417398::e_ksea("PTPRR", "Ripasudil", inc) :- e_activity("PTPRR", "Ripasudil", inc).
0.5990747467::e_ksea("PTPRR", "SP600125", dec); 0.001::e_ksea("PTPRR", "SP600125", inc) :- e_activity("PTPRR", "SP600125", dec).
0.001::e_ksea("PTPRR", "SP600125", dec); 0.5990747467::e_ksea("PTPRR", "SP600125", inc) :- e_activity("PTPRR", "SP600125", inc).
0.797863846::e_ksea("PTPRR", "Selumetinib", dec); 0.001::e_ksea("PTPRR", "Selumetinib", inc) :- e_activity("PTPRR", "Selumetinib", dec).
0.001::e_ksea("PTPRR", "Selumetinib", dec); 0.797863846::e_ksea("PTPRR", "Selumetinib", inc) :- e_activity("PTPRR", "Selumetinib", inc).
0.5634914056::e_ksea("PTPRR", "TAK715", dec); 0.001::e_ksea("PTPRR", "TAK715", inc) :- e_activity("PTPRR", "TAK715", dec).
0.001::e_ksea("PTPRR", "TAK715", dec); 0.5634914056::e_ksea("PTPRR", "TAK715", inc) :- e_activity("PTPRR", "TAK715", inc).
0.6234191748::e_ksea("PTPRR", "TBCA", dec); 0.001::e_ksea("PTPRR", "TBCA", inc) :- e_activity("PTPRR", "TBCA", dec).
0.001::e_ksea("PTPRR", "TBCA", dec); 0.6234191748::e_ksea("PTPRR", "TBCA", inc) :- e_activity("PTPRR", "TBCA", inc).
0.5681783149::e_ksea("PTPRR", "TGX221", dec); 0.001::e_ksea("PTPRR", "TGX221", inc) :- e_activity("PTPRR", "TGX221", dec).
0.001::e_ksea("PTPRR", "TGX221", dec); 0.5681783149::e_ksea("PTPRR", "TGX221", inc) :- e_activity("PTPRR", "TGX221", inc).
0.7176790681::e_ksea("PTPRR", "Tofacitinib", dec); 0.001::e_ksea("PTPRR", "Tofacitinib", inc) :- e_activity("PTPRR", "Tofacitinib", dec).
0.001::e_ksea("PTPRR", "Tofacitinib", dec); 0.7176790681::e_ksea("PTPRR", "Tofacitinib", inc) :- e_activity("PTPRR", "Tofacitinib", inc).
0.7972759438::e_ksea("PTPRR", "Torin", dec); 0.001::e_ksea("PTPRR", "Torin", inc) :- e_activity("PTPRR", "Torin", dec).
0.001::e_ksea("PTPRR", "Torin", dec); 0.7972759438::e_ksea("PTPRR", "Torin", inc) :- e_activity("PTPRR", "Torin", inc).
0.7746753405::e_ksea("PTPRR", "Trametinib", dec); 0.001::e_ksea("PTPRR", "Trametinib", inc) :- e_activity("PTPRR", "Trametinib", dec).
0.001::e_ksea("PTPRR", "Trametinib", dec); 0.7746753405::e_ksea("PTPRR", "Trametinib", inc) :- e_activity("PTPRR", "Trametinib", inc).
0.6582269212::e_ksea("PTPRR", "U73122", dec); 0.001::e_ksea("PTPRR", "U73122", inc) :- e_activity("PTPRR", "U73122", dec).
0.001::e_ksea("PTPRR", "U73122", dec); 0.6582269212::e_ksea("PTPRR", "U73122", inc) :- e_activity("PTPRR", "U73122", inc).
0.7727291576::e_ksea("PTPRR", "Ulixertinib", dec); 0.001::e_ksea("PTPRR", "Ulixertinib", inc) :- e_activity("PTPRR", "Ulixertinib", dec).
0.001::e_ksea("PTPRR", "Ulixertinib", dec); 0.7727291576::e_ksea("PTPRR", "Ulixertinib", inc) :- e_activity("PTPRR", "Ulixertinib", inc).
0.6680871771::e_ksea("PTPRR", "Vemurafenib", dec); 0.001::e_ksea("PTPRR", "Vemurafenib", inc) :- e_activity("PTPRR", "Vemurafenib", dec).
0.001::e_ksea("PTPRR", "Vemurafenib", dec); 0.6680871771::e_ksea("PTPRR", "Vemurafenib", inc) :- e_activity("PTPRR", "Vemurafenib", inc).
0.8408796284::e_ksea("SRC", "AC220", dec); 0.001::e_ksea("SRC", "AC220", inc) :- e_activity("SRC", "AC220", dec).
0.001::e_ksea("SRC", "AC220", dec); 0.8408796284::e_ksea("SRC", "AC220", inc) :- e_activity("SRC", "AC220", inc).
0.6538554508::e_ksea("SRC", "AT13148", dec); 0.001::e_ksea("SRC", "AT13148", inc) :- e_activity("SRC", "AT13148", dec).
0.001::e_ksea("SRC", "AT13148", dec); 0.6538554508::e_ksea("SRC", "AT13148", inc) :- e_activity("SRC", "AT13148", inc).
0.7920925693::e_ksea("SRC", "AZ20", dec); 0.001::e_ksea("SRC", "AZ20", inc) :- e_activity("SRC", "AZ20", dec).
0.001::e_ksea("SRC", "AZ20", dec); 0.7920925693::e_ksea("SRC", "AZ20", inc) :- e_activity("SRC", "AZ20", inc).
0.6243229283::e_ksea("SRC", "AZD1480", dec); 0.001::e_ksea("SRC", "AZD1480", inc) :- e_activity("SRC", "AZD1480", dec).
0.001::e_ksea("SRC", "AZD1480", dec); 0.6243229283::e_ksea("SRC", "AZD1480", inc) :- e_activity("SRC", "AZD1480", inc).
0.6433967795::e_ksea("SRC", "AZD3759", dec); 0.001::e_ksea("SRC", "AZD3759", inc) :- e_activity("SRC", "AZD3759", dec).
0.001::e_ksea("SRC", "AZD3759", dec); 0.6433967795::e_ksea("SRC", "AZD3759", inc) :- e_activity("SRC", "AZD3759", inc).
0.6755323453::e_ksea("SRC", "AZD5363", dec); 0.001::e_ksea("SRC", "AZD5363", inc) :- e_activity("SRC", "AZD5363", dec).
0.001::e_ksea("SRC", "AZD5363", dec); 0.6755323453::e_ksea("SRC", "AZD5363", inc) :- e_activity("SRC", "AZD5363", inc).
0.7521368553::e_ksea("SRC", "AZD5438", dec); 0.001::e_ksea("SRC", "AZD5438", inc) :- e_activity("SRC", "AZD5438", dec).
0.001::e_ksea("SRC", "AZD5438", dec); 0.7521368553::e_ksea("SRC", "AZD5438", inc) :- e_activity("SRC", "AZD5438", inc).
0.8821418526::e_ksea("SRC", "AZD6482", dec); 0.001::e_ksea("SRC", "AZD6482", inc) :- e_activity("SRC", "AZD6482", dec).
0.001::e_ksea("SRC", "AZD6482", dec); 0.8821418526::e_ksea("SRC", "AZD6482", inc) :- e_activity("SRC", "AZD6482", inc).
0.9770158221::e_ksea("SRC", "AZD6738", dec); 0.001::e_ksea("SRC", "AZD6738", inc) :- e_activity("SRC", "AZD6738", dec).
0.001::e_ksea("SRC", "AZD6738", dec); 0.9770158221::e_ksea("SRC", "AZD6738", inc) :- e_activity("SRC", "AZD6738", inc).
0.6739559654::e_ksea("SRC", "AZD8055", dec); 0.001::e_ksea("SRC", "AZD8055", inc) :- e_activity("SRC", "AZD8055", dec).
0.001::e_ksea("SRC", "AZD8055", dec); 0.6739559654::e_ksea("SRC", "AZD8055", inc) :- e_activity("SRC", "AZD8055", inc).
0.6012503962::e_ksea("SRC", "Amuvatinib", dec); 0.001::e_ksea("SRC", "Amuvatinib", inc) :- e_activity("SRC", "Amuvatinib", dec).
0.001::e_ksea("SRC", "Amuvatinib", dec); 0.6012503962::e_ksea("SRC", "Amuvatinib", inc) :- e_activity("SRC", "Amuvatinib", inc).
0.5379145878::e_ksea("SRC", "BX912", dec); 0.001::e_ksea("SRC", "BX912", inc) :- e_activity("SRC", "BX912", dec).
0.001::e_ksea("SRC", "BX912", dec); 0.5379145878::e_ksea("SRC", "BX912", inc) :- e_activity("SRC", "BX912", inc).
0.9882709238::e_ksea("SRC", "Bosutinib", dec); 0.001::e_ksea("SRC", "Bosutinib", inc) :- e_activity("SRC", "Bosutinib", dec).
0.001::e_ksea("SRC", "Bosutinib", dec); 0.9882709238::e_ksea("SRC", "Bosutinib", inc) :- e_activity("SRC", "Bosutinib", inc).
0.5633476275::e_ksea("SRC", "CAL101", dec); 0.001::e_ksea("SRC", "CAL101", inc) :- e_activity("SRC", "CAL101", dec).
0.001::e_ksea("SRC", "CAL101", dec); 0.5633476275::e_ksea("SRC", "CAL101", inc) :- e_activity("SRC", "CAL101", inc).
0.7010871525::e_ksea("SRC", "CHIR99021", dec); 0.001::e_ksea("SRC", "CHIR99021", inc) :- e_activity("SRC", "CHIR99021", dec).
0.001::e_ksea("SRC", "CHIR99021", dec); 0.7010871525::e_ksea("SRC", "CHIR99021", inc) :- e_activity("SRC", "CHIR99021", inc).
0.9159204826::e_ksea("SRC", "CX4945", dec); 0.001::e_ksea("SRC", "CX4945", inc) :- e_activity("SRC", "CX4945", dec).
0.001::e_ksea("SRC", "CX4945", dec); 0.9159204826::e_ksea("SRC", "CX4945", inc) :- e_activity("SRC", "CX4945", inc).
0.6319896247::e_ksea("SRC", "DNAPK", dec); 0.001::e_ksea("SRC", "DNAPK", inc) :- e_activity("SRC", "DNAPK", dec).
0.001::e_ksea("SRC", "DNAPK", dec); 0.6319896247::e_ksea("SRC", "DNAPK", inc) :- e_activity("SRC", "DNAPK", inc).
0.6510982993::e_ksea("SRC", "Dabrafenib", dec); 0.001::e_ksea("SRC", "Dabrafenib", inc) :- e_activity("SRC", "Dabrafenib", dec).
0.001::e_ksea("SRC", "Dabrafenib", dec); 0.6510982993::e_ksea("SRC", "Dabrafenib", inc) :- e_activity("SRC", "Dabrafenib", inc).
0.888915682::e_ksea("SRC", "Dasatinib", dec); 0.001::e_ksea("SRC", "Dasatinib", inc) :- e_activity("SRC", "Dasatinib", dec).
0.001::e_ksea("SRC", "Dasatinib", dec); 0.888915682::e_ksea("SRC", "Dasatinib", inc) :- e_activity("SRC", "Dasatinib", inc).
0.854426962::e_ksea("SRC", "Edelfosine", dec); 0.001::e_ksea("SRC", "Edelfosine", inc) :- e_activity("SRC", "Edelfosine", dec).
0.001::e_ksea("SRC", "Edelfosine", dec); 0.854426962::e_ksea("SRC", "Edelfosine", inc) :- e_activity("SRC", "Edelfosine", inc).
0.7961814123::e_ksea("SRC", "FRAX486", dec); 0.001::e_ksea("SRC", "FRAX486", inc) :- e_activity("SRC", "FRAX486", dec).
0.001::e_ksea("SRC", "FRAX486", dec); 0.7961814123::e_ksea("SRC", "FRAX486", inc) :- e_activity("SRC", "FRAX486", inc).
0.5578026358::e_ksea("SRC", "GDC0941", dec); 0.001::e_ksea("SRC", "GDC0941", inc) :- e_activity("SRC", "GDC0941", dec).
0.001::e_ksea("SRC", "GDC0941", dec); 0.5578026358::e_ksea("SRC", "GDC0941", inc) :- e_activity("SRC", "GDC0941", inc).
0.9326782593::e_ksea("SRC", "GDC0994", dec); 0.001::e_ksea("SRC", "GDC0994", inc) :- e_activity("SRC", "GDC0994", dec).
0.001::e_ksea("SRC", "GDC0994", dec); 0.9326782593::e_ksea("SRC", "GDC0994", inc) :- e_activity("SRC", "GDC0994", inc).
0.9905363566::e_ksea("SRC", "GF109203X", dec); 0.001::e_ksea("SRC", "GF109203X", inc) :- e_activity("SRC", "GF109203X", dec).
0.001::e_ksea("SRC", "GF109203X", dec); 0.9905363566::e_ksea("SRC", "GF109203X", inc) :- e_activity("SRC", "GF109203X", inc).
0.9106057458::e_ksea("SRC", "GO6983", dec); 0.001::e_ksea("SRC", "GO6983", inc) :- e_activity("SRC", "GO6983", dec).
0.001::e_ksea("SRC", "GO6983", dec); 0.9106057458::e_ksea("SRC", "GO6983", inc) :- e_activity("SRC", "GO6983", inc).
0.7290571419::e_ksea("SRC", "GSK2334470", dec); 0.001::e_ksea("SRC", "GSK2334470", inc) :- e_activity("SRC", "GSK2334470", dec).
0.001::e_ksea("SRC", "GSK2334470", dec); 0.7290571419::e_ksea("SRC", "GSK2334470", inc) :- e_activity("SRC", "GSK2334470", inc).
0.5621571664::e_ksea("SRC", "GSK690693", dec); 0.001::e_ksea("SRC", "GSK690693", inc) :- e_activity("SRC", "GSK690693", dec).
0.001::e_ksea("SRC", "GSK690693", dec); 0.5621571664::e_ksea("SRC", "GSK690693", inc) :- e_activity("SRC", "GSK690693", inc).
0.7823235596::e_ksea("SRC", "Go6976", dec); 0.001::e_ksea("SRC", "Go6976", inc) :- e_activity("SRC", "Go6976", dec).
0.001::e_ksea("SRC", "Go6976", dec); 0.7823235596::e_ksea("SRC", "Go6976", inc) :- e_activity("SRC", "Go6976", inc).
0.9256610655::e_ksea("SRC", "H89", dec); 0.001::e_ksea("SRC", "H89", inc) :- e_activity("SRC", "H89", dec).
0.001::e_ksea("SRC", "H89", dec); 0.9256610655::e_ksea("SRC", "H89", inc) :- e_activity("SRC", "H89", inc).
0.5660781645::e_ksea("SRC", "HS173", dec); 0.001::e_ksea("SRC", "HS173", inc) :- e_activity("SRC", "HS173", dec).
0.001::e_ksea("SRC", "HS173", dec); 0.5660781645::e_ksea("SRC", "HS173", inc) :- e_activity("SRC", "HS173", inc).
0.954712136::e_ksea("SRC", "Ipatasertib", dec); 0.001::e_ksea("SRC", "Ipatasertib", inc) :- e_activity("SRC", "Ipatasertib", dec).
0.001::e_ksea("SRC", "Ipatasertib", dec); 0.954712136::e_ksea("SRC", "Ipatasertib", inc) :- e_activity("SRC", "Ipatasertib", inc).
0.7620507859::e_ksea("SRC", "JNJ", dec); 0.001::e_ksea("SRC", "JNJ", inc) :- e_activity("SRC", "JNJ", dec).
0.001::e_ksea("SRC", "JNJ", dec); 0.7620507859::e_ksea("SRC", "JNJ", inc) :- e_activity("SRC", "JNJ", inc).
0.6337992685::e_ksea("SRC", "JNK", dec); 0.001::e_ksea("SRC", "JNK", inc) :- e_activity("SRC", "JNK", dec).
0.001::e_ksea("SRC", "JNK", dec); 0.6337992685::e_ksea("SRC", "JNK", inc) :- e_activity("SRC", "JNK", inc).
0.6156734092::e_ksea("SRC", "KD025", dec); 0.001::e_ksea("SRC", "KD025", inc) :- e_activity("SRC", "KD025", dec).
0.001::e_ksea("SRC", "KD025", dec); 0.6156734092::e_ksea("SRC", "KD025", inc) :- e_activity("SRC", "KD025", inc).
0.5562953468::e_ksea("SRC", "KN62", dec); 0.001::e_ksea("SRC", "KN62", inc) :- e_activity("SRC", "KN62", dec).
0.001::e_ksea("SRC", "KN62", dec); 0.5562953468::e_ksea("SRC", "KN62", inc) :- e_activity("SRC", "KN62", inc).
0.8685867996::e_ksea("SRC", "KN93", dec); 0.001::e_ksea("SRC", "KN93", inc) :- e_activity("SRC", "KN93", dec).
0.001::e_ksea("SRC", "KN93", dec); 0.8685867996::e_ksea("SRC", "KN93", inc) :- e_activity("SRC", "KN93", inc).
0.7006859575::e_ksea("SRC", "Ku0063794", dec); 0.001::e_ksea("SRC", "Ku0063794", inc) :- e_activity("SRC", "Ku0063794", dec).
0.001::e_ksea("SRC", "Ku0063794", dec); 0.7006859575::e_ksea("SRC", "Ku0063794", inc) :- e_activity("SRC", "Ku0063794", inc).
0.6709186491::e_ksea("SRC", "LY2090314", dec); 0.001::e_ksea("SRC", "LY2090314", inc) :- e_activity("SRC", "LY2090314", dec).
0.001::e_ksea("SRC", "LY2090314", dec); 0.6709186491::e_ksea("SRC", "LY2090314", inc) :- e_activity("SRC", "LY2090314", inc).
0.6772884945::e_ksea("SRC", "LY2584702", dec); 0.001::e_ksea("SRC", "LY2584702", inc) :- e_activity("SRC", "LY2584702", dec).
0.001::e_ksea("SRC", "LY2584702", dec); 0.6772884945::e_ksea("SRC", "LY2584702", inc) :- e_activity("SRC", "LY2584702", inc).
0.5675501728::e_ksea("SRC", "LY2835219", dec); 0.001::e_ksea("SRC", "LY2835219", inc) :- e_activity("SRC", "LY2835219", dec).
0.001::e_ksea("SRC", "LY2835219", dec); 0.5675501728::e_ksea("SRC", "LY2835219", inc) :- e_activity("SRC", "LY2835219", inc).
0.6918962879::e_ksea("SRC", "Linsitinib", dec); 0.001::e_ksea("SRC", "Linsitinib", inc) :- e_activity("SRC", "Linsitinib", dec).
0.001::e_ksea("SRC", "Linsitinib", dec); 0.6918962879::e_ksea("SRC", "Linsitinib", inc) :- e_activity("SRC", "Linsitinib", inc).
0.7597734741::e_ksea("SRC", "MK2206", dec); 0.001::e_ksea("SRC", "MK2206", inc) :- e_activity("SRC", "MK2206", dec).
0.001::e_ksea("SRC", "MK2206", dec); 0.7597734741::e_ksea("SRC", "MK2206", inc) :- e_activity("SRC", "MK2206", inc).
0.9272141975::e_ksea("SRC", "NU7441", dec); 0.001::e_ksea("SRC", "NU7441", inc) :- e_activity("SRC", "NU7441", dec).
0.001::e_ksea("SRC", "NU7441", dec); 0.9272141975::e_ksea("SRC", "NU7441", inc) :- e_activity("SRC", "NU7441", inc).
0.7557020431::e_ksea("SRC", "PD153035", dec); 0.001::e_ksea("SRC", "PD153035", inc) :- e_activity("SRC", "PD153035", dec).
0.001::e_ksea("SRC", "PD153035", dec); 0.7557020431::e_ksea("SRC", "PD153035", inc) :- e_activity("SRC", "PD153035", inc).
0.7231966639::e_ksea("SRC", "PF3758309", dec); 0.001::e_ksea("SRC", "PF3758309", inc) :- e_activity("SRC", "PF3758309", dec).
0.001::e_ksea("SRC", "PF3758309", dec); 0.7231966639::e_ksea("SRC", "PF3758309", inc) :- e_activity("SRC", "PF3758309", inc).
0.9077870045::e_ksea("SRC", "PF4708671", dec); 0.001::e_ksea("SRC", "PF4708671", inc) :- e_activity("SRC", "PF4708671", dec).
0.001::e_ksea("SRC", "PF4708671", dec); 0.9077870045::e_ksea("SRC", "PF4708671", inc) :- e_activity("SRC", "PF4708671", inc).
0.6577843858::e_ksea("SRC", "PH797804", dec); 0.001::e_ksea("SRC", "PH797804", inc) :- e_activity("SRC", "PH797804", dec).
0.001::e_ksea("SRC", "PH797804", dec); 0.6577843858::e_ksea("SRC", "PH797804", inc) :- e_activity("SRC", "PH797804", inc).
0.8818273::e_ksea("SRC", "PIK294", dec); 0.001::e_ksea("SRC", "PIK294", inc) :- e_activity("SRC", "PIK294", dec).
0.001::e_ksea("SRC", "PIK294", dec); 0.8818273::e_ksea("SRC", "PIK294", inc) :- e_activity("SRC", "PIK294", inc).
0.8723799873::e_ksea("SRC", "Ribociclib", dec); 0.001::e_ksea("SRC", "Ribociclib", inc) :- e_activity("SRC", "Ribociclib", dec).
0.001::e_ksea("SRC", "Ribociclib", dec); 0.8723799873::e_ksea("SRC", "Ribociclib", inc) :- e_activity("SRC", "Ribociclib", inc).
0.6181787004::e_ksea("SRC", "Ripasudil", dec); 0.001::e_ksea("SRC", "Ripasudil", inc) :- e_activity("SRC", "Ripasudil", dec).
0.001::e_ksea("SRC", "Ripasudil", dec); 0.6181787004::e_ksea("SRC", "Ripasudil", inc) :- e_activity("SRC", "Ripasudil", inc).
0.9485344372::e_ksea("SRC", "SP600125", dec); 0.001::e_ksea("SRC", "SP600125", inc) :- e_activity("SRC", "SP600125", dec).
0.001::e_ksea("SRC", "SP600125", dec); 0.9485344372::e_ksea("SRC", "SP600125", inc) :- e_activity("SRC", "SP600125", inc).
0.7212679311::e_ksea("SRC", "Selumetinib", dec); 0.001::e_ksea("SRC", "Selumetinib", inc) :- e_activity("SRC", "Selumetinib", dec).
0.001::e_ksea("SRC", "Selumetinib", dec); 0.7212679311::e_ksea("SRC", "Selumetinib", inc) :- e_activity("SRC", "Selumetinib", inc).
0.8348084969::e_ksea("SRC", "TAK715", dec); 0.001::e_ksea("SRC", "TAK715", inc) :- e_activity("SRC", "TAK715", dec).
0.001::e_ksea("SRC", "TAK715", dec); 0.8348084969::e_ksea("SRC", "TAK715", inc) :- e_activity("SRC", "TAK715", inc).
0.7692700659::e_ksea("SRC", "TBCA", dec); 0.001::e_ksea("SRC", "TBCA", inc) :- e_activity("SRC", "TBCA", dec).
0.001::e_ksea("SRC", "TBCA", dec); 0.7692700659::e_ksea("SRC", "TBCA", inc) :- e_activity("SRC", "TBCA", inc).
0.6009814232::e_ksea("SRC", "TGX221", dec); 0.001::e_ksea("SRC", "TGX221", inc) :- e_activity("SRC", "TGX221", dec).
0.001::e_ksea("SRC", "TGX221", dec); 0.6009814232::e_ksea("SRC", "TGX221", inc) :- e_activity("SRC", "TGX221", inc).
0.861738931::e_ksea("SRC", "Tofacitinib", dec); 0.001::e_ksea("SRC", "Tofacitinib", inc) :- e_activity("SRC", "Tofacitinib", dec).
0.001::e_ksea("SRC", "Tofacitinib", dec); 0.861738931::e_ksea("SRC", "Tofacitinib", inc) :- e_activity("SRC", "Tofacitinib", inc).
0.7756828572::e_ksea("SRC", "Torin", dec); 0.001::e_ksea("SRC", "Torin", inc) :- e_activity("SRC", "Torin", dec).
0.001::e_ksea("SRC", "Torin", dec); 0.7756828572::e_ksea("SRC", "Torin", inc) :- e_activity("SRC", "Torin", inc).
0.7362346687::e_ksea("SRC", "Trametinib", dec); 0.001::e_ksea("SRC", "Trametinib", inc) :- e_activity("SRC", "Trametinib", dec).
0.001::e_ksea("SRC", "Trametinib", dec); 0.7362346687::e_ksea("SRC", "Trametinib", inc) :- e_activity("SRC", "Trametinib", inc).
0.5513249012::e_ksea("SRC", "U73122", dec); 0.001::e_ksea("SRC", "U73122", inc) :- e_activity("SRC", "U73122", dec).
0.001::e_ksea("SRC", "U73122", dec); 0.5513249012::e_ksea("SRC", "U73122", inc) :- e_activity("SRC", "U73122", inc).
0.6028116265::e_ksea("SRC", "Ulixertinib", dec); 0.001::e_ksea("SRC", "Ulixertinib", inc) :- e_activity("SRC", "Ulixertinib", dec).
0.001::e_ksea("SRC", "Ulixertinib", dec); 0.6028116265::e_ksea("SRC", "Ulixertinib", inc) :- e_activity("SRC", "Ulixertinib", inc).
0.7975407629::e_ksea("SRC", "Vemurafenib", dec); 0.001::e_ksea("SRC", "Vemurafenib", inc) :- e_activity("SRC", "Vemurafenib", dec).
0.001::e_ksea("SRC", "Vemurafenib", dec); 0.7975407629::e_ksea("SRC", "Vemurafenib", inc) :- e_activity("SRC", "Vemurafenib", inc).
0.1752321005::e_ksea("ABL1", "AC220", dec); 0.1752321005::e_ksea("ABL1", "AC220", inc) :- enzyme("ABL1").
0.2041026536::e_ksea("ABL1", "AT13148", dec); 0.2041026536::e_ksea("ABL1", "AT13148", inc) :- enzyme("ABL1").
0.1736516215::e_ksea("ABL1", "AZ20", dec); 0.1736516215::e_ksea("ABL1", "AZ20", inc) :- enzyme("ABL1").
0.2146701559::e_ksea("ABL1", "AZD1480", dec); 0.2146701559::e_ksea("ABL1", "AZD1480", inc) :- enzyme("ABL1").
0.0812921827::e_ksea("ABL1", "AZD3759", dec); 0.0812921827::e_ksea("ABL1", "AZD3759", inc) :- enzyme("ABL1").
0.1342151883::e_ksea("ABL1", "AZD5363", dec); 0.1342151883::e_ksea("ABL1", "AZD5363", inc) :- enzyme("ABL1").
0.1981342296::e_ksea("ABL1", "AZD5438", dec); 0.1981342296::e_ksea("ABL1", "AZD5438", inc) :- enzyme("ABL1").
0.094117134::e_ksea("ABL1", "AZD6482", dec); 0.094117134::e_ksea("ABL1", "AZD6482", inc) :- enzyme("ABL1").
0.2463265561::e_ksea("ABL1", "AZD6738", dec); 0.2463265561::e_ksea("ABL1", "AZD6738", inc) :- enzyme("ABL1").
0.1878240092::e_ksea("ABL1", "AZD8055", dec); 0.1878240092::e_ksea("ABL1", "AZD8055", inc) :- enzyme("ABL1").
0.1472192854::e_ksea("ABL1", "Amuvatinib", dec); 0.1472192854::e_ksea("ABL1", "Amuvatinib", inc) :- enzyme("ABL1").
0.1867112858::e_ksea("ABL1", "BX912", dec); 0.1867112858::e_ksea("ABL1", "BX912", inc) :- enzyme("ABL1").
0.00642537::e_ksea("ABL1", "Bosutinib", dec); 0.00642537::e_ksea("ABL1", "Bosutinib", inc) :- enzyme("ABL1").
0.2233433245::e_ksea("ABL1", "CAL101", dec); 0.2233433245::e_ksea("ABL1", "CAL101", inc) :- enzyme("ABL1").
0.1076881675::e_ksea("ABL1", "CHIR99021", dec); 0.1076881675::e_ksea("ABL1", "CHIR99021", inc) :- enzyme("ABL1").
0.1093672625::e_ksea("ABL1", "CX4945", dec); 0.1093672625::e_ksea("ABL1", "CX4945", inc) :- enzyme("ABL1").
0.1431936221::e_ksea("ABL1", "DNAPK", dec); 0.1431936221::e_ksea("ABL1", "DNAPK", inc) :- enzyme("ABL1").
0.1311151279::e_ksea("ABL1", "Dabrafenib", dec); 0.1311151279::e_ksea("ABL1", "Dabrafenib", inc) :- enzyme("ABL1").
0.0006193671::e_ksea("ABL1", "Dasatinib", dec); 0.0006193671::e_ksea("ABL1", "Dasatinib", inc) :- enzyme("ABL1").
0.2437610734::e_ksea("ABL1", "Edelfosine", dec); 0.2437610734::e_ksea("ABL1", "Edelfosine", inc) :- enzyme("ABL1").
0.0073561203::e_ksea("ABL1", "FRAX486", dec); 0.0073561203::e_ksea("ABL1", "FRAX486", inc) :- enzyme("ABL1").
0.1019994037::e_ksea("ABL1", "GDC0941", dec); 0.1019994037::e_ksea("ABL1", "GDC0941", inc) :- enzyme("ABL1").
0.0664311461::e_ksea("ABL1", "GDC0994", dec); 0.0664311461::e_ksea("ABL1", "GDC0994", inc) :- enzyme("ABL1").
0.1797465061::e_ksea("ABL1", "GF109203X", dec); 0.1797465061::e_ksea("ABL1", "GF109203X", inc) :- enzyme("ABL1").
0.2463794757::e_ksea("ABL1", "GO6983", dec); 0.2463794757::e_ksea("ABL1", "GO6983", inc) :- enzyme("ABL1").
0.2443954568::e_ksea("ABL1", "GSK2334470", dec); 0.2443954568::e_ksea("ABL1", "GSK2334470", inc) :- enzyme("ABL1").
0.2190941844::e_ksea("ABL1", "GSK690693", dec); 0.2190941844::e_ksea("ABL1", "GSK690693", inc) :- enzyme("ABL1").
0.1837097366::e_ksea("ABL1", "Go6976", dec); 0.1837097366::e_ksea("ABL1", "Go6976", inc) :- enzyme("ABL1").
0.2376658585::e_ksea("ABL1", "H89", dec); 0.2376658585::e_ksea("ABL1", "H89", inc) :- enzyme("ABL1").
0.1858930324::e_ksea("ABL1", "HS173", dec); 0.1858930324::e_ksea("ABL1", "HS173", inc) :- enzyme("ABL1").
0.1206259428::e_ksea("ABL1", "Ipatasertib", dec); 0.1206259428::e_ksea("ABL1", "Ipatasertib", inc) :- enzyme("ABL1").
0.131253604::e_ksea("ABL1", "JNJ", dec); 0.131253604::e_ksea("ABL1", "JNJ", inc) :- enzyme("ABL1").
0.206104474::e_ksea("ABL1", "JNK", dec); 0.206104474::e_ksea("ABL1", "JNK", inc) :- enzyme("ABL1").
0.1731392536::e_ksea("ABL1", "KD025", dec); 0.1731392536::e_ksea("ABL1", "KD025", inc) :- enzyme("ABL1").
0.0924711012::e_ksea("ABL1", "KN62", dec); 0.0924711012::e_ksea("ABL1", "KN62", inc) :- enzyme("ABL1").
0.1402056674::e_ksea("ABL1", "KN93", dec); 0.1402056674::e_ksea("ABL1", "KN93", inc) :- enzyme("ABL1").
0.2034514882::e_ksea("ABL1", "Ku0063794", dec); 0.2034514882::e_ksea("ABL1", "Ku0063794", inc) :- enzyme("ABL1").
0.2229735548::e_ksea("ABL1", "LY2090314", dec); 0.2229735548::e_ksea("ABL1", "LY2090314", inc) :- enzyme("ABL1").
0.0865639998::e_ksea("ABL1", "LY2584702", dec); 0.0865639998::e_ksea("ABL1", "LY2584702", inc) :- enzyme("ABL1").
0.1567933947::e_ksea("ABL1", "LY2835219", dec); 0.1567933947::e_ksea("ABL1", "LY2835219", inc) :- enzyme("ABL1").
0.1402969747::e_ksea("ABL1", "Linsitinib", dec); 0.1402969747::e_ksea("ABL1", "Linsitinib", inc) :- enzyme("ABL1").
0.170256188::e_ksea("ABL1", "MK2206", dec); 0.170256188::e_ksea("ABL1", "MK2206", inc) :- enzyme("ABL1").
0.2140682141::e_ksea("ABL1", "NU7441", dec); 0.2140682141::e_ksea("ABL1", "NU7441", inc) :- enzyme("ABL1").
0.1876963365::e_ksea("ABL1", "PD153035", dec); 0.1876963365::e_ksea("ABL1", "PD153035", inc) :- enzyme("ABL1").
0.2155376196::e_ksea("ABL1", "PF3758309", dec); 0.2155376196::e_ksea("ABL1", "PF3758309", inc) :- enzyme("ABL1").
0.2437250567::e_ksea("ABL1", "PF4708671", dec); 0.2437250567::e_ksea("ABL1", "PF4708671", inc) :- enzyme("ABL1").
0.2138546402::e_ksea("ABL1", "PH797804", dec); 0.2138546402::e_ksea("ABL1", "PH797804", inc) :- enzyme("ABL1").
0.1990995594::e_ksea("ABL1", "PIK294", dec); 0.1990995594::e_ksea("ABL1", "PIK294", inc) :- enzyme("ABL1").
0.1237258135::e_ksea("ABL1", "Ribociclib", dec); 0.1237258135::e_ksea("ABL1", "Ribociclib", inc) :- enzyme("ABL1").
0.1792780148::e_ksea("ABL1", "Ripasudil", dec); 0.1792780148::e_ksea("ABL1", "Ripasudil", inc) :- enzyme("ABL1").
0.2078241596::e_ksea("ABL1", "SP600125", dec); 0.2078241596::e_ksea("ABL1", "SP600125", inc) :- enzyme("ABL1").
0.249509417::e_ksea("ABL1", "Selumetinib", dec); 0.249509417::e_ksea("ABL1", "Selumetinib", inc) :- enzyme("ABL1").
0.1602363573::e_ksea("ABL1", "TAK715", dec); 0.1602363573::e_ksea("ABL1", "TAK715", inc) :- enzyme("ABL1").
0.233165359::e_ksea("ABL1", "TBCA", dec); 0.233165359::e_ksea("ABL1", "TBCA", inc) :- enzyme("ABL1").
0.2230408321::e_ksea("ABL1", "TGX221", dec); 0.2230408321::e_ksea("ABL1", "TGX221", inc) :- enzyme("ABL1").
0.1211987188::e_ksea("ABL1", "Tofacitinib", dec); 0.1211987188::e_ksea("ABL1", "Tofacitinib", inc) :- enzyme("ABL1").
0.164601133::e_ksea("ABL1", "Torin", dec); 0.164601133::e_ksea("ABL1", "Torin", inc) :- enzyme("ABL1").
0.2336426691::e_ksea("ABL1", "Trametinib", dec); 0.2336426691::e_ksea("ABL1", "Trametinib", inc) :- enzyme("ABL1").
0.2256600435::e_ksea("ABL1", "U73122", dec); 0.2256600435::e_ksea("ABL1", "U73122", inc) :- enzyme("ABL1").
0.195116715::e_ksea("ABL1", "Ulixertinib", dec); 0.195116715::e_ksea("ABL1", "Ulixertinib", inc) :- enzyme("ABL1").
0.2452694515::e_ksea("ABL1", "Vemurafenib", dec); 0.2452694515::e_ksea("ABL1", "Vemurafenib", inc) :- enzyme("ABL1").
0.2398014394::e_ksea("FYN", "AC220", dec); 0.2398014394::e_ksea("FYN", "AC220", inc) :- enzyme("FYN").
0.2022128886::e_ksea("FYN", "AT13148", dec); 0.2022128886::e_ksea("FYN", "AT13148", inc) :- enzyme("FYN").
0.2092572563::e_ksea("FYN", "AZ20", dec); 0.2092572563::e_ksea("FYN", "AZ20", inc) :- enzyme("FYN").
0.2436109663::e_ksea("FYN", "AZD1480", dec); 0.2436109663::e_ksea("FYN", "AZD1480", inc) :- enzyme("FYN").
0.1974922894::e_ksea("FYN", "AZD3759", dec); 0.1974922894::e_ksea("FYN", "AZD3759", inc) :- enzyme("FYN").
0.2327463931::e_ksea("FYN", "AZD5363", dec); 0.2327463931::e_ksea("FYN", "AZD5363", inc) :- enzyme("FYN").
0.2374212949::e_ksea("FYN", "AZD5438", dec); 0.2374212949::e_ksea("FYN", "AZD5438", inc) :- enzyme("FYN").
0.1977088813::e_ksea("FYN", "AZD6482", dec); 0.1977088813::e_ksea("FYN", "AZD6482", inc) :- enzyme("FYN").
0.2228809083::e_ksea("FYN", "AZD6738", dec); 0.2228809083::e_ksea("FYN", "AZD6738", inc) :- enzyme("FYN").
0.2301091547::e_ksea("FYN", "AZD8055", dec); 0.2301091547::e_ksea("FYN", "AZD8055", inc) :- enzyme("FYN").
0.211578782::e_ksea("FYN", "Amuvatinib", dec); 0.211578782::e_ksea("FYN", "Amuvatinib", inc) :- enzyme("FYN").
0.2281528942::e_ksea("FYN", "BX912", dec); 0.2281528942::e_ksea("FYN", "BX912", inc) :- enzyme("FYN").
0.2113959828::e_ksea("FYN", "Bosutinib", dec); 0.2113959828::e_ksea("FYN", "Bosutinib", inc) :- enzyme("FYN").
0.2362759328::e_ksea("FYN", "CAL101", dec); 0.2362759328::e_ksea("FYN", "CAL101", inc) :- enzyme("FYN").
0.2217816339::e_ksea("FYN", "CHIR99021", dec); 0.2217816339::e_ksea("FYN", "CHIR99021", inc) :- enzyme("FYN").
0.1678855689::e_ksea("FYN", "CX4945", dec); 0.1678855689::e_ksea("FYN", "CX4945", inc) :- enzyme("FYN").
0.2433953325::e_ksea("FYN", "DNAPK", dec); 0.2433953325::e_ksea("FYN", "DNAPK", inc) :- enzyme("FYN").
0.2137295787::e_ksea("FYN", "Dabrafenib", dec); 0.2137295787::e_ksea("FYN", "Dabrafenib", inc) :- enzyme("FYN").
0.2428141761::e_ksea("FYN", "Dasatinib", dec); 0.2428141761::e_ksea("FYN", "Dasatinib", inc) :- enzyme("FYN").
0.2463169895::e_ksea("FYN", "Edelfosine", dec); 0.2463169895::e_ksea("FYN", "Edelfosine", inc) :- enzyme("FYN").
0.2252253966::e_ksea("FYN", "FRAX486", dec); 0.2252253966::e_ksea("FYN", "FRAX486", inc) :- enzyme("FYN").
0.2326851497::e_ksea("FYN", "GDC0941", dec); 0.2326851497::e_ksea("FYN", "GDC0941", inc) :- enzyme("FYN").
0.2247560364::e_ksea("FYN", "GDC0994", dec); 0.2247560364::e_ksea("FYN", "GDC0994", inc) :- enzyme("FYN").
0.2349680739::e_ksea("FYN", "GF109203X", dec); 0.2349680739::e_ksea("FYN", "GF109203X", inc) :- enzyme("FYN").
0.2416174432::e_ksea("FYN", "GO6983", dec); 0.2416174432::e_ksea("FYN", "GO6983", inc) :- enzyme("FYN").
0.2082214125::e_ksea("FYN", "GSK2334470", dec); 0.2082214125::e_ksea("FYN", "GSK2334470", inc) :- enzyme("FYN").
0.1904424651::e_ksea("FYN", "GSK690693", dec); 0.1904424651::e_ksea("FYN", "GSK690693", inc) :- enzyme("FYN").
0.2422701813::e_ksea("FYN", "Go6976", dec); 0.2422701813::e_ksea("FYN", "Go6976", inc) :- enzyme("FYN").
0.2419402032::e_ksea("FYN", "H89", dec); 0.2419402032::e_ksea("FYN", "H89", inc) :- enzyme("FYN").
0.2451192692::e_ksea("FYN", "HS173", dec); 0.2451192692::e_ksea("FYN", "HS173", inc) :- enzyme("FYN").
0.2232733398::e_ksea("FYN", "Ipatasertib", dec); 0.2232733398::e_ksea("FYN", "Ipatasertib", inc) :- enzyme("FYN").
0.243526086::e_ksea("FYN", "JNJ", dec); 0.243526086::e_ksea("FYN", "JNJ", inc) :- enzyme("FYN").
0.1696830323::e_ksea("FYN", "JNK", dec); 0.1696830323::e_ksea("FYN", "JNK", inc) :- enzyme("FYN").
0.2092200552::e_ksea("FYN", "KD025", dec); 0.2092200552::e_ksea("FYN", "KD025", inc) :- enzyme("FYN").
0.179415181::e_ksea("FYN", "KN62", dec); 0.179415181::e_ksea("FYN", "KN62", inc) :- enzyme("FYN").
0.174898318::e_ksea("FYN", "KN93", dec); 0.174898318::e_ksea("FYN", "KN93", inc) :- enzyme("FYN").
0.2330946797::e_ksea("FYN", "Ku0063794", dec); 0.2330946797::e_ksea("FYN", "Ku0063794", inc) :- enzyme("FYN").
0.2269876279::e_ksea("FYN", "LY2090314", dec); 0.2269876279::e_ksea("FYN", "LY2090314", inc) :- enzyme("FYN").
0.2088879407::e_ksea("FYN", "LY2584702", dec); 0.2088879407::e_ksea("FYN", "LY2584702", inc) :- enzyme("FYN").
0.2165474068::e_ksea("FYN", "LY2835219", dec); 0.2165474068::e_ksea("FYN", "LY2835219", inc) :- enzyme("FYN").
0.1748458455::e_ksea("FYN", "Linsitinib", dec); 0.1748458455::e_ksea("FYN", "Linsitinib", inc) :- enzyme("FYN").
0.2053241408::e_ksea("FYN", "MK2206", dec); 0.2053241408::e_ksea("FYN", "MK2206", inc) :- enzyme("FYN").
0.23914207::e_ksea("FYN", "NU7441", dec); 0.23914207::e_ksea("FYN", "NU7441", inc) :- enzyme("FYN").
0.2414803935::e_ksea("FYN", "PD153035", dec); 0.2414803935::e_ksea("FYN", "PD153035", inc) :- enzyme("FYN").
0.2477486237::e_ksea("FYN", "PF3758309", dec); 0.2477486237::e_ksea("FYN", "PF3758309", inc) :- enzyme("FYN").
0.1930023432::e_ksea("FYN", "PF4708671", dec); 0.1930023432::e_ksea("FYN", "PF4708671", inc) :- enzyme("FYN").
0.2358870703::e_ksea("FYN", "PH797804", dec); 0.2358870703::e_ksea("FYN", "PH797804", inc) :- enzyme("FYN").
0.2388141474::e_ksea("FYN", "PIK294", dec); 0.2388141474::e_ksea("FYN", "PIK294", inc) :- enzyme("FYN").
0.2375438609::e_ksea("FYN", "Ribociclib", dec); 0.2375438609::e_ksea("FYN", "Ribociclib", inc) :- enzyme("FYN").
0.2071268762::e_ksea("FYN", "Ripasudil", dec); 0.2071268762::e_ksea("FYN", "Ripasudil", inc) :- enzyme("FYN").
0.2425216956::e_ksea("FYN", "SP600125", dec); 0.2425216956::e_ksea("FYN", "SP600125", inc) :- enzyme("FYN").
0.2397042855::e_ksea("FYN", "Selumetinib", dec); 0.2397042855::e_ksea("FYN", "Selumetinib", inc) :- enzyme("FYN").
0.2412017209::e_ksea("FYN", "TAK715", dec); 0.2412017209::e_ksea("FYN", "TAK715", inc) :- enzyme("FYN").
0.2149919799::e_ksea("FYN", "TBCA", dec); 0.2149919799::e_ksea("FYN", "TBCA", inc) :- enzyme("FYN").
0.2430509955::e_ksea("FYN", "TGX221", dec); 0.2430509955::e_ksea("FYN", "TGX221", inc) :- enzyme("FYN").
0.216632632::e_ksea("FYN", "Tofacitinib", dec); 0.216632632::e_ksea("FYN", "Tofacitinib", inc) :- enzyme("FYN").
0.2066516887::e_ksea("FYN", "Torin", dec); 0.2066516887::e_ksea("FYN", "Torin", inc) :- enzyme("FYN").
0.2237309323::e_ksea("FYN", "Trametinib", dec); 0.2237309323::e_ksea("FYN", "Trametinib", inc) :- enzyme("FYN").
0.2465382315::e_ksea("FYN", "U73122", dec); 0.2465382315::e_ksea("FYN", "U73122", inc) :- enzyme("FYN").
0.2463102013::e_ksea("FYN", "Ulixertinib", dec); 0.2463102013::e_ksea("FYN", "Ulixertinib", inc) :- enzyme("FYN").
0.2288662659::e_ksea("FYN", "Vemurafenib", dec); 0.2288662659::e_ksea("FYN", "Vemurafenib", inc) :- enzyme("FYN").
0.1718404943::e_ksea("HIPK2", "AC220", dec); 0.1718404943::e_ksea("HIPK2", "AC220", inc) :- enzyme("HIPK2").
0.1496457426::e_ksea("HIPK2", "AT13148", dec); 0.1496457426::e_ksea("HIPK2", "AT13148", inc) :- enzyme("HIPK2").
0.1677203768::e_ksea("HIPK2", "AZ20", dec); 0.1677203768::e_ksea("HIPK2", "AZ20", inc) :- enzyme("HIPK2").
0.0156384162::e_ksea("HIPK2", "AZD1480", dec); 0.0156384162::e_ksea("HIPK2", "AZD1480", inc) :- enzyme("HIPK2").
0.0613835114::e_ksea("HIPK2", "AZD3759", dec); 0.0613835114::e_ksea("HIPK2", "AZD3759", inc) :- enzyme("HIPK2").
0.0080644664::e_ksea("HIPK2", "AZD5363", dec); 0.0080644664::e_ksea("HIPK2", "AZD5363", inc) :- enzyme("HIPK2").
0.0010286759::e_ksea("HIPK2", "AZD5438", dec); 0.0010286759::e_ksea("HIPK2", "AZD5438", inc) :- enzyme("HIPK2").
0.1162187939::e_ksea("HIPK2", "AZD6482", dec); 0.1162187939::e_ksea("HIPK2", "AZD6482", inc) :- enzyme("HIPK2").
0.099131607::e_ksea("HIPK2", "AZD6738", dec); 0.099131607::e_ksea("HIPK2", "AZD6738", inc) :- enzyme("HIPK2").
0.1290317803::e_ksea("HIPK2", "AZD8055", dec); 0.1290317803::e_ksea("HIPK2", "AZD8055", inc) :- enzyme("HIPK2").
0.230205371::e_ksea("HIPK2", "Amuvatinib", dec); 0.230205371::e_ksea("HIPK2", "Amuvatinib", inc) :- enzyme("HIPK2").
0.0303617248::e_ksea("HIPK2", "BX912", dec); 0.0303617248::e_ksea("HIPK2", "BX912", inc) :- enzyme("HIPK2").
0.1562452947::e_ksea("HIPK2", "Bosutinib", dec); 0.1562452947::e_ksea("HIPK2", "Bosutinib", inc) :- enzyme("HIPK2").
0.1514917707::e_ksea("HIPK2", "CAL101", dec); 0.1514917707::e_ksea("HIPK2", "CAL101", inc) :- enzyme("HIPK2").
0.0454298351::e_ksea("HIPK2", "CHIR99021", dec); 0.0454298351::e_ksea("HIPK2", "CHIR99021", inc) :- enzyme("HIPK2").
0.0493220372::e_ksea("HIPK2", "CX4945", dec); 0.0493220372::e_ksea("HIPK2", "CX4945", inc) :- enzyme("HIPK2").
0.2304054662::e_ksea("HIPK2", "DNAPK", dec); 0.2304054662::e_ksea("HIPK2", "DNAPK", inc) :- enzyme("HIPK2").
0.1894421456::e_ksea("HIPK2", "Dabrafenib", dec); 0.1894421456::e_ksea("HIPK2", "Dabrafenib", inc) :- enzyme("HIPK2").
0.1521402303::e_ksea("HIPK2", "Dasatinib", dec); 0.1521402303::e_ksea("HIPK2", "Dasatinib", inc) :- enzyme("HIPK2").
0.1796439749::e_ksea("HIPK2", "Edelfosine", dec); 0.1796439749::e_ksea("HIPK2", "Edelfosine", inc) :- enzyme("HIPK2").
0.0132792402::e_ksea("HIPK2", "FRAX486", dec); 0.0132792402::e_ksea("HIPK2", "FRAX486", inc) :- enzyme("HIPK2").
0.0251196504::e_ksea("HIPK2", "GDC0941", dec); 0.0251196504::e_ksea("HIPK2", "GDC0941", inc) :- enzyme("HIPK2").
0.0417162876::e_ksea("HIPK2", "GDC0994", dec); 0.0417162876::e_ksea("HIPK2", "GDC0994", inc) :- enzyme("HIPK2").
0.0780312654::e_ksea("HIPK2", "GF109203X", dec); 0.0780312654::e_ksea("HIPK2", "GF109203X", inc) :- enzyme("HIPK2").
0.0537776801::e_ksea("HIPK2", "GO6983", dec); 0.0537776801::e_ksea("HIPK2", "GO6983", inc) :- enzyme("HIPK2").
0.0658196111::e_ksea("HIPK2", "GSK2334470", dec); 0.0658196111::e_ksea("HIPK2", "GSK2334470", inc) :- enzyme("HIPK2").
0.1538549056::e_ksea("HIPK2", "GSK690693", dec); 0.1538549056::e_ksea("HIPK2", "GSK690693", inc) :- enzyme("HIPK2").
0.1084971104::e_ksea("HIPK2", "Go6976", dec); 0.1084971104::e_ksea("HIPK2", "Go6976", inc) :- enzyme("HIPK2").
0.1250113585::e_ksea("HIPK2", "H89", dec); 0.1250113585::e_ksea("HIPK2", "H89", inc) :- enzyme("HIPK2").
0.1103135907::e_ksea("HIPK2", "HS173", dec); 0.1103135907::e_ksea("HIPK2", "HS173", inc) :- enzyme("HIPK2").
0.0522403695::e_ksea("HIPK2", "Ipatasertib", dec); 0.0522403695::e_ksea("HIPK2", "Ipatasertib", inc) :- enzyme("HIPK2").
0.0932528206::e_ksea("HIPK2", "JNJ", dec); 0.0932528206::e_ksea("HIPK2", "JNJ", inc) :- enzyme("HIPK2").
0.1615144923::e_ksea("HIPK2", "JNK", dec); 0.1615144923::e_ksea("HIPK2", "JNK", inc) :- enzyme("HIPK2").
0.0989108341::e_ksea("HIPK2", "KD025", dec); 0.0989108341::e_ksea("HIPK2", "KD025", inc) :- enzyme("HIPK2").
0.0300160261::e_ksea("HIPK2", "KN62", dec); 0.0300160261::e_ksea("HIPK2", "KN62", inc) :- enzyme("HIPK2").
0.1296005853::e_ksea("HIPK2", "KN93", dec); 0.1296005853::e_ksea("HIPK2", "KN93", inc) :- enzyme("HIPK2").
0.128818861::e_ksea("HIPK2", "Ku0063794", dec); 0.128818861::e_ksea("HIPK2", "Ku0063794", inc) :- enzyme("HIPK2").
0.0179516654::e_ksea("HIPK2", "LY2090314", dec); 0.0179516654::e_ksea("HIPK2", "LY2090314", inc) :- enzyme("HIPK2").
0.052242665::e_ksea("HIPK2", "LY2584702", dec); 0.052242665::e_ksea("HIPK2", "LY2584702", inc) :- enzyme("HIPK2").
0.2385625949::e_ksea("HIPK2", "LY2835219", dec); 0.2385625949::e_ksea("HIPK2", "LY2835219", inc) :- enzyme("HIPK2").
0.2092752736::e_ksea("HIPK2", "Linsitinib", dec); 0.2092752736::e_ksea("HIPK2", "Linsitinib", inc) :- enzyme("HIPK2").
0.2088598492::e_ksea("HIPK2", "MK2206", dec); 0.2088598492::e_ksea("HIPK2", "MK2206", inc) :- enzyme("HIPK2").
0.2226107227::e_ksea("HIPK2", "NU7441", dec); 0.2226107227::e_ksea("HIPK2", "NU7441", inc) :- enzyme("HIPK2").
0.1534730374::e_ksea("HIPK2", "PD153035", dec); 0.1534730374::e_ksea("HIPK2", "PD153035", inc) :- enzyme("HIPK2").
0.0025878516::e_ksea("HIPK2", "PF3758309", dec); 0.0025878516::e_ksea("HIPK2", "PF3758309", inc) :- enzyme("HIPK2").
0.1072360209::e_ksea("HIPK2", "PF4708671", dec); 0.1072360209::e_ksea("HIPK2", "PF4708671", inc) :- enzyme("HIPK2").
0.2039038551::e_ksea("HIPK2", "PH797804", dec); 0.2039038551::e_ksea("HIPK2", "PH797804", inc) :- enzyme("HIPK2").
0.0408472236::e_ksea("HIPK2", "PIK294", dec); 0.0408472236::e_ksea("HIPK2", "PIK294", inc) :- enzyme("HIPK2").
0.231302535::e_ksea("HIPK2", "Ribociclib", dec); 0.231302535::e_ksea("HIPK2", "Ribociclib", inc) :- enzyme("HIPK2").
0.0348444295::e_ksea("HIPK2", "Ripasudil", dec); 0.0348444295::e_ksea("HIPK2", "Ripasudil", inc) :- enzyme("HIPK2").
0.0581182304::e_ksea("HIPK2", "SP600125", dec); 0.0581182304::e_ksea("HIPK2", "SP600125", inc) :- enzyme("HIPK2").
0.2130474968::e_ksea("HIPK2", "Selumetinib", dec); 0.2130474968::e_ksea("HIPK2", "Selumetinib", inc) :- enzyme("HIPK2").
0.099854194::e_ksea("HIPK2", "TAK715", dec); 0.099854194::e_ksea("HIPK2", "TAK715", inc) :- enzyme("HIPK2").
0.1506511723::e_ksea("HIPK2", "TBCA", dec); 0.1506511723::e_ksea("HIPK2", "TBCA", inc) :- enzyme("HIPK2").
0.0952276703::e_ksea("HIPK2", "TGX221", dec); 0.0952276703::e_ksea("HIPK2", "TGX221", inc) :- enzyme("HIPK2").
0.1728025996::e_ksea("HIPK2", "Tofacitinib", dec); 0.1728025996::e_ksea("HIPK2", "Tofacitinib", inc) :- enzyme("HIPK2").
0.2154084129::e_ksea("HIPK2", "Torin", dec); 0.2154084129::e_ksea("HIPK2", "Torin", inc) :- enzyme("HIPK2").
0.1183123713::e_ksea("HIPK2", "Trametinib", dec); 0.1183123713::e_ksea("HIPK2", "Trametinib", inc) :- enzyme("HIPK2").
0.2152866012::e_ksea("HIPK2", "U73122", dec); 0.2152866012::e_ksea("HIPK2", "U73122", inc) :- enzyme("HIPK2").
0.215402284::e_ksea("HIPK2", "Ulixertinib", dec); 0.215402284::e_ksea("HIPK2", "Ulixertinib", inc) :- enzyme("HIPK2").
0.1856687692::e_ksea("HIPK2", "Vemurafenib", dec); 0.1856687692::e_ksea("HIPK2", "Vemurafenib", inc) :- enzyme("HIPK2").
0.2462212194::e_ksea("PTK2", "AC220", dec); 0.2462212194::e_ksea("PTK2", "AC220", inc) :- enzyme("PTK2").
0.166196334::e_ksea("PTK2", "AT13148", dec); 0.166196334::e_ksea("PTK2", "AT13148", inc) :- enzyme("PTK2").
0.1671068568::e_ksea("PTK2", "AZ20", dec); 0.1671068568::e_ksea("PTK2", "AZ20", inc) :- enzyme("PTK2").
0.1028132525::e_ksea("PTK2", "AZD1480", dec); 0.1028132525::e_ksea("PTK2", "AZD1480", inc) :- enzyme("PTK2").
0.1300065701::e_ksea("PTK2", "AZD3759", dec); 0.1300065701::e_ksea("PTK2", "AZD3759", inc) :- enzyme("PTK2").
0.1036575882::e_ksea("PTK2", "AZD5363", dec); 0.1036575882::e_ksea("PTK2", "AZD5363", inc) :- enzyme("PTK2").
0.2352395636::e_ksea("PTK2", "AZD5438", dec); 0.2352395636::e_ksea("PTK2", "AZD5438", inc) :- enzyme("PTK2").
0.1189211271::e_ksea("PTK2", "AZD6482", dec); 0.1189211271::e_ksea("PTK2", "AZD6482", inc) :- enzyme("PTK2").
0.1932180507::e_ksea("PTK2", "AZD6738", dec); 0.1932180507::e_ksea("PTK2", "AZD6738", inc) :- enzyme("PTK2").
0.1281508506::e_ksea("PTK2", "AZD8055", dec); 0.1281508506::e_ksea("PTK2", "AZD8055", inc) :- enzyme("PTK2").
0.202851619::e_ksea("PTK2", "Amuvatinib", dec); 0.202851619::e_ksea("PTK2", "Amuvatinib", inc) :- enzyme("PTK2").
0.1028203865::e_ksea("PTK2", "BX912", dec); 0.1028203865::e_ksea("PTK2", "BX912", inc) :- enzyme("PTK2").
0.2235893949::e_ksea("PTK2", "Bosutinib", dec); 0.2235893949::e_ksea("PTK2", "Bosutinib", inc) :- enzyme("PTK2").
0.1634633187::e_ksea("PTK2", "CAL101", dec); 0.1634633187::e_ksea("PTK2", "CAL101", inc) :- enzyme("PTK2").
0.161679778::e_ksea("PTK2", "CHIR99021", dec); 0.161679778::e_ksea("PTK2", "CHIR99021", inc) :- enzyme("PTK2").
0.2041494765::e_ksea("PTK2", "CX4945", dec); 0.2041494765::e_ksea("PTK2", "CX4945", inc) :- enzyme("PTK2").
0.1865550986::e_ksea("PTK2", "DNAPK", dec); 0.1865550986::e_ksea("PTK2", "DNAPK", inc) :- enzyme("PTK2").
0.1654331375::e_ksea("PTK2", "Dabrafenib", dec); 0.1654331375::e_ksea("PTK2", "Dabrafenib", inc) :- enzyme("PTK2").
0.2299351576::e_ksea("PTK2", "Dasatinib", dec); 0.2299351576::e_ksea("PTK2", "Dasatinib", inc) :- enzyme("PTK2").
0.2075433508::e_ksea("PTK2", "Edelfosine", dec); 0.2075433508::e_ksea("PTK2", "Edelfosine", inc) :- enzyme("PTK2").
0.1677848529::e_ksea("PTK2", "FRAX486", dec); 0.1677848529::e_ksea("PTK2", "FRAX486", inc) :- enzyme("PTK2").
0.1572811219::e_ksea("PTK2", "GDC0941", dec); 0.1572811219::e_ksea("PTK2", "GDC0941", inc) :- enzyme("PTK2").
0.1117923185::e_ksea("PTK2", "GDC0994", dec); 0.1117923185::e_ksea("PTK2", "GDC0994", inc) :- enzyme("PTK2").
0.17224135::e_ksea("PTK2", "GF109203X", dec); 0.17224135::e_ksea("PTK2", "GF109203X", inc) :- enzyme("PTK2").
0.2363623543::e_ksea("PTK2", "GO6983", dec); 0.2363623543::e_ksea("PTK2", "GO6983", inc) :- enzyme("PTK2").
0.1024284624::e_ksea("PTK2", "GSK2334470", dec); 0.1024284624::e_ksea("PTK2", "GSK2334470", inc) :- enzyme("PTK2").
0.2260311362::e_ksea("PTK2", "GSK690693", dec); 0.2260311362::e_ksea("PTK2", "GSK690693", inc) :- enzyme("PTK2").
0.1872425927::e_ksea("PTK2", "Go6976", dec); 0.1872425927::e_ksea("PTK2", "Go6976", inc) :- enzyme("PTK2").
0.2028505237::e_ksea("PTK2", "H89", dec); 0.2028505237::e_ksea("PTK2", "H89", inc) :- enzyme("PTK2").
0.2336607497::e_ksea("PTK2", "HS173", dec); 0.2336607497::e_ksea("PTK2", "HS173", inc) :- enzyme("PTK2").
0.1006570849::e_ksea("PTK2", "Ipatasertib", dec); 0.1006570849::e_ksea("PTK2", "Ipatasertib", inc) :- enzyme("PTK2").
0.1955975809::e_ksea("PTK2", "JNJ", dec); 0.1955975809::e_ksea("PTK2", "JNJ", inc) :- enzyme("PTK2").
0.1658738451::e_ksea("PTK2", "JNK", dec); 0.1658738451::e_ksea("PTK2", "JNK", inc) :- enzyme("PTK2").
0.1266724758::e_ksea("PTK2", "KD025", dec); 0.1266724758::e_ksea("PTK2", "KD025", inc) :- enzyme("PTK2").
0.1352874377::e_ksea("PTK2", "KN62", dec); 0.1352874377::e_ksea("PTK2", "KN62", inc) :- enzyme("PTK2").
0.2200337421::e_ksea("PTK2", "KN93", dec); 0.2200337421::e_ksea("PTK2", "KN93", inc) :- enzyme("PTK2").
0.2198858395::e_ksea("PTK2", "Ku0063794", dec); 0.2198858395::e_ksea("PTK2", "Ku0063794", inc) :- enzyme("PTK2").
0.1113778324::e_ksea("PTK2", "LY2090314", dec); 0.1113778324::e_ksea("PTK2", "LY2090314", inc) :- enzyme("PTK2").
0.1146083261::e_ksea("PTK2", "LY2584702", dec); 0.1146083261::e_ksea("PTK2", "LY2584702", inc) :- enzyme("PTK2").
0.1543146878::e_ksea("PTK2", "LY2835219", dec); 0.1543146878::e_ksea("PTK2", "LY2835219", inc) :- enzyme("PTK2").
0.1763257273::e_ksea("PTK2", "Linsitinib", dec); 0.1763257273::e_ksea("PTK2", "Linsitinib", inc) :- enzyme("PTK2").
0.2019161449::e_ksea("PTK2", "MK2206", dec); 0.2019161449::e_ksea("PTK2", "MK2206", inc) :- enzyme("PTK2").
0.152608958::e_ksea("PTK2", "NU7441", dec); 0.152608958::e_ksea("PTK2", "NU7441", inc) :- enzyme("PTK2").
0.1483988758::e_ksea("PTK2", "PD153035", dec); 0.1483988758::e_ksea("PTK2", "PD153035", inc) :- enzyme("PTK2").
0.2068179182::e_ksea("PTK2", "PF3758309", dec); 0.2068179182::e_ksea("PTK2", "PF3758309", inc) :- enzyme("PTK2").
0.232698921::e_ksea("PTK2", "PF4708671", dec); 0.232698921::e_ksea("PTK2", "PF4708671", inc) :- enzyme("PTK2").
0.2203624154::e_ksea("PTK2", "PH797804", dec); 0.2203624154::e_ksea("PTK2", "PH797804", inc) :- enzyme("PTK2").
0.151254669::e_ksea("PTK2", "PIK294", dec); 0.151254669::e_ksea("PTK2", "PIK294", inc) :- enzyme("PTK2").
0.131780545::e_ksea("PTK2", "Ribociclib", dec); 0.131780545::e_ksea("PTK2", "Ribociclib", inc) :- enzyme("PTK2").
0.1938721227::e_ksea("PTK2", "Ripasudil", dec); 0.1938721227::e_ksea("PTK2", "Ripasudil", inc) :- enzyme("PTK2").
0.2080948143::e_ksea("PTK2", "SP600125", dec); 0.2080948143::e_ksea("PTK2", "SP600125", inc) :- enzyme("PTK2").
0.1743521395::e_ksea("PTK2", "Selumetinib", dec); 0.1743521395::e_ksea("PTK2", "Selumetinib", inc) :- enzyme("PTK2").
0.1064255015::e_ksea("PTK2", "TAK715", dec); 0.1064255015::e_ksea("PTK2", "TAK715", inc) :- enzyme("PTK2").
0.1669260641::e_ksea("PTK2", "TBCA", dec); 0.1669260641::e_ksea("PTK2", "TBCA", inc) :- enzyme("PTK2").
0.173969569::e_ksea("PTK2", "TGX221", dec); 0.173969569::e_ksea("PTK2", "TGX221", inc) :- enzyme("PTK2").
0.1042653563::e_ksea("PTK2", "Tofacitinib", dec); 0.1042653563::e_ksea("PTK2", "Tofacitinib", inc) :- enzyme("PTK2").
0.2256752912::e_ksea("PTK2", "Torin", dec); 0.2256752912::e_ksea("PTK2", "Torin", inc) :- enzyme("PTK2").
0.2272492576::e_ksea("PTK2", "Trametinib", dec); 0.2272492576::e_ksea("PTK2", "Trametinib", inc) :- enzyme("PTK2").
0.2228849364::e_ksea("PTK2", "U73122", dec); 0.2228849364::e_ksea("PTK2", "U73122", inc) :- enzyme("PTK2").
0.2423693093::e_ksea("PTK2", "Ulixertinib", dec); 0.2423693093::e_ksea("PTK2", "Ulixertinib", inc) :- enzyme("PTK2").
0.1396464101::e_ksea("PTK2", "Vemurafenib", dec); 0.1396464101::e_ksea("PTK2", "Vemurafenib", inc) :- enzyme("PTK2").
0.2394396113::e_ksea("PTK6", "AC220", dec); 0.2394396113::e_ksea("PTK6", "AC220", inc) :- enzyme("PTK6").
0.1625985633::e_ksea("PTK6", "AT13148", dec); 0.1625985633::e_ksea("PTK6", "AT13148", inc) :- enzyme("PTK6").
0.173230662::e_ksea("PTK6", "AZ20", dec); 0.173230662::e_ksea("PTK6", "AZ20", inc) :- enzyme("PTK6").
0.1551267996::e_ksea("PTK6", "AZD1480", dec); 0.1551267996::e_ksea("PTK6", "AZD1480", inc) :- enzyme("PTK6").
0.1207896009::e_ksea("PTK6", "AZD3759", dec); 0.1207896009::e_ksea("PTK6", "AZD3759", inc) :- enzyme("PTK6").
0.1360355022::e_ksea("PTK6", "AZD5363", dec); 0.1360355022::e_ksea("PTK6", "AZD5363", inc) :- enzyme("PTK6").
0.2128427095::e_ksea("PTK6", "AZD5438", dec); 0.2128427095::e_ksea("PTK6", "AZD5438", inc) :- enzyme("PTK6").
0.2153010787::e_ksea("PTK6", "AZD6482", dec); 0.2153010787::e_ksea("PTK6", "AZD6482", inc) :- enzyme("PTK6").
0.152121527::e_ksea("PTK6", "AZD6738", dec); 0.152121527::e_ksea("PTK6", "AZD6738", inc) :- enzyme("PTK6").
0.1982867442::e_ksea("PTK6", "AZD8055", dec); 0.1982867442::e_ksea("PTK6", "AZD8055", inc) :- enzyme("PTK6").
0.1834492627::e_ksea("PTK6", "Amuvatinib", dec); 0.1834492627::e_ksea("PTK6", "Amuvatinib", inc) :- enzyme("PTK6").
0.1532931872::e_ksea("PTK6", "BX912", dec); 0.1532931872::e_ksea("PTK6", "BX912", inc) :- enzyme("PTK6").
0.128865004::e_ksea("PTK6", "Bosutinib", dec); 0.128865004::e_ksea("PTK6", "Bosutinib", inc) :- enzyme("PTK6").
0.240108677::e_ksea("PTK6", "CAL101", dec); 0.240108677::e_ksea("PTK6", "CAL101", inc) :- enzyme("PTK6").
0.1343447092::e_ksea("PTK6", "CHIR99021", dec); 0.1343447092::e_ksea("PTK6", "CHIR99021", inc) :- enzyme("PTK6").
0.1138651327::e_ksea("PTK6", "CX4945", dec); 0.1138651327::e_ksea("PTK6", "CX4945", inc) :- enzyme("PTK6").
0.1225181062::e_ksea("PTK6", "DNAPK", dec); 0.1225181062::e_ksea("PTK6", "DNAPK", inc) :- enzyme("PTK6").
0.1461777876::e_ksea("PTK6", "Dabrafenib", dec); 0.1461777876::e_ksea("PTK6", "Dabrafenib", inc) :- enzyme("PTK6").
0.1419479716::e_ksea("PTK6", "Dasatinib", dec); 0.1419479716::e_ksea("PTK6", "Dasatinib", inc) :- enzyme("PTK6").
0.2017797258::e_ksea("PTK6", "Edelfosine", dec); 0.2017797258::e_ksea("PTK6", "Edelfosine", inc) :- enzyme("PTK6").
0.1976314452::e_ksea("PTK6", "FRAX486", dec); 0.1976314452::e_ksea("PTK6", "FRAX486", inc) :- enzyme("PTK6").
0.2262366662::e_ksea("PTK6", "GDC0941", dec); 0.2262366662::e_ksea("PTK6", "GDC0941", inc) :- enzyme("PTK6").
0.1772451932::e_ksea("PTK6", "GDC0994", dec); 0.1772451932::e_ksea("PTK6", "GDC0994", inc) :- enzyme("PTK6").
0.1421667211::e_ksea("PTK6", "GF109203X", dec); 0.1421667211::e_ksea("PTK6", "GF109203X", inc) :- enzyme("PTK6").
0.173231257::e_ksea("PTK6", "GO6983", dec); 0.173231257::e_ksea("PTK6", "GO6983", inc) :- enzyme("PTK6").
0.1878856201::e_ksea("PTK6", "GSK2334470", dec); 0.1878856201::e_ksea("PTK6", "GSK2334470", inc) :- enzyme("PTK6").
0.1236898451::e_ksea("PTK6", "GSK690693", dec); 0.1236898451::e_ksea("PTK6", "GSK690693", inc) :- enzyme("PTK6").
0.1987516687::e_ksea("PTK6", "Go6976", dec); 0.1987516687::e_ksea("PTK6", "Go6976", inc) :- enzyme("PTK6").
0.1168639376::e_ksea("PTK6", "H89", dec); 0.1168639376::e_ksea("PTK6", "H89", inc) :- enzyme("PTK6").
0.1279634402::e_ksea("PTK6", "HS173", dec); 0.1279634402::e_ksea("PTK6", "HS173", inc) :- enzyme("PTK6").
0.1640197011::e_ksea("PTK6", "Ipatasertib", dec); 0.1640197011::e_ksea("PTK6", "Ipatasertib", inc) :- enzyme("PTK6").
0.1531027902::e_ksea("PTK6", "JNJ", dec); 0.1531027902::e_ksea("PTK6", "JNJ", inc) :- enzyme("PTK6").
0.2358635452::e_ksea("PTK6", "JNK", dec); 0.2358635452::e_ksea("PTK6", "JNK", inc) :- enzyme("PTK6").
0.1673708934::e_ksea("PTK6", "KD025", dec); 0.1673708934::e_ksea("PTK6", "KD025", inc) :- enzyme("PTK6").
0.1195923416::e_ksea("PTK6", "KN62", dec); 0.1195923416::e_ksea("PTK6", "KN62", inc) :- enzyme("PTK6").
0.1526566142::e_ksea("PTK6", "KN93", dec); 0.1526566142::e_ksea("PTK6", "KN93", inc) :- enzyme("PTK6").
0.1362663466::e_ksea("PTK6", "Ku0063794", dec); 0.1362663466::e_ksea("PTK6", "Ku0063794", inc) :- enzyme("PTK6").
0.1377848413::e_ksea("PTK6", "LY2090314", dec); 0.1377848413::e_ksea("PTK6", "LY2090314", inc) :- enzyme("PTK6").
0.1688127084::e_ksea("PTK6", "LY2584702", dec); 0.1688127084::e_ksea("PTK6", "LY2584702", inc) :- enzyme("PTK6").
0.1341178908::e_ksea("PTK6", "LY2835219", dec); 0.1341178908::e_ksea("PTK6", "LY2835219", inc) :- enzyme("PTK6").
0.1223041338::e_ksea("PTK6", "Linsitinib", dec); 0.1223041338::e_ksea("PTK6", "Linsitinib", inc) :- enzyme("PTK6").
0.1664536654::e_ksea("PTK6", "MK2206", dec); 0.1664536654::e_ksea("PTK6", "MK2206", inc) :- enzyme("PTK6").
0.1874776945::e_ksea("PTK6", "NU7441", dec); 0.1874776945::e_ksea("PTK6", "NU7441", inc) :- enzyme("PTK6").
0.1167768585::e_ksea("PTK6", "PD153035", dec); 0.1167768585::e_ksea("PTK6", "PD153035", inc) :- enzyme("PTK6").
0.2313199154::e_ksea("PTK6", "PF3758309", dec); 0.2313199154::e_ksea("PTK6", "PF3758309", inc) :- enzyme("PTK6").
0.2305329596::e_ksea("PTK6", "PF4708671", dec); 0.2305329596::e_ksea("PTK6", "PF4708671", inc) :- enzyme("PTK6").
0.2454263814::e_ksea("PTK6", "PH797804", dec); 0.2454263814::e_ksea("PTK6", "PH797804", inc) :- enzyme("PTK6").
0.1899157465::e_ksea("PTK6", "PIK294", dec); 0.1899157465::e_ksea("PTK6", "PIK294", inc) :- enzyme("PTK6").
0.168193894::e_ksea("PTK6", "Ribociclib", dec); 0.168193894::e_ksea("PTK6", "Ribociclib", inc) :- enzyme("PTK6").
0.2264584652::e_ksea("PTK6", "Ripasudil", dec); 0.2264584652::e_ksea("PTK6", "Ripasudil", inc) :- enzyme("PTK6").
0.195805725::e_ksea("PTK6", "SP600125", dec); 0.195805725::e_ksea("PTK6", "SP600125", inc) :- enzyme("PTK6").
0.2486264982::e_ksea("PTK6", "Selumetinib", dec); 0.2486264982::e_ksea("PTK6", "Selumetinib", inc) :- enzyme("PTK6").
0.2180151384::e_ksea("PTK6", "TAK715", dec); 0.2180151384::e_ksea("PTK6", "TAK715", inc) :- enzyme("PTK6").
0.169832567::e_ksea("PTK6", "TBCA", dec); 0.169832567::e_ksea("PTK6", "TBCA", inc) :- enzyme("PTK6").
0.2112927103::e_ksea("PTK6", "TGX221", dec); 0.2112927103::e_ksea("PTK6", "TGX221", inc) :- enzyme("PTK6").
0.1691361392::e_ksea("PTK6", "Tofacitinib", dec); 0.1691361392::e_ksea("PTK6", "Tofacitinib", inc) :- enzyme("PTK6").
0.1927646536::e_ksea("PTK6", "Torin", dec); 0.1927646536::e_ksea("PTK6", "Torin", inc) :- enzyme("PTK6").
0.147836679::e_ksea("PTK6", "Trametinib", dec); 0.147836679::e_ksea("PTK6", "Trametinib", inc) :- enzyme("PTK6").
0.2026255919::e_ksea("PTK6", "U73122", dec); 0.2026255919::e_ksea("PTK6", "U73122", inc) :- enzyme("PTK6").
0.2376180803::e_ksea("PTK6", "Ulixertinib", dec); 0.2376180803::e_ksea("PTK6", "Ulixertinib", inc) :- enzyme("PTK6").
0.1468563434::e_ksea("PTK6", "Vemurafenib", dec); 0.1468563434::e_ksea("PTK6", "Vemurafenib", inc) :- enzyme("PTK6").
0.1999125483::e_ksea("PTPRG", "AC220", dec); 0.1999125483::e_ksea("PTPRG", "AC220", inc) :- enzyme("PTPRG").
0.2062833343::e_ksea("PTPRG", "AT13148", dec); 0.2062833343::e_ksea("PTPRG", "AT13148", inc) :- enzyme("PTPRG").
0.2398428572::e_ksea("PTPRG", "AZ20", dec); 0.2398428572::e_ksea("PTPRG", "AZ20", inc) :- enzyme("PTPRG").
0.1521755099::e_ksea("PTPRG", "AZD1480", dec); 0.1521755099::e_ksea("PTPRG", "AZD1480", inc) :- enzyme("PTPRG").
0.213495045::e_ksea("PTPRG", "AZD3759", dec); 0.213495045::e_ksea("PTPRG", "AZD3759", inc) :- enzyme("PTPRG").
0.1989715654::e_ksea("PTPRG", "AZD5363", dec); 0.1989715654::e_ksea("PTPRG", "AZD5363", inc) :- enzyme("PTPRG").
0.2052379727::e_ksea("PTPRG", "AZD5438", dec); 0.2052379727::e_ksea("PTPRG", "AZD5438", inc) :- enzyme("PTPRG").
0.202539512::e_ksea("PTPRG", "AZD6482", dec); 0.202539512::e_ksea("PTPRG", "AZD6482", inc) :- enzyme("PTPRG").
0.2499249855::e_ksea("PTPRG", "AZD6738", dec); 0.2499249855::e_ksea("PTPRG", "AZD6738", inc) :- enzyme("PTPRG").
0.2375954267::e_ksea("PTPRG", "AZD8055", dec); 0.2375954267::e_ksea("PTPRG", "AZD8055", inc) :- enzyme("PTPRG").
0.237908925::e_ksea("PTPRG", "Amuvatinib", dec); 0.237908925::e_ksea("PTPRG", "Amuvatinib", inc) :- enzyme("PTPRG").
0.1438223857::e_ksea("PTPRG", "BX912", dec); 0.1438223857::e_ksea("PTPRG", "BX912", inc) :- enzyme("PTPRG").
0.1817621321::e_ksea("PTPRG", "Bosutinib", dec); 0.1817621321::e_ksea("PTPRG", "Bosutinib", inc) :- enzyme("PTPRG").
0.2480957342::e_ksea("PTPRG", "CAL101", dec); 0.2480957342::e_ksea("PTPRG", "CAL101", inc) :- enzyme("PTPRG").
0.1993968243::e_ksea("PTPRG", "CHIR99021", dec); 0.1993968243::e_ksea("PTPRG", "CHIR99021", inc) :- enzyme("PTPRG").
0.2182058314::e_ksea("PTPRG", "CX4945", dec); 0.2182058314::e_ksea("PTPRG", "CX4945", inc) :- enzyme("PTPRG").
0.229789117::e_ksea("PTPRG", "DNAPK", dec); 0.229789117::e_ksea("PTPRG", "DNAPK", inc) :- enzyme("PTPRG").
0.2309636139::e_ksea("PTPRG", "Dabrafenib", dec); 0.2309636139::e_ksea("PTPRG", "Dabrafenib", inc) :- enzyme("PTPRG").
0.1822015134::e_ksea("PTPRG", "Dasatinib", dec); 0.1822015134::e_ksea("PTPRG", "Dasatinib", inc) :- enzyme("PTPRG").
0.2220415539::e_ksea("PTPRG", "Edelfosine", dec); 0.2220415539::e_ksea("PTPRG", "Edelfosine", inc) :- enzyme("PTPRG").
0.1499713044::e_ksea("PTPRG", "FRAX486", dec); 0.1499713044::e_ksea("PTPRG", "FRAX486", inc) :- enzyme("PTPRG").
0.2025755979::e_ksea("PTPRG", "GDC0941", dec); 0.2025755979::e_ksea("PTPRG", "GDC0941", inc) :- enzyme("PTPRG").
0.162063576::e_ksea("PTPRG", "GDC0994", dec); 0.162063576::e_ksea("PTPRG", "GDC0994", inc) :- enzyme("PTPRG").
0.2429883845::e_ksea("PTPRG", "GF109203X", dec); 0.2429883845::e_ksea("PTPRG", "GF109203X", inc) :- enzyme("PTPRG").
0.2182920438::e_ksea("PTPRG", "GO6983", dec); 0.2182920438::e_ksea("PTPRG", "GO6983", inc) :- enzyme("PTPRG").
0.1422855832::e_ksea("PTPRG", "GSK2334470", dec); 0.1422855832::e_ksea("PTPRG", "GSK2334470", inc) :- enzyme("PTPRG").
0.1478726877::e_ksea("PTPRG", "GSK690693", dec); 0.1478726877::e_ksea("PTPRG", "GSK690693", inc) :- enzyme("PTPRG").
0.2372481934::e_ksea("PTPRG", "Go6976", dec); 0.2372481934::e_ksea("PTPRG", "Go6976", inc) :- enzyme("PTPRG").
0.2311043981::e_ksea("PTPRG", "H89", dec); 0.2311043981::e_ksea("PTPRG", "H89", inc) :- enzyme("PTPRG").
0.2389856534::e_ksea("PTPRG", "HS173", dec); 0.2389856534::e_ksea("PTPRG", "HS173", inc) :- enzyme("PTPRG").
0.149073313::e_ksea("PTPRG", "Ipatasertib", dec); 0.149073313::e_ksea("PTPRG", "Ipatasertib", inc) :- enzyme("PTPRG").
0.227702589::e_ksea("PTPRG", "JNJ", dec); 0.227702589::e_ksea("PTPRG", "JNJ", inc) :- enzyme("PTPRG").
0.2176110524::e_ksea("PTPRG", "JNK", dec); 0.2176110524::e_ksea("PTPRG", "JNK", inc) :- enzyme("PTPRG").
0.2126971441::e_ksea("PTPRG", "KD025", dec); 0.2126971441::e_ksea("PTPRG", "KD025", inc) :- enzyme("PTPRG").
0.2375116068::e_ksea("PTPRG", "KN62", dec); 0.2375116068::e_ksea("PTPRG", "KN62", inc) :- enzyme("PTPRG").
0.1533236561::e_ksea("PTPRG", "KN93", dec); 0.1533236561::e_ksea("PTPRG", "KN93", inc) :- enzyme("PTPRG").
0.193002507::e_ksea("PTPRG", "Ku0063794", dec); 0.193002507::e_ksea("PTPRG", "Ku0063794", inc) :- enzyme("PTPRG").
0.2009068525::e_ksea("PTPRG", "LY2090314", dec); 0.2009068525::e_ksea("PTPRG", "LY2090314", inc) :- enzyme("PTPRG").
0.1868946377::e_ksea("PTPRG", "LY2584702", dec); 0.1868946377::e_ksea("PTPRG", "LY2584702", inc) :- enzyme("PTPRG").
0.2235793428::e_ksea("PTPRG", "LY2835219", dec); 0.2235793428::e_ksea("PTPRG", "LY2835219", inc) :- enzyme("PTPRG").
0.230086543::e_ksea("PTPRG", "Linsitinib", dec); 0.230086543::e_ksea("PTPRG", "Linsitinib", inc) :- enzyme("PTPRG").
0.1267228014::e_ksea("PTPRG", "MK2206", dec); 0.1267228014::e_ksea("PTPRG", "MK2206", inc) :- enzyme("PTPRG").
0.228424126::e_ksea("PTPRG", "NU7441", dec); 0.228424126::e_ksea("PTPRG", "NU7441", inc) :- enzyme("PTPRG").
0.1456794574::e_ksea("PTPRG", "PD153035", dec); 0.1456794574::e_ksea("PTPRG", "PD153035", inc) :- enzyme("PTPRG").
0.1006172548::e_ksea("PTPRG", "PF3758309", dec); 0.1006172548::e_ksea("PTPRG", "PF3758309", inc) :- enzyme("PTPRG").
0.1844843334::e_ksea("PTPRG", "PF4708671", dec); 0.1844843334::e_ksea("PTPRG", "PF4708671", inc) :- enzyme("PTPRG").
0.2294004879::e_ksea("PTPRG", "PH797804", dec); 0.2294004879::e_ksea("PTPRG", "PH797804", inc) :- enzyme("PTPRG").
0.1814462409::e_ksea("PTPRG", "PIK294", dec); 0.1814462409::e_ksea("PTPRG", "PIK294", inc) :- enzyme("PTPRG").
0.1705520251::e_ksea("PTPRG", "Ribociclib", dec); 0.1705520251::e_ksea("PTPRG", "Ribociclib", inc) :- enzyme("PTPRG").
0.2459743875::e_ksea("PTPRG", "Ripasudil", dec); 0.2459743875::e_ksea("PTPRG", "Ripasudil", inc) :- enzyme("PTPRG").
0.237637443::e_ksea("PTPRG", "SP600125", dec); 0.237637443::e_ksea("PTPRG", "SP600125", inc) :- enzyme("PTPRG").
0.2304318156::e_ksea("PTPRG", "Selumetinib", dec); 0.2304318156::e_ksea("PTPRG", "Selumetinib", inc) :- enzyme("PTPRG").
0.2432703749::e_ksea("PTPRG", "TAK715", dec); 0.2432703749::e_ksea("PTPRG", "TAK715", inc) :- enzyme("PTPRG").
0.204517914::e_ksea("PTPRG", "TBCA", dec); 0.204517914::e_ksea("PTPRG", "TBCA", inc) :- enzyme("PTPRG").
0.212840661::e_ksea("PTPRG", "TGX221", dec); 0.212840661::e_ksea("PTPRG", "TGX221", inc) :- enzyme("PTPRG").
0.151825247::e_ksea("PTPRG", "Tofacitinib", dec); 0.151825247::e_ksea("PTPRG", "Tofacitinib", inc) :- enzyme("PTPRG").
0.2026275807::e_ksea("PTPRG", "Torin", dec); 0.2026275807::e_ksea("PTPRG", "Torin", inc) :- enzyme("PTPRG").
0.1682608546::e_ksea("PTPRG", "Trametinib", dec); 0.1682608546::e_ksea("PTPRG", "Trametinib", inc) :- enzyme("PTPRG").
0.2443260645::e_ksea("PTPRG", "U73122", dec); 0.2443260645::e_ksea("PTPRG", "U73122", inc) :- enzyme("PTPRG").
0.2358677772::e_ksea("PTPRG", "Ulixertinib", dec); 0.2358677772::e_ksea("PTPRG", "Ulixertinib", inc) :- enzyme("PTPRG").
0.2427412488::e_ksea("PTPRG", "Vemurafenib", dec); 0.2427412488::e_ksea("PTPRG", "Vemurafenib", inc) :- enzyme("PTPRG").
0.1677748927::e_ksea("PTPRR", "AC220", dec); 0.1677748927::e_ksea("PTPRR", "AC220", inc) :- enzyme("PTPRR").
0.2003966547::e_ksea("PTPRR", "AT13148", dec); 0.2003966547::e_ksea("PTPRR", "AT13148", inc) :- enzyme("PTPRR").
0.1769641515::e_ksea("PTPRR", "AZ20", dec); 0.1769641515::e_ksea("PTPRR", "AZ20", inc) :- enzyme("PTPRR").
0.2415572121::e_ksea("PTPRR", "AZD1480", dec); 0.2415572121::e_ksea("PTPRR", "AZD1480", inc) :- enzyme("PTPRR").
0.1587427015::e_ksea("PTPRR", "AZD3759", dec); 0.1587427015::e_ksea("PTPRR", "AZD3759", inc) :- enzyme("PTPRR").
0.1956455989::e_ksea("PTPRR", "AZD5363", dec); 0.1956455989::e_ksea("PTPRR", "AZD5363", inc) :- enzyme("PTPRR").
0.1050444154::e_ksea("PTPRR", "AZD5438", dec); 0.1050444154::e_ksea("PTPRR", "AZD5438", inc) :- enzyme("PTPRR").
0.1111166308::e_ksea("PTPRR", "AZD6482", dec); 0.1111166308::e_ksea("PTPRR", "AZD6482", inc) :- enzyme("PTPRR").
0.1521059664::e_ksea("PTPRR", "AZD6738", dec); 0.1521059664::e_ksea("PTPRR", "AZD6738", inc) :- enzyme("PTPRR").
0.2484370104::e_ksea("PTPRR", "AZD8055", dec); 0.2484370104::e_ksea("PTPRR", "AZD8055", inc) :- enzyme("PTPRR").
0.1929617616::e_ksea("PTPRR", "Amuvatinib", dec); 0.1929617616::e_ksea("PTPRR", "Amuvatinib", inc) :- enzyme("PTPRR").
0.210184887::e_ksea("PTPRR", "BX912", dec); 0.210184887::e_ksea("PTPRR", "BX912", inc) :- enzyme("PTPRR").
0.1402904839::e_ksea("PTPRR", "Bosutinib", dec); 0.1402904839::e_ksea("PTPRR", "Bosutinib", inc) :- enzyme("PTPRR").
0.2387260726::e_ksea("PTPRR", "CAL101", dec); 0.2387260726::e_ksea("PTPRR", "CAL101", inc) :- enzyme("PTPRR").
0.2275605383::e_ksea("PTPRR", "CHIR99021", dec); 0.2275605383::e_ksea("PTPRR", "CHIR99021", inc) :- enzyme("PTPRR").
0.1255302363::e_ksea("PTPRR", "CX4945", dec); 0.1255302363::e_ksea("PTPRR", "CX4945", inc) :- enzyme("PTPRR").
0.2365767347::e_ksea("PTPRR", "DNAPK", dec); 0.2365767347::e_ksea("PTPRR", "DNAPK", inc) :- enzyme("PTPRR").
0.1605105735::e_ksea("PTPRR", "Dabrafenib", dec); 0.1605105735::e_ksea("PTPRR", "Dabrafenib", inc) :- enzyme("PTPRR").
0.1457699586::e_ksea("PTPRR", "Dasatinib", dec); 0.1457699586::e_ksea("PTPRR", "Dasatinib", inc) :- enzyme("PTPRR").
0.1830182397::e_ksea("PTPRR", "Edelfosine", dec); 0.1830182397::e_ksea("PTPRR", "Edelfosine", inc) :- enzyme("PTPRR").
0.1000000742::e_ksea("PTPRR", "FRAX486", dec); 0.1000000742::e_ksea("PTPRR", "FRAX486", inc) :- enzyme("PTPRR").
0.1775593584::e_ksea("PTPRR", "GDC0941", dec); 0.1775593584::e_ksea("PTPRR", "GDC0941", inc) :- enzyme("PTPRR").
0.2318732556::e_ksea("PTPRR", "GDC0994", dec); 0.2318732556::e_ksea("PTPRR", "GDC0994", inc) :- enzyme("PTPRR").
0.119365543::e_ksea("PTPRR", "GF109203X", dec); 0.119365543::e_ksea("PTPRR", "GF109203X", inc) :- enzyme("PTPRR").
0.2435986553::e_ksea("PTPRR", "GO6983", dec); 0.2435986553::e_ksea("PTPRR", "GO6983", inc) :- enzyme("PTPRR").
0.2483260691::e_ksea("PTPRR", "GSK2334470", dec); 0.2483260691::e_ksea("PTPRR", "GSK2334470", inc) :- enzyme("PTPRR").
0.186105826::e_ksea("PTPRR", "GSK690693", dec); 0.186105826::e_ksea("PTPRR", "GSK690693", inc) :- enzyme("PTPRR").
0.2296062157::e_ksea("PTPRR", "Go6976", dec); 0.2296062157::e_ksea("PTPRR", "Go6976", inc) :- enzyme("PTPRR").
0.2139206804::e_ksea("PTPRR", "H89", dec); 0.2139206804::e_ksea("PTPRR", "H89", inc) :- enzyme("PTPRR").
0.1569784211::e_ksea("PTPRR", "HS173", dec); 0.1569784211::e_ksea("PTPRR", "HS173", inc) :- enzyme("PTPRR").
0.1085928505::e_ksea("PTPRR", "Ipatasertib", dec); 0.1085928505::e_ksea("PTPRR", "Ipatasertib", inc) :- enzyme("PTPRR").
0.1494551751::e_ksea("PTPRR", "JNJ", dec); 0.1494551751::e_ksea("PTPRR", "JNJ", inc) :- enzyme("PTPRR").
0.193982778::e_ksea("PTPRR", "JNK", dec); 0.193982778::e_ksea("PTPRR", "JNK", inc) :- enzyme("PTPRR").
0.1926275975::e_ksea("PTPRR", "KD025", dec); 0.1926275975::e_ksea("PTPRR", "KD025", inc) :- enzyme("PTPRR").
0.1130684499::e_ksea("PTPRR", "KN62", dec); 0.1130684499::e_ksea("PTPRR", "KN62", inc) :- enzyme("PTPRR").
0.1657314244::e_ksea("PTPRR", "KN93", dec); 0.1657314244::e_ksea("PTPRR", "KN93", inc) :- enzyme("PTPRR").
0.1143128644::e_ksea("PTPRR", "Ku0063794", dec); 0.1143128644::e_ksea("PTPRR", "Ku0063794", inc) :- enzyme("PTPRR").
0.1513993717::e_ksea("PTPRR", "LY2090314", dec); 0.1513993717::e_ksea("PTPRR", "LY2090314", inc) :- enzyme("PTPRR").
0.1768684837::e_ksea("PTPRR", "LY2584702", dec); 0.1768684837::e_ksea("PTPRR", "LY2584702", inc) :- enzyme("PTPRR").
0.166320377::e_ksea("PTPRR", "LY2835219", dec); 0.166320377::e_ksea("PTPRR", "LY2835219", inc) :- enzyme("PTPRR").
0.2268431829::e_ksea("PTPRR", "Linsitinib", dec); 0.2268431829::e_ksea("PTPRR", "Linsitinib", inc) :- enzyme("PTPRR").
0.158741929::e_ksea("PTPRR", "MK2206", dec); 0.158741929::e_ksea("PTPRR", "MK2206", inc) :- enzyme("PTPRR").
0.2124386892::e_ksea("PTPRR", "NU7441", dec); 0.2124386892::e_ksea("PTPRR", "NU7441", inc) :- enzyme("PTPRR").
0.212120919::e_ksea("PTPRR", "PD153035", dec); 0.212120919::e_ksea("PTPRR", "PD153035", inc) :- enzyme("PTPRR").
0.1096218965::e_ksea("PTPRR", "PF3758309", dec); 0.1096218965::e_ksea("PTPRR", "PF3758309", inc) :- enzyme("PTPRR").
0.2283683565::e_ksea("PTPRR", "PF4708671", dec); 0.2283683565::e_ksea("PTPRR", "PF4708671", inc) :- enzyme("PTPRR").
0.2409205506::e_ksea("PTPRR", "PH797804", dec); 0.2409205506::e_ksea("PTPRR", "PH797804", inc) :- enzyme("PTPRR").
0.2311220417::e_ksea("PTPRR", "PIK294", dec); 0.2311220417::e_ksea("PTPRR", "PIK294", inc) :- enzyme("PTPRR").
0.1212959358::e_ksea("PTPRR", "Ribociclib", dec); 0.1212959358::e_ksea("PTPRR", "Ribociclib", inc) :- enzyme("PTPRR").
0.1860291301::e_ksea("PTPRR", "Ripasudil", dec); 0.1860291301::e_ksea("PTPRR", "Ripasudil", inc) :- enzyme("PTPRR").
0.2004626267::e_ksea("PTPRR", "SP600125", dec); 0.2004626267::e_ksea("PTPRR", "SP600125", inc) :- enzyme("PTPRR").
0.101068077::e_ksea("PTPRR", "Selumetinib", dec); 0.101068077::e_ksea("PTPRR", "Selumetinib", inc) :- enzyme("PTPRR").
0.2182542972::e_ksea("PTPRR", "TAK715", dec); 0.2182542972::e_ksea("PTPRR", "TAK715", inc) :- enzyme("PTPRR").
0.1882904126::e_ksea("PTPRR", "TBCA", dec); 0.1882904126::e_ksea("PTPRR", "TBCA", inc) :- enzyme("PTPRR").
0.2159108426::e_ksea("PTPRR", "TGX221", dec); 0.2159108426::e_ksea("PTPRR", "TGX221", inc) :- enzyme("PTPRR").
0.141160466::e_ksea("PTPRR", "Tofacitinib", dec); 0.141160466::e_ksea("PTPRR", "Tofacitinib", inc) :- enzyme("PTPRR").
0.1013620281::e_ksea("PTPRR", "Torin", dec); 0.1013620281::e_ksea("PTPRR", "Torin", inc) :- enzyme("PTPRR").
0.1126623298::e_ksea("PTPRR", "Trametinib", dec); 0.1126623298::e_ksea("PTPRR", "Trametinib", inc) :- enzyme("PTPRR").
0.1708865394::e_ksea("PTPRR", "U73122", dec); 0.1708865394::e_ksea("PTPRR", "U73122", inc) :- enzyme("PTPRR").
0.1136354212::e_ksea("PTPRR", "Ulixertinib", dec); 0.1136354212::e_ksea("PTPRR", "Ulixertinib", inc) :- enzyme("PTPRR").
0.1659564114::e_ksea("PTPRR", "Vemurafenib", dec); 0.1659564114::e_ksea("PTPRR", "Vemurafenib", inc) :- enzyme("PTPRR").
0.0795601858::e_ksea("SRC", "AC220", dec); 0.0795601858::e_ksea("SRC", "AC220", inc) :- enzyme("SRC").
0.1730722746::e_ksea("SRC", "AT13148", dec); 0.1730722746::e_ksea("SRC", "AT13148", inc) :- enzyme("SRC").
0.1039537153::e_ksea("SRC", "AZ20", dec); 0.1039537153::e_ksea("SRC", "AZ20", inc) :- enzyme("SRC").
0.1878385359::e_ksea("SRC", "AZD1480", dec); 0.1878385359::e_ksea("SRC", "AZD1480", inc) :- enzyme("SRC").
0.1783016102::e_ksea("SRC", "AZD3759", dec); 0.1783016102::e_ksea("SRC", "AZD3759", inc) :- enzyme("SRC").
0.1622338273::e_ksea("SRC", "AZD5363", dec); 0.1622338273::e_ksea("SRC", "AZD5363", inc) :- enzyme("SRC").
0.1239315724::e_ksea("SRC", "AZD5438", dec); 0.1239315724::e_ksea("SRC", "AZD5438", inc) :- enzyme("SRC").
0.0589290737::e_ksea("SRC", "AZD6482", dec); 0.0589290737::e_ksea("SRC", "AZD6482", inc) :- enzyme("SRC").
0.0114920889::e_ksea("SRC", "AZD6738", dec); 0.0114920889::e_ksea("SRC", "AZD6738", inc) :- enzyme("SRC").
0.1630220173::e_ksea("SRC", "AZD8055", dec); 0.1630220173::e_ksea("SRC", "AZD8055", inc) :- enzyme("SRC").
0.1993748019::e_ksea("SRC", "Amuvatinib", dec); 0.1993748019::e_ksea("SRC", "Amuvatinib", inc) :- enzyme("SRC").
0.2310427061::e_ksea("SRC", "BX912", dec); 0.2310427061::e_ksea("SRC", "BX912", inc) :- enzyme("SRC").
0.0058645381::e_ksea("SRC", "Bosutinib", dec); 0.0058645381::e_ksea("SRC", "Bosutinib", inc) :- enzyme("SRC").
0.2183261863::e_ksea("SRC", "CAL101", dec); 0.2183261863::e_ksea("SRC", "CAL101", inc) :- enzyme("SRC").
0.1494564237::e_ksea("SRC", "CHIR99021", dec); 0.1494564237::e_ksea("SRC", "CHIR99021", inc) :- enzyme("SRC").
0.0420397587::e_ksea("SRC", "CX4945", dec); 0.0420397587::e_ksea("SRC", "CX4945", inc) :- enzyme("SRC").
0.1840051876::e_ksea("SRC", "DNAPK", dec); 0.1840051876::e_ksea("SRC", "DNAPK", inc) :- enzyme("SRC").
0.1744508504::e_ksea("SRC", "Dabrafenib", dec); 0.1744508504::e_ksea("SRC", "Dabrafenib", inc) :- enzyme("SRC").
0.055542159::e_ksea("SRC", "Dasatinib", dec); 0.055542159::e_ksea("SRC", "Dasatinib", inc) :- enzyme("SRC").
0.072786519::e_ksea("SRC", "Edelfosine", dec); 0.072786519::e_ksea("SRC", "Edelfosine", inc) :- enzyme("SRC").
0.1019092939::e_ksea("SRC", "FRAX486", dec); 0.1019092939::e_ksea("SRC", "FRAX486", inc) :- enzyme("SRC").
0.2210986821::e_ksea("SRC", "GDC0941", dec); 0.2210986821::e_ksea("SRC", "GDC0941", inc) :- enzyme("SRC").
0.0336608703::e_ksea("SRC", "GDC0994", dec); 0.0336608703::e_ksea("SRC", "GDC0994", inc) :- enzyme("SRC").
0.0047318217::e_ksea("SRC", "GF109203X", dec); 0.0047318217::e_ksea("SRC", "GF109203X", inc) :- enzyme("SRC").
0.0446971271::e_ksea("SRC", "GO6983", dec); 0.0446971271::e_ksea("SRC", "GO6983", inc) :- enzyme("SRC").
0.135471429::e_ksea("SRC", "GSK2334470", dec); 0.135471429::e_ksea("SRC", "GSK2334470", inc) :- enzyme("SRC").
0.2189214168::e_ksea("SRC", "GSK690693", dec); 0.2189214168::e_ksea("SRC", "GSK690693", inc) :- enzyme("SRC").
0.1088382202::e_ksea("SRC", "Go6976", dec); 0.1088382202::e_ksea("SRC", "Go6976", inc) :- enzyme("SRC").
0.0371694672::e_ksea("SRC", "H89", dec); 0.0371694672::e_ksea("SRC", "H89", inc) :- enzyme("SRC").
0.2169609178::e_ksea("SRC", "HS173", dec); 0.2169609178::e_ksea("SRC", "HS173", inc) :- enzyme("SRC").
0.022643932::e_ksea("SRC", "Ipatasertib", dec); 0.022643932::e_ksea("SRC", "Ipatasertib", inc) :- enzyme("SRC").
0.118974607::e_ksea("SRC", "JNJ", dec); 0.118974607::e_ksea("SRC", "JNJ", inc) :- enzyme("SRC").
0.1831003657::e_ksea("SRC", "JNK", dec); 0.1831003657::e_ksea("SRC", "JNK", inc) :- enzyme("SRC").
0.1921632954::e_ksea("SRC", "KD025", dec); 0.1921632954::e_ksea("SRC", "KD025", inc) :- enzyme("SRC").
0.2218523266::e_ksea("SRC", "KN62", dec); 0.2218523266::e_ksea("SRC", "KN62", inc) :- enzyme("SRC").
0.0657066002::e_ksea("SRC", "KN93", dec); 0.0657066002::e_ksea("SRC", "KN93", inc) :- enzyme("SRC").
0.1496570212::e_ksea("SRC", "Ku0063794", dec); 0.1496570212::e_ksea("SRC", "Ku0063794", inc) :- enzyme("SRC").
0.1645406755::e_ksea("SRC", "LY2090314", dec); 0.1645406755::e_ksea("SRC", "LY2090314", inc) :- enzyme("SRC").
0.1613557528::e_ksea("SRC", "LY2584702", dec); 0.1613557528::e_ksea("SRC", "LY2584702", inc) :- enzyme("SRC").
0.2162249136::e_ksea("SRC", "LY2835219", dec); 0.2162249136::e_ksea("SRC", "LY2835219", inc) :- enzyme("SRC").
0.154051856::e_ksea("SRC", "Linsitinib", dec); 0.154051856::e_ksea("SRC", "Linsitinib", inc) :- enzyme("SRC").
0.1201132629::e_ksea("SRC", "MK2206", dec); 0.1201132629::e_ksea("SRC", "MK2206", inc) :- enzyme("SRC").
0.0363929012::e_ksea("SRC", "NU7441", dec); 0.0363929012::e_ksea("SRC", "NU7441", inc) :- enzyme("SRC").
0.1221489784::e_ksea("SRC", "PD153035", dec); 0.1221489784::e_ksea("SRC", "PD153035", inc) :- enzyme("SRC").
0.138401668::e_ksea("SRC", "PF3758309", dec); 0.138401668::e_ksea("SRC", "PF3758309", inc) :- enzyme("SRC").
0.0461064978::e_ksea("SRC", "PF4708671", dec); 0.0461064978::e_ksea("SRC", "PF4708671", inc) :- enzyme("SRC").
0.1711078071::e_ksea("SRC", "PH797804", dec); 0.1711078071::e_ksea("SRC", "PH797804", inc) :- enzyme("SRC").
0.05908635::e_ksea("SRC", "PIK294", dec); 0.05908635::e_ksea("SRC", "PIK294", inc) :- enzyme("SRC").
0.0638100063::e_ksea("SRC", "Ribociclib", dec); 0.0638100063::e_ksea("SRC", "Ribociclib", inc) :- enzyme("SRC").
0.1909106498::e_ksea("SRC", "Ripasudil", dec); 0.1909106498::e_ksea("SRC", "Ripasudil", inc) :- enzyme("SRC").
0.0257327814::e_ksea("SRC", "SP600125", dec); 0.0257327814::e_ksea("SRC", "SP600125", inc) :- enzyme("SRC").
0.1393660345::e_ksea("SRC", "Selumetinib", dec); 0.1393660345::e_ksea("SRC", "Selumetinib", inc) :- enzyme("SRC").
0.0825957515::e_ksea("SRC", "TAK715", dec); 0.0825957515::e_ksea("SRC", "TAK715", inc) :- enzyme("SRC").
0.1153649671::e_ksea("SRC", "TBCA", dec); 0.1153649671::e_ksea("SRC", "TBCA", inc) :- enzyme("SRC").
0.1995092884::e_ksea("SRC", "TGX221", dec); 0.1995092884::e_ksea("SRC", "TGX221", inc) :- enzyme("SRC").
0.0691305345::e_ksea("SRC", "Tofacitinib", dec); 0.0691305345::e_ksea("SRC", "Tofacitinib", inc) :- enzyme("SRC").
0.1121585714::e_ksea("SRC", "Torin", dec); 0.1121585714::e_ksea("SRC", "Torin", inc) :- enzyme("SRC").
0.1318826657::e_ksea("SRC", "Trametinib", dec); 0.1318826657::e_ksea("SRC", "Trametinib", inc) :- enzyme("SRC").
0.2243375494::e_ksea("SRC", "U73122", dec); 0.2243375494::e_ksea("SRC", "U73122", inc) :- enzyme("SRC").
0.1985941867::e_ksea("SRC", "Ulixertinib", dec); 0.1985941867::e_ksea("SRC", "Ulixertinib", inc) :- enzyme("SRC").
0.1012296186::e_ksea("SRC", "Vemurafenib", dec); 0.1012296186::e_ksea("SRC", "Vemurafenib", inc) :- enzyme("SRC").
%% p1::p_fc(P, S, dec); p2::p_fc(P, S, base); p3::p_fc(P, S, inc) :- p_occupancy(P, S, _dO). % value = _fc = [dec | base | inc] (cpd, P/S-level)
0.3196059032::p_fc("ABI1(Y213)", "AC220", dec); 0.001::p_fc("ABI1(Y213)", "AC220", inc) :- p_occupancy("ABI1(Y213)", "AC220", dec).
0.001::p_fc("ABI1(Y213)", "AC220", dec); 0.3196059032::p_fc("ABI1(Y213)", "AC220", inc) :- p_occupancy("ABI1(Y213)", "AC220", inc).
0.0481782126::p_fc("ABI1(Y213)", "AT13148", dec); 0.001::p_fc("ABI1(Y213)", "AT13148", inc) :- p_occupancy("ABI1(Y213)", "AT13148", dec).
0.001::p_fc("ABI1(Y213)", "AT13148", dec); 0.0481782126::p_fc("ABI1(Y213)", "AT13148", inc) :- p_occupancy("ABI1(Y213)", "AT13148", inc).
0.0147588362::p_fc("ABI1(Y213)", "AZ20", dec); 0.001::p_fc("ABI1(Y213)", "AZ20", inc) :- p_occupancy("ABI1(Y213)", "AZ20", dec).
0.001::p_fc("ABI1(Y213)", "AZ20", dec); 0.0147588362::p_fc("ABI1(Y213)", "AZ20", inc) :- p_occupancy("ABI1(Y213)", "AZ20", inc).
0.479310603::p_fc("ABI1(Y213)", "AZD1480", dec); 0.001::p_fc("ABI1(Y213)", "AZD1480", inc) :- p_occupancy("ABI1(Y213)", "AZD1480", dec).
0.001::p_fc("ABI1(Y213)", "AZD1480", dec); 0.479310603::p_fc("ABI1(Y213)", "AZD1480", inc) :- p_occupancy("ABI1(Y213)", "AZD1480", inc).
0.2943143924::p_fc("ABI1(Y213)", "AZD3759", dec); 0.001::p_fc("ABI1(Y213)", "AZD3759", inc) :- p_occupancy("ABI1(Y213)", "AZD3759", dec).
0.001::p_fc("ABI1(Y213)", "AZD3759", dec); 0.2943143924::p_fc("ABI1(Y213)", "AZD3759", inc) :- p_occupancy("ABI1(Y213)", "AZD3759", inc).
0.0806161318::p_fc("ABI1(Y213)", "AZD5363", dec); 0.001::p_fc("ABI1(Y213)", "AZD5363", inc) :- p_occupancy("ABI1(Y213)", "AZD5363", dec).
0.001::p_fc("ABI1(Y213)", "AZD5363", dec); 0.0806161318::p_fc("ABI1(Y213)", "AZD5363", inc) :- p_occupancy("ABI1(Y213)", "AZD5363", inc).
0.7957991547::p_fc("ABI1(Y213)", "AZD5438", dec); 0.001::p_fc("ABI1(Y213)", "AZD5438", inc) :- p_occupancy("ABI1(Y213)", "AZD5438", dec).
0.001::p_fc("ABI1(Y213)", "AZD5438", dec); 0.7957991547::p_fc("ABI1(Y213)", "AZD5438", inc) :- p_occupancy("ABI1(Y213)", "AZD5438", inc).
0.6893010402::p_fc("ABI1(Y213)", "AZD6482", dec); 0.001::p_fc("ABI1(Y213)", "AZD6482", inc) :- p_occupancy("ABI1(Y213)", "AZD6482", dec).
0.001::p_fc("ABI1(Y213)", "AZD6482", dec); 0.6893010402::p_fc("ABI1(Y213)", "AZD6482", inc) :- p_occupancy("ABI1(Y213)", "AZD6482", inc).
0.3756291661::p_fc("ABI1(Y213)", "AZD6738", dec); 0.001::p_fc("ABI1(Y213)", "AZD6738", inc) :- p_occupancy("ABI1(Y213)", "AZD6738", dec).
0.001::p_fc("ABI1(Y213)", "AZD6738", dec); 0.3756291661::p_fc("ABI1(Y213)", "AZD6738", inc) :- p_occupancy("ABI1(Y213)", "AZD6738", inc).
0.4197631795::p_fc("ABI1(Y213)", "AZD8055", dec); 0.001::p_fc("ABI1(Y213)", "AZD8055", inc) :- p_occupancy("ABI1(Y213)", "AZD8055", dec).
0.001::p_fc("ABI1(Y213)", "AZD8055", dec); 0.4197631795::p_fc("ABI1(Y213)", "AZD8055", inc) :- p_occupancy("ABI1(Y213)", "AZD8055", inc).
0.3881978586::p_fc("ABI1(Y213)", "Amuvatinib", dec); 0.001::p_fc("ABI1(Y213)", "Amuvatinib", inc) :- p_occupancy("ABI1(Y213)", "Amuvatinib", dec).
0.001::p_fc("ABI1(Y213)", "Amuvatinib", dec); 0.3881978586::p_fc("ABI1(Y213)", "Amuvatinib", inc) :- p_occupancy("ABI1(Y213)", "Amuvatinib", inc).
0.3848048517::p_fc("ABI1(Y213)", "BX912", dec); 0.001::p_fc("ABI1(Y213)", "BX912", inc) :- p_occupancy("ABI1(Y213)", "BX912", dec).
0.001::p_fc("ABI1(Y213)", "BX912", dec); 0.3848048517::p_fc("ABI1(Y213)", "BX912", inc) :- p_occupancy("ABI1(Y213)", "BX912", inc).
0.999995617::p_fc("ABI1(Y213)", "Bosutinib", dec); 0.001::p_fc("ABI1(Y213)", "Bosutinib", inc) :- p_occupancy("ABI1(Y213)", "Bosutinib", dec).
0.001::p_fc("ABI1(Y213)", "Bosutinib", dec); 0.999995617::p_fc("ABI1(Y213)", "Bosutinib", inc) :- p_occupancy("ABI1(Y213)", "Bosutinib", inc).
0.6548775334::p_fc("ABI1(Y213)", "CAL101", dec); 0.001::p_fc("ABI1(Y213)", "CAL101", inc) :- p_occupancy("ABI1(Y213)", "CAL101", dec).
0.001::p_fc("ABI1(Y213)", "CAL101", dec); 0.6548775334::p_fc("ABI1(Y213)", "CAL101", inc) :- p_occupancy("ABI1(Y213)", "CAL101", inc).
0.0213861479::p_fc("ABI1(Y213)", "CHIR99021", dec); 0.001::p_fc("ABI1(Y213)", "CHIR99021", inc) :- p_occupancy("ABI1(Y213)", "CHIR99021", dec).
0.001::p_fc("ABI1(Y213)", "CHIR99021", dec); 0.0213861479::p_fc("ABI1(Y213)", "CHIR99021", inc) :- p_occupancy("ABI1(Y213)", "CHIR99021", inc).
0.4304687061::p_fc("ABI1(Y213)", "CX4945", dec); 0.001::p_fc("ABI1(Y213)", "CX4945", inc) :- p_occupancy("ABI1(Y213)", "CX4945", dec).
0.001::p_fc("ABI1(Y213)", "CX4945", dec); 0.4304687061::p_fc("ABI1(Y213)", "CX4945", inc) :- p_occupancy("ABI1(Y213)", "CX4945", inc).
0.3127361554::p_fc("ABI1(Y213)", "DNAPK", dec); 0.001::p_fc("ABI1(Y213)", "DNAPK", inc) :- p_occupancy("ABI1(Y213)", "DNAPK", dec).
0.001::p_fc("ABI1(Y213)", "DNAPK", dec); 0.3127361554::p_fc("ABI1(Y213)", "DNAPK", inc) :- p_occupancy("ABI1(Y213)", "DNAPK", inc).
0.7290651015::p_fc("ABI1(Y213)", "Dabrafenib", dec); 0.001::p_fc("ABI1(Y213)", "Dabrafenib", inc) :- p_occupancy("ABI1(Y213)", "Dabrafenib", dec).
0.001::p_fc("ABI1(Y213)", "Dabrafenib", dec); 0.7290651015::p_fc("ABI1(Y213)", "Dabrafenib", inc) :- p_occupancy("ABI1(Y213)", "Dabrafenib", inc).
0.999999785::p_fc("ABI1(Y213)", "Dasatinib", dec); 0.001::p_fc("ABI1(Y213)", "Dasatinib", inc) :- p_occupancy("ABI1(Y213)", "Dasatinib", dec).
0.001::p_fc("ABI1(Y213)", "Dasatinib", dec); 0.999999785::p_fc("ABI1(Y213)", "Dasatinib", inc) :- p_occupancy("ABI1(Y213)", "Dasatinib", inc).
0.1410125825::p_fc("ABI1(Y213)", "Edelfosine", dec); 0.001::p_fc("ABI1(Y213)", "Edelfosine", inc) :- p_occupancy("ABI1(Y213)", "Edelfosine", dec).
0.001::p_fc("ABI1(Y213)", "Edelfosine", dec); 0.1410125825::p_fc("ABI1(Y213)", "Edelfosine", inc) :- p_occupancy("ABI1(Y213)", "Edelfosine", inc).
0.6256005502::p_fc("ABI1(Y213)", "FRAX486", dec); 0.001::p_fc("ABI1(Y213)", "FRAX486", inc) :- p_occupancy("ABI1(Y213)", "FRAX486", dec).
0.001::p_fc("ABI1(Y213)", "FRAX486", dec); 0.6256005502::p_fc("ABI1(Y213)", "FRAX486", inc) :- p_occupancy("ABI1(Y213)", "FRAX486", inc).
0.8331295974::p_fc("ABI1(Y213)", "GDC0941", dec); 0.001::p_fc("ABI1(Y213)", "GDC0941", inc) :- p_occupancy("ABI1(Y213)", "GDC0941", dec).
0.001::p_fc("ABI1(Y213)", "GDC0941", dec); 0.8331295974::p_fc("ABI1(Y213)", "GDC0941", inc) :- p_occupancy("ABI1(Y213)", "GDC0941", inc).
0.3456752308::p_fc("ABI1(Y213)", "GDC0994", dec); 0.001::p_fc("ABI1(Y213)", "GDC0994", inc) :- p_occupancy("ABI1(Y213)", "GDC0994", dec).
0.001::p_fc("ABI1(Y213)", "GDC0994", dec); 0.3456752308::p_fc("ABI1(Y213)", "GDC0994", inc) :- p_occupancy("ABI1(Y213)", "GDC0994", inc).
0.1340212242::p_fc("ABI1(Y213)", "GF109203X", dec); 0.001::p_fc("ABI1(Y213)", "GF109203X", inc) :- p_occupancy("ABI1(Y213)", "GF109203X", dec).
0.001::p_fc("ABI1(Y213)", "GF109203X", dec); 0.1340212242::p_fc("ABI1(Y213)", "GF109203X", inc) :- p_occupancy("ABI1(Y213)", "GF109203X", inc).
0.399890003::p_fc("ABI1(Y213)", "GO6983", dec); 0.001::p_fc("ABI1(Y213)", "GO6983", inc) :- p_occupancy("ABI1(Y213)", "GO6983", dec).
0.001::p_fc("ABI1(Y213)", "GO6983", dec); 0.399890003::p_fc("ABI1(Y213)", "GO6983", inc) :- p_occupancy("ABI1(Y213)", "GO6983", inc).
0.8479509863::p_fc("ABI1(Y213)", "GSK2334470", dec); 0.001::p_fc("ABI1(Y213)", "GSK2334470", inc) :- p_occupancy("ABI1(Y213)", "GSK2334470", dec).
0.001::p_fc("ABI1(Y213)", "GSK2334470", dec); 0.8479509863::p_fc("ABI1(Y213)", "GSK2334470", inc) :- p_occupancy("ABI1(Y213)", "GSK2334470", inc).
0.5921110467::p_fc("ABI1(Y213)", "GSK690693", dec); 0.001::p_fc("ABI1(Y213)", "GSK690693", inc) :- p_occupancy("ABI1(Y213)", "GSK690693", dec).
0.001::p_fc("ABI1(Y213)", "GSK690693", dec); 0.5921110467::p_fc("ABI1(Y213)", "GSK690693", inc) :- p_occupancy("ABI1(Y213)", "GSK690693", inc).
0.4916210942::p_fc("ABI1(Y213)", "Go6976", dec); 0.001::p_fc("ABI1(Y213)", "Go6976", inc) :- p_occupancy("ABI1(Y213)", "Go6976", dec).
0.001::p_fc("ABI1(Y213)", "Go6976", dec); 0.4916210942::p_fc("ABI1(Y213)", "Go6976", inc) :- p_occupancy("ABI1(Y213)", "Go6976", inc).
0.5223316878::p_fc("ABI1(Y213)", "H89", dec); 0.001::p_fc("ABI1(Y213)", "H89", inc) :- p_occupancy("ABI1(Y213)", "H89", dec).
0.001::p_fc("ABI1(Y213)", "H89", dec); 0.5223316878::p_fc("ABI1(Y213)", "H89", inc) :- p_occupancy("ABI1(Y213)", "H89", inc).
0.8408470249::p_fc("ABI1(Y213)", "HS173", dec); 0.001::p_fc("ABI1(Y213)", "HS173", inc) :- p_occupancy("ABI1(Y213)", "HS173", dec).
0.001::p_fc("ABI1(Y213)", "HS173", dec); 0.8408470249::p_fc("ABI1(Y213)", "HS173", inc) :- p_occupancy("ABI1(Y213)", "HS173", inc).
0.2325650985::p_fc("ABI1(Y213)", "Ipatasertib", dec); 0.001::p_fc("ABI1(Y213)", "Ipatasertib", inc) :- p_occupancy("ABI1(Y213)", "Ipatasertib", dec).
0.001::p_fc("ABI1(Y213)", "Ipatasertib", dec); 0.2325650985::p_fc("ABI1(Y213)", "Ipatasertib", inc) :- p_occupancy("ABI1(Y213)", "Ipatasertib", inc).
0.0281519739::p_fc("ABI1(Y213)", "JNJ", dec); 0.001::p_fc("ABI1(Y213)", "JNJ", inc) :- p_occupancy("ABI1(Y213)", "JNJ", dec).
0.001::p_fc("ABI1(Y213)", "JNJ", dec); 0.0281519739::p_fc("ABI1(Y213)", "JNJ", inc) :- p_occupancy("ABI1(Y213)", "JNJ", inc).
0.0205338185::p_fc("ABI1(Y213)", "JNK", dec); 0.001::p_fc("ABI1(Y213)", "JNK", inc) :- p_occupancy("ABI1(Y213)", "JNK", dec).
0.001::p_fc("ABI1(Y213)", "JNK", dec); 0.0205338185::p_fc("ABI1(Y213)", "JNK", inc) :- p_occupancy("ABI1(Y213)", "JNK", inc).
0.5274286268::p_fc("ABI1(Y213)", "KD025", dec); 0.001::p_fc("ABI1(Y213)", "KD025", inc) :- p_occupancy("ABI1(Y213)", "KD025", dec).
0.001::p_fc("ABI1(Y213)", "KD025", dec); 0.5274286268::p_fc("ABI1(Y213)", "KD025", inc) :- p_occupancy("ABI1(Y213)", "KD025", inc).
0.4876426101::p_fc("ABI1(Y213)", "KN62", dec); 0.001::p_fc("ABI1(Y213)", "KN62", inc) :- p_occupancy("ABI1(Y213)", "KN62", dec).
0.001::p_fc("ABI1(Y213)", "KN62", dec); 0.4876426101::p_fc("ABI1(Y213)", "KN62", inc) :- p_occupancy("ABI1(Y213)", "KN62", inc).
0.6465161039::p_fc("ABI1(Y213)", "KN93", dec); 0.001::p_fc("ABI1(Y213)", "KN93", inc) :- p_occupancy("ABI1(Y213)", "KN93", dec).
0.001::p_fc("ABI1(Y213)", "KN93", dec); 0.6465161039::p_fc("ABI1(Y213)", "KN93", inc) :- p_occupancy("ABI1(Y213)", "KN93", inc).
0.1662268082::p_fc("ABI1(Y213)", "Ku0063794", dec); 0.001::p_fc("ABI1(Y213)", "Ku0063794", inc) :- p_occupancy("ABI1(Y213)", "Ku0063794", dec).
0.001::p_fc("ABI1(Y213)", "Ku0063794", dec); 0.1662268082::p_fc("ABI1(Y213)", "Ku0063794", inc) :- p_occupancy("ABI1(Y213)", "Ku0063794", inc).
0.1238903865::p_fc("ABI1(Y213)", "LY2090314", dec); 0.001::p_fc("ABI1(Y213)", "LY2090314", inc) :- p_occupancy("ABI1(Y213)", "LY2090314", dec).
0.001::p_fc("ABI1(Y213)", "LY2090314", dec); 0.1238903865::p_fc("ABI1(Y213)", "LY2090314", inc) :- p_occupancy("ABI1(Y213)", "LY2090314", inc).
0.7006124636::p_fc("ABI1(Y213)", "LY2584702", dec); 0.001::p_fc("ABI1(Y213)", "LY2584702", inc) :- p_occupancy("ABI1(Y213)", "LY2584702", dec).
0.001::p_fc("ABI1(Y213)", "LY2584702", dec); 0.7006124636::p_fc("ABI1(Y213)", "LY2584702", inc) :- p_occupancy("ABI1(Y213)", "LY2584702", inc).
0.9014228312::p_fc("ABI1(Y213)", "LY2835219", dec); 0.001::p_fc("ABI1(Y213)", "LY2835219", inc) :- p_occupancy("ABI1(Y213)", "LY2835219", dec).
0.001::p_fc("ABI1(Y213)", "LY2835219", dec); 0.9014228312::p_fc("ABI1(Y213)", "LY2835219", inc) :- p_occupancy("ABI1(Y213)", "LY2835219", inc).
0.4826374219::p_fc("ABI1(Y213)", "Linsitinib", dec); 0.001::p_fc("ABI1(Y213)", "Linsitinib", inc) :- p_occupancy("ABI1(Y213)", "Linsitinib", dec).
0.001::p_fc("ABI1(Y213)", "Linsitinib", dec); 0.4826374219::p_fc("ABI1(Y213)", "Linsitinib", inc) :- p_occupancy("ABI1(Y213)", "Linsitinib", inc).
0.5475466594::p_fc("ABI1(Y213)", "MK2206", dec); 0.001::p_fc("ABI1(Y213)", "MK2206", inc) :- p_occupancy("ABI1(Y213)", "MK2206", dec).
0.001::p_fc("ABI1(Y213)", "MK2206", dec); 0.5475466594::p_fc("ABI1(Y213)", "MK2206", inc) :- p_occupancy("ABI1(Y213)", "MK2206", inc).
0.6945673192::p_fc("ABI1(Y213)", "NU7441", dec); 0.001::p_fc("ABI1(Y213)", "NU7441", inc) :- p_occupancy("ABI1(Y213)", "NU7441", dec).
0.001::p_fc("ABI1(Y213)", "NU7441", dec); 0.6945673192::p_fc("ABI1(Y213)", "NU7441", inc) :- p_occupancy("ABI1(Y213)", "NU7441", inc).
0.7412554629::p_fc("ABI1(Y213)", "PD153035", dec); 0.001::p_fc("ABI1(Y213)", "PD153035", inc) :- p_occupancy("ABI1(Y213)", "PD153035", dec).
0.001::p_fc("ABI1(Y213)", "PD153035", dec); 0.7412554629::p_fc("ABI1(Y213)", "PD153035", inc) :- p_occupancy("ABI1(Y213)", "PD153035", inc).
0.9998439647::p_fc("ABI1(Y213)", "PF3758309", dec); 0.001::p_fc("ABI1(Y213)", "PF3758309", inc) :- p_occupancy("ABI1(Y213)", "PF3758309", dec).
0.001::p_fc("ABI1(Y213)", "PF3758309", dec); 0.9998439647::p_fc("ABI1(Y213)", "PF3758309", inc) :- p_occupancy("ABI1(Y213)", "PF3758309", inc).
0.7343677165::p_fc("ABI1(Y213)", "PF4708671", dec); 0.001::p_fc("ABI1(Y213)", "PF4708671", inc) :- p_occupancy("ABI1(Y213)", "PF4708671", dec).
0.001::p_fc("ABI1(Y213)", "PF4708671", dec); 0.7343677165::p_fc("ABI1(Y213)", "PF4708671", inc) :- p_occupancy("ABI1(Y213)", "PF4708671", inc).
0.9087739658::p_fc("ABI1(Y213)", "PH797804", dec); 0.001::p_fc("ABI1(Y213)", "PH797804", inc) :- p_occupancy("ABI1(Y213)", "PH797804", dec).
0.001::p_fc("ABI1(Y213)", "PH797804", dec); 0.9087739658::p_fc("ABI1(Y213)", "PH797804", inc) :- p_occupancy("ABI1(Y213)", "PH797804", inc).
0.0980993167::p_fc("ABI1(Y213)", "PIK294", dec); 0.001::p_fc("ABI1(Y213)", "PIK294", inc) :- p_occupancy("ABI1(Y213)", "PIK294", dec).
0.001::p_fc("ABI1(Y213)", "PIK294", dec); 0.0980993167::p_fc("ABI1(Y213)", "PIK294", inc) :- p_occupancy("ABI1(Y213)", "PIK294", inc).
0.4271699422::p_fc("ABI1(Y213)", "Ribociclib", dec); 0.001::p_fc("ABI1(Y213)", "Ribociclib", inc) :- p_occupancy("ABI1(Y213)", "Ribociclib", dec).
0.001::p_fc("ABI1(Y213)", "Ribociclib", dec); 0.4271699422::p_fc("ABI1(Y213)", "Ribociclib", inc) :- p_occupancy("ABI1(Y213)", "Ribociclib", inc).
0.6170434802::p_fc("ABI1(Y213)", "Ripasudil", dec); 0.001::p_fc("ABI1(Y213)", "Ripasudil", inc) :- p_occupancy("ABI1(Y213)", "Ripasudil", dec).
0.001::p_fc("ABI1(Y213)", "Ripasudil", dec); 0.6170434802::p_fc("ABI1(Y213)", "Ripasudil", inc) :- p_occupancy("ABI1(Y213)", "Ripasudil", inc).
0.0241316663::p_fc("ABI1(Y213)", "SP600125", dec); 0.001::p_fc("ABI1(Y213)", "SP600125", inc) :- p_occupancy("ABI1(Y213)", "SP600125", dec).
0.001::p_fc("ABI1(Y213)", "SP600125", dec); 0.0241316663::p_fc("ABI1(Y213)", "SP600125", inc) :- p_occupancy("ABI1(Y213)", "SP600125", inc).
0.5513775072::p_fc("ABI1(Y213)", "Selumetinib", dec); 0.001::p_fc("ABI1(Y213)", "Selumetinib", inc) :- p_occupancy("ABI1(Y213)", "Selumetinib", dec).
0.001::p_fc("ABI1(Y213)", "Selumetinib", dec); 0.5513775072::p_fc("ABI1(Y213)", "Selumetinib", inc) :- p_occupancy("ABI1(Y213)", "Selumetinib", inc).
0.3927043748::p_fc("ABI1(Y213)", "TAK715", dec); 0.001::p_fc("ABI1(Y213)", "TAK715", inc) :- p_occupancy("ABI1(Y213)", "TAK715", dec).
0.001::p_fc("ABI1(Y213)", "TAK715", dec); 0.3927043748::p_fc("ABI1(Y213)", "TAK715", inc) :- p_occupancy("ABI1(Y213)", "TAK715", inc).
0.4419067197::p_fc("ABI1(Y213)", "TBCA", dec); 0.001::p_fc("ABI1(Y213)", "TBCA", inc) :- p_occupancy("ABI1(Y213)", "TBCA", dec).
0.001::p_fc("ABI1(Y213)", "TBCA", dec); 0.4419067197::p_fc("ABI1(Y213)", "TBCA", inc) :- p_occupancy("ABI1(Y213)", "TBCA", inc).
0.7463844883::p_fc("ABI1(Y213)", "TGX221", dec); 0.001::p_fc("ABI1(Y213)", "TGX221", inc) :- p_occupancy("ABI1(Y213)", "TGX221", dec).
0.001::p_fc("ABI1(Y213)", "TGX221", dec); 0.7463844883::p_fc("ABI1(Y213)", "TGX221", inc) :- p_occupancy("ABI1(Y213)", "TGX221", inc).
0.3735180442::p_fc("ABI1(Y213)", "Tofacitinib", dec); 0.001::p_fc("ABI1(Y213)", "Tofacitinib", inc) :- p_occupancy("ABI1(Y213)", "Tofacitinib", dec).
0.001::p_fc("ABI1(Y213)", "Tofacitinib", dec); 0.3735180442::p_fc("ABI1(Y213)", "Tofacitinib", inc) :- p_occupancy("ABI1(Y213)", "Tofacitinib", inc).
0.9316442678::p_fc("ABI1(Y213)", "Torin", dec); 0.001::p_fc("ABI1(Y213)", "Torin", inc) :- p_occupancy("ABI1(Y213)", "Torin", dec).
0.001::p_fc("ABI1(Y213)", "Torin", dec); 0.9316442678::p_fc("ABI1(Y213)", "Torin", inc) :- p_occupancy("ABI1(Y213)", "Torin", inc).
0.1010392151::p_fc("ABI1(Y213)", "Trametinib", dec); 0.001::p_fc("ABI1(Y213)", "Trametinib", inc) :- p_occupancy("ABI1(Y213)", "Trametinib", dec).
0.001::p_fc("ABI1(Y213)", "Trametinib", dec); 0.1010392151::p_fc("ABI1(Y213)", "Trametinib", inc) :- p_occupancy("ABI1(Y213)", "Trametinib", inc).
0.3506966525::p_fc("ABI1(Y213)", "U73122", dec); 0.001::p_fc("ABI1(Y213)", "U73122", inc) :- p_occupancy("ABI1(Y213)", "U73122", dec).
0.001::p_fc("ABI1(Y213)", "U73122", dec); 0.3506966525::p_fc("ABI1(Y213)", "U73122", inc) :- p_occupancy("ABI1(Y213)", "U73122", inc).
0.2099217194::p_fc("ABI1(Y213)", "Ulixertinib", dec); 0.001::p_fc("ABI1(Y213)", "Ulixertinib", inc) :- p_occupancy("ABI1(Y213)", "Ulixertinib", dec).
0.001::p_fc("ABI1(Y213)", "Ulixertinib", dec); 0.2099217194::p_fc("ABI1(Y213)", "Ulixertinib", inc) :- p_occupancy("ABI1(Y213)", "Ulixertinib", inc).
0.8862308538::p_fc("ABI1(Y213)", "Vemurafenib", dec); 0.001::p_fc("ABI1(Y213)", "Vemurafenib", inc) :- p_occupancy("ABI1(Y213)", "Vemurafenib", dec).
0.001::p_fc("ABI1(Y213)", "Vemurafenib", dec); 0.8862308538::p_fc("ABI1(Y213)", "Vemurafenib", inc) :- p_occupancy("ABI1(Y213)", "Vemurafenib", inc).
0.6708639635::p_fc("ANXA2P2(Y24)", "AC220", dec); 0.001::p_fc("ANXA2P2(Y24)", "AC220", inc) :- p_occupancy("ANXA2P2(Y24)", "AC220", dec).
0.001::p_fc("ANXA2P2(Y24)", "AC220", dec); 0.6708639635::p_fc("ANXA2P2(Y24)", "AC220", inc) :- p_occupancy("ANXA2P2(Y24)", "AC220", inc).
0.0485327254::p_fc("ANXA2P2(Y24)", "AT13148", dec); 0.001::p_fc("ANXA2P2(Y24)", "AT13148", inc) :- p_occupancy("ANXA2P2(Y24)", "AT13148", dec).
0.001::p_fc("ANXA2P2(Y24)", "AT13148", dec); 0.0485327254::p_fc("ANXA2P2(Y24)", "AT13148", inc) :- p_occupancy("ANXA2P2(Y24)", "AT13148", inc).
0.103168594::p_fc("ANXA2P2(Y24)", "AZ20", dec); 0.001::p_fc("ANXA2P2(Y24)", "AZ20", inc) :- p_occupancy("ANXA2P2(Y24)", "AZ20", dec).
0.001::p_fc("ANXA2P2(Y24)", "AZ20", dec); 0.103168594::p_fc("ANXA2P2(Y24)", "AZ20", inc) :- p_occupancy("ANXA2P2(Y24)", "AZ20", inc).
0.7300299848::p_fc("ANXA2P2(Y24)", "AZD1480", dec); 0.001::p_fc("ANXA2P2(Y24)", "AZD1480", inc) :- p_occupancy("ANXA2P2(Y24)", "AZD1480", dec).
0.001::p_fc("ANXA2P2(Y24)", "AZD1480", dec); 0.7300299848::p_fc("ANXA2P2(Y24)", "AZD1480", inc) :- p_occupancy("ANXA2P2(Y24)", "AZD1480", inc).
0.3003295519::p_fc("ANXA2P2(Y24)", "AZD3759", dec); 0.001::p_fc("ANXA2P2(Y24)", "AZD3759", inc) :- p_occupancy("ANXA2P2(Y24)", "AZD3759", dec).
0.001::p_fc("ANXA2P2(Y24)", "AZD3759", dec); 0.3003295519::p_fc("ANXA2P2(Y24)", "AZD3759", inc) :- p_occupancy("ANXA2P2(Y24)", "AZD3759", inc).
0.8875095116::p_fc("ANXA2P2(Y24)", "AZD5363", dec); 0.001::p_fc("ANXA2P2(Y24)", "AZD5363", inc) :- p_occupancy("ANXA2P2(Y24)", "AZD5363", dec).
0.001::p_fc("ANXA2P2(Y24)", "AZD5363", dec); 0.8875095116::p_fc("ANXA2P2(Y24)", "AZD5363", inc) :- p_occupancy("ANXA2P2(Y24)", "AZD5363", inc).
0.7294417788::p_fc("ANXA2P2(Y24)", "AZD5438", dec); 0.001::p_fc("ANXA2P2(Y24)", "AZD5438", inc) :- p_occupancy("ANXA2P2(Y24)", "AZD5438", dec).
0.001::p_fc("ANXA2P2(Y24)", "AZD5438", dec); 0.7294417788::p_fc("ANXA2P2(Y24)", "AZD5438", inc) :- p_occupancy("ANXA2P2(Y24)", "AZD5438", inc).
0.6944501986::p_fc("ANXA2P2(Y24)", "AZD6482", dec); 0.001::p_fc("ANXA2P2(Y24)", "AZD6482", inc) :- p_occupancy("ANXA2P2(Y24)", "AZD6482", dec).
0.001::p_fc("ANXA2P2(Y24)", "AZD6482", dec); 0.6944501986::p_fc("ANXA2P2(Y24)", "AZD6482", inc) :- p_occupancy("ANXA2P2(Y24)", "AZD6482", inc).
0.3067139433::p_fc("ANXA2P2(Y24)", "AZD6738", dec); 0.001::p_fc("ANXA2P2(Y24)", "AZD6738", inc) :- p_occupancy("ANXA2P2(Y24)", "AZD6738", dec).
0.001::p_fc("ANXA2P2(Y24)", "AZD6738", dec); 0.3067139433::p_fc("ANXA2P2(Y24)", "AZD6738", inc) :- p_occupancy("ANXA2P2(Y24)", "AZD6738", inc).
0.9473819035::p_fc("ANXA2P2(Y24)", "AZD8055", dec); 0.001::p_fc("ANXA2P2(Y24)", "AZD8055", inc) :- p_occupancy("ANXA2P2(Y24)", "AZD8055", dec).
0.001::p_fc("ANXA2P2(Y24)", "AZD8055", dec); 0.9473819035::p_fc("ANXA2P2(Y24)", "AZD8055", inc) :- p_occupancy("ANXA2P2(Y24)", "AZD8055", inc).
0.2472932874::p_fc("ANXA2P2(Y24)", "Amuvatinib", dec); 0.001::p_fc("ANXA2P2(Y24)", "Amuvatinib", inc) :- p_occupancy("ANXA2P2(Y24)", "Amuvatinib", dec).
0.001::p_fc("ANXA2P2(Y24)", "Amuvatinib", dec); 0.2472932874::p_fc("ANXA2P2(Y24)", "Amuvatinib", inc) :- p_occupancy("ANXA2P2(Y24)", "Amuvatinib", inc).
0.8148565915::p_fc("ANXA2P2(Y24)", "BX912", dec); 0.001::p_fc("ANXA2P2(Y24)", "BX912", inc) :- p_occupancy("ANXA2P2(Y24)", "BX912", dec).
0.001::p_fc("ANXA2P2(Y24)", "BX912", dec); 0.8148565915::p_fc("ANXA2P2(Y24)", "BX912", inc) :- p_occupancy("ANXA2P2(Y24)", "BX912", inc).
0.4133952908::p_fc("ANXA2P2(Y24)", "Bosutinib", dec); 0.001::p_fc("ANXA2P2(Y24)", "Bosutinib", inc) :- p_occupancy("ANXA2P2(Y24)", "Bosutinib", dec).
0.001::p_fc("ANXA2P2(Y24)", "Bosutinib", dec); 0.4133952908::p_fc("ANXA2P2(Y24)", "Bosutinib", inc) :- p_occupancy("ANXA2P2(Y24)", "Bosutinib", inc).
0.9813219154::p_fc("ANXA2P2(Y24)", "CAL101", dec); 0.001::p_fc("ANXA2P2(Y24)", "CAL101", inc) :- p_occupancy("ANXA2P2(Y24)", "CAL101", dec).
0.001::p_fc("ANXA2P2(Y24)", "CAL101", dec); 0.9813219154::p_fc("ANXA2P2(Y24)", "CAL101", inc) :- p_occupancy("ANXA2P2(Y24)", "CAL101", inc).
0.8250449749::p_fc("ANXA2P2(Y24)", "CHIR99021", dec); 0.001::p_fc("ANXA2P2(Y24)", "CHIR99021", inc) :- p_occupancy("ANXA2P2(Y24)", "CHIR99021", dec).
0.001::p_fc("ANXA2P2(Y24)", "CHIR99021", dec); 0.8250449749::p_fc("ANXA2P2(Y24)", "CHIR99021", inc) :- p_occupancy("ANXA2P2(Y24)", "CHIR99021", inc).
0.1250094594::p_fc("ANXA2P2(Y24)", "CX4945", dec); 0.001::p_fc("ANXA2P2(Y24)", "CX4945", inc) :- p_occupancy("ANXA2P2(Y24)", "CX4945", dec).
0.001::p_fc("ANXA2P2(Y24)", "CX4945", dec); 0.1250094594::p_fc("ANXA2P2(Y24)", "CX4945", inc) :- p_occupancy("ANXA2P2(Y24)", "CX4945", inc).
0.7252282007::p_fc("ANXA2P2(Y24)", "DNAPK", dec); 0.001::p_fc("ANXA2P2(Y24)", "DNAPK", inc) :- p_occupancy("ANXA2P2(Y24)", "DNAPK", dec).
0.001::p_fc("ANXA2P2(Y24)", "DNAPK", dec); 0.7252282007::p_fc("ANXA2P2(Y24)", "DNAPK", inc) :- p_occupancy("ANXA2P2(Y24)", "DNAPK", inc).
0.6582790214::p_fc("ANXA2P2(Y24)", "Dabrafenib", dec); 0.001::p_fc("ANXA2P2(Y24)", "Dabrafenib", inc) :- p_occupancy("ANXA2P2(Y24)", "Dabrafenib", dec).
0.001::p_fc("ANXA2P2(Y24)", "Dabrafenib", dec); 0.6582790214::p_fc("ANXA2P2(Y24)", "Dabrafenib", inc) :- p_occupancy("ANXA2P2(Y24)", "Dabrafenib", inc).
0.5449987345::p_fc("ANXA2P2(Y24)", "Dasatinib", dec); 0.001::p_fc("ANXA2P2(Y24)", "Dasatinib", inc) :- p_occupancy("ANXA2P2(Y24)", "Dasatinib", dec).
0.001::p_fc("ANXA2P2(Y24)", "Dasatinib", dec); 0.5449987345::p_fc("ANXA2P2(Y24)", "Dasatinib", inc) :- p_occupancy("ANXA2P2(Y24)", "Dasatinib", inc).
0.592006364::p_fc("ANXA2P2(Y24)", "Edelfosine", dec); 0.001::p_fc("ANXA2P2(Y24)", "Edelfosine", inc) :- p_occupancy("ANXA2P2(Y24)", "Edelfosine", dec).
0.001::p_fc("ANXA2P2(Y24)", "Edelfosine", dec); 0.592006364::p_fc("ANXA2P2(Y24)", "Edelfosine", inc) :- p_occupancy("ANXA2P2(Y24)", "Edelfosine", inc).
0.8095462537::p_fc("ANXA2P2(Y24)", "FRAX486", dec); 0.001::p_fc("ANXA2P2(Y24)", "FRAX486", inc) :- p_occupancy("ANXA2P2(Y24)", "FRAX486", dec).
0.001::p_fc("ANXA2P2(Y24)", "FRAX486", dec); 0.8095462537::p_fc("ANXA2P2(Y24)", "FRAX486", inc) :- p_occupancy("ANXA2P2(Y24)", "FRAX486", inc).
0.9995548165::p_fc("ANXA2P2(Y24)", "GDC0941", dec); 0.001::p_fc("ANXA2P2(Y24)", "GDC0941", inc) :- p_occupancy("ANXA2P2(Y24)", "GDC0941", dec).
0.001::p_fc("ANXA2P2(Y24)", "GDC0941", dec); 0.9995548165::p_fc("ANXA2P2(Y24)", "GDC0941", inc) :- p_occupancy("ANXA2P2(Y24)", "GDC0941", inc).
0.0236052607::p_fc("ANXA2P2(Y24)", "GDC0994", dec); 0.001::p_fc("ANXA2P2(Y24)", "GDC0994", inc) :- p_occupancy("ANXA2P2(Y24)", "GDC0994", dec).
0.001::p_fc("ANXA2P2(Y24)", "GDC0994", dec); 0.0236052607::p_fc("ANXA2P2(Y24)", "GDC0994", inc) :- p_occupancy("ANXA2P2(Y24)", "GDC0994", inc).
0.5302455145::p_fc("ANXA2P2(Y24)", "GF109203X", dec); 0.001::p_fc("ANXA2P2(Y24)", "GF109203X", inc) :- p_occupancy("ANXA2P2(Y24)", "GF109203X", dec).
0.001::p_fc("ANXA2P2(Y24)", "GF109203X", dec); 0.5302455145::p_fc("ANXA2P2(Y24)", "GF109203X", inc) :- p_occupancy("ANXA2P2(Y24)", "GF109203X", inc).
0.9360843178::p_fc("ANXA2P2(Y24)", "GO6983", dec); 0.001::p_fc("ANXA2P2(Y24)", "GO6983", inc) :- p_occupancy("ANXA2P2(Y24)", "GO6983", dec).
0.001::p_fc("ANXA2P2(Y24)", "GO6983", dec); 0.9360843178::p_fc("ANXA2P2(Y24)", "GO6983", inc) :- p_occupancy("ANXA2P2(Y24)", "GO6983", inc).
0.9849745658::p_fc("ANXA2P2(Y24)", "GSK2334470", dec); 0.001::p_fc("ANXA2P2(Y24)", "GSK2334470", inc) :- p_occupancy("ANXA2P2(Y24)", "GSK2334470", dec).
0.001::p_fc("ANXA2P2(Y24)", "GSK2334470", dec); 0.9849745658::p_fc("ANXA2P2(Y24)", "GSK2334470", inc) :- p_occupancy("ANXA2P2(Y24)", "GSK2334470", inc).
0.4189229001::p_fc("ANXA2P2(Y24)", "GSK690693", dec); 0.001::p_fc("ANXA2P2(Y24)", "GSK690693", inc) :- p_occupancy("ANXA2P2(Y24)", "GSK690693", dec).
0.001::p_fc("ANXA2P2(Y24)", "GSK690693", dec); 0.4189229001::p_fc("ANXA2P2(Y24)", "GSK690693", inc) :- p_occupancy("ANXA2P2(Y24)", "GSK690693", inc).
0.450546766::p_fc("ANXA2P2(Y24)", "Go6976", dec); 0.001::p_fc("ANXA2P2(Y24)", "Go6976", inc) :- p_occupancy("ANXA2P2(Y24)", "Go6976", dec).
0.001::p_fc("ANXA2P2(Y24)", "Go6976", dec); 0.450546766::p_fc("ANXA2P2(Y24)", "Go6976", inc) :- p_occupancy("ANXA2P2(Y24)", "Go6976", inc).
0.0710312041::p_fc("ANXA2P2(Y24)", "H89", dec); 0.001::p_fc("ANXA2P2(Y24)", "H89", inc) :- p_occupancy("ANXA2P2(Y24)", "H89", dec).
0.001::p_fc("ANXA2P2(Y24)", "H89", dec); 0.0710312041::p_fc("ANXA2P2(Y24)", "H89", inc) :- p_occupancy("ANXA2P2(Y24)", "H89", inc).
0.9560644011::p_fc("ANXA2P2(Y24)", "HS173", dec); 0.001::p_fc("ANXA2P2(Y24)", "HS173", inc) :- p_occupancy("ANXA2P2(Y24)", "HS173", dec).
0.001::p_fc("ANXA2P2(Y24)", "HS173", dec); 0.9560644011::p_fc("ANXA2P2(Y24)", "HS173", inc) :- p_occupancy("ANXA2P2(Y24)", "HS173", inc).
0.9528437081::p_fc("ANXA2P2(Y24)", "Ipatasertib", dec); 0.001::p_fc("ANXA2P2(Y24)", "Ipatasertib", inc) :- p_occupancy("ANXA2P2(Y24)", "Ipatasertib", dec).
0.001::p_fc("ANXA2P2(Y24)", "Ipatasertib", dec); 0.9528437081::p_fc("ANXA2P2(Y24)", "Ipatasertib", inc) :- p_occupancy("ANXA2P2(Y24)", "Ipatasertib", inc).
0.7039791935::p_fc("ANXA2P2(Y24)", "JNJ", dec); 0.001::p_fc("ANXA2P2(Y24)", "JNJ", inc) :- p_occupancy("ANXA2P2(Y24)", "JNJ", dec).
0.001::p_fc("ANXA2P2(Y24)", "JNJ", dec); 0.7039791935::p_fc("ANXA2P2(Y24)", "JNJ", inc) :- p_occupancy("ANXA2P2(Y24)", "JNJ", inc).
0.620381515::p_fc("ANXA2P2(Y24)", "JNK", dec); 0.001::p_fc("ANXA2P2(Y24)", "JNK", inc) :- p_occupancy("ANXA2P2(Y24)", "JNK", dec).
0.001::p_fc("ANXA2P2(Y24)", "JNK", dec); 0.620381515::p_fc("ANXA2P2(Y24)", "JNK", inc) :- p_occupancy("ANXA2P2(Y24)", "JNK", inc).
0.8702005644::p_fc("ANXA2P2(Y24)", "KD025", dec); 0.001::p_fc("ANXA2P2(Y24)", "KD025", inc) :- p_occupancy("ANXA2P2(Y24)", "KD025", dec).
0.001::p_fc("ANXA2P2(Y24)", "KD025", dec); 0.8702005644::p_fc("ANXA2P2(Y24)", "KD025", inc) :- p_occupancy("ANXA2P2(Y24)", "KD025", inc).
0.5351341745::p_fc("ANXA2P2(Y24)", "KN62", dec); 0.001::p_fc("ANXA2P2(Y24)", "KN62", inc) :- p_occupancy("ANXA2P2(Y24)", "KN62", dec).
0.001::p_fc("ANXA2P2(Y24)", "KN62", dec); 0.5351341745::p_fc("ANXA2P2(Y24)", "KN62", inc) :- p_occupancy("ANXA2P2(Y24)", "KN62", inc).
0.7896996782::p_fc("ANXA2P2(Y24)", "KN93", dec); 0.001::p_fc("ANXA2P2(Y24)", "KN93", inc) :- p_occupancy("ANXA2P2(Y24)", "KN93", dec).
0.001::p_fc("ANXA2P2(Y24)", "KN93", dec); 0.7896996782::p_fc("ANXA2P2(Y24)", "KN93", inc) :- p_occupancy("ANXA2P2(Y24)", "KN93", inc).
0.2925619152::p_fc("ANXA2P2(Y24)", "Ku0063794", dec); 0.001::p_fc("ANXA2P2(Y24)", "Ku0063794", inc) :- p_occupancy("ANXA2P2(Y24)", "Ku0063794", dec).
0.001::p_fc("ANXA2P2(Y24)", "Ku0063794", dec); 0.2925619152::p_fc("ANXA2P2(Y24)", "Ku0063794", inc) :- p_occupancy("ANXA2P2(Y24)", "Ku0063794", inc).
0.9701451762::p_fc("ANXA2P2(Y24)", "LY2090314", dec); 0.001::p_fc("ANXA2P2(Y24)", "LY2090314", inc) :- p_occupancy("ANXA2P2(Y24)", "LY2090314", dec).
0.001::p_fc("ANXA2P2(Y24)", "LY2090314", dec); 0.9701451762::p_fc("ANXA2P2(Y24)", "LY2090314", inc) :- p_occupancy("ANXA2P2(Y24)", "LY2090314", inc).
0.2439312986::p_fc("ANXA2P2(Y24)", "LY2584702", dec); 0.001::p_fc("ANXA2P2(Y24)", "LY2584702", inc) :- p_occupancy("ANXA2P2(Y24)", "LY2584702", dec).
0.001::p_fc("ANXA2P2(Y24)", "LY2584702", dec); 0.2439312986::p_fc("ANXA2P2(Y24)", "LY2584702", inc) :- p_occupancy("ANXA2P2(Y24)", "LY2584702", inc).
0.0698407741::p_fc("ANXA2P2(Y24)", "LY2835219", dec); 0.001::p_fc("ANXA2P2(Y24)", "LY2835219", inc) :- p_occupancy("ANXA2P2(Y24)", "LY2835219", dec).
0.001::p_fc("ANXA2P2(Y24)", "LY2835219", dec); 0.0698407741::p_fc("ANXA2P2(Y24)", "LY2835219", inc) :- p_occupancy("ANXA2P2(Y24)", "LY2835219", inc).
0.5780912153::p_fc("ANXA2P2(Y24)", "Linsitinib", dec); 0.001::p_fc("ANXA2P2(Y24)", "Linsitinib", inc) :- p_occupancy("ANXA2P2(Y24)", "Linsitinib", dec).
0.001::p_fc("ANXA2P2(Y24)", "Linsitinib", dec); 0.5780912153::p_fc("ANXA2P2(Y24)", "Linsitinib", inc) :- p_occupancy("ANXA2P2(Y24)", "Linsitinib", inc).
0.3999836056::p_fc("ANXA2P2(Y24)", "MK2206", dec); 0.001::p_fc("ANXA2P2(Y24)", "MK2206", inc) :- p_occupancy("ANXA2P2(Y24)", "MK2206", dec).
0.001::p_fc("ANXA2P2(Y24)", "MK2206", dec); 0.3999836056::p_fc("ANXA2P2(Y24)", "MK2206", inc) :- p_occupancy("ANXA2P2(Y24)", "MK2206", inc).
0.1284761209::p_fc("ANXA2P2(Y24)", "NU7441", dec); 0.001::p_fc("ANXA2P2(Y24)", "NU7441", inc) :- p_occupancy("ANXA2P2(Y24)", "NU7441", dec).
0.001::p_fc("ANXA2P2(Y24)", "NU7441", dec); 0.1284761209::p_fc("ANXA2P2(Y24)", "NU7441", inc) :- p_occupancy("ANXA2P2(Y24)", "NU7441", inc).
0.4607539955::p_fc("ANXA2P2(Y24)", "PD153035", dec); 0.001::p_fc("ANXA2P2(Y24)", "PD153035", inc) :- p_occupancy("ANXA2P2(Y24)", "PD153035", dec).
0.001::p_fc("ANXA2P2(Y24)", "PD153035", dec); 0.4607539955::p_fc("ANXA2P2(Y24)", "PD153035", inc) :- p_occupancy("ANXA2P2(Y24)", "PD153035", inc).
0.3868412024::p_fc("ANXA2P2(Y24)", "PF3758309", dec); 0.001::p_fc("ANXA2P2(Y24)", "PF3758309", inc) :- p_occupancy("ANXA2P2(Y24)", "PF3758309", dec).
0.001::p_fc("ANXA2P2(Y24)", "PF3758309", dec); 0.3868412024::p_fc("ANXA2P2(Y24)", "PF3758309", inc) :- p_occupancy("ANXA2P2(Y24)", "PF3758309", inc).
0.6899317998::p_fc("ANXA2P2(Y24)", "PF4708671", dec); 0.001::p_fc("ANXA2P2(Y24)", "PF4708671", inc) :- p_occupancy("ANXA2P2(Y24)", "PF4708671", dec).
0.001::p_fc("ANXA2P2(Y24)", "PF4708671", dec); 0.6899317998::p_fc("ANXA2P2(Y24)", "PF4708671", inc) :- p_occupancy("ANXA2P2(Y24)", "PF4708671", inc).
0.3773575727::p_fc("ANXA2P2(Y24)", "PH797804", dec); 0.001::p_fc("ANXA2P2(Y24)", "PH797804", inc) :- p_occupancy("ANXA2P2(Y24)", "PH797804", dec).
0.001::p_fc("ANXA2P2(Y24)", "PH797804", dec); 0.3773575727::p_fc("ANXA2P2(Y24)", "PH797804", inc) :- p_occupancy("ANXA2P2(Y24)", "PH797804", inc).
0.8621276067::p_fc("ANXA2P2(Y24)", "PIK294", dec); 0.001::p_fc("ANXA2P2(Y24)", "PIK294", inc) :- p_occupancy("ANXA2P2(Y24)", "PIK294", dec).
0.001::p_fc("ANXA2P2(Y24)", "PIK294", dec); 0.8621276067::p_fc("ANXA2P2(Y24)", "PIK294", inc) :- p_occupancy("ANXA2P2(Y24)", "PIK294", inc).
0.2222023844::p_fc("ANXA2P2(Y24)", "Ribociclib", dec); 0.001::p_fc("ANXA2P2(Y24)", "Ribociclib", inc) :- p_occupancy("ANXA2P2(Y24)", "Ribociclib", dec).
0.001::p_fc("ANXA2P2(Y24)", "Ribociclib", dec); 0.2222023844::p_fc("ANXA2P2(Y24)", "Ribociclib", inc) :- p_occupancy("ANXA2P2(Y24)", "Ribociclib", inc).
0.5759429684::p_fc("ANXA2P2(Y24)", "Ripasudil", dec); 0.001::p_fc("ANXA2P2(Y24)", "Ripasudil", inc) :- p_occupancy("ANXA2P2(Y24)", "Ripasudil", dec).
0.001::p_fc("ANXA2P2(Y24)", "Ripasudil", dec); 0.5759429684::p_fc("ANXA2P2(Y24)", "Ripasudil", inc) :- p_occupancy("ANXA2P2(Y24)", "Ripasudil", inc).
0.4607959793::p_fc("ANXA2P2(Y24)", "SP600125", dec); 0.001::p_fc("ANXA2P2(Y24)", "SP600125", inc) :- p_occupancy("ANXA2P2(Y24)", "SP600125", dec).
0.001::p_fc("ANXA2P2(Y24)", "SP600125", dec); 0.4607959793::p_fc("ANXA2P2(Y24)", "SP600125", inc) :- p_occupancy("ANXA2P2(Y24)", "SP600125", inc).
0.5950838304::p_fc("ANXA2P2(Y24)", "Selumetinib", dec); 0.001::p_fc("ANXA2P2(Y24)", "Selumetinib", inc) :- p_occupancy("ANXA2P2(Y24)", "Selumetinib", dec).
0.001::p_fc("ANXA2P2(Y24)", "Selumetinib", dec); 0.5950838304::p_fc("ANXA2P2(Y24)", "Selumetinib", inc) :- p_occupancy("ANXA2P2(Y24)", "Selumetinib", inc).
0.8238005307::p_fc("ANXA2P2(Y24)", "TAK715", dec); 0.001::p_fc("ANXA2P2(Y24)", "TAK715", inc) :- p_occupancy("ANXA2P2(Y24)", "TAK715", dec).
0.001::p_fc("ANXA2P2(Y24)", "TAK715", dec); 0.8238005307::p_fc("ANXA2P2(Y24)", "TAK715", inc) :- p_occupancy("ANXA2P2(Y24)", "TAK715", inc).
0.6792129804::p_fc("ANXA2P2(Y24)", "TBCA", dec); 0.001::p_fc("ANXA2P2(Y24)", "TBCA", inc) :- p_occupancy("ANXA2P2(Y24)", "TBCA", dec).
0.001::p_fc("ANXA2P2(Y24)", "TBCA", dec); 0.6792129804::p_fc("ANXA2P2(Y24)", "TBCA", inc) :- p_occupancy("ANXA2P2(Y24)", "TBCA", inc).
0.2456033849::p_fc("ANXA2P2(Y24)", "TGX221", dec); 0.001::p_fc("ANXA2P2(Y24)", "TGX221", inc) :- p_occupancy("ANXA2P2(Y24)", "TGX221", dec).
0.001::p_fc("ANXA2P2(Y24)", "TGX221", dec); 0.2456033849::p_fc("ANXA2P2(Y24)", "TGX221", inc) :- p_occupancy("ANXA2P2(Y24)", "TGX221", inc).
0.597948259::p_fc("ANXA2P2(Y24)", "Tofacitinib", dec); 0.001::p_fc("ANXA2P2(Y24)", "Tofacitinib", inc) :- p_occupancy("ANXA2P2(Y24)", "Tofacitinib", dec).
0.001::p_fc("ANXA2P2(Y24)", "Tofacitinib", dec); 0.597948259::p_fc("ANXA2P2(Y24)", "Tofacitinib", inc) :- p_occupancy("ANXA2P2(Y24)", "Tofacitinib", inc).
0.0966533858::p_fc("ANXA2P2(Y24)", "Torin", dec); 0.001::p_fc("ANXA2P2(Y24)", "Torin", inc) :- p_occupancy("ANXA2P2(Y24)", "Torin", dec).
0.001::p_fc("ANXA2P2(Y24)", "Torin", dec); 0.0966533858::p_fc("ANXA2P2(Y24)", "Torin", inc) :- p_occupancy("ANXA2P2(Y24)", "Torin", inc).
0.7242809283::p_fc("ANXA2P2(Y24)", "Trametinib", dec); 0.001::p_fc("ANXA2P2(Y24)", "Trametinib", inc) :- p_occupancy("ANXA2P2(Y24)", "Trametinib", dec).
0.001::p_fc("ANXA2P2(Y24)", "Trametinib", dec); 0.7242809283::p_fc("ANXA2P2(Y24)", "Trametinib", inc) :- p_occupancy("ANXA2P2(Y24)", "Trametinib", inc).
0.7904243935::p_fc("ANXA2P2(Y24)", "U73122", dec); 0.001::p_fc("ANXA2P2(Y24)", "U73122", inc) :- p_occupancy("ANXA2P2(Y24)", "U73122", dec).
0.001::p_fc("ANXA2P2(Y24)", "U73122", dec); 0.7904243935::p_fc("ANXA2P2(Y24)", "U73122", inc) :- p_occupancy("ANXA2P2(Y24)", "U73122", inc).
0.2795807369::p_fc("ANXA2P2(Y24)", "Ulixertinib", dec); 0.001::p_fc("ANXA2P2(Y24)", "Ulixertinib", inc) :- p_occupancy("ANXA2P2(Y24)", "Ulixertinib", dec).
0.001::p_fc("ANXA2P2(Y24)", "Ulixertinib", dec); 0.2795807369::p_fc("ANXA2P2(Y24)", "Ulixertinib", inc) :- p_occupancy("ANXA2P2(Y24)", "Ulixertinib", inc).
0.5193100867::p_fc("ANXA2P2(Y24)", "Vemurafenib", dec); 0.001::p_fc("ANXA2P2(Y24)", "Vemurafenib", inc) :- p_occupancy("ANXA2P2(Y24)", "Vemurafenib", dec).
0.001::p_fc("ANXA2P2(Y24)", "Vemurafenib", dec); 0.5193100867::p_fc("ANXA2P2(Y24)", "Vemurafenib", inc) :- p_occupancy("ANXA2P2(Y24)", "Vemurafenib", inc).
0.8477814297::p_fc("ATF1(S198)", "AC220", dec); 0.001::p_fc("ATF1(S198)", "AC220", inc) :- p_occupancy("ATF1(S198)", "AC220", dec).
0.001::p_fc("ATF1(S198)", "AC220", dec); 0.8477814297::p_fc("ATF1(S198)", "AC220", inc) :- p_occupancy("ATF1(S198)", "AC220", inc).
0.209350352::p_fc("ATF1(S198)", "AT13148", dec); 0.001::p_fc("ATF1(S198)", "AT13148", inc) :- p_occupancy("ATF1(S198)", "AT13148", dec).
0.001::p_fc("ATF1(S198)", "AT13148", dec); 0.209350352::p_fc("ATF1(S198)", "AT13148", inc) :- p_occupancy("ATF1(S198)", "AT13148", inc).
0.8446253759::p_fc("ATF1(S198)", "AZ20", dec); 0.001::p_fc("ATF1(S198)", "AZ20", inc) :- p_occupancy("ATF1(S198)", "AZ20", dec).
0.001::p_fc("ATF1(S198)", "AZ20", dec); 0.8446253759::p_fc("ATF1(S198)", "AZ20", inc) :- p_occupancy("ATF1(S198)", "AZ20", inc).
0.0328401275::p_fc("ATF1(S198)", "AZD1480", dec); 0.001::p_fc("ATF1(S198)", "AZD1480", inc) :- p_occupancy("ATF1(S198)", "AZD1480", dec).
0.001::p_fc("ATF1(S198)", "AZD1480", dec); 0.0328401275::p_fc("ATF1(S198)", "AZD1480", inc) :- p_occupancy("ATF1(S198)", "AZD1480", inc).
0.2953405174::p_fc("ATF1(S198)", "AZD3759", dec); 0.001::p_fc("ATF1(S198)", "AZD3759", inc) :- p_occupancy("ATF1(S198)", "AZD3759", dec).
0.001::p_fc("ATF1(S198)", "AZD3759", dec); 0.2953405174::p_fc("ATF1(S198)", "AZD3759", inc) :- p_occupancy("ATF1(S198)", "AZD3759", inc).
0.1368652487::p_fc("ATF1(S198)", "AZD5363", dec); 0.001::p_fc("ATF1(S198)", "AZD5363", inc) :- p_occupancy("ATF1(S198)", "AZD5363", dec).
0.001::p_fc("ATF1(S198)", "AZD5363", dec); 0.1368652487::p_fc("ATF1(S198)", "AZD5363", inc) :- p_occupancy("ATF1(S198)", "AZD5363", inc).
0.999546399::p_fc("ATF1(S198)", "AZD5438", dec); 0.001::p_fc("ATF1(S198)", "AZD5438", inc) :- p_occupancy("ATF1(S198)", "AZD5438", dec).
0.001::p_fc("ATF1(S198)", "AZD5438", dec); 0.999546399::p_fc("ATF1(S198)", "AZD5438", inc) :- p_occupancy("ATF1(S198)", "AZD5438", inc).
0.5331517678::p_fc("ATF1(S198)", "AZD6482", dec); 0.001::p_fc("ATF1(S198)", "AZD6482", inc) :- p_occupancy("ATF1(S198)", "AZD6482", dec).
0.001::p_fc("ATF1(S198)", "AZD6482", dec); 0.5331517678::p_fc("ATF1(S198)", "AZD6482", inc) :- p_occupancy("ATF1(S198)", "AZD6482", inc).
0.8731601121::p_fc("ATF1(S198)", "AZD6738", dec); 0.001::p_fc("ATF1(S198)", "AZD6738", inc) :- p_occupancy("ATF1(S198)", "AZD6738", dec).
0.001::p_fc("ATF1(S198)", "AZD6738", dec); 0.8731601121::p_fc("ATF1(S198)", "AZD6738", inc) :- p_occupancy("ATF1(S198)", "AZD6738", inc).
0.6288404293::p_fc("ATF1(S198)", "AZD8055", dec); 0.001::p_fc("ATF1(S198)", "AZD8055", inc) :- p_occupancy("ATF1(S198)", "AZD8055", dec).
0.001::p_fc("ATF1(S198)", "AZD8055", dec); 0.6288404293::p_fc("ATF1(S198)", "AZD8055", inc) :- p_occupancy("ATF1(S198)", "AZD8055", inc).
0.4769116467::p_fc("ATF1(S198)", "Amuvatinib", dec); 0.001::p_fc("ATF1(S198)", "Amuvatinib", inc) :- p_occupancy("ATF1(S198)", "Amuvatinib", dec).
0.001::p_fc("ATF1(S198)", "Amuvatinib", dec); 0.4769116467::p_fc("ATF1(S198)", "Amuvatinib", inc) :- p_occupancy("ATF1(S198)", "Amuvatinib", inc).
0.6603090855::p_fc("ATF1(S198)", "BX912", dec); 0.001::p_fc("ATF1(S198)", "BX912", inc) :- p_occupancy("ATF1(S198)", "BX912", dec).
0.001::p_fc("ATF1(S198)", "BX912", dec); 0.6603090855::p_fc("ATF1(S198)", "BX912", inc) :- p_occupancy("ATF1(S198)", "BX912", inc).
0.1226235346::p_fc("ATF1(S198)", "Bosutinib", dec); 0.001::p_fc("ATF1(S198)", "Bosutinib", inc) :- p_occupancy("ATF1(S198)", "Bosutinib", dec).
0.001::p_fc("ATF1(S198)", "Bosutinib", dec); 0.1226235346::p_fc("ATF1(S198)", "Bosutinib", inc) :- p_occupancy("ATF1(S198)", "Bosutinib", inc).
0.0074486344::p_fc("ATF1(S198)", "CAL101", dec); 0.001::p_fc("ATF1(S198)", "CAL101", inc) :- p_occupancy("ATF1(S198)", "CAL101", dec).
0.001::p_fc("ATF1(S198)", "CAL101", dec); 0.0074486344::p_fc("ATF1(S198)", "CAL101", inc) :- p_occupancy("ATF1(S198)", "CAL101", inc).
0.0574942841::p_fc("ATF1(S198)", "CHIR99021", dec); 0.001::p_fc("ATF1(S198)", "CHIR99021", inc) :- p_occupancy("ATF1(S198)", "CHIR99021", dec).
0.001::p_fc("ATF1(S198)", "CHIR99021", dec); 0.0574942841::p_fc("ATF1(S198)", "CHIR99021", inc) :- p_occupancy("ATF1(S198)", "CHIR99021", inc).
0.6444663693::p_fc("ATF1(S198)", "CX4945", dec); 0.001::p_fc("ATF1(S198)", "CX4945", inc) :- p_occupancy("ATF1(S198)", "CX4945", dec).
0.001::p_fc("ATF1(S198)", "CX4945", dec); 0.6444663693::p_fc("ATF1(S198)", "CX4945", inc) :- p_occupancy("ATF1(S198)", "CX4945", inc).
0.1900757591::p_fc("ATF1(S198)", "DNAPK", dec); 0.001::p_fc("ATF1(S198)", "DNAPK", inc) :- p_occupancy("ATF1(S198)", "DNAPK", dec).
0.001::p_fc("ATF1(S198)", "DNAPK", dec); 0.1900757591::p_fc("ATF1(S198)", "DNAPK", inc) :- p_occupancy("ATF1(S198)", "DNAPK", inc).
0.2400460208::p_fc("ATF1(S198)", "Dabrafenib", dec); 0.001::p_fc("ATF1(S198)", "Dabrafenib", inc) :- p_occupancy("ATF1(S198)", "Dabrafenib", dec).
0.001::p_fc("ATF1(S198)", "Dabrafenib", dec); 0.2400460208::p_fc("ATF1(S198)", "Dabrafenib", inc) :- p_occupancy("ATF1(S198)", "Dabrafenib", inc).
0.265877825::p_fc("ATF1(S198)", "Dasatinib", dec); 0.001::p_fc("ATF1(S198)", "Dasatinib", inc) :- p_occupancy("ATF1(S198)", "Dasatinib", dec).
0.001::p_fc("ATF1(S198)", "Dasatinib", dec); 0.265877825::p_fc("ATF1(S198)", "Dasatinib", inc) :- p_occupancy("ATF1(S198)", "Dasatinib", inc).
0.1974052277::p_fc("ATF1(S198)", "Edelfosine", dec); 0.001::p_fc("ATF1(S198)", "Edelfosine", inc) :- p_occupancy("ATF1(S198)", "Edelfosine", dec).
0.001::p_fc("ATF1(S198)", "Edelfosine", dec); 0.1974052277::p_fc("ATF1(S198)", "Edelfosine", inc) :- p_occupancy("ATF1(S198)", "Edelfosine", inc).
0.4293309169::p_fc("ATF1(S198)", "FRAX486", dec); 0.001::p_fc("ATF1(S198)", "FRAX486", inc) :- p_occupancy("ATF1(S198)", "FRAX486", dec).
0.001::p_fc("ATF1(S198)", "FRAX486", dec); 0.4293309169::p_fc("ATF1(S198)", "FRAX486", inc) :- p_occupancy("ATF1(S198)", "FRAX486", inc).
0.0235445719::p_fc("ATF1(S198)", "GDC0941", dec); 0.001::p_fc("ATF1(S198)", "GDC0941", inc) :- p_occupancy("ATF1(S198)", "GDC0941", dec).
0.001::p_fc("ATF1(S198)", "GDC0941", dec); 0.0235445719::p_fc("ATF1(S198)", "GDC0941", inc) :- p_occupancy("ATF1(S198)", "GDC0941", inc).
0.1783995703::p_fc("ATF1(S198)", "GDC0994", dec); 0.001::p_fc("ATF1(S198)", "GDC0994", inc) :- p_occupancy("ATF1(S198)", "GDC0994", dec).
0.001::p_fc("ATF1(S198)", "GDC0994", dec); 0.1783995703::p_fc("ATF1(S198)", "GDC0994", inc) :- p_occupancy("ATF1(S198)", "GDC0994", inc).
0.0781070232::p_fc("ATF1(S198)", "GF109203X", dec); 0.001::p_fc("ATF1(S198)", "GF109203X", inc) :- p_occupancy("ATF1(S198)", "GF109203X", dec).
0.001::p_fc("ATF1(S198)", "GF109203X", dec); 0.0781070232::p_fc("ATF1(S198)", "GF109203X", inc) :- p_occupancy("ATF1(S198)", "GF109203X", inc).
0.4468561892::p_fc("ATF1(S198)", "GO6983", dec); 0.001::p_fc("ATF1(S198)", "GO6983", inc) :- p_occupancy("ATF1(S198)", "GO6983", dec).
0.001::p_fc("ATF1(S198)", "GO6983", dec); 0.4468561892::p_fc("ATF1(S198)", "GO6983", inc) :- p_occupancy("ATF1(S198)", "GO6983", inc).
0.0421202014::p_fc("ATF1(S198)", "GSK2334470", dec); 0.001::p_fc("ATF1(S198)", "GSK2334470", inc) :- p_occupancy("ATF1(S198)", "GSK2334470", dec).
0.001::p_fc("ATF1(S198)", "GSK2334470", dec); 0.0421202014::p_fc("ATF1(S198)", "GSK2334470", inc) :- p_occupancy("ATF1(S198)", "GSK2334470", inc).
0.5131360216::p_fc("ATF1(S198)", "GSK690693", dec); 0.001::p_fc("ATF1(S198)", "GSK690693", inc) :- p_occupancy("ATF1(S198)", "GSK690693", dec).
0.001::p_fc("ATF1(S198)", "GSK690693", dec); 0.5131360216::p_fc("ATF1(S198)", "GSK690693", inc) :- p_occupancy("ATF1(S198)", "GSK690693", inc).
0.444357394::p_fc("ATF1(S198)", "Go6976", dec); 0.001::p_fc("ATF1(S198)", "Go6976", inc) :- p_occupancy("ATF1(S198)", "Go6976", dec).
0.001::p_fc("ATF1(S198)", "Go6976", dec); 0.444357394::p_fc("ATF1(S198)", "Go6976", inc) :- p_occupancy("ATF1(S198)", "Go6976", inc).
0.2079661544::p_fc("ATF1(S198)", "H89", dec); 0.001::p_fc("ATF1(S198)", "H89", inc) :- p_occupancy("ATF1(S198)", "H89", dec).
0.001::p_fc("ATF1(S198)", "H89", dec); 0.2079661544::p_fc("ATF1(S198)", "H89", inc) :- p_occupancy("ATF1(S198)", "H89", inc).
0.8458857758::p_fc("ATF1(S198)", "HS173", dec); 0.001::p_fc("ATF1(S198)", "HS173", inc) :- p_occupancy("ATF1(S198)", "HS173", dec).
0.001::p_fc("ATF1(S198)", "HS173", dec); 0.8458857758::p_fc("ATF1(S198)", "HS173", inc) :- p_occupancy("ATF1(S198)", "HS173", inc).
0.2230284139::p_fc("ATF1(S198)", "Ipatasertib", dec); 0.001::p_fc("ATF1(S198)", "Ipatasertib", inc) :- p_occupancy("ATF1(S198)", "Ipatasertib", dec).
0.001::p_fc("ATF1(S198)", "Ipatasertib", dec); 0.2230284139::p_fc("ATF1(S198)", "Ipatasertib", inc) :- p_occupancy("ATF1(S198)", "Ipatasertib", inc).
0.266008571::p_fc("ATF1(S198)", "JNJ", dec); 0.001::p_fc("ATF1(S198)", "JNJ", inc) :- p_occupancy("ATF1(S198)", "JNJ", dec).
0.001::p_fc("ATF1(S198)", "JNJ", dec); 0.266008571::p_fc("ATF1(S198)", "JNJ", inc) :- p_occupancy("ATF1(S198)", "JNJ", inc).
0.7968448331::p_fc("ATF1(S198)", "JNK", dec); 0.001::p_fc("ATF1(S198)", "JNK", inc) :- p_occupancy("ATF1(S198)", "JNK", dec).
0.001::p_fc("ATF1(S198)", "JNK", dec); 0.7968448331::p_fc("ATF1(S198)", "JNK", inc) :- p_occupancy("ATF1(S198)", "JNK", inc).
0.9607592174::p_fc("ATF1(S198)", "KD025", dec); 0.001::p_fc("ATF1(S198)", "KD025", inc) :- p_occupancy("ATF1(S198)", "KD025", dec).
0.001::p_fc("ATF1(S198)", "KD025", dec); 0.9607592174::p_fc("ATF1(S198)", "KD025", inc) :- p_occupancy("ATF1(S198)", "KD025", inc).
0.6571914081::p_fc("ATF1(S198)", "KN62", dec); 0.001::p_fc("ATF1(S198)", "KN62", inc) :- p_occupancy("ATF1(S198)", "KN62", dec).
0.001::p_fc("ATF1(S198)", "KN62", dec); 0.6571914081::p_fc("ATF1(S198)", "KN62", inc) :- p_occupancy("ATF1(S198)", "KN62", inc).
0.0097230458::p_fc("ATF1(S198)", "KN93", dec); 0.001::p_fc("ATF1(S198)", "KN93", inc) :- p_occupancy("ATF1(S198)", "KN93", dec).
0.001::p_fc("ATF1(S198)", "KN93", dec); 0.0097230458::p_fc("ATF1(S198)", "KN93", inc) :- p_occupancy("ATF1(S198)", "KN93", inc).
0.7843080674::p_fc("ATF1(S198)", "Ku0063794", dec); 0.001::p_fc("ATF1(S198)", "Ku0063794", inc) :- p_occupancy("ATF1(S198)", "Ku0063794", dec).
0.001::p_fc("ATF1(S198)", "Ku0063794", dec); 0.7843080674::p_fc("ATF1(S198)", "Ku0063794", inc) :- p_occupancy("ATF1(S198)", "Ku0063794", inc).
0.7197152647::p_fc("ATF1(S198)", "LY2090314", dec); 0.001::p_fc("ATF1(S198)", "LY2090314", inc) :- p_occupancy("ATF1(S198)", "LY2090314", dec).
0.001::p_fc("ATF1(S198)", "LY2090314", dec); 0.7197152647::p_fc("ATF1(S198)", "LY2090314", inc) :- p_occupancy("ATF1(S198)", "LY2090314", inc).
0.3333333498::p_fc("ATF1(S198)", "LY2584702", dec); 0.001::p_fc("ATF1(S198)", "LY2584702", inc) :- p_occupancy("ATF1(S198)", "LY2584702", dec).
0.001::p_fc("ATF1(S198)", "LY2584702", dec); 0.3333333498::p_fc("ATF1(S198)", "LY2584702", inc) :- p_occupancy("ATF1(S198)", "LY2584702", inc).
0.9234832833::p_fc("ATF1(S198)", "LY2835219", dec); 0.001::p_fc("ATF1(S198)", "LY2835219", inc) :- p_occupancy("ATF1(S198)", "LY2835219", dec).
0.001::p_fc("ATF1(S198)", "LY2835219", dec); 0.9234832833::p_fc("ATF1(S198)", "LY2835219", inc) :- p_occupancy("ATF1(S198)", "LY2835219", inc).
0.8560920441::p_fc("ATF1(S198)", "Linsitinib", dec); 0.001::p_fc("ATF1(S198)", "Linsitinib", inc) :- p_occupancy("ATF1(S198)", "Linsitinib", dec).
0.001::p_fc("ATF1(S198)", "Linsitinib", dec); 0.8560920441::p_fc("ATF1(S198)", "Linsitinib", inc) :- p_occupancy("ATF1(S198)", "Linsitinib", inc).
0.5254654237::p_fc("ATF1(S198)", "MK2206", dec); 0.001::p_fc("ATF1(S198)", "MK2206", inc) :- p_occupancy("ATF1(S198)", "MK2206", dec).
0.001::p_fc("ATF1(S198)", "MK2206", dec); 0.5254654237::p_fc("ATF1(S198)", "MK2206", inc) :- p_occupancy("ATF1(S198)", "MK2206", inc).
0.1195450238::p_fc("ATF1(S198)", "NU7441", dec); 0.001::p_fc("ATF1(S198)", "NU7441", inc) :- p_occupancy("ATF1(S198)", "NU7441", dec).
0.001::p_fc("ATF1(S198)", "NU7441", dec); 0.1195450238::p_fc("ATF1(S198)", "NU7441", inc) :- p_occupancy("ATF1(S198)", "NU7441", inc).
0.9724352937::p_fc("ATF1(S198)", "PD153035", dec); 0.001::p_fc("ATF1(S198)", "PD153035", inc) :- p_occupancy("ATF1(S198)", "PD153035", dec).
0.001::p_fc("ATF1(S198)", "PD153035", dec); 0.9724352937::p_fc("ATF1(S198)", "PD153035", inc) :- p_occupancy("ATF1(S198)", "PD153035", inc).
0.9104767922::p_fc("ATF1(S198)", "PF3758309", dec); 0.001::p_fc("ATF1(S198)", "PF3758309", inc) :- p_occupancy("ATF1(S198)", "PF3758309", dec).
0.001::p_fc("ATF1(S198)", "PF3758309", dec); 0.9104767922::p_fc("ATF1(S198)", "PF3758309", inc) :- p_occupancy("ATF1(S198)", "PF3758309", inc).
0.0629331734::p_fc("ATF1(S198)", "PF4708671", dec); 0.001::p_fc("ATF1(S198)", "PF4708671", inc) :- p_occupancy("ATF1(S198)", "PF4708671", dec).
0.001::p_fc("ATF1(S198)", "PF4708671", dec); 0.0629331734::p_fc("ATF1(S198)", "PF4708671", inc) :- p_occupancy("ATF1(S198)", "PF4708671", inc).
0.0854195182::p_fc("ATF1(S198)", "PH797804", dec); 0.001::p_fc("ATF1(S198)", "PH797804", inc) :- p_occupancy("ATF1(S198)", "PH797804", dec).
0.001::p_fc("ATF1(S198)", "PH797804", dec); 0.0854195182::p_fc("ATF1(S198)", "PH797804", inc) :- p_occupancy("ATF1(S198)", "PH797804", inc).
0.4923668117::p_fc("ATF1(S198)", "PIK294", dec); 0.001::p_fc("ATF1(S198)", "PIK294", inc) :- p_occupancy("ATF1(S198)", "PIK294", dec).
0.001::p_fc("ATF1(S198)", "PIK294", dec); 0.4923668117::p_fc("ATF1(S198)", "PIK294", inc) :- p_occupancy("ATF1(S198)", "PIK294", inc).
0.4175972535::p_fc("ATF1(S198)", "Ribociclib", dec); 0.001::p_fc("ATF1(S198)", "Ribociclib", inc) :- p_occupancy("ATF1(S198)", "Ribociclib", dec).
0.001::p_fc("ATF1(S198)", "Ribociclib", dec); 0.4175972535::p_fc("ATF1(S198)", "Ribociclib", inc) :- p_occupancy("ATF1(S198)", "Ribociclib", inc).
0.3751544669::p_fc("ATF1(S198)", "Ripasudil", dec); 0.001::p_fc("ATF1(S198)", "Ripasudil", inc) :- p_occupancy("ATF1(S198)", "Ripasudil", dec).
0.001::p_fc("ATF1(S198)", "Ripasudil", dec); 0.3751544669::p_fc("ATF1(S198)", "Ripasudil", inc) :- p_occupancy("ATF1(S198)", "Ripasudil", inc).
0.1230246015::p_fc("ATF1(S198)", "SP600125", dec); 0.001::p_fc("ATF1(S198)", "SP600125", inc) :- p_occupancy("ATF1(S198)", "SP600125", dec).
0.001::p_fc("ATF1(S198)", "SP600125", dec); 0.1230246015::p_fc("ATF1(S198)", "SP600125", inc) :- p_occupancy("ATF1(S198)", "SP600125", inc).
0.2365474685::p_fc("ATF1(S198)", "Selumetinib", dec); 0.001::p_fc("ATF1(S198)", "Selumetinib", inc) :- p_occupancy("ATF1(S198)", "Selumetinib", dec).
0.001::p_fc("ATF1(S198)", "Selumetinib", dec); 0.2365474685::p_fc("ATF1(S198)", "Selumetinib", inc) :- p_occupancy("ATF1(S198)", "Selumetinib", inc).
0.4658892067::p_fc("ATF1(S198)", "TAK715", dec); 0.001::p_fc("ATF1(S198)", "TAK715", inc) :- p_occupancy("ATF1(S198)", "TAK715", dec).
0.001::p_fc("ATF1(S198)", "TAK715", dec); 0.4658892067::p_fc("ATF1(S198)", "TAK715", inc) :- p_occupancy("ATF1(S198)", "TAK715", inc).
0.1977438803::p_fc("ATF1(S198)", "TBCA", dec); 0.001::p_fc("ATF1(S198)", "TBCA", inc) :- p_occupancy("ATF1(S198)", "TBCA", dec).
0.001::p_fc("ATF1(S198)", "TBCA", dec); 0.1977438803::p_fc("ATF1(S198)", "TBCA", inc) :- p_occupancy("ATF1(S198)", "TBCA", inc).
0.338179585::p_fc("ATF1(S198)", "TGX221", dec); 0.001::p_fc("ATF1(S198)", "TGX221", inc) :- p_occupancy("ATF1(S198)", "TGX221", dec).
0.001::p_fc("ATF1(S198)", "TGX221", dec); 0.338179585::p_fc("ATF1(S198)", "TGX221", inc) :- p_occupancy("ATF1(S198)", "TGX221", inc).
0.0915767737::p_fc("ATF1(S198)", "Tofacitinib", dec); 0.001::p_fc("ATF1(S198)", "Tofacitinib", inc) :- p_occupancy("ATF1(S198)", "Tofacitinib", dec).
0.001::p_fc("ATF1(S198)", "Tofacitinib", dec); 0.0915767737::p_fc("ATF1(S198)", "Tofacitinib", inc) :- p_occupancy("ATF1(S198)", "Tofacitinib", inc).
0.4919800839::p_fc("ATF1(S198)", "Torin", dec); 0.001::p_fc("ATF1(S198)", "Torin", inc) :- p_occupancy("ATF1(S198)", "Torin", dec).
0.001::p_fc("ATF1(S198)", "Torin", dec); 0.4919800839::p_fc("ATF1(S198)", "Torin", inc) :- p_occupancy("ATF1(S198)", "Torin", inc).
0.2968862376::p_fc("ATF1(S198)", "Trametinib", dec); 0.001::p_fc("ATF1(S198)", "Trametinib", inc) :- p_occupancy("ATF1(S198)", "Trametinib", dec).
0.001::p_fc("ATF1(S198)", "Trametinib", dec); 0.2968862376::p_fc("ATF1(S198)", "Trametinib", inc) :- p_occupancy("ATF1(S198)", "Trametinib", inc).
0.7962431007::p_fc("ATF1(S198)", "U73122", dec); 0.001::p_fc("ATF1(S198)", "U73122", inc) :- p_occupancy("ATF1(S198)", "U73122", dec).
0.001::p_fc("ATF1(S198)", "U73122", dec); 0.7962431007::p_fc("ATF1(S198)", "U73122", inc) :- p_occupancy("ATF1(S198)", "U73122", inc).
0.7201417821::p_fc("ATF1(S198)", "Ulixertinib", dec); 0.001::p_fc("ATF1(S198)", "Ulixertinib", inc) :- p_occupancy("ATF1(S198)", "Ulixertinib", dec).
0.001::p_fc("ATF1(S198)", "Ulixertinib", dec); 0.7201417821::p_fc("ATF1(S198)", "Ulixertinib", inc) :- p_occupancy("ATF1(S198)", "Ulixertinib", inc).
0.3228519953::p_fc("ATF1(S198)", "Vemurafenib", dec); 0.001::p_fc("ATF1(S198)", "Vemurafenib", inc) :- p_occupancy("ATF1(S198)", "Vemurafenib", dec).
0.001::p_fc("ATF1(S198)", "Vemurafenib", dec); 0.3228519953::p_fc("ATF1(S198)", "Vemurafenib", inc) :- p_occupancy("ATF1(S198)", "Vemurafenib", inc).
0.9443222713::p_fc("BCLAF1(Y284)", "AC220", dec); 0.001::p_fc("BCLAF1(Y284)", "AC220", inc) :- p_occupancy("BCLAF1(Y284)", "AC220", dec).
0.001::p_fc("BCLAF1(Y284)", "AC220", dec); 0.9443222713::p_fc("BCLAF1(Y284)", "AC220", inc) :- p_occupancy("BCLAF1(Y284)", "AC220", inc).
0.9746016244::p_fc("BCLAF1(Y284)", "AT13148", dec); 0.001::p_fc("BCLAF1(Y284)", "AT13148", inc) :- p_occupancy("BCLAF1(Y284)", "AT13148", dec).
0.001::p_fc("BCLAF1(Y284)", "AT13148", dec); 0.9746016244::p_fc("BCLAF1(Y284)", "AT13148", inc) :- p_occupancy("BCLAF1(Y284)", "AT13148", inc).
0.9006894885::p_fc("BCLAF1(Y284)", "AZ20", dec); 0.001::p_fc("BCLAF1(Y284)", "AZ20", inc) :- p_occupancy("BCLAF1(Y284)", "AZ20", dec).
0.001::p_fc("BCLAF1(Y284)", "AZ20", dec); 0.9006894885::p_fc("BCLAF1(Y284)", "AZ20", inc) :- p_occupancy("BCLAF1(Y284)", "AZ20", inc).
0.868611374::p_fc("BCLAF1(Y284)", "AZD1480", dec); 0.001::p_fc("BCLAF1(Y284)", "AZD1480", inc) :- p_occupancy("BCLAF1(Y284)", "AZD1480", dec).
0.001::p_fc("BCLAF1(Y284)", "AZD1480", dec); 0.868611374::p_fc("BCLAF1(Y284)", "AZD1480", inc) :- p_occupancy("BCLAF1(Y284)", "AZD1480", inc).
0.3142592107::p_fc("BCLAF1(Y284)", "AZD3759", dec); 0.001::p_fc("BCLAF1(Y284)", "AZD3759", inc) :- p_occupancy("BCLAF1(Y284)", "AZD3759", dec).
0.001::p_fc("BCLAF1(Y284)", "AZD3759", dec); 0.3142592107::p_fc("BCLAF1(Y284)", "AZD3759", inc) :- p_occupancy("BCLAF1(Y284)", "AZD3759", inc).
0.6177955014::p_fc("BCLAF1(Y284)", "AZD5363", dec); 0.001::p_fc("BCLAF1(Y284)", "AZD5363", inc) :- p_occupancy("BCLAF1(Y284)", "AZD5363", dec).
0.001::p_fc("BCLAF1(Y284)", "AZD5363", dec); 0.6177955014::p_fc("BCLAF1(Y284)", "AZD5363", inc) :- p_occupancy("BCLAF1(Y284)", "AZD5363", inc).
0.8866732458::p_fc("BCLAF1(Y284)", "AZD5438", dec); 0.001::p_fc("BCLAF1(Y284)", "AZD5438", inc) :- p_occupancy("BCLAF1(Y284)", "AZD5438", dec).
0.001::p_fc("BCLAF1(Y284)", "AZD5438", dec); 0.8866732458::p_fc("BCLAF1(Y284)", "AZD5438", inc) :- p_occupancy("BCLAF1(Y284)", "AZD5438", inc).
0.9905187177::p_fc("BCLAF1(Y284)", "AZD6482", dec); 0.001::p_fc("BCLAF1(Y284)", "AZD6482", inc) :- p_occupancy("BCLAF1(Y284)", "AZD6482", dec).
0.001::p_fc("BCLAF1(Y284)", "AZD6482", dec); 0.9905187177::p_fc("BCLAF1(Y284)", "AZD6482", inc) :- p_occupancy("BCLAF1(Y284)", "AZD6482", inc).
0.0303800187::p_fc("BCLAF1(Y284)", "AZD6738", dec); 0.001::p_fc("BCLAF1(Y284)", "AZD6738", inc) :- p_occupancy("BCLAF1(Y284)", "AZD6738", dec).
0.001::p_fc("BCLAF1(Y284)", "AZD6738", dec); 0.0303800187::p_fc("BCLAF1(Y284)", "AZD6738", inc) :- p_occupancy("BCLAF1(Y284)", "AZD6738", inc).
0.9793026509::p_fc("BCLAF1(Y284)", "AZD8055", dec); 0.001::p_fc("BCLAF1(Y284)", "AZD8055", inc) :- p_occupancy("BCLAF1(Y284)", "AZD8055", dec).
0.001::p_fc("BCLAF1(Y284)", "AZD8055", dec); 0.9793026509::p_fc("BCLAF1(Y284)", "AZD8055", inc) :- p_occupancy("BCLAF1(Y284)", "AZD8055", inc).
0.0581624017::p_fc("BCLAF1(Y284)", "Amuvatinib", dec); 0.001::p_fc("BCLAF1(Y284)", "Amuvatinib", inc) :- p_occupancy("BCLAF1(Y284)", "Amuvatinib", dec).
0.001::p_fc("BCLAF1(Y284)", "Amuvatinib", dec); 0.0581624017::p_fc("BCLAF1(Y284)", "Amuvatinib", inc) :- p_occupancy("BCLAF1(Y284)", "Amuvatinib", inc).
0.9584145564::p_fc("BCLAF1(Y284)", "BX912", dec); 0.001::p_fc("BCLAF1(Y284)", "BX912", inc) :- p_occupancy("BCLAF1(Y284)", "BX912", dec).
0.001::p_fc("BCLAF1(Y284)", "BX912", dec); 0.9584145564::p_fc("BCLAF1(Y284)", "BX912", inc) :- p_occupancy("BCLAF1(Y284)", "BX912", inc).
0.7778687846::p_fc("BCLAF1(Y284)", "Bosutinib", dec); 0.001::p_fc("BCLAF1(Y284)", "Bosutinib", inc) :- p_occupancy("BCLAF1(Y284)", "Bosutinib", dec).
0.001::p_fc("BCLAF1(Y284)", "Bosutinib", dec); 0.7778687846::p_fc("BCLAF1(Y284)", "Bosutinib", inc) :- p_occupancy("BCLAF1(Y284)", "Bosutinib", inc).
0.3406244335::p_fc("BCLAF1(Y284)", "CAL101", dec); 0.001::p_fc("BCLAF1(Y284)", "CAL101", inc) :- p_occupancy("BCLAF1(Y284)", "CAL101", dec).
0.001::p_fc("BCLAF1(Y284)", "CAL101", dec); 0.3406244335::p_fc("BCLAF1(Y284)", "CAL101", inc) :- p_occupancy("BCLAF1(Y284)", "CAL101", inc).
0.891176806::p_fc("BCLAF1(Y284)", "CHIR99021", dec); 0.001::p_fc("BCLAF1(Y284)", "CHIR99021", inc) :- p_occupancy("BCLAF1(Y284)", "CHIR99021", dec).
0.001::p_fc("BCLAF1(Y284)", "CHIR99021", dec); 0.891176806::p_fc("BCLAF1(Y284)", "CHIR99021", inc) :- p_occupancy("BCLAF1(Y284)", "CHIR99021", inc).
0.999995806::p_fc("BCLAF1(Y284)", "CX4945", dec); 0.001::p_fc("BCLAF1(Y284)", "CX4945", inc) :- p_occupancy("BCLAF1(Y284)", "CX4945", dec).
0.001::p_fc("BCLAF1(Y284)", "CX4945", dec); 0.999995806::p_fc("BCLAF1(Y284)", "CX4945", inc) :- p_occupancy("BCLAF1(Y284)", "CX4945", inc).
0.2055101062::p_fc("BCLAF1(Y284)", "DNAPK", dec); 0.001::p_fc("BCLAF1(Y284)", "DNAPK", inc) :- p_occupancy("BCLAF1(Y284)", "DNAPK", dec).
0.001::p_fc("BCLAF1(Y284)", "DNAPK", dec); 0.2055101062::p_fc("BCLAF1(Y284)", "DNAPK", inc) :- p_occupancy("BCLAF1(Y284)", "DNAPK", inc).
0.9165510494::p_fc("BCLAF1(Y284)", "Dabrafenib", dec); 0.001::p_fc("BCLAF1(Y284)", "Dabrafenib", inc) :- p_occupancy("BCLAF1(Y284)", "Dabrafenib", dec).
0.001::p_fc("BCLAF1(Y284)", "Dabrafenib", dec); 0.9165510494::p_fc("BCLAF1(Y284)", "Dabrafenib", inc) :- p_occupancy("BCLAF1(Y284)", "Dabrafenib", inc).
0.9971374379::p_fc("BCLAF1(Y284)", "Dasatinib", dec); 0.001::p_fc("BCLAF1(Y284)", "Dasatinib", inc) :- p_occupancy("BCLAF1(Y284)", "Dasatinib", dec).
0.001::p_fc("BCLAF1(Y284)", "Dasatinib", dec); 0.9971374379::p_fc("BCLAF1(Y284)", "Dasatinib", inc) :- p_occupancy("BCLAF1(Y284)", "Dasatinib", inc).
0.9999998738::p_fc("BCLAF1(Y284)", "Edelfosine", dec); 0.001::p_fc("BCLAF1(Y284)", "Edelfosine", inc) :- p_occupancy("BCLAF1(Y284)", "Edelfosine", dec).
0.001::p_fc("BCLAF1(Y284)", "Edelfosine", dec); 0.9999998738::p_fc("BCLAF1(Y284)", "Edelfosine", inc) :- p_occupancy("BCLAF1(Y284)", "Edelfosine", inc).
0.3865546654::p_fc("BCLAF1(Y284)", "FRAX486", dec); 0.001::p_fc("BCLAF1(Y284)", "FRAX486", inc) :- p_occupancy("BCLAF1(Y284)", "FRAX486", dec).
0.001::p_fc("BCLAF1(Y284)", "FRAX486", dec); 0.3865546654::p_fc("BCLAF1(Y284)", "FRAX486", inc) :- p_occupancy("BCLAF1(Y284)", "FRAX486", inc).
0.9999999868::p_fc("BCLAF1(Y284)", "GDC0941", dec); 0.001::p_fc("BCLAF1(Y284)", "GDC0941", inc) :- p_occupancy("BCLAF1(Y284)", "GDC0941", dec).
0.001::p_fc("BCLAF1(Y284)", "GDC0941", dec); 0.9999999868::p_fc("BCLAF1(Y284)", "GDC0941", inc) :- p_occupancy("BCLAF1(Y284)", "GDC0941", inc).
0.8289891573::p_fc("BCLAF1(Y284)", "GDC0994", dec); 0.001::p_fc("BCLAF1(Y284)", "GDC0994", inc) :- p_occupancy("BCLAF1(Y284)", "GDC0994", dec).
0.001::p_fc("BCLAF1(Y284)", "GDC0994", dec); 0.8289891573::p_fc("BCLAF1(Y284)", "GDC0994", inc) :- p_occupancy("BCLAF1(Y284)", "GDC0994", inc).
0.7009027116::p_fc("BCLAF1(Y284)", "GF109203X", dec); 0.001::p_fc("BCLAF1(Y284)", "GF109203X", inc) :- p_occupancy("BCLAF1(Y284)", "GF109203X", dec).
0.001::p_fc("BCLAF1(Y284)", "GF109203X", dec); 0.7009027116::p_fc("BCLAF1(Y284)", "GF109203X", inc) :- p_occupancy("BCLAF1(Y284)", "GF109203X", inc).
0.9999999795::p_fc("BCLAF1(Y284)", "GO6983", dec); 0.001::p_fc("BCLAF1(Y284)", "GO6983", inc) :- p_occupancy("BCLAF1(Y284)", "GO6983", dec).
0.001::p_fc("BCLAF1(Y284)", "GO6983", dec); 0.9999999795::p_fc("BCLAF1(Y284)", "GO6983", inc) :- p_occupancy("BCLAF1(Y284)", "GO6983", inc).
0.9962328158::p_fc("BCLAF1(Y284)", "GSK2334470", dec); 0.001::p_fc("BCLAF1(Y284)", "GSK2334470", inc) :- p_occupancy("BCLAF1(Y284)", "GSK2334470", dec).
0.001::p_fc("BCLAF1(Y284)", "GSK2334470", dec); 0.9962328158::p_fc("BCLAF1(Y284)", "GSK2334470", inc) :- p_occupancy("BCLAF1(Y284)", "GSK2334470", inc).
0.5556901862::p_fc("BCLAF1(Y284)", "GSK690693", dec); 0.001::p_fc("BCLAF1(Y284)", "GSK690693", inc) :- p_occupancy("BCLAF1(Y284)", "GSK690693", dec).
0.001::p_fc("BCLAF1(Y284)", "GSK690693", dec); 0.5556901862::p_fc("BCLAF1(Y284)", "GSK690693", inc) :- p_occupancy("BCLAF1(Y284)", "GSK690693", inc).
0.9999187622::p_fc("BCLAF1(Y284)", "Go6976", dec); 0.001::p_fc("BCLAF1(Y284)", "Go6976", inc) :- p_occupancy("BCLAF1(Y284)", "Go6976", dec).
0.001::p_fc("BCLAF1(Y284)", "Go6976", dec); 0.9999187622::p_fc("BCLAF1(Y284)", "Go6976", inc) :- p_occupancy("BCLAF1(Y284)", "Go6976", inc).
0.1522495221::p_fc("BCLAF1(Y284)", "H89", dec); 0.001::p_fc("BCLAF1(Y284)", "H89", inc) :- p_occupancy("BCLAF1(Y284)", "H89", dec).
0.001::p_fc("BCLAF1(Y284)", "H89", dec); 0.1522495221::p_fc("BCLAF1(Y284)", "H89", inc) :- p_occupancy("BCLAF1(Y284)", "H89", inc).
0.0601044124::p_fc("BCLAF1(Y284)", "HS173", dec); 0.001::p_fc("BCLAF1(Y284)", "HS173", inc) :- p_occupancy("BCLAF1(Y284)", "HS173", dec).
0.001::p_fc("BCLAF1(Y284)", "HS173", dec); 0.0601044124::p_fc("BCLAF1(Y284)", "HS173", inc) :- p_occupancy("BCLAF1(Y284)", "HS173", inc).
0.895543926::p_fc("BCLAF1(Y284)", "Ipatasertib", dec); 0.001::p_fc("BCLAF1(Y284)", "Ipatasertib", inc) :- p_occupancy("BCLAF1(Y284)", "Ipatasertib", dec).
0.001::p_fc("BCLAF1(Y284)", "Ipatasertib", dec); 0.895543926::p_fc("BCLAF1(Y284)", "Ipatasertib", inc) :- p_occupancy("BCLAF1(Y284)", "Ipatasertib", inc).
0.0956486365::p_fc("BCLAF1(Y284)", "JNJ", dec); 0.001::p_fc("BCLAF1(Y284)", "JNJ", inc) :- p_occupancy("BCLAF1(Y284)", "JNJ", dec).
0.001::p_fc("BCLAF1(Y284)", "JNJ", dec); 0.0956486365::p_fc("BCLAF1(Y284)", "JNJ", inc) :- p_occupancy("BCLAF1(Y284)", "JNJ", inc).
0.1889224321::p_fc("BCLAF1(Y284)", "JNK", dec); 0.001::p_fc("BCLAF1(Y284)", "JNK", inc) :- p_occupancy("BCLAF1(Y284)", "JNK", dec).
0.001::p_fc("BCLAF1(Y284)", "JNK", dec); 0.1889224321::p_fc("BCLAF1(Y284)", "JNK", inc) :- p_occupancy("BCLAF1(Y284)", "JNK", inc).
0.4840015979::p_fc("BCLAF1(Y284)", "KD025", dec); 0.001::p_fc("BCLAF1(Y284)", "KD025", inc) :- p_occupancy("BCLAF1(Y284)", "KD025", dec).
0.001::p_fc("BCLAF1(Y284)", "KD025", dec); 0.4840015979::p_fc("BCLAF1(Y284)", "KD025", inc) :- p_occupancy("BCLAF1(Y284)", "KD025", inc).
0.8918956879::p_fc("BCLAF1(Y284)", "KN62", dec); 0.001::p_fc("BCLAF1(Y284)", "KN62", inc) :- p_occupancy("BCLAF1(Y284)", "KN62", dec).
0.001::p_fc("BCLAF1(Y284)", "KN62", dec); 0.8918956879::p_fc("BCLAF1(Y284)", "KN62", inc) :- p_occupancy("BCLAF1(Y284)", "KN62", inc).
0.9999999988::p_fc("BCLAF1(Y284)", "KN93", dec); 0.001::p_fc("BCLAF1(Y284)", "KN93", inc) :- p_occupancy("BCLAF1(Y284)", "KN93", dec).
0.001::p_fc("BCLAF1(Y284)", "KN93", dec); 0.9999999988::p_fc("BCLAF1(Y284)", "KN93", inc) :- p_occupancy("BCLAF1(Y284)", "KN93", inc).
0.7792726685::p_fc("BCLAF1(Y284)", "Ku0063794", dec); 0.001::p_fc("BCLAF1(Y284)", "Ku0063794", inc) :- p_occupancy("BCLAF1(Y284)", "Ku0063794", dec).
0.001::p_fc("BCLAF1(Y284)", "Ku0063794", dec); 0.7792726685::p_fc("BCLAF1(Y284)", "Ku0063794", inc) :- p_occupancy("BCLAF1(Y284)", "Ku0063794", inc).
0.9925345084::p_fc("BCLAF1(Y284)", "LY2090314", dec); 0.001::p_fc("BCLAF1(Y284)", "LY2090314", inc) :- p_occupancy("BCLAF1(Y284)", "LY2090314", dec).
0.001::p_fc("BCLAF1(Y284)", "LY2090314", dec); 0.9925345084::p_fc("BCLAF1(Y284)", "LY2090314", inc) :- p_occupancy("BCLAF1(Y284)", "LY2090314", inc).
0.9984272989::p_fc("BCLAF1(Y284)", "LY2584702", dec); 0.001::p_fc("BCLAF1(Y284)", "LY2584702", inc) :- p_occupancy("BCLAF1(Y284)", "LY2584702", dec).
0.001::p_fc("BCLAF1(Y284)", "LY2584702", dec); 0.9984272989::p_fc("BCLAF1(Y284)", "LY2584702", inc) :- p_occupancy("BCLAF1(Y284)", "LY2584702", inc).
0.4150204588::p_fc("BCLAF1(Y284)", "LY2835219", dec); 0.001::p_fc("BCLAF1(Y284)", "LY2835219", inc) :- p_occupancy("BCLAF1(Y284)", "LY2835219", dec).
0.001::p_fc("BCLAF1(Y284)", "LY2835219", dec); 0.4150204588::p_fc("BCLAF1(Y284)", "LY2835219", inc) :- p_occupancy("BCLAF1(Y284)", "LY2835219", inc).
0.8796660298::p_fc("BCLAF1(Y284)", "Linsitinib", dec); 0.001::p_fc("BCLAF1(Y284)", "Linsitinib", inc) :- p_occupancy("BCLAF1(Y284)", "Linsitinib", dec).
0.001::p_fc("BCLAF1(Y284)", "Linsitinib", dec); 0.8796660298::p_fc("BCLAF1(Y284)", "Linsitinib", inc) :- p_occupancy("BCLAF1(Y284)", "Linsitinib", inc).
0.9383801697::p_fc("BCLAF1(Y284)", "MK2206", dec); 0.001::p_fc("BCLAF1(Y284)", "MK2206", inc) :- p_occupancy("BCLAF1(Y284)", "MK2206", dec).
0.001::p_fc("BCLAF1(Y284)", "MK2206", dec); 0.9383801697::p_fc("BCLAF1(Y284)", "MK2206", inc) :- p_occupancy("BCLAF1(Y284)", "MK2206", inc).
0.7754904894::p_fc("BCLAF1(Y284)", "NU7441", dec); 0.001::p_fc("BCLAF1(Y284)", "NU7441", inc) :- p_occupancy("BCLAF1(Y284)", "NU7441", dec).
0.001::p_fc("BCLAF1(Y284)", "NU7441", dec); 0.7754904894::p_fc("BCLAF1(Y284)", "NU7441", inc) :- p_occupancy("BCLAF1(Y284)", "NU7441", inc).
0.4351826691::p_fc("BCLAF1(Y284)", "PD153035", dec); 0.001::p_fc("BCLAF1(Y284)", "PD153035", inc) :- p_occupancy("BCLAF1(Y284)", "PD153035", dec).
0.001::p_fc("BCLAF1(Y284)", "PD153035", dec); 0.4351826691::p_fc("BCLAF1(Y284)", "PD153035", inc) :- p_occupancy("BCLAF1(Y284)", "PD153035", inc).
0.0926744675::p_fc("BCLAF1(Y284)", "PF3758309", dec); 0.001::p_fc("BCLAF1(Y284)", "PF3758309", inc) :- p_occupancy("BCLAF1(Y284)", "PF3758309", dec).
0.001::p_fc("BCLAF1(Y284)", "PF3758309", dec); 0.0926744675::p_fc("BCLAF1(Y284)", "PF3758309", inc) :- p_occupancy("BCLAF1(Y284)", "PF3758309", inc).
0.4192997757::p_fc("BCLAF1(Y284)", "PF4708671", dec); 0.001::p_fc("BCLAF1(Y284)", "PF4708671", inc) :- p_occupancy("BCLAF1(Y284)", "PF4708671", dec).
0.001::p_fc("BCLAF1(Y284)", "PF4708671", dec); 0.4192997757::p_fc("BCLAF1(Y284)", "PF4708671", inc) :- p_occupancy("BCLAF1(Y284)", "PF4708671", inc).
0.3412721606::p_fc("BCLAF1(Y284)", "PH797804", dec); 0.001::p_fc("BCLAF1(Y284)", "PH797804", inc) :- p_occupancy("BCLAF1(Y284)", "PH797804", dec).
0.001::p_fc("BCLAF1(Y284)", "PH797804", dec); 0.3412721606::p_fc("BCLAF1(Y284)", "PH797804", inc) :- p_occupancy("BCLAF1(Y284)", "PH797804", inc).
0.4264213364::p_fc("BCLAF1(Y284)", "PIK294", dec); 0.001::p_fc("BCLAF1(Y284)", "PIK294", inc) :- p_occupancy("BCLAF1(Y284)", "PIK294", dec).
0.001::p_fc("BCLAF1(Y284)", "PIK294", dec); 0.4264213364::p_fc("BCLAF1(Y284)", "PIK294", inc) :- p_occupancy("BCLAF1(Y284)", "PIK294", inc).
0.9755769075::p_fc("BCLAF1(Y284)", "Ribociclib", dec); 0.001::p_fc("BCLAF1(Y284)", "Ribociclib", inc) :- p_occupancy("BCLAF1(Y284)", "Ribociclib", dec).
0.001::p_fc("BCLAF1(Y284)", "Ribociclib", dec); 0.9755769075::p_fc("BCLAF1(Y284)", "Ribociclib", inc) :- p_occupancy("BCLAF1(Y284)", "Ribociclib", inc).
0.9868386939::p_fc("BCLAF1(Y284)", "Ripasudil", dec); 0.001::p_fc("BCLAF1(Y284)", "Ripasudil", inc) :- p_occupancy("BCLAF1(Y284)", "Ripasudil", dec).
0.001::p_fc("BCLAF1(Y284)", "Ripasudil", dec); 0.9868386939::p_fc("BCLAF1(Y284)", "Ripasudil", inc) :- p_occupancy("BCLAF1(Y284)", "Ripasudil", inc).
0.9857602663::p_fc("BCLAF1(Y284)", "SP600125", dec); 0.001::p_fc("BCLAF1(Y284)", "SP600125", inc) :- p_occupancy("BCLAF1(Y284)", "SP600125", dec).
0.001::p_fc("BCLAF1(Y284)", "SP600125", dec); 0.9857602663::p_fc("BCLAF1(Y284)", "SP600125", inc) :- p_occupancy("BCLAF1(Y284)", "SP600125", inc).
0.9173703812::p_fc("BCLAF1(Y284)", "Selumetinib", dec); 0.001::p_fc("BCLAF1(Y284)", "Selumetinib", inc) :- p_occupancy("BCLAF1(Y284)", "Selumetinib", dec).
0.001::p_fc("BCLAF1(Y284)", "Selumetinib", dec); 0.9173703812::p_fc("BCLAF1(Y284)", "Selumetinib", inc) :- p_occupancy("BCLAF1(Y284)", "Selumetinib", inc).
0.9641887101::p_fc("BCLAF1(Y284)", "TAK715", dec); 0.001::p_fc("BCLAF1(Y284)", "TAK715", inc) :- p_occupancy("BCLAF1(Y284)", "TAK715", dec).
0.001::p_fc("BCLAF1(Y284)", "TAK715", dec); 0.9641887101::p_fc("BCLAF1(Y284)", "TAK715", inc) :- p_occupancy("BCLAF1(Y284)", "TAK715", inc).
0.9786926214::p_fc("BCLAF1(Y284)", "TBCA", dec); 0.001::p_fc("BCLAF1(Y284)", "TBCA", inc) :- p_occupancy("BCLAF1(Y284)", "TBCA", dec).
0.001::p_fc("BCLAF1(Y284)", "TBCA", dec); 0.9786926214::p_fc("BCLAF1(Y284)", "TBCA", inc) :- p_occupancy("BCLAF1(Y284)", "TBCA", inc).
0.6412261109::p_fc("BCLAF1(Y284)", "TGX221", dec); 0.001::p_fc("BCLAF1(Y284)", "TGX221", inc) :- p_occupancy("BCLAF1(Y284)", "TGX221", dec).
0.001::p_fc("BCLAF1(Y284)", "TGX221", dec); 0.6412261109::p_fc("BCLAF1(Y284)", "TGX221", inc) :- p_occupancy("BCLAF1(Y284)", "TGX221", inc).
0.6368780149::p_fc("BCLAF1(Y284)", "Tofacitinib", dec); 0.001::p_fc("BCLAF1(Y284)", "Tofacitinib", inc) :- p_occupancy("BCLAF1(Y284)", "Tofacitinib", dec).
0.001::p_fc("BCLAF1(Y284)", "Tofacitinib", dec); 0.6368780149::p_fc("BCLAF1(Y284)", "Tofacitinib", inc) :- p_occupancy("BCLAF1(Y284)", "Tofacitinib", inc).
0.5441952817::p_fc("BCLAF1(Y284)", "Torin", dec); 0.001::p_fc("BCLAF1(Y284)", "Torin", inc) :- p_occupancy("BCLAF1(Y284)", "Torin", dec).
0.001::p_fc("BCLAF1(Y284)", "Torin", dec); 0.5441952817::p_fc("BCLAF1(Y284)", "Torin", inc) :- p_occupancy("BCLAF1(Y284)", "Torin", inc).
0.2194383523::p_fc("BCLAF1(Y284)", "Trametinib", dec); 0.001::p_fc("BCLAF1(Y284)", "Trametinib", inc) :- p_occupancy("BCLAF1(Y284)", "Trametinib", dec).
0.001::p_fc("BCLAF1(Y284)", "Trametinib", dec); 0.2194383523::p_fc("BCLAF1(Y284)", "Trametinib", inc) :- p_occupancy("BCLAF1(Y284)", "Trametinib", inc).
0.8273216905::p_fc("BCLAF1(Y284)", "U73122", dec); 0.001::p_fc("BCLAF1(Y284)", "U73122", inc) :- p_occupancy("BCLAF1(Y284)", "U73122", dec).
0.001::p_fc("BCLAF1(Y284)", "U73122", dec); 0.8273216905::p_fc("BCLAF1(Y284)", "U73122", inc) :- p_occupancy("BCLAF1(Y284)", "U73122", inc).
0.111876218::p_fc("BCLAF1(Y284)", "Ulixertinib", dec); 0.001::p_fc("BCLAF1(Y284)", "Ulixertinib", inc) :- p_occupancy("BCLAF1(Y284)", "Ulixertinib", dec).
0.001::p_fc("BCLAF1(Y284)", "Ulixertinib", dec); 0.111876218::p_fc("BCLAF1(Y284)", "Ulixertinib", inc) :- p_occupancy("BCLAF1(Y284)", "Ulixertinib", inc).
0.9301290381::p_fc("BCLAF1(Y284)", "Vemurafenib", dec); 0.001::p_fc("BCLAF1(Y284)", "Vemurafenib", inc) :- p_occupancy("BCLAF1(Y284)", "Vemurafenib", dec).
0.001::p_fc("BCLAF1(Y284)", "Vemurafenib", dec); 0.9301290381::p_fc("BCLAF1(Y284)", "Vemurafenib", inc) :- p_occupancy("BCLAF1(Y284)", "Vemurafenib", inc).
0.662137221::p_fc("HIPK2(Y361)", "AC220", dec); 0.001::p_fc("HIPK2(Y361)", "AC220", inc) :- p_occupancy("HIPK2(Y361)", "AC220", dec).
0.001::p_fc("HIPK2(Y361)", "AC220", dec); 0.662137221::p_fc("HIPK2(Y361)", "AC220", inc) :- p_occupancy("HIPK2(Y361)", "AC220", inc).
0.0560813832::p_fc("HIPK2(Y361)", "AT13148", dec); 0.001::p_fc("HIPK2(Y361)", "AT13148", inc) :- p_occupancy("HIPK2(Y361)", "AT13148", dec).
0.001::p_fc("HIPK2(Y361)", "AT13148", dec); 0.0560813832::p_fc("HIPK2(Y361)", "AT13148", inc) :- p_occupancy("HIPK2(Y361)", "AT13148", inc).
0.9015850878::p_fc("HIPK2(Y361)", "AZ20", dec); 0.001::p_fc("HIPK2(Y361)", "AZ20", inc) :- p_occupancy("HIPK2(Y361)", "AZ20", dec).
0.001::p_fc("HIPK2(Y361)", "AZ20", dec); 0.9015850878::p_fc("HIPK2(Y361)", "AZ20", inc) :- p_occupancy("HIPK2(Y361)", "AZ20", inc).
0.3487276168::p_fc("HIPK2(Y361)", "AZD1480", dec); 0.001::p_fc("HIPK2(Y361)", "AZD1480", inc) :- p_occupancy("HIPK2(Y361)", "AZD1480", dec).
0.001::p_fc("HIPK2(Y361)", "AZD1480", dec); 0.3487276168::p_fc("HIPK2(Y361)", "AZD1480", inc) :- p_occupancy("HIPK2(Y361)", "AZD1480", inc).
0.9942684067::p_fc("HIPK2(Y361)", "AZD3759", dec); 0.001::p_fc("HIPK2(Y361)", "AZD3759", inc) :- p_occupancy("HIPK2(Y361)", "AZD3759", dec).
0.001::p_fc("HIPK2(Y361)", "AZD3759", dec); 0.9942684067::p_fc("HIPK2(Y361)", "AZD3759", inc) :- p_occupancy("HIPK2(Y361)", "AZD3759", inc).
0.7477092674::p_fc("HIPK2(Y361)", "AZD5363", dec); 0.001::p_fc("HIPK2(Y361)", "AZD5363", inc) :- p_occupancy("HIPK2(Y361)", "AZD5363", dec).
0.001::p_fc("HIPK2(Y361)", "AZD5363", dec); 0.7477092674::p_fc("HIPK2(Y361)", "AZD5363", inc) :- p_occupancy("HIPK2(Y361)", "AZD5363", inc).
0.4600942851::p_fc("HIPK2(Y361)", "AZD5438", dec); 0.001::p_fc("HIPK2(Y361)", "AZD5438", inc) :- p_occupancy("HIPK2(Y361)", "AZD5438", dec).
0.001::p_fc("HIPK2(Y361)", "AZD5438", dec); 0.4600942851::p_fc("HIPK2(Y361)", "AZD5438", inc) :- p_occupancy("HIPK2(Y361)", "AZD5438", inc).
0.2160128889::p_fc("HIPK2(Y361)", "AZD6482", dec); 0.001::p_fc("HIPK2(Y361)", "AZD6482", inc) :- p_occupancy("HIPK2(Y361)", "AZD6482", dec).
0.001::p_fc("HIPK2(Y361)", "AZD6482", dec); 0.2160128889::p_fc("HIPK2(Y361)", "AZD6482", inc) :- p_occupancy("HIPK2(Y361)", "AZD6482", inc).
0.441707092::p_fc("HIPK2(Y361)", "AZD6738", dec); 0.001::p_fc("HIPK2(Y361)", "AZD6738", inc) :- p_occupancy("HIPK2(Y361)", "AZD6738", dec).
0.001::p_fc("HIPK2(Y361)", "AZD6738", dec); 0.441707092::p_fc("HIPK2(Y361)", "AZD6738", inc) :- p_occupancy("HIPK2(Y361)", "AZD6738", inc).
0.9997957477::p_fc("HIPK2(Y361)", "AZD8055", dec); 0.001::p_fc("HIPK2(Y361)", "AZD8055", inc) :- p_occupancy("HIPK2(Y361)", "AZD8055", dec).
0.001::p_fc("HIPK2(Y361)", "AZD8055", dec); 0.9997957477::p_fc("HIPK2(Y361)", "AZD8055", inc) :- p_occupancy("HIPK2(Y361)", "AZD8055", inc).
0.9904573305::p_fc("HIPK2(Y361)", "Amuvatinib", dec); 0.001::p_fc("HIPK2(Y361)", "Amuvatinib", inc) :- p_occupancy("HIPK2(Y361)", "Amuvatinib", dec).
0.001::p_fc("HIPK2(Y361)", "Amuvatinib", dec); 0.9904573305::p_fc("HIPK2(Y361)", "Amuvatinib", inc) :- p_occupancy("HIPK2(Y361)", "Amuvatinib", inc).
0.6303776127::p_fc("HIPK2(Y361)", "BX912", dec); 0.001::p_fc("HIPK2(Y361)", "BX912", inc) :- p_occupancy("HIPK2(Y361)", "BX912", dec).
0.001::p_fc("HIPK2(Y361)", "BX912", dec); 0.6303776127::p_fc("HIPK2(Y361)", "BX912", inc) :- p_occupancy("HIPK2(Y361)", "BX912", inc).
0.6137332827::p_fc("HIPK2(Y361)", "Bosutinib", dec); 0.001::p_fc("HIPK2(Y361)", "Bosutinib", inc) :- p_occupancy("HIPK2(Y361)", "Bosutinib", dec).
0.001::p_fc("HIPK2(Y361)", "Bosutinib", dec); 0.6137332827::p_fc("HIPK2(Y361)", "Bosutinib", inc) :- p_occupancy("HIPK2(Y361)", "Bosutinib", inc).
0.310234991::p_fc("HIPK2(Y361)", "CAL101", dec); 0.001::p_fc("HIPK2(Y361)", "CAL101", inc) :- p_occupancy("HIPK2(Y361)", "CAL101", dec).
0.001::p_fc("HIPK2(Y361)", "CAL101", dec); 0.310234991::p_fc("HIPK2(Y361)", "CAL101", inc) :- p_occupancy("HIPK2(Y361)", "CAL101", inc).
0.7464405337::p_fc("HIPK2(Y361)", "CHIR99021", dec); 0.001::p_fc("HIPK2(Y361)", "CHIR99021", inc) :- p_occupancy("HIPK2(Y361)", "CHIR99021", dec).
0.001::p_fc("HIPK2(Y361)", "CHIR99021", dec); 0.7464405337::p_fc("HIPK2(Y361)", "CHIR99021", inc) :- p_occupancy("HIPK2(Y361)", "CHIR99021", inc).
0.7482549042::p_fc("HIPK2(Y361)", "CX4945", dec); 0.001::p_fc("HIPK2(Y361)", "CX4945", inc) :- p_occupancy("HIPK2(Y361)", "CX4945", dec).
0.001::p_fc("HIPK2(Y361)", "CX4945", dec); 0.7482549042::p_fc("HIPK2(Y361)", "CX4945", inc) :- p_occupancy("HIPK2(Y361)", "CX4945", inc).
0.1784034536::p_fc("HIPK2(Y361)", "DNAPK", dec); 0.001::p_fc("HIPK2(Y361)", "DNAPK", inc) :- p_occupancy("HIPK2(Y361)", "DNAPK", dec).
0.001::p_fc("HIPK2(Y361)", "DNAPK", dec); 0.1784034536::p_fc("HIPK2(Y361)", "DNAPK", inc) :- p_occupancy("HIPK2(Y361)", "DNAPK", inc).
0.3846865084::p_fc("HIPK2(Y361)", "Dabrafenib", dec); 0.001::p_fc("HIPK2(Y361)", "Dabrafenib", inc) :- p_occupancy("HIPK2(Y361)", "Dabrafenib", dec).
0.001::p_fc("HIPK2(Y361)", "Dabrafenib", dec); 0.3846865084::p_fc("HIPK2(Y361)", "Dabrafenib", inc) :- p_occupancy("HIPK2(Y361)", "Dabrafenib", inc).
0.0285950986::p_fc("HIPK2(Y361)", "Dasatinib", dec); 0.001::p_fc("HIPK2(Y361)", "Dasatinib", inc) :- p_occupancy("HIPK2(Y361)", "Dasatinib", dec).
0.001::p_fc("HIPK2(Y361)", "Dasatinib", dec); 0.0285950986::p_fc("HIPK2(Y361)", "Dasatinib", inc) :- p_occupancy("HIPK2(Y361)", "Dasatinib", inc).
0.723959842::p_fc("HIPK2(Y361)", "Edelfosine", dec); 0.001::p_fc("HIPK2(Y361)", "Edelfosine", inc) :- p_occupancy("HIPK2(Y361)", "Edelfosine", dec).
0.001::p_fc("HIPK2(Y361)", "Edelfosine", dec); 0.723959842::p_fc("HIPK2(Y361)", "Edelfosine", inc) :- p_occupancy("HIPK2(Y361)", "Edelfosine", inc).
0.4919273503::p_fc("HIPK2(Y361)", "FRAX486", dec); 0.001::p_fc("HIPK2(Y361)", "FRAX486", inc) :- p_occupancy("HIPK2(Y361)", "FRAX486", dec).
0.001::p_fc("HIPK2(Y361)", "FRAX486", dec); 0.4919273503::p_fc("HIPK2(Y361)", "FRAX486", inc) :- p_occupancy("HIPK2(Y361)", "FRAX486", inc).
0.7995316683::p_fc("HIPK2(Y361)", "GDC0941", dec); 0.001::p_fc("HIPK2(Y361)", "GDC0941", inc) :- p_occupancy("HIPK2(Y361)", "GDC0941", dec).
0.001::p_fc("HIPK2(Y361)", "GDC0941", dec); 0.7995316683::p_fc("HIPK2(Y361)", "GDC0941", inc) :- p_occupancy("HIPK2(Y361)", "GDC0941", inc).
0.7581736716::p_fc("HIPK2(Y361)", "GDC0994", dec); 0.001::p_fc("HIPK2(Y361)", "GDC0994", inc) :- p_occupancy("HIPK2(Y361)", "GDC0994", dec).
0.001::p_fc("HIPK2(Y361)", "GDC0994", dec); 0.7581736716::p_fc("HIPK2(Y361)", "GDC0994", inc) :- p_occupancy("HIPK2(Y361)", "GDC0994", inc).
0.89047537::p_fc("HIPK2(Y361)", "GF109203X", dec); 0.001::p_fc("HIPK2(Y361)", "GF109203X", inc) :- p_occupancy("HIPK2(Y361)", "GF109203X", dec).
0.001::p_fc("HIPK2(Y361)", "GF109203X", dec); 0.89047537::p_fc("HIPK2(Y361)", "GF109203X", inc) :- p_occupancy("HIPK2(Y361)", "GF109203X", inc).
0.7259342848::p_fc("HIPK2(Y361)", "GO6983", dec); 0.001::p_fc("HIPK2(Y361)", "GO6983", inc) :- p_occupancy("HIPK2(Y361)", "GO6983", dec).
0.001::p_fc("HIPK2(Y361)", "GO6983", dec); 0.7259342848::p_fc("HIPK2(Y361)", "GO6983", inc) :- p_occupancy("HIPK2(Y361)", "GO6983", inc).
0.9997935185::p_fc("HIPK2(Y361)", "GSK2334470", dec); 0.001::p_fc("HIPK2(Y361)", "GSK2334470", inc) :- p_occupancy("HIPK2(Y361)", "GSK2334470", dec).
0.001::p_fc("HIPK2(Y361)", "GSK2334470", dec); 0.9997935185::p_fc("HIPK2(Y361)", "GSK2334470", inc) :- p_occupancy("HIPK2(Y361)", "GSK2334470", inc).
0.7384709185::p_fc("HIPK2(Y361)", "GSK690693", dec); 0.001::p_fc("HIPK2(Y361)", "GSK690693", inc) :- p_occupancy("HIPK2(Y361)", "GSK690693", dec).
0.001::p_fc("HIPK2(Y361)", "GSK690693", dec); 0.7384709185::p_fc("HIPK2(Y361)", "GSK690693", inc) :- p_occupancy("HIPK2(Y361)", "GSK690693", inc).
0.1987393934::p_fc("HIPK2(Y361)", "Go6976", dec); 0.001::p_fc("HIPK2(Y361)", "Go6976", inc) :- p_occupancy("HIPK2(Y361)", "Go6976", dec).
0.001::p_fc("HIPK2(Y361)", "Go6976", dec); 0.1987393934::p_fc("HIPK2(Y361)", "Go6976", inc) :- p_occupancy("HIPK2(Y361)", "Go6976", inc).
0.2244515345::p_fc("HIPK2(Y361)", "H89", dec); 0.001::p_fc("HIPK2(Y361)", "H89", inc) :- p_occupancy("HIPK2(Y361)", "H89", dec).
0.001::p_fc("HIPK2(Y361)", "H89", dec); 0.2244515345::p_fc("HIPK2(Y361)", "H89", inc) :- p_occupancy("HIPK2(Y361)", "H89", inc).
0.7591944348::p_fc("HIPK2(Y361)", "HS173", dec); 0.001::p_fc("HIPK2(Y361)", "HS173", inc) :- p_occupancy("HIPK2(Y361)", "HS173", dec).
0.001::p_fc("HIPK2(Y361)", "HS173", dec); 0.7591944348::p_fc("HIPK2(Y361)", "HS173", inc) :- p_occupancy("HIPK2(Y361)", "HS173", inc).
0.6103678606::p_fc("HIPK2(Y361)", "Ipatasertib", dec); 0.001::p_fc("HIPK2(Y361)", "Ipatasertib", inc) :- p_occupancy("HIPK2(Y361)", "Ipatasertib", dec).
0.001::p_fc("HIPK2(Y361)", "Ipatasertib", dec); 0.6103678606::p_fc("HIPK2(Y361)", "Ipatasertib", inc) :- p_occupancy("HIPK2(Y361)", "Ipatasertib", inc).
0.4614341956::p_fc("HIPK2(Y361)", "JNJ", dec); 0.001::p_fc("HIPK2(Y361)", "JNJ", inc) :- p_occupancy("HIPK2(Y361)", "JNJ", dec).
0.001::p_fc("HIPK2(Y361)", "JNJ", dec); 0.4614341956::p_fc("HIPK2(Y361)", "JNJ", inc) :- p_occupancy("HIPK2(Y361)", "JNJ", inc).
0.7387591757::p_fc("HIPK2(Y361)", "JNK", dec); 0.001::p_fc("HIPK2(Y361)", "JNK", inc) :- p_occupancy("HIPK2(Y361)", "JNK", dec).
0.001::p_fc("HIPK2(Y361)", "JNK", dec); 0.7387591757::p_fc("HIPK2(Y361)", "JNK", inc) :- p_occupancy("HIPK2(Y361)", "JNK", inc).
0.7133515764::p_fc("HIPK2(Y361)", "KD025", dec); 0.001::p_fc("HIPK2(Y361)", "KD025", inc) :- p_occupancy("HIPK2(Y361)", "KD025", dec).
0.001::p_fc("HIPK2(Y361)", "KD025", dec); 0.7133515764::p_fc("HIPK2(Y361)", "KD025", inc) :- p_occupancy("HIPK2(Y361)", "KD025", inc).
0.7398366738::p_fc("HIPK2(Y361)", "KN62", dec); 0.001::p_fc("HIPK2(Y361)", "KN62", inc) :- p_occupancy("HIPK2(Y361)", "KN62", dec).
0.001::p_fc("HIPK2(Y361)", "KN62", dec); 0.7398366738::p_fc("HIPK2(Y361)", "KN62", inc) :- p_occupancy("HIPK2(Y361)", "KN62", inc).
0.6594904199::p_fc("HIPK2(Y361)", "KN93", dec); 0.001::p_fc("HIPK2(Y361)", "KN93", inc) :- p_occupancy("HIPK2(Y361)", "KN93", dec).
0.001::p_fc("HIPK2(Y361)", "KN93", dec); 0.6594904199::p_fc("HIPK2(Y361)", "KN93", inc) :- p_occupancy("HIPK2(Y361)", "KN93", inc).
0.8512200023::p_fc("HIPK2(Y361)", "Ku0063794", dec); 0.001::p_fc("HIPK2(Y361)", "Ku0063794", inc) :- p_occupancy("HIPK2(Y361)", "Ku0063794", dec).
0.001::p_fc("HIPK2(Y361)", "Ku0063794", dec); 0.8512200023::p_fc("HIPK2(Y361)", "Ku0063794", inc) :- p_occupancy("HIPK2(Y361)", "Ku0063794", inc).
0.4805387015::p_fc("HIPK2(Y361)", "LY2090314", dec); 0.001::p_fc("HIPK2(Y361)", "LY2090314", inc) :- p_occupancy("HIPK2(Y361)", "LY2090314", dec).
0.001::p_fc("HIPK2(Y361)", "LY2090314", dec); 0.4805387015::p_fc("HIPK2(Y361)", "LY2090314", inc) :- p_occupancy("HIPK2(Y361)", "LY2090314", inc).
0.5945772698::p_fc("HIPK2(Y361)", "LY2584702", dec); 0.001::p_fc("HIPK2(Y361)", "LY2584702", inc) :- p_occupancy("HIPK2(Y361)", "LY2584702", dec).
0.001::p_fc("HIPK2(Y361)", "LY2584702", dec); 0.5945772698::p_fc("HIPK2(Y361)", "LY2584702", inc) :- p_occupancy("HIPK2(Y361)", "LY2584702", inc).
0.272778961::p_fc("HIPK2(Y361)", "LY2835219", dec); 0.001::p_fc("HIPK2(Y361)", "LY2835219", inc) :- p_occupancy("HIPK2(Y361)", "LY2835219", dec).
0.001::p_fc("HIPK2(Y361)", "LY2835219", dec); 0.272778961::p_fc("HIPK2(Y361)", "LY2835219", inc) :- p_occupancy("HIPK2(Y361)", "LY2835219", inc).
0.8082080333::p_fc("HIPK2(Y361)", "Linsitinib", dec); 0.001::p_fc("HIPK2(Y361)", "Linsitinib", inc) :- p_occupancy("HIPK2(Y361)", "Linsitinib", dec).
0.001::p_fc("HIPK2(Y361)", "Linsitinib", dec); 0.8082080333::p_fc("HIPK2(Y361)", "Linsitinib", inc) :- p_occupancy("HIPK2(Y361)", "Linsitinib", inc).
0.1716948246::p_fc("HIPK2(Y361)", "MK2206", dec); 0.001::p_fc("HIPK2(Y361)", "MK2206", inc) :- p_occupancy("HIPK2(Y361)", "MK2206", dec).
0.001::p_fc("HIPK2(Y361)", "MK2206", dec); 0.1716948246::p_fc("HIPK2(Y361)", "MK2206", inc) :- p_occupancy("HIPK2(Y361)", "MK2206", inc).
0.4819732867::p_fc("HIPK2(Y361)", "NU7441", dec); 0.001::p_fc("HIPK2(Y361)", "NU7441", inc) :- p_occupancy("HIPK2(Y361)", "NU7441", dec).
0.001::p_fc("HIPK2(Y361)", "NU7441", dec); 0.4819732867::p_fc("HIPK2(Y361)", "NU7441", inc) :- p_occupancy("HIPK2(Y361)", "NU7441", inc).
0.1671984856::p_fc("HIPK2(Y361)", "PD153035", dec); 0.001::p_fc("HIPK2(Y361)", "PD153035", inc) :- p_occupancy("HIPK2(Y361)", "PD153035", dec).
0.001::p_fc("HIPK2(Y361)", "PD153035", dec); 0.1671984856::p_fc("HIPK2(Y361)", "PD153035", inc) :- p_occupancy("HIPK2(Y361)", "PD153035", inc).
0.999999979::p_fc("HIPK2(Y361)", "PF3758309", dec); 0.001::p_fc("HIPK2(Y361)", "PF3758309", inc) :- p_occupancy("HIPK2(Y361)", "PF3758309", dec).
0.001::p_fc("HIPK2(Y361)", "PF3758309", dec); 0.999999979::p_fc("HIPK2(Y361)", "PF3758309", inc) :- p_occupancy("HIPK2(Y361)", "PF3758309", inc).
0.8531906554::p_fc("HIPK2(Y361)", "PF4708671", dec); 0.001::p_fc("HIPK2(Y361)", "PF4708671", inc) :- p_occupancy("HIPK2(Y361)", "PF4708671", dec).
0.001::p_fc("HIPK2(Y361)", "PF4708671", dec); 0.8531906554::p_fc("HIPK2(Y361)", "PF4708671", inc) :- p_occupancy("HIPK2(Y361)", "PF4708671", inc).
0.5783921545::p_fc("HIPK2(Y361)", "PH797804", dec); 0.001::p_fc("HIPK2(Y361)", "PH797804", inc) :- p_occupancy("HIPK2(Y361)", "PH797804", dec).
0.001::p_fc("HIPK2(Y361)", "PH797804", dec); 0.5783921545::p_fc("HIPK2(Y361)", "PH797804", inc) :- p_occupancy("HIPK2(Y361)", "PH797804", inc).
0.496323669::p_fc("HIPK2(Y361)", "PIK294", dec); 0.001::p_fc("HIPK2(Y361)", "PIK294", inc) :- p_occupancy("HIPK2(Y361)", "PIK294", dec).
0.001::p_fc("HIPK2(Y361)", "PIK294", dec); 0.496323669::p_fc("HIPK2(Y361)", "PIK294", inc) :- p_occupancy("HIPK2(Y361)", "PIK294", inc).
0.7577004568::p_fc("HIPK2(Y361)", "Ribociclib", dec); 0.001::p_fc("HIPK2(Y361)", "Ribociclib", inc) :- p_occupancy("HIPK2(Y361)", "Ribociclib", dec).
0.001::p_fc("HIPK2(Y361)", "Ribociclib", dec); 0.7577004568::p_fc("HIPK2(Y361)", "Ribociclib", inc) :- p_occupancy("HIPK2(Y361)", "Ribociclib", inc).
0.1435664846::p_fc("HIPK2(Y361)", "Ripasudil", dec); 0.001::p_fc("HIPK2(Y361)", "Ripasudil", inc) :- p_occupancy("HIPK2(Y361)", "Ripasudil", dec).
0.001::p_fc("HIPK2(Y361)", "Ripasudil", dec); 0.1435664846::p_fc("HIPK2(Y361)", "Ripasudil", inc) :- p_occupancy("HIPK2(Y361)", "Ripasudil", inc).
0.7940643048::p_fc("HIPK2(Y361)", "SP600125", dec); 0.001::p_fc("HIPK2(Y361)", "SP600125", inc) :- p_occupancy("HIPK2(Y361)", "SP600125", dec).
0.001::p_fc("HIPK2(Y361)", "SP600125", dec); 0.7940643048::p_fc("HIPK2(Y361)", "SP600125", inc) :- p_occupancy("HIPK2(Y361)", "SP600125", inc).
0.2321786864::p_fc("HIPK2(Y361)", "Selumetinib", dec); 0.001::p_fc("HIPK2(Y361)", "Selumetinib", inc) :- p_occupancy("HIPK2(Y361)", "Selumetinib", dec).
0.001::p_fc("HIPK2(Y361)", "Selumetinib", dec); 0.2321786864::p_fc("HIPK2(Y361)", "Selumetinib", inc) :- p_occupancy("HIPK2(Y361)", "Selumetinib", inc).
0.4526830821::p_fc("HIPK2(Y361)", "TAK715", dec); 0.001::p_fc("HIPK2(Y361)", "TAK715", inc) :- p_occupancy("HIPK2(Y361)", "TAK715", dec).
0.001::p_fc("HIPK2(Y361)", "TAK715", dec); 0.4526830821::p_fc("HIPK2(Y361)", "TAK715", inc) :- p_occupancy("HIPK2(Y361)", "TAK715", inc).
0.4998489946::p_fc("HIPK2(Y361)", "TBCA", dec); 0.001::p_fc("HIPK2(Y361)", "TBCA", inc) :- p_occupancy("HIPK2(Y361)", "TBCA", dec).
0.001::p_fc("HIPK2(Y361)", "TBCA", dec); 0.4998489946::p_fc("HIPK2(Y361)", "TBCA", inc) :- p_occupancy("HIPK2(Y361)", "TBCA", inc).
0.3273487874::p_fc("HIPK2(Y361)", "TGX221", dec); 0.001::p_fc("HIPK2(Y361)", "TGX221", inc) :- p_occupancy("HIPK2(Y361)", "TGX221", dec).
0.001::p_fc("HIPK2(Y361)", "TGX221", dec); 0.3273487874::p_fc("HIPK2(Y361)", "TGX221", inc) :- p_occupancy("HIPK2(Y361)", "TGX221", inc).
0.5385266859::p_fc("HIPK2(Y361)", "Tofacitinib", dec); 0.001::p_fc("HIPK2(Y361)", "Tofacitinib", inc) :- p_occupancy("HIPK2(Y361)", "Tofacitinib", dec).
0.001::p_fc("HIPK2(Y361)", "Tofacitinib", dec); 0.5385266859::p_fc("HIPK2(Y361)", "Tofacitinib", inc) :- p_occupancy("HIPK2(Y361)", "Tofacitinib", inc).
0.930834932::p_fc("HIPK2(Y361)", "Torin", dec); 0.001::p_fc("HIPK2(Y361)", "Torin", inc) :- p_occupancy("HIPK2(Y361)", "Torin", dec).
0.001::p_fc("HIPK2(Y361)", "Torin", dec); 0.930834932::p_fc("HIPK2(Y361)", "Torin", inc) :- p_occupancy("HIPK2(Y361)", "Torin", inc).
0.3571212222::p_fc("HIPK2(Y361)", "Trametinib", dec); 0.001::p_fc("HIPK2(Y361)", "Trametinib", inc) :- p_occupancy("HIPK2(Y361)", "Trametinib", dec).
0.001::p_fc("HIPK2(Y361)", "Trametinib", dec); 0.3571212222::p_fc("HIPK2(Y361)", "Trametinib", inc) :- p_occupancy("HIPK2(Y361)", "Trametinib", inc).
0.8420405291::p_fc("HIPK2(Y361)", "U73122", dec); 0.001::p_fc("HIPK2(Y361)", "U73122", inc) :- p_occupancy("HIPK2(Y361)", "U73122", dec).
0.001::p_fc("HIPK2(Y361)", "U73122", dec); 0.8420405291::p_fc("HIPK2(Y361)", "U73122", inc) :- p_occupancy("HIPK2(Y361)", "U73122", inc).
0.7599982835::p_fc("HIPK2(Y361)", "Ulixertinib", dec); 0.001::p_fc("HIPK2(Y361)", "Ulixertinib", inc) :- p_occupancy("HIPK2(Y361)", "Ulixertinib", dec).
0.001::p_fc("HIPK2(Y361)", "Ulixertinib", dec); 0.7599982835::p_fc("HIPK2(Y361)", "Ulixertinib", inc) :- p_occupancy("HIPK2(Y361)", "Ulixertinib", inc).
0.01813321::p_fc("HIPK2(Y361)", "Vemurafenib", dec); 0.001::p_fc("HIPK2(Y361)", "Vemurafenib", inc) :- p_occupancy("HIPK2(Y361)", "Vemurafenib", dec).
0.001::p_fc("HIPK2(Y361)", "Vemurafenib", dec); 0.01813321::p_fc("HIPK2(Y361)", "Vemurafenib", inc) :- p_occupancy("HIPK2(Y361)", "Vemurafenib", inc).
0.0243629798::p_fc("PTTG1IP(Y174)", "AC220", dec); 0.001::p_fc("PTTG1IP(Y174)", "AC220", inc) :- p_occupancy("PTTG1IP(Y174)", "AC220", dec).
0.001::p_fc("PTTG1IP(Y174)", "AC220", dec); 0.0243629798::p_fc("PTTG1IP(Y174)", "AC220", inc) :- p_occupancy("PTTG1IP(Y174)", "AC220", inc).
0.4600856399::p_fc("PTTG1IP(Y174)", "AT13148", dec); 0.001::p_fc("PTTG1IP(Y174)", "AT13148", inc) :- p_occupancy("PTTG1IP(Y174)", "AT13148", dec).
0.001::p_fc("PTTG1IP(Y174)", "AT13148", dec); 0.4600856399::p_fc("PTTG1IP(Y174)", "AT13148", inc) :- p_occupancy("PTTG1IP(Y174)", "AT13148", inc).
0.4304058253::p_fc("PTTG1IP(Y174)", "AZ20", dec); 0.001::p_fc("PTTG1IP(Y174)", "AZ20", inc) :- p_occupancy("PTTG1IP(Y174)", "AZ20", dec).
0.001::p_fc("PTTG1IP(Y174)", "AZ20", dec); 0.4304058253::p_fc("PTTG1IP(Y174)", "AZ20", inc) :- p_occupancy("PTTG1IP(Y174)", "AZ20", inc).
0.8682987477::p_fc("PTTG1IP(Y174)", "AZD1480", dec); 0.001::p_fc("PTTG1IP(Y174)", "AZD1480", inc) :- p_occupancy("PTTG1IP(Y174)", "AZD1480", dec).
0.001::p_fc("PTTG1IP(Y174)", "AZD1480", dec); 0.8682987477::p_fc("PTTG1IP(Y174)", "AZD1480", inc) :- p_occupancy("PTTG1IP(Y174)", "AZD1480", inc).
0.9999957864::p_fc("PTTG1IP(Y174)", "AZD3759", dec); 0.001::p_fc("PTTG1IP(Y174)", "AZD3759", inc) :- p_occupancy("PTTG1IP(Y174)", "AZD3759", dec).
0.001::p_fc("PTTG1IP(Y174)", "AZD3759", dec); 0.9999957864::p_fc("PTTG1IP(Y174)", "AZD3759", inc) :- p_occupancy("PTTG1IP(Y174)", "AZD3759", inc).
0.8523174954::p_fc("PTTG1IP(Y174)", "AZD5363", dec); 0.001::p_fc("PTTG1IP(Y174)", "AZD5363", inc) :- p_occupancy("PTTG1IP(Y174)", "AZD5363", dec).
0.001::p_fc("PTTG1IP(Y174)", "AZD5363", dec); 0.8523174954::p_fc("PTTG1IP(Y174)", "AZD5363", inc) :- p_occupancy("PTTG1IP(Y174)", "AZD5363", inc).
0.6893201331::p_fc("PTTG1IP(Y174)", "AZD5438", dec); 0.001::p_fc("PTTG1IP(Y174)", "AZD5438", inc) :- p_occupancy("PTTG1IP(Y174)", "AZD5438", dec).
0.001::p_fc("PTTG1IP(Y174)", "AZD5438", dec); 0.6893201331::p_fc("PTTG1IP(Y174)", "AZD5438", inc) :- p_occupancy("PTTG1IP(Y174)", "AZD5438", inc).
0.571947554::p_fc("PTTG1IP(Y174)", "AZD6482", dec); 0.001::p_fc("PTTG1IP(Y174)", "AZD6482", inc) :- p_occupancy("PTTG1IP(Y174)", "AZD6482", dec).
0.001::p_fc("PTTG1IP(Y174)", "AZD6482", dec); 0.571947554::p_fc("PTTG1IP(Y174)", "AZD6482", inc) :- p_occupancy("PTTG1IP(Y174)", "AZD6482", inc).
0.2846722606::p_fc("PTTG1IP(Y174)", "AZD6738", dec); 0.001::p_fc("PTTG1IP(Y174)", "AZD6738", inc) :- p_occupancy("PTTG1IP(Y174)", "AZD6738", dec).
0.001::p_fc("PTTG1IP(Y174)", "AZD6738", dec); 0.2846722606::p_fc("PTTG1IP(Y174)", "AZD6738", inc) :- p_occupancy("PTTG1IP(Y174)", "AZD6738", inc).
0.5144206828::p_fc("PTTG1IP(Y174)", "AZD8055", dec); 0.001::p_fc("PTTG1IP(Y174)", "AZD8055", inc) :- p_occupancy("PTTG1IP(Y174)", "AZD8055", dec).
0.001::p_fc("PTTG1IP(Y174)", "AZD8055", dec); 0.5144206828::p_fc("PTTG1IP(Y174)", "AZD8055", inc) :- p_occupancy("PTTG1IP(Y174)", "AZD8055", inc).
0.7599586701::p_fc("PTTG1IP(Y174)", "Amuvatinib", dec); 0.001::p_fc("PTTG1IP(Y174)", "Amuvatinib", inc) :- p_occupancy("PTTG1IP(Y174)", "Amuvatinib", dec).
0.001::p_fc("PTTG1IP(Y174)", "Amuvatinib", dec); 0.7599586701::p_fc("PTTG1IP(Y174)", "Amuvatinib", inc) :- p_occupancy("PTTG1IP(Y174)", "Amuvatinib", inc).
0.7686121179::p_fc("PTTG1IP(Y174)", "BX912", dec); 0.001::p_fc("PTTG1IP(Y174)", "BX912", inc) :- p_occupancy("PTTG1IP(Y174)", "BX912", dec).
0.001::p_fc("PTTG1IP(Y174)", "BX912", dec); 0.7686121179::p_fc("PTTG1IP(Y174)", "BX912", inc) :- p_occupancy("PTTG1IP(Y174)", "BX912", inc).
0.247404845::p_fc("PTTG1IP(Y174)", "Bosutinib", dec); 0.001::p_fc("PTTG1IP(Y174)", "Bosutinib", inc) :- p_occupancy("PTTG1IP(Y174)", "Bosutinib", dec).
0.001::p_fc("PTTG1IP(Y174)", "Bosutinib", dec); 0.247404845::p_fc("PTTG1IP(Y174)", "Bosutinib", inc) :- p_occupancy("PTTG1IP(Y174)", "Bosutinib", inc).
0.2275284743::p_fc("PTTG1IP(Y174)", "CAL101", dec); 0.001::p_fc("PTTG1IP(Y174)", "CAL101", inc) :- p_occupancy("PTTG1IP(Y174)", "CAL101", dec).
0.001::p_fc("PTTG1IP(Y174)", "CAL101", dec); 0.2275284743::p_fc("PTTG1IP(Y174)", "CAL101", inc) :- p_occupancy("PTTG1IP(Y174)", "CAL101", inc).
0.491478841::p_fc("PTTG1IP(Y174)", "CHIR99021", dec); 0.001::p_fc("PTTG1IP(Y174)", "CHIR99021", inc) :- p_occupancy("PTTG1IP(Y174)", "CHIR99021", dec).
0.001::p_fc("PTTG1IP(Y174)", "CHIR99021", dec); 0.491478841::p_fc("PTTG1IP(Y174)", "CHIR99021", inc) :- p_occupancy("PTTG1IP(Y174)", "CHIR99021", inc).
0.5249443866::p_fc("PTTG1IP(Y174)", "CX4945", dec); 0.001::p_fc("PTTG1IP(Y174)", "CX4945", inc) :- p_occupancy("PTTG1IP(Y174)", "CX4945", dec).
0.001::p_fc("PTTG1IP(Y174)", "CX4945", dec); 0.5249443866::p_fc("PTTG1IP(Y174)", "CX4945", inc) :- p_occupancy("PTTG1IP(Y174)", "CX4945", inc).
0.6420683043::p_fc("PTTG1IP(Y174)", "DNAPK", dec); 0.001::p_fc("PTTG1IP(Y174)", "DNAPK", inc) :- p_occupancy("PTTG1IP(Y174)", "DNAPK", dec).
0.001::p_fc("PTTG1IP(Y174)", "DNAPK", dec); 0.6420683043::p_fc("PTTG1IP(Y174)", "DNAPK", inc) :- p_occupancy("PTTG1IP(Y174)", "DNAPK", inc).
0.8549822079::p_fc("PTTG1IP(Y174)", "Dabrafenib", dec); 0.001::p_fc("PTTG1IP(Y174)", "Dabrafenib", inc) :- p_occupancy("PTTG1IP(Y174)", "Dabrafenib", dec).
0.001::p_fc("PTTG1IP(Y174)", "Dabrafenib", dec); 0.8549822079::p_fc("PTTG1IP(Y174)", "Dabrafenib", inc) :- p_occupancy("PTTG1IP(Y174)", "Dabrafenib", inc).
0.0979469004::p_fc("PTTG1IP(Y174)", "Dasatinib", dec); 0.001::p_fc("PTTG1IP(Y174)", "Dasatinib", inc) :- p_occupancy("PTTG1IP(Y174)", "Dasatinib", dec).
0.001::p_fc("PTTG1IP(Y174)", "Dasatinib", dec); 0.0979469004::p_fc("PTTG1IP(Y174)", "Dasatinib", inc) :- p_occupancy("PTTG1IP(Y174)", "Dasatinib", inc).
0.2401497226::p_fc("PTTG1IP(Y174)", "Edelfosine", dec); 0.001::p_fc("PTTG1IP(Y174)", "Edelfosine", inc) :- p_occupancy("PTTG1IP(Y174)", "Edelfosine", dec).
0.001::p_fc("PTTG1IP(Y174)", "Edelfosine", dec); 0.2401497226::p_fc("PTTG1IP(Y174)", "Edelfosine", inc) :- p_occupancy("PTTG1IP(Y174)", "Edelfosine", inc).
0.4603279392::p_fc("PTTG1IP(Y174)", "FRAX486", dec); 0.001::p_fc("PTTG1IP(Y174)", "FRAX486", inc) :- p_occupancy("PTTG1IP(Y174)", "FRAX486", dec).
0.001::p_fc("PTTG1IP(Y174)", "FRAX486", dec); 0.4603279392::p_fc("PTTG1IP(Y174)", "FRAX486", inc) :- p_occupancy("PTTG1IP(Y174)", "FRAX486", inc).
0.2774775773::p_fc("PTTG1IP(Y174)", "GDC0941", dec); 0.001::p_fc("PTTG1IP(Y174)", "GDC0941", inc) :- p_occupancy("PTTG1IP(Y174)", "GDC0941", dec).
0.001::p_fc("PTTG1IP(Y174)", "GDC0941", dec); 0.2774775773::p_fc("PTTG1IP(Y174)", "GDC0941", inc) :- p_occupancy("PTTG1IP(Y174)", "GDC0941", inc).
0.4819121698::p_fc("PTTG1IP(Y174)", "GDC0994", dec); 0.001::p_fc("PTTG1IP(Y174)", "GDC0994", inc) :- p_occupancy("PTTG1IP(Y174)", "GDC0994", dec).
0.001::p_fc("PTTG1IP(Y174)", "GDC0994", dec); 0.4819121698::p_fc("PTTG1IP(Y174)", "GDC0994", inc) :- p_occupancy("PTTG1IP(Y174)", "GDC0994", inc).
0.6366026578::p_fc("PTTG1IP(Y174)", "GF109203X", dec); 0.001::p_fc("PTTG1IP(Y174)", "GF109203X", inc) :- p_occupancy("PTTG1IP(Y174)", "GF109203X", dec).
0.001::p_fc("PTTG1IP(Y174)", "GF109203X", dec); 0.6366026578::p_fc("PTTG1IP(Y174)", "GF109203X", inc) :- p_occupancy("PTTG1IP(Y174)", "GF109203X", inc).
0.1826336515::p_fc("PTTG1IP(Y174)", "GO6983", dec); 0.001::p_fc("PTTG1IP(Y174)", "GO6983", inc) :- p_occupancy("PTTG1IP(Y174)", "GO6983", dec).
0.001::p_fc("PTTG1IP(Y174)", "GO6983", dec); 0.1826336515::p_fc("PTTG1IP(Y174)", "GO6983", inc) :- p_occupancy("PTTG1IP(Y174)", "GO6983", inc).
0.9244867881::p_fc("PTTG1IP(Y174)", "GSK2334470", dec); 0.001::p_fc("PTTG1IP(Y174)", "GSK2334470", inc) :- p_occupancy("PTTG1IP(Y174)", "GSK2334470", dec).
0.001::p_fc("PTTG1IP(Y174)", "GSK2334470", dec); 0.9244867881::p_fc("PTTG1IP(Y174)", "GSK2334470", inc) :- p_occupancy("PTTG1IP(Y174)", "GSK2334470", inc).
0.7715736271::p_fc("PTTG1IP(Y174)", "GSK690693", dec); 0.001::p_fc("PTTG1IP(Y174)", "GSK690693", inc) :- p_occupancy("PTTG1IP(Y174)", "GSK690693", dec).
0.001::p_fc("PTTG1IP(Y174)", "GSK690693", dec); 0.7715736271::p_fc("PTTG1IP(Y174)", "GSK690693", inc) :- p_occupancy("PTTG1IP(Y174)", "GSK690693", inc).
0.3136551393::p_fc("PTTG1IP(Y174)", "Go6976", dec); 0.001::p_fc("PTTG1IP(Y174)", "Go6976", inc) :- p_occupancy("PTTG1IP(Y174)", "Go6976", dec).
0.001::p_fc("PTTG1IP(Y174)", "Go6976", dec); 0.3136551393::p_fc("PTTG1IP(Y174)", "Go6976", inc) :- p_occupancy("PTTG1IP(Y174)", "Go6976", inc).
0.45921058::p_fc("PTTG1IP(Y174)", "H89", dec); 0.001::p_fc("PTTG1IP(Y174)", "H89", inc) :- p_occupancy("PTTG1IP(Y174)", "H89", dec).
0.001::p_fc("PTTG1IP(Y174)", "H89", dec); 0.45921058::p_fc("PTTG1IP(Y174)", "H89", inc) :- p_occupancy("PTTG1IP(Y174)", "H89", inc).
0.1395829378::p_fc("PTTG1IP(Y174)", "HS173", dec); 0.001::p_fc("PTTG1IP(Y174)", "HS173", inc) :- p_occupancy("PTTG1IP(Y174)", "HS173", dec).
0.001::p_fc("PTTG1IP(Y174)", "HS173", dec); 0.1395829378::p_fc("PTTG1IP(Y174)", "HS173", inc) :- p_occupancy("PTTG1IP(Y174)", "HS173", inc).
0.6256259031::p_fc("PTTG1IP(Y174)", "Ipatasertib", dec); 0.001::p_fc("PTTG1IP(Y174)", "Ipatasertib", inc) :- p_occupancy("PTTG1IP(Y174)", "Ipatasertib", dec).
0.001::p_fc("PTTG1IP(Y174)", "Ipatasertib", dec); 0.6256259031::p_fc("PTTG1IP(Y174)", "Ipatasertib", inc) :- p_occupancy("PTTG1IP(Y174)", "Ipatasertib", inc).
0.2746445368::p_fc("PTTG1IP(Y174)", "JNJ", dec); 0.001::p_fc("PTTG1IP(Y174)", "JNJ", inc) :- p_occupancy("PTTG1IP(Y174)", "JNJ", dec).
0.001::p_fc("PTTG1IP(Y174)", "JNJ", dec); 0.2746445368::p_fc("PTTG1IP(Y174)", "JNJ", inc) :- p_occupancy("PTTG1IP(Y174)", "JNJ", inc).
0.2745347664::p_fc("PTTG1IP(Y174)", "JNK", dec); 0.001::p_fc("PTTG1IP(Y174)", "JNK", inc) :- p_occupancy("PTTG1IP(Y174)", "JNK", dec).
0.001::p_fc("PTTG1IP(Y174)", "JNK", dec); 0.2745347664::p_fc("PTTG1IP(Y174)", "JNK", inc) :- p_occupancy("PTTG1IP(Y174)", "JNK", inc).
0.2041984415::p_fc("PTTG1IP(Y174)", "KD025", dec); 0.001::p_fc("PTTG1IP(Y174)", "KD025", inc) :- p_occupancy("PTTG1IP(Y174)", "KD025", dec).
0.001::p_fc("PTTG1IP(Y174)", "KD025", dec); 0.2041984415::p_fc("PTTG1IP(Y174)", "KD025", inc) :- p_occupancy("PTTG1IP(Y174)", "KD025", inc).
0.4885698426::p_fc("PTTG1IP(Y174)", "KN62", dec); 0.001::p_fc("PTTG1IP(Y174)", "KN62", inc) :- p_occupancy("PTTG1IP(Y174)", "KN62", dec).
0.001::p_fc("PTTG1IP(Y174)", "KN62", dec); 0.4885698426::p_fc("PTTG1IP(Y174)", "KN62", inc) :- p_occupancy("PTTG1IP(Y174)", "KN62", inc).
0.9146875709::p_fc("PTTG1IP(Y174)", "KN93", dec); 0.001::p_fc("PTTG1IP(Y174)", "KN93", inc) :- p_occupancy("PTTG1IP(Y174)", "KN93", dec).
0.001::p_fc("PTTG1IP(Y174)", "KN93", dec); 0.9146875709::p_fc("PTTG1IP(Y174)", "KN93", inc) :- p_occupancy("PTTG1IP(Y174)", "KN93", inc).
0.1492304595::p_fc("PTTG1IP(Y174)", "Ku0063794", dec); 0.001::p_fc("PTTG1IP(Y174)", "Ku0063794", inc) :- p_occupancy("PTTG1IP(Y174)", "Ku0063794", dec).
0.001::p_fc("PTTG1IP(Y174)", "Ku0063794", dec); 0.1492304595::p_fc("PTTG1IP(Y174)", "Ku0063794", inc) :- p_occupancy("PTTG1IP(Y174)", "Ku0063794", inc).
0.2644764225::p_fc("PTTG1IP(Y174)", "LY2090314", dec); 0.001::p_fc("PTTG1IP(Y174)", "LY2090314", inc) :- p_occupancy("PTTG1IP(Y174)", "LY2090314", dec).
0.001::p_fc("PTTG1IP(Y174)", "LY2090314", dec); 0.2644764225::p_fc("PTTG1IP(Y174)", "LY2090314", inc) :- p_occupancy("PTTG1IP(Y174)", "LY2090314", inc).
0.2486689863::p_fc("PTTG1IP(Y174)", "LY2584702", dec); 0.001::p_fc("PTTG1IP(Y174)", "LY2584702", inc) :- p_occupancy("PTTG1IP(Y174)", "LY2584702", dec).
0.001::p_fc("PTTG1IP(Y174)", "LY2584702", dec); 0.2486689863::p_fc("PTTG1IP(Y174)", "LY2584702", inc) :- p_occupancy("PTTG1IP(Y174)", "LY2584702", inc).
0.4265032562::p_fc("PTTG1IP(Y174)", "LY2835219", dec); 0.001::p_fc("PTTG1IP(Y174)", "LY2835219", inc) :- p_occupancy("PTTG1IP(Y174)", "LY2835219", dec).
0.001::p_fc("PTTG1IP(Y174)", "LY2835219", dec); 0.4265032562::p_fc("PTTG1IP(Y174)", "LY2835219", inc) :- p_occupancy("PTTG1IP(Y174)", "LY2835219", inc).
0.9104764475::p_fc("PTTG1IP(Y174)", "Linsitinib", dec); 0.001::p_fc("PTTG1IP(Y174)", "Linsitinib", inc) :- p_occupancy("PTTG1IP(Y174)", "Linsitinib", dec).
0.001::p_fc("PTTG1IP(Y174)", "Linsitinib", dec); 0.9104764475::p_fc("PTTG1IP(Y174)", "Linsitinib", inc) :- p_occupancy("PTTG1IP(Y174)", "Linsitinib", inc).
0.5699245663::p_fc("PTTG1IP(Y174)", "MK2206", dec); 0.001::p_fc("PTTG1IP(Y174)", "MK2206", inc) :- p_occupancy("PTTG1IP(Y174)", "MK2206", dec).
0.001::p_fc("PTTG1IP(Y174)", "MK2206", dec); 0.5699245663::p_fc("PTTG1IP(Y174)", "MK2206", inc) :- p_occupancy("PTTG1IP(Y174)", "MK2206", inc).
0.6899104598::p_fc("PTTG1IP(Y174)", "NU7441", dec); 0.001::p_fc("PTTG1IP(Y174)", "NU7441", inc) :- p_occupancy("PTTG1IP(Y174)", "NU7441", dec).
0.001::p_fc("PTTG1IP(Y174)", "NU7441", dec); 0.6899104598::p_fc("PTTG1IP(Y174)", "NU7441", inc) :- p_occupancy("PTTG1IP(Y174)", "NU7441", inc).
0.5539999366::p_fc("PTTG1IP(Y174)", "PD153035", dec); 0.001::p_fc("PTTG1IP(Y174)", "PD153035", inc) :- p_occupancy("PTTG1IP(Y174)", "PD153035", dec).
0.001::p_fc("PTTG1IP(Y174)", "PD153035", dec); 0.5539999366::p_fc("PTTG1IP(Y174)", "PD153035", inc) :- p_occupancy("PTTG1IP(Y174)", "PD153035", inc).
0.3715981937::p_fc("PTTG1IP(Y174)", "PF3758309", dec); 0.001::p_fc("PTTG1IP(Y174)", "PF3758309", inc) :- p_occupancy("PTTG1IP(Y174)", "PF3758309", dec).
0.001::p_fc("PTTG1IP(Y174)", "PF3758309", dec); 0.3715981937::p_fc("PTTG1IP(Y174)", "PF3758309", inc) :- p_occupancy("PTTG1IP(Y174)", "PF3758309", inc).
0.3489776292::p_fc("PTTG1IP(Y174)", "PF4708671", dec); 0.001::p_fc("PTTG1IP(Y174)", "PF4708671", inc) :- p_occupancy("PTTG1IP(Y174)", "PF4708671", dec).
0.001::p_fc("PTTG1IP(Y174)", "PF4708671", dec); 0.3489776292::p_fc("PTTG1IP(Y174)", "PF4708671", inc) :- p_occupancy("PTTG1IP(Y174)", "PF4708671", inc).
0.1197778687::p_fc("PTTG1IP(Y174)", "PH797804", dec); 0.001::p_fc("PTTG1IP(Y174)", "PH797804", inc) :- p_occupancy("PTTG1IP(Y174)", "PH797804", dec).
0.001::p_fc("PTTG1IP(Y174)", "PH797804", dec); 0.1197778687::p_fc("PTTG1IP(Y174)", "PH797804", inc) :- p_occupancy("PTTG1IP(Y174)", "PH797804", inc).
0.2322385903::p_fc("PTTG1IP(Y174)", "PIK294", dec); 0.001::p_fc("PTTG1IP(Y174)", "PIK294", inc) :- p_occupancy("PTTG1IP(Y174)", "PIK294", dec).
0.001::p_fc("PTTG1IP(Y174)", "PIK294", dec); 0.2322385903::p_fc("PTTG1IP(Y174)", "PIK294", inc) :- p_occupancy("PTTG1IP(Y174)", "PIK294", inc).
0.9822961209::p_fc("PTTG1IP(Y174)", "Ribociclib", dec); 0.001::p_fc("PTTG1IP(Y174)", "Ribociclib", inc) :- p_occupancy("PTTG1IP(Y174)", "Ribociclib", dec).
0.001::p_fc("PTTG1IP(Y174)", "Ribociclib", dec); 0.9822961209::p_fc("PTTG1IP(Y174)", "Ribociclib", inc) :- p_occupancy("PTTG1IP(Y174)", "Ribociclib", inc).
0.1215530979::p_fc("PTTG1IP(Y174)", "Ripasudil", dec); 0.001::p_fc("PTTG1IP(Y174)", "Ripasudil", inc) :- p_occupancy("PTTG1IP(Y174)", "Ripasudil", dec).
0.001::p_fc("PTTG1IP(Y174)", "Ripasudil", dec); 0.1215530979::p_fc("PTTG1IP(Y174)", "Ripasudil", inc) :- p_occupancy("PTTG1IP(Y174)", "Ripasudil", inc).
0.1513917564::p_fc("PTTG1IP(Y174)", "SP600125", dec); 0.001::p_fc("PTTG1IP(Y174)", "SP600125", inc) :- p_occupancy("PTTG1IP(Y174)", "SP600125", dec).
0.001::p_fc("PTTG1IP(Y174)", "SP600125", dec); 0.1513917564::p_fc("PTTG1IP(Y174)", "SP600125", inc) :- p_occupancy("PTTG1IP(Y174)", "SP600125", inc).
0.0578086568::p_fc("PTTG1IP(Y174)", "Selumetinib", dec); 0.001::p_fc("PTTG1IP(Y174)", "Selumetinib", inc) :- p_occupancy("PTTG1IP(Y174)", "Selumetinib", dec).
0.001::p_fc("PTTG1IP(Y174)", "Selumetinib", dec); 0.0578086568::p_fc("PTTG1IP(Y174)", "Selumetinib", inc) :- p_occupancy("PTTG1IP(Y174)", "Selumetinib", inc).
0.433814971::p_fc("PTTG1IP(Y174)", "TAK715", dec); 0.001::p_fc("PTTG1IP(Y174)", "TAK715", inc) :- p_occupancy("PTTG1IP(Y174)", "TAK715", dec).
0.001::p_fc("PTTG1IP(Y174)", "TAK715", dec); 0.433814971::p_fc("PTTG1IP(Y174)", "TAK715", inc) :- p_occupancy("PTTG1IP(Y174)", "TAK715", inc).
0.3249426359::p_fc("PTTG1IP(Y174)", "TBCA", dec); 0.001::p_fc("PTTG1IP(Y174)", "TBCA", inc) :- p_occupancy("PTTG1IP(Y174)", "TBCA", dec).
0.001::p_fc("PTTG1IP(Y174)", "TBCA", dec); 0.3249426359::p_fc("PTTG1IP(Y174)", "TBCA", inc) :- p_occupancy("PTTG1IP(Y174)", "TBCA", inc).
0.1345705943::p_fc("PTTG1IP(Y174)", "TGX221", dec); 0.001::p_fc("PTTG1IP(Y174)", "TGX221", inc) :- p_occupancy("PTTG1IP(Y174)", "TGX221", dec).
0.001::p_fc("PTTG1IP(Y174)", "TGX221", dec); 0.1345705943::p_fc("PTTG1IP(Y174)", "TGX221", inc) :- p_occupancy("PTTG1IP(Y174)", "TGX221", inc).
0.9089898827::p_fc("PTTG1IP(Y174)", "Tofacitinib", dec); 0.001::p_fc("PTTG1IP(Y174)", "Tofacitinib", inc) :- p_occupancy("PTTG1IP(Y174)", "Tofacitinib", dec).
0.001::p_fc("PTTG1IP(Y174)", "Tofacitinib", dec); 0.9089898827::p_fc("PTTG1IP(Y174)", "Tofacitinib", inc) :- p_occupancy("PTTG1IP(Y174)", "Tofacitinib", inc).
0.3858239761::p_fc("PTTG1IP(Y174)", "Torin", dec); 0.001::p_fc("PTTG1IP(Y174)", "Torin", inc) :- p_occupancy("PTTG1IP(Y174)", "Torin", dec).
0.001::p_fc("PTTG1IP(Y174)", "Torin", dec); 0.3858239761::p_fc("PTTG1IP(Y174)", "Torin", inc) :- p_occupancy("PTTG1IP(Y174)", "Torin", inc).
0.2393916444::p_fc("PTTG1IP(Y174)", "Trametinib", dec); 0.001::p_fc("PTTG1IP(Y174)", "Trametinib", inc) :- p_occupancy("PTTG1IP(Y174)", "Trametinib", dec).
0.001::p_fc("PTTG1IP(Y174)", "Trametinib", dec); 0.2393916444::p_fc("PTTG1IP(Y174)", "Trametinib", inc) :- p_occupancy("PTTG1IP(Y174)", "Trametinib", inc).
0.4666919171::p_fc("PTTG1IP(Y174)", "U73122", dec); 0.001::p_fc("PTTG1IP(Y174)", "U73122", inc) :- p_occupancy("PTTG1IP(Y174)", "U73122", dec).
0.001::p_fc("PTTG1IP(Y174)", "U73122", dec); 0.4666919171::p_fc("PTTG1IP(Y174)", "U73122", inc) :- p_occupancy("PTTG1IP(Y174)", "U73122", inc).
0.6270806902::p_fc("PTTG1IP(Y174)", "Ulixertinib", dec); 0.001::p_fc("PTTG1IP(Y174)", "Ulixertinib", inc) :- p_occupancy("PTTG1IP(Y174)", "Ulixertinib", dec).
0.001::p_fc("PTTG1IP(Y174)", "Ulixertinib", dec); 0.6270806902::p_fc("PTTG1IP(Y174)", "Ulixertinib", inc) :- p_occupancy("PTTG1IP(Y174)", "Ulixertinib", inc).
0.5697660655::p_fc("PTTG1IP(Y174)", "Vemurafenib", dec); 0.001::p_fc("PTTG1IP(Y174)", "Vemurafenib", inc) :- p_occupancy("PTTG1IP(Y174)", "Vemurafenib", dec).
0.001::p_fc("PTTG1IP(Y174)", "Vemurafenib", dec); 0.5697660655::p_fc("PTTG1IP(Y174)", "Vemurafenib", inc) :- p_occupancy("PTTG1IP(Y174)", "Vemurafenib", inc).
0.8010258239::p_fc("PXN(Y118)", "AC220", dec); 0.001::p_fc("PXN(Y118)", "AC220", inc) :- p_occupancy("PXN(Y118)", "AC220", dec).
0.001::p_fc("PXN(Y118)", "AC220", dec); 0.8010258239::p_fc("PXN(Y118)", "AC220", inc) :- p_occupancy("PXN(Y118)", "AC220", inc).
0.9765217258::p_fc("PXN(Y118)", "AT13148", dec); 0.001::p_fc("PXN(Y118)", "AT13148", inc) :- p_occupancy("PXN(Y118)", "AT13148", dec).
0.001::p_fc("PXN(Y118)", "AT13148", dec); 0.9765217258::p_fc("PXN(Y118)", "AT13148", inc) :- p_occupancy("PXN(Y118)", "AT13148", inc).
0.9213454421::p_fc("PXN(Y118)", "AZ20", dec); 0.001::p_fc("PXN(Y118)", "AZ20", inc) :- p_occupancy("PXN(Y118)", "AZ20", dec).
0.001::p_fc("PXN(Y118)", "AZ20", dec); 0.9213454421::p_fc("PXN(Y118)", "AZ20", inc) :- p_occupancy("PXN(Y118)", "AZ20", inc).
0.6718869284::p_fc("PXN(Y118)", "AZD1480", dec); 0.001::p_fc("PXN(Y118)", "AZD1480", inc) :- p_occupancy("PXN(Y118)", "AZD1480", dec).
0.001::p_fc("PXN(Y118)", "AZD1480", dec); 0.6718869284::p_fc("PXN(Y118)", "AZD1480", inc) :- p_occupancy("PXN(Y118)", "AZD1480", inc).
0.7878972674::p_fc("PXN(Y118)", "AZD3759", dec); 0.001::p_fc("PXN(Y118)", "AZD3759", inc) :- p_occupancy("PXN(Y118)", "AZD3759", dec).
0.001::p_fc("PXN(Y118)", "AZD3759", dec); 0.7878972674::p_fc("PXN(Y118)", "AZD3759", inc) :- p_occupancy("PXN(Y118)", "AZD3759", inc).
0.0493111682::p_fc("PXN(Y118)", "AZD5363", dec); 0.001::p_fc("PXN(Y118)", "AZD5363", inc) :- p_occupancy("PXN(Y118)", "AZD5363", dec).
0.001::p_fc("PXN(Y118)", "AZD5363", dec); 0.0493111682::p_fc("PXN(Y118)", "AZD5363", inc) :- p_occupancy("PXN(Y118)", "AZD5363", inc).
0.1503153068::p_fc("PXN(Y118)", "AZD5438", dec); 0.001::p_fc("PXN(Y118)", "AZD5438", inc) :- p_occupancy("PXN(Y118)", "AZD5438", dec).
0.001::p_fc("PXN(Y118)", "AZD5438", dec); 0.1503153068::p_fc("PXN(Y118)", "AZD5438", inc) :- p_occupancy("PXN(Y118)", "AZD5438", inc).
0.7862726746::p_fc("PXN(Y118)", "AZD6482", dec); 0.001::p_fc("PXN(Y118)", "AZD6482", inc) :- p_occupancy("PXN(Y118)", "AZD6482", dec).
0.001::p_fc("PXN(Y118)", "AZD6482", dec); 0.7862726746::p_fc("PXN(Y118)", "AZD6482", inc) :- p_occupancy("PXN(Y118)", "AZD6482", inc).
0.721845066::p_fc("PXN(Y118)", "AZD6738", dec); 0.001::p_fc("PXN(Y118)", "AZD6738", inc) :- p_occupancy("PXN(Y118)", "AZD6738", dec).
0.001::p_fc("PXN(Y118)", "AZD6738", dec); 0.721845066::p_fc("PXN(Y118)", "AZD6738", inc) :- p_occupancy("PXN(Y118)", "AZD6738", inc).
0.8716930523::p_fc("PXN(Y118)", "AZD8055", dec); 0.001::p_fc("PXN(Y118)", "AZD8055", inc) :- p_occupancy("PXN(Y118)", "AZD8055", dec).
0.001::p_fc("PXN(Y118)", "AZD8055", dec); 0.8716930523::p_fc("PXN(Y118)", "AZD8055", inc) :- p_occupancy("PXN(Y118)", "AZD8055", inc).
0.5000641864::p_fc("PXN(Y118)", "Amuvatinib", dec); 0.001::p_fc("PXN(Y118)", "Amuvatinib", inc) :- p_occupancy("PXN(Y118)", "Amuvatinib", dec).
0.001::p_fc("PXN(Y118)", "Amuvatinib", dec); 0.5000641864::p_fc("PXN(Y118)", "Amuvatinib", inc) :- p_occupancy("PXN(Y118)", "Amuvatinib", inc).
0.6169793148::p_fc("PXN(Y118)", "BX912", dec); 0.001::p_fc("PXN(Y118)", "BX912", inc) :- p_occupancy("PXN(Y118)", "BX912", dec).
0.001::p_fc("PXN(Y118)", "BX912", dec); 0.6169793148::p_fc("PXN(Y118)", "BX912", inc) :- p_occupancy("PXN(Y118)", "BX912", inc).
0.7477736905::p_fc("PXN(Y118)", "Bosutinib", dec); 0.001::p_fc("PXN(Y118)", "Bosutinib", inc) :- p_occupancy("PXN(Y118)", "Bosutinib", dec).
0.001::p_fc("PXN(Y118)", "Bosutinib", dec); 0.7477736905::p_fc("PXN(Y118)", "Bosutinib", inc) :- p_occupancy("PXN(Y118)", "Bosutinib", inc).
0.0892516433::p_fc("PXN(Y118)", "CAL101", dec); 0.001::p_fc("PXN(Y118)", "CAL101", inc) :- p_occupancy("PXN(Y118)", "CAL101", dec).
0.001::p_fc("PXN(Y118)", "CAL101", dec); 0.0892516433::p_fc("PXN(Y118)", "CAL101", inc) :- p_occupancy("PXN(Y118)", "CAL101", inc).
0.4319243569::p_fc("PXN(Y118)", "CHIR99021", dec); 0.001::p_fc("PXN(Y118)", "CHIR99021", inc) :- p_occupancy("PXN(Y118)", "CHIR99021", dec).
0.001::p_fc("PXN(Y118)", "CHIR99021", dec); 0.4319243569::p_fc("PXN(Y118)", "CHIR99021", inc) :- p_occupancy("PXN(Y118)", "CHIR99021", inc).
0.609821234::p_fc("PXN(Y118)", "CX4945", dec); 0.001::p_fc("PXN(Y118)", "CX4945", inc) :- p_occupancy("PXN(Y118)", "CX4945", dec).
0.001::p_fc("PXN(Y118)", "CX4945", dec); 0.609821234::p_fc("PXN(Y118)", "CX4945", inc) :- p_occupancy("PXN(Y118)", "CX4945", inc).
0.1530514306::p_fc("PXN(Y118)", "DNAPK", dec); 0.001::p_fc("PXN(Y118)", "DNAPK", inc) :- p_occupancy("PXN(Y118)", "DNAPK", dec).
0.001::p_fc("PXN(Y118)", "DNAPK", dec); 0.1530514306::p_fc("PXN(Y118)", "DNAPK", inc) :- p_occupancy("PXN(Y118)", "DNAPK", inc).
0.4368406111::p_fc("PXN(Y118)", "Dabrafenib", dec); 0.001::p_fc("PXN(Y118)", "Dabrafenib", inc) :- p_occupancy("PXN(Y118)", "Dabrafenib", dec).
0.001::p_fc("PXN(Y118)", "Dabrafenib", dec); 0.4368406111::p_fc("PXN(Y118)", "Dabrafenib", inc) :- p_occupancy("PXN(Y118)", "Dabrafenib", inc).
0.164951752::p_fc("PXN(Y118)", "Dasatinib", dec); 0.001::p_fc("PXN(Y118)", "Dasatinib", inc) :- p_occupancy("PXN(Y118)", "Dasatinib", dec).
0.001::p_fc("PXN(Y118)", "Dasatinib", dec); 0.164951752::p_fc("PXN(Y118)", "Dasatinib", inc) :- p_occupancy("PXN(Y118)", "Dasatinib", inc).
0.8749311989::p_fc("PXN(Y118)", "Edelfosine", dec); 0.001::p_fc("PXN(Y118)", "Edelfosine", inc) :- p_occupancy("PXN(Y118)", "Edelfosine", dec).
0.001::p_fc("PXN(Y118)", "Edelfosine", dec); 0.8749311989::p_fc("PXN(Y118)", "Edelfosine", inc) :- p_occupancy("PXN(Y118)", "Edelfosine", inc).
0.5378038408::p_fc("PXN(Y118)", "FRAX486", dec); 0.001::p_fc("PXN(Y118)", "FRAX486", inc) :- p_occupancy("PXN(Y118)", "FRAX486", dec).
0.001::p_fc("PXN(Y118)", "FRAX486", dec); 0.5378038408::p_fc("PXN(Y118)", "FRAX486", inc) :- p_occupancy("PXN(Y118)", "FRAX486", inc).
0.1178193292::p_fc("PXN(Y118)", "GDC0941", dec); 0.001::p_fc("PXN(Y118)", "GDC0941", inc) :- p_occupancy("PXN(Y118)", "GDC0941", dec).
0.001::p_fc("PXN(Y118)", "GDC0941", dec); 0.1178193292::p_fc("PXN(Y118)", "GDC0941", inc) :- p_occupancy("PXN(Y118)", "GDC0941", inc).
0.0315369963::p_fc("PXN(Y118)", "GDC0994", dec); 0.001::p_fc("PXN(Y118)", "GDC0994", inc) :- p_occupancy("PXN(Y118)", "GDC0994", dec).
0.001::p_fc("PXN(Y118)", "GDC0994", dec); 0.0315369963::p_fc("PXN(Y118)", "GDC0994", inc) :- p_occupancy("PXN(Y118)", "GDC0994", inc).
0.5384859956::p_fc("PXN(Y118)", "GF109203X", dec); 0.001::p_fc("PXN(Y118)", "GF109203X", inc) :- p_occupancy("PXN(Y118)", "GF109203X", dec).
0.001::p_fc("PXN(Y118)", "GF109203X", dec); 0.5384859956::p_fc("PXN(Y118)", "GF109203X", inc) :- p_occupancy("PXN(Y118)", "GF109203X", inc).
0.9906494927::p_fc("PXN(Y118)", "GO6983", dec); 0.001::p_fc("PXN(Y118)", "GO6983", inc) :- p_occupancy("PXN(Y118)", "GO6983", dec).
0.001::p_fc("PXN(Y118)", "GO6983", dec); 0.9906494927::p_fc("PXN(Y118)", "GO6983", inc) :- p_occupancy("PXN(Y118)", "GO6983", inc).
0.9864940342::p_fc("PXN(Y118)", "GSK2334470", dec); 0.001::p_fc("PXN(Y118)", "GSK2334470", inc) :- p_occupancy("PXN(Y118)", "GSK2334470", dec).
0.001::p_fc("PXN(Y118)", "GSK2334470", dec); 0.9864940342::p_fc("PXN(Y118)", "GSK2334470", inc) :- p_occupancy("PXN(Y118)", "GSK2334470", inc).
0.9708094142::p_fc("PXN(Y118)", "GSK690693", dec); 0.001::p_fc("PXN(Y118)", "GSK690693", inc) :- p_occupancy("PXN(Y118)", "GSK690693", dec).
0.001::p_fc("PXN(Y118)", "GSK690693", dec); 0.9708094142::p_fc("PXN(Y118)", "GSK690693", inc) :- p_occupancy("PXN(Y118)", "GSK690693", inc).
0.6831749835::p_fc("PXN(Y118)", "Go6976", dec); 0.001::p_fc("PXN(Y118)", "Go6976", inc) :- p_occupancy("PXN(Y118)", "Go6976", dec).
0.001::p_fc("PXN(Y118)", "Go6976", dec); 0.6831749835::p_fc("PXN(Y118)", "Go6976", inc) :- p_occupancy("PXN(Y118)", "Go6976", inc).
0.7675820857::p_fc("PXN(Y118)", "H89", dec); 0.001::p_fc("PXN(Y118)", "H89", inc) :- p_occupancy("PXN(Y118)", "H89", dec).
0.001::p_fc("PXN(Y118)", "H89", dec); 0.7675820857::p_fc("PXN(Y118)", "H89", inc) :- p_occupancy("PXN(Y118)", "H89", inc).
0.0277426894::p_fc("PXN(Y118)", "HS173", dec); 0.001::p_fc("PXN(Y118)", "HS173", inc) :- p_occupancy("PXN(Y118)", "HS173", dec).
0.001::p_fc("PXN(Y118)", "HS173", dec); 0.0277426894::p_fc("PXN(Y118)", "HS173", inc) :- p_occupancy("PXN(Y118)", "HS173", inc).
0.8511082469::p_fc("PXN(Y118)", "Ipatasertib", dec); 0.001::p_fc("PXN(Y118)", "Ipatasertib", inc) :- p_occupancy("PXN(Y118)", "Ipatasertib", dec).
0.001::p_fc("PXN(Y118)", "Ipatasertib", dec); 0.8511082469::p_fc("PXN(Y118)", "Ipatasertib", inc) :- p_occupancy("PXN(Y118)", "Ipatasertib", inc).
0.4816862348::p_fc("PXN(Y118)", "JNJ", dec); 0.001::p_fc("PXN(Y118)", "JNJ", inc) :- p_occupancy("PXN(Y118)", "JNJ", dec).
0.001::p_fc("PXN(Y118)", "JNJ", dec); 0.4816862348::p_fc("PXN(Y118)", "JNJ", inc) :- p_occupancy("PXN(Y118)", "JNJ", inc).
0.9603743239::p_fc("PXN(Y118)", "JNK", dec); 0.001::p_fc("PXN(Y118)", "JNK", inc) :- p_occupancy("PXN(Y118)", "JNK", dec).
0.001::p_fc("PXN(Y118)", "JNK", dec); 0.9603743239::p_fc("PXN(Y118)", "JNK", inc) :- p_occupancy("PXN(Y118)", "JNK", inc).
0.9058898918::p_fc("PXN(Y118)", "KD025", dec); 0.001::p_fc("PXN(Y118)", "KD025", inc) :- p_occupancy("PXN(Y118)", "KD025", dec).
0.001::p_fc("PXN(Y118)", "KD025", dec); 0.9058898918::p_fc("PXN(Y118)", "KD025", inc) :- p_occupancy("PXN(Y118)", "KD025", inc).
0.8984932443::p_fc("PXN(Y118)", "KN62", dec); 0.001::p_fc("PXN(Y118)", "KN62", inc) :- p_occupancy("PXN(Y118)", "KN62", dec).
0.001::p_fc("PXN(Y118)", "KN62", dec); 0.8984932443::p_fc("PXN(Y118)", "KN62", inc) :- p_occupancy("PXN(Y118)", "KN62", inc).
0.5353616374::p_fc("PXN(Y118)", "KN93", dec); 0.001::p_fc("PXN(Y118)", "KN93", inc) :- p_occupancy("PXN(Y118)", "KN93", dec).
0.001::p_fc("PXN(Y118)", "KN93", dec); 0.5353616374::p_fc("PXN(Y118)", "KN93", inc) :- p_occupancy("PXN(Y118)", "KN93", inc).
0.1091188129::p_fc("PXN(Y118)", "Ku0063794", dec); 0.001::p_fc("PXN(Y118)", "Ku0063794", inc) :- p_occupancy("PXN(Y118)", "Ku0063794", dec).
0.001::p_fc("PXN(Y118)", "Ku0063794", dec); 0.1091188129::p_fc("PXN(Y118)", "Ku0063794", inc) :- p_occupancy("PXN(Y118)", "Ku0063794", inc).
0.2249451734::p_fc("PXN(Y118)", "LY2090314", dec); 0.001::p_fc("PXN(Y118)", "LY2090314", inc) :- p_occupancy("PXN(Y118)", "LY2090314", dec).
0.001::p_fc("PXN(Y118)", "LY2090314", dec); 0.2249451734::p_fc("PXN(Y118)", "LY2090314", inc) :- p_occupancy("PXN(Y118)", "LY2090314", inc).
0.1769225762::p_fc("PXN(Y118)", "LY2584702", dec); 0.001::p_fc("PXN(Y118)", "LY2584702", inc) :- p_occupancy("PXN(Y118)", "LY2584702", dec).
0.001::p_fc("PXN(Y118)", "LY2584702", dec); 0.1769225762::p_fc("PXN(Y118)", "LY2584702", inc) :- p_occupancy("PXN(Y118)", "LY2584702", inc).
0.5712042473::p_fc("PXN(Y118)", "LY2835219", dec); 0.001::p_fc("PXN(Y118)", "LY2835219", inc) :- p_occupancy("PXN(Y118)", "LY2835219", dec).
0.001::p_fc("PXN(Y118)", "LY2835219", dec); 0.5712042473::p_fc("PXN(Y118)", "LY2835219", inc) :- p_occupancy("PXN(Y118)", "LY2835219", inc).
0.7971359388::p_fc("PXN(Y118)", "Linsitinib", dec); 0.001::p_fc("PXN(Y118)", "Linsitinib", inc) :- p_occupancy("PXN(Y118)", "Linsitinib", dec).
0.001::p_fc("PXN(Y118)", "Linsitinib", dec); 0.7971359388::p_fc("PXN(Y118)", "Linsitinib", inc) :- p_occupancy("PXN(Y118)", "Linsitinib", inc).
0.4088785794::p_fc("PXN(Y118)", "MK2206", dec); 0.001::p_fc("PXN(Y118)", "MK2206", inc) :- p_occupancy("PXN(Y118)", "MK2206", dec).
0.001::p_fc("PXN(Y118)", "MK2206", dec); 0.4088785794::p_fc("PXN(Y118)", "MK2206", inc) :- p_occupancy("PXN(Y118)", "MK2206", inc).
0.5705184802::p_fc("PXN(Y118)", "NU7441", dec); 0.001::p_fc("PXN(Y118)", "NU7441", inc) :- p_occupancy("PXN(Y118)", "NU7441", dec).
0.001::p_fc("PXN(Y118)", "NU7441", dec); 0.5705184802::p_fc("PXN(Y118)", "NU7441", inc) :- p_occupancy("PXN(Y118)", "NU7441", inc).
0.8516210849::p_fc("PXN(Y118)", "PD153035", dec); 0.001::p_fc("PXN(Y118)", "PD153035", inc) :- p_occupancy("PXN(Y118)", "PD153035", dec).
0.001::p_fc("PXN(Y118)", "PD153035", dec); 0.8516210849::p_fc("PXN(Y118)", "PD153035", inc) :- p_occupancy("PXN(Y118)", "PD153035", inc).
0.7019277725::p_fc("PXN(Y118)", "PF3758309", dec); 0.001::p_fc("PXN(Y118)", "PF3758309", inc) :- p_occupancy("PXN(Y118)", "PF3758309", dec).
0.001::p_fc("PXN(Y118)", "PF3758309", dec); 0.7019277725::p_fc("PXN(Y118)", "PF3758309", inc) :- p_occupancy("PXN(Y118)", "PF3758309", inc).
0.561732033::p_fc("PXN(Y118)", "PF4708671", dec); 0.001::p_fc("PXN(Y118)", "PF4708671", inc) :- p_occupancy("PXN(Y118)", "PF4708671", dec).
0.001::p_fc("PXN(Y118)", "PF4708671", dec); 0.561732033::p_fc("PXN(Y118)", "PF4708671", inc) :- p_occupancy("PXN(Y118)", "PF4708671", inc).
0.8069934557::p_fc("PXN(Y118)", "PH797804", dec); 0.001::p_fc("PXN(Y118)", "PH797804", inc) :- p_occupancy("PXN(Y118)", "PH797804", dec).
0.001::p_fc("PXN(Y118)", "PH797804", dec); 0.8069934557::p_fc("PXN(Y118)", "PH797804", inc) :- p_occupancy("PXN(Y118)", "PH797804", inc).
0.5049602012::p_fc("PXN(Y118)", "PIK294", dec); 0.001::p_fc("PXN(Y118)", "PIK294", inc) :- p_occupancy("PXN(Y118)", "PIK294", dec).
0.001::p_fc("PXN(Y118)", "PIK294", dec); 0.5049602012::p_fc("PXN(Y118)", "PIK294", inc) :- p_occupancy("PXN(Y118)", "PIK294", inc).
0.0824204559::p_fc("PXN(Y118)", "Ribociclib", dec); 0.001::p_fc("PXN(Y118)", "Ribociclib", inc) :- p_occupancy("PXN(Y118)", "Ribociclib", dec).
0.001::p_fc("PXN(Y118)", "Ribociclib", dec); 0.0824204559::p_fc("PXN(Y118)", "Ribociclib", inc) :- p_occupancy("PXN(Y118)", "Ribociclib", inc).
0.8269146096::p_fc("PXN(Y118)", "Ripasudil", dec); 0.001::p_fc("PXN(Y118)", "Ripasudil", inc) :- p_occupancy("PXN(Y118)", "Ripasudil", dec).
0.001::p_fc("PXN(Y118)", "Ripasudil", dec); 0.8269146096::p_fc("PXN(Y118)", "Ripasudil", inc) :- p_occupancy("PXN(Y118)", "Ripasudil", inc).
0.7151954347::p_fc("PXN(Y118)", "SP600125", dec); 0.001::p_fc("PXN(Y118)", "SP600125", inc) :- p_occupancy("PXN(Y118)", "SP600125", dec).
0.001::p_fc("PXN(Y118)", "SP600125", dec); 0.7151954347::p_fc("PXN(Y118)", "SP600125", inc) :- p_occupancy("PXN(Y118)", "SP600125", inc).
0.7337978062::p_fc("PXN(Y118)", "Selumetinib", dec); 0.001::p_fc("PXN(Y118)", "Selumetinib", inc) :- p_occupancy("PXN(Y118)", "Selumetinib", dec).
0.001::p_fc("PXN(Y118)", "Selumetinib", dec); 0.7337978062::p_fc("PXN(Y118)", "Selumetinib", inc) :- p_occupancy("PXN(Y118)", "Selumetinib", inc).
0.8363856222::p_fc("PXN(Y118)", "TAK715", dec); 0.001::p_fc("PXN(Y118)", "TAK715", inc) :- p_occupancy("PXN(Y118)", "TAK715", dec).
0.001::p_fc("PXN(Y118)", "TAK715", dec); 0.8363856222::p_fc("PXN(Y118)", "TAK715", inc) :- p_occupancy("PXN(Y118)", "TAK715", inc).
0.3497798596::p_fc("PXN(Y118)", "TBCA", dec); 0.001::p_fc("PXN(Y118)", "TBCA", inc) :- p_occupancy("PXN(Y118)", "TBCA", dec).
0.001::p_fc("PXN(Y118)", "TBCA", dec); 0.3497798596::p_fc("PXN(Y118)", "TBCA", inc) :- p_occupancy("PXN(Y118)", "TBCA", inc).
0.1043513088::p_fc("PXN(Y118)", "TGX221", dec); 0.001::p_fc("PXN(Y118)", "TGX221", inc) :- p_occupancy("PXN(Y118)", "TGX221", dec).
0.001::p_fc("PXN(Y118)", "TGX221", dec); 0.1043513088::p_fc("PXN(Y118)", "TGX221", inc) :- p_occupancy("PXN(Y118)", "TGX221", inc).
0.7441700633::p_fc("PXN(Y118)", "Tofacitinib", dec); 0.001::p_fc("PXN(Y118)", "Tofacitinib", inc) :- p_occupancy("PXN(Y118)", "Tofacitinib", dec).
0.001::p_fc("PXN(Y118)", "Tofacitinib", dec); 0.7441700633::p_fc("PXN(Y118)", "Tofacitinib", inc) :- p_occupancy("PXN(Y118)", "Tofacitinib", inc).
0.7512147063::p_fc("PXN(Y118)", "Torin", dec); 0.001::p_fc("PXN(Y118)", "Torin", inc) :- p_occupancy("PXN(Y118)", "Torin", dec).
0.001::p_fc("PXN(Y118)", "Torin", dec); 0.7512147063::p_fc("PXN(Y118)", "Torin", inc) :- p_occupancy("PXN(Y118)", "Torin", inc).
0.6976788223::p_fc("PXN(Y118)", "Trametinib", dec); 0.001::p_fc("PXN(Y118)", "Trametinib", inc) :- p_occupancy("PXN(Y118)", "Trametinib", dec).
0.001::p_fc("PXN(Y118)", "Trametinib", dec); 0.6976788223::p_fc("PXN(Y118)", "Trametinib", inc) :- p_occupancy("PXN(Y118)", "Trametinib", inc).
0.8447583681::p_fc("PXN(Y118)", "U73122", dec); 0.001::p_fc("PXN(Y118)", "U73122", inc) :- p_occupancy("PXN(Y118)", "U73122", dec).
0.001::p_fc("PXN(Y118)", "U73122", dec); 0.8447583681::p_fc("PXN(Y118)", "U73122", inc) :- p_occupancy("PXN(Y118)", "U73122", inc).
0.7669207983::p_fc("PXN(Y118)", "Ulixertinib", dec); 0.001::p_fc("PXN(Y118)", "Ulixertinib", inc) :- p_occupancy("PXN(Y118)", "Ulixertinib", dec).
0.001::p_fc("PXN(Y118)", "Ulixertinib", dec); 0.7669207983::p_fc("PXN(Y118)", "Ulixertinib", inc) :- p_occupancy("PXN(Y118)", "Ulixertinib", inc).
0.5054272534::p_fc("PXN(Y118)", "Vemurafenib", dec); 0.001::p_fc("PXN(Y118)", "Vemurafenib", inc) :- p_occupancy("PXN(Y118)", "Vemurafenib", dec).
0.001::p_fc("PXN(Y118)", "Vemurafenib", dec); 0.5054272534::p_fc("PXN(Y118)", "Vemurafenib", inc) :- p_occupancy("PXN(Y118)", "Vemurafenib", inc).
0.047066323::p_fc("PXN(Y88)", "AC220", dec); 0.001::p_fc("PXN(Y88)", "AC220", inc) :- p_occupancy("PXN(Y88)", "AC220", dec).
0.001::p_fc("PXN(Y88)", "AC220", dec); 0.047066323::p_fc("PXN(Y88)", "AC220", inc) :- p_occupancy("PXN(Y88)", "AC220", inc).
0.0216369628::p_fc("PXN(Y88)", "AT13148", dec); 0.001::p_fc("PXN(Y88)", "AT13148", inc) :- p_occupancy("PXN(Y88)", "AT13148", dec).
0.001::p_fc("PXN(Y88)", "AT13148", dec); 0.0216369628::p_fc("PXN(Y88)", "AT13148", inc) :- p_occupancy("PXN(Y88)", "AT13148", inc).
0.1309504879::p_fc("PXN(Y88)", "AZ20", dec); 0.001::p_fc("PXN(Y88)", "AZ20", inc) :- p_occupancy("PXN(Y88)", "AZ20", dec).
0.001::p_fc("PXN(Y88)", "AZ20", dec); 0.1309504879::p_fc("PXN(Y88)", "AZ20", inc) :- p_occupancy("PXN(Y88)", "AZ20", inc).
0.0445095244::p_fc("PXN(Y88)", "AZD1480", dec); 0.001::p_fc("PXN(Y88)", "AZD1480", inc) :- p_occupancy("PXN(Y88)", "AZD1480", dec).
0.001::p_fc("PXN(Y88)", "AZD1480", dec); 0.0445095244::p_fc("PXN(Y88)", "AZD1480", inc) :- p_occupancy("PXN(Y88)", "AZD1480", inc).
0.9957274228::p_fc("PXN(Y88)", "AZD3759", dec); 0.001::p_fc("PXN(Y88)", "AZD3759", inc) :- p_occupancy("PXN(Y88)", "AZD3759", dec).
0.001::p_fc("PXN(Y88)", "AZD3759", dec); 0.9957274228::p_fc("PXN(Y88)", "AZD3759", inc) :- p_occupancy("PXN(Y88)", "AZD3759", inc).
0.1343170435::p_fc("PXN(Y88)", "AZD5363", dec); 0.001::p_fc("PXN(Y88)", "AZD5363", inc) :- p_occupancy("PXN(Y88)", "AZD5363", dec).
0.001::p_fc("PXN(Y88)", "AZD5363", dec); 0.1343170435::p_fc("PXN(Y88)", "AZD5363", inc) :- p_occupancy("PXN(Y88)", "AZD5363", inc).
0.9974859666::p_fc("PXN(Y88)", "AZD5438", dec); 0.001::p_fc("PXN(Y88)", "AZD5438", inc) :- p_occupancy("PXN(Y88)", "AZD5438", dec).
0.001::p_fc("PXN(Y88)", "AZD5438", dec); 0.9974859666::p_fc("PXN(Y88)", "AZD5438", inc) :- p_occupancy("PXN(Y88)", "AZD5438", inc).
0.9347411987::p_fc("PXN(Y88)", "AZD6482", dec); 0.001::p_fc("PXN(Y88)", "AZD6482", inc) :- p_occupancy("PXN(Y88)", "AZD6482", dec).
0.001::p_fc("PXN(Y88)", "AZD6482", dec); 0.9347411987::p_fc("PXN(Y88)", "AZD6482", inc) :- p_occupancy("PXN(Y88)", "AZD6482", inc).
0.930566927::p_fc("PXN(Y88)", "AZD6738", dec); 0.001::p_fc("PXN(Y88)", "AZD6738", inc) :- p_occupancy("PXN(Y88)", "AZD6738", dec).
0.001::p_fc("PXN(Y88)", "AZD6738", dec); 0.930566927::p_fc("PXN(Y88)", "AZD6738", inc) :- p_occupancy("PXN(Y88)", "AZD6738", inc).
0.6812906279::p_fc("PXN(Y88)", "AZD8055", dec); 0.001::p_fc("PXN(Y88)", "AZD8055", inc) :- p_occupancy("PXN(Y88)", "AZD8055", dec).
0.001::p_fc("PXN(Y88)", "AZD8055", dec); 0.6812906279::p_fc("PXN(Y88)", "AZD8055", inc) :- p_occupancy("PXN(Y88)", "AZD8055", inc).
0.965247631::p_fc("PXN(Y88)", "Amuvatinib", dec); 0.001::p_fc("PXN(Y88)", "Amuvatinib", inc) :- p_occupancy("PXN(Y88)", "Amuvatinib", dec).
0.001::p_fc("PXN(Y88)", "Amuvatinib", dec); 0.965247631::p_fc("PXN(Y88)", "Amuvatinib", inc) :- p_occupancy("PXN(Y88)", "Amuvatinib", inc).
0.063252554::p_fc("PXN(Y88)", "BX912", dec); 0.001::p_fc("PXN(Y88)", "BX912", inc) :- p_occupancy("PXN(Y88)", "BX912", dec).
0.001::p_fc("PXN(Y88)", "BX912", dec); 0.063252554::p_fc("PXN(Y88)", "BX912", inc) :- p_occupancy("PXN(Y88)", "BX912", inc).
0.9764021788::p_fc("PXN(Y88)", "Bosutinib", dec); 0.001::p_fc("PXN(Y88)", "Bosutinib", inc) :- p_occupancy("PXN(Y88)", "Bosutinib", dec).
0.001::p_fc("PXN(Y88)", "Bosutinib", dec); 0.9764021788::p_fc("PXN(Y88)", "Bosutinib", inc) :- p_occupancy("PXN(Y88)", "Bosutinib", inc).
0.3605186185::p_fc("PXN(Y88)", "CAL101", dec); 0.001::p_fc("PXN(Y88)", "CAL101", inc) :- p_occupancy("PXN(Y88)", "CAL101", dec).
0.001::p_fc("PXN(Y88)", "CAL101", dec); 0.3605186185::p_fc("PXN(Y88)", "CAL101", inc) :- p_occupancy("PXN(Y88)", "CAL101", inc).
0.1887930785::p_fc("PXN(Y88)", "CHIR99021", dec); 0.001::p_fc("PXN(Y88)", "CHIR99021", inc) :- p_occupancy("PXN(Y88)", "CHIR99021", dec).
0.001::p_fc("PXN(Y88)", "CHIR99021", dec); 0.1887930785::p_fc("PXN(Y88)", "CHIR99021", inc) :- p_occupancy("PXN(Y88)", "CHIR99021", inc).
0.7878979534::p_fc("PXN(Y88)", "CX4945", dec); 0.001::p_fc("PXN(Y88)", "CX4945", inc) :- p_occupancy("PXN(Y88)", "CX4945", dec).
0.001::p_fc("PXN(Y88)", "CX4945", dec); 0.7878979534::p_fc("PXN(Y88)", "CX4945", inc) :- p_occupancy("PXN(Y88)", "CX4945", inc).
0.4959928152::p_fc("PXN(Y88)", "DNAPK", dec); 0.001::p_fc("PXN(Y88)", "DNAPK", inc) :- p_occupancy("PXN(Y88)", "DNAPK", dec).
0.001::p_fc("PXN(Y88)", "DNAPK", dec); 0.4959928152::p_fc("PXN(Y88)", "DNAPK", inc) :- p_occupancy("PXN(Y88)", "DNAPK", inc).
0.0728963571::p_fc("PXN(Y88)", "Dabrafenib", dec); 0.001::p_fc("PXN(Y88)", "Dabrafenib", inc) :- p_occupancy("PXN(Y88)", "Dabrafenib", dec).
0.001::p_fc("PXN(Y88)", "Dabrafenib", dec); 0.0728963571::p_fc("PXN(Y88)", "Dabrafenib", inc) :- p_occupancy("PXN(Y88)", "Dabrafenib", inc).
0.9582732536::p_fc("PXN(Y88)", "Dasatinib", dec); 0.001::p_fc("PXN(Y88)", "Dasatinib", inc) :- p_occupancy("PXN(Y88)", "Dasatinib", dec).
0.001::p_fc("PXN(Y88)", "Dasatinib", dec); 0.9582732536::p_fc("PXN(Y88)", "Dasatinib", inc) :- p_occupancy("PXN(Y88)", "Dasatinib", inc).
0.4006150241::p_fc("PXN(Y88)", "Edelfosine", dec); 0.001::p_fc("PXN(Y88)", "Edelfosine", inc) :- p_occupancy("PXN(Y88)", "Edelfosine", dec).
0.001::p_fc("PXN(Y88)", "Edelfosine", dec); 0.4006150241::p_fc("PXN(Y88)", "Edelfosine", inc) :- p_occupancy("PXN(Y88)", "Edelfosine", inc).
0.9999112763::p_fc("PXN(Y88)", "FRAX486", dec); 0.001::p_fc("PXN(Y88)", "FRAX486", inc) :- p_occupancy("PXN(Y88)", "FRAX486", dec).
0.001::p_fc("PXN(Y88)", "FRAX486", dec); 0.9999112763::p_fc("PXN(Y88)", "FRAX486", inc) :- p_occupancy("PXN(Y88)", "FRAX486", inc).
0.3746754673::p_fc("PXN(Y88)", "GDC0941", dec); 0.001::p_fc("PXN(Y88)", "GDC0941", inc) :- p_occupancy("PXN(Y88)", "GDC0941", dec).
0.001::p_fc("PXN(Y88)", "GDC0941", dec); 0.3746754673::p_fc("PXN(Y88)", "GDC0941", inc) :- p_occupancy("PXN(Y88)", "GDC0941", inc).
0.0291059976::p_fc("PXN(Y88)", "GDC0994", dec); 0.001::p_fc("PXN(Y88)", "GDC0994", inc) :- p_occupancy("PXN(Y88)", "GDC0994", dec).
0.001::p_fc("PXN(Y88)", "GDC0994", dec); 0.0291059976::p_fc("PXN(Y88)", "GDC0994", inc) :- p_occupancy("PXN(Y88)", "GDC0994", inc).
0.9999970037::p_fc("PXN(Y88)", "GF109203X", dec); 0.001::p_fc("PXN(Y88)", "GF109203X", inc) :- p_occupancy("PXN(Y88)", "GF109203X", dec).
0.001::p_fc("PXN(Y88)", "GF109203X", dec); 0.9999970037::p_fc("PXN(Y88)", "GF109203X", inc) :- p_occupancy("PXN(Y88)", "GF109203X", inc).
0.1692324945::p_fc("PXN(Y88)", "GO6983", dec); 0.001::p_fc("PXN(Y88)", "GO6983", inc) :- p_occupancy("PXN(Y88)", "GO6983", dec).
0.001::p_fc("PXN(Y88)", "GO6983", dec); 0.1692324945::p_fc("PXN(Y88)", "GO6983", inc) :- p_occupancy("PXN(Y88)", "GO6983", inc).
0.9293541878::p_fc("PXN(Y88)", "GSK2334470", dec); 0.001::p_fc("PXN(Y88)", "GSK2334470", inc) :- p_occupancy("PXN(Y88)", "GSK2334470", dec).
0.001::p_fc("PXN(Y88)", "GSK2334470", dec); 0.9293541878::p_fc("PXN(Y88)", "GSK2334470", inc) :- p_occupancy("PXN(Y88)", "GSK2334470", inc).
0.3864541247::p_fc("PXN(Y88)", "GSK690693", dec); 0.001::p_fc("PXN(Y88)", "GSK690693", inc) :- p_occupancy("PXN(Y88)", "GSK690693", dec).
0.001::p_fc("PXN(Y88)", "GSK690693", dec); 0.3864541247::p_fc("PXN(Y88)", "GSK690693", inc) :- p_occupancy("PXN(Y88)", "GSK690693", inc).
0.4481561997::p_fc("PXN(Y88)", "Go6976", dec); 0.001::p_fc("PXN(Y88)", "Go6976", inc) :- p_occupancy("PXN(Y88)", "Go6976", dec).
0.001::p_fc("PXN(Y88)", "Go6976", dec); 0.4481561997::p_fc("PXN(Y88)", "Go6976", inc) :- p_occupancy("PXN(Y88)", "Go6976", inc).
0.6502938204::p_fc("PXN(Y88)", "H89", dec); 0.001::p_fc("PXN(Y88)", "H89", inc) :- p_occupancy("PXN(Y88)", "H89", dec).
0.001::p_fc("PXN(Y88)", "H89", dec); 0.6502938204::p_fc("PXN(Y88)", "H89", inc) :- p_occupancy("PXN(Y88)", "H89", inc).
0.0616332025::p_fc("PXN(Y88)", "HS173", dec); 0.001::p_fc("PXN(Y88)", "HS173", inc) :- p_occupancy("PXN(Y88)", "HS173", dec).
0.001::p_fc("PXN(Y88)", "HS173", dec); 0.0616332025::p_fc("PXN(Y88)", "HS173", inc) :- p_occupancy("PXN(Y88)", "HS173", inc).
0.9994455223::p_fc("PXN(Y88)", "Ipatasertib", dec); 0.001::p_fc("PXN(Y88)", "Ipatasertib", inc) :- p_occupancy("PXN(Y88)", "Ipatasertib", dec).
0.001::p_fc("PXN(Y88)", "Ipatasertib", dec); 0.9994455223::p_fc("PXN(Y88)", "Ipatasertib", inc) :- p_occupancy("PXN(Y88)", "Ipatasertib", inc).
0.9999378222::p_fc("PXN(Y88)", "JNJ", dec); 0.001::p_fc("PXN(Y88)", "JNJ", inc) :- p_occupancy("PXN(Y88)", "JNJ", dec).
0.001::p_fc("PXN(Y88)", "JNJ", dec); 0.9999378222::p_fc("PXN(Y88)", "JNJ", inc) :- p_occupancy("PXN(Y88)", "JNJ", inc).
0.5894966595::p_fc("PXN(Y88)", "JNK", dec); 0.001::p_fc("PXN(Y88)", "JNK", inc) :- p_occupancy("PXN(Y88)", "JNK", dec).
0.001::p_fc("PXN(Y88)", "JNK", dec); 0.5894966595::p_fc("PXN(Y88)", "JNK", inc) :- p_occupancy("PXN(Y88)", "JNK", inc).
0.8517144202::p_fc("PXN(Y88)", "KD025", dec); 0.001::p_fc("PXN(Y88)", "KD025", inc) :- p_occupancy("PXN(Y88)", "KD025", dec).
0.001::p_fc("PXN(Y88)", "KD025", dec); 0.8517144202::p_fc("PXN(Y88)", "KD025", inc) :- p_occupancy("PXN(Y88)", "KD025", inc).
0.9995741441::p_fc("PXN(Y88)", "KN62", dec); 0.001::p_fc("PXN(Y88)", "KN62", inc) :- p_occupancy("PXN(Y88)", "KN62", dec).
0.001::p_fc("PXN(Y88)", "KN62", dec); 0.9995741441::p_fc("PXN(Y88)", "KN62", inc) :- p_occupancy("PXN(Y88)", "KN62", inc).
0.2684021958::p_fc("PXN(Y88)", "KN93", dec); 0.001::p_fc("PXN(Y88)", "KN93", inc) :- p_occupancy("PXN(Y88)", "KN93", dec).
0.001::p_fc("PXN(Y88)", "KN93", dec); 0.2684021958::p_fc("PXN(Y88)", "KN93", inc) :- p_occupancy("PXN(Y88)", "KN93", inc).
0.991950668::p_fc("PXN(Y88)", "Ku0063794", dec); 0.001::p_fc("PXN(Y88)", "Ku0063794", inc) :- p_occupancy("PXN(Y88)", "Ku0063794", dec).
0.001::p_fc("PXN(Y88)", "Ku0063794", dec); 0.991950668::p_fc("PXN(Y88)", "Ku0063794", inc) :- p_occupancy("PXN(Y88)", "Ku0063794", inc).
0.2855056065::p_fc("PXN(Y88)", "LY2090314", dec); 0.001::p_fc("PXN(Y88)", "LY2090314", inc) :- p_occupancy("PXN(Y88)", "LY2090314", dec).
0.001::p_fc("PXN(Y88)", "LY2090314", dec); 0.2855056065::p_fc("PXN(Y88)", "LY2090314", inc) :- p_occupancy("PXN(Y88)", "LY2090314", inc).
0.425495598::p_fc("PXN(Y88)", "LY2584702", dec); 0.001::p_fc("PXN(Y88)", "LY2584702", inc) :- p_occupancy("PXN(Y88)", "LY2584702", dec).
0.001::p_fc("PXN(Y88)", "LY2584702", dec); 0.425495598::p_fc("PXN(Y88)", "LY2584702", inc) :- p_occupancy("PXN(Y88)", "LY2584702", inc).
0.9921809605::p_fc("PXN(Y88)", "LY2835219", dec); 0.001::p_fc("PXN(Y88)", "LY2835219", inc) :- p_occupancy("PXN(Y88)", "LY2835219", dec).
0.001::p_fc("PXN(Y88)", "LY2835219", dec); 0.9921809605::p_fc("PXN(Y88)", "LY2835219", inc) :- p_occupancy("PXN(Y88)", "LY2835219", inc).
0.9940963211::p_fc("PXN(Y88)", "Linsitinib", dec); 0.001::p_fc("PXN(Y88)", "Linsitinib", inc) :- p_occupancy("PXN(Y88)", "Linsitinib", dec).
0.001::p_fc("PXN(Y88)", "Linsitinib", dec); 0.9940963211::p_fc("PXN(Y88)", "Linsitinib", inc) :- p_occupancy("PXN(Y88)", "Linsitinib", inc).
0.1557305412::p_fc("PXN(Y88)", "MK2206", dec); 0.001::p_fc("PXN(Y88)", "MK2206", inc) :- p_occupancy("PXN(Y88)", "MK2206", dec).
0.001::p_fc("PXN(Y88)", "MK2206", dec); 0.1557305412::p_fc("PXN(Y88)", "MK2206", inc) :- p_occupancy("PXN(Y88)", "MK2206", inc).
0.5982067253::p_fc("PXN(Y88)", "NU7441", dec); 0.001::p_fc("PXN(Y88)", "NU7441", inc) :- p_occupancy("PXN(Y88)", "NU7441", dec).
0.001::p_fc("PXN(Y88)", "NU7441", dec); 0.5982067253::p_fc("PXN(Y88)", "NU7441", inc) :- p_occupancy("PXN(Y88)", "NU7441", inc).
0.1875969306::p_fc("PXN(Y88)", "PD153035", dec); 0.001::p_fc("PXN(Y88)", "PD153035", inc) :- p_occupancy("PXN(Y88)", "PD153035", dec).
0.001::p_fc("PXN(Y88)", "PD153035", dec); 0.1875969306::p_fc("PXN(Y88)", "PD153035", inc) :- p_occupancy("PXN(Y88)", "PD153035", inc).
0.782725247::p_fc("PXN(Y88)", "PF3758309", dec); 0.001::p_fc("PXN(Y88)", "PF3758309", inc) :- p_occupancy("PXN(Y88)", "PF3758309", dec).
0.001::p_fc("PXN(Y88)", "PF3758309", dec); 0.782725247::p_fc("PXN(Y88)", "PF3758309", inc) :- p_occupancy("PXN(Y88)", "PF3758309", inc).
0.1131769163::p_fc("PXN(Y88)", "PF4708671", dec); 0.001::p_fc("PXN(Y88)", "PF4708671", inc) :- p_occupancy("PXN(Y88)", "PF4708671", dec).
0.001::p_fc("PXN(Y88)", "PF4708671", dec); 0.1131769163::p_fc("PXN(Y88)", "PF4708671", inc) :- p_occupancy("PXN(Y88)", "PF4708671", inc).
0.0980860086::p_fc("PXN(Y88)", "PH797804", dec); 0.001::p_fc("PXN(Y88)", "PH797804", inc) :- p_occupancy("PXN(Y88)", "PH797804", dec).
0.001::p_fc("PXN(Y88)", "PH797804", dec); 0.0980860086::p_fc("PXN(Y88)", "PH797804", inc) :- p_occupancy("PXN(Y88)", "PH797804", inc).
0.5606255158::p_fc("PXN(Y88)", "PIK294", dec); 0.001::p_fc("PXN(Y88)", "PIK294", inc) :- p_occupancy("PXN(Y88)", "PIK294", dec).
0.001::p_fc("PXN(Y88)", "PIK294", dec); 0.5606255158::p_fc("PXN(Y88)", "PIK294", inc) :- p_occupancy("PXN(Y88)", "PIK294", inc).
0.9996010355::p_fc("PXN(Y88)", "Ribociclib", dec); 0.001::p_fc("PXN(Y88)", "Ribociclib", inc) :- p_occupancy("PXN(Y88)", "Ribociclib", dec).
0.001::p_fc("PXN(Y88)", "Ribociclib", dec); 0.9996010355::p_fc("PXN(Y88)", "Ribociclib", inc) :- p_occupancy("PXN(Y88)", "Ribociclib", inc).
0.3159993774::p_fc("PXN(Y88)", "Ripasudil", dec); 0.001::p_fc("PXN(Y88)", "Ripasudil", inc) :- p_occupancy("PXN(Y88)", "Ripasudil", dec).
0.001::p_fc("PXN(Y88)", "Ripasudil", dec); 0.3159993774::p_fc("PXN(Y88)", "Ripasudil", inc) :- p_occupancy("PXN(Y88)", "Ripasudil", inc).
0.0363707199::p_fc("PXN(Y88)", "SP600125", dec); 0.001::p_fc("PXN(Y88)", "SP600125", inc) :- p_occupancy("PXN(Y88)", "SP600125", dec).
0.001::p_fc("PXN(Y88)", "SP600125", dec); 0.0363707199::p_fc("PXN(Y88)", "SP600125", inc) :- p_occupancy("PXN(Y88)", "SP600125", inc).
0.2014149097::p_fc("PXN(Y88)", "Selumetinib", dec); 0.001::p_fc("PXN(Y88)", "Selumetinib", inc) :- p_occupancy("PXN(Y88)", "Selumetinib", dec).
0.001::p_fc("PXN(Y88)", "Selumetinib", dec); 0.2014149097::p_fc("PXN(Y88)", "Selumetinib", inc) :- p_occupancy("PXN(Y88)", "Selumetinib", inc).
0.2799091319::p_fc("PXN(Y88)", "TAK715", dec); 0.001::p_fc("PXN(Y88)", "TAK715", inc) :- p_occupancy("PXN(Y88)", "TAK715", dec).
0.001::p_fc("PXN(Y88)", "TAK715", dec); 0.2799091319::p_fc("PXN(Y88)", "TAK715", inc) :- p_occupancy("PXN(Y88)", "TAK715", inc).
0.096632755::p_fc("PXN(Y88)", "TBCA", dec); 0.001::p_fc("PXN(Y88)", "TBCA", inc) :- p_occupancy("PXN(Y88)", "TBCA", dec).
0.001::p_fc("PXN(Y88)", "TBCA", dec); 0.096632755::p_fc("PXN(Y88)", "TBCA", inc) :- p_occupancy("PXN(Y88)", "TBCA", inc).
0.6969662288::p_fc("PXN(Y88)", "TGX221", dec); 0.001::p_fc("PXN(Y88)", "TGX221", inc) :- p_occupancy("PXN(Y88)", "TGX221", dec).
0.001::p_fc("PXN(Y88)", "TGX221", dec); 0.6969662288::p_fc("PXN(Y88)", "TGX221", inc) :- p_occupancy("PXN(Y88)", "TGX221", inc).
0.7883871808::p_fc("PXN(Y88)", "Tofacitinib", dec); 0.001::p_fc("PXN(Y88)", "Tofacitinib", inc) :- p_occupancy("PXN(Y88)", "Tofacitinib", dec).
0.001::p_fc("PXN(Y88)", "Tofacitinib", dec); 0.7883871808::p_fc("PXN(Y88)", "Tofacitinib", inc) :- p_occupancy("PXN(Y88)", "Tofacitinib", inc).
0.9999913139::p_fc("PXN(Y88)", "Torin", dec); 0.001::p_fc("PXN(Y88)", "Torin", inc) :- p_occupancy("PXN(Y88)", "Torin", dec).
0.001::p_fc("PXN(Y88)", "Torin", dec); 0.9999913139::p_fc("PXN(Y88)", "Torin", inc) :- p_occupancy("PXN(Y88)", "Torin", inc).
0.9953874276::p_fc("PXN(Y88)", "Trametinib", dec); 0.001::p_fc("PXN(Y88)", "Trametinib", inc) :- p_occupancy("PXN(Y88)", "Trametinib", dec).
0.001::p_fc("PXN(Y88)", "Trametinib", dec); 0.9953874276::p_fc("PXN(Y88)", "Trametinib", inc) :- p_occupancy("PXN(Y88)", "Trametinib", inc).
0.553468073::p_fc("PXN(Y88)", "U73122", dec); 0.001::p_fc("PXN(Y88)", "U73122", inc) :- p_occupancy("PXN(Y88)", "U73122", dec).
0.001::p_fc("PXN(Y88)", "U73122", dec); 0.553468073::p_fc("PXN(Y88)", "U73122", inc) :- p_occupancy("PXN(Y88)", "U73122", inc).
0.8006024656::p_fc("PXN(Y88)", "Ulixertinib", dec); 0.001::p_fc("PXN(Y88)", "Ulixertinib", inc) :- p_occupancy("PXN(Y88)", "Ulixertinib", dec).
0.001::p_fc("PXN(Y88)", "Ulixertinib", dec); 0.8006024656::p_fc("PXN(Y88)", "Ulixertinib", inc) :- p_occupancy("PXN(Y88)", "Ulixertinib", inc).
0.7075949594::p_fc("PXN(Y88)", "Vemurafenib", dec); 0.001::p_fc("PXN(Y88)", "Vemurafenib", inc) :- p_occupancy("PXN(Y88)", "Vemurafenib", dec).
0.001::p_fc("PXN(Y88)", "Vemurafenib", dec); 0.7075949594::p_fc("PXN(Y88)", "Vemurafenib", inc) :- p_occupancy("PXN(Y88)", "Vemurafenib", inc).
0.9309678988::p_fc("RBM39(Y95)", "AC220", dec); 0.001::p_fc("RBM39(Y95)", "AC220", inc) :- p_occupancy("RBM39(Y95)", "AC220", dec).
0.001::p_fc("RBM39(Y95)", "AC220", dec); 0.9309678988::p_fc("RBM39(Y95)", "AC220", inc) :- p_occupancy("RBM39(Y95)", "AC220", inc).
0.762317697::p_fc("RBM39(Y95)", "AT13148", dec); 0.001::p_fc("RBM39(Y95)", "AT13148", inc) :- p_occupancy("RBM39(Y95)", "AT13148", dec).
0.001::p_fc("RBM39(Y95)", "AT13148", dec); 0.762317697::p_fc("RBM39(Y95)", "AT13148", inc) :- p_occupancy("RBM39(Y95)", "AT13148", inc).
0.5160895594::p_fc("RBM39(Y95)", "AZ20", dec); 0.001::p_fc("RBM39(Y95)", "AZ20", inc) :- p_occupancy("RBM39(Y95)", "AZ20", dec).
0.001::p_fc("RBM39(Y95)", "AZ20", dec); 0.5160895594::p_fc("RBM39(Y95)", "AZ20", inc) :- p_occupancy("RBM39(Y95)", "AZ20", inc).
0.6143415173::p_fc("RBM39(Y95)", "AZD1480", dec); 0.001::p_fc("RBM39(Y95)", "AZD1480", inc) :- p_occupancy("RBM39(Y95)", "AZD1480", dec).
0.001::p_fc("RBM39(Y95)", "AZD1480", dec); 0.6143415173::p_fc("RBM39(Y95)", "AZD1480", inc) :- p_occupancy("RBM39(Y95)", "AZD1480", inc).
0.5489718662::p_fc("RBM39(Y95)", "AZD3759", dec); 0.001::p_fc("RBM39(Y95)", "AZD3759", inc) :- p_occupancy("RBM39(Y95)", "AZD3759", dec).
0.001::p_fc("RBM39(Y95)", "AZD3759", dec); 0.5489718662::p_fc("RBM39(Y95)", "AZD3759", inc) :- p_occupancy("RBM39(Y95)", "AZD3759", inc).
0.9545694099::p_fc("RBM39(Y95)", "AZD5363", dec); 0.001::p_fc("RBM39(Y95)", "AZD5363", inc) :- p_occupancy("RBM39(Y95)", "AZD5363", dec).
0.001::p_fc("RBM39(Y95)", "AZD5363", dec); 0.9545694099::p_fc("RBM39(Y95)", "AZD5363", inc) :- p_occupancy("RBM39(Y95)", "AZD5363", inc).
0.4307558992::p_fc("RBM39(Y95)", "AZD5438", dec); 0.001::p_fc("RBM39(Y95)", "AZD5438", inc) :- p_occupancy("RBM39(Y95)", "AZD5438", dec).
0.001::p_fc("RBM39(Y95)", "AZD5438", dec); 0.4307558992::p_fc("RBM39(Y95)", "AZD5438", inc) :- p_occupancy("RBM39(Y95)", "AZD5438", inc).
0.0334821117::p_fc("RBM39(Y95)", "AZD6482", dec); 0.001::p_fc("RBM39(Y95)", "AZD6482", inc) :- p_occupancy("RBM39(Y95)", "AZD6482", dec).
0.001::p_fc("RBM39(Y95)", "AZD6482", dec); 0.0334821117::p_fc("RBM39(Y95)", "AZD6482", inc) :- p_occupancy("RBM39(Y95)", "AZD6482", inc).
0.5705267553::p_fc("RBM39(Y95)", "AZD6738", dec); 0.001::p_fc("RBM39(Y95)", "AZD6738", inc) :- p_occupancy("RBM39(Y95)", "AZD6738", dec).
0.001::p_fc("RBM39(Y95)", "AZD6738", dec); 0.5705267553::p_fc("RBM39(Y95)", "AZD6738", inc) :- p_occupancy("RBM39(Y95)", "AZD6738", inc).
1.0::p_fc("RBM39(Y95)", "AZD8055", dec); 0.001::p_fc("RBM39(Y95)", "AZD8055", inc) :- p_occupancy("RBM39(Y95)", "AZD8055", dec).
0.001::p_fc("RBM39(Y95)", "AZD8055", dec); 1.0::p_fc("RBM39(Y95)", "AZD8055", inc) :- p_occupancy("RBM39(Y95)", "AZD8055", inc).
0.7419495895::p_fc("RBM39(Y95)", "Amuvatinib", dec); 0.001::p_fc("RBM39(Y95)", "Amuvatinib", inc) :- p_occupancy("RBM39(Y95)", "Amuvatinib", dec).
0.001::p_fc("RBM39(Y95)", "Amuvatinib", dec); 0.7419495895::p_fc("RBM39(Y95)", "Amuvatinib", inc) :- p_occupancy("RBM39(Y95)", "Amuvatinib", inc).
0.379169296::p_fc("RBM39(Y95)", "BX912", dec); 0.001::p_fc("RBM39(Y95)", "BX912", inc) :- p_occupancy("RBM39(Y95)", "BX912", dec).
0.001::p_fc("RBM39(Y95)", "BX912", dec); 0.379169296::p_fc("RBM39(Y95)", "BX912", inc) :- p_occupancy("RBM39(Y95)", "BX912", inc).
0.2894050691::p_fc("RBM39(Y95)", "Bosutinib", dec); 0.001::p_fc("RBM39(Y95)", "Bosutinib", inc) :- p_occupancy("RBM39(Y95)", "Bosutinib", dec).
0.001::p_fc("RBM39(Y95)", "Bosutinib", dec); 0.2894050691::p_fc("RBM39(Y95)", "Bosutinib", inc) :- p_occupancy("RBM39(Y95)", "Bosutinib", inc).
0.4681681416::p_fc("RBM39(Y95)", "CAL101", dec); 0.001::p_fc("RBM39(Y95)", "CAL101", inc) :- p_occupancy("RBM39(Y95)", "CAL101", dec).
0.001::p_fc("RBM39(Y95)", "CAL101", dec); 0.4681681416::p_fc("RBM39(Y95)", "CAL101", inc) :- p_occupancy("RBM39(Y95)", "CAL101", inc).
0.355281453::p_fc("RBM39(Y95)", "CHIR99021", dec); 0.001::p_fc("RBM39(Y95)", "CHIR99021", inc) :- p_occupancy("RBM39(Y95)", "CHIR99021", dec).
0.001::p_fc("RBM39(Y95)", "CHIR99021", dec); 0.355281453::p_fc("RBM39(Y95)", "CHIR99021", inc) :- p_occupancy("RBM39(Y95)", "CHIR99021", inc).
0.5014738775::p_fc("RBM39(Y95)", "CX4945", dec); 0.001::p_fc("RBM39(Y95)", "CX4945", inc) :- p_occupancy("RBM39(Y95)", "CX4945", dec).
0.001::p_fc("RBM39(Y95)", "CX4945", dec); 0.5014738775::p_fc("RBM39(Y95)", "CX4945", inc) :- p_occupancy("RBM39(Y95)", "CX4945", inc).
0.1695430284::p_fc("RBM39(Y95)", "DNAPK", dec); 0.001::p_fc("RBM39(Y95)", "DNAPK", inc) :- p_occupancy("RBM39(Y95)", "DNAPK", dec).
0.001::p_fc("RBM39(Y95)", "DNAPK", dec); 0.1695430284::p_fc("RBM39(Y95)", "DNAPK", inc) :- p_occupancy("RBM39(Y95)", "DNAPK", inc).
0.2016368059::p_fc("RBM39(Y95)", "Dabrafenib", dec); 0.001::p_fc("RBM39(Y95)", "Dabrafenib", inc) :- p_occupancy("RBM39(Y95)", "Dabrafenib", dec).
0.001::p_fc("RBM39(Y95)", "Dabrafenib", dec); 0.2016368059::p_fc("RBM39(Y95)", "Dabrafenib", inc) :- p_occupancy("RBM39(Y95)", "Dabrafenib", inc).
0.0637406889::p_fc("RBM39(Y95)", "Dasatinib", dec); 0.001::p_fc("RBM39(Y95)", "Dasatinib", inc) :- p_occupancy("RBM39(Y95)", "Dasatinib", dec).
0.001::p_fc("RBM39(Y95)", "Dasatinib", dec); 0.0637406889::p_fc("RBM39(Y95)", "Dasatinib", inc) :- p_occupancy("RBM39(Y95)", "Dasatinib", inc).
0.9714815194::p_fc("RBM39(Y95)", "Edelfosine", dec); 0.001::p_fc("RBM39(Y95)", "Edelfosine", inc) :- p_occupancy("RBM39(Y95)", "Edelfosine", dec).
0.001::p_fc("RBM39(Y95)", "Edelfosine", dec); 0.9714815194::p_fc("RBM39(Y95)", "Edelfosine", inc) :- p_occupancy("RBM39(Y95)", "Edelfosine", inc).
0.5777347286::p_fc("RBM39(Y95)", "FRAX486", dec); 0.001::p_fc("RBM39(Y95)", "FRAX486", inc) :- p_occupancy("RBM39(Y95)", "FRAX486", dec).
0.001::p_fc("RBM39(Y95)", "FRAX486", dec); 0.5777347286::p_fc("RBM39(Y95)", "FRAX486", inc) :- p_occupancy("RBM39(Y95)", "FRAX486", inc).
0.9693540578::p_fc("RBM39(Y95)", "GDC0941", dec); 0.001::p_fc("RBM39(Y95)", "GDC0941", inc) :- p_occupancy("RBM39(Y95)", "GDC0941", dec).
0.001::p_fc("RBM39(Y95)", "GDC0941", dec); 0.9693540578::p_fc("RBM39(Y95)", "GDC0941", inc) :- p_occupancy("RBM39(Y95)", "GDC0941", inc).
0.0238158898::p_fc("RBM39(Y95)", "GDC0994", dec); 0.001::p_fc("RBM39(Y95)", "GDC0994", inc) :- p_occupancy("RBM39(Y95)", "GDC0994", dec).
0.001::p_fc("RBM39(Y95)", "GDC0994", dec); 0.0238158898::p_fc("RBM39(Y95)", "GDC0994", inc) :- p_occupancy("RBM39(Y95)", "GDC0994", inc).
0.6820466014::p_fc("RBM39(Y95)", "GF109203X", dec); 0.001::p_fc("RBM39(Y95)", "GF109203X", inc) :- p_occupancy("RBM39(Y95)", "GF109203X", dec).
0.001::p_fc("RBM39(Y95)", "GF109203X", dec); 0.6820466014::p_fc("RBM39(Y95)", "GF109203X", inc) :- p_occupancy("RBM39(Y95)", "GF109203X", inc).
1.0::p_fc("RBM39(Y95)", "GO6983", dec); 0.001::p_fc("RBM39(Y95)", "GO6983", inc) :- p_occupancy("RBM39(Y95)", "GO6983", dec).
0.001::p_fc("RBM39(Y95)", "GO6983", dec); 1.0::p_fc("RBM39(Y95)", "GO6983", inc) :- p_occupancy("RBM39(Y95)", "GO6983", inc).
0.1160905467::p_fc("RBM39(Y95)", "GSK2334470", dec); 0.001::p_fc("RBM39(Y95)", "GSK2334470", inc) :- p_occupancy("RBM39(Y95)", "GSK2334470", dec).
0.001::p_fc("RBM39(Y95)", "GSK2334470", dec); 0.1160905467::p_fc("RBM39(Y95)", "GSK2334470", inc) :- p_occupancy("RBM39(Y95)", "GSK2334470", inc).
0.9126382638::p_fc("RBM39(Y95)", "GSK690693", dec); 0.001::p_fc("RBM39(Y95)", "GSK690693", inc) :- p_occupancy("RBM39(Y95)", "GSK690693", dec).
0.001::p_fc("RBM39(Y95)", "GSK690693", dec); 0.9126382638::p_fc("RBM39(Y95)", "GSK690693", inc) :- p_occupancy("RBM39(Y95)", "GSK690693", inc).
0.3998764185::p_fc("RBM39(Y95)", "Go6976", dec); 0.001::p_fc("RBM39(Y95)", "Go6976", inc) :- p_occupancy("RBM39(Y95)", "Go6976", dec).
0.001::p_fc("RBM39(Y95)", "Go6976", dec); 0.3998764185::p_fc("RBM39(Y95)", "Go6976", inc) :- p_occupancy("RBM39(Y95)", "Go6976", inc).
0.1151223358::p_fc("RBM39(Y95)", "H89", dec); 0.001::p_fc("RBM39(Y95)", "H89", inc) :- p_occupancy("RBM39(Y95)", "H89", dec).
0.001::p_fc("RBM39(Y95)", "H89", dec); 0.1151223358::p_fc("RBM39(Y95)", "H89", inc) :- p_occupancy("RBM39(Y95)", "H89", inc).
0.305142845::p_fc("RBM39(Y95)", "HS173", dec); 0.001::p_fc("RBM39(Y95)", "HS173", inc) :- p_occupancy("RBM39(Y95)", "HS173", dec).
0.001::p_fc("RBM39(Y95)", "HS173", dec); 0.305142845::p_fc("RBM39(Y95)", "HS173", inc) :- p_occupancy("RBM39(Y95)", "HS173", inc).
0.2289029928::p_fc("RBM39(Y95)", "Ipatasertib", dec); 0.001::p_fc("RBM39(Y95)", "Ipatasertib", inc) :- p_occupancy("RBM39(Y95)", "Ipatasertib", dec).
0.001::p_fc("RBM39(Y95)", "Ipatasertib", dec); 0.2289029928::p_fc("RBM39(Y95)", "Ipatasertib", inc) :- p_occupancy("RBM39(Y95)", "Ipatasertib", inc).
0.1625312834::p_fc("RBM39(Y95)", "JNJ", dec); 0.001::p_fc("RBM39(Y95)", "JNJ", inc) :- p_occupancy("RBM39(Y95)", "JNJ", dec).
0.001::p_fc("RBM39(Y95)", "JNJ", dec); 0.1625312834::p_fc("RBM39(Y95)", "JNJ", inc) :- p_occupancy("RBM39(Y95)", "JNJ", inc).
0.9979086646::p_fc("RBM39(Y95)", "JNK", dec); 0.001::p_fc("RBM39(Y95)", "JNK", inc) :- p_occupancy("RBM39(Y95)", "JNK", dec).
0.001::p_fc("RBM39(Y95)", "JNK", dec); 0.9979086646::p_fc("RBM39(Y95)", "JNK", inc) :- p_occupancy("RBM39(Y95)", "JNK", inc).
0.9702642247::p_fc("RBM39(Y95)", "KD025", dec); 0.001::p_fc("RBM39(Y95)", "KD025", inc) :- p_occupancy("RBM39(Y95)", "KD025", dec).
0.001::p_fc("RBM39(Y95)", "KD025", dec); 0.9702642247::p_fc("RBM39(Y95)", "KD025", inc) :- p_occupancy("RBM39(Y95)", "KD025", inc).
0.6573697975::p_fc("RBM39(Y95)", "KN62", dec); 0.001::p_fc("RBM39(Y95)", "KN62", inc) :- p_occupancy("RBM39(Y95)", "KN62", dec).
0.001::p_fc("RBM39(Y95)", "KN62", dec); 0.6573697975::p_fc("RBM39(Y95)", "KN62", inc) :- p_occupancy("RBM39(Y95)", "KN62", inc).
0.1801443278::p_fc("RBM39(Y95)", "KN93", dec); 0.001::p_fc("RBM39(Y95)", "KN93", inc) :- p_occupancy("RBM39(Y95)", "KN93", dec).
0.001::p_fc("RBM39(Y95)", "KN93", dec); 0.1801443278::p_fc("RBM39(Y95)", "KN93", inc) :- p_occupancy("RBM39(Y95)", "KN93", inc).
0.5075570896::p_fc("RBM39(Y95)", "Ku0063794", dec); 0.001::p_fc("RBM39(Y95)", "Ku0063794", inc) :- p_occupancy("RBM39(Y95)", "Ku0063794", dec).
0.001::p_fc("RBM39(Y95)", "Ku0063794", dec); 0.5075570896::p_fc("RBM39(Y95)", "Ku0063794", inc) :- p_occupancy("RBM39(Y95)", "Ku0063794", inc).
0.0542997765::p_fc("RBM39(Y95)", "LY2090314", dec); 0.001::p_fc("RBM39(Y95)", "LY2090314", inc) :- p_occupancy("RBM39(Y95)", "LY2090314", dec).
0.001::p_fc("RBM39(Y95)", "LY2090314", dec); 0.0542997765::p_fc("RBM39(Y95)", "LY2090314", inc) :- p_occupancy("RBM39(Y95)", "LY2090314", inc).
0.0908278801::p_fc("RBM39(Y95)", "LY2584702", dec); 0.001::p_fc("RBM39(Y95)", "LY2584702", inc) :- p_occupancy("RBM39(Y95)", "LY2584702", dec).
0.001::p_fc("RBM39(Y95)", "LY2584702", dec); 0.0908278801::p_fc("RBM39(Y95)", "LY2584702", inc) :- p_occupancy("RBM39(Y95)", "LY2584702", inc).
0.3305950829::p_fc("RBM39(Y95)", "LY2835219", dec); 0.001::p_fc("RBM39(Y95)", "LY2835219", inc) :- p_occupancy("RBM39(Y95)", "LY2835219", dec).
0.001::p_fc("RBM39(Y95)", "LY2835219", dec); 0.3305950829::p_fc("RBM39(Y95)", "LY2835219", inc) :- p_occupancy("RBM39(Y95)", "LY2835219", inc).
0.4967290766::p_fc("RBM39(Y95)", "Linsitinib", dec); 0.001::p_fc("RBM39(Y95)", "Linsitinib", inc) :- p_occupancy("RBM39(Y95)", "Linsitinib", dec).
0.001::p_fc("RBM39(Y95)", "Linsitinib", dec); 0.4967290766::p_fc("RBM39(Y95)", "Linsitinib", inc) :- p_occupancy("RBM39(Y95)", "Linsitinib", inc).
0.1430382615::p_fc("RBM39(Y95)", "MK2206", dec); 0.001::p_fc("RBM39(Y95)", "MK2206", inc) :- p_occupancy("RBM39(Y95)", "MK2206", dec).
0.001::p_fc("RBM39(Y95)", "MK2206", dec); 0.1430382615::p_fc("RBM39(Y95)", "MK2206", inc) :- p_occupancy("RBM39(Y95)", "MK2206", inc).
0.2304382187::p_fc("RBM39(Y95)", "NU7441", dec); 0.001::p_fc("RBM39(Y95)", "NU7441", inc) :- p_occupancy("RBM39(Y95)", "NU7441", dec).
0.001::p_fc("RBM39(Y95)", "NU7441", dec); 0.2304382187::p_fc("RBM39(Y95)", "NU7441", inc) :- p_occupancy("RBM39(Y95)", "NU7441", inc).
0.535092167::p_fc("RBM39(Y95)", "PD153035", dec); 0.001::p_fc("RBM39(Y95)", "PD153035", inc) :- p_occupancy("RBM39(Y95)", "PD153035", dec).
0.001::p_fc("RBM39(Y95)", "PD153035", dec); 0.535092167::p_fc("RBM39(Y95)", "PD153035", inc) :- p_occupancy("RBM39(Y95)", "PD153035", inc).
0.9999989075::p_fc("RBM39(Y95)", "PF3758309", dec); 0.001::p_fc("RBM39(Y95)", "PF3758309", inc) :- p_occupancy("RBM39(Y95)", "PF3758309", dec).
0.001::p_fc("RBM39(Y95)", "PF3758309", dec); 0.9999989075::p_fc("RBM39(Y95)", "PF3758309", inc) :- p_occupancy("RBM39(Y95)", "PF3758309", inc).
0.6450155788::p_fc("RBM39(Y95)", "PF4708671", dec); 0.001::p_fc("RBM39(Y95)", "PF4708671", inc) :- p_occupancy("RBM39(Y95)", "PF4708671", dec).
0.001::p_fc("RBM39(Y95)", "PF4708671", dec); 0.6450155788::p_fc("RBM39(Y95)", "PF4708671", inc) :- p_occupancy("RBM39(Y95)", "PF4708671", inc).
0.8169457059::p_fc("RBM39(Y95)", "PH797804", dec); 0.001::p_fc("RBM39(Y95)", "PH797804", inc) :- p_occupancy("RBM39(Y95)", "PH797804", dec).
0.001::p_fc("RBM39(Y95)", "PH797804", dec); 0.8169457059::p_fc("RBM39(Y95)", "PH797804", inc) :- p_occupancy("RBM39(Y95)", "PH797804", inc).
0.3583208193::p_fc("RBM39(Y95)", "PIK294", dec); 0.001::p_fc("RBM39(Y95)", "PIK294", inc) :- p_occupancy("RBM39(Y95)", "PIK294", dec).
0.001::p_fc("RBM39(Y95)", "PIK294", dec); 0.3583208193::p_fc("RBM39(Y95)", "PIK294", inc) :- p_occupancy("RBM39(Y95)", "PIK294", inc).
0.1212071599::p_fc("RBM39(Y95)", "Ribociclib", dec); 0.001::p_fc("RBM39(Y95)", "Ribociclib", inc) :- p_occupancy("RBM39(Y95)", "Ribociclib", dec).
0.001::p_fc("RBM39(Y95)", "Ribociclib", dec); 0.1212071599::p_fc("RBM39(Y95)", "Ribociclib", inc) :- p_occupancy("RBM39(Y95)", "Ribociclib", inc).
0.7290219152::p_fc("RBM39(Y95)", "Ripasudil", dec); 0.001::p_fc("RBM39(Y95)", "Ripasudil", inc) :- p_occupancy("RBM39(Y95)", "Ripasudil", dec).
0.001::p_fc("RBM39(Y95)", "Ripasudil", dec); 0.7290219152::p_fc("RBM39(Y95)", "Ripasudil", inc) :- p_occupancy("RBM39(Y95)", "Ripasudil", inc).
0.6185572508::p_fc("RBM39(Y95)", "SP600125", dec); 0.001::p_fc("RBM39(Y95)", "SP600125", inc) :- p_occupancy("RBM39(Y95)", "SP600125", dec).
0.001::p_fc("RBM39(Y95)", "SP600125", dec); 0.6185572508::p_fc("RBM39(Y95)", "SP600125", inc) :- p_occupancy("RBM39(Y95)", "SP600125", inc).
0.5529081015::p_fc("RBM39(Y95)", "Selumetinib", dec); 0.001::p_fc("RBM39(Y95)", "Selumetinib", inc) :- p_occupancy("RBM39(Y95)", "Selumetinib", dec).
0.001::p_fc("RBM39(Y95)", "Selumetinib", dec); 0.5529081015::p_fc("RBM39(Y95)", "Selumetinib", inc) :- p_occupancy("RBM39(Y95)", "Selumetinib", inc).
0.1106145253::p_fc("RBM39(Y95)", "TAK715", dec); 0.001::p_fc("RBM39(Y95)", "TAK715", inc) :- p_occupancy("RBM39(Y95)", "TAK715", dec).
0.001::p_fc("RBM39(Y95)", "TAK715", dec); 0.1106145253::p_fc("RBM39(Y95)", "TAK715", inc) :- p_occupancy("RBM39(Y95)", "TAK715", inc).
0.505336434::p_fc("RBM39(Y95)", "TBCA", dec); 0.001::p_fc("RBM39(Y95)", "TBCA", inc) :- p_occupancy("RBM39(Y95)", "TBCA", dec).
0.001::p_fc("RBM39(Y95)", "TBCA", dec); 0.505336434::p_fc("RBM39(Y95)", "TBCA", inc) :- p_occupancy("RBM39(Y95)", "TBCA", inc).
0.1891167551::p_fc("RBM39(Y95)", "TGX221", dec); 0.001::p_fc("RBM39(Y95)", "TGX221", inc) :- p_occupancy("RBM39(Y95)", "TGX221", dec).
0.001::p_fc("RBM39(Y95)", "TGX221", dec); 0.1891167551::p_fc("RBM39(Y95)", "TGX221", inc) :- p_occupancy("RBM39(Y95)", "TGX221", inc).
0.4721870105::p_fc("RBM39(Y95)", "Tofacitinib", dec); 0.001::p_fc("RBM39(Y95)", "Tofacitinib", inc) :- p_occupancy("RBM39(Y95)", "Tofacitinib", dec).
0.001::p_fc("RBM39(Y95)", "Tofacitinib", dec); 0.4721870105::p_fc("RBM39(Y95)", "Tofacitinib", inc) :- p_occupancy("RBM39(Y95)", "Tofacitinib", inc).
0.3583645045::p_fc("RBM39(Y95)", "Torin", dec); 0.001::p_fc("RBM39(Y95)", "Torin", inc) :- p_occupancy("RBM39(Y95)", "Torin", dec).
0.001::p_fc("RBM39(Y95)", "Torin", dec); 0.3583645045::p_fc("RBM39(Y95)", "Torin", inc) :- p_occupancy("RBM39(Y95)", "Torin", inc).
0.7710179938::p_fc("RBM39(Y95)", "Trametinib", dec); 0.001::p_fc("RBM39(Y95)", "Trametinib", inc) :- p_occupancy("RBM39(Y95)", "Trametinib", dec).
0.001::p_fc("RBM39(Y95)", "Trametinib", dec); 0.7710179938::p_fc("RBM39(Y95)", "Trametinib", inc) :- p_occupancy("RBM39(Y95)", "Trametinib", inc).
0.3701230292::p_fc("RBM39(Y95)", "U73122", dec); 0.001::p_fc("RBM39(Y95)", "U73122", inc) :- p_occupancy("RBM39(Y95)", "U73122", dec).
0.001::p_fc("RBM39(Y95)", "U73122", dec); 0.3701230292::p_fc("RBM39(Y95)", "U73122", inc) :- p_occupancy("RBM39(Y95)", "U73122", inc).
0.8826246863::p_fc("RBM39(Y95)", "Ulixertinib", dec); 0.001::p_fc("RBM39(Y95)", "Ulixertinib", inc) :- p_occupancy("RBM39(Y95)", "Ulixertinib", dec).
0.001::p_fc("RBM39(Y95)", "Ulixertinib", dec); 0.8826246863::p_fc("RBM39(Y95)", "Ulixertinib", inc) :- p_occupancy("RBM39(Y95)", "Ulixertinib", inc).
0.292335332::p_fc("RBM39(Y95)", "Vemurafenib", dec); 0.001::p_fc("RBM39(Y95)", "Vemurafenib", inc) :- p_occupancy("RBM39(Y95)", "Vemurafenib", dec).
0.001::p_fc("RBM39(Y95)", "Vemurafenib", dec); 0.292335332::p_fc("RBM39(Y95)", "Vemurafenib", inc) :- p_occupancy("RBM39(Y95)", "Vemurafenib", inc).
0.3401970484::p_fc("ABI1(Y213)", "AC220", dec); 0.3401970484::p_fc("ABI1(Y213)", "AC220", inc) :- phosphosite("ABI1(Y213)").
0.4759108937::p_fc("ABI1(Y213)", "AT13148", dec); 0.4759108937::p_fc("ABI1(Y213)", "AT13148", inc) :- phosphosite("ABI1(Y213)").
0.4926205819::p_fc("ABI1(Y213)", "AZ20", dec); 0.4926205819::p_fc("ABI1(Y213)", "AZ20", inc) :- phosphosite("ABI1(Y213)").
0.2603446985::p_fc("ABI1(Y213)", "AZD1480", dec); 0.2603446985::p_fc("ABI1(Y213)", "AZD1480", inc) :- phosphosite("ABI1(Y213)").
0.3528428038::p_fc("ABI1(Y213)", "AZD3759", dec); 0.3528428038::p_fc("ABI1(Y213)", "AZD3759", inc) :- phosphosite("ABI1(Y213)").
0.4596919341::p_fc("ABI1(Y213)", "AZD5363", dec); 0.4596919341::p_fc("ABI1(Y213)", "AZD5363", inc) :- phosphosite("ABI1(Y213)").
0.1021004226::p_fc("ABI1(Y213)", "AZD5438", dec); 0.1021004226::p_fc("ABI1(Y213)", "AZD5438", inc) :- phosphosite("ABI1(Y213)").
0.1553494799::p_fc("ABI1(Y213)", "AZD6482", dec); 0.1553494799::p_fc("ABI1(Y213)", "AZD6482", inc) :- phosphosite("ABI1(Y213)").
0.312185417::p_fc("ABI1(Y213)", "AZD6738", dec); 0.312185417::p_fc("ABI1(Y213)", "AZD6738", inc) :- phosphosite("ABI1(Y213)").
0.2901184102::p_fc("ABI1(Y213)", "AZD8055", dec); 0.2901184102::p_fc("ABI1(Y213)", "AZD8055", inc) :- phosphosite("ABI1(Y213)").
0.3059010707::p_fc("ABI1(Y213)", "Amuvatinib", dec); 0.3059010707::p_fc("ABI1(Y213)", "Amuvatinib", inc) :- phosphosite("ABI1(Y213)").
0.3075975742::p_fc("ABI1(Y213)", "BX912", dec); 0.3075975742::p_fc("ABI1(Y213)", "BX912", inc) :- phosphosite("ABI1(Y213)").
2.1915e-06::p_fc("ABI1(Y213)", "Bosutinib", dec); 2.1915e-06::p_fc("ABI1(Y213)", "Bosutinib", inc) :- phosphosite("ABI1(Y213)").
0.1725612333::p_fc("ABI1(Y213)", "CAL101", dec); 0.1725612333::p_fc("ABI1(Y213)", "CAL101", inc) :- phosphosite("ABI1(Y213)").
0.489306926::p_fc("ABI1(Y213)", "CHIR99021", dec); 0.489306926::p_fc("ABI1(Y213)", "CHIR99021", inc) :- phosphosite("ABI1(Y213)").
0.284765647::p_fc("ABI1(Y213)", "CX4945", dec); 0.284765647::p_fc("ABI1(Y213)", "CX4945", inc) :- phosphosite("ABI1(Y213)").
0.3436319223::p_fc("ABI1(Y213)", "DNAPK", dec); 0.3436319223::p_fc("ABI1(Y213)", "DNAPK", inc) :- phosphosite("ABI1(Y213)").
0.1354674493::p_fc("ABI1(Y213)", "Dabrafenib", dec); 0.1354674493::p_fc("ABI1(Y213)", "Dabrafenib", inc) :- phosphosite("ABI1(Y213)").
1.075e-07::p_fc("ABI1(Y213)", "Dasatinib", dec); 1.075e-07::p_fc("ABI1(Y213)", "Dasatinib", inc) :- phosphosite("ABI1(Y213)").
0.4294937087::p_fc("ABI1(Y213)", "Edelfosine", dec); 0.4294937087::p_fc("ABI1(Y213)", "Edelfosine", inc) :- phosphosite("ABI1(Y213)").
0.1871997249::p_fc("ABI1(Y213)", "FRAX486", dec); 0.1871997249::p_fc("ABI1(Y213)", "FRAX486", inc) :- phosphosite("ABI1(Y213)").
0.0834352013::p_fc("ABI1(Y213)", "GDC0941", dec); 0.0834352013::p_fc("ABI1(Y213)", "GDC0941", inc) :- phosphosite("ABI1(Y213)").
0.3271623846::p_fc("ABI1(Y213)", "GDC0994", dec); 0.3271623846::p_fc("ABI1(Y213)", "GDC0994", inc) :- phosphosite("ABI1(Y213)").
0.4329893879::p_fc("ABI1(Y213)", "GF109203X", dec); 0.4329893879::p_fc("ABI1(Y213)", "GF109203X", inc) :- phosphosite("ABI1(Y213)").
0.3000549985::p_fc("ABI1(Y213)", "GO6983", dec); 0.3000549985::p_fc("ABI1(Y213)", "GO6983", inc) :- phosphosite("ABI1(Y213)").
0.0760245069::p_fc("ABI1(Y213)", "GSK2334470", dec); 0.0760245069::p_fc("ABI1(Y213)", "GSK2334470", inc) :- phosphosite("ABI1(Y213)").
0.2039444766::p_fc("ABI1(Y213)", "GSK690693", dec); 0.2039444766::p_fc("ABI1(Y213)", "GSK690693", inc) :- phosphosite("ABI1(Y213)").
0.2541894529::p_fc("ABI1(Y213)", "Go6976", dec); 0.2541894529::p_fc("ABI1(Y213)", "Go6976", inc) :- phosphosite("ABI1(Y213)").
0.2388341561::p_fc("ABI1(Y213)", "H89", dec); 0.2388341561::p_fc("ABI1(Y213)", "H89", inc) :- phosphosite("ABI1(Y213)").
0.0795764875::p_fc("ABI1(Y213)", "HS173", dec); 0.0795764875::p_fc("ABI1(Y213)", "HS173", inc) :- phosphosite("ABI1(Y213)").
0.3837174508::p_fc("ABI1(Y213)", "Ipatasertib", dec); 0.3837174508::p_fc("ABI1(Y213)", "Ipatasertib", inc) :- phosphosite("ABI1(Y213)").
0.485924013::p_fc("ABI1(Y213)", "JNJ", dec); 0.485924013::p_fc("ABI1(Y213)", "JNJ", inc) :- phosphosite("ABI1(Y213)").
0.4897330908::p_fc("ABI1(Y213)", "JNK", dec); 0.4897330908::p_fc("ABI1(Y213)", "JNK", inc) :- phosphosite("ABI1(Y213)").
0.2362856866::p_fc("ABI1(Y213)", "KD025", dec); 0.2362856866::p_fc("ABI1(Y213)", "KD025", inc) :- phosphosite("ABI1(Y213)").
0.256178695::p_fc("ABI1(Y213)", "KN62", dec); 0.256178695::p_fc("ABI1(Y213)", "KN62", inc) :- phosphosite("ABI1(Y213)").
0.176741948::p_fc("ABI1(Y213)", "KN93", dec); 0.176741948::p_fc("ABI1(Y213)", "KN93", inc) :- phosphosite("ABI1(Y213)").
0.4168865959::p_fc("ABI1(Y213)", "Ku0063794", dec); 0.4168865959::p_fc("ABI1(Y213)", "Ku0063794", inc) :- phosphosite("ABI1(Y213)").
0.4380548068::p_fc("ABI1(Y213)", "LY2090314", dec); 0.4380548068::p_fc("ABI1(Y213)", "LY2090314", inc) :- phosphosite("ABI1(Y213)").
0.1496937682::p_fc("ABI1(Y213)", "LY2584702", dec); 0.1496937682::p_fc("ABI1(Y213)", "LY2584702", inc) :- phosphosite("ABI1(Y213)").
0.0492885844::p_fc("ABI1(Y213)", "LY2835219", dec); 0.0492885844::p_fc("ABI1(Y213)", "LY2835219", inc) :- phosphosite("ABI1(Y213)").
0.258681289::p_fc("ABI1(Y213)", "Linsitinib", dec); 0.258681289::p_fc("ABI1(Y213)", "Linsitinib", inc) :- phosphosite("ABI1(Y213)").
0.2262266703::p_fc("ABI1(Y213)", "MK2206", dec); 0.2262266703::p_fc("ABI1(Y213)", "MK2206", inc) :- phosphosite("ABI1(Y213)").
0.1527163404::p_fc("ABI1(Y213)", "NU7441", dec); 0.1527163404::p_fc("ABI1(Y213)", "NU7441", inc) :- phosphosite("ABI1(Y213)").
0.1293722685::p_fc("ABI1(Y213)", "PD153035", dec); 0.1293722685::p_fc("ABI1(Y213)", "PD153035", inc) :- phosphosite("ABI1(Y213)").
7.80176e-05::p_fc("ABI1(Y213)", "PF3758309", dec); 7.80176e-05::p_fc("ABI1(Y213)", "PF3758309", inc) :- phosphosite("ABI1(Y213)").
0.1328161418::p_fc("ABI1(Y213)", "PF4708671", dec); 0.1328161418::p_fc("ABI1(Y213)", "PF4708671", inc) :- phosphosite("ABI1(Y213)").
0.0456130171::p_fc("ABI1(Y213)", "PH797804", dec); 0.0456130171::p_fc("ABI1(Y213)", "PH797804", inc) :- phosphosite("ABI1(Y213)").
0.4509503416::p_fc("ABI1(Y213)", "PIK294", dec); 0.4509503416::p_fc("ABI1(Y213)", "PIK294", inc) :- phosphosite("ABI1(Y213)").
0.2864150289::p_fc("ABI1(Y213)", "Ribociclib", dec); 0.2864150289::p_fc("ABI1(Y213)", "Ribociclib", inc) :- phosphosite("ABI1(Y213)").
0.1914782599::p_fc("ABI1(Y213)", "Ripasudil", dec); 0.1914782599::p_fc("ABI1(Y213)", "Ripasudil", inc) :- phosphosite("ABI1(Y213)").
0.4879341669::p_fc("ABI1(Y213)", "SP600125", dec); 0.4879341669::p_fc("ABI1(Y213)", "SP600125", inc) :- phosphosite("ABI1(Y213)").
0.2243112464::p_fc("ABI1(Y213)", "Selumetinib", dec); 0.2243112464::p_fc("ABI1(Y213)", "Selumetinib", inc) :- phosphosite("ABI1(Y213)").
0.3036478126::p_fc("ABI1(Y213)", "TAK715", dec); 0.3036478126::p_fc("ABI1(Y213)", "TAK715", inc) :- phosphosite("ABI1(Y213)").
0.2790466402::p_fc("ABI1(Y213)", "TBCA", dec); 0.2790466402::p_fc("ABI1(Y213)", "TBCA", inc) :- phosphosite("ABI1(Y213)").
0.1268077559::p_fc("ABI1(Y213)", "TGX221", dec); 0.1268077559::p_fc("ABI1(Y213)", "TGX221", inc) :- phosphosite("ABI1(Y213)").
0.3132409779::p_fc("ABI1(Y213)", "Tofacitinib", dec); 0.3132409779::p_fc("ABI1(Y213)", "Tofacitinib", inc) :- phosphosite("ABI1(Y213)").
0.0341778661::p_fc("ABI1(Y213)", "Torin", dec); 0.0341778661::p_fc("ABI1(Y213)", "Torin", inc) :- phosphosite("ABI1(Y213)").
0.4494803924::p_fc("ABI1(Y213)", "Trametinib", dec); 0.4494803924::p_fc("ABI1(Y213)", "Trametinib", inc) :- phosphosite("ABI1(Y213)").
0.3246516738::p_fc("ABI1(Y213)", "U73122", dec); 0.3246516738::p_fc("ABI1(Y213)", "U73122", inc) :- phosphosite("ABI1(Y213)").
0.3950391403::p_fc("ABI1(Y213)", "Ulixertinib", dec); 0.3950391403::p_fc("ABI1(Y213)", "Ulixertinib", inc) :- phosphosite("ABI1(Y213)").
0.0568845731::p_fc("ABI1(Y213)", "Vemurafenib", dec); 0.0568845731::p_fc("ABI1(Y213)", "Vemurafenib", inc) :- phosphosite("ABI1(Y213)").
0.1645680183::p_fc("ANXA2P2(Y24)", "AC220", dec); 0.1645680183::p_fc("ANXA2P2(Y24)", "AC220", inc) :- phosphosite("ANXA2P2(Y24)").
0.4757336373::p_fc("ANXA2P2(Y24)", "AT13148", dec); 0.4757336373::p_fc("ANXA2P2(Y24)", "AT13148", inc) :- phosphosite("ANXA2P2(Y24)").
0.448415703::p_fc("ANXA2P2(Y24)", "AZ20", dec); 0.448415703::p_fc("ANXA2P2(Y24)", "AZ20", inc) :- phosphosite("ANXA2P2(Y24)").
0.1349850076::p_fc("ANXA2P2(Y24)", "AZD1480", dec); 0.1349850076::p_fc("ANXA2P2(Y24)", "AZD1480", inc) :- phosphosite("ANXA2P2(Y24)").
0.3498352241::p_fc("ANXA2P2(Y24)", "AZD3759", dec); 0.3498352241::p_fc("ANXA2P2(Y24)", "AZD3759", inc) :- phosphosite("ANXA2P2(Y24)").
0.0562452442::p_fc("ANXA2P2(Y24)", "AZD5363", dec); 0.0562452442::p_fc("ANXA2P2(Y24)", "AZD5363", inc) :- phosphosite("ANXA2P2(Y24)").
0.1352791106::p_fc("ANXA2P2(Y24)", "AZD5438", dec); 0.1352791106::p_fc("ANXA2P2(Y24)", "AZD5438", inc) :- phosphosite("ANXA2P2(Y24)").
0.1527749007::p_fc("ANXA2P2(Y24)", "AZD6482", dec); 0.1527749007::p_fc("ANXA2P2(Y24)", "AZD6482", inc) :- phosphosite("ANXA2P2(Y24)").
0.3466430284::p_fc("ANXA2P2(Y24)", "AZD6738", dec); 0.3466430284::p_fc("ANXA2P2(Y24)", "AZD6738", inc) :- phosphosite("ANXA2P2(Y24)").
0.0263090482::p_fc("ANXA2P2(Y24)", "AZD8055", dec); 0.0263090482::p_fc("ANXA2P2(Y24)", "AZD8055", inc) :- phosphosite("ANXA2P2(Y24)").
0.3763533563::p_fc("ANXA2P2(Y24)", "Amuvatinib", dec); 0.3763533563::p_fc("ANXA2P2(Y24)", "Amuvatinib", inc) :- phosphosite("ANXA2P2(Y24)").
0.0925717042::p_fc("ANXA2P2(Y24)", "BX912", dec); 0.0925717042::p_fc("ANXA2P2(Y24)", "BX912", inc) :- phosphosite("ANXA2P2(Y24)").
0.2933023546::p_fc("ANXA2P2(Y24)", "Bosutinib", dec); 0.2933023546::p_fc("ANXA2P2(Y24)", "Bosutinib", inc) :- phosphosite("ANXA2P2(Y24)").
0.0093390423::p_fc("ANXA2P2(Y24)", "CAL101", dec); 0.0093390423::p_fc("ANXA2P2(Y24)", "CAL101", inc) :- phosphosite("ANXA2P2(Y24)").
0.0874775125::p_fc("ANXA2P2(Y24)", "CHIR99021", dec); 0.0874775125::p_fc("ANXA2P2(Y24)", "CHIR99021", inc) :- phosphosite("ANXA2P2(Y24)").
0.4374952703::p_fc("ANXA2P2(Y24)", "CX4945", dec); 0.4374952703::p_fc("ANXA2P2(Y24)", "CX4945", inc) :- phosphosite("ANXA2P2(Y24)").
0.1373858996::p_fc("ANXA2P2(Y24)", "DNAPK", dec); 0.1373858996::p_fc("ANXA2P2(Y24)", "DNAPK", inc) :- phosphosite("ANXA2P2(Y24)").
0.1708604893::p_fc("ANXA2P2(Y24)", "Dabrafenib", dec); 0.1708604893::p_fc("ANXA2P2(Y24)", "Dabrafenib", inc) :- phosphosite("ANXA2P2(Y24)").
0.2275006328::p_fc("ANXA2P2(Y24)", "Dasatinib", dec); 0.2275006328::p_fc("ANXA2P2(Y24)", "Dasatinib", inc) :- phosphosite("ANXA2P2(Y24)").
0.203996818::p_fc("ANXA2P2(Y24)", "Edelfosine", dec); 0.203996818::p_fc("ANXA2P2(Y24)", "Edelfosine", inc) :- phosphosite("ANXA2P2(Y24)").
0.0952268732::p_fc("ANXA2P2(Y24)", "FRAX486", dec); 0.0952268732::p_fc("ANXA2P2(Y24)", "FRAX486", inc) :- phosphosite("ANXA2P2(Y24)").
0.0002225918::p_fc("ANXA2P2(Y24)", "GDC0941", dec); 0.0002225918::p_fc("ANXA2P2(Y24)", "GDC0941", inc) :- phosphosite("ANXA2P2(Y24)").
0.4881973697::p_fc("ANXA2P2(Y24)", "GDC0994", dec); 0.4881973697::p_fc("ANXA2P2(Y24)", "GDC0994", inc) :- phosphosite("ANXA2P2(Y24)").
0.2348772427::p_fc("ANXA2P2(Y24)", "GF109203X", dec); 0.2348772427::p_fc("ANXA2P2(Y24)", "GF109203X", inc) :- phosphosite("ANXA2P2(Y24)").
0.0319578411::p_fc("ANXA2P2(Y24)", "GO6983", dec); 0.0319578411::p_fc("ANXA2P2(Y24)", "GO6983", inc) :- phosphosite("ANXA2P2(Y24)").
0.0075127171::p_fc("ANXA2P2(Y24)", "GSK2334470", dec); 0.0075127171::p_fc("ANXA2P2(Y24)", "GSK2334470", inc) :- phosphosite("ANXA2P2(Y24)").
0.29053855::p_fc("ANXA2P2(Y24)", "GSK690693", dec); 0.29053855::p_fc("ANXA2P2(Y24)", "GSK690693", inc) :- phosphosite("ANXA2P2(Y24)").
0.274726617::p_fc("ANXA2P2(Y24)", "Go6976", dec); 0.274726617::p_fc("ANXA2P2(Y24)", "Go6976", inc) :- phosphosite("ANXA2P2(Y24)").
0.464484398::p_fc("ANXA2P2(Y24)", "H89", dec); 0.464484398::p_fc("ANXA2P2(Y24)", "H89", inc) :- phosphosite("ANXA2P2(Y24)").
0.0219677994::p_fc("ANXA2P2(Y24)", "HS173", dec); 0.0219677994::p_fc("ANXA2P2(Y24)", "HS173", inc) :- phosphosite("ANXA2P2(Y24)").
0.0235781459::p_fc("ANXA2P2(Y24)", "Ipatasertib", dec); 0.0235781459::p_fc("ANXA2P2(Y24)", "Ipatasertib", inc) :- phosphosite("ANXA2P2(Y24)").
0.1480104032::p_fc("ANXA2P2(Y24)", "JNJ", dec); 0.1480104032::p_fc("ANXA2P2(Y24)", "JNJ", inc) :- phosphosite("ANXA2P2(Y24)").
0.1898092425::p_fc("ANXA2P2(Y24)", "JNK", dec); 0.1898092425::p_fc("ANXA2P2(Y24)", "JNK", inc) :- phosphosite("ANXA2P2(Y24)").
0.0648997178::p_fc("ANXA2P2(Y24)", "KD025", dec); 0.0648997178::p_fc("ANXA2P2(Y24)", "KD025", inc) :- phosphosite("ANXA2P2(Y24)").
0.2324329127::p_fc("ANXA2P2(Y24)", "KN62", dec); 0.2324329127::p_fc("ANXA2P2(Y24)", "KN62", inc) :- phosphosite("ANXA2P2(Y24)").
0.1051501609::p_fc("ANXA2P2(Y24)", "KN93", dec); 0.1051501609::p_fc("ANXA2P2(Y24)", "KN93", inc) :- phosphosite("ANXA2P2(Y24)").
0.3537190424::p_fc("ANXA2P2(Y24)", "Ku0063794", dec); 0.3537190424::p_fc("ANXA2P2(Y24)", "Ku0063794", inc) :- phosphosite("ANXA2P2(Y24)").
0.0149274119::p_fc("ANXA2P2(Y24)", "LY2090314", dec); 0.0149274119::p_fc("ANXA2P2(Y24)", "LY2090314", inc) :- phosphosite("ANXA2P2(Y24)").
0.3780343507::p_fc("ANXA2P2(Y24)", "LY2584702", dec); 0.3780343507::p_fc("ANXA2P2(Y24)", "LY2584702", inc) :- phosphosite("ANXA2P2(Y24)").
0.4650796129::p_fc("ANXA2P2(Y24)", "LY2835219", dec); 0.4650796129::p_fc("ANXA2P2(Y24)", "LY2835219", inc) :- phosphosite("ANXA2P2(Y24)").
0.2109543924::p_fc("ANXA2P2(Y24)", "Linsitinib", dec); 0.2109543924::p_fc("ANXA2P2(Y24)", "Linsitinib", inc) :- phosphosite("ANXA2P2(Y24)").
0.3000081972::p_fc("ANXA2P2(Y24)", "MK2206", dec); 0.3000081972::p_fc("ANXA2P2(Y24)", "MK2206", inc) :- phosphosite("ANXA2P2(Y24)").
0.4357619396::p_fc("ANXA2P2(Y24)", "NU7441", dec); 0.4357619396::p_fc("ANXA2P2(Y24)", "NU7441", inc) :- phosphosite("ANXA2P2(Y24)").
0.2696230023::p_fc("ANXA2P2(Y24)", "PD153035", dec); 0.2696230023::p_fc("ANXA2P2(Y24)", "PD153035", inc) :- phosphosite("ANXA2P2(Y24)").
0.3065793988::p_fc("ANXA2P2(Y24)", "PF3758309", dec); 0.3065793988::p_fc("ANXA2P2(Y24)", "PF3758309", inc) :- phosphosite("ANXA2P2(Y24)").
0.1550341001::p_fc("ANXA2P2(Y24)", "PF4708671", dec); 0.1550341001::p_fc("ANXA2P2(Y24)", "PF4708671", inc) :- phosphosite("ANXA2P2(Y24)").
0.3113212137::p_fc("ANXA2P2(Y24)", "PH797804", dec); 0.3113212137::p_fc("ANXA2P2(Y24)", "PH797804", inc) :- phosphosite("ANXA2P2(Y24)").
0.0689361966::p_fc("ANXA2P2(Y24)", "PIK294", dec); 0.0689361966::p_fc("ANXA2P2(Y24)", "PIK294", inc) :- phosphosite("ANXA2P2(Y24)").
0.3888988078::p_fc("ANXA2P2(Y24)", "Ribociclib", dec); 0.3888988078::p_fc("ANXA2P2(Y24)", "Ribociclib", inc) :- phosphosite("ANXA2P2(Y24)").
0.2120285158::p_fc("ANXA2P2(Y24)", "Ripasudil", dec); 0.2120285158::p_fc("ANXA2P2(Y24)", "Ripasudil", inc) :- phosphosite("ANXA2P2(Y24)").
0.2696020103::p_fc("ANXA2P2(Y24)", "SP600125", dec); 0.2696020103::p_fc("ANXA2P2(Y24)", "SP600125", inc) :- phosphosite("ANXA2P2(Y24)").
0.2024580848::p_fc("ANXA2P2(Y24)", "Selumetinib", dec); 0.2024580848::p_fc("ANXA2P2(Y24)", "Selumetinib", inc) :- phosphosite("ANXA2P2(Y24)").
0.0880997347::p_fc("ANXA2P2(Y24)", "TAK715", dec); 0.0880997347::p_fc("ANXA2P2(Y24)", "TAK715", inc) :- phosphosite("ANXA2P2(Y24)").
0.1603935098::p_fc("ANXA2P2(Y24)", "TBCA", dec); 0.1603935098::p_fc("ANXA2P2(Y24)", "TBCA", inc) :- phosphosite("ANXA2P2(Y24)").
0.3771983076::p_fc("ANXA2P2(Y24)", "TGX221", dec); 0.3771983076::p_fc("ANXA2P2(Y24)", "TGX221", inc) :- phosphosite("ANXA2P2(Y24)").
0.2010258705::p_fc("ANXA2P2(Y24)", "Tofacitinib", dec); 0.2010258705::p_fc("ANXA2P2(Y24)", "Tofacitinib", inc) :- phosphosite("ANXA2P2(Y24)").
0.4516733071::p_fc("ANXA2P2(Y24)", "Torin", dec); 0.4516733071::p_fc("ANXA2P2(Y24)", "Torin", inc) :- phosphosite("ANXA2P2(Y24)").
0.1378595358::p_fc("ANXA2P2(Y24)", "Trametinib", dec); 0.1378595358::p_fc("ANXA2P2(Y24)", "Trametinib", inc) :- phosphosite("ANXA2P2(Y24)").
0.1047878032::p_fc("ANXA2P2(Y24)", "U73122", dec); 0.1047878032::p_fc("ANXA2P2(Y24)", "U73122", inc) :- phosphosite("ANXA2P2(Y24)").
0.3602096316::p_fc("ANXA2P2(Y24)", "Ulixertinib", dec); 0.3602096316::p_fc("ANXA2P2(Y24)", "Ulixertinib", inc) :- phosphosite("ANXA2P2(Y24)").
0.2403449566::p_fc("ANXA2P2(Y24)", "Vemurafenib", dec); 0.2403449566::p_fc("ANXA2P2(Y24)", "Vemurafenib", inc) :- phosphosite("ANXA2P2(Y24)").
0.0761092852::p_fc("ATF1(S198)", "AC220", dec); 0.0761092852::p_fc("ATF1(S198)", "AC220", inc) :- phosphosite("ATF1(S198)").
0.395324824::p_fc("ATF1(S198)", "AT13148", dec); 0.395324824::p_fc("ATF1(S198)", "AT13148", inc) :- phosphosite("ATF1(S198)").
0.0776873121::p_fc("ATF1(S198)", "AZ20", dec); 0.0776873121::p_fc("ATF1(S198)", "AZ20", inc) :- phosphosite("ATF1(S198)").
0.4835799363::p_fc("ATF1(S198)", "AZD1480", dec); 0.4835799363::p_fc("ATF1(S198)", "AZD1480", inc) :- phosphosite("ATF1(S198)").
0.3523297413::p_fc("ATF1(S198)", "AZD3759", dec); 0.3523297413::p_fc("ATF1(S198)", "AZD3759", inc) :- phosphosite("ATF1(S198)").
0.4315673757::p_fc("ATF1(S198)", "AZD5363", dec); 0.4315673757::p_fc("ATF1(S198)", "AZD5363", inc) :- phosphosite("ATF1(S198)").
0.0002268005::p_fc("ATF1(S198)", "AZD5438", dec); 0.0002268005::p_fc("ATF1(S198)", "AZD5438", inc) :- phosphosite("ATF1(S198)").
0.2334241161::p_fc("ATF1(S198)", "AZD6482", dec); 0.2334241161::p_fc("ATF1(S198)", "AZD6482", inc) :- phosphosite("ATF1(S198)").
0.0634199439::p_fc("ATF1(S198)", "AZD6738", dec); 0.0634199439::p_fc("ATF1(S198)", "AZD6738", inc) :- phosphosite("ATF1(S198)").
0.1855797853::p_fc("ATF1(S198)", "AZD8055", dec); 0.1855797853::p_fc("ATF1(S198)", "AZD8055", inc) :- phosphosite("ATF1(S198)").
0.2615441766::p_fc("ATF1(S198)", "Amuvatinib", dec); 0.2615441766::p_fc("ATF1(S198)", "Amuvatinib", inc) :- phosphosite("ATF1(S198)").
0.1698454572::p_fc("ATF1(S198)", "BX912", dec); 0.1698454572::p_fc("ATF1(S198)", "BX912", inc) :- phosphosite("ATF1(S198)").
0.4386882327::p_fc("ATF1(S198)", "Bosutinib", dec); 0.4386882327::p_fc("ATF1(S198)", "Bosutinib", inc) :- phosphosite("ATF1(S198)").
0.4962756828::p_fc("ATF1(S198)", "CAL101", dec); 0.4962756828::p_fc("ATF1(S198)", "CAL101", inc) :- phosphosite("ATF1(S198)").
0.4712528579::p_fc("ATF1(S198)", "CHIR99021", dec); 0.4712528579::p_fc("ATF1(S198)", "CHIR99021", inc) :- phosphosite("ATF1(S198)").
0.1777668154::p_fc("ATF1(S198)", "CX4945", dec); 0.1777668154::p_fc("ATF1(S198)", "CX4945", inc) :- phosphosite("ATF1(S198)").
0.4049621205::p_fc("ATF1(S198)", "DNAPK", dec); 0.4049621205::p_fc("ATF1(S198)", "DNAPK", inc) :- phosphosite("ATF1(S198)").
0.3799769896::p_fc("ATF1(S198)", "Dabrafenib", dec); 0.3799769896::p_fc("ATF1(S198)", "Dabrafenib", inc) :- phosphosite("ATF1(S198)").
0.3670610875::p_fc("ATF1(S198)", "Dasatinib", dec); 0.3670610875::p_fc("ATF1(S198)", "Dasatinib", inc) :- phosphosite("ATF1(S198)").
0.4012973862::p_fc("ATF1(S198)", "Edelfosine", dec); 0.4012973862::p_fc("ATF1(S198)", "Edelfosine", inc) :- phosphosite("ATF1(S198)").
0.2853345415::p_fc("ATF1(S198)", "FRAX486", dec); 0.2853345415::p_fc("ATF1(S198)", "FRAX486", inc) :- phosphosite("ATF1(S198)").
0.4882277141::p_fc("ATF1(S198)", "GDC0941", dec); 0.4882277141::p_fc("ATF1(S198)", "GDC0941", inc) :- phosphosite("ATF1(S198)").
0.4108002148::p_fc("ATF1(S198)", "GDC0994", dec); 0.4108002148::p_fc("ATF1(S198)", "GDC0994", inc) :- phosphosite("ATF1(S198)").
0.4609464884::p_fc("ATF1(S198)", "GF109203X", dec); 0.4609464884::p_fc("ATF1(S198)", "GF109203X", inc) :- phosphosite("ATF1(S198)").
0.2765719054::p_fc("ATF1(S198)", "GO6983", dec); 0.2765719054::p_fc("ATF1(S198)", "GO6983", inc) :- phosphosite("ATF1(S198)").
0.4789398993::p_fc("ATF1(S198)", "GSK2334470", dec); 0.4789398993::p_fc("ATF1(S198)", "GSK2334470", inc) :- phosphosite("ATF1(S198)").
0.2434319892::p_fc("ATF1(S198)", "GSK690693", dec); 0.2434319892::p_fc("ATF1(S198)", "GSK690693", inc) :- phosphosite("ATF1(S198)").
0.277821303::p_fc("ATF1(S198)", "Go6976", dec); 0.277821303::p_fc("ATF1(S198)", "Go6976", inc) :- phosphosite("ATF1(S198)").
0.3960169228::p_fc("ATF1(S198)", "H89", dec); 0.3960169228::p_fc("ATF1(S198)", "H89", inc) :- phosphosite("ATF1(S198)").
0.0770571121::p_fc("ATF1(S198)", "HS173", dec); 0.0770571121::p_fc("ATF1(S198)", "HS173", inc) :- phosphosite("ATF1(S198)").
0.388485793::p_fc("ATF1(S198)", "Ipatasertib", dec); 0.388485793::p_fc("ATF1(S198)", "Ipatasertib", inc) :- phosphosite("ATF1(S198)").
0.3669957145::p_fc("ATF1(S198)", "JNJ", dec); 0.3669957145::p_fc("ATF1(S198)", "JNJ", inc) :- phosphosite("ATF1(S198)").
0.1015775834::p_fc("ATF1(S198)", "JNK", dec); 0.1015775834::p_fc("ATF1(S198)", "JNK", inc) :- phosphosite("ATF1(S198)").
0.0196203913::p_fc("ATF1(S198)", "KD025", dec); 0.0196203913::p_fc("ATF1(S198)", "KD025", inc) :- phosphosite("ATF1(S198)").
0.171404296::p_fc("ATF1(S198)", "KN62", dec); 0.171404296::p_fc("ATF1(S198)", "KN62", inc) :- phosphosite("ATF1(S198)").
0.4951384771::p_fc("ATF1(S198)", "KN93", dec); 0.4951384771::p_fc("ATF1(S198)", "KN93", inc) :- phosphosite("ATF1(S198)").
0.1078459663::p_fc("ATF1(S198)", "Ku0063794", dec); 0.1078459663::p_fc("ATF1(S198)", "Ku0063794", inc) :- phosphosite("ATF1(S198)").
0.1401423676::p_fc("ATF1(S198)", "LY2090314", dec); 0.1401423676::p_fc("ATF1(S198)", "LY2090314", inc) :- phosphosite("ATF1(S198)").
0.3333333251::p_fc("ATF1(S198)", "LY2584702", dec); 0.3333333251::p_fc("ATF1(S198)", "LY2584702", inc) :- phosphosite("ATF1(S198)").
0.0382583583::p_fc("ATF1(S198)", "LY2835219", dec); 0.0382583583::p_fc("ATF1(S198)", "LY2835219", inc) :- phosphosite("ATF1(S198)").
0.071953978::p_fc("ATF1(S198)", "Linsitinib", dec); 0.071953978::p_fc("ATF1(S198)", "Linsitinib", inc) :- phosphosite("ATF1(S198)").
0.2372672882::p_fc("ATF1(S198)", "MK2206", dec); 0.2372672882::p_fc("ATF1(S198)", "MK2206", inc) :- phosphosite("ATF1(S198)").
0.4402274881::p_fc("ATF1(S198)", "NU7441", dec); 0.4402274881::p_fc("ATF1(S198)", "NU7441", inc) :- phosphosite("ATF1(S198)").
0.0137823531::p_fc("ATF1(S198)", "PD153035", dec); 0.0137823531::p_fc("ATF1(S198)", "PD153035", inc) :- phosphosite("ATF1(S198)").
0.0447616039::p_fc("ATF1(S198)", "PF3758309", dec); 0.0447616039::p_fc("ATF1(S198)", "PF3758309", inc) :- phosphosite("ATF1(S198)").
0.4685334133::p_fc("ATF1(S198)", "PF4708671", dec); 0.4685334133::p_fc("ATF1(S198)", "PF4708671", inc) :- phosphosite("ATF1(S198)").
0.4572902409::p_fc("ATF1(S198)", "PH797804", dec); 0.4572902409::p_fc("ATF1(S198)", "PH797804", inc) :- phosphosite("ATF1(S198)").
0.2538165941::p_fc("ATF1(S198)", "PIK294", dec); 0.2538165941::p_fc("ATF1(S198)", "PIK294", inc) :- phosphosite("ATF1(S198)").
0.2912013733::p_fc("ATF1(S198)", "Ribociclib", dec); 0.2912013733::p_fc("ATF1(S198)", "Ribociclib", inc) :- phosphosite("ATF1(S198)").
0.3124227665::p_fc("ATF1(S198)", "Ripasudil", dec); 0.3124227665::p_fc("ATF1(S198)", "Ripasudil", inc) :- phosphosite("ATF1(S198)").
0.4384876993::p_fc("ATF1(S198)", "SP600125", dec); 0.4384876993::p_fc("ATF1(S198)", "SP600125", inc) :- phosphosite("ATF1(S198)").
0.3817262658::p_fc("ATF1(S198)", "Selumetinib", dec); 0.3817262658::p_fc("ATF1(S198)", "Selumetinib", inc) :- phosphosite("ATF1(S198)").
0.2670553966::p_fc("ATF1(S198)", "TAK715", dec); 0.2670553966::p_fc("ATF1(S198)", "TAK715", inc) :- phosphosite("ATF1(S198)").
0.4011280598::p_fc("ATF1(S198)", "TBCA", dec); 0.4011280598::p_fc("ATF1(S198)", "TBCA", inc) :- phosphosite("ATF1(S198)").
0.3309102075::p_fc("ATF1(S198)", "TGX221", dec); 0.3309102075::p_fc("ATF1(S198)", "TGX221", inc) :- phosphosite("ATF1(S198)").
0.4542116131::p_fc("ATF1(S198)", "Tofacitinib", dec); 0.4542116131::p_fc("ATF1(S198)", "Tofacitinib", inc) :- phosphosite("ATF1(S198)").
0.254009958::p_fc("ATF1(S198)", "Torin", dec); 0.254009958::p_fc("ATF1(S198)", "Torin", inc) :- phosphosite("ATF1(S198)").
0.3515568812::p_fc("ATF1(S198)", "Trametinib", dec); 0.3515568812::p_fc("ATF1(S198)", "Trametinib", inc) :- phosphosite("ATF1(S198)").
0.1018784496::p_fc("ATF1(S198)", "U73122", dec); 0.1018784496::p_fc("ATF1(S198)", "U73122", inc) :- phosphosite("ATF1(S198)").
0.1399291089::p_fc("ATF1(S198)", "Ulixertinib", dec); 0.1399291089::p_fc("ATF1(S198)", "Ulixertinib", inc) :- phosphosite("ATF1(S198)").
0.3385740024::p_fc("ATF1(S198)", "Vemurafenib", dec); 0.3385740024::p_fc("ATF1(S198)", "Vemurafenib", inc) :- phosphosite("ATF1(S198)").
0.0278388644::p_fc("BCLAF1(Y284)", "AC220", dec); 0.0278388644::p_fc("BCLAF1(Y284)", "AC220", inc) :- phosphosite("BCLAF1(Y284)").
0.0126991878::p_fc("BCLAF1(Y284)", "AT13148", dec); 0.0126991878::p_fc("BCLAF1(Y284)", "AT13148", inc) :- phosphosite("BCLAF1(Y284)").
0.0496552558::p_fc("BCLAF1(Y284)", "AZ20", dec); 0.0496552558::p_fc("BCLAF1(Y284)", "AZ20", inc) :- phosphosite("BCLAF1(Y284)").
0.065694313::p_fc("BCLAF1(Y284)", "AZD1480", dec); 0.065694313::p_fc("BCLAF1(Y284)", "AZD1480", inc) :- phosphosite("BCLAF1(Y284)").
0.3428703946::p_fc("BCLAF1(Y284)", "AZD3759", dec); 0.3428703946::p_fc("BCLAF1(Y284)", "AZD3759", inc) :- phosphosite("BCLAF1(Y284)").
0.1911022493::p_fc("BCLAF1(Y284)", "AZD5363", dec); 0.1911022493::p_fc("BCLAF1(Y284)", "AZD5363", inc) :- phosphosite("BCLAF1(Y284)").
0.0566633771::p_fc("BCLAF1(Y284)", "AZD5438", dec); 0.0566633771::p_fc("BCLAF1(Y284)", "AZD5438", inc) :- phosphosite("BCLAF1(Y284)").
0.0047406412::p_fc("BCLAF1(Y284)", "AZD6482", dec); 0.0047406412::p_fc("BCLAF1(Y284)", "AZD6482", inc) :- phosphosite("BCLAF1(Y284)").
0.4848099907::p_fc("BCLAF1(Y284)", "AZD6738", dec); 0.4848099907::p_fc("BCLAF1(Y284)", "AZD6738", inc) :- phosphosite("BCLAF1(Y284)").
0.0103486745::p_fc("BCLAF1(Y284)", "AZD8055", dec); 0.0103486745::p_fc("BCLAF1(Y284)", "AZD8055", inc) :- phosphosite("BCLAF1(Y284)").
0.4709187992::p_fc("BCLAF1(Y284)", "Amuvatinib", dec); 0.4709187992::p_fc("BCLAF1(Y284)", "Amuvatinib", inc) :- phosphosite("BCLAF1(Y284)").
0.0207927218::p_fc("BCLAF1(Y284)", "BX912", dec); 0.0207927218::p_fc("BCLAF1(Y284)", "BX912", inc) :- phosphosite("BCLAF1(Y284)").
0.1110656077::p_fc("BCLAF1(Y284)", "Bosutinib", dec); 0.1110656077::p_fc("BCLAF1(Y284)", "Bosutinib", inc) :- phosphosite("BCLAF1(Y284)").
0.3296877832::p_fc("BCLAF1(Y284)", "CAL101", dec); 0.3296877832::p_fc("BCLAF1(Y284)", "CAL101", inc) :- phosphosite("BCLAF1(Y284)").
0.054411597::p_fc("BCLAF1(Y284)", "CHIR99021", dec); 0.054411597::p_fc("BCLAF1(Y284)", "CHIR99021", inc) :- phosphosite("BCLAF1(Y284)").
2.097e-06::p_fc("BCLAF1(Y284)", "CX4945", dec); 2.097e-06::p_fc("BCLAF1(Y284)", "CX4945", inc) :- phosphosite("BCLAF1(Y284)").
0.3972449469::p_fc("BCLAF1(Y284)", "DNAPK", dec); 0.3972449469::p_fc("BCLAF1(Y284)", "DNAPK", inc) :- phosphosite("BCLAF1(Y284)").
0.0417244753::p_fc("BCLAF1(Y284)", "Dabrafenib", dec); 0.0417244753::p_fc("BCLAF1(Y284)", "Dabrafenib", inc) :- phosphosite("BCLAF1(Y284)").
0.001431281::p_fc("BCLAF1(Y284)", "Dasatinib", dec); 0.001431281::p_fc("BCLAF1(Y284)", "Dasatinib", inc) :- phosphosite("BCLAF1(Y284)").
6.31e-08::p_fc("BCLAF1(Y284)", "Edelfosine", dec); 6.31e-08::p_fc("BCLAF1(Y284)", "Edelfosine", inc) :- phosphosite("BCLAF1(Y284)").
0.3067226673::p_fc("BCLAF1(Y284)", "FRAX486", dec); 0.3067226673::p_fc("BCLAF1(Y284)", "FRAX486", inc) :- phosphosite("BCLAF1(Y284)").
6.6e-09::p_fc("BCLAF1(Y284)", "GDC0941", dec); 6.6e-09::p_fc("BCLAF1(Y284)", "GDC0941", inc) :- phosphosite("BCLAF1(Y284)").
0.0855054214::p_fc("BCLAF1(Y284)", "GDC0994", dec); 0.0855054214::p_fc("BCLAF1(Y284)", "GDC0994", inc) :- phosphosite("BCLAF1(Y284)").
0.1495486442::p_fc("BCLAF1(Y284)", "GF109203X", dec); 0.1495486442::p_fc("BCLAF1(Y284)", "GF109203X", inc) :- phosphosite("BCLAF1(Y284)").
1.03e-08::p_fc("BCLAF1(Y284)", "GO6983", dec); 1.03e-08::p_fc("BCLAF1(Y284)", "GO6983", inc) :- phosphosite("BCLAF1(Y284)").
0.0018835921::p_fc("BCLAF1(Y284)", "GSK2334470", dec); 0.0018835921::p_fc("BCLAF1(Y284)", "GSK2334470", inc) :- phosphosite("BCLAF1(Y284)").
0.2221549069::p_fc("BCLAF1(Y284)", "GSK690693", dec); 0.2221549069::p_fc("BCLAF1(Y284)", "GSK690693", inc) :- phosphosite("BCLAF1(Y284)").
4.06189e-05::p_fc("BCLAF1(Y284)", "Go6976", dec); 4.06189e-05::p_fc("BCLAF1(Y284)", "Go6976", inc) :- phosphosite("BCLAF1(Y284)").
0.423875239::p_fc("BCLAF1(Y284)", "H89", dec); 0.423875239::p_fc("BCLAF1(Y284)", "H89", inc) :- phosphosite("BCLAF1(Y284)").
0.4699477938::p_fc("BCLAF1(Y284)", "HS173", dec); 0.4699477938::p_fc("BCLAF1(Y284)", "HS173", inc) :- phosphosite("BCLAF1(Y284)").
0.052228037::p_fc("BCLAF1(Y284)", "Ipatasertib", dec); 0.052228037::p_fc("BCLAF1(Y284)", "Ipatasertib", inc) :- phosphosite("BCLAF1(Y284)").
0.4521756817::p_fc("BCLAF1(Y284)", "JNJ", dec); 0.4521756817::p_fc("BCLAF1(Y284)", "JNJ", inc) :- phosphosite("BCLAF1(Y284)").
0.405538784::p_fc("BCLAF1(Y284)", "JNK", dec); 0.405538784::p_fc("BCLAF1(Y284)", "JNK", inc) :- phosphosite("BCLAF1(Y284)").
0.257999201::p_fc("BCLAF1(Y284)", "KD025", dec); 0.257999201::p_fc("BCLAF1(Y284)", "KD025", inc) :- phosphosite("BCLAF1(Y284)").
0.0540521561::p_fc("BCLAF1(Y284)", "KN62", dec); 0.0540521561::p_fc("BCLAF1(Y284)", "KN62", inc) :- phosphosite("BCLAF1(Y284)").
6e-10::p_fc("BCLAF1(Y284)", "KN93", dec); 6e-10::p_fc("BCLAF1(Y284)", "KN93", inc) :- phosphosite("BCLAF1(Y284)").
0.1103636657::p_fc("BCLAF1(Y284)", "Ku0063794", dec); 0.1103636657::p_fc("BCLAF1(Y284)", "Ku0063794", inc) :- phosphosite("BCLAF1(Y284)").
0.0037327458::p_fc("BCLAF1(Y284)", "LY2090314", dec); 0.0037327458::p_fc("BCLAF1(Y284)", "LY2090314", inc) :- phosphosite("BCLAF1(Y284)").
0.0007863506::p_fc("BCLAF1(Y284)", "LY2584702", dec); 0.0007863506::p_fc("BCLAF1(Y284)", "LY2584702", inc) :- phosphosite("BCLAF1(Y284)").
0.2924897706::p_fc("BCLAF1(Y284)", "LY2835219", dec); 0.2924897706::p_fc("BCLAF1(Y284)", "LY2835219", inc) :- phosphosite("BCLAF1(Y284)").
0.0601669851::p_fc("BCLAF1(Y284)", "Linsitinib", dec); 0.0601669851::p_fc("BCLAF1(Y284)", "Linsitinib", inc) :- phosphosite("BCLAF1(Y284)").
0.0308099151::p_fc("BCLAF1(Y284)", "MK2206", dec); 0.0308099151::p_fc("BCLAF1(Y284)", "MK2206", inc) :- phosphosite("BCLAF1(Y284)").
0.1122547553::p_fc("BCLAF1(Y284)", "NU7441", dec); 0.1122547553::p_fc("BCLAF1(Y284)", "NU7441", inc) :- phosphosite("BCLAF1(Y284)").
0.2824086654::p_fc("BCLAF1(Y284)", "PD153035", dec); 0.2824086654::p_fc("BCLAF1(Y284)", "PD153035", inc) :- phosphosite("BCLAF1(Y284)").
0.4536627663::p_fc("BCLAF1(Y284)", "PF3758309", dec); 0.4536627663::p_fc("BCLAF1(Y284)", "PF3758309", inc) :- phosphosite("BCLAF1(Y284)").
0.2903501122::p_fc("BCLAF1(Y284)", "PF4708671", dec); 0.2903501122::p_fc("BCLAF1(Y284)", "PF4708671", inc) :- phosphosite("BCLAF1(Y284)").
0.3293639197::p_fc("BCLAF1(Y284)", "PH797804", dec); 0.3293639197::p_fc("BCLAF1(Y284)", "PH797804", inc) :- phosphosite("BCLAF1(Y284)").
0.2867893318::p_fc("BCLAF1(Y284)", "PIK294", dec); 0.2867893318::p_fc("BCLAF1(Y284)", "PIK294", inc) :- phosphosite("BCLAF1(Y284)").
0.0122115463::p_fc("BCLAF1(Y284)", "Ribociclib", dec); 0.0122115463::p_fc("BCLAF1(Y284)", "Ribociclib", inc) :- phosphosite("BCLAF1(Y284)").
0.0065806531::p_fc("BCLAF1(Y284)", "Ripasudil", dec); 0.0065806531::p_fc("BCLAF1(Y284)", "Ripasudil", inc) :- phosphosite("BCLAF1(Y284)").
0.0071198668::p_fc("BCLAF1(Y284)", "SP600125", dec); 0.0071198668::p_fc("BCLAF1(Y284)", "SP600125", inc) :- phosphosite("BCLAF1(Y284)").
0.0413148094::p_fc("BCLAF1(Y284)", "Selumetinib", dec); 0.0413148094::p_fc("BCLAF1(Y284)", "Selumetinib", inc) :- phosphosite("BCLAF1(Y284)").
0.0179056449::p_fc("BCLAF1(Y284)", "TAK715", dec); 0.0179056449::p_fc("BCLAF1(Y284)", "TAK715", inc) :- phosphosite("BCLAF1(Y284)").
0.0106536893::p_fc("BCLAF1(Y284)", "TBCA", dec); 0.0106536893::p_fc("BCLAF1(Y284)", "TBCA", inc) :- phosphosite("BCLAF1(Y284)").
0.1793869446::p_fc("BCLAF1(Y284)", "TGX221", dec); 0.1793869446::p_fc("BCLAF1(Y284)", "TGX221", inc) :- phosphosite("BCLAF1(Y284)").
0.1815609925::p_fc("BCLAF1(Y284)", "Tofacitinib", dec); 0.1815609925::p_fc("BCLAF1(Y284)", "Tofacitinib", inc) :- phosphosite("BCLAF1(Y284)").
0.2279023592::p_fc("BCLAF1(Y284)", "Torin", dec); 0.2279023592::p_fc("BCLAF1(Y284)", "Torin", inc) :- phosphosite("BCLAF1(Y284)").
0.3902808238::p_fc("BCLAF1(Y284)", "Trametinib", dec); 0.3902808238::p_fc("BCLAF1(Y284)", "Trametinib", inc) :- phosphosite("BCLAF1(Y284)").
0.0863391547::p_fc("BCLAF1(Y284)", "U73122", dec); 0.0863391547::p_fc("BCLAF1(Y284)", "U73122", inc) :- phosphosite("BCLAF1(Y284)").
0.444061891::p_fc("BCLAF1(Y284)", "Ulixertinib", dec); 0.444061891::p_fc("BCLAF1(Y284)", "Ulixertinib", inc) :- phosphosite("BCLAF1(Y284)").
0.0349354809::p_fc("BCLAF1(Y284)", "Vemurafenib", dec); 0.0349354809::p_fc("BCLAF1(Y284)", "Vemurafenib", inc) :- phosphosite("BCLAF1(Y284)").
0.1689313895::p_fc("HIPK2(Y361)", "AC220", dec); 0.1689313895::p_fc("HIPK2(Y361)", "AC220", inc) :- phosphosite("HIPK2(Y361)").
0.4719593084::p_fc("HIPK2(Y361)", "AT13148", dec); 0.4719593084::p_fc("HIPK2(Y361)", "AT13148", inc) :- phosphosite("HIPK2(Y361)").
0.0492074561::p_fc("HIPK2(Y361)", "AZ20", dec); 0.0492074561::p_fc("HIPK2(Y361)", "AZ20", inc) :- phosphosite("HIPK2(Y361)").
0.3256361916::p_fc("HIPK2(Y361)", "AZD1480", dec); 0.3256361916::p_fc("HIPK2(Y361)", "AZD1480", inc) :- phosphosite("HIPK2(Y361)").
0.0028657966::p_fc("HIPK2(Y361)", "AZD3759", dec); 0.0028657966::p_fc("HIPK2(Y361)", "AZD3759", inc) :- phosphosite("HIPK2(Y361)").
0.1261453663::p_fc("HIPK2(Y361)", "AZD5363", dec); 0.1261453663::p_fc("HIPK2(Y361)", "AZD5363", inc) :- phosphosite("HIPK2(Y361)").
0.2699528575::p_fc("HIPK2(Y361)", "AZD5438", dec); 0.2699528575::p_fc("HIPK2(Y361)", "AZD5438", inc) :- phosphosite("HIPK2(Y361)").
0.3919935555::p_fc("HIPK2(Y361)", "AZD6482", dec); 0.3919935555::p_fc("HIPK2(Y361)", "AZD6482", inc) :- phosphosite("HIPK2(Y361)").
0.279146454::p_fc("HIPK2(Y361)", "AZD6738", dec); 0.279146454::p_fc("HIPK2(Y361)", "AZD6738", inc) :- phosphosite("HIPK2(Y361)").
0.0001021261::p_fc("HIPK2(Y361)", "AZD8055", dec); 0.0001021261::p_fc("HIPK2(Y361)", "AZD8055", inc) :- phosphosite("HIPK2(Y361)").
0.0047713348::p_fc("HIPK2(Y361)", "Amuvatinib", dec); 0.0047713348::p_fc("HIPK2(Y361)", "Amuvatinib", inc) :- phosphosite("HIPK2(Y361)").
0.1848111936::p_fc("HIPK2(Y361)", "BX912", dec); 0.1848111936::p_fc("HIPK2(Y361)", "BX912", inc) :- phosphosite("HIPK2(Y361)").
0.1931333587::p_fc("HIPK2(Y361)", "Bosutinib", dec); 0.1931333587::p_fc("HIPK2(Y361)", "Bosutinib", inc) :- phosphosite("HIPK2(Y361)").
0.3448825045::p_fc("HIPK2(Y361)", "CAL101", dec); 0.3448825045::p_fc("HIPK2(Y361)", "CAL101", inc) :- phosphosite("HIPK2(Y361)").
0.1267797331::p_fc("HIPK2(Y361)", "CHIR99021", dec); 0.1267797331::p_fc("HIPK2(Y361)", "CHIR99021", inc) :- phosphosite("HIPK2(Y361)").
0.1258725479::p_fc("HIPK2(Y361)", "CX4945", dec); 0.1258725479::p_fc("HIPK2(Y361)", "CX4945", inc) :- phosphosite("HIPK2(Y361)").
0.4107982732::p_fc("HIPK2(Y361)", "DNAPK", dec); 0.4107982732::p_fc("HIPK2(Y361)", "DNAPK", inc) :- phosphosite("HIPK2(Y361)").
0.3076567458::p_fc("HIPK2(Y361)", "Dabrafenib", dec); 0.3076567458::p_fc("HIPK2(Y361)", "Dabrafenib", inc) :- phosphosite("HIPK2(Y361)").
0.4857024507::p_fc("HIPK2(Y361)", "Dasatinib", dec); 0.4857024507::p_fc("HIPK2(Y361)", "Dasatinib", inc) :- phosphosite("HIPK2(Y361)").
0.138020079::p_fc("HIPK2(Y361)", "Edelfosine", dec); 0.138020079::p_fc("HIPK2(Y361)", "Edelfosine", inc) :- phosphosite("HIPK2(Y361)").
0.2540363249::p_fc("HIPK2(Y361)", "FRAX486", dec); 0.2540363249::p_fc("HIPK2(Y361)", "FRAX486", inc) :- phosphosite("HIPK2(Y361)").
0.1002341659::p_fc("HIPK2(Y361)", "GDC0941", dec); 0.1002341659::p_fc("HIPK2(Y361)", "GDC0941", inc) :- phosphosite("HIPK2(Y361)").
0.1209131642::p_fc("HIPK2(Y361)", "GDC0994", dec); 0.1209131642::p_fc("HIPK2(Y361)", "GDC0994", inc) :- phosphosite("HIPK2(Y361)").
0.054762315::p_fc("HIPK2(Y361)", "GF109203X", dec); 0.054762315::p_fc("HIPK2(Y361)", "GF109203X", inc) :- phosphosite("HIPK2(Y361)").
0.1370328576::p_fc("HIPK2(Y361)", "GO6983", dec); 0.1370328576::p_fc("HIPK2(Y361)", "GO6983", inc) :- phosphosite("HIPK2(Y361)").
0.0001032407::p_fc("HIPK2(Y361)", "GSK2334470", dec); 0.0001032407::p_fc("HIPK2(Y361)", "GSK2334470", inc) :- phosphosite("HIPK2(Y361)").
0.1307645407::p_fc("HIPK2(Y361)", "GSK690693", dec); 0.1307645407::p_fc("HIPK2(Y361)", "GSK690693", inc) :- phosphosite("HIPK2(Y361)").
0.4006303033::p_fc("HIPK2(Y361)", "Go6976", dec); 0.4006303033::p_fc("HIPK2(Y361)", "Go6976", inc) :- phosphosite("HIPK2(Y361)").
0.3877742328::p_fc("HIPK2(Y361)", "H89", dec); 0.3877742328::p_fc("HIPK2(Y361)", "H89", inc) :- phosphosite("HIPK2(Y361)").
0.1204027826::p_fc("HIPK2(Y361)", "HS173", dec); 0.1204027826::p_fc("HIPK2(Y361)", "HS173", inc) :- phosphosite("HIPK2(Y361)").
0.1948160697::p_fc("HIPK2(Y361)", "Ipatasertib", dec); 0.1948160697::p_fc("HIPK2(Y361)", "Ipatasertib", inc) :- phosphosite("HIPK2(Y361)").
0.2692829022::p_fc("HIPK2(Y361)", "JNJ", dec); 0.2692829022::p_fc("HIPK2(Y361)", "JNJ", inc) :- phosphosite("HIPK2(Y361)").
0.1306204122::p_fc("HIPK2(Y361)", "JNK", dec); 0.1306204122::p_fc("HIPK2(Y361)", "JNK", inc) :- phosphosite("HIPK2(Y361)").
0.1433242118::p_fc("HIPK2(Y361)", "KD025", dec); 0.1433242118::p_fc("HIPK2(Y361)", "KD025", inc) :- phosphosite("HIPK2(Y361)").
0.1300816631::p_fc("HIPK2(Y361)", "KN62", dec); 0.1300816631::p_fc("HIPK2(Y361)", "KN62", inc) :- phosphosite("HIPK2(Y361)").
0.1702547901::p_fc("HIPK2(Y361)", "KN93", dec); 0.1702547901::p_fc("HIPK2(Y361)", "KN93", inc) :- phosphosite("HIPK2(Y361)").
0.0743899988::p_fc("HIPK2(Y361)", "Ku0063794", dec); 0.0743899988::p_fc("HIPK2(Y361)", "Ku0063794", inc) :- phosphosite("HIPK2(Y361)").
0.2597306493::p_fc("HIPK2(Y361)", "LY2090314", dec); 0.2597306493::p_fc("HIPK2(Y361)", "LY2090314", inc) :- phosphosite("HIPK2(Y361)").
0.2027113651::p_fc("HIPK2(Y361)", "LY2584702", dec); 0.2027113651::p_fc("HIPK2(Y361)", "LY2584702", inc) :- phosphosite("HIPK2(Y361)").
0.3636105195::p_fc("HIPK2(Y361)", "LY2835219", dec); 0.3636105195::p_fc("HIPK2(Y361)", "LY2835219", inc) :- phosphosite("HIPK2(Y361)").
0.0958959834::p_fc("HIPK2(Y361)", "Linsitinib", dec); 0.0958959834::p_fc("HIPK2(Y361)", "Linsitinib", inc) :- phosphosite("HIPK2(Y361)").
0.4141525877::p_fc("HIPK2(Y361)", "MK2206", dec); 0.4141525877::p_fc("HIPK2(Y361)", "MK2206", inc) :- phosphosite("HIPK2(Y361)").
0.2590133566::p_fc("HIPK2(Y361)", "NU7441", dec); 0.2590133566::p_fc("HIPK2(Y361)", "NU7441", inc) :- phosphosite("HIPK2(Y361)").
0.4164007572::p_fc("HIPK2(Y361)", "PD153035", dec); 0.4164007572::p_fc("HIPK2(Y361)", "PD153035", inc) :- phosphosite("HIPK2(Y361)").
1.05e-08::p_fc("HIPK2(Y361)", "PF3758309", dec); 1.05e-08::p_fc("HIPK2(Y361)", "PF3758309", inc) :- phosphosite("HIPK2(Y361)").
0.0734046723::p_fc("HIPK2(Y361)", "PF4708671", dec); 0.0734046723::p_fc("HIPK2(Y361)", "PF4708671", inc) :- phosphosite("HIPK2(Y361)").
0.2108039227::p_fc("HIPK2(Y361)", "PH797804", dec); 0.2108039227::p_fc("HIPK2(Y361)", "PH797804", inc) :- phosphosite("HIPK2(Y361)").
0.2518381655::p_fc("HIPK2(Y361)", "PIK294", dec); 0.2518381655::p_fc("HIPK2(Y361)", "PIK294", inc) :- phosphosite("HIPK2(Y361)").
0.1211497716::p_fc("HIPK2(Y361)", "Ribociclib", dec); 0.1211497716::p_fc("HIPK2(Y361)", "Ribociclib", inc) :- phosphosite("HIPK2(Y361)").
0.4282167577::p_fc("HIPK2(Y361)", "Ripasudil", dec); 0.4282167577::p_fc("HIPK2(Y361)", "Ripasudil", inc) :- phosphosite("HIPK2(Y361)").
0.1029678476::p_fc("HIPK2(Y361)", "SP600125", dec); 0.1029678476::p_fc("HIPK2(Y361)", "SP600125", inc) :- phosphosite("HIPK2(Y361)").
0.3839106568::p_fc("HIPK2(Y361)", "Selumetinib", dec); 0.3839106568::p_fc("HIPK2(Y361)", "Selumetinib", inc) :- phosphosite("HIPK2(Y361)").
0.2736584589::p_fc("HIPK2(Y361)", "TAK715", dec); 0.2736584589::p_fc("HIPK2(Y361)", "TAK715", inc) :- phosphosite("HIPK2(Y361)").
0.2500755027::p_fc("HIPK2(Y361)", "TBCA", dec); 0.2500755027::p_fc("HIPK2(Y361)", "TBCA", inc) :- phosphosite("HIPK2(Y361)").
0.3363256063::p_fc("HIPK2(Y361)", "TGX221", dec); 0.3363256063::p_fc("HIPK2(Y361)", "TGX221", inc) :- phosphosite("HIPK2(Y361)").
0.2307366571::p_fc("HIPK2(Y361)", "Tofacitinib", dec); 0.2307366571::p_fc("HIPK2(Y361)", "Tofacitinib", inc) :- phosphosite("HIPK2(Y361)").
0.034582534::p_fc("HIPK2(Y361)", "Torin", dec); 0.034582534::p_fc("HIPK2(Y361)", "Torin", inc) :- phosphosite("HIPK2(Y361)").
0.3214393889::p_fc("HIPK2(Y361)", "Trametinib", dec); 0.3214393889::p_fc("HIPK2(Y361)", "Trametinib", inc) :- phosphosite("HIPK2(Y361)").
0.0789797355::p_fc("HIPK2(Y361)", "U73122", dec); 0.0789797355::p_fc("HIPK2(Y361)", "U73122", inc) :- phosphosite("HIPK2(Y361)").
0.1200008583::p_fc("HIPK2(Y361)", "Ulixertinib", dec); 0.1200008583::p_fc("HIPK2(Y361)", "Ulixertinib", inc) :- phosphosite("HIPK2(Y361)").
0.490933395::p_fc("HIPK2(Y361)", "Vemurafenib", dec); 0.490933395::p_fc("HIPK2(Y361)", "Vemurafenib", inc) :- phosphosite("HIPK2(Y361)").
0.4878185101::p_fc("PTTG1IP(Y174)", "AC220", dec); 0.4878185101::p_fc("PTTG1IP(Y174)", "AC220", inc) :- phosphosite("PTTG1IP(Y174)").
0.2699571801::p_fc("PTTG1IP(Y174)", "AT13148", dec); 0.2699571801::p_fc("PTTG1IP(Y174)", "AT13148", inc) :- phosphosite("PTTG1IP(Y174)").
0.2847970874::p_fc("PTTG1IP(Y174)", "AZ20", dec); 0.2847970874::p_fc("PTTG1IP(Y174)", "AZ20", inc) :- phosphosite("PTTG1IP(Y174)").
0.0658506262::p_fc("PTTG1IP(Y174)", "AZD1480", dec); 0.0658506262::p_fc("PTTG1IP(Y174)", "AZD1480", inc) :- phosphosite("PTTG1IP(Y174)").
2.1068e-06::p_fc("PTTG1IP(Y174)", "AZD3759", dec); 2.1068e-06::p_fc("PTTG1IP(Y174)", "AZD3759", inc) :- phosphosite("PTTG1IP(Y174)").
0.0738412523::p_fc("PTTG1IP(Y174)", "AZD5363", dec); 0.0738412523::p_fc("PTTG1IP(Y174)", "AZD5363", inc) :- phosphosite("PTTG1IP(Y174)").
0.1553399335::p_fc("PTTG1IP(Y174)", "AZD5438", dec); 0.1553399335::p_fc("PTTG1IP(Y174)", "AZD5438", inc) :- phosphosite("PTTG1IP(Y174)").
0.214026223::p_fc("PTTG1IP(Y174)", "AZD6482", dec); 0.214026223::p_fc("PTTG1IP(Y174)", "AZD6482", inc) :- phosphosite("PTTG1IP(Y174)").
0.3576638697::p_fc("PTTG1IP(Y174)", "AZD6738", dec); 0.3576638697::p_fc("PTTG1IP(Y174)", "AZD6738", inc) :- phosphosite("PTTG1IP(Y174)").
0.2427896586::p_fc("PTTG1IP(Y174)", "AZD8055", dec); 0.2427896586::p_fc("PTTG1IP(Y174)", "AZD8055", inc) :- phosphosite("PTTG1IP(Y174)").
0.120020665::p_fc("PTTG1IP(Y174)", "Amuvatinib", dec); 0.120020665::p_fc("PTTG1IP(Y174)", "Amuvatinib", inc) :- phosphosite("PTTG1IP(Y174)").
0.1156939411::p_fc("PTTG1IP(Y174)", "BX912", dec); 0.1156939411::p_fc("PTTG1IP(Y174)", "BX912", inc) :- phosphosite("PTTG1IP(Y174)").
0.3762975775::p_fc("PTTG1IP(Y174)", "Bosutinib", dec); 0.3762975775::p_fc("PTTG1IP(Y174)", "Bosutinib", inc) :- phosphosite("PTTG1IP(Y174)").
0.3862357629::p_fc("PTTG1IP(Y174)", "CAL101", dec); 0.3862357629::p_fc("PTTG1IP(Y174)", "CAL101", inc) :- phosphosite("PTTG1IP(Y174)").
0.2542605795::p_fc("PTTG1IP(Y174)", "CHIR99021", dec); 0.2542605795::p_fc("PTTG1IP(Y174)", "CHIR99021", inc) :- phosphosite("PTTG1IP(Y174)").
0.2375278067::p_fc("PTTG1IP(Y174)", "CX4945", dec); 0.2375278067::p_fc("PTTG1IP(Y174)", "CX4945", inc) :- phosphosite("PTTG1IP(Y174)").
0.1789658479::p_fc("PTTG1IP(Y174)", "DNAPK", dec); 0.1789658479::p_fc("PTTG1IP(Y174)", "DNAPK", inc) :- phosphosite("PTTG1IP(Y174)").
0.072508896::p_fc("PTTG1IP(Y174)", "Dabrafenib", dec); 0.072508896::p_fc("PTTG1IP(Y174)", "Dabrafenib", inc) :- phosphosite("PTTG1IP(Y174)").
0.4510265498::p_fc("PTTG1IP(Y174)", "Dasatinib", dec); 0.4510265498::p_fc("PTTG1IP(Y174)", "Dasatinib", inc) :- phosphosite("PTTG1IP(Y174)").
0.3799251387::p_fc("PTTG1IP(Y174)", "Edelfosine", dec); 0.3799251387::p_fc("PTTG1IP(Y174)", "Edelfosine", inc) :- phosphosite("PTTG1IP(Y174)").
0.2698360304::p_fc("PTTG1IP(Y174)", "FRAX486", dec); 0.2698360304::p_fc("PTTG1IP(Y174)", "FRAX486", inc) :- phosphosite("PTTG1IP(Y174)").
0.3612612114::p_fc("PTTG1IP(Y174)", "GDC0941", dec); 0.3612612114::p_fc("PTTG1IP(Y174)", "GDC0941", inc) :- phosphosite("PTTG1IP(Y174)").
0.2590439151::p_fc("PTTG1IP(Y174)", "GDC0994", dec); 0.2590439151::p_fc("PTTG1IP(Y174)", "GDC0994", inc) :- phosphosite("PTTG1IP(Y174)").
0.1816986711::p_fc("PTTG1IP(Y174)", "GF109203X", dec); 0.1816986711::p_fc("PTTG1IP(Y174)", "GF109203X", inc) :- phosphosite("PTTG1IP(Y174)").
0.4086831742::p_fc("PTTG1IP(Y174)", "GO6983", dec); 0.4086831742::p_fc("PTTG1IP(Y174)", "GO6983", inc) :- phosphosite("PTTG1IP(Y174)").
0.0377566059::p_fc("PTTG1IP(Y174)", "GSK2334470", dec); 0.0377566059::p_fc("PTTG1IP(Y174)", "GSK2334470", inc) :- phosphosite("PTTG1IP(Y174)").
0.1142131864::p_fc("PTTG1IP(Y174)", "GSK690693", dec); 0.1142131864::p_fc("PTTG1IP(Y174)", "GSK690693", inc) :- phosphosite("PTTG1IP(Y174)").
0.3431724304::p_fc("PTTG1IP(Y174)", "Go6976", dec); 0.3431724304::p_fc("PTTG1IP(Y174)", "Go6976", inc) :- phosphosite("PTTG1IP(Y174)").
0.27039471::p_fc("PTTG1IP(Y174)", "H89", dec); 0.27039471::p_fc("PTTG1IP(Y174)", "H89", inc) :- phosphosite("PTTG1IP(Y174)").
0.4302085311::p_fc("PTTG1IP(Y174)", "HS173", dec); 0.4302085311::p_fc("PTTG1IP(Y174)", "HS173", inc) :- phosphosite("PTTG1IP(Y174)").
0.1871870484::p_fc("PTTG1IP(Y174)", "Ipatasertib", dec); 0.1871870484::p_fc("PTTG1IP(Y174)", "Ipatasertib", inc) :- phosphosite("PTTG1IP(Y174)").
0.3626777316::p_fc("PTTG1IP(Y174)", "JNJ", dec); 0.3626777316::p_fc("PTTG1IP(Y174)", "JNJ", inc) :- phosphosite("PTTG1IP(Y174)").
0.3627326168::p_fc("PTTG1IP(Y174)", "JNK", dec); 0.3627326168::p_fc("PTTG1IP(Y174)", "JNK", inc) :- phosphosite("PTTG1IP(Y174)").
0.3979007792::p_fc("PTTG1IP(Y174)", "KD025", dec); 0.3979007792::p_fc("PTTG1IP(Y174)", "KD025", inc) :- phosphosite("PTTG1IP(Y174)").
0.2557150787::p_fc("PTTG1IP(Y174)", "KN62", dec); 0.2557150787::p_fc("PTTG1IP(Y174)", "KN62", inc) :- phosphosite("PTTG1IP(Y174)").
0.0426562146::p_fc("PTTG1IP(Y174)", "KN93", dec); 0.0426562146::p_fc("PTTG1IP(Y174)", "KN93", inc) :- phosphosite("PTTG1IP(Y174)").
0.4253847703::p_fc("PTTG1IP(Y174)", "Ku0063794", dec); 0.4253847703::p_fc("PTTG1IP(Y174)", "Ku0063794", inc) :- phosphosite("PTTG1IP(Y174)").
0.3677617888::p_fc("PTTG1IP(Y174)", "LY2090314", dec); 0.3677617888::p_fc("PTTG1IP(Y174)", "LY2090314", inc) :- phosphosite("PTTG1IP(Y174)").
0.3756655068::p_fc("PTTG1IP(Y174)", "LY2584702", dec); 0.3756655068::p_fc("PTTG1IP(Y174)", "LY2584702", inc) :- phosphosite("PTTG1IP(Y174)").
0.2867483719::p_fc("PTTG1IP(Y174)", "LY2835219", dec); 0.2867483719::p_fc("PTTG1IP(Y174)", "LY2835219", inc) :- phosphosite("PTTG1IP(Y174)").
0.0447617762::p_fc("PTTG1IP(Y174)", "Linsitinib", dec); 0.0447617762::p_fc("PTTG1IP(Y174)", "Linsitinib", inc) :- phosphosite("PTTG1IP(Y174)").
0.2150377169::p_fc("PTTG1IP(Y174)", "MK2206", dec); 0.2150377169::p_fc("PTTG1IP(Y174)", "MK2206", inc) :- phosphosite("PTTG1IP(Y174)").
0.1550447701::p_fc("PTTG1IP(Y174)", "NU7441", dec); 0.1550447701::p_fc("PTTG1IP(Y174)", "NU7441", inc) :- phosphosite("PTTG1IP(Y174)").
0.2230000317::p_fc("PTTG1IP(Y174)", "PD153035", dec); 0.2230000317::p_fc("PTTG1IP(Y174)", "PD153035", inc) :- phosphosite("PTTG1IP(Y174)").
0.3142009032::p_fc("PTTG1IP(Y174)", "PF3758309", dec); 0.3142009032::p_fc("PTTG1IP(Y174)", "PF3758309", inc) :- phosphosite("PTTG1IP(Y174)").
0.3255111854::p_fc("PTTG1IP(Y174)", "PF4708671", dec); 0.3255111854::p_fc("PTTG1IP(Y174)", "PF4708671", inc) :- phosphosite("PTTG1IP(Y174)").
0.4401110657::p_fc("PTTG1IP(Y174)", "PH797804", dec); 0.4401110657::p_fc("PTTG1IP(Y174)", "PH797804", inc) :- phosphosite("PTTG1IP(Y174)").
0.3838807049::p_fc("PTTG1IP(Y174)", "PIK294", dec); 0.3838807049::p_fc("PTTG1IP(Y174)", "PIK294", inc) :- phosphosite("PTTG1IP(Y174)").
0.0088519395::p_fc("PTTG1IP(Y174)", "Ribociclib", dec); 0.0088519395::p_fc("PTTG1IP(Y174)", "Ribociclib", inc) :- phosphosite("PTTG1IP(Y174)").
0.4392234511::p_fc("PTTG1IP(Y174)", "Ripasudil", dec); 0.4392234511::p_fc("PTTG1IP(Y174)", "Ripasudil", inc) :- phosphosite("PTTG1IP(Y174)").
0.4243041218::p_fc("PTTG1IP(Y174)", "SP600125", dec); 0.4243041218::p_fc("PTTG1IP(Y174)", "SP600125", inc) :- phosphosite("PTTG1IP(Y174)").
0.4710956716::p_fc("PTTG1IP(Y174)", "Selumetinib", dec); 0.4710956716::p_fc("PTTG1IP(Y174)", "Selumetinib", inc) :- phosphosite("PTTG1IP(Y174)").
0.2830925145::p_fc("PTTG1IP(Y174)", "TAK715", dec); 0.2830925145::p_fc("PTTG1IP(Y174)", "TAK715", inc) :- phosphosite("PTTG1IP(Y174)").
0.337528682::p_fc("PTTG1IP(Y174)", "TBCA", dec); 0.337528682::p_fc("PTTG1IP(Y174)", "TBCA", inc) :- phosphosite("PTTG1IP(Y174)").
0.4327147029::p_fc("PTTG1IP(Y174)", "TGX221", dec); 0.4327147029::p_fc("PTTG1IP(Y174)", "TGX221", inc) :- phosphosite("PTTG1IP(Y174)").
0.0455050587::p_fc("PTTG1IP(Y174)", "Tofacitinib", dec); 0.0455050587::p_fc("PTTG1IP(Y174)", "Tofacitinib", inc) :- phosphosite("PTTG1IP(Y174)").
0.307088012::p_fc("PTTG1IP(Y174)", "Torin", dec); 0.307088012::p_fc("PTTG1IP(Y174)", "Torin", inc) :- phosphosite("PTTG1IP(Y174)").
0.3803041778::p_fc("PTTG1IP(Y174)", "Trametinib", dec); 0.3803041778::p_fc("PTTG1IP(Y174)", "Trametinib", inc) :- phosphosite("PTTG1IP(Y174)").
0.2666540414::p_fc("PTTG1IP(Y174)", "U73122", dec); 0.2666540414::p_fc("PTTG1IP(Y174)", "U73122", inc) :- phosphosite("PTTG1IP(Y174)").
0.1864596549::p_fc("PTTG1IP(Y174)", "Ulixertinib", dec); 0.1864596549::p_fc("PTTG1IP(Y174)", "Ulixertinib", inc) :- phosphosite("PTTG1IP(Y174)").
0.2151169673::p_fc("PTTG1IP(Y174)", "Vemurafenib", dec); 0.2151169673::p_fc("PTTG1IP(Y174)", "Vemurafenib", inc) :- phosphosite("PTTG1IP(Y174)").
0.099487088::p_fc("PXN(Y118)", "AC220", dec); 0.099487088::p_fc("PXN(Y118)", "AC220", inc) :- phosphosite("PXN(Y118)").
0.0117391371::p_fc("PXN(Y118)", "AT13148", dec); 0.0117391371::p_fc("PXN(Y118)", "AT13148", inc) :- phosphosite("PXN(Y118)").
0.039327279::p_fc("PXN(Y118)", "AZ20", dec); 0.039327279::p_fc("PXN(Y118)", "AZ20", inc) :- phosphosite("PXN(Y118)").
0.1640565358::p_fc("PXN(Y118)", "AZD1480", dec); 0.1640565358::p_fc("PXN(Y118)", "AZD1480", inc) :- phosphosite("PXN(Y118)").
0.1060513663::p_fc("PXN(Y118)", "AZD3759", dec); 0.1060513663::p_fc("PXN(Y118)", "AZD3759", inc) :- phosphosite("PXN(Y118)").
0.4753444159::p_fc("PXN(Y118)", "AZD5363", dec); 0.4753444159::p_fc("PXN(Y118)", "AZD5363", inc) :- phosphosite("PXN(Y118)").
0.4248423466::p_fc("PXN(Y118)", "AZD5438", dec); 0.4248423466::p_fc("PXN(Y118)", "AZD5438", inc) :- phosphosite("PXN(Y118)").
0.1068636627::p_fc("PXN(Y118)", "AZD6482", dec); 0.1068636627::p_fc("PXN(Y118)", "AZD6482", inc) :- phosphosite("PXN(Y118)").
0.139077467::p_fc("PXN(Y118)", "AZD6738", dec); 0.139077467::p_fc("PXN(Y118)", "AZD6738", inc) :- phosphosite("PXN(Y118)").
0.0641534739::p_fc("PXN(Y118)", "AZD8055", dec); 0.0641534739::p_fc("PXN(Y118)", "AZD8055", inc) :- phosphosite("PXN(Y118)").
0.2499679068::p_fc("PXN(Y118)", "Amuvatinib", dec); 0.2499679068::p_fc("PXN(Y118)", "Amuvatinib", inc) :- phosphosite("PXN(Y118)").
0.1915103426::p_fc("PXN(Y118)", "BX912", dec); 0.1915103426::p_fc("PXN(Y118)", "BX912", inc) :- phosphosite("PXN(Y118)").
0.1261131547::p_fc("PXN(Y118)", "Bosutinib", dec); 0.1261131547::p_fc("PXN(Y118)", "Bosutinib", inc) :- phosphosite("PXN(Y118)").
0.4553741784::p_fc("PXN(Y118)", "CAL101", dec); 0.4553741784::p_fc("PXN(Y118)", "CAL101", inc) :- phosphosite("PXN(Y118)").
0.2840378216::p_fc("PXN(Y118)", "CHIR99021", dec); 0.2840378216::p_fc("PXN(Y118)", "CHIR99021", inc) :- phosphosite("PXN(Y118)").
0.195089383::p_fc("PXN(Y118)", "CX4945", dec); 0.195089383::p_fc("PXN(Y118)", "CX4945", inc) :- phosphosite("PXN(Y118)").
0.4234742847::p_fc("PXN(Y118)", "DNAPK", dec); 0.4234742847::p_fc("PXN(Y118)", "DNAPK", inc) :- phosphosite("PXN(Y118)").
0.2815796945::p_fc("PXN(Y118)", "Dabrafenib", dec); 0.2815796945::p_fc("PXN(Y118)", "Dabrafenib", inc) :- phosphosite("PXN(Y118)").
0.417524124::p_fc("PXN(Y118)", "Dasatinib", dec); 0.417524124::p_fc("PXN(Y118)", "Dasatinib", inc) :- phosphosite("PXN(Y118)").
0.0625344005::p_fc("PXN(Y118)", "Edelfosine", dec); 0.0625344005::p_fc("PXN(Y118)", "Edelfosine", inc) :- phosphosite("PXN(Y118)").
0.2310980796::p_fc("PXN(Y118)", "FRAX486", dec); 0.2310980796::p_fc("PXN(Y118)", "FRAX486", inc) :- phosphosite("PXN(Y118)").
0.4410903354::p_fc("PXN(Y118)", "GDC0941", dec); 0.4410903354::p_fc("PXN(Y118)", "GDC0941", inc) :- phosphosite("PXN(Y118)").
0.4842315019::p_fc("PXN(Y118)", "GDC0994", dec); 0.4842315019::p_fc("PXN(Y118)", "GDC0994", inc) :- phosphosite("PXN(Y118)").
0.2307570022::p_fc("PXN(Y118)", "GF109203X", dec); 0.2307570022::p_fc("PXN(Y118)", "GF109203X", inc) :- phosphosite("PXN(Y118)").
0.0046752536::p_fc("PXN(Y118)", "GO6983", dec); 0.0046752536::p_fc("PXN(Y118)", "GO6983", inc) :- phosphosite("PXN(Y118)").
0.0067529829::p_fc("PXN(Y118)", "GSK2334470", dec); 0.0067529829::p_fc("PXN(Y118)", "GSK2334470", inc) :- phosphosite("PXN(Y118)").
0.0145952929::p_fc("PXN(Y118)", "GSK690693", dec); 0.0145952929::p_fc("PXN(Y118)", "GSK690693", inc) :- phosphosite("PXN(Y118)").
0.1584125083::p_fc("PXN(Y118)", "Go6976", dec); 0.1584125083::p_fc("PXN(Y118)", "Go6976", inc) :- phosphosite("PXN(Y118)").
0.1162089572::p_fc("PXN(Y118)", "H89", dec); 0.1162089572::p_fc("PXN(Y118)", "H89", inc) :- phosphosite("PXN(Y118)").
0.4861286553::p_fc("PXN(Y118)", "HS173", dec); 0.4861286553::p_fc("PXN(Y118)", "HS173", inc) :- phosphosite("PXN(Y118)").
0.0744458766::p_fc("PXN(Y118)", "Ipatasertib", dec); 0.0744458766::p_fc("PXN(Y118)", "Ipatasertib", inc) :- phosphosite("PXN(Y118)").
0.2591568826::p_fc("PXN(Y118)", "JNJ", dec); 0.2591568826::p_fc("PXN(Y118)", "JNJ", inc) :- phosphosite("PXN(Y118)").
0.019812838::p_fc("PXN(Y118)", "JNK", dec); 0.019812838::p_fc("PXN(Y118)", "JNK", inc) :- phosphosite("PXN(Y118)").
0.0470550541::p_fc("PXN(Y118)", "KD025", dec); 0.0470550541::p_fc("PXN(Y118)", "KD025", inc) :- phosphosite("PXN(Y118)").
0.0507533778::p_fc("PXN(Y118)", "KN62", dec); 0.0507533778::p_fc("PXN(Y118)", "KN62", inc) :- phosphosite("PXN(Y118)").
0.2323191813::p_fc("PXN(Y118)", "KN93", dec); 0.2323191813::p_fc("PXN(Y118)", "KN93", inc) :- phosphosite("PXN(Y118)").
0.4454405935::p_fc("PXN(Y118)", "Ku0063794", dec); 0.4454405935::p_fc("PXN(Y118)", "Ku0063794", inc) :- phosphosite("PXN(Y118)").
0.3875274133::p_fc("PXN(Y118)", "LY2090314", dec); 0.3875274133::p_fc("PXN(Y118)", "LY2090314", inc) :- phosphosite("PXN(Y118)").
0.4115387119::p_fc("PXN(Y118)", "LY2584702", dec); 0.4115387119::p_fc("PXN(Y118)", "LY2584702", inc) :- phosphosite("PXN(Y118)").
0.2143978764::p_fc("PXN(Y118)", "LY2835219", dec); 0.2143978764::p_fc("PXN(Y118)", "LY2835219", inc) :- phosphosite("PXN(Y118)").
0.1014320306::p_fc("PXN(Y118)", "Linsitinib", dec); 0.1014320306::p_fc("PXN(Y118)", "Linsitinib", inc) :- phosphosite("PXN(Y118)").
0.2955607103::p_fc("PXN(Y118)", "MK2206", dec); 0.2955607103::p_fc("PXN(Y118)", "MK2206", inc) :- phosphosite("PXN(Y118)").
0.2147407599::p_fc("PXN(Y118)", "NU7441", dec); 0.2147407599::p_fc("PXN(Y118)", "NU7441", inc) :- phosphosite("PXN(Y118)").
0.0741894576::p_fc("PXN(Y118)", "PD153035", dec); 0.0741894576::p_fc("PXN(Y118)", "PD153035", inc) :- phosphosite("PXN(Y118)").
0.1490361138::p_fc("PXN(Y118)", "PF3758309", dec); 0.1490361138::p_fc("PXN(Y118)", "PF3758309", inc) :- phosphosite("PXN(Y118)").
0.2191339835::p_fc("PXN(Y118)", "PF4708671", dec); 0.2191339835::p_fc("PXN(Y118)", "PF4708671", inc) :- phosphosite("PXN(Y118)").
0.0965032722::p_fc("PXN(Y118)", "PH797804", dec); 0.0965032722::p_fc("PXN(Y118)", "PH797804", inc) :- phosphosite("PXN(Y118)").
0.2475198994::p_fc("PXN(Y118)", "PIK294", dec); 0.2475198994::p_fc("PXN(Y118)", "PIK294", inc) :- phosphosite("PXN(Y118)").
0.4587897721::p_fc("PXN(Y118)", "Ribociclib", dec); 0.4587897721::p_fc("PXN(Y118)", "Ribociclib", inc) :- phosphosite("PXN(Y118)").
0.0865426952::p_fc("PXN(Y118)", "Ripasudil", dec); 0.0865426952::p_fc("PXN(Y118)", "Ripasudil", inc) :- phosphosite("PXN(Y118)").
0.1424022826::p_fc("PXN(Y118)", "SP600125", dec); 0.1424022826::p_fc("PXN(Y118)", "SP600125", inc) :- phosphosite("PXN(Y118)").
0.1331010969::p_fc("PXN(Y118)", "Selumetinib", dec); 0.1331010969::p_fc("PXN(Y118)", "Selumetinib", inc) :- phosphosite("PXN(Y118)").
0.0818071889::p_fc("PXN(Y118)", "TAK715", dec); 0.0818071889::p_fc("PXN(Y118)", "TAK715", inc) :- phosphosite("PXN(Y118)").
0.3251100702::p_fc("PXN(Y118)", "TBCA", dec); 0.3251100702::p_fc("PXN(Y118)", "TBCA", inc) :- phosphosite("PXN(Y118)").
0.4478243456::p_fc("PXN(Y118)", "TGX221", dec); 0.4478243456::p_fc("PXN(Y118)", "TGX221", inc) :- phosphosite("PXN(Y118)").
0.1279149683::p_fc("PXN(Y118)", "Tofacitinib", dec); 0.1279149683::p_fc("PXN(Y118)", "Tofacitinib", inc) :- phosphosite("PXN(Y118)").
0.1243926468::p_fc("PXN(Y118)", "Torin", dec); 0.1243926468::p_fc("PXN(Y118)", "Torin", inc) :- phosphosite("PXN(Y118)").
0.1511605889::p_fc("PXN(Y118)", "Trametinib", dec); 0.1511605889::p_fc("PXN(Y118)", "Trametinib", inc) :- phosphosite("PXN(Y118)").
0.077620816::p_fc("PXN(Y118)", "U73122", dec); 0.077620816::p_fc("PXN(Y118)", "U73122", inc) :- phosphosite("PXN(Y118)").
0.1165396008::p_fc("PXN(Y118)", "Ulixertinib", dec); 0.1165396008::p_fc("PXN(Y118)", "Ulixertinib", inc) :- phosphosite("PXN(Y118)").
0.2472863733::p_fc("PXN(Y118)", "Vemurafenib", dec); 0.2472863733::p_fc("PXN(Y118)", "Vemurafenib", inc) :- phosphosite("PXN(Y118)").
0.4764668385::p_fc("PXN(Y88)", "AC220", dec); 0.4764668385::p_fc("PXN(Y88)", "AC220", inc) :- phosphosite("PXN(Y88)").
0.4891815186::p_fc("PXN(Y88)", "AT13148", dec); 0.4891815186::p_fc("PXN(Y88)", "AT13148", inc) :- phosphosite("PXN(Y88)").
0.434524756::p_fc("PXN(Y88)", "AZ20", dec); 0.434524756::p_fc("PXN(Y88)", "AZ20", inc) :- phosphosite("PXN(Y88)").
0.4777452378::p_fc("PXN(Y88)", "AZD1480", dec); 0.4777452378::p_fc("PXN(Y88)", "AZD1480", inc) :- phosphosite("PXN(Y88)").
0.0021362886::p_fc("PXN(Y88)", "AZD3759", dec); 0.0021362886::p_fc("PXN(Y88)", "AZD3759", inc) :- phosphosite("PXN(Y88)").
0.4328414782::p_fc("PXN(Y88)", "AZD5363", dec); 0.4328414782::p_fc("PXN(Y88)", "AZD5363", inc) :- phosphosite("PXN(Y88)").
0.0012570167::p_fc("PXN(Y88)", "AZD5438", dec); 0.0012570167::p_fc("PXN(Y88)", "AZD5438", inc) :- phosphosite("PXN(Y88)").
0.0326294006::p_fc("PXN(Y88)", "AZD6482", dec); 0.0326294006::p_fc("PXN(Y88)", "AZD6482", inc) :- phosphosite("PXN(Y88)").
0.0347165365::p_fc("PXN(Y88)", "AZD6738", dec); 0.0347165365::p_fc("PXN(Y88)", "AZD6738", inc) :- phosphosite("PXN(Y88)").
0.159354686::p_fc("PXN(Y88)", "AZD8055", dec); 0.159354686::p_fc("PXN(Y88)", "AZD8055", inc) :- phosphosite("PXN(Y88)").
0.0173761845::p_fc("PXN(Y88)", "Amuvatinib", dec); 0.0173761845::p_fc("PXN(Y88)", "Amuvatinib", inc) :- phosphosite("PXN(Y88)").
0.468373723::p_fc("PXN(Y88)", "BX912", dec); 0.468373723::p_fc("PXN(Y88)", "BX912", inc) :- phosphosite("PXN(Y88)").
0.0117989106::p_fc("PXN(Y88)", "Bosutinib", dec); 0.0117989106::p_fc("PXN(Y88)", "Bosutinib", inc) :- phosphosite("PXN(Y88)").
0.3197406907::p_fc("PXN(Y88)", "CAL101", dec); 0.3197406907::p_fc("PXN(Y88)", "CAL101", inc) :- phosphosite("PXN(Y88)").
0.4056034607::p_fc("PXN(Y88)", "CHIR99021", dec); 0.4056034607::p_fc("PXN(Y88)", "CHIR99021", inc) :- phosphosite("PXN(Y88)").
0.1060510233::p_fc("PXN(Y88)", "CX4945", dec); 0.1060510233::p_fc("PXN(Y88)", "CX4945", inc) :- phosphosite("PXN(Y88)").
0.2520035924::p_fc("PXN(Y88)", "DNAPK", dec); 0.2520035924::p_fc("PXN(Y88)", "DNAPK", inc) :- phosphosite("PXN(Y88)").
0.4635518215::p_fc("PXN(Y88)", "Dabrafenib", dec); 0.4635518215::p_fc("PXN(Y88)", "Dabrafenib", inc) :- phosphosite("PXN(Y88)").
0.0208633732::p_fc("PXN(Y88)", "Dasatinib", dec); 0.0208633732::p_fc("PXN(Y88)", "Dasatinib", inc) :- phosphosite("PXN(Y88)").
0.2996924879::p_fc("PXN(Y88)", "Edelfosine", dec); 0.2996924879::p_fc("PXN(Y88)", "Edelfosine", inc) :- phosphosite("PXN(Y88)").
4.43618e-05::p_fc("PXN(Y88)", "FRAX486", dec); 4.43618e-05::p_fc("PXN(Y88)", "FRAX486", inc) :- phosphosite("PXN(Y88)").
0.3126622663::p_fc("PXN(Y88)", "GDC0941", dec); 0.3126622663::p_fc("PXN(Y88)", "GDC0941", inc) :- phosphosite("PXN(Y88)").
0.4854470012::p_fc("PXN(Y88)", "GDC0994", dec); 0.4854470012::p_fc("PXN(Y88)", "GDC0994", inc) :- phosphosite("PXN(Y88)").
1.4981e-06::p_fc("PXN(Y88)", "GF109203X", dec); 1.4981e-06::p_fc("PXN(Y88)", "GF109203X", inc) :- phosphosite("PXN(Y88)").
0.4153837528::p_fc("PXN(Y88)", "GO6983", dec); 0.4153837528::p_fc("PXN(Y88)", "GO6983", inc) :- phosphosite("PXN(Y88)").
0.0353229061::p_fc("PXN(Y88)", "GSK2334470", dec); 0.0353229061::p_fc("PXN(Y88)", "GSK2334470", inc) :- phosphosite("PXN(Y88)").
0.3067729376::p_fc("PXN(Y88)", "GSK690693", dec); 0.3067729376::p_fc("PXN(Y88)", "GSK690693", inc) :- phosphosite("PXN(Y88)").
0.2759219001::p_fc("PXN(Y88)", "Go6976", dec); 0.2759219001::p_fc("PXN(Y88)", "Go6976", inc) :- phosphosite("PXN(Y88)").
0.1748530898::p_fc("PXN(Y88)", "H89", dec); 0.1748530898::p_fc("PXN(Y88)", "H89", inc) :- phosphosite("PXN(Y88)").
0.4691833987::p_fc("PXN(Y88)", "HS173", dec); 0.4691833987::p_fc("PXN(Y88)", "HS173", inc) :- phosphosite("PXN(Y88)").
0.0002772388::p_fc("PXN(Y88)", "Ipatasertib", dec); 0.0002772388::p_fc("PXN(Y88)", "Ipatasertib", inc) :- phosphosite("PXN(Y88)").
3.10889e-05::p_fc("PXN(Y88)", "JNJ", dec); 3.10889e-05::p_fc("PXN(Y88)", "JNJ", inc) :- phosphosite("PXN(Y88)").
0.2052516703::p_fc("PXN(Y88)", "JNK", dec); 0.2052516703::p_fc("PXN(Y88)", "JNK", inc) :- phosphosite("PXN(Y88)").
0.0741427899::p_fc("PXN(Y88)", "KD025", dec); 0.0741427899::p_fc("PXN(Y88)", "KD025", inc) :- phosphosite("PXN(Y88)").
0.000212928::p_fc("PXN(Y88)", "KN62", dec); 0.000212928::p_fc("PXN(Y88)", "KN62", inc) :- phosphosite("PXN(Y88)").
0.3657989021::p_fc("PXN(Y88)", "KN93", dec); 0.3657989021::p_fc("PXN(Y88)", "KN93", inc) :- phosphosite("PXN(Y88)").
0.004024666::p_fc("PXN(Y88)", "Ku0063794", dec); 0.004024666::p_fc("PXN(Y88)", "Ku0063794", inc) :- phosphosite("PXN(Y88)").
0.3572471967::p_fc("PXN(Y88)", "LY2090314", dec); 0.3572471967::p_fc("PXN(Y88)", "LY2090314", inc) :- phosphosite("PXN(Y88)").
0.287252201::p_fc("PXN(Y88)", "LY2584702", dec); 0.287252201::p_fc("PXN(Y88)", "LY2584702", inc) :- phosphosite("PXN(Y88)").
0.0039095198::p_fc("PXN(Y88)", "LY2835219", dec); 0.0039095198::p_fc("PXN(Y88)", "LY2835219", inc) :- phosphosite("PXN(Y88)").
0.0029518395::p_fc("PXN(Y88)", "Linsitinib", dec); 0.0029518395::p_fc("PXN(Y88)", "Linsitinib", inc) :- phosphosite("PXN(Y88)").
0.4221347294::p_fc("PXN(Y88)", "MK2206", dec); 0.4221347294::p_fc("PXN(Y88)", "MK2206", inc) :- phosphosite("PXN(Y88)").
0.2008966373::p_fc("PXN(Y88)", "NU7441", dec); 0.2008966373::p_fc("PXN(Y88)", "NU7441", inc) :- phosphosite("PXN(Y88)").
0.4062015347::p_fc("PXN(Y88)", "PD153035", dec); 0.4062015347::p_fc("PXN(Y88)", "PD153035", inc) :- phosphosite("PXN(Y88)").
0.1086373765::p_fc("PXN(Y88)", "PF3758309", dec); 0.1086373765::p_fc("PXN(Y88)", "PF3758309", inc) :- phosphosite("PXN(Y88)").
0.4434115419::p_fc("PXN(Y88)", "PF4708671", dec); 0.4434115419::p_fc("PXN(Y88)", "PF4708671", inc) :- phosphosite("PXN(Y88)").
0.4509569957::p_fc("PXN(Y88)", "PH797804", dec); 0.4509569957::p_fc("PXN(Y88)", "PH797804", inc) :- phosphosite("PXN(Y88)").
0.2196872421::p_fc("PXN(Y88)", "PIK294", dec); 0.2196872421::p_fc("PXN(Y88)", "PIK294", inc) :- phosphosite("PXN(Y88)").
0.0001994823::p_fc("PXN(Y88)", "Ribociclib", dec); 0.0001994823::p_fc("PXN(Y88)", "Ribociclib", inc) :- phosphosite("PXN(Y88)").
0.3420003113::p_fc("PXN(Y88)", "Ripasudil", dec); 0.3420003113::p_fc("PXN(Y88)", "Ripasudil", inc) :- phosphosite("PXN(Y88)").
0.4818146401::p_fc("PXN(Y88)", "SP600125", dec); 0.4818146401::p_fc("PXN(Y88)", "SP600125", inc) :- phosphosite("PXN(Y88)").
0.3992925452::p_fc("PXN(Y88)", "Selumetinib", dec); 0.3992925452::p_fc("PXN(Y88)", "Selumetinib", inc) :- phosphosite("PXN(Y88)").
0.360045434::p_fc("PXN(Y88)", "TAK715", dec); 0.360045434::p_fc("PXN(Y88)", "TAK715", inc) :- phosphosite("PXN(Y88)").
0.4516836225::p_fc("PXN(Y88)", "TBCA", dec); 0.4516836225::p_fc("PXN(Y88)", "TBCA", inc) :- phosphosite("PXN(Y88)").
0.1515168856::p_fc("PXN(Y88)", "TGX221", dec); 0.1515168856::p_fc("PXN(Y88)", "TGX221", inc) :- phosphosite("PXN(Y88)").
0.1058064096::p_fc("PXN(Y88)", "Tofacitinib", dec); 0.1058064096::p_fc("PXN(Y88)", "Tofacitinib", inc) :- phosphosite("PXN(Y88)").
4.3431e-06::p_fc("PXN(Y88)", "Torin", dec); 4.3431e-06::p_fc("PXN(Y88)", "Torin", inc) :- phosphosite("PXN(Y88)").
0.0023062862::p_fc("PXN(Y88)", "Trametinib", dec); 0.0023062862::p_fc("PXN(Y88)", "Trametinib", inc) :- phosphosite("PXN(Y88)").
0.2232659635::p_fc("PXN(Y88)", "U73122", dec); 0.2232659635::p_fc("PXN(Y88)", "U73122", inc) :- phosphosite("PXN(Y88)").
0.0996987672::p_fc("PXN(Y88)", "Ulixertinib", dec); 0.0996987672::p_fc("PXN(Y88)", "Ulixertinib", inc) :- phosphosite("PXN(Y88)").
0.1462025203::p_fc("PXN(Y88)", "Vemurafenib", dec); 0.1462025203::p_fc("PXN(Y88)", "Vemurafenib", inc) :- phosphosite("PXN(Y88)").
0.0345160506::p_fc("RBM39(Y95)", "AC220", dec); 0.0345160506::p_fc("RBM39(Y95)", "AC220", inc) :- phosphosite("RBM39(Y95)").
0.1188411515::p_fc("RBM39(Y95)", "AT13148", dec); 0.1188411515::p_fc("RBM39(Y95)", "AT13148", inc) :- phosphosite("RBM39(Y95)").
0.2419552203::p_fc("RBM39(Y95)", "AZ20", dec); 0.2419552203::p_fc("RBM39(Y95)", "AZ20", inc) :- phosphosite("RBM39(Y95)").
0.1928292413::p_fc("RBM39(Y95)", "AZD1480", dec); 0.1928292413::p_fc("RBM39(Y95)", "AZD1480", inc) :- phosphosite("RBM39(Y95)").
0.2255140669::p_fc("RBM39(Y95)", "AZD3759", dec); 0.2255140669::p_fc("RBM39(Y95)", "AZD3759", inc) :- phosphosite("RBM39(Y95)").
0.0227152951::p_fc("RBM39(Y95)", "AZD5363", dec); 0.0227152951::p_fc("RBM39(Y95)", "AZD5363", inc) :- phosphosite("RBM39(Y95)").
0.2846220504::p_fc("RBM39(Y95)", "AZD5438", dec); 0.2846220504::p_fc("RBM39(Y95)", "AZD5438", inc) :- phosphosite("RBM39(Y95)").
0.4832589441::p_fc("RBM39(Y95)", "AZD6482", dec); 0.4832589441::p_fc("RBM39(Y95)", "AZD6482", inc) :- phosphosite("RBM39(Y95)").
0.2147366224::p_fc("RBM39(Y95)", "AZD6738", dec); 0.2147366224::p_fc("RBM39(Y95)", "AZD6738", inc) :- phosphosite("RBM39(Y95)").
0.0::p_fc("RBM39(Y95)", "AZD8055", dec); 0.0::p_fc("RBM39(Y95)", "AZD8055", inc) :- phosphosite("RBM39(Y95)").
0.1290252053::p_fc("RBM39(Y95)", "Amuvatinib", dec); 0.1290252053::p_fc("RBM39(Y95)", "Amuvatinib", inc) :- phosphosite("RBM39(Y95)").
0.310415352::p_fc("RBM39(Y95)", "BX912", dec); 0.310415352::p_fc("RBM39(Y95)", "BX912", inc) :- phosphosite("RBM39(Y95)").
0.3552974654::p_fc("RBM39(Y95)", "Bosutinib", dec); 0.3552974654::p_fc("RBM39(Y95)", "Bosutinib", inc) :- phosphosite("RBM39(Y95)").
0.2659159292::p_fc("RBM39(Y95)", "CAL101", dec); 0.2659159292::p_fc("RBM39(Y95)", "CAL101", inc) :- phosphosite("RBM39(Y95)").
0.3223592735::p_fc("RBM39(Y95)", "CHIR99021", dec); 0.3223592735::p_fc("RBM39(Y95)", "CHIR99021", inc) :- phosphosite("RBM39(Y95)").
0.2492630613::p_fc("RBM39(Y95)", "CX4945", dec); 0.2492630613::p_fc("RBM39(Y95)", "CX4945", inc) :- phosphosite("RBM39(Y95)").
0.4152284858::p_fc("RBM39(Y95)", "DNAPK", dec); 0.4152284858::p_fc("RBM39(Y95)", "DNAPK", inc) :- phosphosite("RBM39(Y95)").
0.399181597::p_fc("RBM39(Y95)", "Dabrafenib", dec); 0.399181597::p_fc("RBM39(Y95)", "Dabrafenib", inc) :- phosphosite("RBM39(Y95)").
0.4681296555::p_fc("RBM39(Y95)", "Dasatinib", dec); 0.4681296555::p_fc("RBM39(Y95)", "Dasatinib", inc) :- phosphosite("RBM39(Y95)").
0.0142592403::p_fc("RBM39(Y95)", "Edelfosine", dec); 0.0142592403::p_fc("RBM39(Y95)", "Edelfosine", inc) :- phosphosite("RBM39(Y95)").
0.2111326357::p_fc("RBM39(Y95)", "FRAX486", dec); 0.2111326357::p_fc("RBM39(Y95)", "FRAX486", inc) :- phosphosite("RBM39(Y95)").
0.0153229711::p_fc("RBM39(Y95)", "GDC0941", dec); 0.0153229711::p_fc("RBM39(Y95)", "GDC0941", inc) :- phosphosite("RBM39(Y95)").
0.4880920551::p_fc("RBM39(Y95)", "GDC0994", dec); 0.4880920551::p_fc("RBM39(Y95)", "GDC0994", inc) :- phosphosite("RBM39(Y95)").
0.1589766993::p_fc("RBM39(Y95)", "GF109203X", dec); 0.1589766993::p_fc("RBM39(Y95)", "GF109203X", inc) :- phosphosite("RBM39(Y95)").
0.0::p_fc("RBM39(Y95)", "GO6983", dec); 0.0::p_fc("RBM39(Y95)", "GO6983", inc) :- phosphosite("RBM39(Y95)").
0.4419547267::p_fc("RBM39(Y95)", "GSK2334470", dec); 0.4419547267::p_fc("RBM39(Y95)", "GSK2334470", inc) :- phosphosite("RBM39(Y95)").
0.0436808681::p_fc("RBM39(Y95)", "GSK690693", dec); 0.0436808681::p_fc("RBM39(Y95)", "GSK690693", inc) :- phosphosite("RBM39(Y95)").
0.3000617907::p_fc("RBM39(Y95)", "Go6976", dec); 0.3000617907::p_fc("RBM39(Y95)", "Go6976", inc) :- phosphosite("RBM39(Y95)").
0.4424388321::p_fc("RBM39(Y95)", "H89", dec); 0.4424388321::p_fc("RBM39(Y95)", "H89", inc) :- phosphosite("RBM39(Y95)").
0.3474285775::p_fc("RBM39(Y95)", "HS173", dec); 0.3474285775::p_fc("RBM39(Y95)", "HS173", inc) :- phosphosite("RBM39(Y95)").
0.3855485036::p_fc("RBM39(Y95)", "Ipatasertib", dec); 0.3855485036::p_fc("RBM39(Y95)", "Ipatasertib", inc) :- phosphosite("RBM39(Y95)").
0.4187343583::p_fc("RBM39(Y95)", "JNJ", dec); 0.4187343583::p_fc("RBM39(Y95)", "JNJ", inc) :- phosphosite("RBM39(Y95)").
0.0010456677::p_fc("RBM39(Y95)", "JNK", dec); 0.0010456677::p_fc("RBM39(Y95)", "JNK", inc) :- phosphosite("RBM39(Y95)").
0.0148678877::p_fc("RBM39(Y95)", "KD025", dec); 0.0148678877::p_fc("RBM39(Y95)", "KD025", inc) :- phosphosite("RBM39(Y95)").
0.1713151012::p_fc("RBM39(Y95)", "KN62", dec); 0.1713151012::p_fc("RBM39(Y95)", "KN62", inc) :- phosphosite("RBM39(Y95)").
0.4099278361::p_fc("RBM39(Y95)", "KN93", dec); 0.4099278361::p_fc("RBM39(Y95)", "KN93", inc) :- phosphosite("RBM39(Y95)").
0.2462214552::p_fc("RBM39(Y95)", "Ku0063794", dec); 0.2462214552::p_fc("RBM39(Y95)", "Ku0063794", inc) :- phosphosite("RBM39(Y95)").
0.4728501117::p_fc("RBM39(Y95)", "LY2090314", dec); 0.4728501117::p_fc("RBM39(Y95)", "LY2090314", inc) :- phosphosite("RBM39(Y95)").
0.45458606::p_fc("RBM39(Y95)", "LY2584702", dec); 0.45458606::p_fc("RBM39(Y95)", "LY2584702", inc) :- phosphosite("RBM39(Y95)").
0.3347024586::p_fc("RBM39(Y95)", "LY2835219", dec); 0.3347024586::p_fc("RBM39(Y95)", "LY2835219", inc) :- phosphosite("RBM39(Y95)").
0.2516354617::p_fc("RBM39(Y95)", "Linsitinib", dec); 0.2516354617::p_fc("RBM39(Y95)", "Linsitinib", inc) :- phosphosite("RBM39(Y95)").
0.4284808692::p_fc("RBM39(Y95)", "MK2206", dec); 0.4284808692::p_fc("RBM39(Y95)", "MK2206", inc) :- phosphosite("RBM39(Y95)").
0.3847808907::p_fc("RBM39(Y95)", "NU7441", dec); 0.3847808907::p_fc("RBM39(Y95)", "NU7441", inc) :- phosphosite("RBM39(Y95)").
0.2324539165::p_fc("RBM39(Y95)", "PD153035", dec); 0.2324539165::p_fc("RBM39(Y95)", "PD153035", inc) :- phosphosite("RBM39(Y95)").
5.463e-07::p_fc("RBM39(Y95)", "PF3758309", dec); 5.463e-07::p_fc("RBM39(Y95)", "PF3758309", inc) :- phosphosite("RBM39(Y95)").
0.1774922106::p_fc("RBM39(Y95)", "PF4708671", dec); 0.1774922106::p_fc("RBM39(Y95)", "PF4708671", inc) :- phosphosite("RBM39(Y95)").
0.0915271471::p_fc("RBM39(Y95)", "PH797804", dec); 0.0915271471::p_fc("RBM39(Y95)", "PH797804", inc) :- phosphosite("RBM39(Y95)").
0.3208395904::p_fc("RBM39(Y95)", "PIK294", dec); 0.3208395904::p_fc("RBM39(Y95)", "PIK294", inc) :- phosphosite("RBM39(Y95)").
0.43939642::p_fc("RBM39(Y95)", "Ribociclib", dec); 0.43939642::p_fc("RBM39(Y95)", "Ribociclib", inc) :- phosphosite("RBM39(Y95)").
0.1354890424::p_fc("RBM39(Y95)", "Ripasudil", dec); 0.1354890424::p_fc("RBM39(Y95)", "Ripasudil", inc) :- phosphosite("RBM39(Y95)").
0.1907213746::p_fc("RBM39(Y95)", "SP600125", dec); 0.1907213746::p_fc("RBM39(Y95)", "SP600125", inc) :- phosphosite("RBM39(Y95)").
0.2235459493::p_fc("RBM39(Y95)", "Selumetinib", dec); 0.2235459493::p_fc("RBM39(Y95)", "Selumetinib", inc) :- phosphosite("RBM39(Y95)").
0.4446927373::p_fc("RBM39(Y95)", "TAK715", dec); 0.4446927373::p_fc("RBM39(Y95)", "TAK715", inc) :- phosphosite("RBM39(Y95)").
0.247331783::p_fc("RBM39(Y95)", "TBCA", dec); 0.247331783::p_fc("RBM39(Y95)", "TBCA", inc) :- phosphosite("RBM39(Y95)").
0.4054416225::p_fc("RBM39(Y95)", "TGX221", dec); 0.4054416225::p_fc("RBM39(Y95)", "TGX221", inc) :- phosphosite("RBM39(Y95)").
0.2639064947::p_fc("RBM39(Y95)", "Tofacitinib", dec); 0.2639064947::p_fc("RBM39(Y95)", "Tofacitinib", inc) :- phosphosite("RBM39(Y95)").
0.3208177477::p_fc("RBM39(Y95)", "Torin", dec); 0.3208177477::p_fc("RBM39(Y95)", "Torin", inc) :- phosphosite("RBM39(Y95)").
0.1144910031::p_fc("RBM39(Y95)", "Trametinib", dec); 0.1144910031::p_fc("RBM39(Y95)", "Trametinib", inc) :- phosphosite("RBM39(Y95)").
0.3149384854::p_fc("RBM39(Y95)", "U73122", dec); 0.3149384854::p_fc("RBM39(Y95)", "U73122", inc) :- phosphosite("RBM39(Y95)").
0.0586876568::p_fc("RBM39(Y95)", "Ulixertinib", dec); 0.0586876568::p_fc("RBM39(Y95)", "Ulixertinib", inc) :- phosphosite("RBM39(Y95)").
0.353832334::p_fc("RBM39(Y95)", "Vemurafenib", dec); 0.353832334::p_fc("RBM39(Y95)", "Vemurafenib", inc) :- phosphosite("RBM39(Y95)").

%%% probabilistic attributes (unknown) %%%
% t(p1)targets(E, P). % initialise with specific probability (e.g. Cantley)
% t(1/2)targets(E, P) :- es_interaction(E, P).
% t(1/2)targets(E, P) :- enzyme(E), phosphosite(P).
% t(_, _dO)::p_fc(P, S, dec); t(_, _dO)::p_fc(P, S, base); t(_, _dO)::p_fc(P, S, inc) :- p_occupancy(P, S, _dO). % value = _fc = [dec | base | inc] (cpd, P-level)
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
