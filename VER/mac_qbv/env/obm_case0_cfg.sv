`ifndef OBM_CASE0_CFG__SV
`define OBM_CASE0_CFG__SV
class obm_case0_cfg extends obm_dut_cfg;
	`uvm_object_utils(obm_case0_cfg)
	constraint main_list_len_cons{
		m_main_list_len dist{
			8'h1:/0,
			[8'h2:8'h6]:/0,
			[8'h10:8'h10]:/10
		};
	};

	/*constraint spare_list_len_cons{
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
	};*/

	extern function new(string name="obm_case0_cfg");
endclass:obm_case0_cfg
function obm_case0_cfg::new(string name="obm_case0_cfg");
	super.new(name);
endfunction:new
`endif
