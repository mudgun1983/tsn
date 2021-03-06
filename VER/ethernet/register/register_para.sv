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
`define GATHER_INIT_TABLE_CONTENT      reg_config.gather_init_table.table_index
`define PTP_CONFIG_CONTENT             reg_config.ptp_config.table_index
`define OBM_CONFIG_CONTENT             reg_config.obm_content_table.table_index
`define MAC_CONFIG_CONTENT             reg_config.mac_config_table.table_index
`define CB_CONFIG_CONTENT              reg_config.cb_content_table.table_index

`define PHY_PORT_TABLE          reg_config.phy_port_table 
`define LOGIC_PORT_TABLE        reg_config.logic_port_table 
`define L2_PROTOCOL_TABLE       reg_config.l2_protocol_table 
`define IPHB_TABLE              reg_config.iphb_table 
`define IVLAN_XLATE_TABLE       reg_config.ivlan_xlate_table 
`define IVLAN_PROPERTY_TABLE    reg_config.ivlan_property_table 
`define IVLAN_ACTION_TABLE      reg_config.ivlan_action_table 
`define IVLAN_STG_TABLE         reg_config.ivlan_stg_table 
`define L2_MAC_TABLE            reg_config.l2_mac_table 
`define STORM_POLICER_ID_TABLE  reg_config.storm_policer_id_table 
`define ING_FLOW_TABLE          reg_config.ing_flow_table 
`define ING_FLOW_PRO_TABLE      reg_config.ing_flow_pro_table 
`define ING_GATE_TABLE          reg_config.ing_gate_table 
`define POLICER_CONF_TABLE      reg_config.policer_conf_table 
`define POLICER_TOKEN_TABLE     reg_config.policer_token_table 
`define FRER_REC_TABLE          reg_config.frer_rec_table 
`define RX_PTP_FORWARD_TABLE    reg_config.rx_ptp_forward_table 
`define OUT_FP_TABLE            reg_config.out_fp_table 
`define L2_MC_TABLE             reg_config.l2_mc_table 
`define TIME_SLOT_TABLE         reg_config.time_slot_table 
`define EVLAN_XLATE_TABLE       reg_config.evlan_xlate_table 
`define EVLAN_ACTION_TABLE      reg_config.evlan_action_table 
`define EVLAN_PROPERTY_TABLE    reg_config.evlan_property_table 
`define EVLAN_STG_TABLE         reg_config.evlan_stg_table 
`define OPORT_PRO_TABLE         reg_config.oport_pro_table 
`define DOT1P_MAP_TABLE         reg_config.dot1p_map_table 
`define LAG_SEL_PORT_TABLE      reg_config.lag_sel_port_table 
`define O_PHY_PORT_PRO_TABLE    reg_config.o_phy_port_pro_table 
`define GATHER_INIT_TABLE       reg_config.gather_init_table 
`define PTP_CONFIG              reg_config.ptp_config 
`define OBM_CONFIG              reg_config.obm_content_table 
`define MAC_CONFIG              reg_config.mac_config_table 
`define CB_CONFIG               reg_config.cb_content_table 

`define   SUB sub_
`define   SUB_PTP_CONFIG_CONTENT             `SUB```PTP_CONFIG_CONTENT
`define   SUB_PTP_CONFIG                     `SUB```PTP_CONFIG 
`define   SUB_PHY_PORT_TABLE                 `SUB```PHY_PORT_TABLE
`define   SUB_PHY_PORT_TABLE_CONTENT         `SUB```PHY_PORT_TABLE_CONTENT
`define   SUB_RX_PTP_FORWARD_TABLE           `SUB```RX_PTP_FORWARD_TABLE
`define   SUB_RX_PTP_FORWARD_TABLE_CONTENT   `SUB```RX_PTP_FORWARD_TABLE_CONTENT
`define   SUB_O_PHY_PORT_PRO_TABLE           `SUB```O_PHY_PORT_PRO_TABLE
`define   SUB_O_PHY_PORT_PRO_TABLE_CONTENT   `SUB```O_PHY_PORT_PRO_TABLE_CONTENT
`define   SUB_CPU_ADDR                       32'h8000_0000
  
`define BASE_OFFSET          16'b0000_0000_0000_0000
`define BASE_OFFSET_GATHER   16'b0011_0000_0000_0000
`define BASE_OFFSET_PTP      16'b0001_1101_0000_0000  //1d00
`define BASE_OFFSET_XGE_0    16'h2000  
`define BASE_OFFSET_XGE_1    16'h2200  
`define BASE_OFFSET_GE_2     16'h2400  
`define BASE_OFFSET_GE_3     16'h2600  
`define BASE_OFFSET_GE_4     16'h2800  
`define BASE_OFFSET_GE_5     16'h2a00  
`define BASE_OFFSET_GE_6     16'h2c00  
`define BASE_OFFSET_GE_7     16'h2e00  
`define BASE_OFFSET_GE_8     16'h3000  
`define BASE_OFFSET_GE_9     16'h3200  
`define BASE_OFFSET_GE_29    16'b0101_1010_0000_0000  //5a00
`define BASE_OFFSET_IPP      16'b1000_0000_0000_0000  //8000
`define BASE_OFFSET_EPP      16'b1010_0000_0000_0000  //a000
`define BASE_OFFSET_OBUF_0   16'hC000  
`define BASE_OFFSET_OBUF_1   16'hC100
`define BASE_OFFSET_OBUF_2   16'hC200
`define BASE_OFFSET_OBUF_3   16'hC300
`define BASE_OFFSET_OBUF_4   16'hC400
`define BASE_OFFSET_OBUF_5   16'hC500
`define BASE_OFFSET_OBUF_6   16'hC600
`define BASE_OFFSET_OBUF_7   16'hC700
`define BASE_OFFSET_OBUF_8   16'hC800
`define BASE_OFFSET_OBUF_9   16'hC900
//IPP
`define PP_VER_YEAR	        (`BASE_OFFSET_IPP+'h0000)
`define PP_VER_MONTH_DAY	(`BASE_OFFSET_IPP+'h0002)
`define PP_VER_HOUR_MIN	    (`BASE_OFFSET_IPP+'h0004)
`define PP_TEST_REG	        (`BASE_OFFSET_IPP+'h0006)	
`define AGE_COUNTER_UNIT_H	(`BASE_OFFSET_IPP+'h000A)
`define AGE_COUNTER_UNIT_L	(`BASE_OFFSET_IPP+'h000C)

