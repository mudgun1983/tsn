
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

int unsigned preemptable_da_cnt ;
int unsigned express_da_cnt;

int unsigned max_preempt_cnt;
int unsigned preempt_cnt;
int unsigned preempt_packet_len_last;

parameter PREEMPT_LIMIT = 46;
int preempt_packet_len;


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
           //forever
		   begin
            fork		
			for(int i=0;i<10;i++)
			 begin
             //EXPRESS PACKET
 			 express_data_len = $urandom_range(1518,46);
			 //$display("express_data_len=%0d",express_data_len);
              `uvm_do_on_with(mac_seq,p_sequencer.mac_sqr,
                             {mac_seq.c_da_cnt==(express_da_cnt+48'h80_00_00_00_00_00);
							  mac_seq.c_packet_len == express_data_len;//'d46;
							  mac_seq.c_tpid == express_data_len;//'d46;
							  mac_seq.c_preemptable==0;
							 })
              express_da_cnt++; 		
              end	   
            //PREEMPTABLE PACKET
              begin	
             for(int i=0;i<4;i++)
              begin			 
			  preemptable_data_len =  $urandom_range(PREEMPT_LIMIT*4,PREEMPT_LIMIT*8);
			  max_preempt_cnt = preemptable_data_len/PREEMPT_LIMIT;
			  preempt_cnt = $urandom_range(2,max_preempt_cnt);
			  preempt_packet_len_last = 0;
			 for(int j=0;j<preempt_cnt;j++)
			   begin
			    preempt_packet_len = $urandom_range(46,preemptable_data_len/preempt_cnt);
				 //$display("preempt_packet_len=%0d ,preemptable_data_len=%0d,preempt_cnt=%0d,max_preempt_cnt=%0d",preempt_packet_len,preemptable_data_len,preempt_cnt,max_preempt_cnt);
			`uvm_do_on_with(mac_seq,p_sequencer.mac_sqr,
                            {mac_seq.c_da_cnt==preemptable_da_cnt;
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
							 {mac_seq.c_smd==smd_s[i];}//smd_s_e'(i);}
							 else
							 {mac_seq.c_smd==smd_c[i];
							  mac_seq.c_preamble_length == 6;
							  mac_seq.c_frag_cnt==frag[(j-1)%4];
							 }
							 
							 if(j==(preempt_cnt-1))
							  {mac_seq.c_xor_value == 32'hffffffff;}
							 else
							  {mac_seq.c_xor_value == 32'h0000ffff;}
							})
							preempt_packet_len_last = preempt_packet_len_last+preempt_packet_len;
			   end
              preemptable_da_cnt++;
			  end
			 end 
			 
			 join
			 
          end			 
        end
      endtask    
endclass

`endif // LABEL_FRAME_SV
