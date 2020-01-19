`ifndef CRLLIST_CHK_MONITOR__SV
`define CRLLIST_CHK_MONITOR__SV
class crllist_chk_monitor #(type VIF = virtual crllist_chk_interface) extends monitor_base #(VIF);
	`uvm_component_utils(crllist_chk_monitor)
	obm_dut_cfg                  m_cfg;
	obm_dut_cfg                  m_local_cfg;
	bit [15:0]                   m_base_addr;
	int                          m_cmp_list_num;
	//this changes because the qbv base test need this to decide when to send pkt
	bit [1:0]                    m_start_chk_en;
	function new(string name,uvm_component parent);
		super.new(name,parent);
		//m_cfg = new("m_cfg");
		//m_local_cfg = new("m_local_cfg");
		m_cfg = obm_dut_cfg::type_id::create("m_cfg");
		m_local_cfg = obm_dut_cfg::type_id::create("m_local_cfg");
		`uvm_info(get_type_name(),$psprintf("crllist_chk_monitor new"),UVM_NONE);
	endfunction
	extern virtual task run_phase(uvm_phase phase);
	extern function void connect_phase(uvm_phase phase);
	extern function void chk_gate_state(bit [1:0] sel_spare_en,bit [63:0] dut_ptp_time,bit [7:0] gate_state);
	extern function bit [63:0] time_change(bit [63:0] base_time,bit [31:0] adding_time);
	extern function bit [63:0] change_second_to_ns(bit [63:0] base_time,bit [63:0] adding_time = 64'h0);
	extern function void chn_cfg_for_sum_high();
	extern function void chn_cfg_for_sum_low();
	extern function void chn_cfg_for_base_time_low(bit [63:0] dut_ptp_time,bit sel_spare_en = 1'b1);
endclass

function void crllist_chk_monitor::connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	`uvm_info(get_type_name(),$psprintf("start to print m_cfg m_base_addr is 0x%0h",m_base_addr),UVM_NONE);
	m_cfg.print();
	if(!$cast(m_local_cfg,m_cfg.clone()))begin 
		`uvm_fatal(get_type_name(),$psprintf("m_cfg.clone() failed"));
	end
	//here we need to change the obm_dut_cfg for the cyc_time and time_interval are not matched
	if(m_cfg.m_spare_cyc_time_mode == 2'b1)begin 
		`uvm_info(get_type_name(),$psprintf("enter chn_cfg_for_sum_high"),UVM_NONE);
		chn_cfg_for_sum_high();
	end
	else if(m_cfg.m_spare_cyc_time_mode == 2'b10)begin 
		`uvm_info(get_type_name(),$psprintf("enter chn_cfg_for_sum_low"),UVM_NONE);
		chn_cfg_for_sum_low();
	end
	m_local_cfg.print();
	m_cfg.print();
endfunction
task crllist_chk_monitor:: run_phase(uvm_phase phase);
	//for in test we support cfg twice
	int            amd2opr_cnt;
	bit [1:0]      amd2opr_done;
	bit            cpu_wr_b_dly; 
	bit [63:0]     rm_base_time;
	//this is for get dut_cfg_data
	bit            cfg_data_en;
	//this is for start cnt data
	bit            start_cnt_en;
	bit [63:0]     local_ptp;
	//bit [1:0]      start_chk_en;
	bit [1:0]      cnt_round_en;
	bit [63:0]     dut_ns_time;

	super.run_phase(phase);
	#10ns;
	`uvm_info(get_type_name(),$psprintf("enter crllist_chk_monitor run_phase"),UVM_NONE);
	while(1)begin 
		cpu_wr_b_dly = bus.m_cpu_wr_b;
		@(posedge bus.clk);
		if(bus.rst_n == 1'b0)begin 
			continue;
		end
		if((cpu_wr_b_dly == 1'b1)&&(bus.m_cpu_wr_b == 1'b0)&&(bus.m_cpu_addr == ((m_base_addr + 16'h42)/2))&&(bus.m_cpu_data_in == 16'h55AA))begin 
			amd2opr_cnt ++;
			cfg_data_en = 1'b1;
			`uvm_info(get_type_name(),$psprintf("amd2opr_cnt is %0d",amd2opr_cnt),UVM_NONE);
			//here we need to change the base time if the start base is small than the ptp now
			if(amd2opr_cnt == 1)begin 
				//here change spare and spare_total base time 
				if(bus.m_timestamp > m_cfg.m_spare_base_time)begin
					chn_cfg_for_base_time_low(bus.m_timestamp);
				end
			end
			else if(amd2opr_cnt == 2)begin 
				//here change main
			end
		end
		if(amd2opr_cnt == 1)begin 
        	rm_base_time = time_change(m_local_cfg.m_spare_base_time,crllist_chk_dec::GATE_LATENCY);
			if(bus.m_timestamp == rm_base_time)begin 
				m_start_chk_en = 2'b1;
				m_local_cfg.m_sel_spare_en = 2'b01;
				`uvm_info(get_type_name(),$psprintf("start to spare time"),UVM_NONE);
			end
		end
		else if(amd2opr_cnt == 2)begin 
        	rm_base_time = time_change(m_local_cfg.m_main_base_time,crllist_chk_dec::GATE_LATENCY);
			if(bus.m_timestamp == rm_base_time)begin 
				m_start_chk_en = 2'b10;
				m_local_cfg.m_sel_spare_en = 2'b10;
				`uvm_info(get_type_name(),$psprintf("start to main time"),UVM_NONE);
			end
		end
        
		//now we only consider after cfg,the rm_base_time is greater than the dut ptp time
	    if(m_start_chk_en[0] == 1'b1)begin 
			dut_ns_time = change_second_to_ns(bus.m_timestamp);
			chk_gate_state(m_start_chk_en,dut_ns_time,bus.m_gate_state);
		end
	end
endtask

function void crllist_chk_monitor::chk_gate_state(bit [1:0] sel_spare_en,bit [63:0] dut_ptp_time,bit [7:0] gate_state);
	int list_num;
	bit [63:0] relative_time;
	bit [63:0] round_time;
	bit [63:0] sum_time;

	if(sel_spare_en[0] == 1'b1)begin 
		//this is for get the time after the base_time
	    relative_time = (dut_ptp_time - m_local_cfg.m_spare_total_base_time - crllist_chk_dec::GATE_LATENCY + crllist_chk_dec::CYC_PEROID); 	
        //this is for get the time in the round of cyc_time
		round_time = (relative_time%m_local_cfg.m_spare_total_cyc_time);

		//this is for cyc_time boundary
		if(((relative_time/m_local_cfg.m_spare_total_cyc_time) > 0)&&(round_time == 0))begin 
			round_time = ((relative_time - crllist_chk_dec::CYC_PEROID)%m_local_cfg.m_spare_total_cyc_time);
		end
		sum_time = 64'h0;
		for(int i=0;i<m_local_cfg.m_spare_list_len;i++)begin 
			sum_time = (sum_time + m_local_cfg.m_list_time_interval[i]);
			if(sum_time >= round_time)begin
				list_num = i;
				break;
			end
		end
		if(gate_state != m_local_cfg.m_list_gate_state[list_num])begin 
			`uvm_error(get_type_name(),$psprintf("m_local_cfg.m_list_gate_state[%0d] is 0x%0h,dut_gate_state is 0x%0h,dut_ptp_time is 0x%0h",list_num,m_local_cfg.m_list_gate_state[list_num],gate_state,dut_ptp_time))
		end
		m_cmp_list_num ++;
	end

	if(sel_spare_en[1] == 1'b1)begin 

	end
endfunction:chk_gate_state

function bit [63:0] crllist_chk_monitor::time_change(bit [63:0] base_time,bit [31:0] adding_time);
	bit [63:0] chn_time;
	if((base_time[31:0] + adding_time) >= crllist_chk_dec::DATA_NS)begin 
		chn_time[63:32] = (time_change[63:32] + 32'h1);
		chn_time[31:0]  = (base_time[31:0] + adding_time - crllist_chk_dec::DATA_NS);
	end
	else begin 
		chn_time[63:32] = (time_change[63:32] + 32'h0);
		chn_time[31:0]  = (base_time[31:0] + adding_time);
	end
    return chn_time;
endfunction:time_change

function bit [63:0] crllist_chk_monitor::change_second_to_ns(bit [63:0] base_time,bit [63:0] adding_time = 64'h0);
	bit [63:0]  ns_time;
	if(base_time[31:0] >= crllist_chk_dec::DATA_NS)begin 
		`uvm_error(get_type_name(),$psprintf("base_time is 0x%0h ns should not exceed this",base_time));
	end
	ns_time = (({32'h0,base_time[63:32]}*{32'h0,crllist_chk_dec::DATA_NS}) + {32'h0,base_time[31:0]});
	return ns_time;
endfunction:change_second_to_ns

function void crllist_chk_monitor::chn_cfg_for_sum_high();
	int real_len;
	bit [31:0] interval_sum;
	interval_sum = 0;
	for(int i=0;i<m_cfg.m_spare_list_len;i++)begin 
		interval_sum = (interval_sum + m_cfg.m_list_time_interval[i]);
		if(interval_sum >= m_cfg.m_spare_total_cyc_time)begin 
		   `uvm_info(get_type_name(),$psprintf("interval_sum is 0x%0h,i is %0d",interval_sum,i),UVM_NONE);
			m_local_cfg.m_spare_list_len = (i + 1);
			m_local_cfg.m_list_time_interval[i] = (m_local_cfg.m_list_time_interval[i] - (interval_sum - m_cfg.m_spare_ext_time));
			break;
		end
	end

	for(int i= m_local_cfg.m_spare_list_len;i < m_cfg.m_spare_list_len;i++)begin 
		m_local_cfg.m_list_time_interval.pop_back();
		m_local_cfg.m_list_gate_state.pop_back();
	end
endfunction:chn_cfg_for_sum_high

function void crllist_chk_monitor::chn_cfg_for_sum_low();
    //this is for after interval the gate is all open
    m_local_cfg.m_spare_list_len = (m_cfg.m_spare_list_len + 1);
	m_local_cfg.m_list_time_interval.push_back(m_cfg.m_spare_rand_time);
	m_local_cfg.m_list_gate_state.push_back(8'hff);

endfunction:chn_cfg_for_sum_low

function void crllist_chk_monitor::chn_cfg_for_base_time_low(bit [63:0] dut_ptp_time,bit sel_spare_en = 1'b1);
	bit [63:0] dut_ns_time;
	int        min_cyc_num;
	dut_ns_time = change_second_to_ns(dut_ptp_time);
	if(sel_spare_en == 1'b1)begin
    	while(1)begin 
			if((m_cfg.m_spare_total_base_time + min_cyc_num*m_cfg.m_spare_total_cyc_time) >= dut_ns_time)begin 
				`uvm_info(get_type_name(),$psprintf("min_cyc_num is %0d",min_cyc_num),UVM_NONE);
				break;
			end
			min_cyc_num ++;
		end

		m_local_cfg.m_spare_total_base_time        = (m_cfg.m_spare_total_base_time + min_cyc_num*m_cfg.m_spare_total_cyc_time);
		m_local_cfg.m_spare_base_time[63:32]       = (m_local_cfg.m_spare_total_base_time/crllist_chk_dec::DATA_NS);
		m_local_cfg.m_spare_base_time[31:0]        = (m_local_cfg.m_spare_total_base_time%crllist_chk_dec::DATA_NS);
	end

	m_local_cfg.print();

endfunction:chn_cfg_for_base_time_low

`endif
