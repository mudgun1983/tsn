//FILE_HEADER------------------------------------------------------------------------------------------
// ZTE  Copyright
// ZTE Company Confidential
//-----------------------------------------------------------------------------------------------------
// FILE NAME:       mac_tx_base_sequencer.sv
// DEPARTMENT:      Multi-Service Bearer Product ShenZhen Design&Development Dept.
// AUTHOR:          Li Xiangqiong
// AUTHOR'S EMAIL:  li.xiangqiong@zte.com.cn
//-----------------------------------------------------------------------------------------------------
// RELEASE HISTORY: N/A
// VERSION      DATE         AUTHOR       DESCRIPTION
// 1.1         2011-9-20    Li Xiangqiong   UVM
//-----------------------------------------------------------------------------------------------------
// KEYWORDS: mac_tx_base_sequencer
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

`ifndef MAC_TX_BASE_SEQUENCER_SV
`define MAC_TX_BASE_SEQUENCER_SV

//------------------------------------------------------------------------------
//
// CLASS: mac_tx_base_sequencer
//
//------------------------------------------------------------------------------

class mac_tx_base_sequencer extends uvm_sequencer #(eth_frame);
  protected int unsigned       mac_tx_base_sqr_id;

  `uvm_sequencer_utils_begin(mac_tx_base_sequencer)
    `uvm_field_int(mac_tx_base_sqr_id, UVM_ALL_ON)
  `uvm_sequencer_utils_end

  //--------------------------------------------------------------------
  // new - constructor
  //--------------------------------------------------------------------
  function new (string name, uvm_component parent);
    super.new(name, parent);
    `uvm_update_sequence_lib_and_item(eth_frame)
  endfunction : new

  //--------------------------------------------------------------------
  // build
  //--------------------------------------------------------------------
  function void build();
    set_arbitration(SEQ_ARB_FIFO);
  endfunction : build
  
endclass : mac_tx_base_sequencer

`endif // MAC_TX_BASE_SEQUENCER_SV

