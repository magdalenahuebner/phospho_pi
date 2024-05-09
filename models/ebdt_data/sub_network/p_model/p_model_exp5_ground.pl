t(0.33,"SRC","FRAX486")::e_activity("SRC","FRAX486",dec); t(0.33,"SRC","FRAX486")::e_activity("SRC","FRAX486",inc).
0.7961814123::e_ksea("SRC","FRAX486",dec) :- e_activity("SRC","FRAX486",dec).
0.001::e_ksea("SRC","FRAX486",dec) :- e_activity("SRC","FRAX486",inc).
0.1019092939::e_ksea("SRC","FRAX486",dec).
t(0.33,"ABL1","FRAX486")::e_activity("ABL1","FRAX486",dec); t(0.33,"ABL1","FRAX486")::e_activity("ABL1","FRAX486",inc).
0.9852877594::e_ksea("ABL1","FRAX486",dec) :- e_activity("ABL1","FRAX486",dec).
0.001::e_ksea("ABL1","FRAX486",dec) :- e_activity("ABL1","FRAX486",inc).
0.0073561203::e_ksea("ABL1","FRAX486",dec).
t(0.33,"PTK2","FRAX486")::e_activity("PTK2","FRAX486",dec); t(0.33,"PTK2","FRAX486")::e_activity("PTK2","FRAX486",inc).
0.7740504903::e_ksea("PTK2","FRAX486",dec) :- e_activity("PTK2","FRAX486",dec).
0.001::e_ksea("PTK2","FRAX486",dec) :- e_activity("PTK2","FRAX486",inc).
0.1129747548::e_ksea("PTK2","FRAX486",dec).
t(0.33,"PTPRG","FRAX486")::e_activity("PTPRG","FRAX486",dec); t(0.33,"PTPRG","FRAX486")::e_activity("PTPRG","FRAX486",inc).
0.7857962731::e_ksea("PTPRG","FRAX486",dec) :- e_activity("PTPRG","FRAX486",dec).
0.001::e_ksea("PTPRG","FRAX486",dec) :- e_activity("PTPRG","FRAX486",inc).
0.1071018634::e_ksea("PTPRG","FRAX486",dec).
t(0.33,"FYN","FRAX486")::e_activity("FYN","FRAX486",dec); t(0.33,"FYN","FRAX486")::e_activity("FYN","FRAX486",inc).
0.5825820113::e_ksea("FYN","FRAX486",dec) :- e_activity("FYN","FRAX486",dec).
0.001::e_ksea("FYN","FRAX486",dec) :- e_activity("FYN","FRAX486",inc).
0.2087089943::e_ksea("FYN","FRAX486",dec).
t(0.33,"PTK6","FRAX486")::e_activity("PTK6","FRAX486",dec); t(0.33,"PTK6","FRAX486")::e_activity("PTK6","FRAX486",inc).
0.6745618494::e_ksea("PTK6","FRAX486",dec) :- e_activity("PTK6","FRAX486",dec).
0.001::e_ksea("PTK6","FRAX486",dec) :- e_activity("PTK6","FRAX486",inc).
0.1627190753::e_ksea("PTK6","FRAX486",dec).
0.001::occ_dec("PXN(Y118)","FRAX486").
0.001::occ_dec("PXN(Y118)","FRAX486").
0.001::occ_dec("PXN(Y118)","FRAX486").
0.001::occ_dec("PXN(Y118)","FRAX486").
0.001::occ_dec("PXN(Y118)","FRAX486").
0.001::occ_dec("PXN(Y118)","FRAX486").
t(0.7,"SRC","PXN(Y118)")::occ_dec("PXN(Y118)","FRAX486") :- e_activity("SRC","FRAX486",dec).
t(0.7,"ABL1","PXN(Y118)")::occ_dec("PXN(Y118)","FRAX486") :- e_activity("ABL1","FRAX486",dec).
t(0.7,"PTK2","PXN(Y118)")::occ_dec("PXN(Y118)","FRAX486") :- e_activity("PTK2","FRAX486",dec).
t(0.7,"FYN","PXN(Y118)")::occ_dec("PXN(Y118)","FRAX486") :- e_activity("FYN","FRAX486",dec).
t(0.7,"PTK6","PXN(Y118)")::occ_dec("PXN(Y118)","FRAX486") :- e_activity("PTK6","FRAX486",dec).
t(0.7,"PTPRG","PXN(Y118)")::occ_dec("PXN(Y118)","FRAX486") :- e_activity("PTPRG","FRAX486",inc).
0.001::occ_inc("PXN(Y118)","FRAX486").
0.001::occ_inc("PXN(Y118)","FRAX486").
0.001::occ_inc("PXN(Y118)","FRAX486").
0.001::occ_inc("PXN(Y118)","FRAX486").
0.001::occ_inc("PXN(Y118)","FRAX486").
0.001::occ_inc("PXN(Y118)","FRAX486").
t(0.7,"SRC","PXN(Y118)")::occ_inc("PXN(Y118)","FRAX486") :- e_activity("SRC","FRAX486",inc).
t(0.7,"ABL1","PXN(Y118)")::occ_inc("PXN(Y118)","FRAX486") :- e_activity("ABL1","FRAX486",inc).
t(0.7,"PTK2","PXN(Y118)")::occ_inc("PXN(Y118)","FRAX486") :- e_activity("PTK2","FRAX486",inc).
t(0.7,"FYN","PXN(Y118)")::occ_inc("PXN(Y118)","FRAX486") :- e_activity("FYN","FRAX486",inc).
t(0.7,"PTK6","PXN(Y118)")::occ_inc("PXN(Y118)","FRAX486") :- e_activity("PTK6","FRAX486",inc).
t(0.7,"PTPRG","PXN(Y118)")::occ_inc("PXN(Y118)","FRAX486") :- e_activity("PTPRG","FRAX486",dec).
t(1.0,"PXN(Y118)")::p_occupancy("PXN(Y118)","FRAX486",dec); t(0.0,"PXN(Y118)")::p_occupancy("PXN(Y118)","FRAX486",inc) :- occ_dec("PXN(Y118)","FRAX486"), \+occ_inc("PXN(Y118)","FRAX486").
t(0.0,"PXN(Y118)")::p_occupancy("PXN(Y118)","FRAX486",dec); t(1.0,"PXN(Y118)")::p_occupancy("PXN(Y118)","FRAX486",inc) :- \+occ_dec("PXN(Y118)","FRAX486"), occ_inc("PXN(Y118)","FRAX486").
t(0.5,"PXN(Y118)")::p_occupancy("PXN(Y118)","FRAX486",dec); t(0.5,"PXN(Y118)")::p_occupancy("PXN(Y118)","FRAX486",inc) :- occ_dec("PXN(Y118)","FRAX486"), occ_inc("PXN(Y118)","FRAX486").
t(0.0,"PXN(Y118)")::p_occupancy("PXN(Y118)","FRAX486",dec); t(0.0,"PXN(Y118)")::p_occupancy("PXN(Y118)","FRAX486",inc) :- \+occ_dec("PXN(Y118)","FRAX486"), \+occ_inc("PXN(Y118)","FRAX486").
0.7682079322::p_fc("PXN(Y118)","FRAX486",dec) :- p_occupancy("PXN(Y118)","FRAX486",dec).
0.001::p_fc("PXN(Y118)","FRAX486",dec) :- p_occupancy("PXN(Y118)","FRAX486",inc).
0.1158960339::p_fc("PXN(Y118)","FRAX486",dec).
evidence(e_ksea("SRC","FRAX486",dec)).
evidence(e_ksea("ABL1","FRAX486",dec)).
evidence(e_ksea("PTK2","FRAX486",dec)).
evidence(e_ksea("PTPRG","FRAX486",dec)).
evidence(e_ksea("FYN","FRAX486",dec)).
evidence(e_ksea("PTK6","FRAX486",dec)).
evidence(p_fc("PXN(Y118)","FRAX486",dec)).
