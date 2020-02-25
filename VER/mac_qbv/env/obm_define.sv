`define U_SCATTER pcs_tb_top.UUT.tsn_sw_top.scatter
`define U_OBM(MAC_NUM) pcs_tb_top.UUT.tsn_sw_top.obm_top_``MAC_NUM``
`define OBM_BASE_ADDR(OBM_NUM) (16'hC000 + 16'h100*OBM_NUM)
`define OBM_QUEUE_MAP          16'h0
`define OBM_GATE_ENABLE        16'h40
`define OBM_GATE_STATUS        16'h42
`define ADMIN_BASE_TIME(REG_NUM) (12'h44 + 12'h2*REG_NUM)
`define ADMIN_CYC_TIME(REG_NUM)  (12'h4c + 12'h2*REG_NUM)
`define ADMIN_EXT_TIME(REG_NUM)  (12'h50 + 12'h2*REG_NUM)
`define ADMIN_LIST_ENTRY_LEN     16'h54
`define ADMIN_LIST_ENTRY_CFG     16'h62
`define ADMIN_LIST_ENTRY_DATA(REG_NUM)  (12'h64 + 12'h2*REG_NUM)
`define U_MAC_TX(MAC_NUM) pcs_tb_top.UUT.tsn_sw_top.ge_top_``MAC_NUM``

`define RD_STATUS				 16'hC0
`define STATUS_RD_ADDR           16'hC2
`define STATUS_DATA_H            16'hC4
`define STATUS_DATA_L            16'hC6
`define STATUS_LIST_EMAC_PKT(Q_NUM)  	(16'd0 + Q_NUM)
`define STATUS_LIST_EMAC_BYTE(Q_NUM) 	(16'd8 + Q_NUM)
`define STATUS_LIST_PMAC_PKT(Q_NUM)  	(16'd16 + Q_NUM)
`define STATUS_LIST_PMAC_BYTE(Q_NUM) 	(16'd24 + Q_NUM)
`define STATUS_LIST_RX_PKT(Q_NUM) 		(16'd32 + Q_NUM)
