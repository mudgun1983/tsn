//FILE_HEADER------------------------------------------------------------------------------------------
// ZTE  Copyright
// ZTE Company Confidential
//-----------------------------------------------------------------------------------------------------
// FILE NAME:       pcs_item.sv
// DEPARTMENT:      Multi-Service Bearer Product ShenZhen Design&Development Dept.
// AUTHOR:          Chen Chengman
// AUTHOR'S EMAIL:  chen.chengman@zte.com.cn
//-----------------------------------------------------------------------------------------------------
// RELEASE HISTORY: N/A
// VERSION      DATE         AUTHOR       DESCRIPTION
// 1.1         2011-9-13    Chen Chengman   uvm
//-----------------------------------------------------------------------------------------------------
// KEYWORDS: pcs_item
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

`ifndef PCS_ITEM_SV
`define PCS_ITEM_SV


//------------------------------------------------------------------------------
//
// CLASS: pcs_item
//
//------------------------------------------------------------------------------

class pcs_item extends uvm_sequence_item;
   
//==================== Enum ======================//
//typedef typedef enum {,,} enum_name
typedef enum {AM,DATA} packet_kind;
//==================== Enum ======================//


//==================== Knob ======================//
//randc enum_name kind_name;
randc packet_kind packet_type;    
//==================== Knob ======================//


//==================== Attribute =================// 
    rand bit[65:0]   lane_block[20];
    rand bit[65:0]   align_maker[20];     
    bit[65:0]        block_data[20];
    rand bit[7:0]    frame_data[];
 //==================== Attribute =================//


//==================== Registration ==============//
    `uvm_object_utils_begin(pcs_item)
         `uvm_field_sarray_int(lane_block , UVM_ALL_ON|UVM_NOPACK)                        
         `uvm_field_sarray_int(align_maker , UVM_ALL_ON|UVM_NOPACK)
         `uvm_field_sarray_int(block_data , UVM_ALL_ON|UVM_NOPACK)
         `uvm_field_enum(packet_kind , packet_type   , UVM_ALL_ON|UVM_NOPACK) 
    `uvm_object_utils_end
//==================== Registration ==============//



//==================== Constraint ================//
//    constraint c_ach_cw {
//                    ach_cw == 4'b0001;
//                           }
     constraint c_align_maker {
                    align_maker[0]  == {2'b10,8'hC1, 8'h68, 8'h21, 8'h00, 8'h3E, 8'h97, 8'hDE, 8'h00};
                    align_maker[1]  == {2'b10,8'h9D, 8'h71, 8'h8E, 8'h00, 8'h62, 8'h8E, 8'h71, 8'h00};
                    align_maker[2]  == {2'b10,8'h59, 8'h4B, 8'hE8, 8'h00, 8'hA6, 8'hB4, 8'h17, 8'h00};
                    align_maker[3]  == {2'b10,8'h4D, 8'h95, 8'h7B, 8'h00, 8'hB2, 8'h6A, 8'h84, 8'h00};
                    align_maker[4]  == {2'b10,8'hF5, 8'h07, 8'h09, 8'h00, 8'h0A, 8'hF8, 8'hF6, 8'h00};
                    align_maker[5]  == {2'b10,8'hDD, 8'h14, 8'hC2, 8'h00, 8'h22, 8'hEB, 8'h3D, 8'h00};
                    align_maker[6]  == {2'b10,8'h9A, 8'h4A, 8'h26, 8'h00, 8'h65, 8'hB5, 8'hD9, 8'h00};
                    align_maker[7]  == {2'b10,8'h7B, 8'h45, 8'h66, 8'h00, 8'h84, 8'hBA, 8'h99, 8'h00};
                    align_maker[8]  == {2'b10,8'hA0, 8'h24, 8'h76, 8'h00, 8'h5F, 8'hDB, 8'h89, 8'h00};
                    align_maker[9]  == {2'b10,8'h68, 8'hC9, 8'hFB, 8'h00, 8'h97, 8'h36, 8'h04, 8'h00};
                    align_maker[10] == {2'b10,8'hFD, 8'h6C, 8'h99, 8'h00, 8'h02, 8'h93, 8'h66, 8'h00};
                    align_maker[11] == {2'b10,8'hB9, 8'h91, 8'h55, 8'h00, 8'h46, 8'h6E, 8'hAA, 8'h00};
                    align_maker[12] == {2'b10,8'h5C, 8'hB9, 8'hB2, 8'h00, 8'hA3, 8'h46, 8'h4D, 8'h00};
                    align_maker[13] == {2'b10,8'h1A, 8'hF8, 8'hBD, 8'h00, 8'hE5, 8'h07, 8'h42, 8'h00};
                    align_maker[14] == {2'b10,8'h83, 8'hC7, 8'hCA, 8'h00, 8'h7C, 8'h38, 8'h35, 8'h00};
                    align_maker[15] == {2'b10,8'h35, 8'h36, 8'hCD, 8'h00, 8'hCA, 8'hC9, 8'h32, 8'h00};
                    align_maker[16] == {2'b10,8'hC4, 8'h31, 8'h4C, 8'h00, 8'h3B, 8'hCE, 8'hB3, 8'h00};
                    align_maker[17] == {2'b10,8'hAD, 8'hD6, 8'hB7, 8'h00, 8'h52, 8'h29, 8'h48, 8'h00};
                    align_maker[18] == {2'b10,8'h5F, 8'h66, 8'h2A, 8'h00, 8'hA0, 8'h99, 8'hD5, 8'h00};
                    align_maker[19] == {2'b10,8'hC0, 8'hF0, 8'hE5, 8'h00, 8'h3F, 8'h0F, 8'h1A, 8'h00};
                           }
                                      
//==================== Constraint ================//



//================================================//
//FUNCTION    : new
//DESCRIPTION : construct
//================================================//
    function new (string name = "pcs_item");               
        super.new();                    
    endfunction:new 

//================================================//
//FUNCTION    : do_pack
//DESCRIPTION : do_pack
//================================================//
    function void do_pack(uvm_packer packer);
        super.do_pack(packer);  
        if(packet_type==DATA)
        begin
        	foreach(lane_block[key])
        	packer.pack_field(lane_block[key],66);        
        end
        else if(packet_type==AM)
          begin
          	foreach(align_maker[key])
        	  packer.pack_field(align_maker[key],66);  
          end
        
    endfunction

//================================================//
//FUNCTION    : do_self_define_pack
//DESCRIPTION : do_self_define_pack
//================================================//
    function void do_self_define_pack();
        bit [65:0] block_data_tmp;
        
        if(packet_type==DATA)
        begin
        	foreach(lane_block[key])
           block_data[key] = lane_block[key];
        end
        else if(packet_type==AM)
          begin
           foreach(align_maker[key])
           block_data[key]= align_maker[key];
          end
        
    
    //bitÎ»Ë³Ðòµ÷Õû
    foreach(block_data[key])
    begin 
    	block_data_tmp= block_data[key];
      for(int i=0; i<8;i++)  
        begin
        	for(int j=0;j<8;j++)
        	  begin
        	  	block_data[key][i*8+(7-j)]= block_data_tmp[i*8+j];
        	  end
        end
    end
    
    endfunction
endclass : pcs_item

`endif // pcs_item_SV
