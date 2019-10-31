

`ifndef SYS_ITEM_SV
`define SYS_ITEM_SV


//------------------------------------------------------------------------------
//
// CLASS: sys_item
//
//------------------------------------------------------------------------------

class sys_item extends uvm_sequence_item;
   
//==================== Enum ======================//
//typedef typedef enum {,,} enum_name

//==================== Enum ======================//


//==================== Knob ======================//
//randc enum_name kind_name;
   
//==================== Knob ======================//


//==================== Attribute =================// 
rand bit [7:0]  pckt_len        ;
rand bit [3:0]  rsv0	        ;
rand bit [9:0]  destination     ;
rand bit [1:0]  d_typ           ;
rand bit [3:0]  sub_type        ;
rand bit [3:0]  pckt_type	    ;
rand bit [23:0] rsv1			;																											
rand bit [7:0]  pckt_len		;																													
rand bit [31:0] rsv2			;																												
rand bit [31:0] rsv3			;																												
rand bit [63:0] timestamp_ptp   ;																															
rand bit [63:0] timestamp_tc	;			
																																																										
rand bit[7:0]    frame_data[];
 //==================== Attribute =================//


//==================== Registration ==============//
    `uvm_object_utils_begin(sys_item)
         `uvm_field_int          (pckt_len              , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int          (rsv0	                , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int          (destination           , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int          (d_typ                 , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int          (sub_type              , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int          (pckt_type	            , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int          (rsv1			        , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int          (pckt_len		        , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int          (rsv2			        , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int          (rsv3			        , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int          (timestamp_ptp         , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int          (timestamp_tc	        , UVM_ALL_ON|UVM_NOPACK)	 
         `uvm_field_sarray_int   (frame_data            , UVM_ALL_ON|UVM_NOPACK)	 		 
         //`uvm_field_enum(packet_kind , packet_type   , UVM_ALL_ON|UVM_NOPACK) 
    `uvm_object_utils_end
//==================== Registration ==============//



//==================== Constraint ================//
//    constraint c_ach_cw {
//                    ach_cw == 4'b0001;
//                           }
 
                                      
//==================== Constraint ================//



//================================================//
//FUNCTION    : new
//DESCRIPTION : construct
//================================================//
    function new (string name = "sys_item");               
        super.new();                    
    endfunction:new 

//================================================//
//FUNCTION    : do_pack
//DESCRIPTION : do_pack
//================================================//
    function void do_pack(uvm_packer packer);
        super.do_pack(packer);  
        
		packer.pack_field(pckt_len      ,(7 +1)); 
		packer.pack_field(rsv0	        ,(3 +1)); 
		packer.pack_field(destination   ,(9 +1)); 
		packer.pack_field(d_typ         ,(1 +1)); 
		packer.pack_field(sub_type      ,(3 +1)); 
		packer.pack_field(pckt_type	    ,(3 +1)); 
		packer.pack_field(rsv1			,(23+1)); 
		packer.pack_field(pckt_len		,(7 +1)); 
		packer.pack_field(rsv2			,(31+1)); 
		packer.pack_field(rsv3			,(31+1)); 
		packer.pack_field(timestamp_ptp ,(63+1)); 
		packer.pack_field(timestamp_tc	,(63+1)); 

    endfunction


endclass : sys_item

`endif // pcs_item_SV
