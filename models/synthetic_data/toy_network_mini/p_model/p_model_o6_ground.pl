t(0.33,e1,s1)::e_activity(e1,s1,dec); t(0.33,e1,s1)::e_activity(e1,s1,inc).
0.001::e_ksea(e1,s1,inc) :- e_activity(e1,s1,dec).
0.6675::e_ksea(e1,s1,inc) :- e_activity(e1,s1,inc).
t(0.33,e2,s1)::e_activity(e2,s1,dec); t(0.33,e2,s1)::e_activity(e2,s1,inc).
0.9956::e_ksea(e2,s1,dec) :- e_activity(e2,s1,dec).
0.001::e_ksea(e2,s1,dec) :- e_activity(e2,s1,inc).
t(0.33,e3,s1)::e_activity(e3,s1,dec); t(0.33,e3,s1)::e_activity(e3,s1,inc).
0.001::e_ksea(e3,s1,inc) :- e_activity(e3,s1,dec).
0.9054::e_ksea(e3,s1,inc) :- e_activity(e3,s1,inc).
t(0.7,e1,p0)::occ_dec(p0,s1) :- e_activity(e1,s1,dec).
t(0.7,e2,p0)::occ_dec(p0,s1) :- e_activity(e2,s1,dec).
t(0.7,e3,p0)::occ_dec(p0,s1) :- e_activity(e3,s1,inc).
t(0.7,e1,p0)::occ_inc(p0,s1) :- e_activity(e1,s1,inc).
t(0.7,e2,p0)::occ_inc(p0,s1) :- e_activity(e2,s1,inc).
t(0.7,e3,p0)::occ_inc(p0,s1) :- e_activity(e3,s1,dec).
t(1.0)::p_occupancy(p0,s1,dec); t(0.0)::p_occupancy(p0,s1,inc) :- occ_dec(p0,s1), \+occ_inc(p0,s1).
t(0.0)::p_occupancy(p0,s1,dec); t(1.0)::p_occupancy(p0,s1,inc) :- \+occ_dec(p0,s1), occ_inc(p0,s1).
t(0.5)::p_occupancy(p0,s1,dec); t(0.5)::p_occupancy(p0,s1,inc) :- occ_dec(p0,s1), occ_inc(p0,s1).
t(0.0)::p_occupancy(p0,s1,dec); t(0.0)::p_occupancy(p0,s1,inc) :- \+occ_dec(p0,s1), \+occ_inc(p0,s1).
0.7511::p_fc(p0,s1,dec) :- p_occupancy(p0,s1,dec).
0.001::p_fc(p0,s1,dec) :- p_occupancy(p0,s1,inc).
evidence(e_ksea(e1,s1,inc)).
evidence(e_ksea(e2,s1,dec)).
evidence(e_ksea(e3,s1,inc)).
evidence(p_fc(p0,s1,dec)).
