//FILE_HEADER------------------------------------------------------------------------------------------
// ZTE  Copyright
// ZTE Company Confidential
//-----------------------------------------------------------------------------------------------------
// FILE NAME:       pcs_monitor.sv
// DEPARTMENT:      Multi-Service Bearer Product ShenZhen Design&Development Dept.
// AUTHOR:          Li Xiangqiong
// AUTHOR'S EMAIL:  li.xiangqiong@zte.com.cn
//-----------------------------------------------------------------------------------------------------
// RELEASE HISTORY: N/A
// VERSION      DATE         AUTHOR       DESCRIPTION
// 1.1         2011-9-20    Li Xiangqiong   uvm
//-----------------------------------------------------------------------------------------------------
// KEYWORDS: pcs_monitor
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

`ifndef PCS_MONITOR_SV
`define PCS_MONITOR_SV

//------------------------------------------------------------------------------
//
// CLASS: pcs_monitor
//
//------------------------------------------------------------------------------

class pcs_monitor extends pcs_base_monitor;

//================  interface  =====================================//
   pcs_xilinx_serdes_vif vif;
   protected virtual       pcs_xilinx_serdes_if         pcs_if;
//================  interface  =====================================//

//================  variable  =====================================//



   typedef struct{
    bit bit_queue[$];
   }
    bit_data_queue_type ;
  
  bit_data_queue_type rcv_bit_queue[20]; 
  
  protected pcs_item trans_collected;
  
  int file_id;
  string file_name;
//================  variable  =====================================//
  
  `uvm_component_utils_begin(pcs_monitor)
      `uvm_field_object    (vif           , UVM_ALL_ON)
  `uvm_component_utils_end
  //--------------------------------------------------------------------
  // new - constructor
  //--------------------------------------------------------------------
  function new (string name, uvm_component parent);
    super.new(name, parent);
    trans_collected = new();
    file_name = get_full_name();
    //=====================clean up========================//
    file_id = $fopen({"data/",file_name,"_monitor.txt"},"w+");                                               
    $fclose(file_id);
    
  endfunction : new

  //--------------------------------------------------------------------
  // build
  //--------------------------------------------------------------------
  function void build();
    super.build();
    pcs_if = vif.pcs_xilinx_serdes_if;
  endfunction
  
  virtual protected task collect_transactions();
     logic  [319:0] pma_data;
    forever begin
    	@(posedge pcs_if.clk)
    	pma_data_demux(pma_data);
    	push_bit_queue(pma_data);
    	    file_id = $fopen({"data/",file_name,"_monitor.txt"},"a+");                                            
    	  	$fwrite(file_id,$psprintf("time=%0t,block_data[%0d]==%0h\n",$time,0,pma_data[15:0]));      
          $fclose(file_id);

    	if(rcv_bit_queue[0].bit_queue.size>=66)
    	  begin
          gen_trans_collected();
          `uvm_info(get_type_name(),$psprintf("time=%0t,bit_quesu_size[%0d]=%0d ",$time,0,rcv_bit_queue[0].bit_queue.size()), UVM_HIGH)
          file_id = $fopen({"data/",file_name,"_monitor.txt"},"a+");     
    	  	foreach(trans_collected.block_data[i])                                           
    	  	$fwrite(file_id,$psprintf("time=%0t,block_data[%0d]==%66h\n",$time,i,trans_collected.block_data[i]));      
          $fclose(file_id);
    	  end
    	else
    	  begin
    	  	//push_bit_queue(pma_data);
    	  	`uvm_info(get_type_name(),$psprintf("time=%0t,bit_quesu_size[%0d]=%0d ",$time,0,rcv_bit_queue[0].bit_queue.size()), UVM_HIGH)
    	  end
    end
  endtask  


  function void pma_data_demux(output bit[319:0] pma_data);
     pma_data =pcs_if.sig_data;
     
  endfunction

  function void gen_trans_collected();
        foreach(trans_collected.block_data[key])
          begin
          	for(int i=0; i<$bits(trans_collected.block_data[key]);i++)
                trans_collected.block_data[key][i]= rcv_bit_queue[key].bit_queue.pop_front();
          end
        item_collected_port.write(trans_collected);
        
  endfunction
  
  function void push_bit_queue(input [319:0] pma_data);
          foreach(rcv_bit_queue[key])
    	  	  begin
    	  	  	for(int i=0;i<16;i++)
    	  	  	 rcv_bit_queue[key].bit_queue.push_back(pma_data[key*16+15-i]);
    	  	  end
  endfunction
 
endclass : pcs_monitor

`endif // pcs_base_driver_SV

