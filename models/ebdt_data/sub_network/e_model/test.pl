
0.925625400569835::act_dec("FYN",S) :- inhibits(S,"FYN").
1.0::act_dec("PTPRG",S) :- p_regulates("PTPRG(S995)","PTPRG"), p_function("PTPRG(S995)",p_inc), p_occupancy("PTPRG(S995)",S,dec).
0.001::occ_inc(P,S) :- targets(E,P).
0.0::occ_dec("PXN(Y118)",S) :- targets("PTK6","PXN(Y118)"), e_function("PTK6",kinase), e_activity("PTK6",S,dec).
