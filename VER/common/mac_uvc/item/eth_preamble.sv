//------------------------------------------------------------------------------
//
// CLASS: eth_preamble
//
//------------------------------------------------------------------------------

class eth_preamble extends uvm_sequence_item;

//==================== Attribute =================//
  rand bit [7:0]     data_preamble[];
  rand bit [7:0]     sfd            ;
  rand bit [7:0]     smd            ;
  rand bit [7:0]     frag_cnt       ;
  rand int unsigned  preamble_length;
//==================== Attribute =================//


//==================== Registration ==============//
  `uvm_object_utils_begin(eth_preamble)
    `uvm_field_array_int (data_preamble  , UVM_ALL_ON);
    `uvm_field_int       (sfd            , UVM_ALL_ON); 
    `uvm_field_int       (preamble_length, UVM_ALL_ON);  
	`uvm_field_int       (smd            , UVM_ALL_ON); 
	`uvm_field_int       (frag_cnt       , UVM_ALL_ON); 
  `uvm_object_utils_end
//==================== Registration ==============//


//==================== Constraint ================//
  constraint c_preamble_length{ 
      preamble_length inside {[1:7]};//== 7;
  }
  	                   
  constraint c_data_preamble_size{
      data_preamble.size() == 7;//preamble_length;
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
