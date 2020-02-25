`ifndef MAC_TX_MONITOR__SV
`define MAC_TX_MONITOR__SV
class mac_tx_monitor #(type VIF = virtual mac_tx_interface) extends monitor_base #(VIF);
	`uvm_component_utils(mac_tx_monitor)
	int         m_gate_open_time;
	int         m_mac_tx_time;
	int         m_gate_open_q[$];
	int         m_mac_tx_q[$];
	int         m_mac_tx_num;
	int         m_mac_tx_lat_q[$];
	bit         m_gate_open_en;
	obm_pkt_cfg m_pkt_cfg;
	function new(string name,uvm_component parent);
		super.new(name,parent);
		m_pkt_cfg = new("m_pkt_cfg");
	endfunction
	extern virtual task run_phase(uvm_phase phase);
	extern function void connect_phase(uvm_phase phase);
endclass

function void mac_tx_monitor::connect_phase(uvm_phase phase);
	super.connect_phase(phase);
endfunction
task mac_tx_monitor:: run_phase(uvm_phase phase);
    bit [7:0]  gate_state_dly;
	//this is for first list
	bit        gate_start_en;
	bit        mac_tx_en_dly;
	bit        mac_tx_en_pedge;
	//this is for second and later
	bit        gate_nxt_open_en;
	bit        gate_close_en;
	int        cycle_cnt;
	super.run_phase(phase);
	#10ns;
	`uvm_info(get_type_name(),$psprintf("enter mac_tx_monitor run_phase"),UVM_NONE);
	while(1)begin 
		gate_state_dly = bus.mon_cb.m_gate_state;
		mac_tx_en_dly  = bus.mon_cb.m_mac_tx_en;
		@bus.mon_cb;
		if((gate_state_dly == 8'hff)&&(bus.mon_cb.m_gate_state == 8'h1))begin 
			gate_start_en = 1'b1;
			//m_gate_tx_time = $time();
			m_gate_open_q.push_back($time());
		end
        
		/*//this is for second and later
		if((gate_state_dly == 8'h0)&&(bus.mon_cb.m_gate_state == 8'h1))begin 
			m_gate_open_q.push_back($time());
		end

        //here is for mac_tx start send pkt data
		if((mac_tx_en_dly == 1'b0)&&(bus.mon_cb.m_mac_tx_en == 1'b1))begin 
			m_mac_tx_num ++;
			mac_tx_en_pedge = 1'b1;
			m_mac_tx_q.push_back($time());
		end

		//this is for in this time we continue send pkt
		//if((m_mac_tx_num > 0)&&(m_mac_tx_num < (m_pkt_cfg.m_pkt_num - 1)))begin 
		if((m_mac_tx_num < (m_pkt_cfg.m_pkt_num - 1))&&(gate_start_en == 1'b1))begin 
			//this is is for gate_close
			if((gate_state_dly == 8'h1)&&(bus.mon_cb.m_gate_state == 8'h0))begin 
				if(mac_tx_en_pedge == 1'b0)begin 
					`uvm_fatal(get_type_name(),$psprintf("m_mac_tx_num is %0d,should send pkt",m_mac_tx_num));
				end
				mac_tx_en_pedge = 1'b0;
			end
		end*/

        //here is for mac_tx start send pkt data
		if((mac_tx_en_dly == 1'b0)&&(bus.mon_cb.m_mac_tx_en == 1'b1))begin 
			m_mac_tx_num ++;
		end

		if((gate_state_dly == 8'h1)&&(bus.mon_cb.m_gate_state == 8'h0))begin 
			cycle_cnt ++;
		end

		//this is for in this time we continue send pkt
		//if((m_mac_tx_num > 0)&&(m_mac_tx_num < (m_pkt_cfg.m_pkt_num - 1)))begin 
		//if((m_mac_tx_num < (m_pkt_cfg.m_pkt_num - 1))&&(gate_start_en == 1'b1))begin 
		if((cycle_cnt > 0)&&(cycle_cnt <=m_pkt_cfg.m_cycle_round_num))begin 
			//this is is for gate_close
			if((gate_state_dly == 8'h1)&&(bus.mon_cb.m_gate_state == 8'h0))begin 
				if(m_mac_tx_num != m_pkt_cfg.m_pkt_num)begin 
					`uvm_fatal(get_type_name(),$psprintf("m_mac_tx_num is %0d while the m_pkt_num is %0d",m_mac_tx_num,m_pkt_cfg.m_pkt_num));
				end
				`uvm_info(get_type_name(),$psprintf("m_mac_tx_num is %0d,cycle_cnt is %0d",m_mac_tx_num,cycle_cnt),UVM_NONE);
				m_mac_tx_num = 0;
			end
		end
		if(cycle_cnt > m_pkt_cfg.m_cycle_round_num)begin 
			if((gate_state_dly == 8'h1)&&(bus.mon_cb.m_gate_state == 8'h0))begin 
				if(m_mac_tx_num > 0)begin 
					`uvm_fatal(get_type_name(),$psprintf("cycle_cnt is %0d,m_mac_tx_num is %0d",cycle_cnt,m_mac_tx_num));
				end
			end
		end
	end
endtask

`endif
