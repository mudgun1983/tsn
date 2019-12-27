class mac_ptp_sequence extends mac_user_sequence;

`uvm_sequence_utils(mac_ptp_sequence,mac_rx_base_sequencer)

rand ptp_item::packet_kind c_packet_type;
ptp_item upper_req;
int       tagged_size;
int       data_len;
//================================================//
//FUNCTION    : pre_do
//DESCRIPTION : construct
//================================================//     
  virtual task pre_do(bit is_item);
    
	 upper_req = new();//ptp_item::type_id::create("upper_req"); 
	 
     `uvm_info(get_type_name(),"start",UVM_HIGH)

	 if ( !(upper_req.randomize() with {upper_req.packet_type == local::c_packet_type;} )) 
        begin
		 `uvm_error(get_type_name, "Randomize Failed!") 
		end

	   `uvm_info(get_type_name(),"finish",UVM_HIGH)
     upper_req.pack_bytes(upper_req.frame_data);
     data_len=upper_req.frame_data.size();//$urandom_range(1518,46);
     // req.tagged_data[1].data=new[data_len];
     // $display("req.tagged_data[1].data.size=%0d", req.tagged_data[1].data.size);    
      // req.tagged_data[1].data.rand_mode(0);
      // req.tagged_data[1].c_data_size.constraint_mode(0);

	  // foreach(req.tagged_data[1].data[key])
	   // req.tagged_data[1].data[key]={8'h0,upper_req.frame_data[key]};
  endtask
 

  virtual task body();
     //forever 
     begin
	 get_config();
	 tagged_size      = item_config0.tagged_size;
     `uvm_do_with(req,
            {
					req.init_crc    == 32'hffff_ffff ;                  	            
					req.xor_value   == 32'hffff_ffff ;
					req.preemptable    == 0   ;            
					req.start_or_frag  == c_start_or_frag ;
                   	req.inter_frame_gap              == 12;//p_sequencer.static_cfg.cfg_MinIPG;

                    req.preamble.preamble_length     == c_preamble_length;
                   	req.preamble.smd                 == c_smd;
					req.preamble.frag_cnt            == c_frag_cnt;
                   	
                   	req.destination_address          == c_da_cnt;//48'h01_02_03_04_05_06;//p_sequencer.static_cfg.da;
                   	req.source_address               == c_sa_cnt;//48'h07_08_09_0a_0b_0c;//p_sequencer.static_cfg.sa;
                    //req.tagged_data[0].max_data_len  == 2    ;//p_sequencer.static_cfg.cfg_max_tagged_data_len;
                   // req.tagged_data[0].min_data_len  == 2    ;//p_sequencer.static_cfg.cfg_min_tagged_data_len;    
                    req.tagged_data_size             == tagged_size    ;//p_sequencer.static_cfg.cfg_tagged_data_size;
                    //req.tagged_data[0].max_data_len  == 2    ;//p_sequencer.static_cfg.cfg_max_tagged_data_len;
                   // req.tagged_data[0].min_data_len  == 2    ;//p_sequencer.static_cfg.cfg_min_tagged_data_len;  
				   if(tagged_size!=0){
                    //for(i=0;i<tagged_size-1;i++)	
					foreach(req.tagged_data[key])
                    {
					 if(key<tagged_size-1){
					 req.tagged_data[key].vlan_tag_kind == eth_tagged_data::VLAN_TAG; 
					 req.tagged_data[key].data[0] == VLAN_VALUE0[15:8] ;
                     req.tagged_data[key].data[1] == VLAN_VALUE0[7:0] ;
					 }
                    }				
                    }
					
                   	req.tagged_data[tagged_size-1].max_data_len  == 1518   ;//p_sequencer.static_cfg.cfg_max_tagged_data_len;
                    req.tagged_data[tagged_size-1].min_data_len  == 46 ;//p_sequencer.static_cfg.cfg_min_tagged_data_len; 
                    
                   	req.tagged_data[tagged_size-1].data_tag_kind == eth_tagged_data::DATA_TAG;  
					req.tagged_data[tagged_size-1].data_length   == data_len;
                   	req.tagged_data[tagged_size-1].tpid   == c_tpid;
					
					foreach(req.tagged_data[tagged_size-1].data[key])   
                    {req.tagged_data[tagged_size-1].data[key]=={8'h0,upper_req.frame_data[key]};
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

     `uvm_info(get_type_name(),"uvm_do done",UVM_LOW)
     get_response(rsp);
     `uvm_info(get_type_name(),"get_response done",UVM_LOW)
     
     //c_da_cnt++;
     
     end
  endtask 
endclass