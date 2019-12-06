
`ifndef PCS_SCENARIO_SEQ_LIB_SV
`define PCS_SCENARIO_SEQ_LIB_SV


//------------------------------------------------------------------------------
//
// CLASS: XXXX
//
//------------------------------------------------------------------------------
class scenario_reg_test extends uvm_sequence;

//==================== Attribute =================//
mac_user_sequence mac_seq;

bit [47:0] local_da_cnt;
bit [47:0] local_sa_cnt;
topology_config       topology_config0;
item_config           item_config0;
string scope_name = "";

//==================== Registration ==============//
`uvm_sequence_utils(scenario_reg_test, pcs_virtual_sequencer)
//==================== Registration ==============//

//================================================//
//FUNCTION    : new
//DESCRIPTION : construct
//================================================//
    function new (string name = "scenario_reg_test");               
        super.new();   
    endfunction:new

 virtual task pre_body();/*{{{*/
       uvm_test_done.raise_objection(this);
       `uvm_info(get_type_name(),"[START_SEQUENCE]",UVM_LOW)
  endtask : pre_body

  virtual task post_body();
      uvm_test_done.drop_objection(this);
      `uvm_info(get_type_name(),"[STOP_SEQUENCE]",UVM_LOW)
  endtask : post_body
  
//================================================//
//TASK        : body
//DESCRIPTION : construct
//================================================//
   virtual task body();
        begin
  
        if( scope_name == "" ) begin
        scope_name = get_full_name(); // this is {       sequencer.get_full_name() , get_name() }
        end

        if( !uvm_config_db #( topology_config )::get( null , scope_name ,
        "topology_config" , topology_config0 ) ) begin
        `uvm_fatal(get_type_name(),"=============NO topology_config==========");
        end
		
	    if( !uvm_config_db #( item_config )::get( null , scope_name ,
        "item_config" , item_config0 ) ) begin
        `uvm_fatal(get_type_name(),"=============NO item_config==========");
        end
		/*
            fork            
             begin
             begin		  
			 //SMD_S0
             `uvm_do_on_with(mac_seq,p_sequencer.mac_sqr,
                            {mac_seq.c_da_cnt==0;//local_da_cnt;
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
                            {mac_seq.c_da_cnt==0;//local_da_cnt;
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
                            {mac_seq.c_da_cnt==0;//local_da_cnt;
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
             end
             
             begin
             	forever
             	begin
             	#500ns
              `uvm_do_on(seq_dcn_statics_reg,p_sequencer.rgm_sqr)
              end
             end            
            join
        */    
        end
      endtask    
endclass




`endif // LABEL_FRAME_SV
