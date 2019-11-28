

`ifndef ETH_TAGGED_DATA_SV
`define ETH_TAGGED_DATA_SV

//------------------------------------------------------------------------------
//
// CLASS: eth_tagged_data
//
//------------------------------------------------------------------------------

class eth_tagged_data extends uvm_sequence_item;

//==================== Enum ======================//  
  typedef enum {VLAN_TAG   ,ISNOT_VLAN    }  vlan_tag_kind_e   ;                 
  typedef enum {DATA_TAG   ,ISNOT_DATA    }  data_tag_kind_e   ; 
  typedef enum {ETH_OAM_TAG,ISNOT_ETH_OAM }  eth_oam_tag_kind_e; 
  typedef enum {TP_OAM_TAG ,ISNOT_TP_OAM  }  tp_oam_tag_kind_e ; 
  typedef enum {BFD_OAM_TAG ,ISNOT_BFD_OAM}  bfd_oam_tag_kind_e;
  typedef enum {HARD_TAG   ,ISNOT_HARD    }  hard_tag_kind_e   ; 
//==================== Enum ======================//  


//==================== Knob ======================//
  rand vlan_tag_kind_e     vlan_tag_kind   ;
  rand data_tag_kind_e     data_tag_kind   ;
  rand eth_oam_tag_kind_e  eth_oam_tag_kind;
  rand tp_oam_tag_kind_e   tp_oam_tag_kind ;
  rand bfd_oam_tag_kind_e  bfd_oam_tag_kind;
  rand hard_tag_kind_e     hard_tag_kind   ;
//==================== Knob ======================//


//==================== Attribute =================//
  rand bit [15:0]    tpid         ;
  rand bit [15:0]    data[]       ;
  rand int unsigned  data_length  ;
  
  rand int unsigned  max_data_len ;
  rand int unsigned  min_data_len ;  
  
  rand bit           eth_oam_id_en;
//==================== Attribute =================//


//==================== Registration ==============//
  `uvm_object_utils_begin(eth_tagged_data)
    `uvm_field_int       (tpid        , UVM_ALL_ON|UVM_NOPACK);
    `uvm_field_int       (data_length , UVM_ALL_ON|UVM_NOPACK);
    `uvm_field_int       (max_data_len, UVM_ALL_ON|UVM_NOPACK);
    `uvm_field_int       (min_data_len, UVM_ALL_ON|UVM_NOPACK);
    `uvm_field_array_int (data        , UVM_ALL_ON|UVM_NOPACK);    
    
    `uvm_field_enum      (vlan_tag_kind_e   , vlan_tag_kind   , UVM_ALL_ON|UVM_NOPACK);
    `uvm_field_enum      (data_tag_kind_e   , data_tag_kind   , UVM_ALL_ON|UVM_NOPACK);
    `uvm_field_enum      (eth_oam_tag_kind_e, eth_oam_tag_kind, UVM_ALL_ON|UVM_NOPACK);
    `uvm_field_enum      (tp_oam_tag_kind_e , tp_oam_tag_kind , UVM_ALL_ON|UVM_NOPACK);
    `uvm_field_enum      (bfd_oam_tag_kind_e, bfd_oam_tag_kind , UVM_ALL_ON|UVM_NOPACK);
    `uvm_field_enum      (hard_tag_kind_e   , hard_tag_kind   , UVM_ALL_ON|UVM_NOPACK);
    
    `uvm_field_int       (eth_oam_id_en     , UVM_ALL_ON|UVM_NOPACK);
  `uvm_object_utils_end
//==================== Registration ==============//


