0.001::occ_dec("ABI1(Y213)","AT13148").
t(0.5,"ABL1","ABI1(Y213)")::targets("ABL1","ABI1(Y213)").
0.001::occ_dec("ABI1(Y213)","AT13148") :- targets("ABL1","ABI1(Y213)").
0.001::act_dec("ABL1","AT13148").
0.001::act_dec("ABL1","AT13148").
0.001::act_dec("ABL1","AT13148").
0.001::act_dec("ABL1","AT13148").
0.001::occ_dec("ABL1(S569)","AT13148").
0.001::occ_inc("ABL1(S569)","AT13148").
t(1.0,"ABL1(S569)")::p_occupancy("ABL1(S569)","AT13148",dec); t(0.0,"ABL1(S569)")::p_occupancy("ABL1(S569)","AT13148",inc) :- occ_dec("ABL1(S569)","AT13148"), \+occ_inc("ABL1(S569)","AT13148").
t(0.0,"ABL1(S569)")::p_occupancy("ABL1(S569)","AT13148",dec); t(1.0,"ABL1(S569)")::p_occupancy("ABL1(S569)","AT13148",inc) :- \+occ_dec("ABL1(S569)","AT13148"), occ_inc("ABL1(S569)","AT13148").
t(0.5,"ABL1(S569)")::p_occupancy("ABL1(S569)","AT13148",dec); t(0.5,"ABL1(S569)")::p_occupancy("ABL1(S569)","AT13148",inc) :- occ_dec("ABL1(S569)","AT13148"), occ_inc("ABL1(S569)","AT13148").
t(0.0,"ABL1(S569)")::p_occupancy("ABL1(S569)","AT13148",dec); t(0.0,"ABL1(S569)")::p_occupancy("ABL1(S569)","AT13148",inc) :- \+occ_dec("ABL1(S569)","AT13148"), \+occ_inc("ABL1(S569)","AT13148").
t(0.33)::p_function("ABL1(S718)",p_inc); t(0.33)::p_function("ABL1(S718)",p_dec).
0.001::occ_dec("ABL1(S718)","AT13148").
0.001::occ_inc("ABL1(S718)","AT13148").
t(1.0,"ABL1(S718)")::p_occupancy("ABL1(S718)","AT13148",dec); t(0.0,"ABL1(S718)")::p_occupancy("ABL1(S718)","AT13148",inc) :- occ_dec("ABL1(S718)","AT13148"), \+occ_inc("ABL1(S718)","AT13148").
t(0.0,"ABL1(S718)")::p_occupancy("ABL1(S718)","AT13148",dec); t(1.0,"ABL1(S718)")::p_occupancy("ABL1(S718)","AT13148",inc) :- \+occ_dec("ABL1(S718)","AT13148"), occ_inc("ABL1(S718)","AT13148").
t(0.5,"ABL1(S718)")::p_occupancy("ABL1(S718)","AT13148",dec); t(0.5,"ABL1(S718)")::p_occupancy("ABL1(S718)","AT13148",inc) :- occ_dec("ABL1(S718)","AT13148"), occ_inc("ABL1(S718)","AT13148").
t(0.0,"ABL1(S718)")::p_occupancy("ABL1(S718)","AT13148",dec); t(0.0,"ABL1(S718)")::p_occupancy("ABL1(S718)","AT13148",inc) :- \+occ_dec("ABL1(S718)","AT13148"), \+occ_inc("ABL1(S718)","AT13148").
t(0.7,"ABL1(S569)","ABL1")::act_dec("ABL1","AT13148") :- p_occupancy("ABL1(S569)","AT13148",dec).
t(0.7,"ABL1(S718)","ABL1")::act_dec("ABL1","AT13148") :- p_function("ABL1(S718)",p_inc), p_occupancy("ABL1(S718)","AT13148",dec).
0.001::occ_dec("ABL1(T735)","AT13148").
0.001::occ_inc("ABL1(T735)","AT13148").
t(0.0,"ABL1(T735)")::p_occupancy("ABL1(T735)","AT13148",inc); t(1.0,"ABL1(T735)")::p_occupancy("ABL1(T735)","AT13148",dec) :- occ_dec("ABL1(T735)","AT13148"), \+occ_inc("ABL1(T735)","AT13148").
t(1.0,"ABL1(T735)")::p_occupancy("ABL1(T735)","AT13148",inc); t(0.0,"ABL1(T735)")::p_occupancy("ABL1(T735)","AT13148",dec) :- \+occ_dec("ABL1(T735)","AT13148"), occ_inc("ABL1(T735)","AT13148").
t(0.5,"ABL1(T735)")::p_occupancy("ABL1(T735)","AT13148",inc); t(0.5,"ABL1(T735)")::p_occupancy("ABL1(T735)","AT13148",dec) :- occ_dec("ABL1(T735)","AT13148"), occ_inc("ABL1(T735)","AT13148").
t(0.0,"ABL1(T735)")::p_occupancy("ABL1(T735)","AT13148",inc); t(0.0,"ABL1(T735)")::p_occupancy("ABL1(T735)","AT13148",dec) :- \+occ_dec("ABL1(T735)","AT13148"), \+occ_inc("ABL1(T735)","AT13148").
t(0.7,"ABL1(S718)","ABL1")::act_dec("ABL1","AT13148") :- p_function("ABL1(S718)",p_dec), p_occupancy("ABL1(S718)","AT13148",inc).
t(0.7,"ABL1(T735)","ABL1")::act_dec("ABL1","AT13148") :- p_occupancy("ABL1(T735)","AT13148",inc).
0.001::act_inc("ABL1","AT13148").
0.001::act_inc("ABL1","AT13148").
0.001::act_inc("ABL1","AT13148").
0.001::act_inc("ABL1","AT13148").
t(0.7,"ABL1(S569)","ABL1")::act_inc("ABL1","AT13148") :- p_occupancy("ABL1(S569)","AT13148",inc).
t(0.7,"ABL1(S718)","ABL1")::act_inc("ABL1","AT13148") :- p_function("ABL1(S718)",p_inc), p_occupancy("ABL1(S718)","AT13148",inc).
t(0.7,"ABL1(S718)","ABL1")::act_inc("ABL1","AT13148") :- p_function("ABL1(S718)",p_dec), p_occupancy("ABL1(S718)","AT13148",dec).
t(0.7,"ABL1(T735)","ABL1")::act_inc("ABL1","AT13148") :- p_occupancy("ABL1(T735)","AT13148",dec).
t(1.0,"ABL1")::e_activity("ABL1","AT13148",dec); t(0.0,"ABL1")::e_activity("ABL1","AT13148",inc) :- act_dec("ABL1","AT13148"), \+act_inc("ABL1","AT13148").
t(0.0,"ABL1")::e_activity("ABL1","AT13148",dec); t(1.0,"ABL1")::e_activity("ABL1","AT13148",inc) :- \+act_dec("ABL1","AT13148"), act_inc("ABL1","AT13148").
t(0.5,"ABL1")::e_activity("ABL1","AT13148",dec); t(0.5,"ABL1")::e_activity("ABL1","AT13148",inc) :- act_dec("ABL1","AT13148"), act_inc("ABL1","AT13148").
t(0.0,"ABL1")::e_activity("ABL1","AT13148",dec); t(0.0,"ABL1")::e_activity("ABL1","AT13148",inc) :- \+act_dec("ABL1","AT13148"), \+act_inc("ABL1","AT13148").
t(0.7,"ABL1","ABI1(Y213)")::occ_dec("ABI1(Y213)","AT13148") :- targets("ABL1","ABI1(Y213)"), e_activity("ABL1","AT13148",dec).
0.001::occ_inc("ABI1(Y213)","AT13148").
0.001::occ_inc("ABI1(Y213)","AT13148") :- targets("ABL1","ABI1(Y213)").
t(0.7,"ABL1","ABI1(Y213)")::occ_inc("ABI1(Y213)","AT13148") :- targets("ABL1","ABI1(Y213)"), e_activity("ABL1","AT13148",inc).
t(1.0,"ABI1(Y213)")::p_occupancy("ABI1(Y213)","AT13148",dec); t(0.0,"ABI1(Y213)")::p_occupancy("ABI1(Y213)","AT13148",inc) :- occ_dec("ABI1(Y213)","AT13148"), \+occ_inc("ABI1(Y213)","AT13148").
t(0.0,"ABI1(Y213)")::p_occupancy("ABI1(Y213)","AT13148",dec); t(1.0,"ABI1(Y213)")::p_occupancy("ABI1(Y213)","AT13148",inc) :- \+occ_dec("ABI1(Y213)","AT13148"), occ_inc("ABI1(Y213)","AT13148").
t(0.5,"ABI1(Y213)")::p_occupancy("ABI1(Y213)","AT13148",dec); t(0.5,"ABI1(Y213)")::p_occupancy("ABI1(Y213)","AT13148",inc) :- occ_dec("ABI1(Y213)","AT13148"), occ_inc("ABI1(Y213)","AT13148").
t(0.0,"ABI1(Y213)")::p_occupancy("ABI1(Y213)","AT13148",dec); t(0.0,"ABI1(Y213)")::p_occupancy("ABI1(Y213)","AT13148",inc) :- \+occ_dec("ABI1(Y213)","AT13148"), \+occ_inc("ABI1(Y213)","AT13148").
0.0461842006::p_fc("ABI1(Y213)","AT13148",dec) :- p_occupancy("ABI1(Y213)","AT13148",dec).
0.001::p_fc("ABI1(Y213)","AT13148",dec) :- p_occupancy("ABI1(Y213)","AT13148",inc).
0.4769078997::p_fc("ABI1(Y213)","AT13148",dec).
0.001::e_ksea("ABL1","AT13148",inc) :- e_activity("ABL1","AT13148",dec).
0.5907946928::e_ksea("ABL1","AT13148",inc) :- e_activity("ABL1","AT13148",inc).
0.2046026536::e_ksea("ABL1","AT13148",inc).
evidence(p_fc("ABI1(Y213)","AT13148",dec)).
evidence(e_ksea("ABL1","AT13148",inc)).
