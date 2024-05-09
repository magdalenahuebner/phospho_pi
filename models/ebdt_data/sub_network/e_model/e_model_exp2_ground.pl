t(0.33,"ABL1(S718)","AZD3759")::p_occupancy("ABL1(S718)","AZD3759",dec); t(0.33,"ABL1(S718)","AZD3759")::p_occupancy("ABL1(S718)","AZD3759",inc).
0.2101821522::p_fc("ABL1(S718)","AZD3759",dec) :- p_occupancy("ABL1(S718)","AZD3759",dec).
0.001::p_fc("ABL1(S718)","AZD3759",dec) :- p_occupancy("ABL1(S718)","AZD3759",inc).
0.3949089239::p_fc("ABL1(S718)","AZD3759",dec).
0.001::act_dec("ABL1","AZD3759").
0.001::act_dec("ABL1","AZD3759").
0.001::act_dec("ABL1","AZD3759").
t(0.33,"ABL1(S569)","AZD3759")::p_occupancy("ABL1(S569)","AZD3759",dec); t(0.33,"ABL1(S569)","AZD3759")::p_occupancy("ABL1(S569)","AZD3759",inc).
t(0.33)::p_function("ABL1(S718)",p_inc); t(0.33)::p_function("ABL1(S718)",p_dec).
t(0.7,"ABL1(S569)","ABL1")::act_dec("ABL1","AZD3759") :- p_occupancy("ABL1(S569)","AZD3759",dec).
t(0.7,"ABL1(S718)","ABL1")::act_dec("ABL1","AZD3759") :- p_function("ABL1(S718)",p_inc), p_occupancy("ABL1(S718)","AZD3759",dec).
t(0.33,"ABL1(T735)","AZD3759")::p_occupancy("ABL1(T735)","AZD3759",inc); t(0.33,"ABL1(T735)","AZD3759")::p_occupancy("ABL1(T735)","AZD3759",dec).
t(0.7,"ABL1(S718)","ABL1")::act_dec("ABL1","AZD3759") :- p_function("ABL1(S718)",p_dec), p_occupancy("ABL1(S718)","AZD3759",inc).
t(0.7,"ABL1(T735)","ABL1")::act_dec("ABL1","AZD3759") :- p_occupancy("ABL1(T735)","AZD3759",inc).
0.001::act_inc("ABL1","AZD3759").
0.001::act_inc("ABL1","AZD3759").
0.001::act_inc("ABL1","AZD3759").
t(0.7,"ABL1(S569)","ABL1")::act_inc("ABL1","AZD3759") :- p_occupancy("ABL1(S569)","AZD3759",inc).
t(0.7,"ABL1(S718)","ABL1")::act_inc("ABL1","AZD3759") :- p_function("ABL1(S718)",p_inc), p_occupancy("ABL1(S718)","AZD3759",inc).
t(0.7,"ABL1(S718)","ABL1")::act_inc("ABL1","AZD3759") :- p_function("ABL1(S718)",p_dec), p_occupancy("ABL1(S718)","AZD3759",dec).
t(0.7,"ABL1(T735)","ABL1")::act_inc("ABL1","AZD3759") :- p_occupancy("ABL1(T735)","AZD3759",dec).
t(1.0,"ABL1")::e_activity("ABL1","AZD3759",dec); t(0.0,"ABL1")::e_activity("ABL1","AZD3759",inc) :- act_dec("ABL1","AZD3759"), \+act_inc("ABL1","AZD3759").
t(0.0,"ABL1")::e_activity("ABL1","AZD3759",dec); t(1.0,"ABL1")::e_activity("ABL1","AZD3759",inc) :- \+act_dec("ABL1","AZD3759"), act_inc("ABL1","AZD3759").
t(0.5,"ABL1")::e_activity("ABL1","AZD3759",dec); t(0.5,"ABL1")::e_activity("ABL1","AZD3759",inc) :- act_dec("ABL1","AZD3759"), act_inc("ABL1","AZD3759").
t(0.0,"ABL1")::e_activity("ABL1","AZD3759",dec); t(0.0,"ABL1")::e_activity("ABL1","AZD3759",inc) :- \+act_dec("ABL1","AZD3759"), \+act_inc("ABL1","AZD3759").
0.8364156347::e_ksea("ABL1","AZD3759",dec) :- e_activity("ABL1","AZD3759",dec).
0.001::e_ksea("ABL1","AZD3759",dec) :- e_activity("ABL1","AZD3759",inc).
0.0817921827::e_ksea("ABL1","AZD3759",dec).
evidence(p_fc("ABL1(S718)","AZD3759",dec)).
evidence(e_ksea("ABL1","AZD3759",dec)).
