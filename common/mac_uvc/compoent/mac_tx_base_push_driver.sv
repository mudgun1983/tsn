//FILE_HEADER------------------------------------------------------------------------------------------
// ZTE  Copyright
// ZTE Company Confidential
//-----------------------------------------------------------------------------------------------------
// FILE NAME:       mac_tx_base_push_driver.sv
// DEPARTMENT:      Multi-Service Bearer Product ShenZhen Design&Development Dept.
// AUTHOR:          Li Xiangqiong
// AUTHOR'S EMAIL:  li.xiangqiong@zte.com.cn
//-----------------------------------------------------------------------------------------------------
// RELEASE HISTORY: N/A
// VERSION      DATE         AUTHOR       DESCRIPTION
// 1.1         2011-9-20    Li Xiangqiong   UVM
//-----------------------------------------------------------------------------------------------------
// KEYWORDS: mac_tx_base_push_driver
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

`ifndef MAC_TX_BASE_PUSH_DRIVER_SV
`define MAC_TX_BASE_PUSH_DRIVER_SV

//------------------------------------------------------------------------------
//
// CLASS: mac_tx_base_push_driver
//
//------------------------------------------------------------------------------

class mac_tx_base_push_driver extends uvm_push_driver #(eth_frame);

  uvm_event                    packet_tx_started;
  uvm_event                    packet_tx_ended  ;
  mac_runtime_config_item      rt_cfg           ;
  mac_env_static_config        static_cfg       ;
  
  `uvm_component_utils(mac_tx_base_push_driver)
  //--------------------------------------------------------------------
  // new - constructor
  //--------------------------------------------------------------------
  function new (string name, uvm_component parent);
    super.new(name, parent);
    packet_tx_started = new("packet_tx_started");
    packet_tx_ended   = new("packet_tx_ended"  );
    rt_cfg            = new();
    static_cfg        = new();
  endfunction : new

endclass : mac_tx_base_push_driver

`endif // MAC_TX_BASE_PUSH_DRIVER_SV

