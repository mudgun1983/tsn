interface scatter_obm_interface(input bit clk,input bit rst_n);
	parameter SETUP_TIME = 0.1ns;
	parameter HOLD_TIME  = 0.1ns;

	logic [255:0]  	m_scatter_obm_data;
	logic [4:0]     m_scatter_obm_mod;
	logic           m_scatter_obm_valid;
	logic           m_scatter_obm_sop;
	logic           m_scatter_obm_eop;
	logic 			m_scatter_obm_err;
	logic [2:0]		m_scatter_obm_ophb;

	clocking drv_cb @(posedge clk);
		default input #SETUP_TIME output #HOLD_TIME;

		output		m_scatter_obm_data;
		output		m_scatter_obm_mod;
		output		m_scatter_obm_valid;
		output      m_scatter_obm_sop;
		output      m_scatter_obm_eop;
		output      m_scatter_obm_err;
		output		m_scatter_obm_ophb;
	endclocking:drv_cb

	clocking mon_cb @(posedge clk);
		input		m_scatter_obm_data;
		input		m_scatter_obm_mod;
		input		m_scatter_obm_valid;
		input     	m_scatter_obm_sop;
		input       m_scatter_obm_eop;
		input       m_scatter_obm_err;
		input		m_scatter_obm_ophb;
	endclocking:mon_cb

	modport drv_mod (clocking drv_cb);
	modport mon_mod (clocking mon_cb);
endinterface:scatter_obm_interface
