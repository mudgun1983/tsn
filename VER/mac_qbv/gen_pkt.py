#!/usr/bin/python
# -*- coding: UTF-8 -*-
import os
import re
import sys

def test_data(data):
	tmp_data = data
	while(1):
		if((tmp_data % 2) == 1):
			return 0
			break
		else:
			tmp_data = int((tmp_data / 2))
			if(tmp_data == 2):
				return 1
				break

pkt_len = []
for i in range(64,1500):
	if(test_data(i)):
		print(i)
		pkt_len.append(i)
	else:
		continue
line_data = []
line_data.append("+m_pkt_len=64\n")
line_data.append("+m_pkt_num=3\n")
line_data.append("+m_mac_tx_chk_en=1\n")
line_data.append("+m_cycle_round_num=10\n")
print(line_data)

for i in range(len(pkt_len)):
	log_name = "case_" + "pkt_len_" + str(pkt_len[i]) + "B.cfg"
	print(log_name)
	fo = open(log_name,"w")
	for j in range(len(line_data)):
		if(j == 0):
			new_data = re.sub(r"\d+",str(pkt_len[i]),line_data[j])
			fo.write(new_data)
		else:	
			fo.write(line_data[j])
	fo.close()
