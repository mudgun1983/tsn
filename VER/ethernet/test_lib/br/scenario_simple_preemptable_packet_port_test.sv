class scenario_simple_preemptable_packet_port_test extends scenario_reg_test;
bit  [7:0] data_sequence_id[20];
bit  [15:0] e_mac_vlan[`MAX_ENV_MAC_NUM];
bit  [15:0] p_mac_vlan[`MAX_ENV_MAC_NUM];
//==================== Registration ==============//
`uvm_sequence_utils(scenario_simple_preemptable_packet_port_test, pcs_virtual_sequencer)
//==================== Registration ==============//

//================================================//
//FUNCTION    : new
//DESCRIPTION : construct
//================================================//
    function new (string name = "scenario_simple_preemptable_packet_port_test");               
        super.new();             
    endfunction:new

//================================================//
//TASK        : body
//DESCRIPTION : construct
//================================================//
   virtual task body();
        begin
		super.body();
		  //#100us
        //`uvm_info(get_type_name(),{$psprintf("item_config0.e_mac_vlan=%0h ,p_mac_vlan=%0h \n",item_config0.e_mac_vlan,item_config0.p_mac_vlan)},UVM_LOW);
        foreach(e_mac_vlan[key])begin
          e_mac_vlan[key] = item_config0.e_mac_vlan[key] ;
       	  p_mac_vlan[key] = item_config0.p_mac_vlan[key] ;
        end	
		for(int i =0; i<topology_config0.mac_number;i++)
		//for(int i =2; i<3;i++)
		  begin
		  automatic int index;
          index = i; 
		  fork
          //EXPRESS PACKET
		    begin
		    //for(int j=0;j<3;j++)
			//forever
			if(port_stimulus_s[index].port_en)
			 begin
			  // data_len=$urandom_range(1518,46);
              // `uvm_do_on_with(mac_seq,p_sequencer.mac_sqr_array[index],
                             // {mac_seq.c_da_cnt==index;
							  // mac_seq.c_sa_cnt==index;
							  // mac_seq.c_data_control == 1;
							  // mac_seq.c_data_payload ==data_sequence_id[index];
							  // mac_seq.c_packet_len == data_len;
							  // mac_seq.c_tpid == data_len;
							  // mac_seq.c_preemptable==0;
							 // })
		
			  //SMD_S0
             `uvm_do_on_with(mac_seq,p_sequencer.mac_sqr_array[index],
                            {mac_seq.c_da_cnt==port_stimulus_s[index].da_index;
							 mac_seq.c_sa_cnt==port_stimulus_s[index].sa_index;
							 mac_seq.c_packet_len == 'd46;
							 mac_seq.c_tpid == 'd138;
							 mac_seq.c_preemptable==1;
							 mac_seq.c_start_or_frag==1; //1:start
							 mac_seq.c_last_frag == 0;   //not last frag
							 mac_seq.c_smd==8'hE6;
							 mac_seq.c_xor_value == 32'hffff0000;//32'h0000ffff;
							 mac_seq.c_data_payload ==data_sequence_id[index];
							 mac_seq.c_vlan == p_mac_vlan[index];
							}) 	
              data_sequence_id[index]++;							
			 //SMD_C0_FRAG0
             `uvm_do_on_with(mac_seq,p_sequencer.mac_sqr_array[index],
                            {mac_seq.c_da_cnt==port_stimulus_s[index].da_index;
							 mac_seq.c_sa_cnt==port_stimulus_s[index].sa_index;
							 mac_seq.c_packet_len == 'd46;
							 mac_seq.c_tpid == 'd46;
							 mac_seq.c_preemptable==1;
							 mac_seq.c_start_or_frag==0;
							 mac_seq.c_last_frag == 0;   //not last frag
							 mac_seq.c_preamble_length == 6;
							 mac_seq.c_smd==8'h61;
							 mac_seq.c_frag_cnt==8'hE6;
							 mac_seq.c_xor_value == 32'hffff0000;//32'h0000ffff;
							 mac_seq.c_data_payload ==data_sequence_id[index];
							 mac_seq.c_vlan == p_mac_vlan[index];
							 })	 
	          data_sequence_id[index]++;
			 //SMD_C0_FRAG1
             `uvm_do_on_with(mac_seq,p_sequencer.mac_sqr_array[index],
                            {mac_seq.c_da_cnt==port_stimulus_s[index].da_index;
							 mac_seq.c_sa_cnt==port_stimulus_s[index].sa_index;
							 mac_seq.c_packet_len == 'd46;
							 mac_seq.c_tpid == 'd46;
							 mac_seq.c_preemptable==1;
							 mac_seq.c_start_or_frag==0;
							 mac_seq.c_last_frag == 1;   //is last frag
							 mac_seq.c_preamble_length == 6;
							 mac_seq.c_smd==8'h61;
							 mac_seq.c_frag_cnt==8'h4C;
							 mac_seq.c_xor_value == 32'hffffffff;
							 mac_seq.c_data_payload ==data_sequence_id[index];
							 mac_seq.c_vlan == p_mac_vlan[index];
							 })
							 
              data_sequence_id[index]++;
            end	
			end
          join_none			
          end	
          wait fork;          		  
        end

      endtask    
endclass