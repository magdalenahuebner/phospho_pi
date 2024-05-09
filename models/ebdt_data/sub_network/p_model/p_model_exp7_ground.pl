t(0.33,"SRC","GF109203X")::e_activity("SRC","GF109203X",dec); t(0.33,"SRC","GF109203X")::e_activity("SRC","GF109203X",inc).
0.001::e_ksea("SRC","GF109203X",inc) :- e_activity("SRC","GF109203X",dec).
0.9905363566::e_ksea("SRC","GF109203X",inc) :- e_activity("SRC","GF109203X",inc).
0.0047318217::e_ksea("SRC","GF109203X",inc).
t(0.33,"ABL1","GF109203X")::e_activity("ABL1","GF109203X",dec); t(0.33,"ABL1","GF109203X")::e_activity("ABL1","GF109203X",inc).
0.6405069878::e_ksea("ABL1","GF109203X",dec) :- e_activity("ABL1","GF109203X",dec).
0.001::e_ksea("ABL1","GF109203X",dec) :- e_activity("ABL1","GF109203X",inc).
0.1797465061::e_ksea("ABL1","GF109203X",dec).
t(0.33,"PTK2","GF109203X")::e_activity("PTK2","GF109203X",dec); t(0.33,"PTK2","GF109203X")::e_activity("PTK2","GF109203X",inc).
0.7591955001::e_ksea("PTK2","GF109203X",dec) :- e_activity("PTK2","GF109203X",dec).
0.001::e_ksea("PTK2","GF109203X",dec) :- e_activity("PTK2","GF109203X",inc).
0.12040225::e_ksea("PTK2","GF109203X",dec).
t(0.33,"PTPRG","GF109203X")::e_activity("PTPRG","GF109203X",dec); t(0.33,"PTPRG","GF109203X")::e_activity("PTPRG","GF109203X",inc).
0.5200331871::e_ksea("PTPRG","GF109203X",dec) :- e_activity("PTPRG","GF109203X",dec).
0.001::e_ksea("PTPRG","GF109203X",dec) :- e_activity("PTPRG","GF109203X",inc).
0.2399834065::e_ksea("PTPRG","GF109203X",dec).
t(0.33,"FYN","GF109203X")::e_activity("FYN","GF109203X",dec); t(0.33,"FYN","GF109203X")::e_activity("FYN","GF109203X",inc).
0.001::e_ksea("FYN","GF109203X",inc) :- e_activity("FYN","GF109203X",dec).
0.5501064202::e_ksea("FYN","GF109203X",inc) :- e_activity("FYN","GF109203X",inc).
0.2249467899::e_ksea("FYN","GF109203X",inc).
t(0.33,"PTK6","GF109203X")::e_activity("PTK6","GF109203X",dec); t(0.33,"PTK6","GF109203X")::e_activity("PTK6","GF109203X",inc).
0.859444263::e_ksea("PTK6","GF109203X",dec) :- e_activity("PTK6","GF109203X",dec).
0.001::e_ksea("PTK6","GF109203X",dec) :- e_activity("PTK6","GF109203X",inc).
0.0702778685::e_ksea("PTK6","GF109203X",dec).
t(0.9,"SRC","PXN(Y118)")::targets("SRC","PXN(Y118)").
t(0.9,"ABL1","PXN(Y118)")::targets("ABL1","PXN(Y118)").
t(0.9,"PTK2","PXN(Y118)")::targets("PTK2","PXN(Y118)").
t(0.9,"PTPRG","PXN(Y118)")::targets("PTPRG","PXN(Y118)").
t(0.9,"FYN","PXN(Y118)")::targets("FYN","PXN(Y118)").
t(0.9,"PTK6","PXN(Y118)")::targets("PTK6","PXN(Y118)").
0.001::occ_dec("PXN(Y118)","GF109203X") :- targets("SRC","PXN(Y118)").
0.001::occ_dec("PXN(Y118)","GF109203X") :- targets("ABL1","PXN(Y118)").
0.001::occ_dec("PXN(Y118)","GF109203X") :- targets("PTK2","PXN(Y118)").
0.001::occ_dec("PXN(Y118)","GF109203X") :- targets("PTPRG","PXN(Y118)").
0.001::occ_dec("PXN(Y118)","GF109203X") :- targets("FYN","PXN(Y118)").
0.001::occ_dec("PXN(Y118)","GF109203X") :- targets("PTK6","PXN(Y118)").
t(0.7,"SRC","PXN(Y118)")::occ_dec("PXN(Y118)","GF109203X") :- targets("SRC","PXN(Y118)"), e_activity("SRC","GF109203X",dec).
t(0.7,"ABL1","PXN(Y118)")::occ_dec("PXN(Y118)","GF109203X") :- targets("ABL1","PXN(Y118)"), e_activity("ABL1","GF109203X",dec).
t(0.7,"PTK2","PXN(Y118)")::occ_dec("PXN(Y118)","GF109203X") :- targets("PTK2","PXN(Y118)"), e_activity("PTK2","GF109203X",dec).
t(0.7,"FYN","PXN(Y118)")::occ_dec("PXN(Y118)","GF109203X") :- targets("FYN","PXN(Y118)"), e_activity("FYN","GF109203X",dec).
t(0.7,"PTK6","PXN(Y118)")::occ_dec("PXN(Y118)","GF109203X") :- targets("PTK6","PXN(Y118)"), e_activity("PTK6","GF109203X",dec).
t(0.7,"PTPRG","PXN(Y118)")::occ_dec("PXN(Y118)","GF109203X") :- targets("PTPRG","PXN(Y118)"), e_activity("PTPRG","GF109203X",inc).
0.001::occ_inc("PXN(Y118)","GF109203X") :- targets("SRC","PXN(Y118)").
0.001::occ_inc("PXN(Y118)","GF109203X") :- targets("ABL1","PXN(Y118)").
0.001::occ_inc("PXN(Y118)","GF109203X") :- targets("PTK2","PXN(Y118)").
0.001::occ_inc("PXN(Y118)","GF109203X") :- targets("PTPRG","PXN(Y118)").
0.001::occ_inc("PXN(Y118)","GF109203X") :- targets("FYN","PXN(Y118)").
0.001::occ_inc("PXN(Y118)","GF109203X") :- targets("PTK6","PXN(Y118)").
t(0.7,"SRC","PXN(Y118)")::occ_inc("PXN(Y118)","GF109203X") :- targets("SRC","PXN(Y118)"), e_activity("SRC","GF109203X",inc).
t(0.7,"ABL1","PXN(Y118)")::occ_inc("PXN(Y118)","GF109203X") :- targets("ABL1","PXN(Y118)"), e_activity("ABL1","GF109203X",inc).
t(0.7,"PTK2","PXN(Y118)")::occ_inc("PXN(Y118)","GF109203X") :- targets("PTK2","PXN(Y118)"), e_activity("PTK2","GF109203X",inc).
t(0.7,"FYN","PXN(Y118)")::occ_inc("PXN(Y118)","GF109203X") :- targets("FYN","PXN(Y118)"), e_activity("FYN","GF109203X",inc).
t(0.7,"PTK6","PXN(Y118)")::occ_inc("PXN(Y118)","GF109203X") :- targets("PTK6","PXN(Y118)"), e_activity("PTK6","GF109203X",inc).
t(0.7,"PTPRG","PXN(Y118)")::occ_inc("PXN(Y118)","GF109203X") :- targets("PTPRG","PXN(Y118)"), e_activity("PTPRG","GF109203X",dec).
t(1.0,"PXN(Y118)")::p_occupancy("PXN(Y118)","GF109203X",dec); t(0.0,"PXN(Y118)")::p_occupancy("PXN(Y118)","GF109203X",inc) :- occ_dec("PXN(Y118)","GF109203X"), \+occ_inc("PXN(Y118)","GF109203X").
t(0.0,"PXN(Y118)")::p_occupancy("PXN(Y118)","GF109203X",dec); t(1.0,"PXN(Y118)")::p_occupancy("PXN(Y118)","GF109203X",inc) :- \+occ_dec("PXN(Y118)","GF109203X"), occ_inc("PXN(Y118)","GF109203X").
t(0.5,"PXN(Y118)")::p_occupancy("PXN(Y118)","GF109203X",dec); t(0.5,"PXN(Y118)")::p_occupancy("PXN(Y118)","GF109203X",inc) :- occ_dec("PXN(Y118)","GF109203X"), occ_inc("PXN(Y118)","GF109203X").
t(0.0,"PXN(Y118)")::p_occupancy("PXN(Y118)","GF109203X",dec); t(0.0,"PXN(Y118)")::p_occupancy("PXN(Y118)","GF109203X",inc) :- \+occ_dec("PXN(Y118)","GF109203X"), \+occ_inc("PXN(Y118)","GF109203X").
0.7685500338::p_fc("PXN(Y118)","GF109203X",dec) :- p_occupancy("PXN(Y118)","GF109203X",dec).
0.001::p_fc("PXN(Y118)","GF109203X",dec) :- p_occupancy("PXN(Y118)","GF109203X",inc).
0.1157249831::p_fc("PXN(Y118)","GF109203X",dec).
evidence(e_ksea("SRC","GF109203X",inc)).
evidence(e_ksea("ABL1","GF109203X",dec)).
evidence(e_ksea("PTK2","GF109203X",dec)).
evidence(e_ksea("PTPRG","GF109203X",dec)).
evidence(e_ksea("FYN","GF109203X",inc)).
evidence(e_ksea("PTK6","GF109203X",dec)).
evidence(p_fc("PXN(Y118)","GF109203X",dec)).