//==================== Constraint ================//

  constraint c_tag_kind
             {
             	 vlan_tag_kind == VLAN_TAG ->       { data_tag_kind    == ISNOT_DATA   ; 
             	 	                                    eth_oam_tag_kind == ISNOT_ETH_OAM;
             	 	                                    tp_oam_tag_kind  == ISNOT_TP_OAM ;
             	 	                                    bfd_oam_tag_kind == ISNOT_BFD_OAM;
             	 	                                    hard_tag_kind    == ISNOT_HARD   ;
             	 	                                  }
             	 	                                  
             	 data_tag_kind == DATA_TAG ->       { vlan_tag_kind    == ISNOT_VLAN   ; 
             	 	                                    eth_oam_tag_kind == ISNOT_ETH_OAM;
             	 	                                    tp_oam_tag_kind  == ISNOT_TP_OAM ;
             	 	                                    bfd_oam_tag_kind == ISNOT_BFD_OAM;
             	 	                                    hard_tag_kind    == ISNOT_HARD   ;
             	 	                                  }
             	 	                            
               eth_oam_tag_kind == ETH_OAM_TAG -> { vlan_tag_kind    == ISNOT_VLAN   ; 
               	                                    data_tag_kind    == ISNOT_DATA   ;             	 	                                 
             	 	                                    tp_oam_tag_kind  == ISNOT_TP_OAM ;
             	 	                                    bfd_oam_tag_kind == ISNOT_BFD_OAM;
             	 	                                    hard_tag_kind    == ISNOT_HARD   ;
             	 	                                  }
             	 	                            
               tp_oam_tag_kind == TP_OAM_TAG ->  { vlan_tag_kind    == ISNOT_VLAN   ; 
               	                                   data_tag_kind    == ISNOT_DATA   ; 
             	 	                                   eth_oam_tag_kind == ISNOT_ETH_OAM; 
             	 	                                   bfd_oam_tag_kind == ISNOT_BFD_OAM;            	 	                                 
             	 	                                   hard_tag_kind    == ISNOT_HARD   ;
             	 	                                 }
             	 	                                 
             	 bfd_oam_tag_kind == BFD_OAM_TAG ->  { vlan_tag_kind    == ISNOT_VLAN ; 
               	                                   data_tag_kind    == ISNOT_DATA   ; 
             	 	                                   eth_oam_tag_kind == ISNOT_ETH_OAM; 
             	 	                                   tp_oam_tag_kind  == ISNOT_TP_OAM ;            	 	                                 
             	 	                                   hard_tag_kind    == ISNOT_HARD   ;
             	 	                                 }
             	 	                            
               hard_tag_kind == HARD_TAG ->      { vlan_tag_kind    == ISNOT_VLAN   ; 
               	                                   data_tag_kind    == ISNOT_DATA   ;
             	 	                                   eth_oam_tag_kind == ISNOT_ETH_OAM;
             	 	                                   tp_oam_tag_kind  == ISNOT_TP_OAM ;
             	 	                                   bfd_oam_tag_kind == ISNOT_BFD_OAM;
             	 	                                 }             	             	 
             }  
               
  constraint c_tpid
             {
             	 if(vlan_tag_kind == VLAN_TAG) {
             	 	 tpid == 16'h8100;
             	 }
             	 //else if(data_tag_kind == DATA_TAG) {
             	 //	 tpid == data_length ;//data_length + 2???
             	 //}
             	 else if(eth_oam_tag_kind == ETH_OAM_TAG) {
             	 	 tpid inside {16'h8902,16'hFF02,16'hFE02};
             	 }
             	 else if(tp_oam_tag_kind == TP_OAM_TAG) {
             	 	 tpid inside {16'h8847,16'hFF47,16'hFE47};
             	 }
             	 else if(bfd_oam_tag_kind == BFD_OAM_TAG) {
             	 	 tpid inside {16'h8847,16'h0800};
             	 }
             	 else if(hard_tag_kind == HARD_TAG) {
             	 	 tpid == 16'hFA47;
             	 }
             }
             	         
  constraint c_data_len
             {
             	 min_data_len <= max_data_len;
             	 
             	 if(data_tag_kind == DATA_TAG) {             	   
             	   max_data_len inside {[46:9582]};
//             	   max_data_len inside {[46:960]};//for Questasim test
             	 }
             	 else if(vlan_tag_kind == VLAN_TAG) {
             	 	 min_data_len == 2;
             	 	 max_data_len == 2;
             	 }
             	 else if(hard_tag_kind == HARD_TAG) {
             	 	 min_data_len == 6;
             	 	 max_data_len == 6;
             	 }
             	 else {
  	             max_data_len inside {[2:1000]};
  	           }
             }
  
  constraint c_data_length        
             { 
             	 data_length  inside {[min_data_len:max_data_len]};
  	     }
  	         	                   
  constraint c_data_size 
             {
             	 data.size() == data_length;
             }
              
//==================== Constraint ================//


//================================================//
//FUNCTION    : new
//DESCRIPTION : construct
//================================================//
  function new (string name = "eth_tagged_data");
    super.new();
  endfunction 
     		
endclass : eth_tagged_data

`endif // ETH_TAGGED_DATA_SV
