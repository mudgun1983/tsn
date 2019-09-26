//FILE_HEADER------------------------------------------------------------------------------------------
// ZTE  Copyright
// ZTE Company Confidential
//-----------------------------------------------------------------------------------------------------
// FILE NAME:       mac_seq_lib.sv
// DEPARTMENT:      Multi-Service Bearer Product ShenZhen Design&Development Dept.
// AUTHOR:          Song Gaoqian
// AUTHOR'S EMAIL:  song.gaoqian123@zte.com.cn
//-----------------------------------------------------------------------------------------------------
// RELEASE HISTORY: N/A
// VERSION      DATE         AUTHOR       DESCRIPTION
// 1.0         2016-7-18     Song Gaoqian    UVM
//-----------------------------------------------------------------------------------------------------
// KEYWORDS: mac_seq_lib
//-----------------------------------------------------------------------------------------------------
// PURPOSE: 
//--------------------------------------------------------------------------------------------------
// PARAMETERS
//         PARAM  NAME    RANGE    : DESCRIPTION    :DEFAULT   :UNITS
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

//------------------------------------------------------------------------------
// CLASS: mac_base_sequence
//------------------------------------------------------------------------------
/*{{{*/
typedef class mac_rx_base_sequencer;

class mac_base_sequence extends uvm_sequence#(eth_frame);
 
  rand bit [47:0] frame_cnt;
  rand bit [47:0] da_frame_cnt;
  rand bit [47:0] sa_frame_cnt;

  `ifdef GMII_RX_PUSH_MODE
    `uvm_sequence_utils(mac_base_sequence,mac_rx_base_push_sequencer)
  `else
    `uvm_sequence_utils(mac_base_sequence,mac_rx_base_sequencer)
  `endif

  //================================================//
  //FUNCTION    : new
  //================================================//
    function new (string name = "mac_base_sequence");               
      super.new();
    endfunction:new

  //================================================//
  //TASK    : body
  //================================================//
    virtual task body();
       `uvm_info(get_type_name(),{$psprintf("generate item\n",),req.sprint()},UVM_FULL);
    endtask: body

endclass : mac_base_sequence
/*}}}*/

