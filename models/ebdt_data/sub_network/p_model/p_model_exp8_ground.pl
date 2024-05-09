t(0.33,"SRC","Edelfosine")::e_activity("SRC","Edelfosine",inc); t(0.33,"SRC","Edelfosine")::e_activity("SRC","Edelfosine",dec).
t(0.33,"ABL1","Edelfosine")::e_activity("ABL1","Edelfosine",inc); t(0.33,"ABL1","Edelfosine")::e_activity("ABL1","Edelfosine",dec).
t(0.33,"PTK2","Edelfosine")::e_activity("PTK2","Edelfosine",dec); t(0.33,"PTK2","Edelfosine")::e_activity("PTK2","Edelfosine",inc).
t(0.33,"PTPRG","Edelfosine")::e_activity("PTPRG","Edelfosine",dec); t(0.33,"PTPRG","Edelfosine")::e_activity("PTPRG","Edelfosine",inc).
t(0.33,"FYN","Edelfosine")::e_activity("FYN","Edelfosine",dec); t(0.33,"FYN","Edelfosine")::e_activity("FYN","Edelfosine",inc).
t(0.33,"PTK6","Edelfosine")::e_activity("PTK6","Edelfosine",inc); t(0.33,"PTK6","Edelfosine")::e_activity("PTK6","Edelfosine",dec).
t(0.5,"SRC","PXN(Y118)")::targets("SRC","PXN(Y118)").
t(0.5,"ABL1","PXN(Y118)")::targets("ABL1","PXN(Y118)").
t(0.5,"PTK2","PXN(Y118)")::targets("PTK2","PXN(Y118)").
t(0.5,"PTPRG","PXN(Y118)")::targets("PTPRG","PXN(Y118)").
t(0.5,"FYN","PXN(Y118)")::targets("FYN","PXN(Y118)").
t(0.5,"PTK6","PXN(Y118)")::targets("PTK6","PXN(Y118)").
0.001::occ_dec("PXN(Y118)","Edelfosine") :- targets("SRC","PXN(Y118)").
0.001::occ_dec("PXN(Y118)","Edelfosine") :- targets("ABL1","PXN(Y118)").
0.001::occ_dec("PXN(Y118)","Edelfosine") :- targets("PTK2","PXN(Y118)").
0.001::occ_dec("PXN(Y118)","Edelfosine") :- targets("PTPRG","PXN(Y118)").
0.001::occ_dec("PXN(Y118)","Edelfosine") :- targets("FYN","PXN(Y118)").
0.001::occ_dec("PXN(Y118)","Edelfosine") :- targets("PTK6","PXN(Y118)").
t(0.7,"SRC","PXN(Y118)")::occ_dec("PXN(Y118)","Edelfosine") :- targets("SRC","PXN(Y118)"), e_activity("SRC","Edelfosine",dec).
t(0.7,"ABL1","PXN(Y118)")::occ_dec("PXN(Y118)","Edelfosine") :- targets("ABL1","PXN(Y118)"), e_activity("ABL1","Edelfosine",dec).
t(0.7,"PTK2","PXN(Y118)")::occ_dec("PXN(Y118)","Edelfosine") :- targets("PTK2","PXN(Y118)"), e_activity("PTK2","Edelfosine",dec).
t(0.7,"FYN","PXN(Y118)")::occ_dec("PXN(Y118)","Edelfosine") :- targets("FYN","PXN(Y118)"), e_activity("FYN","Edelfosine",dec).
t(0.7,"PTK6","PXN(Y118)")::occ_dec("PXN(Y118)","Edelfosine") :- targets("PTK6","PXN(Y118)"), e_activity("PTK6","Edelfosine",dec).
t(0.7,"PTPRG","PXN(Y118)")::occ_dec("PXN(Y118)","Edelfosine") :- targets("PTPRG","PXN(Y118)"), e_activity("PTPRG","Edelfosine",inc).
0.001::occ_inc("PXN(Y118)","Edelfosine") :- targets("SRC","PXN(Y118)").
0.001::occ_inc("PXN(Y118)","Edelfosine") :- targets("ABL1","PXN(Y118)").
0.001::occ_inc("PXN(Y118)","Edelfosine") :- targets("PTK2","PXN(Y118)").
0.001::occ_inc("PXN(Y118)","Edelfosine") :- targets("PTPRG","PXN(Y118)").
0.001::occ_inc("PXN(Y118)","Edelfosine") :- targets("FYN","PXN(Y118)").
0.001::occ_inc("PXN(Y118)","Edelfosine") :- targets("PTK6","PXN(Y118)").
t(0.7,"SRC","PXN(Y118)")::occ_inc("PXN(Y118)","Edelfosine") :- targets("SRC","PXN(Y118)"), e_activity("SRC","Edelfosine",inc).
t(0.7,"ABL1","PXN(Y118)")::occ_inc("PXN(Y118)","Edelfosine") :- targets("ABL1","PXN(Y118)"), e_activity("ABL1","Edelfosine",inc).
t(0.7,"PTK2","PXN(Y118)")::occ_inc("PXN(Y118)","Edelfosine") :- targets("PTK2","PXN(Y118)"), e_activity("PTK2","Edelfosine",inc).
t(0.7,"FYN","PXN(Y118)")::occ_inc("PXN(Y118)","Edelfosine") :- targets("FYN","PXN(Y118)"), e_activity("FYN","Edelfosine",inc).
t(0.7,"PTK6","PXN(Y118)")::occ_inc("PXN(Y118)","Edelfosine") :- targets("PTK6","PXN(Y118)"), e_activity("PTK6","Edelfosine",inc).
t(0.7,"PTPRG","PXN(Y118)")::occ_inc("PXN(Y118)","Edelfosine") :- targets("PTPRG","PXN(Y118)"), e_activity("PTPRG","Edelfosine",dec).
t(1.0,"PXN(Y118)")::p_occupancy("PXN(Y118)","Edelfosine",dec) :- occ_dec("PXN(Y118)","Edelfosine"), \+occ_inc("PXN(Y118)","Edelfosine").
t(0.0,"PXN(Y118)")::p_occupancy("PXN(Y118)","Edelfosine",dec) :- \+occ_dec("PXN(Y118)","Edelfosine"), occ_inc("PXN(Y118)","Edelfosine").
t(0.5,"PXN(Y118)")::p_occupancy("PXN(Y118)","Edelfosine",dec) :- occ_dec("PXN(Y118)","Edelfosine"), occ_inc("PXN(Y118)","Edelfosine").
t(0.0,"PXN(Y118)")::p_occupancy("PXN(Y118)","Edelfosine",dec) :- \+occ_dec("PXN(Y118)","Edelfosine"), \+occ_inc("PXN(Y118)","Edelfosine").
evidence(e_activity("SRC","Edelfosine",inc)).
evidence(e_activity("ABL1","Edelfosine",inc)).
evidence(e_activity("PTK2","Edelfosine",dec)).
evidence(e_activity("PTPRG","Edelfosine",dec)).
evidence(e_activity("FYN","Edelfosine",dec)).
evidence(e_activity("PTK6","Edelfosine",inc)).
evidence(p_occupancy("PXN(Y118)","Edelfosine",dec)).
