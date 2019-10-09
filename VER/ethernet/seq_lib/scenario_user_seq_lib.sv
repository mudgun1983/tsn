
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
							 mac_seq.c_last_frag == 0;   //not last frag
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
							 mac_seq.c_last_frag == 0;   //not last frag
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
							 mac_seq.c_last_frag == 1;   //is last frag
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
							 mac_seq.c_last_frag == 0;   //not last frag
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
							 mac_seq.c_last_frag == 0;   //not last frag
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
							 mac_seq.c_last_frag == 1;   //is last frag
							 mac_seq.c_preamble_length == 6;
							 mac_seq.c_smd==8'h61;
							 mac_seq.c_frag_cnt==8'h4C;
							 mac_seq.c_xor_value == 32'hffffffff;
							 })
             local_da_cnt++; 			   
        end
      endtask    
endclass

class scenario_simple_e_p_mix_random_test extends scenario_reg_test;

int  preemptable_data_len;
int unsigned  express_data_len;

int  preemptable_da_cnt ;
int  express_da_cnt ;

int  preemp_cnt;

typedef enum bit[7:0]{
    SMD_S0    = 8'hE6,
    SMD_S1    = 8'h4C,
    SMD_S2    = 8'h7F,
    SMD_S3    = 8'hB3
  } smd_s_e;

typedef enum bit[7:0]{
	SMD_C0    = 8'h61,
    SMD_C1    = 8'h52,
    SMD_C2    = 8'h9E,
    SMD_C3    = 8'h2A
  } smd_c_e;
  
typedef enum bit[7:0]{
    FRAG_CNT_0     = 8'hE6,
    FRAG_CNT_1     = 8'h4C,
    FRAG_CNT_2     = 8'h7F,
    FRAG_CNT_3     = 8'hB3
  } frag_e;
  
//==================== Registration ==============//
`uvm_sequence_utils(scenario_simple_e_p_mix_random_test, pcs_virtual_sequencer)
//==================== Registration ==============//

//================================================//
//FUNCTION    : new
//DESCRIPTION : construct
//================================================//
    function new (string name = "scenario_simple_e_p_mix_random_test");               
        super.new();             
    endfunction:new

//================================================//
//TASK        : body
//DESCRIPTION : construct
//================================================//
   virtual task body();
        begin
		   #500ns	
           forever begin
            fork		
			 begin
             //EXPRESS PACKET
			 express_data_len = $urandom_range(46,46);
			 $display("express_data_len=%0d",express_data_len);
              `uvm_do_on_with(mac_seq,p_sequencer.mac_sqr,
                             {mac_seq.c_da_cnt==express_da_cnt;
							  mac_seq.c_packet_len == express_data_len;//'d46;
							  mac_seq.c_tpid == 'd46;//express_data_len;//'d46;
							  mac_seq.c_preemptable==0;
							 })
              express_da_cnt++; 		
              end			  
            
 /*             begin			
			 preemptable_data_len =  $urandom_range(1518,92);
			 preemp_cnt = preemptable_data_len%46;
			 for(int i=0;i<4;i++)
			 for(int j=0;j<preemp_cnt;j--)
			   begin
             `uvm_do_on_with(mac_seq,p_sequencer.mac_sqr,
                            {mac_seq.c_da_cnt==preemptable_da_cnt;
							 mac_seq.c_packet_len == 'd46;
							 mac_seq.c_tpid == preemptable_data_len;//'d138;
							 mac_seq.c_preemptable==1;
							 if(j==0)
							 {mac_seq.c_start_or_frag==1;} //1:start
							 else
							 {mac_seq.c_start_or_frag==0;}
							 
							 if(j==(preemp_cnt-1))
							 {mac_seq.c_last_frag == 1;}   //is last frag
							 else
							 {mac_seq.c_last_frag == 0;}   //not last frag
							 
							 if(j==0)
							 {mac_seq.c_smd==smd_s_e'(j);}
							 else
							 {mac_seq.c_smd==smd_c_e'(j);}
							 
							 if(j==(preemp_cnt-1))
							  {mac_seq.c_xor_value == 32'hffffffff;}
							 else
							  {mac_seq.c_xor_value == 32'h0000ffff;}
							})
			   end
              preemptable_da_cnt++;
			 end */
			 
			 join
			 
          end			 
        end
      endtask    
endclass

`endif // LABEL_FRAME_SV
