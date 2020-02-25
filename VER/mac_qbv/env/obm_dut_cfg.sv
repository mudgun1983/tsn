`ifndef OBM_DUT_CFG__SV
`define OBM_DUT_CFG__SV
class obm_dut_cfg extends uvm_sequence_item;
	rand bit [7:0] 		m_queue_map;
	rand bit [0:0] 		m_gate_en;
	rand bit [63:0] 	m_spare_base_time;
	rand bit [31:0]     m_spare_cyc_time;
	//this is for sotring cyc time ns
	rand bit [31:0]     m_spare_total_cyc_time;
	rand bit [31:0]     m_spare_ext_time;
	rand bit [7:0]      m_spare_list_len;
	rand bit [31:0]     m_list_time_interval[$];
	rand bit [7:0]      m_list_gate_state[$];
	rand bit [63:0] 	m_main_base_time;
	rand bit [31:0]     m_main_cyc_time;
	rand bit [31:0]     m_main_ext_time;
	rand bit [7:0]      m_main_list_len;
	rand bit [31:0]     m_spare_rand_time;
	rand bit [31:0]     m_main_rand_time;

	//0:base_time is larger than the start signal is higher
	//1:base_time is smaller than the start signal is higher
	rand bit [1:0]      m_spare_base_mode;

	//this is for change the second to ns
	rand bit [63:0]     m_spare_total_base_time;
	//0:mormal,interval.sum == m_spare_total_cyc_time
	//1:interval.sum > m_spare_total_cyc_time
	rand bit [1:0]      m_spare_cyc_time_mode;
	//00:initial 01:sel_spare 10:sel_main
		 bit [1:0]      m_sel_spare_en;
		 bit            m_crllist_chk_en=1'b1;

	constraint queue_map_cons{
		m_queue_map inside{[0:255]};
	};

	//we change change it later after basic test case pass
	constraint gat_en_cons{
		m_gate_en dist{
			1'h0:/0,
			1'h1:/1
		};
	};

	constraint spare_list_len_cons{
		if(m_spare_cyc_time_mode == 2'h2){
			m_spare_list_len dist{
				8'h1:/0,
				[8'h5:8'h6]:/10,
				[8'h7:8'hf0]:/0,
				[8'hfe:8'hfe]:/0
			};
		}
		else {
			m_spare_list_len dist{
				8'h2:/0,
				[8'h5:8'h6]:/10,
				[8'h7:8'hf0]:/0,
				[8'hff:8'hff]:/0
			};
		}

		solve m_spare_list_len before m_list_time_interval;

		solve m_spare_list_len before m_list_gate_state;

		solve m_list_time_interval before m_spare_total_cyc_time;

		m_list_time_interval.size() == m_spare_list_len;

        //now the time_interval is at least 8ns
		foreach(m_list_time_interval[i]){
			if(m_spare_list_len >= 8'h40){
				m_list_time_interval[i] dist{
					[32'h80:32'h100]:/10
				};
			}
			else {
				m_list_time_interval[i] dist{
					[32'h300:32'h400]:/10,
					[32'h30:32'h40]:/0
				};
			}
			(m_list_time_interval[i] % 8) == 0;
		}

		m_list_gate_state.size() == m_spare_list_len;

		foreach(m_list_gate_state[i]){
			if(m_spare_cyc_time_mode == 2'h2){
				m_list_gate_state[i] > 8'h0;
			}
			else {
				if(i == (m_spare_list_len - 1)){
					m_list_gate_state[i] dist{
						8'hff :/10,
						[8'h0:8'hff]:/0
					};
				}	
				else {
					m_list_gate_state[i] > 8'h0;
				}
			}
		}
		m_spare_cyc_time_mode dist{
			2'h0:/10,
			2'h1:/0,
			2'h2:/0
		};
        solve m_spare_cyc_time_mode before m_spare_total_cyc_time;
		solve m_spare_list_len before m_spare_total_cyc_time;
		solve m_spare_rand_time before m_spare_total_cyc_time;
		solve m_spare_total_cyc_time  before m_spare_cyc_time;
		solve m_spare_total_cyc_time  before m_spare_ext_time;
		solve m_spare_cyc_time_mode   before m_list_gate_state;

        //adding this is for interval.sum is smaller than cyc_num
		//this is easy for env to handle this
		solve m_spare_cyc_time_mode  before  m_spare_list_len;

        //this is for cyc_time is not equal to time_interval.sum
		m_spare_rand_time dist{
			[32'h10:32'h20]:/0,
			[32'h100:32'h200]:/10,
			[32'h201:32'h400]:/0
		};

		(m_spare_rand_time % 8) == 0;

		if(m_spare_cyc_time_mode == 0){
			m_list_time_interval.sum() == m_spare_total_cyc_time; 
		}
		else if(m_spare_cyc_time_mode == 2'h1){
			if(m_spare_list_len >= 2){
				(m_list_time_interval.sum() - m_spare_rand_time) == m_spare_total_cyc_time;
			}
			else {
				(m_list_time_interval.sum() - 32'h8) == m_spare_total_cyc_time;
			}
		}
		else if(m_spare_cyc_time_mode == 2'h2){
			if(m_spare_list_len >= 2){
				(m_list_time_interval.sum() + m_spare_rand_time) == m_spare_total_cyc_time;
			}
			else {
				(m_list_time_interval.sum() + 32'h8) == m_spare_total_cyc_time;
			}
		}

		//here is for spare_ext_time means ns
		m_spare_cyc_time == (m_spare_total_cyc_time/32'd1_000_000_000);
		m_spare_ext_time == (m_spare_total_cyc_time%32'd1_000_000_000);


		//here change this for if the list is lager,it will take a long time to cfg the reg
		//so it will cause the base time is smaller than the ptp time when the start signal is high
        solve m_spare_list_len   before m_spare_base_time; 
		solve m_spare_base_mode  before m_spare_base_time;
		m_spare_base_mode dist {
			2'h0:/10,
			2'h1:/0
		};
		m_spare_base_time[63:32] == 32'h0;
		if(m_spare_base_mode == 2'h0){
			m_spare_base_time[31:0] dist{
				[32'd150001 + 32'd1000*m_spare_list_len:32'd170000 + 32'd1000*m_spare_list_len]:/10
			};
		}
		else if(m_spare_base_mode == 2'h1){
			m_spare_base_time[31:0] dist{
				[32'd10_0000:32'd11_0000]:/10
			};
		}
		(m_spare_base_time[31:0]%8) == 0;
		solve m_spare_base_time before m_spare_total_base_time; 
		m_spare_total_base_time == (({32'h0,m_spare_base_time[63:32]}*64'h1_000_000_000) + {32'h0,m_spare_base_time[31:0]});
	};

	constraint main_list_len_cons{
		m_main_list_len dist{
			8'h1:/0,
			[8'h2:8'h6]:/10,
			[8'h7:8'hff]:/0
		};
	};

/*
//here change this for if the list is lager,it will take a long time to cfg the reg
//so it will cause the base time is smaller than the ptp time when the start signal is high
	constraint spare_base_time_cons {
		m_spare_base_time[63:32] == 32'h0;
		m_spare_base_time[31:0] dist{
			[32'd0:32'd150000]:/0,
			[32'd150001:32'd170000]:/10
		};
		(m_spare_base_time[31:0]%8) == 0;
		solve m_spare_base_time before m_spare_total_base_time; 
		m_spare_total_base_time == (({32'h0,m_spare_base_time[63:32]}*64'h1_000_000_000) + {32'h0,m_spare_base_time[31:0]});
	};
*/
	constraint cyc_time_cons{
		//m_spare_cyc_time == 32'h0;
	};

	`uvm_object_utils_begin(obm_dut_cfg)
		`uvm_field_int(m_queue_map,UVM_ALL_ON)	
		`uvm_field_int(m_gate_en,UVM_ALL_ON)	
		`uvm_field_int(m_spare_base_time,UVM_ALL_ON)	
		`uvm_field_int(m_spare_cyc_time,UVM_ALL_ON)	
		`uvm_field_int(m_spare_total_cyc_time,UVM_ALL_ON)	
		`uvm_field_int(m_spare_ext_time,UVM_ALL_ON)	
		`uvm_field_int(m_spare_list_len,UVM_ALL_ON)	
		`uvm_field_queue_int(m_list_time_interval,UVM_ALL_ON)	
		`uvm_field_queue_int(m_list_gate_state,UVM_ALL_ON)	
		`uvm_field_int(m_spare_rand_time,UVM_ALL_ON)	
		`uvm_field_int(m_spare_total_base_time,UVM_ALL_ON)	
		`uvm_field_int(m_main_rand_time,UVM_ALL_ON)	
		`uvm_field_int(m_main_base_time,UVM_ALL_ON)	
		`uvm_field_int(m_main_cyc_time,UVM_ALL_ON)	
		`uvm_field_int(m_main_ext_time,UVM_ALL_ON)	
		`uvm_field_int(m_main_list_len,UVM_ALL_ON)	
		`uvm_field_int(m_spare_cyc_time_mode,UVM_ALL_ON)	
		`uvm_field_int(m_spare_base_mode,UVM_ALL_ON)	
		`uvm_field_int(m_sel_spare_en,UVM_ALL_ON)	
	`uvm_object_utils_end
	function new(string name ="obm_dut_cfg");
		super.new(name);
		$value$plusargs("m_crllist_chk_en=%d",m_crllist_chk_en);
	endfunction
endclass
`endif
