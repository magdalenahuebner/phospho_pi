t(0.33,e1,s79)::e_activity(e1,s79,base); t(0.33,e1,s79)::e_activity(e1,s79,dec); t(0.33,e1,s79)::e_activity(e1,s79,inc).
0.9105218665::e_ksea(e1,s79,base) :- e_activity(e1,s79,base).
0.0794781335::e_ksea(e1,s79,base) :- e_activity(e1,s79,dec).
0.0794781335::e_ksea(e1,s79,base) :- e_activity(e1,s79,inc).
t(0.33,e2,s79)::e_activity(e2,s79,base); t(0.33,e2,s79)::e_activity(e2,s79,dec); t(0.33,e2,s79)::e_activity(e2,s79,inc).
0.1432501803::e_ksea(e2,s79,inc) :- e_activity(e2,s79,base).
0.001::e_ksea(e2,s79,inc) :- e_activity(e2,s79,dec).
0.7124996395::e_ksea(e2,s79,inc) :- e_activity(e2,s79,inc).
t(0.33,e3,s79)::e_activity(e3,s79,base); t(0.33,e3,s79)::e_activity(e3,s79,dec); t(0.33,e3,s79)::e_activity(e3,s79,inc).
0.768775166::e_ksea(e3,s79,base) :- e_activity(e3,s79,base).
0.221224834::e_ksea(e3,s79,base) :- e_activity(e3,s79,dec).
0.221224834::e_ksea(e3,s79,base) :- e_activity(e3,s79,inc).
t(0.7,e1,p0)::occ_dec(p0,s79) :- e_activity(e1,s79,dec).
t(0.7,e2,p0)::occ_dec(p0,s79) :- e_activity(e2,s79,dec).
t(0.7,e3,p0)::occ_dec(p0,s79) :- e_activity(e3,s79,inc).
t(0.7,e1,p0)::occ_base(p0,s79) :- e_activity(e1,s79,base).
t(0.7,e2,p0)::occ_base(p0,s79) :- e_activity(e2,s79,base).
t(0.7,e3,p0)::occ_base(p0,s79) :- e_activity(e3,s79,base).
t(0.7,e1,p0)::occ_inc(p0,s79) :- e_activity(e1,s79,inc).
t(0.7,e2,p0)::occ_inc(p0,s79) :- e_activity(e2,s79,inc).
t(0.7,e3,p0)::occ_inc(p0,s79) :- e_activity(e3,s79,dec).
t(0.0)::p_occupancy(p0,s79,base); t(1.0)::p_occupancy(p0,s79,dec); t(0.0)::p_occupancy(p0,s79,inc) :- occ_dec(p0,s79), occ_base(p0,s79), \+occ_inc(p0,s79).
t(0.0)::p_occupancy(p0,s79,base); t(0.0)::p_occupancy(p0,s79,dec); t(1.0)::p_occupancy(p0,s79,inc) :- \+occ_dec(p0,s79), occ_base(p0,s79), occ_inc(p0,s79).
t(0.5)::p_occupancy(p0,s79,base); t(0.25)::p_occupancy(p0,s79,dec); t(0.25)::p_occupancy(p0,s79,inc) :- occ_dec(p0,s79), occ_base(p0,s79), occ_inc(p0,s79).
t(1.0)::p_occupancy(p0,s79,base); t(0.0)::p_occupancy(p0,s79,dec); t(0.0)::p_occupancy(p0,s79,inc) :- \+occ_dec(p0,s79), occ_base(p0,s79), \+occ_inc(p0,s79).
t(0.0)::p_occupancy(p0,s79,base); t(1.0)::p_occupancy(p0,s79,dec); t(0.0)::p_occupancy(p0,s79,inc) :- occ_dec(p0,s79), \+occ_base(p0,s79), \+occ_inc(p0,s79).
t(0.0)::p_occupancy(p0,s79,base); t(0.0)::p_occupancy(p0,s79,dec); t(1.0)::p_occupancy(p0,s79,inc) :- \+occ_dec(p0,s79), \+occ_base(p0,s79), occ_inc(p0,s79).
t(0.5)::p_occupancy(p0,s79,base); t(0.25)::p_occupancy(p0,s79,dec); t(0.25)::p_occupancy(p0,s79,inc) :- occ_dec(p0,s79), \+occ_base(p0,s79), occ_inc(p0,s79).
t(1.0)::p_occupancy(p0,s79,base); t(0.0)::p_occupancy(p0,s79,dec); t(0.0)::p_occupancy(p0,s79,inc) :- \+occ_dec(p0,s79), \+occ_base(p0,s79), \+occ_inc(p0,s79).
0.1790302752::p_fc(p0,s79,inc) :- p_occupancy(p0,s79,base).
0.001::p_fc(p0,s79,inc) :- p_occupancy(p0,s79,dec).
0.6409394496::p_fc(p0,s79,inc) :- p_occupancy(p0,s79,inc).
evidence(e_ksea(e1,s79,base)).
evidence(e_ksea(e2,s79,inc)).
evidence(e_ksea(e3,s79,base)).
evidence(p_fc(p0,s79,inc)).
