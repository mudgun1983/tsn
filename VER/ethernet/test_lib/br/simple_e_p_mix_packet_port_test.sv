class simple_e_p_mix_packet_port_test extends simple_preemptable_packet_port_test;
 
   `uvm_component_utils(simple_e_p_mix_packet_port_test)
 

    function new(string name="simple_e_p_mix_packet_port_test" ,  uvm_component parent=null);
        super.new(name,parent); 
        //TIME_OUT_INTERVAL = 10us;
     endfunction : new
  
   virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);       
//==================================scenario============================================       
       uvm_config_db#(uvm_object_wrapper)::set(this,"pcs_tx_rx_env0.virt_seqr.run_phase", 
			            "default_sequence",
	       		    	scenario_simple_e_p_mix_packet_port_test::type_id::get());
//==================================scenario============================================               
   endfunction : build_phase
   
  function void end_of_elaboration();
    `uvm_info(get_type_name(),
      $psprintf("Printing the test topology :\n%s", this.sprint(printer)), UVM_HIGH)
  endfunction : end_of_elaboration    

virtual function set_port_stimulus_value();
    for(int i=0; i<20;i++)
      begin
       port_stimulus_s[i] = 0;
      end
  
 port_stimulus_s[0].port_en = 1;
 port_stimulus_s[1].port_en = 1;
 port_stimulus_s[2].port_en = 1;
 port_stimulus_s[3].port_en = 1;
 port_stimulus_s[4].port_en = 1;
 port_stimulus_s[5].port_en = 1;
 port_stimulus_s[6].port_en = 1;
 port_stimulus_s[7].port_en = 1;
 port_stimulus_s[8].port_en = 1;
 port_stimulus_s[9].port_en = 1;
 port_stimulus_s[10].port_en = 1;

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
endfunction 

virtual function set_item_config_value();
 item_config0.eth_item_payload=`ASSIGN_ALL_BYTE;
endfunction
endclass