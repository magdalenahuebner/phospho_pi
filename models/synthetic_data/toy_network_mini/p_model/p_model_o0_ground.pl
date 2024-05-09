t(0.33,e1,s23)::e_activity(e1,s23,base); t(0.33,e1,s23)::e_activity(e1,s23,dec); t(0.33,e1,s23)::e_activity(e1,s23,inc).
0.0081052572::e_ksea(e1,s23,inc) :- e_activity(e1,s23,base).
0.001::e_ksea(e1,s23,inc) :- e_activity(e1,s23,dec).
0.9827894856::e_ksea(e1,s23,inc) :- e_activity(e1,s23,inc).
t(0.33,e1,s23)::e_ksea(e1,s23,inc).
t(0.33,e1,s40)::e_activity(e1,s40,base); t(0.33,e1,s40)::e_activity(e1,s40,dec); t(0.33,e1,s40)::e_activity(e1,s40,inc).
0.9053721692::e_ksea(e1,s40,base) :- e_activity(e1,s40,base).
0.0846278308::e_ksea(e1,s40,base) :- e_activity(e1,s40,dec).
0.0846278308::e_ksea(e1,s40,base) :- e_activity(e1,s40,inc).
t(0.33,e1,s40)::e_ksea(e1,s40,base).
t(0.33,e2,s23)::e_activity(e2,s23,base); t(0.33,e2,s23)::e_activity(e2,s23,dec); t(0.33,e2,s23)::e_activity(e2,s23,inc).
0.8093256547::e_ksea(e2,s23,base) :- e_activity(e2,s23,base).
0.1806743453::e_ksea(e2,s23,base) :- e_activity(e2,s23,dec).
0.1806743453::e_ksea(e2,s23,base) :- e_activity(e2,s23,inc).
t(0.33,e2,s23)::e_ksea(e2,s23,base).
t(0.33,e2,s40)::e_activity(e2,s40,base); t(0.33,e2,s40)::e_activity(e2,s40,dec); t(0.33,e2,s40)::e_activity(e2,s40,inc).
0.0064535946::e_ksea(e2,s40,dec) :- e_activity(e2,s40,base).
0.9860928109::e_ksea(e2,s40,dec) :- e_activity(e2,s40,dec).
0.001::e_ksea(e2,s40,dec) :- e_activity(e2,s40,inc).
t(0.33,e2,s40)::e_ksea(e2,s40,dec).
t(0.33,e3,s23)::e_activity(e3,s23,base); t(0.33,e3,s23)::e_activity(e3,s23,dec); t(0.33,e3,s23)::e_activity(e3,s23,inc).
0.1594528625::e_ksea(e3,s23,dec) :- e_activity(e3,s23,base).
0.680094275::e_ksea(e3,s23,dec) :- e_activity(e3,s23,dec).
0.001::e_ksea(e3,s23,dec) :- e_activity(e3,s23,inc).
t(0.33,e3,s23)::e_ksea(e3,s23,dec).
t(0.33,e3,s40)::e_activity(e3,s40,base); t(0.33,e3,s40)::e_activity(e3,s40,dec); t(0.33,e3,s40)::e_activity(e3,s40,inc).
0.5846737146::e_ksea(e3,s40,base) :- e_activity(e3,s40,base).
0.4053262854::e_ksea(e3,s40,base) :- e_activity(e3,s40,dec).
0.4053262854::e_ksea(e3,s40,base) :- e_activity(e3,s40,inc).
t(0.33,e3,s40)::e_ksea(e3,s40,base).
t(0.7,e1,p0)::occ_dec(p0,s23) :- e_activity(e1,s23,dec).
t(0.7,e2,p0)::occ_dec(p0,s23) :- e_activity(e2,s23,dec).
t(0.7,e3,p0)::occ_dec(p0,s23) :- e_activity(e3,s23,inc).
t(0.7,e1,p0)::occ_base(p0,s23) :- e_activity(e1,s23,base).
t(0.7,e2,p0)::occ_base(p0,s23) :- e_activity(e2,s23,base).
t(0.7,e3,p0)::occ_base(p0,s23) :- e_activity(e3,s23,base).
t(0.7,e1,p0)::occ_inc(p0,s23) :- e_activity(e1,s23,inc).
t(0.7,e2,p0)::occ_inc(p0,s23) :- e_activity(e2,s23,inc).
t(0.7,e3,p0)::occ_inc(p0,s23) :- e_activity(e3,s23,dec).
t(0.0)::p_occupancy(p0,s23,base); t(1.0)::p_occupancy(p0,s23,dec); t(0.0)::p_occupancy(p0,s23,inc) :- occ_dec(p0,s23), occ_base(p0,s23), \+occ_inc(p0,s23).
t(0.0)::p_occupancy(p0,s23,base); t(0.0)::p_occupancy(p0,s23,dec); t(1.0)::p_occupancy(p0,s23,inc) :- \+occ_dec(p0,s23), occ_base(p0,s23), occ_inc(p0,s23).
t(0.5)::p_occupancy(p0,s23,base); t(0.25)::p_occupancy(p0,s23,dec); t(0.25)::p_occupancy(p0,s23,inc) :- occ_dec(p0,s23), occ_base(p0,s23), occ_inc(p0,s23).
t(1.0)::p_occupancy(p0,s23,base); t(0.0)::p_occupancy(p0,s23,dec); t(0.0)::p_occupancy(p0,s23,inc) :- \+occ_dec(p0,s23), occ_base(p0,s23), \+occ_inc(p0,s23).
t(0.0)::p_occupancy(p0,s23,base); t(1.0)::p_occupancy(p0,s23,dec); t(0.0)::p_occupancy(p0,s23,inc) :- occ_dec(p0,s23), \+occ_base(p0,s23), \+occ_inc(p0,s23).
t(0.0)::p_occupancy(p0,s23,base); t(0.0)::p_occupancy(p0,s23,dec); t(1.0)::p_occupancy(p0,s23,inc) :- \+occ_dec(p0,s23), \+occ_base(p0,s23), occ_inc(p0,s23).
t(0.5)::p_occupancy(p0,s23,base); t(0.25)::p_occupancy(p0,s23,dec); t(0.25)::p_occupancy(p0,s23,inc) :- occ_dec(p0,s23), \+occ_base(p0,s23), occ_inc(p0,s23).
t(1.0)::p_occupancy(p0,s23,base); t(0.0)::p_occupancy(p0,s23,dec); t(0.0)::p_occupancy(p0,s23,inc) :- \+occ_dec(p0,s23), \+occ_base(p0,s23), \+occ_inc(p0,s23).
0.024234329::p_fc(p0,s23,inc) :- p_occupancy(p0,s23,base).
0.001::p_fc(p0,s23,inc) :- p_occupancy(p0,s23,dec).
0.9505313421::p_fc(p0,s23,inc) :- p_occupancy(p0,s23,inc).
t(0.33,p0,s23)::p_fc(p0,s23,inc).
t(0.7,e1,p0)::occ_dec(p0,s40) :- e_activity(e1,s40,dec).
t(0.7,e2,p0)::occ_dec(p0,s40) :- e_activity(e2,s40,dec).
t(0.7,e3,p0)::occ_dec(p0,s40) :- e_activity(e3,s40,inc).
t(0.7,e1,p0)::occ_base(p0,s40) :- e_activity(e1,s40,base).
t(0.7,e2,p0)::occ_base(p0,s40) :- e_activity(e2,s40,base).
t(0.7,e3,p0)::occ_base(p0,s40) :- e_activity(e3,s40,base).
t(0.7,e1,p0)::occ_inc(p0,s40) :- e_activity(e1,s40,inc).
t(0.7,e2,p0)::occ_inc(p0,s40) :- e_activity(e2,s40,inc).
t(0.7,e3,p0)::occ_inc(p0,s40) :- e_activity(e3,s40,dec).
t(0.0)::p_occupancy(p0,s40,base); t(1.0)::p_occupancy(p0,s40,dec); t(0.0)::p_occupancy(p0,s40,inc) :- occ_dec(p0,s40), occ_base(p0,s40), \+occ_inc(p0,s40).
t(0.0)::p_occupancy(p0,s40,base); t(0.0)::p_occupancy(p0,s40,dec); t(1.0)::p_occupancy(p0,s40,inc) :- \+occ_dec(p0,s40), occ_base(p0,s40), occ_inc(p0,s40).
t(0.5)::p_occupancy(p0,s40,base); t(0.25)::p_occupancy(p0,s40,dec); t(0.25)::p_occupancy(p0,s40,inc) :- occ_dec(p0,s40), occ_base(p0,s40), occ_inc(p0,s40).
t(1.0)::p_occupancy(p0,s40,base); t(0.0)::p_occupancy(p0,s40,dec); t(0.0)::p_occupancy(p0,s40,inc) :- \+occ_dec(p0,s40), occ_base(p0,s40), \+occ_inc(p0,s40).
t(0.0)::p_occupancy(p0,s40,base); t(1.0)::p_occupancy(p0,s40,dec); t(0.0)::p_occupancy(p0,s40,inc) :- occ_dec(p0,s40), \+occ_base(p0,s40), \+occ_inc(p0,s40).
t(0.0)::p_occupancy(p0,s40,base); t(0.0)::p_occupancy(p0,s40,dec); t(1.0)::p_occupancy(p0,s40,inc) :- \+occ_dec(p0,s40), \+occ_base(p0,s40), occ_inc(p0,s40).
t(0.5)::p_occupancy(p0,s40,base); t(0.25)::p_occupancy(p0,s40,dec); t(0.25)::p_occupancy(p0,s40,inc) :- occ_dec(p0,s40), \+occ_base(p0,s40), occ_inc(p0,s40).
t(1.0)::p_occupancy(p0,s40,base); t(0.0)::p_occupancy(p0,s40,dec); t(0.0)::p_occupancy(p0,s40,inc) :- \+occ_dec(p0,s40), \+occ_base(p0,s40), \+occ_inc(p0,s40).
0.2379924019::p_fc(p0,s40,dec) :- p_occupancy(p0,s40,base).
0.5230151963::p_fc(p0,s40,dec) :- p_occupancy(p0,s40,dec).
0.001::p_fc(p0,s40,dec) :- p_occupancy(p0,s40,inc).
t(0.33,p0,s40)::p_fc(p0,s40,dec).
evidence(e_ksea(e1,s23,inc)).
evidence(e_ksea(e1,s40,base)).
evidence(e_ksea(e2,s23,base)).
evidence(e_ksea(e2,s40,dec)).
evidence(e_ksea(e3,s23,dec)).
evidence(e_ksea(e3,s40,base)).
evidence(p_fc(p0,s23,inc)).
evidence(p_fc(p0,s40,dec)).
