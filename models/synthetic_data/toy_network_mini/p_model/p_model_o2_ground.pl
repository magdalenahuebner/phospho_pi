t(0.33,e1,s14)::e_activity(e1,s14,base); t(0.33,e1,s14)::e_activity(e1,s14,dec); t(0.33,e1,s14)::e_activity(e1,s14,inc).
0.741::e_ksea(e1,s14,base) :- e_activity(e1,s14,base).
0.258::e_ksea(e1,s14,base) :- e_activity(e1,s14,dec).
0.258::e_ksea(e1,s14,base) :- e_activity(e1,s14,inc).
t(0.33,e2,s14)::e_activity(e2,s14,base); t(0.33,e2,s14)::e_activity(e2,s14,dec); t(0.33,e2,s14)::e_activity(e2,s14,inc).
0.1188::e_ksea(e2,s14,inc) :- e_activity(e2,s14,base).
0.001::e_ksea(e2,s14,inc) :- e_activity(e2,s14,dec).
0.7623::e_ksea(e2,s14,inc) :- e_activity(e2,s14,inc).
t(0.33,e3,s14)::e_activity(e3,s14,base); t(0.33,e3,s14)::e_activity(e3,s14,dec); t(0.33,e3,s14)::e_activity(e3,s14,inc).
0.7715::e_ksea(e3,s14,base) :- e_activity(e3,s14,base).
0.2275::e_ksea(e3,s14,base) :- e_activity(e3,s14,dec).
0.2275::e_ksea(e3,s14,base) :- e_activity(e3,s14,inc).
t(0.7,e1,p0)::occ_dec(p0,s14) :- e_activity(e1,s14,dec).
t(0.7,e2,p0)::occ_dec(p0,s14) :- e_activity(e2,s14,dec).
t(0.7,e3,p0)::occ_dec(p0,s14) :- e_activity(e3,s14,inc).
t(0.7,e1,p0)::occ_base(p0,s14) :- e_activity(e1,s14,base).
t(0.7,e2,p0)::occ_base(p0,s14) :- e_activity(e2,s14,base).
t(0.7,e3,p0)::occ_base(p0,s14) :- e_activity(e3,s14,base).
t(0.7,e1,p0)::occ_inc(p0,s14) :- e_activity(e1,s14,inc).
t(0.7,e2,p0)::occ_inc(p0,s14) :- e_activity(e2,s14,inc).
t(0.7,e3,p0)::occ_inc(p0,s14) :- e_activity(e3,s14,dec).
t(0.0)::p_occupancy(p0,s14,base); t(1.0)::p_occupancy(p0,s14,dec); t(0.0)::p_occupancy(p0,s14,inc) :- occ_dec(p0,s14), occ_base(p0,s14), \+occ_inc(p0,s14).
t(0.0)::p_occupancy(p0,s14,base); t(0.0)::p_occupancy(p0,s14,dec); t(1.0)::p_occupancy(p0,s14,inc) :- \+occ_dec(p0,s14), occ_base(p0,s14), occ_inc(p0,s14).
t(0.5)::p_occupancy(p0,s14,base); t(0.25)::p_occupancy(p0,s14,dec); t(0.25)::p_occupancy(p0,s14,inc) :- occ_dec(p0,s14), occ_base(p0,s14), occ_inc(p0,s14).
t(1.0)::p_occupancy(p0,s14,base); t(0.0)::p_occupancy(p0,s14,dec); t(0.0)::p_occupancy(p0,s14,inc) :- \+occ_dec(p0,s14), occ_base(p0,s14), \+occ_inc(p0,s14).
t(0.0)::p_occupancy(p0,s14,base); t(1.0)::p_occupancy(p0,s14,dec); t(0.0)::p_occupancy(p0,s14,inc) :- occ_dec(p0,s14), \+occ_base(p0,s14), \+occ_inc(p0,s14).
t(0.0)::p_occupancy(p0,s14,base); t(0.0)::p_occupancy(p0,s14,dec); t(1.0)::p_occupancy(p0,s14,inc) :- \+occ_dec(p0,s14), \+occ_base(p0,s14), occ_inc(p0,s14).
t(0.5)::p_occupancy(p0,s14,base); t(0.25)::p_occupancy(p0,s14,dec); t(0.25)::p_occupancy(p0,s14,inc) :- occ_dec(p0,s14), \+occ_base(p0,s14), occ_inc(p0,s14).
t(1.0)::p_occupancy(p0,s14,base); t(0.0)::p_occupancy(p0,s14,dec); t(0.0)::p_occupancy(p0,s14,inc) :- \+occ_dec(p0,s14), \+occ_base(p0,s14), \+occ_inc(p0,s14).
0.0546::p_fc(p0,s14,inc) :- p_occupancy(p0,s14,base).
0.001::p_fc(p0,s14,inc) :- p_occupancy(p0,s14,dec).
0.8909::p_fc(p0,s14,inc) :- p_occupancy(p0,s14,inc).
evidence(e_ksea(e1,s14,base)).
evidence(e_ksea(e2,s14,inc)).
evidence(e_ksea(e3,s14,base)).
evidence(p_fc(p0,s14,inc)).
