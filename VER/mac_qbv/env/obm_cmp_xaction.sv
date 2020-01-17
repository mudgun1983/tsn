`ifndef OBM_CMP_XACTION__SV
`define OBM_CMP_XACTION__SV
class obm_cmp_xaction extends uvm_sequence_item;
	//in the queue it store the cyc_index 
	//8:means 8 queue;[int] index is cycle round num;
	//[]the size is for ti num is one cycle
	//[$] means in ti how many data has been sent
	rand int             m_obm_data_q[8][][int][$];
	//8:means 8 queue;[]the size is for ti num is one cycle
	rand int             m_obm_ref_data[8][];
	obm_dut_cfg          m_dut_cfg;
	//this is for store the total data in this gate cycle
	//rand int             m_obm_total_data_q[8][][int];
	`uvm_object_utils_begin(obm_cmp_xaction)
	`uvm_object_utils_end

	function new(string name="obm_cmp_xaction");
		super.new(name);
		m_dut_cfg = new("m_dut_cfg");
	endfunction
	extern virtual function void store_data_base_ptp(bit [63:0] ptp_time,bit [2:0] queue_num);
	extern virtual function bit [63:0] chn_second_to_ns(bit [63:0] ptp_time);
endclass

function void obm_cmp_xaction::store_data_base_ptp(bit [63:0] ptp_time,bit [2:0] queue_num); 
	bit [63:0] ns_time;
	bit [63:0] relative_time;
	bit [63:0] round_time;
	bit [63:0] sum_time;
	int        list_num;
	if(m_dut_cfg.m_sel_spare_en[0] == 1'b1)begin 
		ns_time = chn_second_to_ns(ptp_time);	
         //this is for get the time after the base_time
         relative_time = (ptp_time - m_dut_cfg.m_spare_total_base_time - crllist_chk_dec::GATE_LATENCY + crllist_chk_dec::CYC_PEROID);
         //this is for get the time in the round of cyc_time
         round_time = (relative_time%m_dut_cfg.m_spare_total_cyc_time);

         //this is for cyc_time boundary
         if(((relative_time/m_dut_cfg.m_spare_total_cyc_time) > 0)&&(round_time == 0))begin
             round_time = ((relative_time - crllist_chk_dec::CYC_PEROID)%m_dut_cfg.m_spare_total_cyc_time);
         end

         sum_time = 64'h0;
         for(int i=0;i<m_dut_cfg.m_spare_list_len;i++)begin
             sum_time = (sum_time + m_dut_cfg.m_list_time_interval[i]);
             if(sum_time >= round_time)begin
                 list_num = i;
                 break;
             end
         end
		 m_obm_data_q[queue_num][list_num][round_time].push_back(1);
	end
endfunction:store_data_base_ptp

function bit [63:0] obm_cmp_xaction::chn_second_to_ns(bit [63:0] ptp_time);

     bit [63:0]  ns_time;
     if(ptp_time[31:0] >= 32'd1_000_000_000)begin
         `uvm_error(get_type_name(),$psprintf("ptp_time is 0x%0hens should not exceed this",ptp_time));
     end
     ns_time = (({32'h0,ptp_time[63:32]}*{32'h0,32'd1_000_000_000}) + {32'h0,ptp_time[31:0]});
    return ns_time;
endfunction:chn_second_to_ns
`endif