// PHY_PORT_TABLE	
`define PHY_PORT_TABLE_STATUS	(`BASE_OFFSET_IPP+'h0020)	
`define PHY_PORT_TABLE_CONTROL	(`BASE_OFFSET_IPP+'h0022)	
`define PHY_PORT_TABLE_DIN_0	(`BASE_OFFSET_IPP+'h0024)	
`define PHY_PORT_TABLE_DIN_1	(`BASE_OFFSET_IPP+'h0026)
`define PHY_PORT_TABLE_DIN_2	(`BASE_OFFSET_IPP+'h0028)
`define PHY_PORT_TABLE_DIN_3	(`BASE_OFFSET_IPP+'h002A)
`define PHY_PORT_TABLE_DIN_4	(`BASE_OFFSET_IPP+'h002C)
`define PHY_PORT_TABLE_DIN_5	(`BASE_OFFSET_IPP+'h002E)
`define PHY_PORT_TABLE_DIN_6	(`BASE_OFFSET_IPP+'h0030)
`define PHY_PORT_TABLE_DOUT_0	(`BASE_OFFSET_IPP+'h0032)	
`define PHY_PORT_TABLE_DOUT_1	(`BASE_OFFSET_IPP+'h0034)
`define PHY_PORT_TABLE_DOUT_2	(`BASE_OFFSET_IPP+'h0036)
`define PHY_PORT_TABLE_DOUT_3	(`BASE_OFFSET_IPP+'h0038)
`define PHY_PORT_TABLE_DOUT_4	(`BASE_OFFSET_IPP+'h003A)
`define PHY_PORT_TABLE_DOUT_5	(`BASE_OFFSET_IPP+'h003C)
`define PHY_PORT_TABLE_DOUT_6	(`BASE_OFFSET_IPP+'h003E)	
// LOGIC_PORT_TABLE	
`define LOGIC_PORT_TABLE_STATUS	 (`BASE_OFFSET_IPP+'h0200)	
`define LOGIC_PORT_TABLE_CONTROL (`BASE_OFFSET_IPP+'h0202)	
`define LOGIC_PORT_TABLE_DIN_0	 (`BASE_OFFSET_IPP+'h0204)	
`define LOGIC_PORT_TABLE_DIN_1	 (`BASE_OFFSET_IPP+'h0206)
`define LOGIC_PORT_TABLE_DIN_2	 (`BASE_OFFSET_IPP+'h0208)
`define LOGIC_PORT_TABLE_DIN_3	 (`BASE_OFFSET_IPP+'h020A)
`define LOGIC_PORT_TABLE_DIN_4	 (`BASE_OFFSET_IPP+'h020C)
`define LOGIC_PORT_TABLE_DIN_5	 (`BASE_OFFSET_IPP+'h020E)
`define LOGIC_PORT_TABLE_DIN_6	 (`BASE_OFFSET_IPP+'h0210)
`define LOGIC_PORT_TABLE_DIN_7	 (`BASE_OFFSET_IPP+'h0212)
`define LOGIC_PORT_TABLE_DOUT_0	 (`BASE_OFFSET_IPP+'h0214)	
`define LOGIC_PORT_TABLE_DOUT_1	 (`BASE_OFFSET_IPP+'h0216)
`define LOGIC_PORT_TABLE_DOUT_2	 (`BASE_OFFSET_IPP+'h0218)
`define LOGIC_PORT_TABLE_DOUT_3	 (`BASE_OFFSET_IPP+'h021A)
`define LOGIC_PORT_TABLE_DOUT_4	 (`BASE_OFFSET_IPP+'h021C)
`define LOGIC_PORT_TABLE_DOUT_5	 (`BASE_OFFSET_IPP+'h021E)
`define LOGIC_PORT_TABLE_DOUT_6	 (`BASE_OFFSET_IPP+'h0220)
`define LOGIC_PORT_TABLE_DOUT_7	 (`BASE_OFFSET_IPP+'h0222)
// L2_PROTOCOL_TABLE	
`define L2_PROTOCOL_TABLE_STATUS	(`BASE_OFFSET_IPP+'h0240)	
`define L2_PROTOCOL_TABLE_CONTROL	(`BASE_OFFSET_IPP+'h0242)	
`define L2_PROTOCOL_TABLE_DIN_0	    (`BASE_OFFSET_IPP+'h0244)	
`define L2_PROTOCOL_TABLE_DIN_1	    (`BASE_OFFSET_IPP+'h0246)
`define L2_PROTOCOL_TABLE_DOUT_0	(`BASE_OFFSET_IPP+'h0248)	
`define L2_PROTOCOL_TABLE_DOUT_1	(`BASE_OFFSET_IPP+'h024a)	
`define GLOBAL_PCKT_DROP_EN	        (`BASE_OFFSET_IPP+'h0400)	
`define CRC_ERR_DROP_R_TRIG	        (`BASE_OFFSET_IPP+'h0402)	
`define CRC_ERR_DROP_ROUT_H	        (`BASE_OFFSET_IPP+'h0404)	
`define CRC_ERR_DROP_ROUT_L	        (`BASE_OFFSET_IPP+'h0406)
`define BIND_SA_DROP_R_TRIG	        (`BASE_OFFSET_IPP+'h0408)	
`define BIND_SA_DROP_ROUT_H	        (`BASE_OFFSET_IPP+'h040A)	
`define BIND_SA_DROP_ROUT_L	        (`BASE_OFFSET_IPP+'h040C)
`define L2_CTL_DROP_R_TRIG	        (`BASE_OFFSET_IPP+'h040E)	
`define L2_CTL_DROP_ROUT_H	        (`BASE_OFFSET_IPP+'h0410)	
`define L2_CTL_DROP_ROUT_L	        (`BASE_OFFSET_IPP+'h0412)
`define TPID_REG_0	                (`BASE_OFFSET_IPP+'h0420)
`define TPID_REG_1	                (`BASE_OFFSET_IPP+'h0422)
`define TPID_REG_2	                (`BASE_OFFSET_IPP+'h0424)
`define TPID_REG_3	                (`BASE_OFFSET_IPP+'h0426)	
// IPHB_TABLE	
`define IPHB_TABLE_STATUS	(`BASE_OFFSET_IPP+'h0600)	
`define IPHB_TABLE_CONTROL	(`BASE_OFFSET_IPP+'h0602)
`define IPHB_T_CONF_DIN	    (`BASE_OFFSET_IPP+'h0604)	
`define IPHB_T_CONF_DOUT	(`BASE_OFFSET_IPP+'h0606)	
// IVLAN_XLATE_TABLE	
`define IVLAN_XLATE_TABLE_STATUS	(`BASE_OFFSET_IPP+'h060A)	
`define IVLAN_XLATE_TABLE_CONTROL	(`BASE_OFFSET_IPP+'h060C)
`define IVLAN_XLATE_T_CONF_KEY	    (`BASE_OFFSET_IPP+'h060E)
`define IVLAN_XLATE_T_CONF_DIN_0	(`BASE_OFFSET_IPP+'h0610)	
`define IVLAN_XLATE_T_CONF_DIN_1	(`BASE_OFFSET_IPP+'h0612)
`define IVLAN_XLATE_T_CONF_DOUT_0	(`BASE_OFFSET_IPP+'h0614)
`define IVLAN_XLATE_T_CONF_DOUT_1	(`BASE_OFFSET_IPP+'h0616)
`define IVLAN_XLATE_T_CONF_DOUT_2	(`BASE_OFFSET_IPP+'h0618)
// IVLAN_PROPERTY_TABLE	
`define IVLAN_PROPERTY_TABLE_STATUS	    (`BASE_OFFSET_IPP+'h0620)	
`define IVLAN_PROPERTY_TABLE_CONTROL	(`BASE_OFFSET_IPP+'h0622)
`define IVLAN_PROPERTY_T_CONF_DIN_0	    (`BASE_OFFSET_IPP+'h0624)
`define IVLAN_PROPERTY_T_CONF_DIN_1	    (`BASE_OFFSET_IPP+'h0626)
`define IVLAN_PROPERTY_T_CONF_DIN_2	    (`BASE_OFFSET_IPP+'h0628)
`define IVLAN_PROPERTY_T_CONF_DIN_3	    (`BASE_OFFSET_IPP+'h062A)
`define IVLAN_PROPERTY_T_CONF_DOUT_0	(`BASE_OFFSET_IPP+'h062C)
`define IVLAN_PROPERTY_T_CONF_DOUT_1	(`BASE_OFFSET_IPP+'h062E)
`define IVLAN_PROPERTY_T_CONF_DOUT_2	(`BASE_OFFSET_IPP+'h0630)
`define IVLAN_PROPERTY_T_CONF_DOUT_3	(`BASE_OFFSET_IPP+'h0632)
// IVLAN_ACTION_TABLE	
`define IVLAN_ACTION_TABLE_STATUS	(`BASE_OFFSET_IPP+'h0640)	
`define IVLAN_ACTION_TABLE_CONTROL	(`BASE_OFFSET_IPP+'h0642)
`define IVLAN_ACTION_T_CONF_DIN_0	(`BASE_OFFSET_IPP+'h0644)
`define IVLAN_ACTION_T_CONF_DIN_1	(`BASE_OFFSET_IPP+'h0646)
`define IVLAN_ACTION_T_CONF_DOUT_0	(`BASE_OFFSET_IPP+'h0648)
`define IVLAN_ACTION_T_CONF_DOUT_1	(`BASE_OFFSET_IPP+'h064A)
// IVLAN_STG_TABLE	
`define IVLAN_STG_TABLE_STATUS	(`BASE_OFFSET_IPP+'h0660)	
`define IVLAN_STG_TABLE_CONTROL	(`BASE_OFFSET_IPP+'h0662)	
`define ISTG_T_CONF_DIN_0	    (`BASE_OFFSET_IPP+'h0664)
`define ISTG_T_CONF_DIN_1	    (`BASE_OFFSET_IPP+'h0666)
`define ISTG_T_CONF_DIN_2	    (`BASE_OFFSET_IPP+'h0668)
`define ISTG_T_CONF_DIN_3	    (`BASE_OFFSET_IPP+'h066A)
`define ISTG_T_CONF_DOUT_0	    (`BASE_OFFSET_IPP+'h066C)
`define ISTG_T_CONF_DOUT_1	    (`BASE_OFFSET_IPP+'h066E)
`define ISTG_T_CONF_DOUT_2	    (`BASE_OFFSET_IPP+'h0670)
`define ISTG_T_CONF_DOUT_3	    (`BASE_OFFSET_IPP+'h0672)
`define VT_MISS_DROP_R_TRIG	    (`BASE_OFFSET_IPP+'h0680)
`define VT_MISS_DROP_ROUT_H	    (`BASE_OFFSET_IPP+'h0682)	
`define VT_MISS_DROP_ROUT_L	    (`BASE_OFFSET_IPP+'h0684)
`define VLAN_FILTER_DROP_R_TRIG	(`BASE_OFFSET_IPP+'h0686)	
`define VLAN_FILTER_DROP_ROUT_H	(`BASE_OFFSET_IPP+'h0688)
`define VLAN_FILTER_DROP_ROUT_1	(`BASE_OFFSET_IPP+'h068A)
`define STP_DROP_R_TRIG	        (`BASE_OFFSET_IPP+'h068C)
`define STP_DROP_ROUT_H	        (`BASE_OFFSET_IPP+'h068E)
`define STP_DROP_ROUT_L	        (`BASE_OFFSET_IPP+'h0690)
// L2_MAC_TABLE	
`define L2_MAC_TABLE_STATUS	    (`BASE_OFFSET_IPP+'h0800)
`define L2_MAC_TABLE_CONTROL	(`BASE_OFFSET_IPP+'h0802)
`define L2M_T_CONF_KEY_0	    (`BASE_OFFSET_IPP+'h0804)
`define L2M_T_CONF_KEY_1	    (`BASE_OFFSET_IPP+'h0806)
`define L2M_T_CONF_KEY_2	    (`BASE_OFFSET_IPP+'h0808)
`define L2M_T_CONF_DIN_0	    (`BASE_OFFSET_IPP+'h080A)	
`define L2M_T_CONF_DIN_1	    (`BASE_OFFSET_IPP+'h080C)
`define L2M_T_CONF_DOUT_0	    (`BASE_OFFSET_IPP+'h080E)
`define L2M_T_CONF_DOUT_1	    (`BASE_OFFSET_IPP+'h0810)
`define L2M_T_CONF_DOUT_2	    (`BASE_OFFSET_IPP+'h0812)
`define L2M_T_CONF_DOUT_3	    (`BASE_OFFSET_IPP+'h0814)
`define L2M_T_CONF_DOUT_4	    (`BASE_OFFSET_IPP+'h0816)
`define L2MT_AGE_TIMER_H	    (`BASE_OFFSET_IPP+'h0818)	
`define L2MT_AGE_TIMER_L	    (`BASE_OFFSET_IPP+'h081A)
`define IP_BIND_DROP_R_TRIG	    (`BASE_OFFSET_IPP+'h0820)	
`define IP_BIND_DROP_ROUT_H	    (`BASE_OFFSET_IPP+'h0822)	
`define IP_BIND_DROP_ROUT_L	    (`BASE_OFFSET_IPP+'h0824)	
`define L2_SRC_DROP_R_TRIG	    (`BASE_OFFSET_IPP+'h0826)	
`define L2_SRC_DROP_ROUT_H	    (`BASE_OFFSET_IPP+'h0828)	
`define L2_SRC_DROP_ROUT_L	    (`BASE_OFFSET_IPP+'h082A)	
`define L2_DST_DROP_R_TRIG	    (`BASE_OFFSET_IPP+'h082C)	
`define L2_DST_DROP_ROUT_H	    (`BASE_OFFSET_IPP+'h082E)
`define L2_DST_DROP_ROUT_L	    (`BASE_OFFSET_IPP+'h0830)
//`define STORM_POLICER_ID_TABLE	
`define STORM_POLICER_ID_TABLE_STATUS	(`BASE_OFFSET_IPP+'h0A00)	
`define STORM_POLICER_ID_TABLE_CONTROL	(`BASE_OFFSET_IPP+'h0A02)	
`define STORM_PID_T_CONF_DIN_0	        (`BASE_OFFSET_IPP+'h0A04)	
`define STORM_PID_T_CONF_DIN_1	        (`BASE_OFFSET_IPP+'h0A06)
`define STORM_PID_T_CONF_DOUT_0	        (`BASE_OFFSET_IPP+'h0A08)	
`define STORM_PID_T_CONF_DOUT_1	        (`BASE_OFFSET_IPP+'h0A0A)
//ING_FLOW_TABLE	
`define ING_FLOW_TABLE_STATUS	(`BASE_OFFSET_IPP+'h0A20)
`define ING_FLOW_TABLE_CONTROL	(`BASE_OFFSET_IPP+'h0A22)	
`define ING_FLOW_T_CONF_KEY_0	(`BASE_OFFSET_IPP+'h0A24)
`define ING_FLOW_T_CONF_KEY_1	(`BASE_OFFSET_IPP+'h0A26)
`define ING_FLOW_T_CONF_KEY_2	(`BASE_OFFSET_IPP+'h0A28)
`define ING_FLOW_T_CONF_KEY_3	(`BASE_OFFSET_IPP+'h0A2A)
`define ING_FLOW_T_CONF_DIN	    (`BASE_OFFSET_IPP+'h0A2C)	
`define ING_FLOW_T_CONF_DOUT_0	(`BASE_OFFSET_IPP+'h0A2E)
`define ING_FLOW_T_CONF_DOUT_1	(`BASE_OFFSET_IPP+'h0A30)
`define ING_FLOW_T_CONF_DOUT_2	(`BASE_OFFSET_IPP+'h0A32)
`define ING_FLOW_T_CONF_DOUT_3	(`BASE_OFFSET_IPP+'h0A34)
`define ING_FLOW_T_CONF_DOUT_4	(`BASE_OFFSET_IPP+'h0A36)
// ING_FLOW_PRO_TABLE	
`define ING_FLOW_PRO_TABLE_STATUS	(`BASE_OFFSET_IPP+'h0A40)	
`define ING_FLOW_PRO_TABLE_CONTROL	(`BASE_OFFSET_IPP+'h0A42)	
`define ING_FLOW_PRO_T_CONF_DIN_0	(`BASE_OFFSET_IPP+'h0A44)	
`define ING_FLOW_PRO_T_CONF_DIN_2	(`BASE_OFFSET_IPP+'h0A46)
`define ING_FLOW_PRO_T_CONF_DOUT_0	(`BASE_OFFSET_IPP+'h0A48)	
`define ING_FLOW_PRO_T_CONF_DOUT_1	(`BASE_OFFSET_IPP+'h0A4A)
// ING_GATE_TABLE	
`define ING_GATE_TABLE_STATUS	(`BASE_OFFSET_IPP+'h0A60)	
`define ING_GATE_TABLE_CONTROL	(`BASE_OFFSET_IPP+'h0A62)	
`define ING_GATE_T_CONF_DIN_0	(`BASE_OFFSET_IPP+'h0A64)	
`define ING_GATE_T_CONF_DIN_1	(`BASE_OFFSET_IPP+'h0A66)
`define ING_GATE_T_CONF_DOUT_0	(`BASE_OFFSET_IPP+'h0A68)	
`define ING_GATE_T_CONF_DOUT_1	(`BASE_OFFSET_IPP+'h0A6A)
//`define POLICER_CONF_TABLE	
`define POLICER_CONF_TABLE_STATUS	(`BASE_OFFSET_IPP+'h0A80)
`define POLICER_CONF_TABLE_CONTROL	(`BASE_OFFSET_IPP+'h0A82)	
`define POLICER_C_T_CONF_DIN_0	    (`BASE_OFFSET_IPP+'h0A84)	
`define POLICER_C_T_CONF_DIN_1	    (`BASE_OFFSET_IPP+'h0A86)
`define POLICER_C_T_CONF_DIN_2	    (`BASE_OFFSET_IPP+'h0A88)
`define POLICER_C_T_CONF_DOUT_0	    (`BASE_OFFSET_IPP+'h0A8A)	
`define POLICER_C_T_CONF_DOUT_1	    (`BASE_OFFSET_IPP+'h0A8C)
`define POLICER_C_T_CONF_DOUT_2	    (`BASE_OFFSET_IPP+'h0A8E)
`define POLICER_TIMER_REG	        (`BASE_OFFSET_IPP+'h0A90)
// POLICER_TOKEN_TABLE	
`define POLICER_TOKEN_TABLE_STATUS	(`BASE_OFFSET_IPP+'h0AA0)	
`define POLICER_TOKEN_TABLE_CONTROL	(`BASE_OFFSET_IPP+'h0AA2)
`define POLICER_TOKEN_T_CONF_DIN_0	(`BASE_OFFSET_IPP+'h0AA4)
`define POLICER_TOKEN_T_CONF_DIN_1	(`BASE_OFFSET_IPP+'h0AA6)
`define POLICER_TOKEN_T_CONF_DOUT_0	(`BASE_OFFSET_IPP+'h0AA8)
`define POLICER_TOKEN_T_CONF_DOUT_1	(`BASE_OFFSET_IPP+'h0AAA)
`define ING_GATE_DROP_R_TRIG	    (`BASE_OFFSET_IPP+'h0AC0)	
`define ING_GATE_DROP_ROUT_H	    (`BASE_OFFSET_IPP+'h0AC2)	
`define ING_GATE_DROP_ROUT_L	    (`BASE_OFFSET_IPP+'h0AC4)
`define ING_POLICER_DROP_R_TRIG	    (`BASE_OFFSET_IPP+'h0AC6)	
`define ING_POLICER_DROP_ROUT_H	    (`BASE_OFFSET_IPP+'h0AC8)	
`define ING_POLICER_DROP_ROUT_L	    (`BASE_OFFSET_IPP+'h0ACA)	
// TIME_SLOT_RAM	
`define TIME_SLOT_RAM_STATUS	(`BASE_OFFSET_IPP+'h0AE0)	
`define TIME_SLOT_RAM_CONTROL	(`BASE_OFFSET_IPP+'h0AE2)	
`define CONF_SLOT_RAM_WDATA_0	(`BASE_OFFSET_IPP+'h0AE4)
`define CONF_SLOT_RAM_WDATA_1	(`BASE_OFFSET_IPP+'h0AE6)
`define CONF_SLOT_RAM_RDATA_0	(`BASE_OFFSET_IPP+'h0AE8)
`define CONF_SLOT_RAM_RDATA_1	(`BASE_OFFSET_IPP+'h0AEA)
`define ADMIN_BASE_TIME_0	    (`BASE_OFFSET_IPP+'h0AEC)
`define ADMIN_BASE_TIME_1	    (`BASE_OFFSET_IPP+'h0AEE)
`define ADMIN_BASE_TIME_2	    (`BASE_OFFSET_IPP+'h0AF0)
`define ADMIN_BASE_TIME_3	    (`BASE_OFFSET_IPP+'h0AF2)	
`define ADMIN_CYCLE_TIME_0	    (`BASE_OFFSET_IPP+'h0AF4)
`define ADMIN_CYCLE_TIME_1	    (`BASE_OFFSET_IPP+'h0AF6)
`define ADMIN_CYCLE_TIME_2	    (`BASE_OFFSET_IPP+'h0AF8)
`define ADMIN_CYCLE_TIME_3	    (`BASE_OFFSET_IPP+'h0AFA)	
`define ADMIN_SLOT_NUM	                (`BASE_OFFSET_IPP+'h0AFC)	
`define TIME_SLOT_CONF_CONTROL_STATUS	(`BASE_OFFSET_IPP+'h0AFE)	
`define OPER_BASE_TIME_0	(`BASE_OFFSET_IPP+'h0B00)
`define OPER_BASE_TIME_1	(`BASE_OFFSET_IPP+'h0B02)
`define OPER_BASE_TIME_2	(`BASE_OFFSET_IPP+'h0B04)
`define OPER_BASE_TIME_3	(`BASE_OFFSET_IPP+'h0B06)
`define OPER_CYCLE_TIME_0	(`BASE_OFFSET_IPP+'h0B08)
`define OPER_CYCLE_TIME_1	(`BASE_OFFSET_IPP+'h0B0A)
`define OPER_CYCLE_TIME_2	(`BASE_OFFSET_IPP+'h0B0C)
`define OPER_CYCLE_TIME_3	(`BASE_OFFSET_IPP+'h0B0E)
`define OPER_SLOT_NUM	    (`BASE_OFFSET_IPP+'h0B10)
// FRER_REC_TABLE	
`define FRER_REC_TABLE_STATUS	(`BASE_OFFSET_IPP+'h0C00)	
`define FRER_REC_TABLE_CONTROL	(`BASE_OFFSET_IPP+'h0C02)	
`define FRER_REC_T_CONF_DIN_0	(`BASE_OFFSET_IPP+'h0C04)
`define FRER_REC_T_CONF_DIN_1	(`BASE_OFFSET_IPP+'h0C06)
`define FRER_REC_T_CONF_DIN_2	(`BASE_OFFSET_IPP+'h0C08)
`define FRER_REC_T_CONF_DIN_3	(`BASE_OFFSET_IPP+'h0C0A)
`define FRER_REC_T_CONF_DIN_4	(`BASE_OFFSET_IPP+'h0C0C)
`define FRER_REC_T_CONF_DIN_5	(`BASE_OFFSET_IPP+'h0C0E)
`define FRER_REC_T_CONF_DIN_6	(`BASE_OFFSET_IPP+'h0C10)
`define FRER_REC_T_CONF_DIN_7	(`BASE_OFFSET_IPP+'h0C12)
`define FRER_REC_T_CONF_DIN_8	(`BASE_OFFSET_IPP+'h0C14)
`define FRER_REC_T_CONF_DOUT_0	(`BASE_OFFSET_IPP+'h0C16)
`define FRER_REC_T_CONF_DOUT_1	(`BASE_OFFSET_IPP+'h0C18)
`define FRER_REC_T_CONF_DOUT_2	(`BASE_OFFSET_IPP+'h0C1A)
`define FRER_REC_T_CONF_DOUT_3	(`BASE_OFFSET_IPP+'h0C1C)
`define FRER_REC_T_CONF_DOUT_4	(`BASE_OFFSET_IPP+'h0C1E)
`define FRER_REC_T_CONF_DOUT_5	(`BASE_OFFSET_IPP+'h0C20)
`define FRER_REC_T_CONF_DOUT_6	(`BASE_OFFSET_IPP+'h0C22)
`define FRER_REC_T_CONF_DOUT_7	(`BASE_OFFSET_IPP+'h0C24)
`define FRER_REC_T_CONF_DOUT_8	(`BASE_OFFSET_IPP+'h0C26)
`define FRER_AGE_TIMER	        (`BASE_OFFSET_IPP+'h0C2A)
`define RTAG_ETYPE	            (`BASE_OFFSET_IPP+'h0C40)
`define FRER_REC_DROP_R_TRIG	(`BASE_OFFSET_IPP+'h0C42)	
`define FRER_REC_DROP_ROUT_H	(`BASE_OFFSET_IPP+'h0C44)	
`define FRER_REC_DROP_ROUT_L	(`BASE_OFFSET_IPP+'h0C46)	
//`define RX_PTP_FORWARD_TABLE	
`define RX_PTP_FORWARD_TABLE_STATUS	    (`BASE_OFFSET_IPP+'h0E00)
`define RX_PTP_FORWARD_TABLE_CONTROL	(`BASE_OFFSET_IPP+'h0E02)	
`define RX_PTP_FORWARD_T_CONF_DIN_0	    (`BASE_OFFSET_IPP+'h0E04)	
`define RX_PTP_FORWARD_T_CONF_DIN_1	    (`BASE_OFFSET_IPP+'h0E06)
`define RX_PTP_FORWARD_T_CONF_DIN_2	    (`BASE_OFFSET_IPP+'h0E08)
`define RX_PTP_FORWARD_T_CONF_DOUT_0	(`BASE_OFFSET_IPP+'h0E0A)	
`define RX_PTP_FORWARD_T_CONF_DOUT_1	(`BASE_OFFSET_IPP+'h0E0C)
`define RX_PTP_FORWARD_T_CONF_DOUT_2	(`BASE_OFFSET_IPP+'h0E0E)	
`define CPU_PORT_CFG	(`BASE_OFFSET_IPP+'h0E20)	
`define HWE_PORT_CFG	(`BASE_OFFSET_IPP+'h0E22)	
// OUT_FP_TABLE	
`define OUT_FP_TABLE_STATUS	    (`BASE_OFFSET_IPP+'h1000)
`define OUT_FP_TABLE_CONTROL	(`BASE_OFFSET_IPP+'h1002)	
`define OUT_FP_T_CONF_DIN_0	    (`BASE_OFFSET_IPP+'h1004)	
`define OUT_FP_T_CONF_DIN_1	    (`BASE_OFFSET_IPP+'h1006)
`define OUT_FP_T_CONF_DIN_2	    (`BASE_OFFSET_IPP+'h1008)
`define OUT_FP_T_CONF_DIN_3	    (`BASE_OFFSET_IPP+'h100A)
`define OUT_FP_T_CONF_DIN_4	    (`BASE_OFFSET_IPP+'h100C)
`define OUT_FP_T_CONF_DOUT_0	(`BASE_OFFSET_IPP+'h100E)	
`define OUT_FP_T_CONF_DOUT_1	(`BASE_OFFSET_IPP+'h1010)
`define OUT_FP_T_CONF_DOUT_2	(`BASE_OFFSET_IPP+'h1012)
`define OUT_FP_T_CONF_DOUT_3	(`BASE_OFFSET_IPP+'h1014)
`define OUT_FP_T_CONF_DOUT_4	(`BASE_OFFSET_IPP+'h1016)
// L2_MC_TABLE	
`define L2_MC_TABLE_STATUS	(`BASE_OFFSET_IPP+'h1020)
`define L2_MC_TABLE_CONTROL	(`BASE_OFFSET_IPP+'h1022)
`define L2_MC_T_CONF_DIN_0	(`BASE_OFFSET_IPP+'h1024)	
`define L2_MC_T_CONF_DIN_1	(`BASE_OFFSET_IPP+'h1026)
`define L2_MC_T_CONF_DIN_2	(`BASE_OFFSET_IPP+'h1028)
`define L2_MC_T_CONF_DOUT_0	(`BASE_OFFSET_IPP+'h102A)	
`define L2_MC_T_CONF_DOUT_1	(`BASE_OFFSET_IPP+'h102C)
`define L2_MC_T_CONF_DOUT_2	(`BASE_OFFSET_IPP+'h102E)
`define RX_BC_DROP_R_TRIG	(`BASE_OFFSET_IPP+'h1040)
`define RX_BC_DROP_ROUT_H	(`BASE_OFFSET_IPP+'h1042)
`define RX_BC_DROP_ROUT_L	(`BASE_OFFSET_IPP+'h1044)
`define RX_UC_DROP_R_TRIG	(`BASE_OFFSET_IPP+'h1046)	
`define RX_UC_DROP_ROUT_H	(`BASE_OFFSET_IPP+'h1048)	
`define RX_UC_DROP_ROUT_L	(`BASE_OFFSET_IPP+'h104A)
`define RX_KMC_DROP_R_TRIG	(`BASE_OFFSET_IPP+'h104C)	
`define RX_KMC_DROP_ROUT_H	(`BASE_OFFSET_IPP+'h104E)
`define RX_KMC_DROP_ROUT_L	(`BASE_OFFSET_IPP+'h1050)
`define RX_UMC_DROP_R_TRIG	(`BASE_OFFSET_IPP+'h1052)	
`define RX_UMC_DROP_ROUT_H	(`BASE_OFFSET_IPP+'h1054)	
`define RX_UMC_DROP_ROUT_L	(`BASE_OFFSET_IPP+'h1056)
`define RX_DVP_DROP_R_TRIG	(`BASE_OFFSET_IPP+'h1058)	
`define RX_DVP_DROP_ROUT_H	(`BASE_OFFSET_IPP+'h105A)	
`define RX_DVP_DROP_ROUT_L	(`BASE_OFFSET_IPP+'h105C)

