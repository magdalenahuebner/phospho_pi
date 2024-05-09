t(0.33,"SRC","JNK")::e_activity("SRC","JNK",dec); t(0.33,"SRC","JNK")::e_activity("SRC","JNK",inc).
0.001::e_ksea("SRC","JNK",inc) :- e_activity("SRC","JNK",dec).
0.6337992685::e_ksea("SRC","JNK",inc) :- e_activity("SRC","JNK",inc).
0.1831003657::e_ksea("SRC","JNK",inc).
t(0.33,"ABL1","JNK")::e_activity("ABL1","JNK",dec); t(0.33,"ABL1","JNK")::e_activity("ABL1","JNK",inc).
0.001::e_ksea("ABL1","JNK",inc) :- e_activity("ABL1","JNK",dec).
0.5877910519::e_ksea("ABL1","JNK",inc) :- e_activity("ABL1","JNK",inc).
0.206104474::e_ksea("ABL1","JNK",inc).
t(0.33,"PTK2","JNK")::e_activity("PTK2","JNK",dec); t(0.33,"PTK2","JNK")::e_activity("PTK2","JNK",inc).
0.001::e_ksea("PTK2","JNK",inc) :- e_activity("PTK2","JNK",dec).
0.6682523098::e_ksea("PTK2","JNK",inc) :- e_activity("PTK2","JNK",inc).
0.1658738451::e_ksea("PTK2","JNK",inc).
t(0.33,"PTPRG","JNK")::e_activity("PTPRG","JNK",dec); t(0.33,"PTPRG","JNK")::e_activity("PTPRG","JNK",inc).
0.5647778953::e_ksea("PTPRG","JNK",dec) :- e_activity("PTPRG","JNK",dec).
0.001::e_ksea("PTPRG","JNK",dec) :- e_activity("PTPRG","JNK",inc).
0.2176110524::e_ksea("PTPRG","JNK",dec).
t(0.33,"FYN","JNK")::e_activity("FYN","JNK",dec); t(0.33,"FYN","JNK")::e_activity("FYN","JNK",inc).
0.6606339354::e_ksea("FYN","JNK",dec) :- e_activity("FYN","JNK",dec).
0.001::e_ksea("FYN","JNK",dec) :- e_activity("FYN","JNK",inc).
0.1696830323::e_ksea("FYN","JNK",dec).
t(0.33,"PTK6","JNK")::e_activity("PTK6","JNK",dec); t(0.33,"PTK6","JNK")::e_activity("PTK6","JNK",inc).
0.5282729095::e_ksea("PTK6","JNK",dec) :- e_activity("PTK6","JNK",dec).
0.001::e_ksea("PTK6","JNK",dec) :- e_activity("PTK6","JNK",inc).
0.2358635452::e_ksea("PTK6","JNK",dec).
0.001::occ_dec("PXN(Y118)","JNK").
0.001::occ_dec("PXN(Y118)","JNK").
0.001::occ_dec("PXN(Y118)","JNK").
0.001::occ_dec("PXN(Y118)","JNK").
0.001::occ_dec("PXN(Y118)","JNK").
0.001::occ_dec("PXN(Y118)","JNK").
t(0.7,"SRC","PXN(Y118)")::occ_dec("PXN(Y118)","JNK") :- e_activity("SRC","JNK",dec).
t(0.7,"ABL1","PXN(Y118)")::occ_dec("PXN(Y118)","JNK") :- e_activity("ABL1","JNK",dec).
t(0.7,"PTK2","PXN(Y118)")::occ_dec("PXN(Y118)","JNK") :- e_activity("PTK2","JNK",dec).
t(0.7,"FYN","PXN(Y118)")::occ_dec("PXN(Y118)","JNK") :- e_activity("FYN","JNK",dec).
t(0.7,"PTK6","PXN(Y118)")::occ_dec("PXN(Y118)","JNK") :- e_activity("PTK6","JNK",dec).
t(0.7,"PTPRG","PXN(Y118)")::occ_dec("PXN(Y118)","JNK") :- e_activity("PTPRG","JNK",inc).
0.001::occ_inc("PXN(Y118)","JNK").
0.001::occ_inc("PXN(Y118)","JNK").
0.001::occ_inc("PXN(Y118)","JNK").
0.001::occ_inc("PXN(Y118)","JNK").
0.001::occ_inc("PXN(Y118)","JNK").
0.001::occ_inc("PXN(Y118)","JNK").
t(0.7,"SRC","PXN(Y118)")::occ_inc("PXN(Y118)","JNK") :- e_activity("SRC","JNK",inc).
t(0.7,"ABL1","PXN(Y118)")::occ_inc("PXN(Y118)","JNK") :- e_activity("ABL1","JNK",inc).
t(0.7,"PTK2","PXN(Y118)")::occ_inc("PXN(Y118)","JNK") :- e_activity("PTK2","JNK",inc).
t(0.7,"FYN","PXN(Y118)")::occ_inc("PXN(Y118)","JNK") :- e_activity("FYN","JNK",inc).
t(0.7,"PTK6","PXN(Y118)")::occ_inc("PXN(Y118)","JNK") :- e_activity("PTK6","JNK",inc).
t(0.7,"PTPRG","PXN(Y118)")::occ_inc("PXN(Y118)","JNK") :- e_activity("PTPRG","JNK",dec).
t(1.0,"PXN(Y118)")::p_occupancy("PXN(Y118)","JNK",dec); t(0.0,"PXN(Y118)")::p_occupancy("PXN(Y118)","JNK",inc) :- occ_dec("PXN(Y118)","JNK"), \+occ_inc("PXN(Y118)","JNK").
t(0.0,"PXN(Y118)")::p_occupancy("PXN(Y118)","JNK",dec); t(1.0,"PXN(Y118)")::p_occupancy("PXN(Y118)","JNK",inc) :- \+occ_dec("PXN(Y118)","JNK"), occ_inc("PXN(Y118)","JNK").
t(0.5,"PXN(Y118)")::p_occupancy("PXN(Y118)","JNK",dec); t(0.5,"PXN(Y118)")::p_occupancy("PXN(Y118)","JNK",inc) :- occ_dec("PXN(Y118)","JNK"), occ_inc("PXN(Y118)","JNK").
t(0.0,"PXN(Y118)")::p_occupancy("PXN(Y118)","JNK",dec); t(0.0,"PXN(Y118)")::p_occupancy("PXN(Y118)","JNK",inc) :- \+occ_dec("PXN(Y118)","JNK"), \+occ_inc("PXN(Y118)","JNK").
0.980127664::p_fc("PXN(Y118)","JNK",dec) :- p_occupancy("PXN(Y118)","JNK",dec).
0.001::p_fc("PXN(Y118)","JNK",dec) :- p_occupancy("PXN(Y118)","JNK",inc).
0.009936168::p_fc("PXN(Y118)","JNK",dec).
evidence(e_ksea("SRC","JNK",inc)).
evidence(e_ksea("ABL1","JNK",inc)).
evidence(e_ksea("PTK2","JNK",inc)).
evidence(e_ksea("PTPRG","JNK",dec)).
evidence(e_ksea("FYN","JNK",dec)).
evidence(e_ksea("PTK6","JNK",dec)).
evidence(p_fc("PXN(Y118)","JNK",dec)).
