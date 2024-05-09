t(0.33,"ABL1","Edelfosine")::e_activity("ABL1","Edelfosine",dec); t(0.33,"ABL1","Edelfosine")::e_activity("ABL1","Edelfosine",inc).
0.001::e_ksea("ABL1","Edelfosine",inc) :- e_activity("ABL1","Edelfosine",dec).
0.5124778531::e_ksea("ABL1","Edelfosine",inc) :- e_activity("ABL1","Edelfosine",inc).
0.2437610734::e_ksea("ABL1","Edelfosine",inc).
t(0.33,"FYN","Edelfosine")::e_activity("FYN","Edelfosine",dec); t(0.33,"FYN","Edelfosine")::e_activity("FYN","Edelfosine",inc).
0.5122767015::e_ksea("FYN","Edelfosine",dec) :- e_activity("FYN","Edelfosine",dec).
0.001::e_ksea("FYN","Edelfosine",dec) :- e_activity("FYN","Edelfosine",inc).
0.2438616492::e_ksea("FYN","Edelfosine",dec).
t(0.33,"HIPK2","Edelfosine")::e_activity("HIPK2","Edelfosine",dec); t(0.33,"HIPK2","Edelfosine")::e_activity("HIPK2","Edelfosine",inc).
0.001::e_ksea("HIPK2","Edelfosine",inc) :- e_activity("HIPK2","Edelfosine",dec).
0.6407120502::e_ksea("HIPK2","Edelfosine",inc) :- e_activity("HIPK2","Edelfosine",inc).
0.1796439749::e_ksea("HIPK2","Edelfosine",inc).
t(0.33,"PTK2","Edelfosine")::e_activity("PTK2","Edelfosine",dec); t(0.33,"PTK2","Edelfosine")::e_activity("PTK2","Edelfosine",inc).
0.641522164::e_ksea("PTK2","Edelfosine",dec) :- e_activity("PTK2","Edelfosine",dec).
0.001::e_ksea("PTK2","Edelfosine",dec) :- e_activity("PTK2","Edelfosine",inc).
0.179238918::e_ksea("PTK2","Edelfosine",dec).
t(0.33,"PTK6","Edelfosine")::e_activity("PTK6","Edelfosine",dec); t(0.33,"PTK6","Edelfosine")::e_activity("PTK6","Edelfosine",inc).
0.001::e_ksea("PTK6","Edelfosine",inc) :- e_activity("PTK6","Edelfosine",dec).
0.6607342474::e_ksea("PTK6","Edelfosine",inc) :- e_activity("PTK6","Edelfosine",inc).
0.1696328763::e_ksea("PTK6","Edelfosine",inc).
t(0.33,"PTPRG","Edelfosine")::e_activity("PTPRG","Edelfosine",dec); t(0.33,"PTPRG","Edelfosine")::e_activity("PTPRG","Edelfosine",inc).
0.5798812746::e_ksea("PTPRG","Edelfosine",dec) :- e_activity("PTPRG","Edelfosine",dec).
0.001::e_ksea("PTPRG","Edelfosine",dec) :- e_activity("PTPRG","Edelfosine",inc).
0.2100593627::e_ksea("PTPRG","Edelfosine",dec).
t(0.33,"PTPRR","Edelfosine")::e_activity("PTPRR","Edelfosine",dec); t(0.33,"PTPRR","Edelfosine")::e_activity("PTPRR","Edelfosine",inc).
0.7232725343::e_ksea("PTPRR","Edelfosine",dec) :- e_activity("PTPRR","Edelfosine",dec).
0.001::e_ksea("PTPRR","Edelfosine",dec) :- e_activity("PTPRR","Edelfosine",inc).
0.1383637329::e_ksea("PTPRR","Edelfosine",dec).
t(0.33,"SRC","Edelfosine")::e_activity("SRC","Edelfosine",dec); t(0.33,"SRC","Edelfosine")::e_activity("SRC","Edelfosine",inc).
0.001::e_ksea("SRC","Edelfosine",inc) :- e_activity("SRC","Edelfosine",dec).
0.854426962::e_ksea("SRC","Edelfosine",inc) :- e_activity("SRC","Edelfosine",inc).
0.072786519::e_ksea("SRC","Edelfosine",inc).
0.001::occ_dec("HIPK2(Y361)","Edelfosine").
0.001::occ_dec("HIPK2(Y361)","Edelfosine").
t(0.7,"SRC","HIPK2(Y361)")::occ_dec("HIPK2(Y361)","Edelfosine") :- e_activity("SRC","Edelfosine",dec).
t(0.7,"HIPK2","HIPK2(Y361)")::occ_dec("HIPK2(Y361)","Edelfosine") :- e_activity("HIPK2","Edelfosine",dec).
0.001::occ_inc("HIPK2(Y361)","Edelfosine").
0.001::occ_inc("HIPK2(Y361)","Edelfosine").
t(0.7,"SRC","HIPK2(Y361)")::occ_inc("HIPK2(Y361)","Edelfosine") :- e_activity("SRC","Edelfosine",inc).
t(0.7,"HIPK2","HIPK2(Y361)")::occ_inc("HIPK2(Y361)","Edelfosine") :- e_activity("HIPK2","Edelfosine",inc).
t(1.0)::p_occupancy("HIPK2(Y361)","Edelfosine",dec); t(0.0)::p_occupancy("HIPK2(Y361)","Edelfosine",inc) :- occ_dec("HIPK2(Y361)","Edelfosine"), \+occ_inc("HIPK2(Y361)","Edelfosine").
t(0.0)::p_occupancy("HIPK2(Y361)","Edelfosine",dec); t(1.0)::p_occupancy("HIPK2(Y361)","Edelfosine",inc) :- \+occ_dec("HIPK2(Y361)","Edelfosine"), occ_inc("HIPK2(Y361)","Edelfosine").
t(0.5)::p_occupancy("HIPK2(Y361)","Edelfosine",dec); t(0.5)::p_occupancy("HIPK2(Y361)","Edelfosine",inc) :- occ_dec("HIPK2(Y361)","Edelfosine"), occ_inc("HIPK2(Y361)","Edelfosine").
t(0.0)::p_occupancy("HIPK2(Y361)","Edelfosine",dec); t(0.0)::p_occupancy("HIPK2(Y361)","Edelfosine",inc) :- \+occ_dec("HIPK2(Y361)","Edelfosine"), \+occ_inc("HIPK2(Y361)","Edelfosine").
0.001::p_fc("HIPK2(Y361)","Edelfosine",inc) :- p_occupancy("HIPK2(Y361)","Edelfosine",dec).
0.8615654463::p_fc("HIPK2(Y361)","Edelfosine",inc) :- p_occupancy("HIPK2(Y361)","Edelfosine",inc).
0.0692172768::p_fc("HIPK2(Y361)","Edelfosine",inc).
evidence(e_ksea("ABL1","Edelfosine",inc)).
evidence(e_ksea("FYN","Edelfosine",dec)).
evidence(e_ksea("HIPK2","Edelfosine",inc)).
evidence(e_ksea("PTK2","Edelfosine",dec)).
evidence(e_ksea("PTK6","Edelfosine",inc)).
evidence(e_ksea("PTPRG","Edelfosine",dec)).
evidence(e_ksea("PTPRR","Edelfosine",dec)).
evidence(e_ksea("SRC","Edelfosine",inc)).
evidence(p_fc("HIPK2(Y361)","Edelfosine",inc)).