//EPP

//EVLAN_XLATE_TABLE	
`define EVLAN_XLATE_TABLE_STATUS	(`BASE_OFFSET_EPP+'h0020)
`define EVLAN_XLATE_TABLE_CONTROL	(`BASE_OFFSET_EPP+'h0022)
`define EVLAN_XLATE_T_CONF_KEY	    (`BASE_OFFSET_EPP+'h0024)
`define EVLAN_XLATE_T_DIN_0	        (`BASE_OFFSET_EPP+'h0026)
`define EVLAN_XLATE_T_DIN_1	        (`BASE_OFFSET_EPP+'h0028)
`define EVLAN_XLATE_T_DOUT_0	    (`BASE_OFFSET_EPP+'h002A)
`define EVLAN_XLATE_T_DOUT_1	    (`BASE_OFFSET_EPP+'h002C)
`define EVLAN_XLATE_T_DOUT_2	    (`BASE_OFFSET_EPP+'h002E)	
// EVLAN_ACTION_TABLE	
`define EVLAN_ACTION_TABLE_STATUS	(`BASE_OFFSET_EPP+'h0040)
`define EVLAN_ACTION_TABLE_CONTROL	(`BASE_OFFSET_EPP+'h0042)
`define EVLAN_ACTION_T_CONF_DIN_0	(`BASE_OFFSET_EPP+'h0044)	
`define EVLAN_ACTION_T_CONF_DIN_1	(`BASE_OFFSET_EPP+'h0046)
`define EVLAN_ACTION_T_CONF_DOUT_0	(`BASE_OFFSET_EPP+'h0048)	
`define EVLAN_ACTION_T_CONF_DOUT_1	(`BASE_OFFSET_EPP+'h004A)
//`define EVLAN_PROPERTY_TABLE	
`define EVLAN_PROPERTY_TABLE_STATUS  	(`BASE_OFFSET_EPP+'h0060)
`define EVLAN_PROPERTY_TABLE_CONTROL	(`BASE_OFFSET_EPP+'h0062)
`define EVLAN_PROPERTY_T_CONF_DIN_0	    (`BASE_OFFSET_EPP+'h0064)	
`define EVLAN_PROPERTY_T_CONF_DIN_1	    (`BASE_OFFSET_EPP+'h0066)
`define EVLAN_PROPERTY_T_CONF_DIN_2	    (`BASE_OFFSET_EPP+'h0068)
`define EVLAN_PROPERTY_T_CONF_DIN_3	    (`BASE_OFFSET_EPP+'h006A)
`define EVLAN_PROPERTY_T_CONF_DOUT_0	(`BASE_OFFSET_EPP+'h006C)	
`define EVLAN_PROPERTY_T_CONF_DOUT_1	(`BASE_OFFSET_EPP+'h006E)
`define EVLAN_PROPERTY_T_CONF_DOUT_2	(`BASE_OFFSET_EPP+'h0070)
`define EVLAN_PROPERTY_T_CONF_DOUT_3	(`BASE_OFFSET_EPP+'h0072)	
// EVLAN_STG_TABLE	
`define EVLAN_STG_TABLE_STATUS	(`BASE_OFFSET_EPP+'h0080)
`define EVLAN_STG_TABLE_CONTROL	(`BASE_OFFSET_EPP+'h0082)
`define ESTG_T_CONF_DIN_0	    (`BASE_OFFSET_EPP+'h0084)
`define ESTG_T_CONF_DIN_1	    (`BASE_OFFSET_EPP+'h0086)
`define ESTG_T_CONF_DIN_2	    (`BASE_OFFSET_EPP+'h0088)
`define ESTG_T_CONF_DIN_3	    (`BASE_OFFSET_EPP+'h008A)
`define ESTG_T_CONF_DOUT_0	    (`BASE_OFFSET_EPP+'h008C)
`define ESTG_T_CONF_DOUT_1	    (`BASE_OFFSET_EPP+'h008E)
`define ESTG_T_CONF_DOUT_2	    (`BASE_OFFSET_EPP+'h0090)
`define ESTG_T_CONF_DOUT_3	    (`BASE_OFFSET_EPP+'h0092)	
`define EPP_IN_DROP_R_TRIG	    (`BASE_OFFSET_EPP+'h00A0)	
`define EPP_IN_DROP_ROUT_H	    (`BASE_OFFSET_EPP+'h00A2)	
`define EPP_IN_DROP_ROUT_L	    (`BASE_OFFSET_EPP+'h00A4)
`define STP_OUT_DROP_R_TRIG	    (`BASE_OFFSET_EPP+'h00A6)	
`define STP_OUT_DROP_ROUT_H	    (`BASE_OFFSET_EPP+'h00A8)	
`define STP_OUT_DROP_ROUT_L	    (`BASE_OFFSET_EPP+'h00AA)
// OPORT_PRO_TABLE	
`define OPORT_PRO_TABLE_STATUS	(`BASE_OFFSET_EPP+'h0200)
`define OPORT_PRO_TABLE_CONTROL	(`BASE_OFFSET_EPP+'h0202)
`define OPORT_PRO_TABLE_DIN_0	(`BASE_OFFSET_EPP+'h0204)	
`define OPORT_PRO_TABLE_DIN_1	(`BASE_OFFSET_EPP+'h0206)
`define OPORT_PRO_TABLE_DOUT_0	(`BASE_OFFSET_EPP+'h0208)	
`define OPORT_PRO_TABLE_DOUT_1	(`BASE_OFFSET_EPP+'h020A)
// DOT1P_MAP_TABLE	
`define DOT1P_MAP_TABLE_STATUS	(`BASE_OFFSET_EPP+'h0220)
`define DOT1P_MAP_TABLE_CONTROL	(`BASE_OFFSET_EPP+'h0222)
`define DOT1P_MAP_T_DIN_0	    (`BASE_OFFSET_EPP+'h0224)	
`define DOT1P_MAP_T_DIN_1	    (`BASE_OFFSET_EPP+'h0226)
`define DOT1P_MAP_T_DOUT_0	    (`BASE_OFFSET_EPP+'h0228)	
`define DOT1P_MAP_T_DOUT_1	    (`BASE_OFFSET_EPP+'h022a)	
// LAG_SEL_PORT_TABLE	
`define LAG_SEL_PORT_TABLE_STATUS	(`BASE_OFFSET_EPP+'h0240)
`define LAG_SEL_PORT_TABLE_CONTROL	(`BASE_OFFSET_EPP+'h0242)
`define LAG_SEL_PORT_T_CONF_DIN_0	(`BASE_OFFSET_EPP+'h0244)	
`define LAG_SEL_PORT_T_CONF_DIN_1	(`BASE_OFFSET_EPP+'h0246)
`define LAG_SEL_PORT_T_CONF_DOUT_0	(`BASE_OFFSET_EPP+'h0248)	
`define LAG_SEL_PORT_T_CONF_DOUT_1	(`BASE_OFFSET_EPP+'h024A)	
// O_PHY_PORT_PRO_TABLE	
`define O_PHY_PORT_PRO_TABLE_STATUS	    (`BASE_OFFSET_EPP+'h0260)
`define O_PHY_PORT_PRO_TABLE_CONTROL	(`BASE_OFFSET_EPP+'h0262)
`define O_PHY_PORT_PRO_T_CONF_DIN_0	    (`BASE_OFFSET_EPP+'h0264)	
`define O_PHY_PORT_PRO_T_CONF_DIN_1	    (`BASE_OFFSET_EPP+'h0266)
`define O_PHY_PORT_PRO_T_CONF_DIN_2	    (`BASE_OFFSET_EPP+'h0268)
`define O_PHY_PORT_PRO_T_CONF_DIN_3	    (`BASE_OFFSET_EPP+'h026A)
`define O_PHY_PORT_PRO_T_CONF_DIN_4	    (`BASE_OFFSET_EPP+'h026C)
`define O_PHY_PORT_PRO_T_CONF_DIN_5	    (`BASE_OFFSET_EPP+'h026E)
`define O_PHY_PORT_PRO_T_CONF_DIN_6	    (`BASE_OFFSET_EPP+'h0270)
`define O_PHY_PORT_PRO_T_CONF_DIN_7	    (`BASE_OFFSET_EPP+'h0272)
`define O_PHY_PORT_PRO_T_CONF_DOUT_0	(`BASE_OFFSET_EPP+'h0274)	
`define O_PHY_PORT_PRO_T_CONF_DOUT_1	(`BASE_OFFSET_EPP+'h0276)
`define O_PHY_PORT_PRO_T_CONF_DOUT_2	(`BASE_OFFSET_EPP+'h0278)
`define O_PHY_PORT_PRO_T_CONF_DOUT_3	(`BASE_OFFSET_EPP+'h027A)
`define O_PHY_PORT_PRO_T_CONF_DOUT_4	(`BASE_OFFSET_EPP+'h027C)
`define O_PHY_PORT_PRO_T_CONF_DOUT_5	(`BASE_OFFSET_EPP+'h027E)
`define O_PHY_PORT_PRO_T_CONF_DOUT_6	(`BASE_OFFSET_EPP+'h0280)
`define O_PHY_PORT_PRO_T_CONF_DOUT_7	(`BASE_OFFSET_EPP+'h0282)	
`define E_FILTER_DROP_R_TRIG	        (`BASE_OFFSET_EPP+'h02A0)	
`define IP_BIND_DROP_ROUT_H	            (`BASE_OFFSET_EPP+'h02A2)	
`define IP_BIND_DROP_ROUT_L	            (`BASE_OFFSET_EPP+'h02A4)

