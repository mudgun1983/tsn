

//------------------------------------------------------------------
// CLASS: seq_reg_user_macro
//------------------------------------------------------------------
class seq_reg_user_macro extends uvm_sequence #(cpu_item);
   bit [15:0]             rsp_data;
  register_config reg_config;
  string scope_name = "";
  int file_id;
  string script_generated;
   `define user_rgm_write_with(ADDR,DATA) \
    begin \
      `uvm_do_with(req,{req.addr == ADDR;req.data == DATA;req.kind == WRITE;}) \
      get_response(rsp); \
    end
    
   `define user_rgm_read_with(ADDR) \
    begin \
      `uvm_do_with(req,{req.addr == ADDR;req.kind == READ;}) \
      get_response(rsp); \
    end
   `define user_read_data   rsp.data 
    
   `define lookup_table              p_sequencer.lookup_table



   `define PCS_BASE_ADDR           32'h0100_0000
   `define PCS0_ADDR          32'h0100_0000     //21:20 = 2'b00
   `define PCS1_ADDR          32'h0110_0000     //21:20 = 2'b01
   
  `uvm_sequence_utils(seq_reg_user_macro,cpu_sequencer)
  
  function new(string name="seq_reg_user_macro");
    super.new(name);
	script_generated = "../data/script_generated.txt";
    file_id=$fopen(script_generated,"w+");                                               
    $fclose(file_id);
  endfunction : new
  
   virtual task pre_body();/*{{{*/
        uvm_test_done.raise_objection(this);
        `uvm_info(get_type_name(),"[START_SEQUENCE]",UVM_LOW)
   endtask : pre_body

   virtual task post_body();
       uvm_test_done.drop_objection(this);
       `uvm_info(get_type_name(),"[STOP_SEQUENCE]",UVM_LOW)
	   generate_script();
   endtask : post_body
  
  virtual task body();
     super.body();
     `uvm_info(get_type_name(),$psprintf("\n-----------------RGM start---------------",),UVM_LOW);
     if( scope_name == "" ) begin
        scope_name = get_full_name(); // this is {       sequencer.get_full_name() , get_name() }
        end

      if( !uvm_config_db #( register_config )::get( null , scope_name ,
      "register_config" , reg_config ) ) begin
        `uvm_fatal(get_type_name(),"=============NO register_config==========");
      end
  endtask: body
  
  virtual task generate_script();
    file_id=$fopen(script_generated,"a+");   
	$fwrite(file_id,$psprintf("crt.Screen.Send "));
	
	if(req.kind == WRITE)
    $fwrite(file_id,$psprintf("\"reg wr 0x%0h 0x%0h\" ",req.addr,req.data));
	else
	$fwrite(file_id,$psprintf("\"reg rd 0x%0h\" ",req.addr));
	
	$fwrite(file_id,$psprintf("& chr(13)\n"));
	$fclose(file_id);				 
  endtask
endclass : seq_reg_user_macro


////------------------------------------------------------------------
//// CLASS: seq_dcn_basic
////------------------------------------------------------------------

