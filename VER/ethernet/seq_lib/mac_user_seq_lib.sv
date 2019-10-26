

//------------------------------------------------------------------------------
// CLASS: mac_base_sequence
//------------------------------------------------------------------------------
/*{{{*/
typedef class mac_rx_base_sequencer;

class mac_user_sequence extends mac_base_sequence;
 
  rand bit [47:0] frame_cnt;
  rand bit [47:0] da_frame_cnt;
  rand bit [47:0] sa_frame_cnt;
  rand bit vlan_choose;
  rand bit           c_data_control   ;
  rand bit [7:0]     c_data_payload   ;
  rand int unsigned  c_packet_len     ;
  rand bit [15:0]    c_tpid     ;
  rand bit [7:0]     c_smd            ;
  rand bit [7:0]     c_frag_cnt       ;
  rand bit           c_preemptable    ;
  rand bit           c_start_or_frag  ;
  rand bit           c_last_frag      ;
  rand int unsigned  c_preamble_length;
  rand bit [31:0]    c_init_crc;
  rand bit [31:0]    c_xor_value;
  
  parameter [15:0]     VLAN_VALUE0 = 16'd500;
  parameter [15:0]     VLAN_VALUE1 = 16'd501;
  
  rand bit [47:0] c_da_cnt;
  rand bit [47:0] c_sa_cnt;
  `ifdef GMII_RX_PUSH_MODE
    `uvm_sequence_utils(mac_user_sequence,mac_rx_base_push_sequencer)
  `else
    `uvm_sequence_utils(mac_user_sequence,mac_rx_base_sequencer)
  `endif

//==================== Constraint ================//
  constraint c_preamble_len{ 
      c_preamble_length inside {[1:7]};//== 7;
  }
  
  //================================================//
  //FUNCTION    : new
  //================================================//
    function new (string name = "mac_user_sequence");               
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
 /*    
     data_len=46;//$urandom_range(1518,46);
//     req.tagged_data[1].data_length=data_len;
     req.tagged_data[1].data=new[data_len];
     $display("req.tagged_data[1].data.size=%0d", req.tagged_data[1].data.size);
     foreach(req.tagged_data[1].data[key])
       req.tagged_data[1].data[key]=key + p_sequencer.store_value0;
         
    p_sequencer.store_value0 = req.tagged_data[1].data[data_len-1]+1;
      req.tagged_data[1].data.rand_mode(0);
 */     
//      req.tagged_data[1].data_length.rand_mode(0);
//      req.tagged_data[1].c_data_length.constraint_mode(0);
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
     //forever 
     begin
     	vlan_choose = $random;
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
                   	req.inter_frame_gap              == 12;//p_sequencer.static_cfg.cfg_MinIPG;
//                   	req.preamble.data_preamble[0]    == 8'h55;
//                   	req.preamble.data_preamble[1]    == 8'h55;
//                   	req.preamble.data_preamble[2]    == 8'h55;
//                   	req.preamble.data_preamble[3]    == 8'h55;
//                   	req.preamble.data_preamble[4]    == 8'h55;
//                   	req.preamble.data_preamble[5]    == 8'h55;
//                   	req.preamble.data_preamble[6]    == 8'h55;
                    req.preamble.preamble_length     == c_preamble_length;
                   	req.preamble.smd                 == c_smd;
					req.preamble.frag_cnt            == c_frag_cnt;
                   	
                   	req.destination_address          == c_da_cnt;//48'h01_02_03_04_05_06;//p_sequencer.static_cfg.da;
                   	req.source_address               == c_sa_cnt;//48'h07_08_09_0a_0b_0c;//p_sequencer.static_cfg.sa;
                    req.tagged_data_size             == 2    ;//p_sequencer.static_cfg.cfg_tagged_data_size;
                    //req.tagged_data[0].max_data_len  == 2    ;//p_sequencer.static_cfg.cfg_max_tagged_data_len;
                   // req.tagged_data[0].min_data_len  == 2    ;//p_sequencer.static_cfg.cfg_min_tagged_data_len;    
                   	req.tagged_data[0].vlan_tag_kind == eth_tagged_data::VLAN_TAG; 

                   	{
                   	 req.tagged_data[0].data[0] == VLAN_VALUE0[15:8] ;
                     req.tagged_data[0].data[1] == VLAN_VALUE0[7:0] ;
                   	}
                   	req.tagged_data[1].max_data_len  == 1518   ;//p_sequencer.static_cfg.cfg_max_tagged_data_len;
                    req.tagged_data[1].min_data_len  == 46 ;//p_sequencer.static_cfg.cfg_min_tagged_data_len; 
                    
                   	req.tagged_data[1].data_tag_kind == eth_tagged_data::DATA_TAG;  
					req.tagged_data[1].data_length   == c_packet_len;
					//req.tagged_data[1].data.size()   == c_packet_len;
                   	req.tagged_data[1].tpid   == c_tpid;
					
					if(~c_data_control)
					{
					foreach(req.tagged_data[1].data[key])   
                    {req.tagged_data[1].data[key]==key;
                    }
					}
					else
					{
					foreach(req.tagged_data[1].data[key])   
                    {req.tagged_data[1].data[key]==c_data_payload;
                    }
					}
					
                   	req.directed_protocol_error_size == 0;
                   	req.protocol_error_size          == 0;
                   	req.protocol_error_mode          == NO_PROT_ERROR;
                   	req.pkt_error_mode               == NO_PKT_ERROR;
 
                    req.crc_error                    == 1'b0;
                    req.sfd_error                    == 1'b0;
                    req.len_error                    == 1'b1;
                    req.long_frame_error             == 1'b0;
                    req.short_frame_error            == 1'b0;
                                                                      
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
	  `uvm_info(get_type_name(),{$psprintf("p_sequencer.init_crc=%h\n",p_sequencer.init_crc)},UVM_HIGH);
  endfunction
  

endclass : mac_user_sequence
/*}}}*/

