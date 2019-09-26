//FILE_HEADER------------------------------------------------------------------------------------------
// ZTE  Copyright
// ZTE Company Confidential
//-----------------------------------------------------------------------------------------------------
// FILE NAME:       eth_preamble.sv
// DEPARTMENT:      Multi-Service Bearer Product ShenZhen Design&Development Dept.
// AUTHOR:          Li Xiangqiong
// AUTHOR'S EMAIL:  li.xiangqiong@zte.com.cn
//-----------------------------------------------------------------------------------------------------
// RELEASE HISTORY: N/A
// VERSION      DATE         AUTHOR       DESCRIPTION
// 1.1         2010-5-28    Li Xiangqiong   UVM
// 1.2         2016-7-19    Song Gaoqian    UVM
//-----------------------------------------------------------------------------------------------------
// KEYWORDS: eth_preamble
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
//
// CLASS: eth_preamble
//
//------------------------------------------------------------------------------

class eth_preamble extends uvm_sequence_item;

//==================== Attribute =================//
  rand bit [7:0]     data_preamble[];
  rand bit [7:0]     sfd            ;
  rand int unsigned  preamble_length;
//==================== Attribute =================//


//==================== Registration ==============//
  `uvm_object_utils_begin(eth_preamble)
    `uvm_field_array_int (data_preamble  , UVM_ALL_ON);
    `uvm_field_int       (sfd            , UVM_ALL_ON); 
    `uvm_field_int       (preamble_length, UVM_ALL_ON);  
  `uvm_object_utils_end
//==================== Registration ==============//


//==================== Constraint ================//
  constraint c_preamble_length{ 
      preamble_length inside {[1:7]};//== 7;
  }
  	                   
  constraint c_data_preamble_size{
      data_preamble.size() == preamble_length;
  }   
  
  constraint c_data_preamble{
      foreach(data_preamble[i]){
        data_preamble[i] == 8'h55;
      }
  }   
 
  constraint c_sfd{
      sfd == 8'hd5;
  }   
//==================== Constraint ================//


  
//================================================//
//FUNCTION    : new
//DESCRIPTION : construct
//================================================//
  function new (string name = "eth_preamble");
    super.new();
  endfunction

//================================================//
//FUNCTION    : user_pack
//DESCRIPTION : pack the pdu units to frame_data
//================================================//
  function void user_pack(ref uvm_packer packer);
    foreach(data_preamble[i]) begin
      packer.pack_field_int(data_preamble[i],8);
    end
    packer.pack_field_int(sfd,8);
  endfunction
 
endclass : eth_preamble