class seq_dcn_basic extends seq_reg_user_macro ;

  `uvm_sequence_utils(seq_dcn_basic, cpu_sequencer)
  
  function new(string name="seq_dcn_basic");
    super.new(name);
  endfunction : new
  
  virtual task body();
      super.body();
     `uvm_info(get_type_name(),$psprintf("\n-----------------RGM set begin---------------",),UVM_LOW);

      //=============================debug reg wr rd test============================//
      
       
      //=============================debug reg wr rd test============================//
      
      #1us;
      `user_rgm_read_with(32'h000)  
     
      
      `user_rgm_write_with(32'h001,16'd500) //max 4096        
      `user_rgm_write_with(32'h002,16'd501) 
      
      `user_rgm_write_with(32'h051,16'd500)         
      `user_rgm_write_with(32'h052,16'd501) 

      `user_rgm_write_with(32'h056,16'h0000)//loop back //0: shim0 loop; 1:shim1 loop
      
      `user_rgm_write_with(32'h050,16'h1)   //cnt clr
      `user_rgm_write_with(32'h050,16'h0)  
            
      `user_rgm_read_with(32'h001)
      `user_rgm_read_with(32'h002)
      `user_rgm_read_with(32'h003)
      `user_rgm_read_with(32'h004)
      `user_rgm_read_with(32'h005)
      
      `user_rgm_read_with(32'h011)
      `user_rgm_read_with(32'h012)
      `user_rgm_read_with(32'h013)
      `user_rgm_read_with(32'h014)
      `user_rgm_read_with(32'h015)
      
      //`user_rgm_write_with(32'h017,16'h0) //packet_gen_en
      
      `user_rgm_read_with(32'h100) //version
      
      //`user_rgm_write_with(32'h107,16'h0)  //clean
       

      
      
      `uvm_info(get_type_name(),$psprintf("\n-----------------RGM set end---------------",),UVM_LOW);
 
//      //*****************************************************************
//      // »´æ÷≈‰÷√ 
//      //*****************************************************************
  endtask

endclass : seq_dcn_basic

class seq_packet_gen extends seq_reg_user_macro ;
  `uvm_sequence_utils(seq_packet_gen, cpu_sequencer)
  
  function new(string name="seq_packet_gen");
    super.new(name);
  endfunction : new
  
  virtual task body();
      super.body();
     `uvm_info(get_type_name(),$psprintf("\n-----------------STATICS begin---------------",),UVM_LOW);
     
      `user_rgm_write_with(32'h056,16'h0004)//loop back //0: shim0 loop; 1:shim1 loop
      `user_rgm_write_with(32'h057,16'h1) //packet_gen_en
      `user_rgm_write_with(32'h105,16'b11) //mode
      `user_rgm_write_with(32'h104,16'h4b)//len
      `user_rgm_write_with(32'h103,16'h1) //en
      
      //preamble
      for(int i=0;i<=6;i++)begin
      `user_rgm_write_with(32'h101,i)
      `user_rgm_write_with(32'h102,16'h55) //data
      end
      `user_rgm_write_with(32'h101,16'h7)
      `user_rgm_write_with(32'h102,16'hd5) //data
      
      //da
      for(int i=0;i<=6;i++)begin
      `user_rgm_write_with(32'h101,(16'h8+i))
      `user_rgm_write_with(32'h102,16'h0)
      end
      
      //sa
      for(int i=0;i<=6;i++)begin
      `user_rgm_write_with(32'h101,(16'he+i))
      `user_rgm_write_with(32'h102,(16'h7+i))
      end
      
      //vlan
      `user_rgm_write_with(32'h101,(16'h14))
      `user_rgm_write_with(32'h102,(16'h81))
      `user_rgm_write_with(32'h101,(16'h15))
      `user_rgm_write_with(32'h102,(16'h00))
      `user_rgm_write_with(32'h101,(16'h16))
      `user_rgm_write_with(32'h102,(16'h12))
      `user_rgm_write_with(32'h101,(16'h17))
      `user_rgm_write_with(32'h102,(16'h34))
      
      //etype
      `user_rgm_write_with(32'h101,(16'h18))
      `user_rgm_write_with(32'h102,(16'h00))
      `user_rgm_write_with(32'h101,(16'h19))
      `user_rgm_write_with(32'h102,(16'h2e))
      
      //data
      for(int i=0;i<=45;i++)begin
      `user_rgm_write_with(32'h101,(16'h1a+i))
      `user_rgm_write_with(32'h102,(i))
       end
      
      //crc
      `user_rgm_write_with(32'h101,16'h48)
      `user_rgm_write_with(32'h102,16'h96)
      `user_rgm_write_with(32'h101,16'h49)
      `user_rgm_write_with(32'h102,16'h0f)
      `user_rgm_write_with(32'h101,16'h4a)
      `user_rgm_write_with(32'h102,16'h35)
      `user_rgm_write_with(32'h101,16'h4b)
      `user_rgm_write_with(32'h102,16'hdc)
      
      `user_rgm_write_with(32'h103,16'h0) //en
  endtask

endclass

class seq_dcn_statics_reg extends seq_reg_user_macro ;

  `uvm_sequence_utils(seq_dcn_statics_reg, cpu_sequencer)
  
  function new(string name="seq_dcn_statics_reg");
    super.new(name);
  endfunction : new
  
  virtual task body();
      super.body();
     `uvm_info(get_type_name(),$psprintf("\n-----------------STATICS begin---------------",),UVM_LOW);
     
     
     `user_rgm_read_with(32'h009) // tx_packet_cnt;                
     `user_rgm_read_with(32'h00a) // tx_crc_ind_cnt;               
     `user_rgm_read_with(32'h00b) // tx_packet_discard_shim0_cnt;  
     `user_rgm_read_with(32'h00c) // tx_fifo_empty_shim0_cnt;      
     `user_rgm_read_with(32'h00d) // tx_fifo_full_shim0_cnt;       
     `user_rgm_read_with(32'h00e) // tx_buf_fifo_empty_shim0_cnt;  
     `user_rgm_read_with(32'h00f) // tx_buf_fifo_full_shim0_cnt;   
     `user_rgm_read_with(32'h010) // {3'b0,tx_fifo_data_cnt_shim0};
     `user_rgm_read_with(32'h011) // tx_packet_discard_shim1_cnt;  
     `user_rgm_read_with(32'h012) // tx_fifo_empty_shim1_cnt;      
     `user_rgm_read_with(32'h013) // tx_fifo_full_shim1_cnt;       
     `user_rgm_read_with(32'h014) // tx_buf_fifo_empty_shim1_cnt;  
     `user_rgm_read_with(32'h015) // tx_buf_fifo_full_shim1_cnt;   
     `user_rgm_read_with(32'h015) // {3'b0,tx_fifo_data_cnt_shim1};      
     
      `user_rgm_read_with(32'h059) //rx_packet_cnt;              
      `user_rgm_read_with(32'h05a) //rx_crc_ind_cnt;             
      `user_rgm_read_with(32'h05b) //rx_packet_discard_shim0_cnt;
      `user_rgm_read_with(32'h05c) //rx_fifo_empty_shim0_cnt;    
      `user_rgm_read_with(32'h05d) //rx_fifo_full_shim0_cnt;     
      `user_rgm_read_with(32'h060) //{3'b0,rx_fifo_data_cnt_shim0};
      `user_rgm_read_with(32'h061) //rx_packet_discard_shim1_cnt;  
      `user_rgm_read_with(32'h062) //rx_fifo_empty_shim1_cnt;         
      `user_rgm_read_with(32'h063) //rx_fifo_full_shim1_cnt;       
      `user_rgm_read_with(32'h066) //{3'b0,rx_fifo_data_cnt_shim1}; 
      
      
                 
   endtask                    
   
endclass
////-----------------------------------------------------------------
////--- class seq_eth_read
////------------------------------------------------------------------


