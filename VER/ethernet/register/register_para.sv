`define PHY_PORT_TABLE_CONTENT         reg_config.phy_port_table.table_index
`define LOGIC_PORT_TABLE_CONTENT       reg_config.logic_port_table.table_index
`define L2_PROTOCOL_TABLE_CONTENT      reg_config.l2_protocol_table.table_index
`define IPHB_TABLE_CONTENT             reg_config.iphb_table.table_index
`define IVLAN_XLATE_TABLE_CONTENT      reg_config.ivlan_xlate_table.table_index
`define IVLAN_PROPERTY_TABLE_CONTENT   reg_config.ivlan_property_table.table_index
`define IVLAN_ACTION_TABLE_CONTENT     reg_config.ivlan_action_table.table_index
`define IVLAN_STG_TABLE_CONTENT        reg_config.ivlan_stg_table.table_index
`define L2_MAC_TABLE_CONTENT           reg_config.l2_mac_table.table_index
`define STORM_POLICER_ID_TABLE_CONTENT reg_config.storm_policer_id_table.table_index
`define ING_FLOW_TABLE_CONTENT         reg_config.ing_flow_table.table_index
`define ING_FLOW_PRO_TABLE_CONTENT     reg_config.ing_flow_pro_table.table_index
`define ING_GATE_TABLE_CONTENT         reg_config.ing_gate_table.table_index
`define POLICER_CONF_TABLE_CONTENT     reg_config.policer_conf_table.table_index
`define POLICER_TOKEN_TABLE_CONTENT    reg_config.policer_token_table.table_index
`define FRER_REC_TABLE_CONTENT         reg_config.frer_rec_table.table_index
`define RX_PTP_FORWARD_TABLE_CONTENT   reg_config.rx_ptp_forward_table.table_index
`define OUT_FP_TABLE_CONTENT           reg_config.out_fp_table.table_index
`define L2_MC_TABLE_CONTENT            reg_config.l2_mc_table.table_index
`define TIME_SLOT_TABLE_CONTENT        reg_config.time_slot_table.table_index
`define EVLAN_XLATE_TABLE_CONTENT      reg_config.evlan_xlate_table.table_index
`define EVLAN_ACTION_TABLE_CONTENT     reg_config.evlan_action_table.table_index
`define EVLAN_PROPERTY_TABLE_CONTENT   reg_config.evlan_property_table.table_index
`define EVLAN_STG_TABLE_CONTENT        reg_config.evlan_stg_table.table_index
`define OPORT_PRO_TABLE_CONTENT        reg_config.oport_pro_table.table_index
`define DOT1P_MAP_TABLE_CONTENT        reg_config.dot1p_map_table.table_index
`define LAG_SEL_PORT_TABLE_CONTENT     reg_config.lag_sel_port_table.table_index
`define O_PHY_PORT_PRO_TABLE_CONTENT   reg_config.o_phy_port_pro_table.table_index

