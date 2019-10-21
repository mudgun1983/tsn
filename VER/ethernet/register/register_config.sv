class register_config extends uvm_object;
`uvm_object_utils( register_config );
//ipp
PHY_PORT_TABLE    phy_port_table;
LOGIC_PORT_TABLE         logic_port_table      ;
L2_PROTOCOL_TABLE        l2_protocol_table     ;
IPHB_TABLE               iphb_table            ;
IVLAN_XLATE_TABLE        ivlan_xlate_table     ;
IVLAN_PROPERTY_TABLE     ivlan_property_table  ;
IVLAN_ACTION_TABLE       ivlan_action_table    ;
IVLAN_STG_TABLE          ivlan_stg_table       ;
L2_MAC_TABLE             l2_mac_table          ;
STORM_POLICER_ID_TABLE   storm_policer_id_table;
ING_FLOW_TABLE           ing_flow_table        ;
ING_FLOW_PRO_TABLE       ing_flow_pro_table    ;
ING_GATE_TABLE           ing_gate_table        ;
POLICER_CONF_TABLE       policer_conf_table    ;
POLICER_TOKEN_TABLE      policer_token_table   ;
FRER_REC_TABLE           frer_rec_table        ;
RX_PTP_FORWARD_TABLE     rx_ptp_forward_table  ;
OUT_FP_TABLE             out_fp_table          ;
L2_MC_TABLE              l2_mc_table           ;
TIME_SLOT_TABLE          time_slot_table       ;
EVLAN_XLATE_TABLE        evlan_xlate_table     ;
EVLAN_ACTION_TABLE       evlan_action_table    ;
EVLAN_PROPERTY_TABLE     evlan_property_table  ;
EVLAN_STG_TABLE          evlan_stg_table       ;
OPORT_PRO_TABLE          oport_pro_table       ;
DOT1P_MAP_TABLE          dot1p_map_table       ;
LAG_SEL_PORT_TABLE       lag_sel_port_table    ;
O_PHY_PORT_PRO_TABLE     o_phy_port_pro_table  ;

  function new (string name = "register_config");
    super.new(name);
	phy_port_table        = new();
	logic_port_table      = new();
	l2_protocol_table     = new();
	iphb_table            = new();
	ivlan_xlate_table     = new();
	ivlan_property_table  = new();
	ivlan_action_table    = new();
	ivlan_stg_table       = new();
	l2_mac_table          = new();
	storm_policer_id_table= new();
	ing_flow_table        = new();
	ing_flow_pro_table    = new();
	ing_gate_table        = new();
	policer_conf_table    = new();
	policer_token_table   = new();
	frer_rec_table        = new();
	rx_ptp_forward_table  = new();
	out_fp_table          = new();
	l2_mc_table           = new();
	time_slot_table       = new();
						 
	evlan_xlate_table     = new();
	evlan_action_table    = new();
	evlan_property_table  = new();
	evlan_stg_table       = new();
	oport_pro_table       = new();
	dot1p_map_table       = new();
	lag_sel_port_table    = new();
	o_phy_port_pro_table  = new();	
  endfunction : new
  
endclass
