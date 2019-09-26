//FILE_HEADER------------------------------------------------------------------------------------------
// ZTE  Copyright
// ZTE Company Confidential
//-----------------------------------------------------------------------------------------------------
// FILE NAME:       mac_tx_base_driver.sv
// DEPARTMENT:      Multi-Service Bearer Product ShenZhen Design&Development Dept.
// AUTHOR:          Li Xiangqiong
// AUTHOR'S EMAIL:  li.xiangqiong@zte.com.cn
//-----------------------------------------------------------------------------------------------------
// RELEASE HISTORY: N/A
// VERSION      DATE         AUTHOR       DESCRIPTION
// 1.1         2011-9-20    Li Xiangqiong   UVM
//-----------------------------------------------------------------------------------------------------
// KEYWORDS: mac_tx_base_driver
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

`ifndef MAC_TX_BASE_DRIVER_SV
`define MAC_TX_BASE_DRIVER_SV

//------------------------------------------------------------------------------
//
// CLASS: mac_tx_base_driver
//
//------------------------------------------------------------------------------

class mac_tx_base_driver extends uvm_driver #(eth_frame);

  uvm_event                    packet_tx_started;
  uvm_event                    packet_tx_ended  ;
  
  REQ                          reqs_list[$]     ;
  bit                          cfg_ResetMode    ;
  bit                          cfg_LinkEN       ;
  
  `uvm_component_utils(mac_tx_base_driver)
  
  //--------------------------------------------------------------------
  // new - constructor
  //--------------------------------------------------------------------
  function new (string name, uvm_component parent);
    super.new(name, parent);
    packet_tx_started = new("packet_tx_started");
    packet_tx_ended   = new("packet_tx_ended  ");
  endfunction : new

  virtual protected task get_and_drive();
    return;
  endtask : get_and_drive

  virtual protected task reset_signals();
    return;
  endtask : reset_signals
  
  virtual protected task mac_tx(eth_frame trans);
    return;
  endtask : mac_tx
  
endclass : mac_tx_base_driver

`endif // MAC_TX_BASE_DRIVER_SV

