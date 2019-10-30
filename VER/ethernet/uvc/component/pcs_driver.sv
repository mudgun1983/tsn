

`ifndef PCS_DRIVER_SV
`define PCS_DRIVER_SV

//------------------------------------------------------------------------------
//
// CLASS: pcs_driver
//
//------------------------------------------------------------------------------
class pcs_driver extends pcs_base_driver;

//================  interface  =====================================//
   pcs_xilinx_serdes_vif vif;
   protected virtual       pcs_xilinx_serdes_if         pcs_if;
//================  interface  =====================================//

//================  variable   =====================================//  
   typedef struct{
    bit bit_queue[$];
   }
    bit_data_queue_type ;
     
   int left_bit_data_size;
   bit_data_queue_type bit_data_queue[20];
   int file_id;
   

//================  variable   =====================================//  
   
  
  `uvm_component_utils_begin(pcs_driver)
    `uvm_field_object    (vif           , UVM_ALL_ON)
  `uvm_component_utils_end
  
  //--------------------------------------------------------------------
  // new - constructor
  //--------------------------------------------------------------------
  function new (string name, uvm_component parent);
    super.new(name, parent);
    
    //=====================clean up========================//
    file_id = $fopen("data/driver.txt","w+");                                               
    $fclose(file_id);
  endfunction : new

  //--------------------------------------------------------------------
  // build
  //--------------------------------------------------------------------
  function void build();
    super.build();
    pcs_if = vif.pcs_xilinx_serdes_if;
  endfunction
     
  //--------------------------------------------------------------------
  // run
  //--------------------------------------------------------------------
  virtual task run_phase(uvm_phase phase);
      fork
        get_and_drive();
        reset_signals();
      join  
  endtask : run_phase

  virtual protected task get_and_drive();
    forever 
    begin
    	begin
    	  @(posedge pcs_if.clk);
    	  //$display("one posedge pcs_if.clk ");
    	  //if(pcs_if.reset==1'b1)
    		//continue;
    	end
    	
    	pcs_rx();
    end

  endtask : get_and_drive

  virtual protected task reset_signals();
    return;
  endtask : reset_signals
  
  virtual protected task pcs_rx();
  
    int bit_data_size;   
    bit [319:0] pma_data;  
    
    
    forever begin
    	//`uvm_info(get_type_name(),$psprintf("time=%0t,bit_data_size=%0d ",$time,bit_data_size), UVM_LOW)
    	@(posedge pcs_if.clk)
    	if(bit_data_size <16)
    	  begin
    	  	get_pcs_item();
    	  	
    	  	file_id = $fopen("data/driver.txt","a+");
    	  	$fwrite(file_id,$psprintf("time=%0t,req.packet_type==%0s\n",$time,req.packet_type));       
    	  	foreach(req.block_data[i])                                           
    	  	$fwrite(file_id,$psprintf("time=%0t,req.block_data[%0d]==%0h\n",$time,i,req.block_data[i]));      
          $fclose(file_id);
          
    	  	bit_data_size= $bits(req.block_data[0])+ left_bit_data_size;
    	  	//$display("bit_data_size2=%0d",bit_data_size);
    	  	for(int i=0;i<20;i++)
    	  	  begin
    	  	  	//for(int j=0; j < $bits(req.block_data[i]);j++)
    	  	  	for(int j=($bits(req.block_data[i])-1) ; j >= 0;j--)
    	  	  	 bit_data_queue[i].bit_queue.push_back(req.block_data[i][j]); 	  	  	 
    	  	  	//`uvm_info(get_type_name(),$psprintf("time=%0t,bit_quesu_size[%0d]=%0d ",$time,i,bit_data_queue[i].bit_queue.size()), UVM_HIHG)
    	  	  end
    	  	
    	  	pma_trans(pma_data);
    	  	pcs_if.sig_data<=pma_data;
    	  	bit_data_size=bit_data_size-16;
    	  	left_bit_data_size=bit_data_size;
    	  	  
    	  end
    	else
    	  begin
    	  	  pma_trans(pma_data);
    	  	  pcs_if.sig_data<=pma_data;
    	  	  bit_data_size=bit_data_size-16;
    	  	  left_bit_data_size=bit_data_size;
    	  end
    end    
          
  endtask : pcs_rx
   
  function void pma_trans(output [319:0] pma_data);
      bit[319:0] pma_data_tmp;     
      bit [15:0] lane_in[20];
      bit [79:0] lane3_in;
      bit [79:0] lane2_in;
      bit [79:0] lane1_in;
      bit [79:0] lane0_in;

      
      for(int i=0;i<20;i++)
       // for(int j=0;j<16;j++)
       for(int j=15;j>=0;j--)
          begin 
          	pma_data_tmp[i*16+j] = bit_data_queue[i].bit_queue.pop_front();
          end

     
     lane_in[0 ] = pma_data_tmp[15-:16];
     lane_in[1 ]  = pma_data_tmp[31 -:16];
     lane_in[2 ]  = pma_data_tmp[47 -:16];
     lane_in[3 ]  = pma_data_tmp[63 -:16];
     lane_in[4 ]  = pma_data_tmp[79 -:16];
     lane_in[5 ]  = pma_data_tmp[95 -:16];
     lane_in[6 ]  = pma_data_tmp[111-:16];
     lane_in[7 ]  = pma_data_tmp[127-:16];
     lane_in[8 ]  = pma_data_tmp[143-:16];
     lane_in[9 ]  = pma_data_tmp[159-:16];
     lane_in[10]  = pma_data_tmp[175-:16];
     lane_in[11]  = pma_data_tmp[191-:16];
     lane_in[12]  = pma_data_tmp[207-:16];
     lane_in[13]  = pma_data_tmp[223-:16];
     lane_in[14]  = pma_data_tmp[239-:16];
     lane_in[15]  = pma_data_tmp[255-:16];
     lane_in[16]  = pma_data_tmp[271-:16];
     lane_in[17]  = pma_data_tmp[287-:16];
     lane_in[18]  = pma_data_tmp[303-:16];
     lane_in[19]  = pma_data_tmp[319-:16];
                 
     
     for(int i=0;i<5;i++)begin
      for (int ix = 0; ix < 16; ix = ix + 1) begin
            pma_data[i*80+ix*5 + 0] = lane_in[i*5+4][ix];
            pma_data[i*80+ix*5 + 1] = lane_in[i*5+3][ix];
            pma_data[i*80+ix*5 + 2] = lane_in[i*5+2][ix];
            pma_data[i*80+ix*5 + 3] = lane_in[i*5+1][ix];
            pma_data[i*80+ix*5 + 4] = lane_in[i*5+0][ix];
        end
      end
        
  endfunction
  
  task get_pcs_item();
       begin      	
      //`uvm_info(get_type_name(), "** get pcs_item before get_next_item **", UVM_HIHG)
      	seq_item_port.get_next_item(req);
      //`uvm_info(get_type_name(), "** get pcs_item after get_next_item **", UVM_HIHG)
        req.do_self_define_pack();
//        req.print();
        $cast(rsp, req.clone());
        rsp.set_id_info(req);
        seq_item_port.item_done();
        seq_item_port.put_response(rsp);
       end
  endtask
  
endclass : pcs_driver

`endif // pcs_driver_SV

