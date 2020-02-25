interface mac_tx_interface(input bit clk,input bit rst_n);
	parameter SETUP_TIME = 0.1ns;
	parameter HOLD_TIME  = 0.1ns;

	logic 			m_mac_tx_en;
	logic [7:0]     m_mac_tx_d;
	logic [7:0]     m_gate_state;

	clocking drv_cb @(posedge clk);
		default input #SETUP_TIME output #HOLD_TIME;

	endclocking:drv_cb

	clocking mon_cb @(posedge clk);
		default input #SETUP_TIME output #HOLD_TIME;
		input       m_mac_tx_en;
		input		m_mac_tx_d;
		input       m_gate_state;
	endclocking:mon_cb

	modport drv_mod (clocking drv_cb);
	modport mon_mod (clocking mon_cb);
endinterface:mac_tx_interface
