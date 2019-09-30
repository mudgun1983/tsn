
`ifndef SCENARIO_USER_LIB_SV
`define SCENARIO_USER_LIB_SV


//------------------------------------------------------------------------------
//
// CLASS: XXXX
//
//------------------------------------------------------------------------------
class scenario_simple_preemptable_packet_test extends scenario_reg_test;

//==================== Registration ==============//
`uvm_sequence_utils(scenario_simple_preemptable_packet_test, pcs_virtual_sequencer)
//==================== Registration ==============//

//================================================//
//FUNCTION    : new
//DESCRIPTION : construct
//================================================//
    function new (string name = "scenario_simple_preemptable_packet_test");               
        super.new();             
    endfunction:new

//================================================//
//TASK        : body
//DESCRIPTION : construct
//================================================//
   virtual task body();
        begin
		#500ns	
			 //SMD_S0
             `uvm_do_on_with(mac_seq,p_sequencer.mac_sqr,
                            {mac_seq.c_da_cnt==local_da_cnt;
							 mac_seq.c_packet_len == 'd46;
							 mac_seq.c_tpid == 'd138;
							 mac_seq.c_preemptable==1;
							 mac_seq.c_start_or_frag==1; //1:start
							 mac_seq.c_smd==8'hE6;
							 mac_seq.c_xor_value == 32'h0000ffff;
							})
             local_da_cnt++;  	 
			 //SMD_C0_FRAG0
             `uvm_do_on_with(mac_seq,p_sequencer.mac_sqr,
                            {mac_seq.c_da_cnt==local_da_cnt;
							 mac_seq.c_packet_len == 'd46;
							 mac_seq.c_preemptable==1;
							 mac_seq.c_start_or_frag==0;
							 mac_seq.c_preamble_length == 6;
							 mac_seq.c_smd==8'h61;
							 mac_seq.c_frag_cnt==8'hE6;
							 mac_seq.c_xor_value == 32'h0000ffff;
							 })
             local_da_cnt++; 
	 
			 //SMD_C0_FRAG1
             `uvm_do_on_with(mac_seq,p_sequencer.mac_sqr,
                            {mac_seq.c_da_cnt==local_da_cnt;
							 mac_seq.c_packet_len == 'd46;
							 mac_seq.c_preemptable==1;
							 mac_seq.c_start_or_frag==0;
							 mac_seq.c_preamble_length == 6;
							 mac_seq.c_smd==8'h61;
							 mac_seq.c_frag_cnt==8'h4C;
							 mac_seq.c_xor_value == 32'hffffffff;
							 })
             local_da_cnt++; 			 
        end
      endtask    
endclass

class scenario_simple_express_packet_test extends scenario_reg_test;

//==================== Registration ==============//
`uvm_sequence_utils(scenario_simple_express_packet_test, pcs_virtual_sequencer)
//==================== Registration ==============//

//================================================//
//FUNCTION    : new
//DESCRIPTION : construct
//================================================//
    function new (string name = "scenario_simple_express_packet_test");               
        super.new();             
    endfunction:new

//================================================//
//TASK        : body
//DESCRIPTION : construct
//================================================//
   virtual task body();
        begin
		  #500ns	
          //EXPRESS PACKET
		    for(int i=0;i<3;i++)
			 begin
              `uvm_do_on_with(mac_seq,p_sequencer.mac_sqr,
                             {mac_seq.c_da_cnt==local_da_cnt;
							  mac_seq.c_packet_len == 'd46;
							  mac_seq.c_tpid == 'd46;
							  mac_seq.c_preemptable==0;
							 })
              local_da_cnt++; 		
            end			  
        end
      endtask    
endclass

class scenario_simple_e_p_mix_packet_test extends scenario_reg_test;

//==================== Registration ==============//
`uvm_sequence_utils(scenario_simple_e_p_mix_packet_test, pcs_virtual_sequencer)
//==================== Registration ==============//

//================================================//
//FUNCTION    : new
//DESCRIPTION : construct
//================================================//
    function new (string name = "scenario_simple_e_p_mix_packet_test");               
        super.new();             
    endfunction:new

//================================================//
//TASK        : body
//DESCRIPTION : construct
//================================================//
   virtual task body();
        begin		 
             #500ns		
			 //SMD_S0
             `uvm_do_on_with(mac_seq,p_sequencer.mac_sqr,
                            {mac_seq.c_da_cnt==local_da_cnt;
							 mac_seq.c_packet_len == 'd46;
							 mac_seq.c_tpid == 'd138;
							 mac_seq.c_preemptable==1;
							 mac_seq.c_start_or_frag==1; //1:start
							 mac_seq.c_smd==8'hE6;
							 mac_seq.c_xor_value == 32'h0000ffff;
							})
             local_da_cnt++;  
			 
			 //EXPRESS PACKET
              `uvm_do_on_with(mac_seq,p_sequencer.mac_sqr,
                             {mac_seq.c_da_cnt==local_da_cnt;
							  mac_seq.c_packet_len == 'd46;
							  mac_seq.c_tpid == 'd46;
							  mac_seq.c_preemptable==0;
							 })
              local_da_cnt++; 
			 
			 //SMD_C0_FRAG0
             `uvm_do_on_with(mac_seq,p_sequencer.mac_sqr,
                            {mac_seq.c_da_cnt==local_da_cnt;
							 mac_seq.c_packet_len == 'd46;
							 mac_seq.c_preemptable==1;
							 mac_seq.c_start_or_frag==0;
							 mac_seq.c_preamble_length == 6;
							 mac_seq.c_smd==8'h61;
							 mac_seq.c_frag_cnt==8'hE6;
							 mac_seq.c_xor_value == 32'h0000ffff;
							 })
             local_da_cnt++; 
			 
			 //EXPRESS PACKET
              `uvm_do_on_with(mac_seq,p_sequencer.mac_sqr,
                             {mac_seq.c_da_cnt==local_da_cnt;
							  mac_seq.c_packet_len == 'd46;
							  mac_seq.c_tpid == 'd46;
							  mac_seq.c_preemptable==0;
							 })
              local_da_cnt++; 
			 
			 //SMD_C0_FRAG1
             `uvm_do_on_with(mac_seq,p_sequencer.mac_sqr,
                            {mac_seq.c_da_cnt==local_da_cnt;
							 mac_seq.c_packet_len == 'd46;
							 mac_seq.c_preemptable==1;
							 mac_seq.c_start_or_frag==0;
							 mac_seq.c_preamble_length == 6;
							 mac_seq.c_smd==8'h61;
							 mac_seq.c_frag_cnt==8'h4C;
							 mac_seq.c_xor_value == 32'hffffffff;
							 })
             local_da_cnt++; 			   
        end
      endtask    
endclass

`endif // LABEL_FRAME_SV
