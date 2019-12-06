class simple_e_p_random_packet_port_test extends simple_preemptable_packet_port_test;
 
   `uvm_component_utils(simple_e_p_random_packet_port_test)
 

    function new(string name="simple_e_p_random_packet_port_test" ,  uvm_component parent=null);
        super.new(name,parent); 
        //TIME_OUT_INTERVAL = 10us;
     endfunction : new
  
   virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);       
//==================================scenario============================================       
       uvm_config_db#(uvm_object_wrapper)::set(this,"pcs_tx_rx_env0.virt_seqr.run_phase", 
			            "default_sequence",
	       		    	scenario_simple_e_p_random_packet_port_test::type_id::get());
//==================================scenario============================================               
   endfunction : build_phase
   
  function void end_of_elaboration();
    `uvm_info(get_type_name(),
      $psprintf("Printing the test topology :\n%s", this.sprint(printer)), UVM_HIGH)
  endfunction : end_of_elaboration    

 virtual function void report_phase(uvm_phase phase);
    bit test_fail;
     foreach(port_stimulus_s[key])
	   begin
	     if(port_stimulus_s[key].port_en)
		   begin
		    if(comp_success_count[key]!=port_stimulus_s[key].packet_count*2)
		     test_fail=1;
			else
			 $display("comp_success_count[%0d]=%0d",key,comp_success_count[key]);
		   end
	   end
	   
	   if(~test_fail)
	     begin
		   file_id=$fopen(test_result_file,"a+"); 
		   $fwrite(file_id,$psprintf({get_type_name()," PASS\n"}));	
		   $fclose(file_id);
		   `uvm_info(get_type_name(), "** UVM TEST PASSED **", UVM_NONE)
		   test_pass=1;
		 end
	   else
	     begin
		   file_id=$fopen(test_result_file,"a+"); 
		   $fwrite(file_id,$psprintf({get_type_name()," FAIL\n"}));	
		   $fclose(file_id);
		   `uvm_error(get_type_name(), "** UVM TEST FAIL **")
		   test_pass=0;
		 end
  endfunction
  
virtual function set_port_stimulus_value();
    for(int i=0; i<20;i++)
      begin
       port_stimulus_s[i] = 0;
      end
  
 //port_stimulus_s[0].port_en = 1;
 //port_stimulus_s[1].port_en = 1;
 port_stimulus_s[2].port_en = 1;
 // port_stimulus_s[3].port_en = 1;
 // port_stimulus_s[4].port_en = 1;
 // port_stimulus_s[5].port_en = 1;
 // port_stimulus_s[6].port_en = 1;
 // port_stimulus_s[7].port_en = 1;
 // port_stimulus_s[8].port_en = 1;
 // port_stimulus_s[9].port_en = 1;
 // port_stimulus_s[10].port_en = 1;

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

port_stimulus_s[0].da_index =   0;//(19- 0);   
port_stimulus_s[1].da_index =   1;//(19- 1);
port_stimulus_s[2].da_index =   2;//(19- 2);  
port_stimulus_s[3].da_index =   3;//(19- 3);
port_stimulus_s[4].da_index =   4;//(19- 4);
port_stimulus_s[5].da_index =   5;//(19- 5);
port_stimulus_s[6].da_index =   6;//(19- 6);
port_stimulus_s[7].da_index =   7;//(19- 7);
port_stimulus_s[8].da_index =   8;//(19- 8);
port_stimulus_s[9].da_index =   9;//(19- 9);
port_stimulus_s[10].da_index =   10;//(19- 9);

//port_stimulus_s[0].packet_count = 1;  //0: forever
//port_stimulus_s[1].packet_count = 1;
port_stimulus_s[2].packet_count = 20; //comment means no limit, it will generate packet forever
//port_stimulus_s[3].packet_count = 1;
//port_stimulus_s[4].packet_count = 1;
//port_stimulus_s[5].packet_count = 1;
//port_stimulus_s[6].packet_count = 1;
//port_stimulus_s[7].packet_count = 1;
//port_stimulus_s[8].packet_count = 1;
//port_stimulus_s[9].packet_count = 1;
//port_stimulus_s[10].packet_count = 1;

port_stimulus_s[0].e_p_packet_en  = 2'b11;
port_stimulus_s[1].e_p_packet_en  = 2'b11;
port_stimulus_s[2].e_p_packet_en  = 2'b11;
port_stimulus_s[3].e_p_packet_en  = 2'b11;
port_stimulus_s[4].e_p_packet_en  = 2'b11;
port_stimulus_s[5].e_p_packet_en  = 2'b11;
port_stimulus_s[6].e_p_packet_en  = 2'b11;
port_stimulus_s[7].e_p_packet_en  = 2'b11;
port_stimulus_s[8].e_p_packet_en  = 2'b11;
port_stimulus_s[9].e_p_packet_en  = 2'b11;
port_stimulus_s[10].e_p_packet_en = 2'b11;
endfunction 

virtual function set_item_config_value();
 item_config0.eth_item_payload=`ASSIGN_ALL_BYTE;
endfunction
endclass