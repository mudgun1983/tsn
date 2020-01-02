class debug_item_config extends uvm_object;
rand int data_len;

function new( string name = "" );
super.new( name );
endfunction

constraint c_data_len{
 data_len dist{46:/97,46:/3};
}
endclass

class test_throughput_single_xge_64_1518 extends pcs_base_test;
 
   `uvm_component_utils(test_throughput_single_xge_64_1518)
 
    mac_user_sequence mac_seq_array[];
	int data_len;
	bit  [7:0] data_sequence_id[];
	int        init_finish;
	debug_item_config debug_item_config0;
    function new(string name="test_throughput_single_xge_64_1518" ,  uvm_component parent=null);
        super.new(name,parent);  
		TIME_OUT_INTERVAL=50ms; 	
        debug_item_config0 = new();
     endfunction : new
  
   virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);       
//==================================scenario============================================       
       uvm_config_db#(uvm_object_wrapper)::set(this,"pcs_tx_rx_env0.virt_seqr.run_phase", 
			            "default_sequence",
	       		    	scenario_reg_test::type_id::get());
//==================================scenario============================================    

		mac_seq_array = new[topology_config0.mac_number];
		foreach(mac_seq_array[key])
		mac_seq_array[key]=new();     

        data_sequence_id = new[topology_config0.mac_number]	;	
   endfunction : build_phase
   
   function void end_of_elaboration();
    `uvm_info(get_type_name(),
      $psprintf("Printing the test topology :\n%s", this.sprint(printer)), UVM_LOW)
  endfunction : end_of_elaboration 
  
  task run_phase(uvm_phase phase);
  
   phase.raise_objection( this );
	 fork
	 basic_run_monitor(phase);
	 
	 begin
	 //#100us;
	 `ifndef DUMMY_DUT
	 dut_if0.init_finish(init_finish);
	 $display("init_finish=%0b",init_finish);
	 `else
	 `endif
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
			       //data_len=$urandom_range(1518,46);
				   debug_item_config0.randomize();
				   data_len = debug_item_config0.data_len;
				   //item_config0.tagged_size = $urandom_range(1,2);
                   seq_do(index);		
                   data_sequence_id[index]++;
                  end
              end	
            else
              begin
			    for(int j=0;j<port_stimulus_s[index].packet_count;j++)
			      begin
			       //data_len=$urandom_range(1518,46);
				   debug_item_config0.randomize();
				   data_len = debug_item_config0.data_len;
				   //item_config0.tagged_size = $urandom_range(1,2);
                   seq_do(index);		
                   data_sequence_id[index]++;
                  end
              end			  
			end
          join_none			
          end	
		  $display("item done at %0t",$time);
		  	  #100us;	   
	       phase.drop_objection( this );
          wait fork;
		  
	//	  #100us;	   
	// phase.drop_objection( this );
	 $display("phase.drop_objection at %0t",$time);
	 end
	 
	 join
	 
   
  endtask
  
  virtual function void report_phase(uvm_phase phase);
      bit [`MAX_ENV_MAC_NUM-1] port_en_array;
	  test_pass = 1;
	  port_en_array = 0;
	  foreach(port_stimulus_s[key])begin
	   if(port_stimulus_s[key].port_en)begin
	   port_en_array[key]=1;
	   if(comp_success_count[key]==0)
	     begin
           test_pass = 0;
		   $display("comp_success_count[%0d]=%0d",key,comp_success_count[key]);		   
		 end
	   else
	     begin
           $display("comp_success_count[%0d]=%0d",key,comp_success_count[key]);
		 end
	   end
	  end
	  
	  if(test_pass && (|port_en_array))begin
		   file_id=$fopen(test_result_file,"a+"); 
		   $fwrite(file_id,$psprintf({get_type_name()," PASS\n"}));	
		   $fclose(file_id);
		   `uvm_info(get_type_name(), "** UVM TEST PASSED **", UVM_NONE)
		end
	  else
	    begin
		   file_id=$fopen(test_result_file,"a+"); 
		   $fwrite(file_id,$psprintf({get_type_name()," FAIL\n"}));	
		   $fclose(file_id);
		   `uvm_error(get_type_name(), "** UVM TEST FAIL **")
		end
	  
  endfunction
  
  task seq_do(input int index);							 
       if ( !(mac_seq_array[index].randomize() with {
	                                              mac_seq_array[index].c_da_cnt==port_stimulus_s[index].da_index;
							                      mac_seq_array[index].c_sa_cnt==port_stimulus_s[index].sa_index;
							                      mac_seq_array[index].c_data_control == 1;
							                      mac_seq_array[index].c_data_payload ==data_sequence_id[index];
							                      mac_seq_array[index].c_packet_len == data_len;
							                      mac_seq_array[index].c_tpid == data_len;
							                      mac_seq_array[index].c_preemptable==0;
												  mac_seq_array[index].c_vlan == 'h100;
												  
	                                             } )) 
        begin
		 `uvm_error(get_type_name, "Randomize Failed!") 
		end		
		mac_seq_array[index].start(pcs_tx_rx_env0.mac_env0[index].mac_rx_agent0.sequencer);
  endtask  
  
 virtual function set_port_stimulus_value();
   int dut_max_port;
   dut_max_port = `DUT_MAX_PORT-1;
    for(int i=0; i<20;i++)
      begin
       port_stimulus_s[i] = 0;
      end
    
	//for(int i=2;i<=dut_max_port;i++)
	  //port_stimulus_s[i].port_en = 1;
 //port_stimulus_s[3].port_en = 1;
 //port_stimulus_s[6].port_en = 1;