`define PORT_POLLING_WEIGHT_TABLE_CFG_TRIGGER	(`BASE_OFFSET_GATHER+'h000)
`define PORT_POLLING_WEIGHT_TABLE_CFG_ADDR	    (`BASE_OFFSET_GATHER+'h001)
`define PORT_POLLING_WEIGHT_TABLE_CFG_PORT_ID	(`BASE_OFFSET_GATHER+'h002)
`define PORT_POLLING_WEIGHT_TABLE_LOOKUP_DATA	(`BASE_OFFSET_GATHER+'h003)

//1588 ptp
`define PKT_RAM_ADDR_REG             (`BASE_OFFSET_PTP+'h00*2)
`define PKT_RAM_WR_REG               (`BASE_OFFSET_PTP+'h01*2)
`define PKT_RAM_RD_REG               (`BASE_OFFSET_PTP+'h02*2)
`define PKT_RAM_WR_DATA_REG          (`BASE_OFFSET_PTP+'h03*2)
`define PKT_RAM_RD_DATA_REG          (`BASE_OFFSET_PTP+'h04*2)
										   
`define SYNC_PRO_CONFIG1_REG         (`BASE_OFFSET_PTP+'h10*2)
`define SYNC_PRO_CONFIG2_REG         (`BASE_OFFSET_PTP+'h11*2)
`define SYNC_PRO_CONFIG_UPDT_REG     (`BASE_OFFSET_PTP+'h12*2)
`define PDLY_REQ_PRO_CONFIG1_REG     (`BASE_OFFSET_PTP+'h13*2)         
`define PDLY_REQ_PRO_CONFIG2_REG     (`BASE_OFFSET_PTP+'h14*2)
`define PDLY_REQ_PRO_CONFIG3_REG     (`BASE_OFFSET_PTP+'h15*2)
`define PDLY_REQ_PRO_CONFIG4_REG     (`BASE_OFFSET_PTP+'h16*2)
`define PDLY_REQ_PRO_CONFIG5_REG     (`BASE_OFFSET_PTP+'h17*2)
`define PDLY_REQ_PRO_CONFIG6_REG     (`BASE_OFFSET_PTP+'h18*2)
`define PDLY_REQ_PRO_CONFIG7_REG     (`BASE_OFFSET_PTP+'h19*2)        
`define PDLY_REQ_PRO_CONFIG8_REG     (`BASE_OFFSET_PTP+'h1a*2)
`define PDLY_REQ_PRO_CONFIG9_REG     (`BASE_OFFSET_PTP+'h1b*2)
`define PDLY_REQ_PRO_CONFIG_UPDT_REG (`BASE_OFFSET_PTP+'h1c*2)
										   
`define EN_REG                       (`BASE_OFFSET_PTP+'h20*2)
`define FIFO_FLUSH_REG               (`BASE_OFFSET_PTP+'h21*2)
`define FIFO_STAT_REG                (`BASE_OFFSET_PTP+'h22*2)
`define SEQ_ERR_REG                  (`BASE_OFFSET_PTP+'h23*2)
`define FCS_ERR_REG                  (`BASE_OFFSET_PTP+'h24*2)
`define RAM_INIT_DONE                (`BASE_OFFSET_PTP+'h25*2)										   
`define DBG_1_REG                    (`BASE_OFFSET_PTP+'h30*2)
`define DBG_2_REG                    (`BASE_OFFSET_PTP+'h31*2)
`define DBG_3_REG                    (`BASE_OFFSET_PTP+'h32*2)
`define DBG_4_REG                    (`BASE_OFFSET_PTP+'h33*2)
`define DBG_5_REG                    (`BASE_OFFSET_PTP+'h34*2)


//GE
`define SYS_HEADER                    'h006

//obm
`define QUEUE_MAP 'h000
//GE
`define VFRAME_TRIG 'h000
`define PMAC_CFG_FRAGSIZE 'h00C
`define PMAC_MPKT_SIZE 'h00E