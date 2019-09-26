//----------------------------------------------------------------------
//   Copyright 2007-2010 Mentor Graphics Corporation
//   Copyright 2007-2010 Cadence Design Systems, Inc.
//   Copyright 2010 Synopsys, Inc.
//   All Rights Reserved Worldwide
//
//   Licensed under the Apache License, Version 2.0 (the
//   "License"); you may not use this file except in
//   compliance with the License.  You may obtain a copy of
//   the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in
//   writing, software distributed under the License is
//   distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
//   CONDITIONS OF ANY KIND, either express or implied.  See
//   the License for the specific language governing
//   permissions and limitations under the License.
//----------------------------------------------------------------------

//------------------------------------------------------------------------------
//
// CLASS: ubus_example_scoreboard
//
//------------------------------------------------------------------------------

class pcs_ref_model extends uvm_scoreboard;

  uvm_analysis_imp#(pcs_item, pcs_ref_model) item_collected_export;
  uvm_analysis_port #(pcs_item) state_port;
  pcs_item pcs_trans_pre;
  pcs_item pcs_trans;
  pcs_item pcs_sync_trans;
  
  protected bit disable_scoreboard = 0;
  protected int num_writes = 0;
  protected int num_init_reads = 0;
  protected int num_uninit_reads = 0;
  int file_id;
  string file_name;
  
  
  int bit_slide_cnt[20];
  int sh_valid_cnt[20];
  bit lane_block_sync[20];
  
  protected int unsigned m_mem_expected[int unsigned];

  // Provide implementations of virtual methods such as get_type_name and create
  `uvm_component_utils_begin(pcs_ref_model)
    `uvm_field_int(disable_scoreboard, UVM_DEFAULT)
    `uvm_field_int(num_writes, UVM_DEFAULT|UVM_DEC)
    `uvm_field_int(num_init_reads, UVM_DEFAULT|UVM_DEC)
    `uvm_field_int(num_uninit_reads, UVM_DEFAULT|UVM_DEC)
  `uvm_component_utils_end

  // new - constructor
  function new (string name, uvm_component parent);
    super.new(name, parent);
    pcs_trans_pre = new();
    pcs_trans     = new();
    pcs_sync_trans= new();
    file_name = get_full_name();
    //=====================clean up========================//
    file_id = $fopen({"data/",file_name,"_pcs_ref_model.txt"},"w+");                                               
    $fclose(file_id);
    
    item_collected_export = new("item_collected_export", this);
    
  endfunction : new

  //build_phase
  function void build_phase(uvm_phase phase);
    
  endfunction

  // write
  virtual function void write(pcs_item trans);
    if(!disable_scoreboard)
      pcs_rcv(trans);
  endfunction : write

  // memory_verify
  protected function void pcs_rcv(input pcs_item trans);
    int unsigned data, exp;
    int slide_cnt_constant;
    pcs_item pcs_trans_local;
    $cast(pcs_trans_local,trans);
    //pcs_trans_local.print();
//    //=========search 01 or 10===========//
   foreach(trans.block_data[key])
     begin
     	 case({trans.block_data[key][bit_slide_cnt[key]],trans.block_data[key][bit_slide_cnt[key]+1]})
     	       2'b10,2'b01:begin
     	       	              sh_valid_cnt[key]++;
     	       	              bit_slide_cnt[key] = bit_slide_cnt[key];
     	       	           end
     	       default    :begin
     	       	              sh_valid_cnt[key] = 0;
     	       	              bit_slide_cnt[key]++;
     	       	           end
       endcase
       
       if(sh_valid_cnt[key]>=64)
          lane_block_sync[key] = 1;
       else
          lane_block_sync[key] = 0;
     end
    
    file_id = $fopen({"data/",file_name,"_pcs_ref_model.txt"},"a+");
    $fwrite(file_id,$psprintf("time=%0t,local_block_data[0]=%0h\n",$time,pcs_trans_local.block_data[0]));
    $fwrite(file_id,$psprintf("time=%0t,sh_valid_cnt[0]=%0d,bit_slide_cnt[0]=%0d\n",$time,sh_valid_cnt[0],bit_slide_cnt[0]));  
    $fwrite(file_id,$psprintf("time=%0t,lane_block_sync[0]=%0d\n",$time,lane_block_sync[0]));                                               
    $fclose(file_id);
    
   foreach(pcs_sync_trans.block_data[key])
     begin
     	  slide_cnt_constant = bit_slide_cnt[key];
     	  if(lane_block_sync[key]==1)
     	    begin
     	    	if(bit_slide_cnt[key]==0)
     	      	pcs_sync_trans.block_data[key] = pcs_trans_pre.block_data[key];
     	      else
     	        begin
     	        	for(int i=0;i<$bits(pcs_sync_trans.block_data[key]);i++)
     	        	  begin
     	        	  	if(($bits(pcs_sync_trans.block_data[key])-((slide_cnt_constant+1)+i+1))>=0)
     	        	    	pcs_sync_trans.block_data[key][i]= pcs_trans_pre.block_data[key][slide_cnt_constant+i];
     	        	  	else
     	        	  	  pcs_sync_trans.block_data[key][i]= pcs_trans.block_data[key][i-($bits(pcs_sync_trans.block_data[key])-slide_cnt_constant)];
     	        	  end
     	        	
     	        	file_id = $fopen({"data/",file_name,"_pcs_ref_model.txt"},"a+");
                $fwrite(file_id,$psprintf("pcs_sync_trans.block_data[%0d]=%0h\n",key,pcs_sync_trans.block_data[key]));                                               
                $fclose(file_id);
     	        end
     	    end
     end
    
    assert($cast(pcs_trans_pre,trans));
     
  endfunction : pcs_rcv

  // report_phase
  virtual function void report_phase(uvm_phase phase);
    if(!disable_scoreboard) begin
      `uvm_info(get_type_name(),
        $sformatf("Reporting scoreboard information...\n%s", this.sprint()), UVM_LOW)
    end
  endfunction : report_phase

endclass 


