t(0.33,"SRC","GO6983")::e_activity("SRC","GO6983",dec); t(0.33,"SRC","GO6983")::e_activity("SRC","GO6983",inc).
0.001::e_ksea("SRC","GO6983",inc) :- e_activity("SRC","GO6983",dec).
0.9106057458::e_ksea("SRC","GO6983",inc) :- e_activity("SRC","GO6983",inc).
0.0446971271::e_ksea("SRC","GO6983",inc).
t(0.33,"ABL1","GO6983")::e_activity("ABL1","GO6983",dec); t(0.33,"ABL1","GO6983")::e_activity("ABL1","GO6983",inc).
0.001::e_ksea("ABL1","GO6983",inc) :- e_activity("ABL1","GO6983",dec).
0.5072410486::e_ksea("ABL1","GO6983",inc) :- e_activity("ABL1","GO6983",inc).
0.2463794757::e_ksea("ABL1","GO6983",inc).
t(0.33,"PTK2","GO6983")::e_activity("PTK2","GO6983",dec); t(0.33,"PTK2","GO6983")::e_activity("PTK2","GO6983",inc).
0.001::e_ksea("PTK2","GO6983",inc) :- e_activity("PTK2","GO6983",dec).
0.5454588191::e_ksea("PTK2","GO6983",inc) :- e_activity("PTK2","GO6983",inc).
0.2272705905::e_ksea("PTK2","GO6983",inc).
t(0.33,"PTPRG","GO6983")::e_activity("PTPRG","GO6983",dec); t(0.33,"PTPRG","GO6983")::e_activity("PTPRG","GO6983",inc).
0.001::e_ksea("PTPRG","GO6983",inc) :- e_activity("PTPRG","GO6983",dec).
0.5905941605::e_ksea("PTPRG","GO6983",inc) :- e_activity("PTPRG","GO6983",inc).
0.2047029198::e_ksea("PTPRG","GO6983",inc).
t(0.33,"FYN","GO6983")::e_activity("FYN","GO6983",dec); t(0.33,"FYN","GO6983")::e_activity("FYN","GO6983",inc).
0.001::e_ksea("FYN","GO6983",inc) :- e_activity("FYN","GO6983",dec).
0.5279418558::e_ksea("FYN","GO6983",inc) :- e_activity("FYN","GO6983",inc).
0.2360290721::e_ksea("FYN","GO6983",inc).
t(0.33,"PTK6","GO6983")::e_activity("PTK6","GO6983",dec); t(0.33,"PTK6","GO6983")::e_activity("PTK6","GO6983",inc).
0.7558958102::e_ksea("PTK6","GO6983",dec) :- e_activity("PTK6","GO6983",dec).
0.001::e_ksea("PTK6","GO6983",dec) :- e_activity("PTK6","GO6983",inc).
0.1220520949::e_ksea("PTK6","GO6983",dec).
0.001::occ_dec("PXN(Y118)","GO6983").
0.001::occ_dec("PXN(Y118)","GO6983").
0.001::occ_dec("PXN(Y118)","GO6983").
0.001::occ_dec("PXN(Y118)","GO6983").
0.001::occ_dec("PXN(Y118)","GO6983").
0.001::occ_dec("PXN(Y118)","GO6983").
t(0.7,"SRC","PXN(Y118)")::occ_dec("PXN(Y118)","GO6983") :- e_activity("SRC","GO6983",dec).
t(0.7,"ABL1","PXN(Y118)")::occ_dec("PXN(Y118)","GO6983") :- e_activity("ABL1","GO6983",dec).
t(0.7,"PTK2","PXN(Y118)")::occ_dec("PXN(Y118)","GO6983") :- e_activity("PTK2","GO6983",dec).
t(0.7,"FYN","PXN(Y118)")::occ_dec("PXN(Y118)","GO6983") :- e_activity("FYN","GO6983",dec).
t(0.7,"PTK6","PXN(Y118)")::occ_dec("PXN(Y118)","GO6983") :- e_activity("PTK6","GO6983",dec).
t(0.7,"PTPRG","PXN(Y118)")::occ_dec("PXN(Y118)","GO6983") :- e_activity("PTPRG","GO6983",inc).
0.001::occ_inc("PXN(Y118)","GO6983").
0.001::occ_inc("PXN(Y118)","GO6983").
0.001::occ_inc("PXN(Y118)","GO6983").
0.001::occ_inc("PXN(Y118)","GO6983").
0.001::occ_inc("PXN(Y118)","GO6983").
0.001::occ_inc("PXN(Y118)","GO6983").
t(0.7,"SRC","PXN(Y118)")::occ_inc("PXN(Y118)","GO6983") :- e_activity("SRC","GO6983",inc).
t(0.7,"ABL1","PXN(Y118)")::occ_inc("PXN(Y118)","GO6983") :- e_activity("ABL1","GO6983",inc).
t(0.7,"PTK2","PXN(Y118)")::occ_inc("PXN(Y118)","GO6983") :- e_activity("PTK2","GO6983",inc).
t(0.7,"FYN","PXN(Y118)")::occ_inc("PXN(Y118)","GO6983") :- e_activity("FYN","GO6983",inc).
t(0.7,"PTK6","PXN(Y118)")::occ_inc("PXN(Y118)","GO6983") :- e_activity("PTK6","GO6983",inc).
t(0.7,"PTPRG","PXN(Y118)")::occ_inc("PXN(Y118)","GO6983") :- e_activity("PTPRG","GO6983",dec).
t(1.0)::p_occupancy("PXN(Y118)","GO6983",dec); t(0.0)::p_occupancy("PXN(Y118)","GO6983",inc) :- occ_dec("PXN(Y118)","GO6983"), \+occ_inc("PXN(Y118)","GO6983").
t(0.0)::p_occupancy("PXN(Y118)","GO6983",dec); t(1.0)::p_occupancy("PXN(Y118)","GO6983",inc) :- \+occ_dec("PXN(Y118)","GO6983"), occ_inc("PXN(Y118)","GO6983").
t(0.5)::p_occupancy("PXN(Y118)","GO6983",dec); t(0.5)::p_occupancy("PXN(Y118)","GO6983",inc) :- occ_dec("PXN(Y118)","GO6983"), occ_inc("PXN(Y118)","GO6983").
t(0.0)::p_occupancy("PXN(Y118)","GO6983",dec); t(0.0)::p_occupancy("PXN(Y118)","GO6983",inc) :- \+occ_dec("PXN(Y118)","GO6983"), \+occ_inc("PXN(Y118)","GO6983").
0.9953107066::p_fc("PXN(Y118)","GO6983",dec) :- p_occupancy("PXN(Y118)","GO6983",dec).
0.001::p_fc("PXN(Y118)","GO6983",dec) :- p_occupancy("PXN(Y118)","GO6983",inc).
0.0023446467::p_fc("PXN(Y118)","GO6983",dec).
evidence(e_ksea("SRC","GO6983",inc)).
evidence(e_ksea("ABL1","GO6983",inc)).
evidence(e_ksea("PTK2","GO6983",inc)).
evidence(e_ksea("PTPRG","GO6983",inc)).
evidence(e_ksea("FYN","GO6983",inc)).
evidence(e_ksea("PTK6","GO6983",dec)).
evidence(p_fc("PXN(Y118)","GO6983",dec)).
