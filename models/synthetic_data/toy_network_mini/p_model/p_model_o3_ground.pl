t(0.33,e1,s33)::e_activity(e1,s33,base); t(0.33,e1,s33)::e_activity(e1,s33,dec); t(0.33,e1,s33)::e_activity(e1,s33,inc).
0.189::e_ksea(e1,s33,dec) :- e_activity(e1,s33,base).
0.6221::e_ksea(e1,s33,dec) :- e_activity(e1,s33,dec).
0.001::e_ksea(e1,s33,dec) :- e_activity(e1,s33,inc).
t(0.33,e2,s33)::e_activity(e2,s33,base); t(0.33,e2,s33)::e_activity(e2,s33,dec); t(0.33,e2,s33)::e_activity(e2,s33,inc).
0.6221::e_ksea(e2,s33,base) :- e_activity(e2,s33,base).
0.3769::e_ksea(e2,s33,base) :- e_activity(e2,s33,dec).
0.3769::e_ksea(e2,s33,base) :- e_activity(e2,s33,inc).
t(0.33,e3,s33)::e_activity(e3,s33,base); t(0.33,e3,s33)::e_activity(e3,s33,dec); t(0.33,e3,s33)::e_activity(e3,s33,inc).
0.6221::e_ksea(e3,s33,base) :- e_activity(e3,s33,base).
0.3769::e_ksea(e3,s33,base) :- e_activity(e3,s33,dec).
0.3769::e_ksea(e3,s33,base) :- e_activity(e3,s33,inc).
t(0.33,e4,s33)::e_activity(e4,s33,base); t(0.33,e4,s33)::e_activity(e4,s33,dec); t(0.33,e4,s33)::e_activity(e4,s33,inc).
0.189::e_ksea(e4,s33,dec) :- e_activity(e4,s33,base).
0.6221::e_ksea(e4,s33,dec) :- e_activity(e4,s33,dec).
0.001::e_ksea(e4,s33,dec) :- e_activity(e4,s33,inc).
t(0.7,e1,p0)::occ_dec(p0,s33) :- e_activity(e1,s33,dec).
t(0.7,e2,p0)::occ_dec(p0,s33) :- e_activity(e2,s33,dec).
t(0.7,e4,p0)::occ_dec(p0,s33) :- e_activity(e4,s33,dec).
t(0.7,e3,p0)::occ_dec(p0,s33) :- e_activity(e3,s33,inc).
t(0.7,e1,p0)::occ_base(p0,s33) :- e_activity(e1,s33,base).
t(0.7,e2,p0)::occ_base(p0,s33) :- e_activity(e2,s33,base).
t(0.7,e4,p0)::occ_base(p0,s33) :- e_activity(e4,s33,base).
t(0.7,e3,p0)::occ_base(p0,s33) :- e_activity(e3,s33,base).
t(0.7,e1,p0)::occ_inc(p0,s33) :- e_activity(e1,s33,inc).
t(0.7,e2,p0)::occ_inc(p0,s33) :- e_activity(e2,s33,inc).
t(0.7,e4,p0)::occ_inc(p0,s33) :- e_activity(e4,s33,inc).
t(0.7,e3,p0)::occ_inc(p0,s33) :- e_activity(e3,s33,dec).
t(0.0)::p_occupancy(p0,s33,base); t(1.0)::p_occupancy(p0,s33,dec); t(0.0)::p_occupancy(p0,s33,inc) :- occ_dec(p0,s33), occ_base(p0,s33), \+occ_inc(p0,s33).
t(0.0)::p_occupancy(p0,s33,base); t(0.0)::p_occupancy(p0,s33,dec); t(1.0)::p_occupancy(p0,s33,inc) :- \+occ_dec(p0,s33), occ_base(p0,s33), occ_inc(p0,s33).
t(0.5)::p_occupancy(p0,s33,base); t(0.25)::p_occupancy(p0,s33,dec); t(0.25)::p_occupancy(p0,s33,inc) :- occ_dec(p0,s33), occ_base(p0,s33), occ_inc(p0,s33).
t(1.0)::p_occupancy(p0,s33,base); t(0.0)::p_occupancy(p0,s33,dec); t(0.0)::p_occupancy(p0,s33,inc) :- \+occ_dec(p0,s33), occ_base(p0,s33), \+occ_inc(p0,s33).
t(0.0)::p_occupancy(p0,s33,base); t(1.0)::p_occupancy(p0,s33,dec); t(0.0)::p_occupancy(p0,s33,inc) :- occ_dec(p0,s33), \+occ_base(p0,s33), \+occ_inc(p0,s33).
t(0.0)::p_occupancy(p0,s33,base); t(0.0)::p_occupancy(p0,s33,dec); t(1.0)::p_occupancy(p0,s33,inc) :- \+occ_dec(p0,s33), \+occ_base(p0,s33), occ_inc(p0,s33).
t(0.5)::p_occupancy(p0,s33,base); t(0.25)::p_occupancy(p0,s33,dec); t(0.25)::p_occupancy(p0,s33,inc) :- occ_dec(p0,s33), \+occ_base(p0,s33), occ_inc(p0,s33).
t(1.0)::p_occupancy(p0,s33,base); t(0.0)::p_occupancy(p0,s33,dec); t(0.0)::p_occupancy(p0,s33,inc) :- \+occ_dec(p0,s33), \+occ_base(p0,s33), \+occ_inc(p0,s33).
0.2191::p_fc(p0,s33,dec) :- p_occupancy(p0,s33,base).
0.5618::p_fc(p0,s33,dec) :- p_occupancy(p0,s33,dec).
0.001::p_fc(p0,s33,dec) :- p_occupancy(p0,s33,inc).
evidence(e_ksea(e1,s33,dec)).
evidence(e_ksea(e2,s33,base)).
evidence(e_ksea(e3,s33,base)).
evidence(e_ksea(e4,s33,dec)).
evidence(p_fc(p0,s33,dec)).
