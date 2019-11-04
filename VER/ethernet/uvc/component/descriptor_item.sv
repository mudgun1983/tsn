

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
 // -----------------------------------------------------------//
	  // |                           rsv[15:0]                      |
	  // ------------------------------------------------------------
	  // |                           rsv[15:0]                      |
	  // ------------------------------------------------------------
	  // |              rsv[13:0]                   | vlan_num[1:0] |
	  // ------------------------------------------------------------
	  // |rsv| pckt_len[6:0]        |        poll_num[7:0]          |
	  // ------------------------------------------------------------
	  // |   pkt_min_int[7:0]       |        rep_num[7:0]           |
	  // ------------------------------------------------------------
	  // |   send_period[7:0]       |    rsv[6:0]   | follow_up_tlv |
	  // ------------------------------------------------------------
	  // | rsv[6:0]      | two_step |    rsv[6:0]      | inst_type  |
	  // ------------------------------------------------------------
	  // | rsv[3:0] | pckt_type[3:0]|    rsv[6:0]      | inst_vld   | 
	  // -----------------------------------------------------------//	 

//==================== Attribute =================// 
rand bit [0 :0]     inst_valid	      ;  
rand bit [6 :0]     rsv0               ;
rand bit [3 :0]     pckt_type	      ;  
rand bit [3 :0]     rsv1               ;
rand bit [0 :0]     inst_type	      ;  
rand bit [6 :0]     rsv2               ;
rand bit [0 :0]     two_step	          ;
rand bit [6 :0]     rsv3               ;
rand bit [0 :0]     follow_up_tlv	  ;  
rand bit [6 :0]     rsv4               ;
rand bit [7 :0]     send_period	      ;  
rand bit [7 :0]     repetition_num	  ;  
rand bit [7 :0]     pckt_min_interval  ;
rand bit [7 :0]     poll_num	          ;
rand bit [6 :0]     pckt_len	          ;
rand bit            rsv7                  ;
rand bit [1 :0]     vlan_num	          ;
rand bit [13:0]     rsv5               ;
rand bit [31:0]     rsv6 		      ;
																																																										
rand bit[7:0]    frame_data[];
 //==================== Attribute =================//


//==================== Registration ==============//
    `uvm_object_utils_begin(descriptor_item)
         `uvm_field_int          (inst_valid	        , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int          (rsv0                  , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int          (pckt_type	            , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int          (rsv1                  , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int          (inst_type	            , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int          (rsv2                  , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int          (two_step	            , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int          (rsv3                  , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int          (follow_up_tlv	        , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int          (rsv4                  , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int          (send_period	        , UVM_ALL_ON|UVM_NOPACK) 
		 `uvm_field_int          (repetition_num	    , UVM_ALL_ON|UVM_NOPACK) 
		 `uvm_field_int          (pckt_min_interval     , UVM_ALL_ON|UVM_NOPACK) 
		 `uvm_field_int          (poll_num	            , UVM_ALL_ON|UVM_NOPACK) 
		 `uvm_field_int          (pckt_len	            , UVM_ALL_ON|UVM_NOPACK) 
		 `uvm_field_int          (rsv7	                , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int          (vlan_num	            , UVM_ALL_ON|UVM_NOPACK) 
		 `uvm_field_int          (rsv5                  , UVM_ALL_ON|UVM_NOPACK) 
		 `uvm_field_int          (rsv6 		            , UVM_ALL_ON|UVM_NOPACK) 
	 
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
    function new (string name = "descriptor_item");               
        super.new();                    
    endfunction:new 

//================================================//
//FUNCTION    : do_pack
//DESCRIPTION : do_pack
//================================================//
    function void do_pack(uvm_packer packer);
        super.do_pack(packer);  
        
        packer.pack_field(rsv6 		         ,(31+1));	
        packer.pack_field(rsv5               ,(13+1));		
        packer.pack_field(vlan_num	         ,(1 +1));
		packer.pack_field(rsv7               ,(0 +1));
        packer.pack_field(pckt_len	         ,(6 +1));
        packer.pack_field(poll_num	         ,(7 +1));
        packer.pack_field(pckt_min_interval  ,(7 +1));
        packer.pack_field(repetition_num	 ,(7 +1)); 
        packer.pack_field(send_period	     ,(7 +1));
        packer.pack_field(rsv4               ,(6 +1)); 
        packer.pack_field(follow_up_tlv	     ,(0 +1)); 
        packer.pack_field(rsv3               ,(6 +1)); 
        packer.pack_field(two_step	         ,(0 +1)); 
        packer.pack_field(rsv2               ,(6 +1)); 
        packer.pack_field(inst_type	         ,(0 +1));
        packer.pack_field(rsv1               ,(3 +1)); 
        packer.pack_field(pckt_type	         ,(3 +1)); 
        packer.pack_field(rsv0               ,(6 +1)); 
        packer.pack_field(inst_valid	     ,(0 +1)); 
    endfunction


endclass 

`endif // pcs_item_SV
