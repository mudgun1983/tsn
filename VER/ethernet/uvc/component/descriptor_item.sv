

`ifndef DESC_ITEM_SV
`define DESC_ITEM_SV


//------------------------------------------------------------------------------
//
// CLASS: descriptor_item
//
//------------------------------------------------------------------------------

class descriptor_item extends uvm_sequence_item;
   
//==================== Enum ======================//
//typedef typedef enum {,,} enum_name

//==================== Enum ======================//


//==================== Knob ======================//
//randc enum_name kind_name;
   
//==================== Knob ======================//


//==================== Attribute =================// 
rand bit [(1-1):0] inst_valid	      ;  
rand bit [(4-1):0] pckt_type	      ;  
rand bit [(1-1):0] inst_type	      ;  
rand bit [(1-1):0] two_step	          ;
rand bit [(1-1):0] follow_up_tlv	  ;  
rand bit [(8-1):0] send_period	      ;  
rand bit [(8-1):0] repetition_num	  ;  
rand bit [(8-1):0] pckt_min_interval  ;
rand bit [(8-1):0] poll_num	          ;
rand bit [(7-1):0] pckt_len	          ;
rand bit [(2-1):0] vlan_num	          ;
		
																																																										
rand bit[7:0]    frame_data[];
 //==================== Attribute =================//


//==================== Registration ==============//
    `uvm_object_utils_begin(sys_item)
         `uvm_field_int          (inst_valid	            , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int          (pckt_type	                , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int          (inst_type	                , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int          (two_step	                , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int          (follow_up_tlv	            , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int          (send_period	            , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int          (repetition_num	        , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int          (pckt_min_interval         , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int          (poll_num	                , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int          (pckt_len	                , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int          (vlan_num	                , UVM_ALL_ON|UVM_NOPACK) 
         `uvm_field_sarray_int   (frame_data                , UVM_ALL_ON|UVM_NOPACK)	 		 
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
    function new (string name = "descriptor_item");               
        super.new();                    
    endfunction:new 

//================================================//
//FUNCTION    : do_pack
//DESCRIPTION : do_pack
//================================================//
    function void do_pack(uvm_packer packer);
        super.do_pack(packer);  
        
		packer.pack_field(inst_valid	     ,1); 
		packer.pack_field(pckt_type	         ,4); 
		packer.pack_field(inst_type	         ,1); 
		packer.pack_field(two_step	         ,1); 
		packer.pack_field(follow_up_tlv	     ,1); 
		packer.pack_field(send_period	     ,8); 
		packer.pack_field(repetition_num	 ,8); 
		packer.pack_field(pckt_min_interval  ,8); 
		packer.pack_field(poll_num	         ,8); 
		packer.pack_field(pckt_len	         ,7); 
		packer.pack_field(vlan_num	         ,2); 

    endfunction


endclass 

`endif // pcs_item_SV
