//FILE_HEADER------------------------------------------------------------------------------------------
// ZTE  Copyright
// ZTE Company Confidential
//-----------------------------------------------------------------------------------------------------
// FILE NAME:       eth_protocol_error.sv
// DEPARTMENT:      Multi-Service Bearer Product ShenZhen Design&Development Dept.
// AUTHOR:          Li Xiangqiong
// AUTHOR'S EMAIL:  li.xiangqiong@zte.com.cn
//-----------------------------------------------------------------------------------------------------
// RELEASE HISTORY: N/A
// VERSION      DATE         AUTHOR       DESCRIPTION
// 1.1         2010-5-28    Li Xiangqiong   UVM
//-----------------------------------------------------------------------------------------------------
// KEYWORDS: eth_protocol_error
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

`ifndef ETH_PROTOCOL_ERROR_SV
`define ETH_PROTOCOL_ERROR_SV

//typedef enum {TX_ER,RX_ER,DATA_ERROR
//	           }                      eth_protocol_error_kind;
//typedef enum {SINGLE_TIME,MULTI_TIME} eth_error_occurrence;
//typedef enum {IPG,PREAMBLE,HEADER,
//	            DATA,CRC,CARRIER_EXTENSION,
//	            ABSOLUTE,RANDOM}      eth_packet_phase;
	           
//------------------------------------------------------------------------------
//
// CLASS: eth_protocol_error
//
//------------------------------------------------------------------------------

class eth_protocol_error extends uvm_sequence_item;

  typedef enum {TX_ER,RX_ER,DATA_ERROR} eth_protocol_error_kind;
  typedef enum {SINGLE_TIME,MULTI_TIME} eth_error_occurrence;
  typedef enum {IPG,PREAMBLE,HEADER,
  	            DATA,CRC,CARRIER_EXTENSION,
  	            ABSOLUTE,RANDOM}      eth_packet_phase;

  rand eth_protocol_error_kind  error_kind;
  rand eth_error_occurrence     error_occurrence;
  rand eth_packet_phase         error_phase;
  

  `uvm_object_utils_begin(eth_protocol_error)
    `uvm_field_enum(eth_protocol_error_kind,error_kind,UVM_ALL_ON)
    `uvm_field_enum(eth_error_occurrence,error_occurrence,UVM_ALL_ON)
    `uvm_field_enum(eth_packet_phase,error_phase,UVM_ALL_ON)
  `uvm_object_utils_end
  
  //--------------------------------------------------------------------
  // new - constructor
  //--------------------------------------------------------------------
  function new (string name = "eth_protocol_error");
    super.new();
  endfunction

endclass : eth_protocol_error

`endif // ETH_PROTOCOL_ERROR_SV
