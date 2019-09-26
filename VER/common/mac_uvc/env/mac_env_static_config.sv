//FILE_HEADER------------------------------------------------------------------------------------------
// ZTE  Copyright
// ZTE Company Confidential
//-----------------------------------------------------------------------------------------------------
// FILE NAME:       mac_env_static_config.sv
// DEPARTMENT:      transmission hardware developing department
// AUTHOR:          Li Xiangqiong
// AUTHOR'S EMAIL:  li.xiangqiong@zte.com.cn
//-----------------------------------------------------------------------------------------------------
// RELEASE HISTORY: N/A
// VERSION      DATE         AUTHOR       DESCRIPTION
// 1.0         2011-6-25    Li Xiangqiong   UVM
//-----------------------------------------------------------------------------------------------------
// KEYWORDS: mac_env_static_config
//-----------------------------------------------------------------------------------------------------
// PURPOSE: 
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

class mac_env_static_config extends uvm_transaction;
  
  //interface_mode_e          interface_mode;
  uvm_active_passive_enum   rx_is_active = UVM_ACTIVE;
  uvm_active_passive_enum   tx_is_active = UVM_PASSIVE;
 
  rand bit                  tx_ena;
  rand bit                  rx_ena;
  rand bit                  tx_push_mode;
  rand bit                  rx_push_mode;
  rand bit                  tx_sqr_is_hier;
  rand bit                  rx_sqr_is_hier;           
  
  `uvm_object_utils_begin(mac_env_static_config)
    `uvm_field_int(tx_ena,UVM_ALL_ON)
    `uvm_field_int(rx_ena,UVM_ALL_ON)
    `uvm_field_int(tx_push_mode,UVM_ALL_ON)
    `uvm_field_int(rx_push_mode,UVM_ALL_ON)
    `uvm_field_int(tx_sqr_is_hier,UVM_ALL_ON)
    `uvm_field_int(rx_sqr_is_hier,UVM_ALL_ON)
    `uvm_field_enum(uvm_active_passive_enum,tx_is_active,UVM_ALL_ON)
    `uvm_field_enum(uvm_active_passive_enum,rx_is_active,UVM_ALL_ON)
    //`uvm_field_enum(interface_mode_e,interface_mode,UVM_ALL_ON)
  `uvm_object_utils_end
  
  function new (string name = "mac_env_static_config");
    super.new(name);
  endfunction : new
  
  constraint c_default{
    tx_ena           == 1'b1;   
    rx_ena           == 1'b1;
    tx_push_mode     == 1'b0;
    rx_push_mode     == 1'b0;
    tx_sqr_is_hier   == 1'b0;
    rx_sqr_is_hier   == 1'b0;
  }

  virtual function set_default_config();
          
         
  endfunction

endclass : mac_env_static_config
