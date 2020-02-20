`ifndef OBM_CASE1_CFG__SV
`define OBM_CASE1_CFG__SV
class obm_case1_cfg extends obm_dut_cfg;
	`uvm_object_utils(obm_case1_cfg)

	constraint spare_list_len_cons{
		m_spare_list_len == 8'h8;

		solve m_spare_list_len before m_list_time_interval;

		solve m_spare_list_len before m_list_gate_state;

		solve m_list_time_interval before m_spare_total_cyc_time;

		m_list_time_interval.size() == m_spare_list_len;

        //now the time_interval is at least 8ns
		foreach(m_list_time_interval[i]){
			m_list_time_interval[i] inside {[13000:15000]};
			(m_list_time_interval[i] % 8) == 0;
		}

		m_list_gate_state.size() == m_spare_list_len;

		foreach(m_list_gate_state[i]){
			if(i == 0){
				m_list_gate_state[i] == 8'h1;
			}
			else {
				m_list_gate_state[i] == 8'h0;
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
		//for in case0,we want to send learn pkt at the gate_state both open,so we add some delay for this
		m_spare_base_time[63:32] == 32'h0;
		if(m_spare_base_mode == 2'h0){
			m_spare_base_time[31:0] dist{
				[32'd150001 + 32'd1000*(m_spare_list_len + 10):32'd170000 + 32'd1000*(m_spare_list_len + 10)]:/10
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

	extern function new(string name="obm_case1_cfg");
endclass:obm_case1_cfg
function obm_case1_cfg::new(string name="obm_case1_cfg");
	super.new(name);
endfunction:new
`endif
