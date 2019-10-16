//FILE_HEADER------------------------------------------------------------------------------------------
// ZTE  Copyright
// ZTE Company Confidential
//-----------------------------------------------------------------------------------------------------
// FILE NAME:       rgm_virtual_sequencer.sv
// DEPARTMENT:      transmission hardware developing department
// AUTHOR:          chen chengman
// AUTHOR'S EMAIL:  chen.chengman@zte.com.cn
//-----------------------------------------------------------------------------------------------------
// RELEASE HISTORY: N/A
// VERSION      DATE         AUTHOR       DESCRIPTION
// 1.0         2012-06-22    chen chengman   uvm
//-----------------------------------------------------------------------------------------------------
// KEYWORDS: rgm_vip_tb
//-----------------------------------------------------------------------------------------------------
// PURPOSE: run the rgm_vip to build the testbench 
//--------------------------------------------------------------------------------------------------
// PARAMETERS
//         PARAM  NAME    RANGE    : DESCRIPTION    :DEFAULT   :UNITS
//              
//-----------------------------------------------------------------------------------------------------
//REUSE ISSUES
// Reset Strategy:  N/A
// Clock  Domains:  N/A
// Critical Timing: N/A
// Test   Features: N/A
// Asynchronous I/F:N/A
// Scan Methodology:N/A
// Instaniations:   N/A
// Synthesizable:   N/A
// Other:   
// END_HEADER---------------------------------------------------------------------------------------------

`ifndef PCS_VIRTUAL_SEQUENCER_SV
`define PCS_VIRTUAL_SEQUENCER_SV

//typedef class cpu_sequencer;
class pcs_virtual_sequencer extends uvm_sequencer;

//uvm_get_port #(uvm_sequence_item) req_get_port[];

string inst_name;
protected bit [12:0] pg_id;
event timing_trigger;
event decision_trigger;
event timing_trigger_aps;
event decision_trigger_aps;
event cal_trigger;
event tran_rr_packet;
event configure_done;
event cfg_refresh;

    `uvm_sequencer_utils_begin(pcs_virtual_sequencer)
//      `uvm_field_int(example, uvm_ALL_ON)
    `uvm_sequencer_utils_end
     
     cpu_sequencer  rgm_sqr;
	 mac_rx_base_sequencer mac_sqr;
     mac_rx_base_sequencer mac_sqr_array[];
     
    function new(string name = "pcs_virtual_sequencer", uvm_component parent);
        super.new(name,parent);        
        `uvm_update_sequence_lib
		mac_sqr_array = new[20];
//        req_get_port = new[64];
//        for(int i=0;i<req_get_port.size;i++)
//        	     begin
//        	     	  $sformat(inst_name, "req_get_port[%0d]", i);
//        	        req_get_port[i] = new(inst_name, this);
//        	     end
    endfunction
  
//================================================//
//FUNCTION    : build
//DESCRIPTION : 
//================================================//
    function void build();
        super.build();    
    endfunction
endclass : pcs_virtual_sequencer
`endif
