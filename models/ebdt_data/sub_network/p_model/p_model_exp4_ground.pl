t(0.33,"SRC","Ripasudil")::e_activity("SRC","Ripasudil",inc); t(0.33,"SRC","Ripasudil")::e_activity("SRC","Ripasudil",dec).
t(0.33,"ABL1","Ripasudil")::e_activity("ABL1","Ripasudil",inc); t(0.33,"ABL1","Ripasudil")::e_activity("ABL1","Ripasudil",dec).
t(0.33,"PTK2","Ripasudil")::e_activity("PTK2","Ripasudil",inc); t(0.33,"PTK2","Ripasudil")::e_activity("PTK2","Ripasudil",dec).
t(0.33,"PTPRG","Ripasudil")::e_activity("PTPRG","Ripasudil",dec); t(0.33,"PTPRG","Ripasudil")::e_activity("PTPRG","Ripasudil",inc).
t(0.33,"FYN","Ripasudil")::e_activity("FYN","Ripasudil",inc); t(0.33,"FYN","Ripasudil")::e_activity("FYN","Ripasudil",dec).
t(0.33,"PTK6","Ripasudil")::e_activity("PTK6","Ripasudil",inc); t(0.33,"PTK6","Ripasudil")::e_activity("PTK6","Ripasudil",dec).
0.001::occ_dec("PXN(Y118)","Ripasudil").
0.001::occ_dec("PXN(Y118)","Ripasudil").
0.001::occ_dec("PXN(Y118)","Ripasudil").
0.001::occ_dec("PXN(Y118)","Ripasudil").
0.001::occ_dec("PXN(Y118)","Ripasudil").
0.001::occ_dec("PXN(Y118)","Ripasudil").
t(0.7,"SRC","PXN(Y118)")::occ_dec("PXN(Y118)","Ripasudil") :- e_activity("SRC","Ripasudil",dec).
t(0.7,"ABL1","PXN(Y118)")::occ_dec("PXN(Y118)","Ripasudil") :- e_activity("ABL1","Ripasudil",dec).
t(0.7,"PTK2","PXN(Y118)")::occ_dec("PXN(Y118)","Ripasudil") :- e_activity("PTK2","Ripasudil",dec).
t(0.7,"FYN","PXN(Y118)")::occ_dec("PXN(Y118)","Ripasudil") :- e_activity("FYN","Ripasudil",dec).
t(0.7,"PTK6","PXN(Y118)")::occ_dec("PXN(Y118)","Ripasudil") :- e_activity("PTK6","Ripasudil",dec).
t(0.7,"PTPRG","PXN(Y118)")::occ_dec("PXN(Y118)","Ripasudil") :- e_activity("PTPRG","Ripasudil",inc).
0.001::occ_inc("PXN(Y118)","Ripasudil").
0.001::occ_inc("PXN(Y118)","Ripasudil").
0.001::occ_inc("PXN(Y118)","Ripasudil").
0.001::occ_inc("PXN(Y118)","Ripasudil").
0.001::occ_inc("PXN(Y118)","Ripasudil").
0.001::occ_inc("PXN(Y118)","Ripasudil").
t(0.7,"SRC","PXN(Y118)")::occ_inc("PXN(Y118)","Ripasudil") :- e_activity("SRC","Ripasudil",inc).
t(0.7,"ABL1","PXN(Y118)")::occ_inc("PXN(Y118)","Ripasudil") :- e_activity("ABL1","Ripasudil",inc).
t(0.7,"PTK2","PXN(Y118)")::occ_inc("PXN(Y118)","Ripasudil") :- e_activity("PTK2","Ripasudil",inc).
t(0.7,"FYN","PXN(Y118)")::occ_inc("PXN(Y118)","Ripasudil") :- e_activity("FYN","Ripasudil",inc).
t(0.7,"PTK6","PXN(Y118)")::occ_inc("PXN(Y118)","Ripasudil") :- e_activity("PTK6","Ripasudil",inc).
t(0.7,"PTPRG","PXN(Y118)")::occ_inc("PXN(Y118)","Ripasudil") :- e_activity("PTPRG","Ripasudil",dec).
t(0.0)::p_occupancy("PXN(Y118)","Ripasudil",inc) :- occ_dec("PXN(Y118)","Ripasudil"), \+occ_inc("PXN(Y118)","Ripasudil").
t(1.0)::p_occupancy("PXN(Y118)","Ripasudil",inc) :- \+occ_dec("PXN(Y118)","Ripasudil"), occ_inc("PXN(Y118)","Ripasudil").
t(0.5)::p_occupancy("PXN(Y118)","Ripasudil",inc) :- occ_dec("PXN(Y118)","Ripasudil"), occ_inc("PXN(Y118)","Ripasudil").
t(0.0)::p_occupancy("PXN(Y118)","Ripasudil",inc) :- \+occ_dec("PXN(Y118)","Ripasudil"), \+occ_inc("PXN(Y118)","Ripasudil").
evidence(e_activity("SRC","Ripasudil",inc)).
evidence(e_activity("ABL1","Ripasudil",inc)).
evidence(e_activity("PTK2","Ripasudil",inc)).
evidence(e_activity("PTPRG","Ripasudil",dec)).
evidence(e_activity("FYN","Ripasudil",inc)).
evidence(e_activity("PTK6","Ripasudil",inc)).
evidence(p_occupancy("PXN(Y118)","Ripasudil",inc)).
