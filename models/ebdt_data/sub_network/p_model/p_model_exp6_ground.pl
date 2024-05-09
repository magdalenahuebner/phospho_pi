t(0.33,"SRC","LY2090314")::e_activity("SRC","LY2090314",dec); t(0.33,"SRC","LY2090314")::e_activity("SRC","LY2090314",inc).
0.001::e_ksea("SRC","LY2090314",inc) :- e_activity("SRC","LY2090314",dec).
0.6709186491::e_ksea("SRC","LY2090314",inc) :- e_activity("SRC","LY2090314",inc).
0.1645406755::e_ksea("SRC","LY2090314",inc).
t(0.33,"ABL1","LY2090314")::e_activity("ABL1","LY2090314",dec); t(0.33,"ABL1","LY2090314")::e_activity("ABL1","LY2090314",inc).
0.001::e_ksea("ABL1","LY2090314",inc) :- e_activity("ABL1","LY2090314",dec).
0.5540528903::e_ksea("ABL1","LY2090314",inc) :- e_activity("ABL1","LY2090314",inc).
0.2229735548::e_ksea("ABL1","LY2090314",inc).
t(0.33,"PTK2","LY2090314")::e_activity("PTK2","LY2090314",dec); t(0.33,"PTK2","LY2090314")::e_activity("PTK2","LY2090314",inc).
0.001::e_ksea("PTK2","LY2090314",inc) :- e_activity("PTK2","LY2090314",dec).
0.9620738919::e_ksea("PTK2","LY2090314",inc) :- e_activity("PTK2","LY2090314",inc).
0.0189630541::e_ksea("PTK2","LY2090314",inc).
t(0.33,"PTPRG","LY2090314")::e_activity("PTPRG","LY2090314",dec); t(0.33,"PTPRG","LY2090314")::e_activity("PTPRG","LY2090314",inc).
0.001::e_ksea("PTPRG","LY2090314",inc) :- e_activity("PTPRG","LY2090314",dec).
0.6402661356::e_ksea("PTPRG","LY2090314",inc) :- e_activity("PTPRG","LY2090314",inc).
0.1798669322::e_ksea("PTPRG","LY2090314",inc).
t(0.33,"FYN","LY2090314")::e_activity("FYN","LY2090314",dec); t(0.33,"FYN","LY2090314")::e_activity("FYN","LY2090314",inc).
0.5767079072::e_ksea("FYN","LY2090314",dec) :- e_activity("FYN","LY2090314",dec).
0.001::e_ksea("FYN","LY2090314",dec) :- e_activity("FYN","LY2090314",inc).
0.2116460464::e_ksea("FYN","LY2090314",dec).
t(0.33,"PTK6","LY2090314")::e_activity("PTK6","LY2090314",dec); t(0.33,"PTK6","LY2090314")::e_activity("PTK6","LY2090314",inc).
0.8740505289::e_ksea("PTK6","LY2090314",dec) :- e_activity("PTK6","LY2090314",dec).
0.001::e_ksea("PTK6","LY2090314",dec) :- e_activity("PTK6","LY2090314",inc).
0.0629747356::e_ksea("PTK6","LY2090314",dec).
t(0.5,"SRC","PXN(Y118)")::targets("SRC","PXN(Y118)").
t(0.5,"ABL1","PXN(Y118)")::targets("ABL1","PXN(Y118)").
t(0.5,"PTK2","PXN(Y118)")::targets("PTK2","PXN(Y118)").
t(0.5,"PTPRG","PXN(Y118)")::targets("PTPRG","PXN(Y118)").
t(0.5,"FYN","PXN(Y118)")::targets("FYN","PXN(Y118)").
t(0.5,"PTK6","PXN(Y118)")::targets("PTK6","PXN(Y118)").
0.001::occ_dec("PXN(Y118)","LY2090314") :- targets("SRC","PXN(Y118)").
0.001::occ_dec("PXN(Y118)","LY2090314") :- targets("ABL1","PXN(Y118)").
0.001::occ_dec("PXN(Y118)","LY2090314") :- targets("PTK2","PXN(Y118)").
0.001::occ_dec("PXN(Y118)","LY2090314") :- targets("PTPRG","PXN(Y118)").
0.001::occ_dec("PXN(Y118)","LY2090314") :- targets("FYN","PXN(Y118)").
0.001::occ_dec("PXN(Y118)","LY2090314") :- targets("PTK6","PXN(Y118)").
t(0.7,"SRC","PXN(Y118)")::occ_dec("PXN(Y118)","LY2090314") :- targets("SRC","PXN(Y118)"), e_activity("SRC","LY2090314",dec).
t(0.7,"ABL1","PXN(Y118)")::occ_dec("PXN(Y118)","LY2090314") :- targets("ABL1","PXN(Y118)"), e_activity("ABL1","LY2090314",dec).
t(0.7,"PTK2","PXN(Y118)")::occ_dec("PXN(Y118)","LY2090314") :- targets("PTK2","PXN(Y118)"), e_activity("PTK2","LY2090314",dec).
t(0.7,"FYN","PXN(Y118)")::occ_dec("PXN(Y118)","LY2090314") :- targets("FYN","PXN(Y118)"), e_activity("FYN","LY2090314",dec).
t(0.7,"PTK6","PXN(Y118)")::occ_dec("PXN(Y118)","LY2090314") :- targets("PTK6","PXN(Y118)"), e_activity("PTK6","LY2090314",dec).
t(0.7,"PTPRG","PXN(Y118)")::occ_dec("PXN(Y118)","LY2090314") :- targets("PTPRG","PXN(Y118)"), e_activity("PTPRG","LY2090314",inc).
0.001::occ_inc("PXN(Y118)","LY2090314") :- targets("SRC","PXN(Y118)").
0.001::occ_inc("PXN(Y118)","LY2090314") :- targets("ABL1","PXN(Y118)").
0.001::occ_inc("PXN(Y118)","LY2090314") :- targets("PTK2","PXN(Y118)").
0.001::occ_inc("PXN(Y118)","LY2090314") :- targets("PTPRG","PXN(Y118)").
0.001::occ_inc("PXN(Y118)","LY2090314") :- targets("FYN","PXN(Y118)").
0.001::occ_inc("PXN(Y118)","LY2090314") :- targets("PTK6","PXN(Y118)").
t(0.7,"SRC","PXN(Y118)")::occ_inc("PXN(Y118)","LY2090314") :- targets("SRC","PXN(Y118)"), e_activity("SRC","LY2090314",inc).
t(0.7,"ABL1","PXN(Y118)")::occ_inc("PXN(Y118)","LY2090314") :- targets("ABL1","PXN(Y118)"), e_activity("ABL1","LY2090314",inc).
t(0.7,"PTK2","PXN(Y118)")::occ_inc("PXN(Y118)","LY2090314") :- targets("PTK2","PXN(Y118)"), e_activity("PTK2","LY2090314",inc).
t(0.7,"FYN","PXN(Y118)")::occ_inc("PXN(Y118)","LY2090314") :- targets("FYN","PXN(Y118)"), e_activity("FYN","LY2090314",inc).
t(0.7,"PTK6","PXN(Y118)")::occ_inc("PXN(Y118)","LY2090314") :- targets("PTK6","PXN(Y118)"), e_activity("PTK6","LY2090314",inc).
t(0.7,"PTPRG","PXN(Y118)")::occ_inc("PXN(Y118)","LY2090314") :- targets("PTPRG","PXN(Y118)"), e_activity("PTPRG","LY2090314",dec).
t(1.0,"PXN(Y118)")::p_occupancy("PXN(Y118)","LY2090314",dec); t(0.0,"PXN(Y118)")::p_occupancy("PXN(Y118)","LY2090314",inc) :- occ_dec("PXN(Y118)","LY2090314"), \+occ_inc("PXN(Y118)","LY2090314").
t(0.0,"PXN(Y118)")::p_occupancy("PXN(Y118)","LY2090314",dec); t(1.0,"PXN(Y118)")::p_occupancy("PXN(Y118)","LY2090314",inc) :- \+occ_dec("PXN(Y118)","LY2090314"), occ_inc("PXN(Y118)","LY2090314").
t(0.5,"PXN(Y118)")::p_occupancy("PXN(Y118)","LY2090314",dec); t(0.5,"PXN(Y118)")::p_occupancy("PXN(Y118)","LY2090314",inc) :- occ_dec("PXN(Y118)","LY2090314"), occ_inc("PXN(Y118)","LY2090314").
t(0.0,"PXN(Y118)")::p_occupancy("PXN(Y118)","LY2090314",dec); t(0.0,"PXN(Y118)")::p_occupancy("PXN(Y118)","LY2090314",inc) :- \+occ_dec("PXN(Y118)","LY2090314"), \+occ_inc("PXN(Y118)","LY2090314").
0.6113088407::p_fc("PXN(Y118)","LY2090314",dec) :- p_occupancy("PXN(Y118)","LY2090314",dec).
0.001::p_fc("PXN(Y118)","LY2090314",dec) :- p_occupancy("PXN(Y118)","LY2090314",inc).
0.1943455796::p_fc("PXN(Y118)","LY2090314",dec).
evidence(e_ksea("SRC","LY2090314",inc)).
evidence(e_ksea("ABL1","LY2090314",inc)).
evidence(e_ksea("PTK2","LY2090314",inc)).
evidence(e_ksea("PTPRG","LY2090314",inc)).
evidence(e_ksea("FYN","LY2090314",dec)).
evidence(e_ksea("PTK6","LY2090314",dec)).
evidence(p_fc("PXN(Y118)","LY2090314",dec)).
