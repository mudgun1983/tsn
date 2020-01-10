

//------------------------------------------------------------------------------
// CLASS: mac_base_sequence
//------------------------------------------------------------------------------
/*{{{*/
class mac_multi_tag_seq extends mac_base_sequence;
 
  rand bit [47:0] frame_cnt;
  rand bit [47:0] da_frame_cnt;
  rand bit [47:0] sa_frame_cnt;
  rand bit        vlan_choose;
  rand bit           c_data_control   ;
  rand bit [7:0]     c_data_payload   ;
  rand int unsigned  c_packet_len     ;
  rand bit [15:0]    c_tpid     ;
  rand bit [7:0]     c_smd            ;
  rand bit [7:0]     c_frag_cnt       ;
  bit                c_preemptable  =0  ;
  rand bit           c_start_or_frag  ;
  rand bit           c_last_frag      ;
  rand int unsigned  c_preamble_length;
  rand bit [31:0]    c_init_crc;
  rand bit [31:0]    c_xor_value;
  int unsigned       c_packet_ipg=12;
  
  rand bit [15:0]    c_selfdefine_tag_data[]       ;
  rand int unsigned  c_selfdefine_tag_len  ;
  rand bit [15:0]    c_selfdefine_tpid;
  rand bit [47:0]    c_da_cnt;
  rand bit [47:0]    c_sa_cnt;
  rand bit [15:0]    c_vlan;
  item_config item_config0;
  string scope_name = "";
  bit [1:0] eth_item_payload;
  int       tagged_size;
  int       selfdefine_tagged_size;
  `ifdef GMII_RX_PUSH_MODE
    `uvm_sequence_utils(mac_multi_tag_seq,mac_rx_base_push_sequencer)
  `else
    `uvm_sequence_utils_begin(mac_multi_tag_seq,mac_rx_base_sequencer)
	`uvm_field_int          (frame_cnt             , UVM_ALL_ON|UVM_NOPACK)
	`uvm_field_int          (da_frame_cnt          , UVM_ALL_ON|UVM_NOPACK)
	`uvm_field_int          (sa_frame_cnt          , UVM_ALL_ON|UVM_NOPACK)
	`uvm_field_int          (vlan_choose           , UVM_ALL_ON|UVM_NOPACK)
	`uvm_field_int          (c_data_control             , UVM_ALL_ON|UVM_NOPACK)
	`uvm_field_int          (c_data_payload             , UVM_ALL_ON|UVM_NOPACK)
	`uvm_field_int          (c_packet_len               , UVM_ALL_ON|UVM_NOPACK)
	`uvm_field_int          (c_tpid                     , UVM_ALL_ON|UVM_NOPACK)
	`uvm_field_int          (c_smd                      , UVM_ALL_ON|UVM_NOPACK)
	`uvm_field_int          (c_frag_cnt                 , UVM_ALL_ON|UVM_NOPACK)
	`uvm_field_int          (c_preemptable              , UVM_ALL_ON|UVM_NOPACK)
	`uvm_field_int          (c_start_or_frag            , UVM_ALL_ON|UVM_NOPACK)
	`uvm_field_int          (c_last_frag                , UVM_ALL_ON|UVM_NOPACK)
	`uvm_field_int          (c_preamble_length          , UVM_ALL_ON|UVM_NOPACK)
	`uvm_field_int          (c_init_crc          , UVM_ALL_ON|UVM_NOPACK)
	`uvm_field_int          (c_xor_value         , UVM_ALL_ON|UVM_NOPACK)
	`uvm_field_array_int    (c_selfdefine_tag_data    , UVM_ALL_ON|UVM_NOPACK)
	`uvm_field_int          (c_selfdefine_tag_len     , UVM_ALL_ON|UVM_NOPACK)
	`uvm_field_int          (c_selfdefine_tpid        , UVM_ALL_ON|UVM_NOPACK)
	`uvm_field_int          (c_da_cnt                , UVM_ALL_ON|UVM_NOPACK)
	`uvm_field_int          (c_sa_cnt                , UVM_ALL_ON|UVM_NOPACK)
	`uvm_field_int          (c_vlan                  , UVM_ALL_ON|UVM_NOPACK)
	`uvm_field_object       (item_config0  , UVM_ALL_ON|UVM_NOPACK)	
	`uvm_sequence_utils_end
  `endif

//==================== Constraint ================//
  constraint c_preamble_len{ 
      c_preamble_length inside {[1:7]};//== 7;
  }

  constraint selfdefine_tag_len{ 
      c_selfdefine_tag_len inside {[0:100]};//== 7;
  }
 
  constraint packet_len{ 
      c_packet_len inside {[46:1518]};//== 7;
  }
  
constraint c_data_size 
             {
             	 c_selfdefine_tag_data.size() == c_selfdefine_tag_len;
             }
			 
  //================================================//
  //FUNCTION    : new
  //================================================//
    function new (string name = "mac_multi_tag_seq");               
      super.new();

    endfunction:new
	
    // function void pre_randomize();
	 // this.c_data_control.rand_mode(0);
    // endfunction
//================================================//
//FUNCTION    : pre_do
//DESCRIPTION : construct
//================================================//     
  virtual task pre_do(bit is_item);
     bit [63:0] block_data;
     bit [7:0] random_data;
     int  data_len;
  endtask

  //================================================//
  //TASK    : body
  //================================================//
//=====================================================
  virtual task pre_body();/*{{{*/
       uvm_test_done.raise_objection(this);
       `uvm_info(get_type_name(),"[START_SEQUENCE]",UVM_LOW)
  endtask : pre_body

  virtual task body();
     int i;
     get_config();
	 //forever 
	 i = 0;
     begin	  	 
	 eth_item_payload = item_config0.eth_item_payload;
	 tagged_size      = item_config0.tagged_size;
	 if(tagged_size==0)
	  `uvm_fatal(get_type_name(),$psprintf("FATAL ERROR tagged_size=0"));
	 
	 selfdefine_tagged_size = item_config0.selfdefine_tagged_size;
	 if(selfdefine_tagged_size>tagged_size-1)
	  `uvm_fatal(get_type_name(),$psprintf("FATAL ERROR selfdefine_tagged_size>tagged_size-1"));
     	//$display("T=%0t,test in mac seq",$time);
     `uvm_do_with(req,
            {
//                   	req.preamble.max_pre_len         == p_sequencer.static_cfg.cfg_max_pre_len;
//                   	req.preamble.min_pre_len         == p_sequencer.static_cfg.cfg_min_pre_len;
//                   	req.preamble.max_sfd_len         == p_sequencer.static_cfg.cfg_max_sfd_len;
//                   	req.preamble.min_sfd_len         == p_sequencer.static_cfg.cfg_min_sfd_len;
                    if(c_preemptable && (c_start_or_frag)) //1: start
					{
					 req.init_crc    == 32'hffff_ffff  ;
					}
					else if(c_preemptable && (~c_start_or_frag))
					{
					 req.init_crc    == p_sequencer.init_crc  ; 
					}
                   	            
					req.xor_value   == c_xor_value ;
					req.preemptable    == c_preemptable   ;            
					req.start_or_frag  == c_start_or_frag ;
                   	req.inter_frame_gap              == c_packet_ipg;//12;//p_sequencer.static_cfg.cfg_MinIPG;

                    req.preamble.preamble_length     == c_preamble_length;
                   	req.preamble.smd                 == c_smd;
					req.preamble.frag_cnt            == c_frag_cnt;
                   	
                   	req.destination_address          == c_da_cnt;//48'h01_02_03_04_05_06;//p_sequencer.static_cfg.da;
                   	req.source_address               == c_sa_cnt;//48'h07_08_09_0a_0b_0c;//p_sequencer.static_cfg.sa;
                    req.tagged_data_size             == tagged_size    ;//p_sequencer.static_cfg.cfg_tagged_data_size;
 
				   if(tagged_size!=0){
                    //for(i=0;i<tagged_size-1;i++)	
					foreach(req.tagged_data[key])
                    {if(key<tagged_size-selfdefine_tagged_size-1){
					 req.tagged_data[key].vlan_tag_kind == eth_tagged_data::VLAN_TAG; 
					 req.tagged_data[key].data[0] == c_vlan[15:8] ;
                     req.tagged_data[key].data[1] == c_vlan[7:0] ;
					 }
                    }
                    					
					foreach(req.tagged_data[key])
					{if(key>=tagged_size-selfdefine_tagged_size-1 && key< tagged_size-1){
					 req.tagged_data[key].data_tag_kind == eth_tagged_data::DATA_TAG; 
					 req.tagged_data[key].data_length == c_selfdefine_tag_len ;
					 foreach(req.tagged_data[key].data[key2]){
					 req.tagged_data[key].data[key2] == c_selfdefine_tag_data[key2] ;
					 }
					 req.tagged_data[key].tpid == c_selfdefine_tpid ;
					 
					 }
                    }					
                    }
					req.tagged_data[tagged_size-1].max_data_len  == 1518   ;//p_sequencer.static_cfg.cfg_max_tagged_data_len;
                    req.tagged_data[tagged_size-1].min_data_len  == 46 ;//p_sequencer.static_cfg.cfg_min_tagged_data_len; 
                    
                   	req.tagged_data[tagged_size-1].data_tag_kind == eth_tagged_data::DATA_TAG;  
					req.tagged_data[tagged_size-1].data_length   == c_packet_len;
                   	req.tagged_data[tagged_size-1].tpid   == c_tpid;
	
                   	req.directed_protocol_error_size == 0;
                   	req.protocol_error_size          == 0;
                   	req.protocol_error_mode          == NO_PROT_ERROR;
                   	req.pkt_error_mode               == NO_PKT_ERROR;
 
                    req.crc_error                    == 1'b0;
                    req.sfd_error                    == 1'b0;
                    req.len_error                    == 1'b1;
                    req.long_frame_error             == 1'b0;
                    req.short_frame_error            == 1'b0;
                    
					if(eth_item_payload == `INCREASE_PAYLOAD)
					{
					foreach(req.tagged_data[tagged_size-1].data[key])   
                    {req.tagged_data[tagged_size-1].data[key]==key;
                    }
					}
					else if(eth_item_payload == `ASSIGN_FIRST_BYTE)
					{
					foreach(req.tagged_data[tagged_size-1].data[key])   
                    { if(key ==0)
					   {req.tagged_data[tagged_size-1].data[key]==c_data_payload;}
					  else
					   {req.tagged_data[tagged_size-1].data[key]==key;}
                    }
					}
					else if(eth_item_payload == `ASSIGN_ALL_BYTE)
					{
					foreach(req.tagged_data[tagged_size-1].data[key])   
                    {req.tagged_data[tagged_size-1].data[key]==c_data_payload;
                    }
					}					
                   })

     `uvm_info(get_type_name(),"uvm_do done",UVM_HIGH)
     get_response(rsp);
     `uvm_info(get_type_name(),"get_response done",UVM_HIGH)
     
     //c_da_cnt++;
     
     end
  endtask
 
  virtual task post_body();
      uvm_test_done.drop_objection(this);
      `uvm_info(get_type_name(),"[STOP_SEQUENCE]",UVM_HIGH)
	  p_sequencer.init_crc[31:24]  = req.fcs[7:0]  ;
	  p_sequencer.init_crc[23:16]  = req.fcs[15:8] ;
	  p_sequencer.init_crc[15:8]   = req.fcs[23:16];
	  p_sequencer.init_crc[7:0]    = req.fcs[31:24];
	  
	  p_sequencer.init_crc = p_sequencer.init_crc ^ c_xor_value;
	  `uvm_info(get_type_name(),{$psprintf("p_sequencer.init_crc=%h\n",p_sequencer.init_crc)},UVM_HIGH);
  endtask : post_body

  virtual function void post_do(uvm_sequence_item this_item);
     bit [31:0] tmp_crc;
    `uvm_info(get_type_name(),"[STOP_SEQUENCE] in post do",UVM_HIGH)

	if(c_preemptable && (~c_last_frag))
	  begin
	  p_sequencer.init_crc[31:24]  = req.fcs[7:0]  ;
	  p_sequencer.init_crc[23:16]  = req.fcs[15:8] ;
	  p_sequencer.init_crc[15:8]   = req.fcs[23:16];
	  p_sequencer.init_crc[7:0]    = req.fcs[31:24];
	  
	  p_sequencer.init_crc = p_sequencer.init_crc ^ c_xor_value;
	  tmp_crc = p_sequencer.init_crc;
	  end
	else if(c_preemptable && (c_last_frag))
	  begin
	     p_sequencer.init_crc = 32'hffff_ffff;
	  end
	  //for(int i=0;i<32;i++)
	    //begin
		  //p_sequencer.init_crc[i] = tmp_crc[31-i] ;
		//end
	  `uvm_info(get_type_name(),{$psprintf("c_preemptable =%0b,c_last_frag=%0b,req.fcs=%h,p_sequencer.init_crc=%h\n",c_preemptable,c_last_frag,req.fcs,p_sequencer.init_crc)},UVM_HIGH);
  endfunction
  
virtual function get_config();
	  if( scope_name == "" ) begin
          scope_name = get_full_name(); // this is {       sequencer.get_full_name() , get_name() }
        end

      if( !uvm_config_db #( item_config )::get( null , scope_name ,
      "item_config" , item_config0 ) ) begin
        `uvm_fatal(get_type_name(),"=============NO item_config==========");
      end
endfunction
endclass : mac_multi_tag_seq
/*}}}*/

