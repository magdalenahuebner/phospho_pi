0.001::occ_dec("ABI1(Y213)","CHIR99021").
0.001::occ_dec("ABI1(Y213)","CHIR99021").
0.001::act_dec("ABL1","CHIR99021").
0.001::act_dec("ABL1","CHIR99021").
0.001::act_dec("ABL1","CHIR99021").
0.001::act_dec("ABL1","CHIR99021").
0.001::occ_dec("ABL1(S569)","CHIR99021").
0.001::occ_inc("ABL1(S569)","CHIR99021").
t(1.0,"ABL1(S569)")::p_occupancy("ABL1(S569)","CHIR99021",dec); t(0.0,"ABL1(S569)")::p_occupancy("ABL1(S569)","CHIR99021",inc) :- occ_dec("ABL1(S569)","CHIR99021"), \+occ_inc("ABL1(S569)","CHIR99021").
t(0.0,"ABL1(S569)")::p_occupancy("ABL1(S569)","CHIR99021",dec); t(1.0,"ABL1(S569)")::p_occupancy("ABL1(S569)","CHIR99021",inc) :- \+occ_dec("ABL1(S569)","CHIR99021"), occ_inc("ABL1(S569)","CHIR99021").
t(0.5,"ABL1(S569)")::p_occupancy("ABL1(S569)","CHIR99021",dec); t(0.5,"ABL1(S569)")::p_occupancy("ABL1(S569)","CHIR99021",inc) :- occ_dec("ABL1(S569)","CHIR99021"), occ_inc("ABL1(S569)","CHIR99021").
t(0.0,"ABL1(S569)")::p_occupancy("ABL1(S569)","CHIR99021",dec); t(0.0,"ABL1(S569)")::p_occupancy("ABL1(S569)","CHIR99021",inc) :- \+occ_dec("ABL1(S569)","CHIR99021"), \+occ_inc("ABL1(S569)","CHIR99021").
t(0.33)::p_function("ABL1(S718)",p_inc); t(0.33)::p_function("ABL1(S718)",p_dec).
0.001::occ_dec("ABL1(S718)","CHIR99021").
0.001::occ_inc("ABL1(S718)","CHIR99021").
t(1.0,"ABL1(S718)")::p_occupancy("ABL1(S718)","CHIR99021",dec); t(0.0,"ABL1(S718)")::p_occupancy("ABL1(S718)","CHIR99021",inc) :- occ_dec("ABL1(S718)","CHIR99021"), \+occ_inc("ABL1(S718)","CHIR99021").
t(0.0,"ABL1(S718)")::p_occupancy("ABL1(S718)","CHIR99021",dec); t(1.0,"ABL1(S718)")::p_occupancy("ABL1(S718)","CHIR99021",inc) :- \+occ_dec("ABL1(S718)","CHIR99021"), occ_inc("ABL1(S718)","CHIR99021").
t(0.5,"ABL1(S718)")::p_occupancy("ABL1(S718)","CHIR99021",dec); t(0.5,"ABL1(S718)")::p_occupancy("ABL1(S718)","CHIR99021",inc) :- occ_dec("ABL1(S718)","CHIR99021"), occ_inc("ABL1(S718)","CHIR99021").
t(0.0,"ABL1(S718)")::p_occupancy("ABL1(S718)","CHIR99021",dec); t(0.0,"ABL1(S718)")::p_occupancy("ABL1(S718)","CHIR99021",inc) :- \+occ_dec("ABL1(S718)","CHIR99021"), \+occ_inc("ABL1(S718)","CHIR99021").
t(0.7,"ABL1(S569)","ABL1")::act_dec("ABL1","CHIR99021") :- p_occupancy("ABL1(S569)","CHIR99021",dec).
t(0.7,"ABL1(S718)","ABL1")::act_dec("ABL1","CHIR99021") :- p_function("ABL1(S718)",p_inc), p_occupancy("ABL1(S718)","CHIR99021",dec).
0.001::occ_dec("ABL1(T735)","CHIR99021").
0.001::occ_inc("ABL1(T735)","CHIR99021").
t(0.0,"ABL1(T735)")::p_occupancy("ABL1(T735)","CHIR99021",inc); t(1.0,"ABL1(T735)")::p_occupancy("ABL1(T735)","CHIR99021",dec) :- occ_dec("ABL1(T735)","CHIR99021"), \+occ_inc("ABL1(T735)","CHIR99021").
t(1.0,"ABL1(T735)")::p_occupancy("ABL1(T735)","CHIR99021",inc); t(0.0,"ABL1(T735)")::p_occupancy("ABL1(T735)","CHIR99021",dec) :- \+occ_dec("ABL1(T735)","CHIR99021"), occ_inc("ABL1(T735)","CHIR99021").
t(0.5,"ABL1(T735)")::p_occupancy("ABL1(T735)","CHIR99021",inc); t(0.5,"ABL1(T735)")::p_occupancy("ABL1(T735)","CHIR99021",dec) :- occ_dec("ABL1(T735)","CHIR99021"), occ_inc("ABL1(T735)","CHIR99021").
t(0.0,"ABL1(T735)")::p_occupancy("ABL1(T735)","CHIR99021",inc); t(0.0,"ABL1(T735)")::p_occupancy("ABL1(T735)","CHIR99021",dec) :- \+occ_dec("ABL1(T735)","CHIR99021"), \+occ_inc("ABL1(T735)","CHIR99021").
t(0.7,"ABL1(S718)","ABL1")::act_dec("ABL1","CHIR99021") :- p_function("ABL1(S718)",p_dec), p_occupancy("ABL1(S718)","CHIR99021",inc).
t(0.7,"ABL1(T735)","ABL1")::act_dec("ABL1","CHIR99021") :- p_occupancy("ABL1(T735)","CHIR99021",inc).
0.001::act_inc("ABL1","CHIR99021").
0.001::act_inc("ABL1","CHIR99021").
0.001::act_inc("ABL1","CHIR99021").
0.001::act_inc("ABL1","CHIR99021").
t(0.7,"ABL1(S569)","ABL1")::act_inc("ABL1","CHIR99021") :- p_occupancy("ABL1(S569)","CHIR99021",inc).
t(0.7,"ABL1(S718)","ABL1")::act_inc("ABL1","CHIR99021") :- p_function("ABL1(S718)",p_inc), p_occupancy("ABL1(S718)","CHIR99021",inc).
t(0.7,"ABL1(S718)","ABL1")::act_inc("ABL1","CHIR99021") :- p_function("ABL1(S718)",p_dec), p_occupancy("ABL1(S718)","CHIR99021",dec).
t(0.7,"ABL1(T735)","ABL1")::act_inc("ABL1","CHIR99021") :- p_occupancy("ABL1(T735)","CHIR99021",dec).
t(1.0,"ABL1")::e_activity("ABL1","CHIR99021",dec); t(0.0,"ABL1")::e_activity("ABL1","CHIR99021",inc) :- act_dec("ABL1","CHIR99021"), \+act_inc("ABL1","CHIR99021").
t(0.0,"ABL1")::e_activity("ABL1","CHIR99021",dec); t(1.0,"ABL1")::e_activity("ABL1","CHIR99021",inc) :- \+act_dec("ABL1","CHIR99021"), act_inc("ABL1","CHIR99021").
t(0.5,"ABL1")::e_activity("ABL1","CHIR99021",dec); t(0.5,"ABL1")::e_activity("ABL1","CHIR99021",inc) :- act_dec("ABL1","CHIR99021"), act_inc("ABL1","CHIR99021").
t(0.0,"ABL1")::e_activity("ABL1","CHIR99021",dec); t(0.0,"ABL1")::e_activity("ABL1","CHIR99021",inc) :- \+act_dec("ABL1","CHIR99021"), \+act_inc("ABL1","CHIR99021").
t(0.7,"ABL1","ABI1(Y213)")::occ_dec("ABI1(Y213)","CHIR99021") :- e_activity("ABL1","CHIR99021",dec).
0.001::occ_inc("ABI1(Y213)","CHIR99021").
0.001::occ_inc("ABI1(Y213)","CHIR99021").
t(0.7,"ABL1","ABI1(Y213)")::occ_inc("ABI1(Y213)","CHIR99021") :- e_activity("ABL1","CHIR99021",inc).
t(1.0,"ABI1(Y213)")::p_occupancy("ABI1(Y213)","CHIR99021",dec); t(0.0,"ABI1(Y213)")::p_occupancy("ABI1(Y213)","CHIR99021",inc) :- occ_dec("ABI1(Y213)","CHIR99021"), \+occ_inc("ABI1(Y213)","CHIR99021").
t(0.0,"ABI1(Y213)")::p_occupancy("ABI1(Y213)","CHIR99021",dec); t(1.0,"ABI1(Y213)")::p_occupancy("ABI1(Y213)","CHIR99021",inc) :- \+occ_dec("ABI1(Y213)","CHIR99021"), occ_inc("ABI1(Y213)","CHIR99021").
t(0.5,"ABI1(Y213)")::p_occupancy("ABI1(Y213)","CHIR99021",dec); t(0.5,"ABI1(Y213)")::p_occupancy("ABI1(Y213)","CHIR99021",inc) :- occ_dec("ABI1(Y213)","CHIR99021"), occ_inc("ABI1(Y213)","CHIR99021").
t(0.0,"ABI1(Y213)")::p_occupancy("ABI1(Y213)","CHIR99021",dec); t(0.0,"ABI1(Y213)")::p_occupancy("ABI1(Y213)","CHIR99021",inc) :- \+occ_dec("ABI1(Y213)","CHIR99021"), \+occ_inc("ABI1(Y213)","CHIR99021").
0.001::p_fc("ABI1(Y213)","CHIR99021",inc) :- p_occupancy("ABI1(Y213)","CHIR99021",dec).
0.019392136::p_fc("ABI1(Y213)","CHIR99021",inc) :- p_occupancy("ABI1(Y213)","CHIR99021",inc).
0.490303932::p_fc("ABI1(Y213)","CHIR99021",inc).
0.7836236651::e_ksea("ABL1","CHIR99021",dec) :- e_activity("ABL1","CHIR99021",dec).
0.001::e_ksea("ABL1","CHIR99021",dec) :- e_activity("ABL1","CHIR99021",inc).
0.1081881675::e_ksea("ABL1","CHIR99021",dec).
evidence(p_fc("ABI1(Y213)","CHIR99021",inc)).
evidence(e_ksea("ABL1","CHIR99021",dec)).
