//FILE_HEADER------------------------------------------------------------------------------------------
// ZTE  Copyright
// ZTE Company Confidential
//-----------------------------------------------------------------------------------------------------
// FILE NAME:       label_frame.sv
// DEPARTMENT:      Multi-Service Bearer Product ShenZhen Design&Development Dept.
// AUTHOR:           
// AUTHOR'S EMAIL:   
//-----------------------------------------------------------------------------------------------------
// RELEASE HISTORY: N/A
// VERSION      DATE         AUTHOR       DESCRIPTION
// 1.1         2011-9-13    
// 1.2         2012-3-8     Wang Guobing    Change the label identify
//-----------------------------------------------------------------------------------------------------
// KEYWORDS: label_frame
//-----------------------------------------------------------------------------------------------------
// PURPOSE: 
//--------------------------------------------------------------------------------------------------
// PARAMETERS
//         PARAM  NAME    RANGE    : DESCRIPTION    :DEFAULT   :UNITS

//-----------------------------------------------------------------------------------------------------
//REUSE ISSUES
// Reset Strategy:  N/A
// Clock  Domains:  N/A
// Critical Timing: N/A
// Test   Features: N/A
// Asynchronous I/F:N/A
// Scan Methodology:N/A
// Instaniations:   N/A
// Synthesizable:   N/A
// Other:   
// END_HEADER---------------------------------------------------------------------------------------------

`ifndef PCS_SCENARIO_SEQ_LIB_SV
`define PCS_SCENARIO_SEQ_LIB_SV


//------------------------------------------------------------------------------
//
// CLASS: XXXX
//
//------------------------------------------------------------------------------
class scenario_reg_test extends uvm_sequence;

//==================== Attribute =================//
seq_dcn_basic  seq_reg; 
mac_user_sequence mac_seq;
seq_dcn_statics_reg seq_dcn_statics_reg;
seq_packet_gen seq_packet_gen_reg;

bit [47:0] local_da_cnt;
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

//================================================//
//TASK        : body
//DESCRIPTION : construct
//================================================//
   virtual task body();
        begin
		    //`uvm_do_on(seq_reg,p_sequencer.rgm_sqr)
          	//`uvm_do_on(mac_seq,p_sequencer.mac_sqr)
        	//===========================aps reg config=============== 
        	   #100ns
        	  //`uvm_do_on(seq_reg,p_sequencer.rgm_sqr)
//        	  `uvm_do_on(seq_reg_aps_config_seq,p_sequencer.rgm_sqr)
//        	  `uvm_do_on(seq_reg_msp_config_seq,p_sequencer.rgm_sqr)
/*        	  `uvm_do_on_with(seq_reg_lag_config_seq,p_sequencer.rgm_sqr,
        	                  {foreach(seq_reg_lag_config_seq.index_to_dni_pw[key])
        	                           {seq_reg_lag_config_seq.index_to_dni_pw[key].dni_pw_size==1;
        	                            seq_reg_lag_config_seq.index_to_dni_pw[key].dni_pw[0]==key;}
        	                  })*/
//        	  ->p_sequencer.timing_trigger;
        	  //===========================cpu cmd======================
//        	  while(1)
//        	    begin
//        	    	#4000000
//        	    	`uvm_do_on_with(seq_reg,p_sequencer.rgm_sqr,
//        	    	                {seq_reg.pg_id==0;})
//        	    end   
            fork
             
             begin
             forever
             begin
             #300ns
             `uvm_do_on_with(mac_seq,p_sequencer.mac_sqr,
                            {mac_seq.c_da_cnt==local_da_cnt;})
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
             
//             begin
//             	#10ns
//             	`uvm_do_on(seq_packet_gen_reg,p_sequencer.rgm_sqr) 
//             end
            join
            
        end
      endtask    
endclass

class scenario_eth_test extends scenario_reg_test;

//==================== Registration ==============//
`uvm_sequence_utils(scenario_eth_test, pcs_virtual_sequencer)
//==================== Registration ==============//

//================================================//
//FUNCTION    : new
//DESCRIPTION : construct
//================================================//
    function new (string name = "scenario_eth_test");               
        super.new();             
    endfunction:new
    
//================================================//
//TASK        : body
//DESCRIPTION : construct
//================================================//
   virtual task body();
        begin
          	`uvm_do_on(mac_seq,p_sequencer.mac_sqr)
        	//===========================aps reg config=============== 
        	   #100ns
        	  `uvm_do_on(seq_reg,p_sequencer.rgm_sqr)
//        	  `uvm_do_on(seq_reg_aps_config_seq,p_sequencer.rgm_sqr)
//        	  `uvm_do_on(seq_reg_msp_config_seq,p_sequencer.rgm_sqr)
/*        	  `uvm_do_on_with(seq_reg_lag_config_seq,p_sequencer.rgm_sqr,
        	                  {foreach(seq_reg_lag_config_seq.index_to_dni_pw[key])
        	                           {seq_reg_lag_config_seq.index_to_dni_pw[key].dni_pw_size==1;
        	                            seq_reg_lag_config_seq.index_to_dni_pw[key].dni_pw[0]==key;}
        	                  })*/
//        	  ->p_sequencer.timing_trigger;
        	  //===========================cpu cmd======================
//        	  while(1)
//        	    begin
//        	    	#4000000
//        	    	`uvm_do_on_with(seq_reg,p_sequencer.rgm_sqr,
//        	    	                {seq_reg.pg_id==0;})
//        	    end
             forever
             begin
             
             `uvm_do_on_with(mac_seq,p_sequencer.mac_sqr,
                            {mac_seq.c_da_cnt==local_da_cnt;})
             local_da_cnt++;               
             end
       
        end
      endtask    
endclass


`endif // LABEL_FRAME_SV
