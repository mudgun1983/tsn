interface obm_mac_interface(input bit clk,input bit rst_n);
	parameter SETUP_TIME = 0.1ns;
	parameter HOLD_TIME  = 0.1ns;

	logic [255:0]  	m_obm_mac_data;
	logic [4:0]     m_obm_mac_mod;
	logic           m_obm_mac_valid;
	logic           m_obm_mac_sop;
	logic           m_obm_mac_eop;
	logic 			m_obm_mac_err;
	logic 			m_mac_obm_rdy;
	logic [63:0] 	m_obm_mac_ptp;
	logic [7:0] 	m_obm_mac_gate_state;

	clocking drv_cb @(posedge clk);
		default input #SETUP_TIME output #HOLD_TIME;

		input		m_obm_mac_data;
		input		m_obm_mac_mod;
		input		m_obm_mac_valid;
		input       m_obm_mac_sop;
		input       m_obm_mac_eop;
		input       m_obm_mac_err;
		output      m_mac_obm_rdy;
	endclocking:drv_cb

	clocking mon_cb @(posedge clk);
		input		m_obm_mac_data;
		input		m_obm_mac_mod;
		input		m_obm_mac_valid;
		input     	m_obm_mac_sop;
		input       m_obm_mac_eop;
		input       m_obm_mac_err;
		input       m_mac_obm_rdy;
		input       m_obm_mac_ptp;
		input       m_obm_mac_gate_state;
	endclocking:mon_cb

	modport drv_mod (clocking drv_cb);
	modport mon_mod (clocking mon_cb);
endinterface:obm_mac_interface
