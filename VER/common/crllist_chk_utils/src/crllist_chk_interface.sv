interface crllist_chk_interface(input bit clk,input bit rst_n);
	parameter SETUP_TIME = 0.1ns;
	parameter HOLD_TIME  = 0.1ns;

    logic [63:0]    m_timestamp;
	logic 			m_cpu_wr_b;
	logic [11:0]    m_cpu_addr;
	logic [15:0]    m_cpu_data_in;
	logic [7:0]     m_gate_state;

	clocking drv_cb @(posedge clk);
		default input #SETUP_TIME output #HOLD_TIME;

	endclocking:drv_cb

	clocking mon_cb @(posedge clk);
		default input #SETUP_TIME output #HOLD_TIME;
		input       m_timestamp;
		input		m_cpu_wr_b;
		input       m_cpu_addr;
		input       m_cpu_data_in;
		input       m_gate_state;
	endclocking:mon_cb

	modport drv_mod (clocking drv_cb);
	modport mon_mod (clocking mon_cb);
endinterface:crllist_chk_interface