`define PP_VER_YEAR	'h0000
`define PP_VER_MONTH_DAY	'h0002
`define PP_VER_HOUR_MIN	'h0004
`define PP_TEST_REG	'h0006	
// PHY_PORT_TABLE	
`define PHY_PORT_TABLE_STATUS	'h0020	
`define PHY_PORT_TABLE_CONTROL	'h0022	
`define PHY_PORT_TABLE_DIN_0	'h0024	
`define PHY_PORT_TABLE_DIN_1	'h0026
`define PHY_PORT_TABLE_DIN_2	'h0028
`define PHY_PORT_TABLE_DIN_3	'h002A
`define PHY_PORT_TABLE_DIN_4	'h002C
`define PHY_PORT_TABLE_DIN_5	'h002E
`define PHY_PORT_TABLE_DIN_6	'h0030
`define PHY_PORT_TABLE_DOUT_0	'h0032	
`define PHY_PORT_TABLE_DOUT_1	'h0034
`define PHY_PORT_TABLE_DOUT_2	'h0036
`define PHY_PORT_TABLE_DOUT_3	'h0038
`define PHY_PORT_TABLE_DOUT_4	'h003A
`define PHY_PORT_TABLE_DOUT_5	'h003C
`define PHY_PORT_TABLE_DOUT_6	'h003E	
// LOGIC_PORT_TABLE	
`define LOGIC_PORT_TABLE_STATUS	 'h0200	
`define LOGIC_PORT_TABLE_CONTROL 'h0202	
`define LOGIC_PORT_TABLE_DIN_0	'h0204	
`define LOGIC_PORT_TABLE_DIN_1	'h0206
`define LOGIC_PORT_TABLE_DIN_2	'h0208
`define LOGIC_PORT_TABLE_DIN_3	'h020A
`define LOGIC_PORT_TABLE_DIN_4	'h020C
`define LOGIC_PORT_TABLE_DIN_5	'h020E
`define LOGIC_PORT_TABLE_DIN_6	'h0210
`define LOGIC_PORT_TABLE_DIN_7	'h0212
`define LOGIC_PORT_TABLE_DOUT_0	'h0214	
`define LOGIC_PORT_TABLE_DOUT_1	'h0216
`define LOGIC_PORT_TABLE_DOUT_2	'h0218
`define LOGIC_PORT_TABLE_DOUT_3	'h021A
`define LOGIC_PORT_TABLE_DOUT_4	'h021C
`define LOGIC_PORT_TABLE_DOUT_5	'h021E
`define LOGIC_PORT_TABLE_DOUT_6	'h0220
`define LOGIC_PORT_TABLE_DOUT_7	'h0222
// L2_PROTOCOL_TABLE	
`define L2_PROTOCOL_TABLE_STATUS	'h0240	
`define L2_PROTOCOL_TABLE_CONTROL	'h0242	
`define L2_PROTOCOL_TABLE_DIN_0	    'h0244	
`define L2_PROTOCOL_TABLE_DIN_1	    'h0246
`define L2_PROTOCOL_TABLE_DOUT_0	'h0248	
`define L2_PROTOCOL_TABLE_DOUT_0	'h024a	
`define PAUSE_PCKT_DROP_EN	'h0400	
`define CRC_ERR_DROP_R_TRIG	'h0402	
`define CRC_ERR_DROP_ROUT_H	'h0404	
`define CRC_ERR_DROP_ROUT_L	'h0406
`define BIND_SA_DROP_R_TRIG	'h0408	
`define BIND_SA_DROP_ROUT_H	'h040A	
`define BIND_SA_DROP_ROUT_L	'h040C
`define L2_CTL_DROP_R_TRIG	'h040E	
`define L2_CTL_DROP_ROUT_H	'h0410	
`define L2_CTL_DROP_ROUT_L	'h0412
`define TPID_REG_0	'h0420
`define TPID_REG_1	'h0422
`define TPID_REG_2	'h0424
`define TPID_REG_3	'h0426	
// IPHB_TABLE	
`define IPHB_TABLE_STATUS	'h0600	
`define IPHB_TABLE_CONTROL	'h0602
`define IPHB_T_CONF_DIN	    'h0604	
`define IPHB_T_CONF_DOUT	'h0606	
// IVLAN_XLATE_TABLE	
`define IVLAN_XLATE_TABLE_STATUS	'h060A	
`define IVLAN_XLATE_TABLE_CONTROL	'h060C
`define IVLAN_XLATE_T_CONF_KEY	    'h060E
`define IVLAN_XLATE_T_CONF_DIN_0	'h0610	
`define IVLAN_XLATE_T_CONF_DIN_1	'h0612
`define IVLAN_XLATE_T_CONF_DOUT_0	'h0614
`define IVLAN_XLATE_T_CONF_DOUT_1	'h0616
`define IVLAN_XLATE_T_CONF_DOUT_2	'h0618
// IVLAN_PROPERTY_TABLE	
`define IVLAN_PROPERTY_TABLE_STATUS	'h0620	
`define IVLAN_PROPERTY_TABLE_CONTROL	'h0622
`define IVLAN_PROPERTY_T_CONF_DIN_0	'h0624
`define IVLAN_PROPERTY_T_CONF_DIN_1	'h0626
`define IVLAN_PROPERTY_T_CONF_DIN_2	'h0628
`define IVLAN_PROPERTY_T_CONF_DIN_3	'h062A
`define IVLAN_PROPERTY_T_CONF_DOUT_0	'h062C
`define IVLAN_PROPERTY_T_CONF_DOUT_1	'h062E
`define IVLAN_PROPERTY_T_CONF_DOUT_2	'h0630
`define IVLAN_PROPERTY_T_CONF_DOUT_3	'h0632
// IVLAN_ACTION_TABLE	
`define IVLAN_ACTION_TABLE_STATUS	'h0640	
`define IVLAN_ACTION_TABLE_CONTROL	'h0642
`define IVLAN_ACTION_T_CONF_DIN_0	'h0644
`define IVLAN_ACTION_T_CONF_DIN_1	'h0646
`define IVLAN_ACTION_T_CONF_DOUT_0	'h0648
`define IVLAN_ACTION_T_CONF_DOUT_1	'h064A
// IVLAN_STG_TABLE	
`define IVLAN_STG_TABLE_STATUS	'h0660	
`define IVLAN_STG_TABLE_CONTROL	'h0662	
`define ISTG_T_CONF_DIN_0	    'h0664
`define ISTG_T_CONF_DIN_1	    'h0666
`define ISTG_T_CONF_DIN_2	    'h0668
`define ISTG_T_CONF_DIN_3	    'h066A
`define ISTG_T_CONF_DOUT_0	'h066C
`define ISTG_T_CONF_DOUT_1	'h066E
`define ISTG_T_CONF_DOUT_2	'h0670
`define ISTG_T_CONF_DOUT_3	'h0672
`define VT_MISS_DROP_R_TRIG	'h0680
`define VT_MISS_DROP_ROUT_H	'h0682	
`define VT_MISS_DROP_ROUT_L	'h0684
`define VLAN_FILTER_DROP_R_TRIG	'h0686	
`define VLAN_FILTER_DROP_ROUT_H	'h0688
`define VLAN_FILTER_DROP_ROUT_1	'h068A
`define STP_DROP_R_TRIG	'h068C
`define STP_DROP_ROUT_H	'h068E
`define STP_DROP_ROUT_L	'h0690
// L2_MAC_TABLE	
`define L2_MAC_TABLE_STATUS	'h0800
`define L2_MAC_TABLE_CONTROL	'h0802
`define L2M_T_CONF_KEY_0	'h0804
`define L2M_T_CONF_KEY_1	'h0806
`define L2M_T_CONF_KEY_2	'h0808
`define L2M_T_CONF_DIN_0	'h080A	
`define L2M_T_CONF_DIN_1	'h080C
`define L2M_T_CONF_DOUT_0	'h080E
`define L2M_T_CONF_DOUT_1	'h0810
`define L2M_T_CONF_DOUT_2	'h0812
`define L2M_T_CONF_DOUT_3	'h0814
`define L2M_T_CONF_DOUT_4	'h0816
`define L2MT_AGE_TIMER_H	'h0818	
`define L2MT_AGE_TIMER_L	'h081A
`define IP_BIND_DROP_R_TRIG	'h0820	
`define IP_BIND_DROP_ROUT_H	'h0822	
`define IP_BIND_DROP_ROUT_L	'h0824	
`define L2_SRC_DROP_R_TRIG	'h0826	
`define L2_SRC_DROP_ROUT_H	'h0828	
`define L2_SRC_DROP_ROUT_L	'h082A	
`define L2_DST_DROP_R_TRIG	'h082C	
`define L2_DST_DROP_ROUT_H	'h082E
`define L2_DST_DROP_ROUT_L	'h0830
`define STORM_POLICER_ID_TABLE	
`define STORM_POLICER_ID_TABLE_STATUS	'h0A00	
`define STORM_POLICER_ID_TABLE_CONTROL	'h0A02	
`define STORM_PID_T_CONF_DIN_0	        'h0A04	
`define STORM_PID_T_CONF_DIN_1	        'h0A06
`define STORM_PID_T_CONF_DOUT_0	        'h0A08	
`define STORM_PID_T_CONF_DOUT_1	        'h0A0A
//ING_FLOW_TABLE	
`define ING_FLOW_TABLE_STATUS	'h0A20
`define ING_FLOW_TABLE_CONTROL	'h0A22	
`define ING_FLOW_T_CONF_KEY_0	'h0A24
`define ING_FLOW_T_CONF_KEY_1	'h0A26
`define ING_FLOW_T_CONF_KEY_2	'h0A28
`define ING_FLOW_T_CONF_KEY_3	'h0A2A
`define ING_FLOW_T_CONF_DIN	    'h0A2C	
`define ING_FLOW_T_CONF_DOUT_0	'h0A2E
`define ING_FLOW_T_CONF_DOUT_1	'h0A30
`define ING_FLOW_T_CONF_DOUT_2	'h0A32
`define ING_FLOW_T_CONF_DOUT_3	'h0A34
`define ING_FLOW_T_CONF_DOUT_4	'h0A36
// ING_FLOW_PRO_TABLE	
`define ING_FLOW_PRO_TABLE_STATUS	'h0A40	
`define ING_FLOW_PRO_TABLE_CONTROL	'h0A42	
`define ING_FLOW_PRO_T_CONF_DIN_0	'h0A44	
`define ING_FLOW_PRO_T_CONF_DIN_2	'h0A46
`define ING_FLOW_PRO_T_CONF_DOUT_0	'h0A48	
`define ING_FLOW_PRO_T_CONF_DOUT_1	'h0A4A
// ING_GATE_TABLE	
`define ING_GATE_TABLE_STATUS	'h0A60	
`define ING_GATE_TABLE_CONTROL	'h0A62	
`define ING_GATE_T_CONF_DIN_0	'h0A64	
`define ING_GATE_T_CONF_DIN_1	'h0A66
`define ING_GATE_T_CONF_DOUT_0	'h0A68	
`define ING_GATE_T_CONF_DOUT_1	'h0A6A
//`define POLICER_CONF_TABLE	
`define POLICER_CONF_TABLE_STATUS	'h0A80
`define POLICER_CONF_TABLE_CONTROL	'h0A82	
`define POLICER_C_T_CONF_DIN_0	    'h0A84	
`define POLICER_C_T_CONF_DIN_1	    'h0A86
`define POLICER_C_T_CONF_DIN_2	    'h0A88
`define POLICER_C_T_CONF_DOUT_0	'h0A8A	
`define POLICER_C_T_CONF_DOUT_1	'h0A8C
`define POLICER_C_T_CONF_DOUT_2	'h0A8E
`define POLICER_TIMER_REG	'h0A90
// POLICER_TOKEN_TABLE	
`define POLICER_TOKEN_TABLE_STATUS	'h0AA0	
`define POLICER_TOKEN_TABLE_CONTROL	'h0AA2
`define POLICER_TOKEN_T_CONF_DIN_0	'h0AA4
`define POLICER_TOKEN_T_CONF_DIN_1	'h0AA6
`define POLICER_TOKEN_T_CONF_DOUT_0	'h0AA8
`define POLICER_TOKEN_T_CONF_DOUT_1	'h0AAA
`define ING_GATE_DROP_R_TRIG	'h0AC0	
`define ING_GATE_DROP_ROUT_H	'h0AC2	
`define ING_GATE_DROP_ROUT_L	'h0AC4
`define ING_POLICER_DROP_R_TRIG	'h0AC6	
`define ING_POLICER_DROP_ROUT_H	'h0AC8	
`define ING_POLICER_DROP_ROUT_L	'h0ACA	
// TIME_SLOT_RAM	
`define TIME_SLOT_RAM_STATUS	'h0AE0	
`define TIME_SLOT_RAM_CONTROL	'h0AE2	
`define CONF_SLOT_RAM_WDATA_0	'h0AE4
`define CONF_SLOT_RAM_WDATA_1	'h0AE6
`define CONF_SLOT_RAM_RDATA_0	'h0AE8
`define CONF_SLOT_RAM_RDATA_1	'h0AEA
`define ADMIN_BASE_TIME_0	'h0AEC
`define ADMIN_BASE_TIME_1	'h0AEE
`define ADMIN_BASE_TIME_2	'h0AF0
`define ADMIN_BASE_TIME_3	'h0AF2	
`define ADMIN_CYCLE_TIME_0	'h0AF4
`define ADMIN_CYCLE_TIME_1	'h0AF6
`define ADMIN_CYCLE_TIME_2	'h0AF8
`define ADMIN_CYCLE_TIME_3	'h0AFA	
`define ADMIN_SLOT_NUM	'h0AFC	
`define TIME_SLOT_CONF_CONTROL_STATUS	'h0AFE	
`define OPER_BASE_TIME_0	'h0B00
`define OPER_BASE_TIME_1	'h0B02
`define OPER_BASE_TIME_2	'h0B04
`define OPER_BASE_TIME_3	'h0B06
`define OPER_CYCLE_TIME_0	'h0B08
`define OPER_CYCLE_TIME_1	'h0B0A
`define OPER_CYCLE_TIME_2	'h0B0C
`define OPER_CYCLE_TIME_3	'h0B0E
`define OPER_SLOT_NUM	'h0B10
// FRER_REC_TABLE	
`define FRER_REC_TABLE_STATUS	'h0C00	
`define FRER_REC_TABLE_CONTROL	'h0C02	
`define FRER_REC_T_CONF_DIN_0	'h0C04
`define FRER_REC_T_CONF_DIN_1	'h0C06
`define FRER_REC_T_CONF_DIN_2	'h0C08
`define FRER_REC_T_CONF_DIN_3	'h0C0A
`define FRER_REC_T_CONF_DIN_4	'h0C0C
`define FRER_REC_T_CONF_DIN_5	'h0C0E
`define FRER_REC_T_CONF_DIN_6	'h0C10
`define FRER_REC_T_CONF_DIN_7	'h0C12
`define FRER_REC_T_CONF_DIN_8	'h0C14
`define FRER_REC_T_CONF_DOUT_0	'h0C16
`define FRER_REC_T_CONF_DOUT_1	'h0C18
`define FRER_REC_T_CONF_DOUT_2	'h0C1A
`define FRER_REC_T_CONF_DOUT_3	'h0C1C
`define FRER_REC_T_CONF_DOUT_4	'h0C1E
`define FRER_REC_T_CONF_DOUT_5	'h0C20
`define FRER_REC_T_CONF_DOUT_6	'h0C22
`define FRER_REC_T_CONF_DOUT_7	'h0C24
`define FRER_REC_T_CONF_DOUT_8	'h0C26
`define FRER_AGE_TIMER	'h0C2A
`define RTAG_ETYPE	'h0C40
`define FRER_REC_DROP_R_TRIG	'h0C42	
`define FRER_REC_DROP_ROUT_H	'h0C44	
`define FRER_REC_DROP_ROUT_L	'h0C46	
//`define RX_PTP_FORWARD_TABLE	
`define RX_PTP_FORWARD_TABLE_STATUS	'h0E00
`define RX_PTP_FORWARD_TABLE_CONTROL	'h0E02	
`define RX_PTP_FORWARD_T_CONF_DIN_0	'h0E04	
`define RX_PTP_FORWARD_T_CONF_DIN_1	'h0E06
`define RX_PTP_FORWARD_T_CONF_DIN_2	'h0E08
`define RX_PTP_FORWARD_T_CONF_DOUT_0	'h0E0A	
`define RX_PTP_FORWARD_T_CONF_DOUT_1	'h0E0C
`define RX_PTP_FORWARD_T_CONF_DOUT_2	'h0E0E	
`define CPU_PORT_CFG	'h0E20	
`define HWE_PORT_CFG	'h0E22	
// OUT_FP_TABLE	
`define OUT_FP_TABLE_STATUS	'h1000
`define OUT_FP_TABLE_CONTROL	'h1002	
`define OUT_FP_T_CONF_DIN_0	'h1004	
`define OUT_FP_T_CONF_DIN_1	'h1006
`define OUT_FP_T_CONF_DIN_2	'h1008
`define OUT_FP_T_CONF_DIN_3	'h100A
`define OUT_FP_T_CONF_DIN_4	'h100C
`define OUT_FP_T_CONF_DOUT_0	'h100E	
`define OUT_FP_T_CONF_DOUT_1	'h1010
`define OUT_FP_T_CONF_DOUT_2	'h1012
`define OUT_FP_T_CONF_DOUT_3	'h1014
`define OUT_FP_T_CONF_DOUT_4	'h1016
// L2_MC_TABLE	
`define L2_MC_TABLE_STATUS	'h1020
`define L2_MC_TABLE_CONTROL	'h1022
`define L2_MC_T_CONF_DIN_0	'h1024	
`define L2_MC_T_CONF_DIN_1	'h1026
`define L2_MC_T_CONF_DIN_2	'h1028
`define L2_MC_T_CONF_DOUT_0	'h102A	
`define L2_MC_T_CONF_DOUT_1	'h102C
`define L2_MC_T_CONF_DOUT_2	'h102E
`define RX_BC_DROP_R_TRIG	'h1040
`define RX_BC_DROP_ROUT_H	'h1042
`define RX_BC_DROP_ROUT_L	'h1044
`define RX_UC_DROP_R_TRIG	'h1046	
`define RX_UC_DROP_ROUT_H	'h1048	
`define RX_UC_DROP_ROUT_L	'h104A
`define RX_KMC_DROP_R_TRIG	'h104C	
`define RX_KMC_DROP_ROUT_H	'h104E
`define RX_KMC_DROP_ROUT_L	'h1050
`define RX_UMC_DROP_R_TRIG	'h1052	
`define RX_UMC_DROP_ROUT_H	'h1054	
`define RX_UMC_DROP_ROUT_L	'h1056
`define RX_DVP_DROP_R_TRIG	'h1058	
`define RX_DVP_DROP_ROUT_H	'h105A	
`define RX_DVP_DROP_ROUT_L	'h105C

//EVLAN_XLATE_TABLE	
`define EVLAN_XLATE_TABLE_STATUS	'h0020
`define EVLAN_XLATE_TABLE_CONTROL	'h0022
`define EVLAN_XLATE_T_CONF_KEY	    'h0024
`define EVLAN_XLATE_T_DIN_0	        'h0026
`define EVLAN_XLATE_T_DIN_1	        'h0028
`define EVLAN_XLATE_T_DOUT_0	'h002A
`define EVLAN_XLATE_T_DOUT_1	'h002C
`define EVLAN_XLATE_T_DOUT_2	'h002E	
// EVLAN_ACTION_TABLE	
`define EVLAN_ACTION_TABLE_STATUS	'h0040
`define EVLAN_ACTION_TABLE_CONTROL	'h0042
`define EVLAN_ACTION_T_CONF_DIN_0	'h0044	
`define EVLAN_ACTION_T_CONF_DIN_1	'h0046
`define EVLAN_ACTION_T_CONF_DOUT_0	'h0048	
`define EVLAN_ACTION_T_CONF_DOUT_1	'h004A
//`define EVLAN_PROPERTY_TABLE	
`define EVLAN_PROPERTY_TABLE_STATUS	'h0060
`define EVLAN_PROPERTY_TABLE_CONTROL	'h0062
`define EVLAN_PROPERTY_T_CONF_DIN_0	'h0064	
`define EVLAN_PROPERTY_T_CONF_DIN_1	'h0066
`define EVLAN_PROPERTY_T_CONF_DIN_2	'h0068
`define EVLAN_PROPERTY_T_CONF_DIN_3	'h006A
`define EVLAN_PROPERTY_T_CONF_DOUT_0	'h006C	
`define EVLAN_PROPERTY_T_CONF_DOUT_1	'h006E
`define EVLAN_PROPERTY_T_CONF_DOUT_2	'h0070
`define EVLAN_PROPERTY_T_CONF_DOUT_3	'h0072	
// EVLAN_STG_TABLE	
`define EVLAN_STG_TABLE_STATUS	'h0080
`define EVLAN_STG_TABLE_CONTROL	'h0082
`define ESTG_T_CONF_DIN_0	    'h0084
`define ESTG_T_CONF_DIN_1	    'h0086
`define ESTG_T_CONF_DIN_2	    'h0088
`define ESTG_T_CONF_DIN_3	    'h008A
`define ESTG_T_CONF_DOUT_0	'h008C
`define ESTG_T_CONF_DOUT_1	'h008E
`define ESTG_T_CONF_DOUT_2	'h0090
`define ESTG_T_CONF_DOUT_3	'h0092	
`define EPP_IN_DROP_R_TRIG	'h00A0	
`define EPP_IN_DROP_ROUT_H	'h00A2	
`define EPP_IN_DROP_ROUT_L	'h00A4
`define STP_OUT_DROP_R_TRIG	'h00A6	
`define STP_OUT_DROP_ROUT_H	'h00A8	
`define STP_OUT_DROP_ROUT_L	'h00AA
// OPORT_PRO_TABLE	
`define OPORT_PRO_TABLE_STATUS	'h0200
`define OPORT_PRO_TABLE_CONTROL	'h0202
`define OPORT_PRO_TABLE_DIN_0	'h0204	
`define OPORT_PRO_TABLE_DIN_1	'h0206
`define OPORT_PRO_TABLE_DOUT_0	'h0208	
`define OPORT_PRO_TABLE_DOUT_1	'h020A
// DOT1P_MAP_TABLE	
`define DOT1P_MAP_TABLE_STATUS	'h0220
`define DOT1P_MAP_TABLE_CONTROL	'h0222
`define DOT1P_MAP_T_DIN_0	    'h0224	
`define DOT1P_MAP_T_DIN_1	    'h0226
`define DOT1P_MAP_T_DOUT_0	    'h0228	
`define DOT1P_MAP_T_DOUT_0	    'h022a	
// LAG_SEL_PORT_TABLE	
`define LAG_SEL_PORT_TABLE_STATUS	'h0240
`define LAG_SEL_PORT_TABLE_CONTROL	'h0242
`define LAG_SEL_PORT_T_CONF_DIN_0	'h0244	
`define LAG_SEL_PORT_T_CONF_DIN_1	'h0246
`define LAG_SEL_PORT_T_CONF_DOUT_0	'h0248	
`define LAG_SEL_PORT_T_CONF_DOUT_1	'h024A	
// O_PHY_PORT_PRO_TABLE	
`define O_PHY_PORT_PRO_TABLE_STATUS	'h0260
`define O_PHY_PORT_PRO_TABLE_CONTROL	'h0262
`define O_PHY_PORT_PRO_T_CONF_DIN_0	'h0264	
`define O_PHY_PORT_PRO_T_CONF_DIN_1	'h0266
`define O_PHY_PORT_PRO_T_CONF_DIN_2	'h0268
`define O_PHY_PORT_PRO_T_CONF_DIN_3	'h026A
`define O_PHY_PORT_PRO_T_CONF_DIN_4	'h026C
`define O_PHY_PORT_PRO_T_CONF_DIN_5	'h026E
`define O_PHY_PORT_PRO_T_CONF_DIN_6	'h0270
`define O_PHY_PORT_PRO_T_CONF_DIN_7	'h0272
`define O_PHY_PORT_PRO_T_CONF_DOUT_0	'h0274	
`define O_PHY_PORT_PRO_T_CONF_DOUT_1	'h0276
`define O_PHY_PORT_PRO_T_CONF_DOUT_2	'h0278
`define O_PHY_PORT_PRO_T_CONF_DOUT_3	'h027A
`define O_PHY_PORT_PRO_T_CONF_DOUT_4	'h027C
`define O_PHY_PORT_PRO_T_CONF_DOUT_5	'h027E
`define O_PHY_PORT_PRO_T_CONF_DOUT_6	'h0280
`define O_PHY_PORT_PRO_T_CONF_DOUT_7	'h0282	
`define E_FILTER_DROP_R_TRIG	'h02A0	
`define IP_BIND_DROP_ROUT_H	'h02A2	
`define IP_BIND_DROP_ROUT_L	'h02A4