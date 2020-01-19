class scenario_ptp_rcv_smoke_test extends scenario_reg_test;
int  data_len;
parameter INTERVAL=100us;
mac_ptp_sequence  mac_seq;  
reg_test_seq      reg_test_seq0;
ptp_reg_seq       ptp_reg_seq0;
ipp_epp_table_reg_seq ipp_epp_table_reg_seq0;
phy_port_table_reg_seq phy_port_table_reg_seq0;
rx_ptp_forward_table_reg_seq rx_ptp_forward_table_reg_seq0;
o_phy_port_pro_table_reg_seq o_phy_port_pro_table_reg_seq0;
bit  [7:0] data_sequence_id[20];
bit  [47:0] da_index;
//==================== Registration ==============//
`uvm_sequence_utils(scenario_ptp_rcv_smoke_test, pcs_virtual_sequencer)
//==================== Registration ==============//

//================================================//
//FUNCTION    : new
//DESCRIPTION : construct
//================================================//
    function new (string name = "scenario_ptp_rcv_smoke_test");               
        super.new();        
        	
    endfunction:new

virtual task post_body();
      //uvm_test_done.drop_objection(this);
      `uvm_info(get_type_name(),"[STOP_SEQUENCE] without drop_objection",UVM_LOW)
  endtask : post_body
  
//================================================//
//TASK        : body
//DESCRIPTION : construct
//================================================//

   virtual task body();
        begin
		super.body();
		  #10us       
		 `uvm_do_on(reg_test_seq0,p_sequencer.rgm_sqr)
         `uvm_do_on(ptp_reg_seq0,p_sequencer.rgm_sqr)
		 //`uvm_do_on(ipp_epp_table_reg_seq0,p_sequencer.rgm_sqr)
		 `uvm_do_on(phy_port_table_reg_seq0,p_sequencer.rgm_sqr)
		 `uvm_do_on(rx_ptp_forward_table_reg_seq0,p_sequencer.rgm_sqr)
		 `uvm_do_on(o_phy_port_pro_table_reg_seq0,p_sequencer.rgm_sqr)
		 
		for(int i =0; i<topology_config0.mac_number;i++)
		//for(int i =2; i<4;i++)
		  begin
		  automatic int index;
          index = i; 
		  fork
          //EXPRESS PACKET
		   if(port_stimulus_s[index].port_en)
		    begin
			if(port_stimulus_s[index].packet_count==0)
			  begin
			    forever
			      begin
				   #INTERVAL;
			       data_len=$urandom_range(1518,46);
			       da_index = 3;//$urandom_range(2,19);
                   seq_do(index);		
                   data_sequence_id[index]++;
                  end
              end	
            else
              begin
			    for(int j=0;j<port_stimulus_s[index].packet_count;j++)
			      begin
				   #INTERVAL;
			       data_len=$urandom_range(1518,46);
			       da_index = 3;//$urandom_range(2,19);
                   seq_do(index);		
                   data_sequence_id[index]++;
                  end
              end			  
			end
          join_none			
          end	
          wait fork;
          	
        end
      endtask  


  task seq_do(input int index);
                     `uvm_do_on_with(mac_seq,p_sequencer.mac_sqr_array[index],
                                  {mac_seq.c_packet_type == `Pdelay_Req;//ptp_item::Pdelay_Req;
								   mac_seq.c_transportSpecific == port_stimulus_s[index].sa_index[3:0];
								   mac_seq.c_da_cnt==port_stimulus_s[index].da_index;
			      				   mac_seq.c_sa_cnt==port_stimulus_s[index].sa_index;
			      				   mac_seq.c_data_control == 1;
			      				   mac_seq.c_data_payload ==data_sequence_id[index];
			      				   mac_seq.c_packet_len == data_len;
			      				   mac_seq.c_tpid == `PTP_ETYPE;
			      				   mac_seq.c_preemptable==0;
			      				 })
  endtask  
endclass