port_stimulus_s[0].port_en = 1;
port_stimulus_s[1].port_en = 1;
//port_stimulus_s[0].packet_count = 1;  //0: forever
port_stimulus_s[1].packet_count = 1;
port_stimulus_s[2].packet_count = 500; //comment means no limit, it will generate packet forever
port_stimulus_s[3].packet_count = 500;
port_stimulus_s[4].packet_count = 500;
port_stimulus_s[5].packet_count = 500;
port_stimulus_s[6].packet_count = 500;
port_stimulus_s[7].packet_count = 500;
port_stimulus_s[8].packet_count = 500;
port_stimulus_s[9].packet_count = 500;
//port_stimulus_s[10].packet_count = 1;
//port_stimulus_s[11].packet_count = 1;
//port_stimulus_s[12].packet_count = 1;
//port_stimulus_s[13].packet_count = 1;
//port_stimulus_s[14].packet_count = 1;
//port_stimulus_s[15].packet_count = 1;
//port_stimulus_s[16].packet_count = 1;
//port_stimulus_s[17].packet_count = 1;
//port_stimulus_s[18].packet_count = 1;
//port_stimulus_s[19].packet_count = 1;

port_stimulus_s[0].sa_index = 0;   
port_stimulus_s[1].sa_index = 1;
port_stimulus_s[2].sa_index = 2;  
port_stimulus_s[3].sa_index = 3;
port_stimulus_s[4].sa_index = 4;
port_stimulus_s[5].sa_index = 5;
port_stimulus_s[6].sa_index = 6;
port_stimulus_s[7].sa_index = 7;
port_stimulus_s[8].sa_index = 8;
port_stimulus_s[9].sa_index = 9;
port_stimulus_s[10].sa_index = 10;
port_stimulus_s[11].sa_index = 11;
port_stimulus_s[12].sa_index = 12;
port_stimulus_s[13].sa_index = 13;
port_stimulus_s[14].sa_index = 14;
port_stimulus_s[15].sa_index = 15;
port_stimulus_s[16].sa_index = 16;
port_stimulus_s[17].sa_index = 17;
port_stimulus_s[18].sa_index = 18;
port_stimulus_s[19].sa_index = 19;

port_stimulus_s[0].da_index =  1;//(dut_max_port- 0);   
port_stimulus_s[1].da_index =  0;//(dut_max_port- 1);

endfunction      

virtual function set_item_config_value();
  item_config0.eth_item_payload=`ASSIGN_ALL_BYTE;
endfunction 
endclass