class scenario_simple_e_p_random_packet_port_test extends scenario_reg_test;
bit  [7:0] data_sequence_id[20];
bit  [7:0] preempt_data_sequence_id[20];
parameter PREEMPT_LIMIT = 46;
parameter    SMD_S0     = 8'hE6;
parameter    SMD_S1     = 8'h4C;
parameter    SMD_S2     = 8'h7F;
parameter    SMD_S3     = 8'hB3;
parameter	 SMD_C0     = 8'h61;
parameter    SMD_C1     = 8'h52;
parameter    SMD_C2     = 8'h9E;
parameter    SMD_C3     = 8'h2A;
parameter    FRAG_CNT_0 = 8'hE6;
parameter    FRAG_CNT_1 = 8'h4C;
parameter    FRAG_CNT_2 = 8'h7F;
parameter    FRAG_CNT_3 = 8'hB3;
	
bit [7:0] smd_s[4]  = '{SMD_S0,SMD_S1,SMD_S2,SMD_S3};
bit [7:0] smd_c[4]  = '{SMD_C0,SMD_C1,SMD_C2,SMD_C3};
bit [7:0] frag[4]   = '{FRAG_CNT_0,FRAG_CNT_1,FRAG_CNT_2,FRAG_CNT_3};

int frame_cnt;
semaphore sem;
//==================== Registration ==============//
`uvm_sequence_utils(scenario_simple_e_p_random_packet_port_test, pcs_virtual_sequencer)
//==================== Registration ==============//

//================================================//
//FUNCTION    : new
//DESCRIPTION : construct
//================================================//
    function new (string name = "scenario_simple_e_p_random_packet_port_test");               
        super.new();  
        sem	= new(1);	
    endfunction:new

//================================================//
//TASK        : body
//DESCRIPTION : construct
//================================================//
   virtual task body();
        begin
		super.body();
		  //#100us
        //foreach(port_stimulus_s[key])
		  //$display("port_stimulus_s[%0d]=%0d",key,port_stimulus_s[key].port_en);
        		
		for(int i =0; i<topology_config0.mac_number;i++)
		//for(int i =2; i<3;i++)
		  begin
		  automatic int index;
          index = i; 
		  fork
          //EXPRESS PACKET
		   if(port_stimulus_s[index].port_en && port_stimulus_s[index].e_p_packet_en[0])
		    begin
			 if(port_stimulus_s[index].packet_count==0)
			   begin 
			    forever
				  express_seq_do(index,item_config0.e_mac_vlan[index]);
			   end
			 else
		       for(int j=0;j<port_stimulus_s[index].packet_count;j++)
		        begin
			      express_seq_do(index,item_config0.e_mac_vlan[index]);
			    end
		    end
			
		    begin
          //PREEMPTABLE PACKET
			if(port_stimulus_s[index].port_en &&  port_stimulus_s[index].e_p_packet_en[1])
			 begin
			   if(port_stimulus_s[index].packet_count==0)
			     begin 
			      forever
				   preemptable_seq_do(index,frame_cnt%4,item_config0.p_mac_vlan[index]);
				   frame_cnt++;
				 end
			   else
                for(int k=0;k<port_stimulus_s[index].packet_count;k++)
                  begin
				    preemptable_seq_do(index,k%4,item_config0.p_mac_vlan[index]);
                  end				  
             end	
			end
          join_none			
          end	
          wait fork;          		  
        end

      endtask    

  task express_seq_do(input int index, input bit[15:0] vlan);
    int unsigned  express_data_len;
    express_data_len = $urandom_range(1518,46);
			 //$display("express_data_len=%0d",express_data_len);
              `uvm_do_on_with(mac_seq,p_sequencer.mac_sqr_array[index],
                             {mac_seq.c_da_cnt==(port_stimulus_s[index].da_index);
							  mac_seq.c_sa_cnt==(port_stimulus_s[index].sa_index);
							  mac_seq.c_packet_len == express_data_len;//'d46;
							  mac_seq.c_tpid == express_data_len;//'d46;
							  mac_seq.c_preemptable==0;
							  mac_seq.c_data_payload ==data_sequence_id[index];
							  mac_seq.c_vlan == vlan;
							 })
				sem.get(1);			 
				data_sequence_id[index]++;		
                sem.put(1);				
  endtask
  
  task preemptable_seq_do(input int index,input int preempt_sequence, input bit[15:0] vlan);
    int  preemptable_data_len;
    int unsigned max_preempt_cnt;
    int unsigned preempt_cnt;
    int unsigned preempt_packet_len_last;
    int preempt_packet_len;

    begin			 
			  preemptable_data_len =  $urandom_range(PREEMPT_LIMIT*4,PREEMPT_LIMIT*8);
			  max_preempt_cnt = preemptable_data_len/PREEMPT_LIMIT;
			  preempt_cnt = $urandom_range(2,max_preempt_cnt);
			  preempt_packet_len_last = 0;
			 for(int j=0;j<preempt_cnt;j++)
			   begin
			    preempt_packet_len = $urandom_range(46,preemptable_data_len/preempt_cnt);
				 //$display("preempt_packet_len=%0d ,preemptable_data_len=%0d,preempt_cnt=%0d,max_preempt_cnt=%0d",preempt_packet_len,preemptable_data_len,preempt_cnt,max_preempt_cnt);
			`uvm_do_on_with(mac_seq,p_sequencer.mac_sqr_array[index],
                            {mac_seq.c_da_cnt==port_stimulus_s[index].da_index;
							 mac_seq.c_sa_cnt==port_stimulus_s[index].sa_index;
							 if(j==(preempt_cnt-1))
							 {mac_seq.c_packet_len == preemptable_data_len-preempt_packet_len_last;}
							 else
							 {mac_seq.c_packet_len == preempt_packet_len;}
							 mac_seq.c_tpid == preemptable_data_len;//'d138;
							 mac_seq.c_preemptable==1;
							 if(j==0)
							 {mac_seq.c_start_or_frag==1;} //1:start
							 else
							 {mac_seq.c_start_or_frag==0;}
							 
							 if(j==(preempt_cnt-1))
							 {mac_seq.c_last_frag == 1;}   //is last frag
							 else
							 {mac_seq.c_last_frag == 0;}   //not last frag
							 
							 if(j==0)
							 {mac_seq.c_smd==smd_s[preempt_sequence];}//smd_s_e'(i);}
							 else
							 {mac_seq.c_smd==smd_c[preempt_sequence];
							  mac_seq.c_preamble_length == 6;
							  mac_seq.c_frag_cnt==frag[(j-1)%4];
							 }
							 
							 if(j==(preempt_cnt-1))
							  {mac_seq.c_xor_value == 32'hffffffff;}
							 else
							  {mac_seq.c_xor_value == 32'hffff0000;}//32'h0000ffff;}
							
							mac_seq.c_data_payload ==data_sequence_id[index];
							mac_seq.c_vlan == vlan;
							}
							)
							preempt_packet_len_last = preempt_packet_len_last+preempt_packet_len;
							sem.get(1);
							data_sequence_id[index]++;
							sem.put(1);
			   end
	end 
  endtask
endclass