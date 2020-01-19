`ifndef QBV_DUT_CFG__SV
`define QBV_DUT_CFG__SV
class qbv_dut_cfg extends uvm_sequence_item;
	rand bit [7:0] 		m_queue_map;
	rand bit [0:0] 		m_gate_en;
	rand bit [63:0] 	m_spare_base_time;
	rand bit [31:0]     m_spare_cyc_time;
	rand bit [31:0]     m_spare_ext_time;
	rand bit [7:0]      m_spare_list_len;
	rand bit [31:0]     m_list_time_interval[$];
	rand bit [7:0]      m_list_gate_state[$];
	rand bit [63:0] 	m_main_base_time;
	rand bit [31:0]     m_main_cyc_time;
	rand bit [31:0]     m_main_ext_time;
	rand bit [7:0]      m_main_list_len;

	constraint queue_map_cons{
		m_queue_map == 8'hff;
	};

	//we change change it later after basic test case pass
	constraint gat_en_cons{
		m_gate_en dist{
			1'h0:/0,
			1'h1:/1
		};
	};

	constraint spare_list_len_cons{
		m_spare_list_len dist{
			8'h1:/0,
			[8'h2:8'h6]:/10,
			[8'h7:8'hff]:/0
		};

		solve m_spare_list_len before m_list_time_interval;

		solve m_spare_list_len before m_list_gate_state;

		solve m_list_time_interval before m_spare_ext_time;

		m_list_time_interval.size() == m_spare_list_len;
		foreach(m_list_time_interval[i]){
			m_list_time_interval[i] dist{
				[32'h300:32'h400]:/10
			};
			(m_list_time_interval[i] % 8) == 0;
		}

		m_list_gate_state.size() == m_spare_list_len;

		foreach(m_list_gate_state[i]){
			if(i == (m_spare_list_len - 1)){
				m_list_gate_state[i] == 8'hff;
			}
			else {
				m_list_gate_state[i] > 8'h0;
			}
		}

		m_list_time_interval.sum() == m_spare_ext_time; 
	};

	constraint main_list_len_cons{
		m_main_list_len dist{
			8'h1:/0,
			[8'h2:8'h6]:/10,
			[8'h7:8'hff]:/0
		};
	};

	constraint spare_base_time_cons {
		m_spare_base_time[63:32] == 32'h0;
		m_spare_base_time[31:0] dist{
			[32'd0:32'd150000]:/0,
			[32'd150001:32'd170000]:/10
		};
		(m_spare_base_time[31:0]%8) == 0;
	};

	constraint cyc_time_cons{
		m_spare_cyc_time == 32'h0;
	};

	/*constraint ext_time_cons{
		m_list_time_interval.sum() == m_spare_ext_time; 
	};

	//solve m_spare_list_len before m_list_time_interval;

	//solve m_list_time_interval before m_spare_ext_time;

	constraint time_interval_cons{
		m_list_time_interval.size() == m_spare_list_len;
		foreach(m_list_time_interval[i]){
			m_list_time_interval[i] dist{
				[32'h300:32'h400]:/10
			};
		}
	};*/

	`uvm_object_utils_begin(qbv_dut_cfg)
		`uvm_field_int(m_queue_map,UVM_ALL_ON)	
		`uvm_field_int(m_gate_en,UVM_ALL_ON)	
		`uvm_field_int(m_spare_base_time,UVM_ALL_ON)	
		`uvm_field_int(m_spare_cyc_time,UVM_ALL_ON)	
		`uvm_field_int(m_spare_ext_time,UVM_ALL_ON)	
		`uvm_field_int(m_spare_list_len,UVM_ALL_ON)	
		`uvm_field_queue_int(m_list_time_interval,UVM_ALL_ON)	
		`uvm_field_queue_int(m_list_gate_state,UVM_ALL_ON)	
		`uvm_field_int(m_main_base_time,UVM_ALL_ON)	
		`uvm_field_int(m_main_cyc_time,UVM_ALL_ON)	
		`uvm_field_int(m_main_ext_time,UVM_ALL_ON)	
		`uvm_field_int(m_main_list_len,UVM_ALL_ON)	
	`uvm_object_utils_end
	function new(string name ="qbv_dut_cfg");
		super.new(name);
	endfunction
endclass
`endif
