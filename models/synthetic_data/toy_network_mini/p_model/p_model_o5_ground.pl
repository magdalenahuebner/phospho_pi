t(0.33,e1,s29)::e_activity(e1,s29,dec); t(0.33,e1,s29)::e_activity(e1,s29,inc).
0.001::e_ksea(e1,s29,inc) :- e_activity(e1,s29,dec).
0.5316::e_ksea(e1,s29,inc) :- e_activity(e1,s29,inc).
t(0.33,e2,s29)::e_activity(e2,s29,dec); t(0.33,e2,s29)::e_activity(e2,s29,inc).
0.5316::e_ksea(e2,s29,dec) :- e_activity(e2,s29,dec).
0.001::e_ksea(e2,s29,dec) :- e_activity(e2,s29,inc).
t(0.33,e3,s29)::e_activity(e3,s29,dec); t(0.33,e3,s29)::e_activity(e3,s29,inc).
0.5316::e_ksea(e3,s29,dec) :- e_activity(e3,s29,dec).
0.001::e_ksea(e3,s29,dec) :- e_activity(e3,s29,inc).
t(0.33,e4,s29)::e_activity(e4,s29,dec); t(0.33,e4,s29)::e_activity(e4,s29,inc).
0.001::e_ksea(e4,s29,inc) :- e_activity(e4,s29,dec).
0.5316::e_ksea(e4,s29,inc) :- e_activity(e4,s29,inc).
t(0.33,e5,s29)::e_activity(e5,s29,dec); t(0.33,e5,s29)::e_activity(e5,s29,inc).
0.001::e_ksea(e5,s29,inc) :- e_activity(e5,s29,dec).
0.5316::e_ksea(e5,s29,inc) :- e_activity(e5,s29,inc).
t(0.33,e6,s29)::e_activity(e6,s29,dec); t(0.33,e6,s29)::e_activity(e6,s29,inc).
0.001::e_ksea(e6,s29,inc) :- e_activity(e6,s29,dec).
0.5316::e_ksea(e6,s29,inc) :- e_activity(e6,s29,inc).
t(0.7,e1,p0)::occ_dec(p0,s29) :- e_activity(e1,s29,dec).
t(0.7,e2,p0)::occ_dec(p0,s29) :- e_activity(e2,s29,dec).
t(0.7,e4,p0)::occ_dec(p0,s29) :- e_activity(e4,s29,dec).
t(0.7,e5,p0)::occ_dec(p0,s29) :- e_activity(e5,s29,dec).
t(0.7,e6,p0)::occ_dec(p0,s29) :- e_activity(e6,s29,dec).
t(0.7,e3,p0)::occ_dec(p0,s29) :- e_activity(e3,s29,inc).
t(0.7,e1,p0)::occ_inc(p0,s29) :- e_activity(e1,s29,inc).
t(0.7,e2,p0)::occ_inc(p0,s29) :- e_activity(e2,s29,inc).
t(0.7,e4,p0)::occ_inc(p0,s29) :- e_activity(e4,s29,inc).
t(0.7,e5,p0)::occ_inc(p0,s29) :- e_activity(e5,s29,inc).
t(0.7,e6,p0)::occ_inc(p0,s29) :- e_activity(e6,s29,inc).
t(0.7,e3,p0)::occ_inc(p0,s29) :- e_activity(e3,s29,dec).
t(1.0)::p_occupancy(p0,s29,dec); t(0.0)::p_occupancy(p0,s29,inc) :- occ_dec(p0,s29), \+occ_inc(p0,s29).
t(0.0)::p_occupancy(p0,s29,dec); t(1.0)::p_occupancy(p0,s29,inc) :- \+occ_dec(p0,s29), occ_inc(p0,s29).
t(0.5)::p_occupancy(p0,s29,dec); t(0.5)::p_occupancy(p0,s29,inc) :- occ_dec(p0,s29), occ_inc(p0,s29).
t(0.0)::p_occupancy(p0,s29,dec); t(0.0)::p_occupancy(p0,s29,inc) :- \+occ_dec(p0,s29), \+occ_inc(p0,s29).
0.001::p_fc(p0,s29,inc) :- p_occupancy(p0,s29,dec).
0.9794::p_fc(p0,s29,inc) :- p_occupancy(p0,s29,inc).
evidence(e_ksea(e1,s29,inc)).
evidence(e_ksea(e2,s29,dec)).
evidence(e_ksea(e3,s29,dec)).
evidence(e_ksea(e4,s29,inc)).
evidence(e_ksea(e5,s29,inc)).
evidence(e_ksea(e6,s29,inc)).
evidence(p_fc(p0,s29,inc)).
