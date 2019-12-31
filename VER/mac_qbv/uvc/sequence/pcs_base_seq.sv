//FILE_HEADER------------------------------------------------------------------------------------------
// ZTE  Copyright
// ZTE Company Confidential
//-----------------------------------------------------------------------------------------------------
// FILE NAME:       pcs_base_seq.sv
// DEPARTMENT:      Multi-Service Bearer Product ShenZhen Design&Development Dept.
// AUTHOR:           
// AUTHOR'S EMAIL:   
//-----------------------------------------------------------------------------------------------------
// RELEASE HISTORY: N/A
// VERSION      DATE         AUTHOR       DESCRIPTION
// 1.1         2011-9-13    
// 1.2         2012-3-8     Wang Guobing    Change the label identify
//-----------------------------------------------------------------------------------------------------
// KEYWORDS: pcs_base_seq
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

`ifndef pcs_base_seq
`define pcs_base_seq


//------------------------------------------------------------------------------
//
// CLASS: XXXX
//
//------------------------------------------------------------------------------

class pcs_base_seq extends uvm_sequence #(pcs_item);

`ifdef  ALIGN_MARKER_FAST_SIMULATE
`define RX_MARK_LENGTH 14'hfb
`else
`define RX_MARK_LENGTH 14'h3fff
`endif

//==================== Enum ======================//
//typedef typedef enum {,,} enum_name
//==================== Enum ======================//


//==================== Knob ======================//
//randc enum_name kind_name;   
//==================== Knob ======================//


//==================== Attribute =================//  
//pcs_base_sequencer p_sequencer;     
//==================== Attribute =================//


//==================== Registration ==============//
    `uvm_sequence_utils(pcs_base_seq,pcs_base_sequencer)                                    
//    `uvm_object_utils(pcs_base_seq)
//    `uvm_declare_p_sequencer(pcs_base_sequencer)
//==================== Registration ==============//



//==================== Constraint ================//
//constraint c_name { ;}         
//==================== Constraint ================//                           
                        
//================================================//
//FUNCTION    : pre_do
//DESCRIPTION : construct
//================================================//     
  virtual task pre_do(bit is_item);
     bit [63:0] block_data;
     bit [7:0] random_data;
     
     if(p_sequencer.pcs_block_count==`RX_MARK_LENGTH)
        p_sequencer.pcs_block_count=0;
     else
        p_sequencer.pcs_block_count++;
     
     if(p_sequencer.pcs_block_count ==0)
        begin
        	req.packet_type = pcs_item::AM;
        	//$display("time=%0t,insert AM",$time);
        end
     else
        req.packet_type = pcs_item::DATA;
     
     random_data = $random;
     
     block_data = $random;//{random_data,{6{8'hff}},(random_data)};
            
     foreach(req.lane_block[key])
        begin
        	if(key!=0)
        	  req.lane_block[key]={2'b01,(block_data+8'(key))};//66'h1_0000_0000_0000_0000;//66'h1_aa_bb_cc_dd_ee_ff_99_88;//key;
        	else
        	  req.lane_block[key]={2'b01,(block_data+8'(key))};
        end
        
     foreach(req.lane_block[key])  
        req.lane_block[key].rand_mode(0);   
        
        req.packet_type.rand_mode(0);
  endtask                 
                                
//================================================//
//FUNCTION    : new
//DESCRIPTION : construct
//================================================//
    function new (string name = "pcs_base_seq");               
        super.new();             
    endfunction:new

//=====================================================
  virtual task pre_body();/*{{{*/
       uvm_test_done.raise_objection(this);
       `uvm_info(get_type_name(),"[START_SEQUENCE]",UVM_LOW)
  endtask : pre_body

  virtual task body();
     forever 
     begin
     //	$display("test in pcs seq");
     `uvm_do(req)
     `uvm_info(get_type_name(),"uvm_do done",UVM_HIGH)
     get_response(rsp);
     `uvm_info(get_type_name(),"get_response done",UVM_HIGH)
     end
  endtask
 
  virtual task post_body();
      uvm_test_done.drop_objection(this);
      `uvm_info(get_type_name(),"[STOP_SEQUENCE]",UVM_LOW)
  endtask : post_body

 //==================================    
 
endclass : pcs_base_seq


`endif // LABEL_FRAME_SV
