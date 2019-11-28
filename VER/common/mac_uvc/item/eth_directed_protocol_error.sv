`ifndef ETH_DIRECTED_PROTOCOL_ERROR_SV
`define ETH_DIRECTED_PROTOCOL_ERROR_SV

//------------------------------------------------------------------------------
//
// CLASS: eth_preamble
//
//------------------------------------------------------------------------------

class eth_directed_protocol_error extends uvm_sequence_item;

  typedef enum {TX_ER,RX_ER,DATA_ERROR} eth_protocol_error_kind;
  typedef enum {IPG,PREAMBLE,HEADER,
  	            DATA,CRC,CARRIER_EXTENSION,
  	            ABSOLUTE,RANDOM}      eth_packet_phase;
  typedef enum {UNDEFINED,DATA_,SPECIAL} eth_invalid_code_kind;
  
  rand  eth_protocol_error_kind  error_kind;
  rand  eth_packet_phase         error_phase;
  rand  eth_invalid_code_kind    invalid_code_kind;
  rand int unsigned             timing;
  rand int unsigned             length;
  rand bit unsigned [0:1]       lane_no;
  rand bit unsigned [0:1]       invalid_sync_header;
  rand bit unsigned [0:3]       num;
  rand byte unsigned            invalid_control_code;
  rand byte unsigned            invalid_block_type_field;
  


  `uvm_object_utils_begin(eth_directed_protocol_error)
    `uvm_field_enum(eth_protocol_error_kind,error_kind,UVM_ALL_ON)
    `uvm_field_enum(eth_packet_phase,error_phase,UVM_ALL_ON)
    `uvm_field_enum(eth_invalid_code_kind,invalid_code_kind,UVM_ALL_ON)
    `uvm_field_int(timing,UVM_ALL_ON)
    `uvm_field_int(length,UVM_ALL_ON)
    `uvm_field_int(lane_no,UVM_ALL_ON)
    `uvm_field_int(invalid_sync_header,UVM_ALL_ON)
    `uvm_field_int(num,UVM_ALL_ON)
    `uvm_field_int(invalid_control_code,UVM_ALL_ON)
    `uvm_field_int(invalid_block_type_field,UVM_ALL_ON)
    
  `uvm_object_utils_end
  
  //--------------------------------------------------------------------
  // new - constructor
  //--------------------------------------------------------------------
  function new (string name = "eth_directed_protocol_error");
    super.new();
  endfunction

endclass : eth_directed_protocol_error

`endif // ETH_DIRECTED_PROTOCOL_ERROR_SV
