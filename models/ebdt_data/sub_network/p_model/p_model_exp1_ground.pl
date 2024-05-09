t(0.33,"ABL1","CAL101")::e_activity("ABL1","CAL101",dec); t(0.33,"ABL1","CAL101")::e_activity("ABL1","CAL101",inc).
0.001::e_ksea("ABL1","CAL101",inc) :- e_activity("ABL1","CAL101",dec).
0.5533133511::e_ksea("ABL1","CAL101",inc) :- e_activity("ABL1","CAL101",inc).
0.2233433245::e_ksea("ABL1","CAL101",inc).
t(0.33,"FYN","CAL101")::e_activity("FYN","CAL101",dec); t(0.33,"FYN","CAL101")::e_activity("FYN","CAL101",inc).
0.5457468908::e_ksea("FYN","CAL101",dec) :- e_activity("FYN","CAL101",dec).
0.001::e_ksea("FYN","CAL101",dec) :- e_activity("FYN","CAL101",inc).
0.2271265546::e_ksea("FYN","CAL101",dec).
t(0.33,"HIPK2","CAL101")::e_activity("HIPK2","CAL101",dec); t(0.33,"HIPK2","CAL101")::e_activity("HIPK2","CAL101",inc).
0.001::e_ksea("HIPK2","CAL101",inc) :- e_activity("HIPK2","CAL101",dec).
0.6970164585::e_ksea("HIPK2","CAL101",inc) :- e_activity("HIPK2","CAL101",inc).
0.1514917707::e_ksea("HIPK2","CAL101",inc).
t(0.33,"PTK2","CAL101")::e_activity("PTK2","CAL101",dec); t(0.33,"PTK2","CAL101")::e_activity("PTK2","CAL101",inc).
0.001::e_ksea("PTK2","CAL101",inc) :- e_activity("PTK2","CAL101",dec).
0.7884556045::e_ksea("PTK2","CAL101",inc) :- e_activity("PTK2","CAL101",inc).
0.1057721978::e_ksea("PTK2","CAL101",inc).
t(0.33,"PTK6","CAL101")::e_activity("PTK6","CAL101",dec); t(0.33,"PTK6","CAL101")::e_activity("PTK6","CAL101",inc).
0.001::e_ksea("PTK6","CAL101",inc) :- e_activity("PTK6","CAL101",dec).
0.5329710766::e_ksea("PTK6","CAL101",inc) :- e_activity("PTK6","CAL101",inc).
0.2335144617::e_ksea("PTK6","CAL101",inc).
t(0.33,"PTPRG","CAL101")::e_activity("PTPRG","CAL101",dec); t(0.33,"PTPRG","CAL101")::e_activity("PTPRG","CAL101",inc).
0.5054407595::e_ksea("PTPRG","CAL101",dec) :- e_activity("PTPRG","CAL101",dec).
0.001::e_ksea("PTPRG","CAL101",dec) :- e_activity("PTPRG","CAL101",inc).
0.2472796203::e_ksea("PTPRG","CAL101",dec).
t(0.33,"PTPRR","CAL101")::e_activity("PTPRR","CAL101",dec); t(0.33,"PTPRR","CAL101")::e_activity("PTPRR","CAL101",inc).
0.537579758::e_ksea("PTPRR","CAL101",dec) :- e_activity("PTPRR","CAL101",dec).
0.001::e_ksea("PTPRR","CAL101",dec) :- e_activity("PTPRR","CAL101",inc).
0.231210121::e_ksea("PTPRR","CAL101",dec).
t(0.33,"SRC","CAL101")::e_activity("SRC","CAL101",dec); t(0.33,"SRC","CAL101")::e_activity("SRC","CAL101",inc).
0.001::e_ksea("SRC","CAL101",inc) :- e_activity("SRC","CAL101",dec).
0.5633476275::e_ksea("SRC","CAL101",inc) :- e_activity("SRC","CAL101",inc).
0.2183261863::e_ksea("SRC","CAL101",inc).
0.001::occ_dec("ABI1(Y213)","CAL101").
t(0.7,"ABL1","ABI1(Y213)")::occ_dec("ABI1(Y213)","CAL101") :- e_activity("ABL1","CAL101",dec).
0.001::occ_inc("ABI1(Y213)","CAL101").
t(0.7,"ABL1","ABI1(Y213)")::occ_inc("ABI1(Y213)","CAL101") :- e_activity("ABL1","CAL101",inc).
t(1.0)::p_occupancy("ABI1(Y213)","CAL101",dec); t(0.0)::p_occupancy("ABI1(Y213)","CAL101",inc) :- occ_dec("ABI1(Y213)","CAL101"), \+occ_inc("ABI1(Y213)","CAL101").
t(0.0)::p_occupancy("ABI1(Y213)","CAL101",dec); t(1.0)::p_occupancy("ABI1(Y213)","CAL101",inc) :- \+occ_dec("ABI1(Y213)","CAL101"), occ_inc("ABI1(Y213)","CAL101").
t(0.5)::p_occupancy("ABI1(Y213)","CAL101",dec); t(0.5)::p_occupancy("ABI1(Y213)","CAL101",inc) :- occ_dec("ABI1(Y213)","CAL101"), occ_inc("ABI1(Y213)","CAL101").
t(0.0)::p_occupancy("ABI1(Y213)","CAL101",dec); t(0.0)::p_occupancy("ABI1(Y213)","CAL101",inc) :- \+occ_dec("ABI1(Y213)","CAL101"), \+occ_inc("ABI1(Y213)","CAL101").
0.8269205648::p_fc("ABI1(Y213)","CAL101",dec) :- p_occupancy("ABI1(Y213)","CAL101",dec).
0.001::p_fc("ABI1(Y213)","CAL101",dec) :- p_occupancy("ABI1(Y213)","CAL101",inc).
0.0865397176::p_fc("ABI1(Y213)","CAL101",dec).
0.001::occ_dec("ANXA2P2(Y24)","CAL101").
t(0.7,"SRC","ANXA2P2(Y24)")::occ_dec("ANXA2P2(Y24)","CAL101") :- e_activity("SRC","CAL101",dec).
0.001::occ_inc("ANXA2P2(Y24)","CAL101").
t(0.7,"SRC","ANXA2P2(Y24)")::occ_inc("ANXA2P2(Y24)","CAL101") :- e_activity("SRC","CAL101",inc).
t(1.0)::p_occupancy("ANXA2P2(Y24)","CAL101",dec); t(0.0)::p_occupancy("ANXA2P2(Y24)","CAL101",inc) :- occ_dec("ANXA2P2(Y24)","CAL101"), \+occ_inc("ANXA2P2(Y24)","CAL101").
t(0.0)::p_occupancy("ANXA2P2(Y24)","CAL101",dec); t(1.0)::p_occupancy("ANXA2P2(Y24)","CAL101",inc) :- \+occ_dec("ANXA2P2(Y24)","CAL101"), occ_inc("ANXA2P2(Y24)","CAL101").
t(0.5)::p_occupancy("ANXA2P2(Y24)","CAL101",dec); t(0.5)::p_occupancy("ANXA2P2(Y24)","CAL101",inc) :- occ_dec("ANXA2P2(Y24)","CAL101"), occ_inc("ANXA2P2(Y24)","CAL101").
t(0.0)::p_occupancy("ANXA2P2(Y24)","CAL101",dec); t(0.0)::p_occupancy("ANXA2P2(Y24)","CAL101",inc) :- \+occ_dec("ANXA2P2(Y24)","CAL101"), \+occ_inc("ANXA2P2(Y24)","CAL101").
0.001::p_fc("ANXA2P2(Y24)","CAL101",inc) :- p_occupancy("ANXA2P2(Y24)","CAL101",dec).
0.9906329125::p_fc("ANXA2P2(Y24)","CAL101",inc) :- p_occupancy("ANXA2P2(Y24)","CAL101",inc).
0.0046835437::p_fc("ANXA2P2(Y24)","CAL101",inc).
0.001::occ_dec("ATF1(S198)","CAL101").
t(0.7,"HIPK2","ATF1(S198)")::occ_dec("ATF1(S198)","CAL101") :- e_activity("HIPK2","CAL101",dec).
0.001::occ_inc("ATF1(S198)","CAL101").
t(0.7,"HIPK2","ATF1(S198)")::occ_inc("ATF1(S198)","CAL101") :- e_activity("HIPK2","CAL101",inc).
t(1.0)::p_occupancy("ATF1(S198)","CAL101",dec); t(0.0)::p_occupancy("ATF1(S198)","CAL101",inc) :- occ_dec("ATF1(S198)","CAL101"), \+occ_inc("ATF1(S198)","CAL101").
t(0.0)::p_occupancy("ATF1(S198)","CAL101",dec); t(1.0)::p_occupancy("ATF1(S198)","CAL101",inc) :- \+occ_dec("ATF1(S198)","CAL101"), occ_inc("ATF1(S198)","CAL101").
t(0.5)::p_occupancy("ATF1(S198)","CAL101",dec); t(0.5)::p_occupancy("ATF1(S198)","CAL101",inc) :- occ_dec("ATF1(S198)","CAL101"), occ_inc("ATF1(S198)","CAL101").
t(0.0)::p_occupancy("ATF1(S198)","CAL101",dec); t(0.0)::p_occupancy("ATF1(S198)","CAL101",inc) :- \+occ_dec("ATF1(S198)","CAL101"), \+occ_inc("ATF1(S198)","CAL101").
0.001::p_fc("ATF1(S198)","CAL101",inc) :- p_occupancy("ATF1(S198)","CAL101",dec).
0.5022339998::p_fc("ATF1(S198)","CAL101",inc) :- p_occupancy("ATF1(S198)","CAL101",inc).
0.2488830001::p_fc("ATF1(S198)","CAL101",inc).
0.001::occ_dec("BCLAF1(Y284)","CAL101").
t(0.7,"SRC","BCLAF1(Y284)")::occ_dec("BCLAF1(Y284)","CAL101") :- e_activity("SRC","CAL101",dec).
0.001::occ_inc("BCLAF1(Y284)","CAL101").
t(0.7,"SRC","BCLAF1(Y284)")::occ_inc("BCLAF1(Y284)","CAL101") :- e_activity("SRC","CAL101",inc).
t(1.0)::p_occupancy("BCLAF1(Y284)","CAL101",dec); t(0.0)::p_occupancy("BCLAF1(Y284)","CAL101",inc) :- occ_dec("BCLAF1(Y284)","CAL101"), \+occ_inc("BCLAF1(Y284)","CAL101").
t(0.0)::p_occupancy("BCLAF1(Y284)","CAL101",dec); t(1.0)::p_occupancy("BCLAF1(Y284)","CAL101",inc) :- \+occ_dec("BCLAF1(Y284)","CAL101"), occ_inc("BCLAF1(Y284)","CAL101").
t(0.5)::p_occupancy("BCLAF1(Y284)","CAL101",dec); t(0.5)::p_occupancy("BCLAF1(Y284)","CAL101",inc) :- occ_dec("BCLAF1(Y284)","CAL101"), occ_inc("BCLAF1(Y284)","CAL101").
t(0.0)::p_occupancy("BCLAF1(Y284)","CAL101",dec); t(0.0)::p_occupancy("BCLAF1(Y284)","CAL101",inc) :- \+occ_dec("BCLAF1(Y284)","CAL101"), \+occ_inc("BCLAF1(Y284)","CAL101").
0.6693221634::p_fc("BCLAF1(Y284)","CAL101",dec) :- p_occupancy("BCLAF1(Y284)","CAL101",dec).
0.001::p_fc("BCLAF1(Y284)","CAL101",dec) :- p_occupancy("BCLAF1(Y284)","CAL101",inc).
0.1653389183::p_fc("BCLAF1(Y284)","CAL101",dec).
0.001::occ_dec("HIPK2(Y361)","CAL101").
0.001::occ_dec("HIPK2(Y361)","CAL101").
t(0.7,"SRC","HIPK2(Y361)")::occ_dec("HIPK2(Y361)","CAL101") :- e_activity("SRC","CAL101",dec).
t(0.7,"HIPK2","HIPK2(Y361)")::occ_dec("HIPK2(Y361)","CAL101") :- e_activity("HIPK2","CAL101",dec).
0.001::occ_inc("HIPK2(Y361)","CAL101").
0.001::occ_inc("HIPK2(Y361)","CAL101").
t(0.7,"SRC","HIPK2(Y361)")::occ_inc("HIPK2(Y361)","CAL101") :- e_activity("SRC","CAL101",inc).
t(0.7,"HIPK2","HIPK2(Y361)")::occ_inc("HIPK2(Y361)","CAL101") :- e_activity("HIPK2","CAL101",inc).
t(1.0)::p_occupancy("HIPK2(Y361)","CAL101",dec); t(0.0)::p_occupancy("HIPK2(Y361)","CAL101",inc) :- occ_dec("HIPK2(Y361)","CAL101"), \+occ_inc("HIPK2(Y361)","CAL101").
t(0.0)::p_occupancy("HIPK2(Y361)","CAL101",dec); t(1.0)::p_occupancy("HIPK2(Y361)","CAL101",inc) :- \+occ_dec("HIPK2(Y361)","CAL101"), occ_inc("HIPK2(Y361)","CAL101").
t(0.5)::p_occupancy("HIPK2(Y361)","CAL101",dec); t(0.5)::p_occupancy("HIPK2(Y361)","CAL101",inc) :- occ_dec("HIPK2(Y361)","CAL101"), occ_inc("HIPK2(Y361)","CAL101").
t(0.0)::p_occupancy("HIPK2(Y361)","CAL101",dec); t(0.0)::p_occupancy("HIPK2(Y361)","CAL101",inc) :- \+occ_dec("HIPK2(Y361)","CAL101"), \+occ_inc("HIPK2(Y361)","CAL101").
0.6540818123::p_fc("HIPK2(Y361)","CAL101",dec) :- p_occupancy("HIPK2(Y361)","CAL101",dec).
0.001::p_fc("HIPK2(Y361)","CAL101",dec) :- p_occupancy("HIPK2(Y361)","CAL101",inc).
0.1729590938::p_fc("HIPK2(Y361)","CAL101",dec).
0.001::occ_dec("PTTG1IP(Y174)","CAL101").
t(0.7,"SRC","PTTG1IP(Y174)")::occ_dec("PTTG1IP(Y174)","CAL101") :- e_activity("SRC","CAL101",dec).
0.001::occ_inc("PTTG1IP(Y174)","CAL101").
t(0.7,"SRC","PTTG1IP(Y174)")::occ_inc("PTTG1IP(Y174)","CAL101") :- e_activity("SRC","CAL101",inc).
t(1.0)::p_occupancy("PTTG1IP(Y174)","CAL101",dec); t(0.0)::p_occupancy("PTTG1IP(Y174)","CAL101",inc) :- occ_dec("PTTG1IP(Y174)","CAL101"), \+occ_inc("PTTG1IP(Y174)","CAL101").
t(0.0)::p_occupancy("PTTG1IP(Y174)","CAL101",dec); t(1.0)::p_occupancy("PTTG1IP(Y174)","CAL101",inc) :- \+occ_dec("PTTG1IP(Y174)","CAL101"), occ_inc("PTTG1IP(Y174)","CAL101").
t(0.5)::p_occupancy("PTTG1IP(Y174)","CAL101",dec); t(0.5)::p_occupancy("PTTG1IP(Y174)","CAL101",inc) :- occ_dec("PTTG1IP(Y174)","CAL101"), occ_inc("PTTG1IP(Y174)","CAL101").
t(0.0)::p_occupancy("PTTG1IP(Y174)","CAL101",dec); t(0.0)::p_occupancy("PTTG1IP(Y174)","CAL101",inc) :- \+occ_dec("PTTG1IP(Y174)","CAL101"), \+occ_inc("PTTG1IP(Y174)","CAL101").
0.61260437::p_fc("PTTG1IP(Y174)","CAL101",dec) :- p_occupancy("PTTG1IP(Y174)","CAL101",dec).
0.001::p_fc("PTTG1IP(Y174)","CAL101",dec) :- p_occupancy("PTTG1IP(Y174)","CAL101",inc).
0.193697815::p_fc("PTTG1IP(Y174)","CAL101",dec).
0.001::occ_dec("PXN(Y118)","CAL101").
0.001::occ_dec("PXN(Y118)","CAL101").
0.001::occ_dec("PXN(Y118)","CAL101").
0.001::occ_dec("PXN(Y118)","CAL101").
0.001::occ_dec("PXN(Y118)","CAL101").
0.001::occ_dec("PXN(Y118)","CAL101").
t(0.7,"SRC","PXN(Y118)")::occ_dec("PXN(Y118)","CAL101") :- e_activity("SRC","CAL101",dec).
t(0.7,"ABL1","PXN(Y118)")::occ_dec("PXN(Y118)","CAL101") :- e_activity("ABL1","CAL101",dec).
t(0.7,"PTK2","PXN(Y118)")::occ_dec("PXN(Y118)","CAL101") :- e_activity("PTK2","CAL101",dec).
t(0.7,"FYN","PXN(Y118)")::occ_dec("PXN(Y118)","CAL101") :- e_activity("FYN","CAL101",dec).
t(0.7,"PTK6","PXN(Y118)")::occ_dec("PXN(Y118)","CAL101") :- e_activity("PTK6","CAL101",dec).
t(0.7,"PTPRG","PXN(Y118)")::occ_dec("PXN(Y118)","CAL101") :- e_activity("PTPRG","CAL101",inc).
0.001::occ_inc("PXN(Y118)","CAL101").
0.001::occ_inc("PXN(Y118)","CAL101").
0.001::occ_inc("PXN(Y118)","CAL101").
0.001::occ_inc("PXN(Y118)","CAL101").
0.001::occ_inc("PXN(Y118)","CAL101").
0.001::occ_inc("PXN(Y118)","CAL101").
t(0.7,"SRC","PXN(Y118)")::occ_inc("PXN(Y118)","CAL101") :- e_activity("SRC","CAL101",inc).
t(0.7,"ABL1","PXN(Y118)")::occ_inc("PXN(Y118)","CAL101") :- e_activity("ABL1","CAL101",inc).
t(0.7,"PTK2","PXN(Y118)")::occ_inc("PXN(Y118)","CAL101") :- e_activity("PTK2","CAL101",inc).
t(0.7,"FYN","PXN(Y118)")::occ_inc("PXN(Y118)","CAL101") :- e_activity("FYN","CAL101",inc).
t(0.7,"PTK6","PXN(Y118)")::occ_inc("PXN(Y118)","CAL101") :- e_activity("PTK6","CAL101",inc).
t(0.7,"PTPRG","PXN(Y118)")::occ_inc("PXN(Y118)","CAL101") :- e_activity("PTPRG","CAL101",dec).
t(1.0)::p_occupancy("PXN(Y118)","CAL101",dec); t(0.0)::p_occupancy("PXN(Y118)","CAL101",inc) :- occ_dec("PXN(Y118)","CAL101"), \+occ_inc("PXN(Y118)","CAL101").
t(0.0)::p_occupancy("PXN(Y118)","CAL101",dec); t(1.0)::p_occupancy("PXN(Y118)","CAL101",inc) :- \+occ_dec("PXN(Y118)","CAL101"), occ_inc("PXN(Y118)","CAL101").
t(0.5)::p_occupancy("PXN(Y118)","CAL101",dec); t(0.5)::p_occupancy("PXN(Y118)","CAL101",inc) :- occ_dec("PXN(Y118)","CAL101"), occ_inc("PXN(Y118)","CAL101").
t(0.0)::p_occupancy("PXN(Y118)","CAL101",dec); t(0.0)::p_occupancy("PXN(Y118)","CAL101",inc) :- \+occ_dec("PXN(Y118)","CAL101"), \+occ_inc("PXN(Y118)","CAL101").
0.5432583316::p_fc("PXN(Y118)","CAL101",dec) :- p_occupancy("PXN(Y118)","CAL101",dec).
0.001::p_fc("PXN(Y118)","CAL101",dec) :- p_occupancy("PXN(Y118)","CAL101",inc).
0.2283708342::p_fc("PXN(Y118)","CAL101",dec).
0.001::occ_dec("PXN(Y88)","CAL101").
0.001::occ_dec("PXN(Y88)","CAL101").
t(0.7,"SRC","PXN(Y88)")::occ_dec("PXN(Y88)","CAL101") :- e_activity("SRC","CAL101",dec).
t(0.7,"PTPRR","PXN(Y88)")::occ_dec("PXN(Y88)","CAL101") :- e_activity("PTPRR","CAL101",inc).
0.001::occ_inc("PXN(Y88)","CAL101").
0.001::occ_inc("PXN(Y88)","CAL101").
t(0.7,"SRC","PXN(Y88)")::occ_inc("PXN(Y88)","CAL101") :- e_activity("SRC","CAL101",inc).
t(0.7,"PTPRR","PXN(Y88)")::occ_inc("PXN(Y88)","CAL101") :- e_activity("PTPRR","CAL101",dec).
t(1.0)::p_occupancy("PXN(Y88)","CAL101",dec); t(0.0)::p_occupancy("PXN(Y88)","CAL101",inc) :- occ_dec("PXN(Y88)","CAL101"), \+occ_inc("PXN(Y88)","CAL101").
t(0.0)::p_occupancy("PXN(Y88)","CAL101",dec); t(1.0)::p_occupancy("PXN(Y88)","CAL101",inc) :- \+occ_dec("PXN(Y88)","CAL101"), occ_inc("PXN(Y88)","CAL101").
t(0.5)::p_occupancy("PXN(Y88)","CAL101",dec); t(0.5)::p_occupancy("PXN(Y88)","CAL101",inc) :- occ_dec("PXN(Y88)","CAL101"), occ_inc("PXN(Y88)","CAL101").
t(0.0)::p_occupancy("PXN(Y88)","CAL101",dec); t(0.0)::p_occupancy("PXN(Y88)","CAL101",inc) :- \+occ_dec("PXN(Y88)","CAL101"), \+occ_inc("PXN(Y88)","CAL101").
0.001::p_fc("PXN(Y88)","CAL101",inc) :- p_occupancy("PXN(Y88)","CAL101",dec).
0.679299127::p_fc("PXN(Y88)","CAL101",inc) :- p_occupancy("PXN(Y88)","CAL101",inc).
0.1603504365::p_fc("PXN(Y88)","CAL101",inc).
0.001::occ_dec("RBM39(Y95)","CAL101").
t(0.7,"ABL1","RBM39(Y95)")::occ_dec("RBM39(Y95)","CAL101") :- e_activity("ABL1","CAL101",dec).
0.001::occ_inc("RBM39(Y95)","CAL101").
t(0.7,"ABL1","RBM39(Y95)")::occ_inc("RBM39(Y95)","CAL101") :- e_activity("ABL1","CAL101",inc).
t(1.0)::p_occupancy("RBM39(Y95)","CAL101",dec); t(0.0)::p_occupancy("RBM39(Y95)","CAL101",inc) :- occ_dec("RBM39(Y95)","CAL101"), \+occ_inc("RBM39(Y95)","CAL101").
t(0.0)::p_occupancy("RBM39(Y95)","CAL101",dec); t(1.0)::p_occupancy("RBM39(Y95)","CAL101",inc) :- \+occ_dec("RBM39(Y95)","CAL101"), occ_inc("RBM39(Y95)","CAL101").
t(0.5)::p_occupancy("RBM39(Y95)","CAL101",dec); t(0.5)::p_occupancy("RBM39(Y95)","CAL101",inc) :- occ_dec("RBM39(Y95)","CAL101"), occ_inc("RBM39(Y95)","CAL101").
t(0.0)::p_occupancy("RBM39(Y95)","CAL101",dec); t(0.0)::p_occupancy("RBM39(Y95)","CAL101",inc) :- \+occ_dec("RBM39(Y95)","CAL101"), \+occ_inc("RBM39(Y95)","CAL101").
0.001::p_fc("RBM39(Y95)","CAL101",inc) :- p_occupancy("RBM39(Y95)","CAL101",dec).
0.7332855245::p_fc("RBM39(Y95)","CAL101",inc) :- p_occupancy("RBM39(Y95)","CAL101",inc).
0.1333572378::p_fc("RBM39(Y95)","CAL101",inc).
evidence(e_ksea("ABL1","CAL101",inc)).
evidence(e_ksea("FYN","CAL101",dec)).
evidence(e_ksea("HIPK2","CAL101",inc)).
evidence(e_ksea("PTK2","CAL101",inc)).
evidence(e_ksea("PTK6","CAL101",inc)).
evidence(e_ksea("PTPRG","CAL101",dec)).
evidence(e_ksea("PTPRR","CAL101",dec)).
evidence(e_ksea("SRC","CAL101",inc)).
evidence(p_fc("ABI1(Y213)","CAL101",dec)).
evidence(p_fc("ANXA2P2(Y24)","CAL101",inc)).
evidence(p_fc("ATF1(S198)","CAL101",inc)).
evidence(p_fc("BCLAF1(Y284)","CAL101",dec)).
evidence(p_fc("HIPK2(Y361)","CAL101",dec)).
evidence(p_fc("PTTG1IP(Y174)","CAL101",dec)).
evidence(p_fc("PXN(Y118)","CAL101",dec)).
evidence(p_fc("PXN(Y88)","CAL101",inc)).
evidence(p_fc("RBM39(Y95)","CAL101",inc)).
