//FILE_HEADER------------------------------------------------------------------------------------------
// ZTE  Copyright
// ZTE Company Confidential
//-----------------------------------------------------------------------------------------------------
// FILE NAME:       pcs_base_driver.sv
// DEPARTMENT:      Multi-Service Bearer Product ShenZhen Design&Development Dept.
// AUTHOR:          Li Xiangqiong
// AUTHOR'S EMAIL:  li.xiangqiong@zte.com.cn
//-----------------------------------------------------------------------------------------------------
// RELEASE HISTORY: N/A
// VERSION      DATE         AUTHOR       DESCRIPTION
// 1.1         2011-9-20    Li Xiangqiong   uvm
//-----------------------------------------------------------------------------------------------------
// KEYWORDS: pcs_base_driver
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

`ifndef PCS_BASE_DRIVER_SV
`define PCS_BASE_DRIVER_SV

//------------------------------------------------------------------------------
//
// CLASS: pcs_base_driver
//
//------------------------------------------------------------------------------

class pcs_base_driver extends uvm_driver #(pcs_item);

  uvm_event                    packet_tx_started;
  uvm_event                    packet_tx_ended  ;

  
  `uvm_component_utils(pcs_base_driver)
  
  //--------------------------------------------------------------------
  // new - constructor
  //--------------------------------------------------------------------
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

//  virtual  task get_and_drive();
//    return;
//  endtask : get_and_drive
//
//  virtual  task reset_signals();
//    return;
//  endtask : reset_signals
    
endclass : pcs_base_driver

`endif // pcs_base_driver_SV

