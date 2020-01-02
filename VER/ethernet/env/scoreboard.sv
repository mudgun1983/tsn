


class scoreboard extends uvm_scoreboard;
    

    uvm_blocking_get_port#(eth_frame)      expect_get_port;  ///< rm to scb
    uvm_blocking_get_port#(eth_frame)      monitor_get_port;       ///< rm to scb
    

    uvm_comparer                           comparer;
    topology_config       topology_config0;
    typedef enum {EXP_POP,COMPARE,EXP_QUEUE_CHECK,COM_FINISH}    comp_state_enum           ;
    
    comp_state_enum                        comp_state;
    eth_frame                              eth_exp_que[$];
    eth_frame                              eth_exp_que_merge[$];
	eth_frame                              eth_exp_que_shim0[$];
    eth_frame                              eth_exp_que_shim1[$];
    
    eth_frame                              eth_col_que[$];
    eth_frame                              eth_col_que_shim0[$];
    eth_frame                              eth_col_que_shim1[$];
    
     event                            comp_event;
     event                            fatal_event;
	 event                            comp_start;
	 event                            comp_success;
    `uvm_component_utils_begin(scoreboard)
    `uvm_component_utils_end
     
    string file_name;
	string tran_exp;
	string tran_col;
	string data_comp_result;
	
    int write_exp_data_fd        ;
    int write_col_data_fd        ;
    int write_comp_data_fd;
	
	bit[1:0] compare_start_flag = 0;
	int payload_seq_id;
	int scoreboard_id;
//================================================//
//FUNCTION    : new
//================================================//
    function new (string name ="scoreboard",uvm_component parent);
        super.new(name,parent);
        comparer = uvm_default_comparer;
		file_name = get_name();
		tran_exp = {"tran_exp_",file_name,".txt"};
		tran_col = {"tran_col_",file_name,".txt"};
		data_comp_result = {"data_comp_result_",file_name,".txt"};
        //comparer.policy = UVM_SHALLOW;//UVM_DEEP;UVM_DEFAULT_POLICY;
        write_exp_data_fd=$fopen(tran_exp,"w+");                                               
        $fclose(write_exp_data_fd);
        
        write_col_data_fd=$fopen(tran_col,"w+");                                               
        $fclose(write_col_data_fd);
        
        write_comp_data_fd=$fopen(data_comp_result,"w+");                                               
        $fclose(write_comp_data_fd);
    endfunction : new
//================================================//
//FUNCTION    : build
//================================================//
    virtual function void build ();
        string inst_name;
        super.build();
        // expect transaction save 
        
        //eth_exp_que  = new();
        //eth_col_que  = new();
        // port 
        expect_get_port = new("expect_get_port",this);
        monitor_get_port = new("monitor_get_port",this);
        if( !uvm_config_db #( topology_config )::get( this , "" , "topology_config" ,topology_config0 ) ) begin
           `uvm_fatal(get_type_name(),"============= NO topology_config==========");
		end
    endfunction : build
//================================================//
//TASK    : run
//================================================//
    virtual task run();
        super.run();
        fork
            get_exp_trans();
            get_col_trans();
			if(topology_config0.compare_enable[scoreboard_id]) begin
            eth_frame_compare();end
        join
    endtask: run

////================================================//
////TASK    : get_exp_trans
////================================================//
  virtual  task get_exp_trans();
        while(1) begin
            eth_frame eth_frame_exp_tr;
            eth_frame_exp_tr =new();
            expect_get_port.get(eth_frame_exp_tr);
            
			eth_exp_que.push_back(eth_frame_exp_tr);
            
            `uvm_info(get_type_name(),{$psprintf("get eth_frame_exp_trans:\n"),eth_frame_exp_tr.sprint()},UVM_HIGH);
            
            write_exp_data_fd=$fopen(tran_exp,"a+"); 
			$fwrite(write_exp_data_fd,$psprintf(" S preemptable=%0d\n",eth_frame_exp_tr.preemptable));	
            foreach(eth_frame_exp_tr.frame_data[key])
              //$fwrite(write_exp_data_fd,$psprintf("eth_frame_exp_trans.data[%0d]=%0h\n",key,eth_frame_exp_tr.frame_data[key])); 
              $fwrite(write_exp_data_fd,$psprintf("%2h\n",eth_frame_exp_tr.frame_data[key]));			  
            $fclose(write_exp_data_fd);
        end
    endtask:get_exp_trans

//================================================//
//TASK    : get_col_trans
//================================================//
  virtual  task get_col_trans();
        while(1) begin
            eth_frame eth_frame_col_tr;
            eth_frame_col_tr =new();
            monitor_get_port.get(eth_frame_col_tr);
            eth_col_que.push_back(eth_frame_col_tr);
            `uvm_info(get_type_name(),{$psprintf("get eth_frame_col_trans:\n"),eth_frame_col_tr.sprint()},UVM_HIGH);
            
            write_col_data_fd=$fopen(tran_col,"a+"); 
			$fwrite(write_exp_data_fd,$psprintf(" S preemptable=%0d\n",eth_frame_col_tr.preemptable));	
            foreach(eth_frame_col_tr.frame_data[key])
              //$fwrite(write_col_data_fd,$psprintf("eth_frame_col_trans.data[%0d]=%0h\n",key,eth_frame_col_tr.frame_data[key]));     
                $fwrite(write_col_data_fd,$psprintf("[%0d]%2h\n",key,eth_frame_col_tr.frame_data[key]));   			  
            $fclose(write_col_data_fd);
            ->comp_event;
        end
    endtask:get_col_trans
    
//================================================//
//TASK    : eth_frame_compare
//================================================//
    virtual task eth_frame_compare();
        int exp_queue_size;
		bit match;
		bit mismatch;
        while(1)
          begin
          	eth_frame eth_frame_exp_tr;         
            eth_frame eth_frame_col_tr;
            eth_frame_exp_tr =new();
            eth_frame_col_tr =new();
            comp_state=EXP_POP;

          	@comp_event;   	
          	//============pop col frame=============//
			eth_frame_col_tr=eth_col_que.pop_front();
			`uvm_info(get_type_name(),{$psprintf("COMPARE START eth_frame_col_tr.destination_address=%0h\n",eth_frame_col_tr.destination_address)},UVM_LOW);
			`uvm_info(get_type_name(),{$psprintf("exp_queue_size=%0d,col_queue_size=%0d\n",eth_exp_que.size,eth_col_que.size,)},UVM_HIGH);
			         	
          	
          	while(1)begin
          	

          	exp_queue_size=eth_exp_que.size;
            
          	case(comp_state)
          	      EXP_POP:begin
          	      	        //if(eth_exp_que.size==0)
          	      	        if(exp_queue_size==0)          	      	        
          	                   begin
          	                    	write_comp_data_fd=$fopen(data_comp_result,"a+");                                               
                     		      	$fwrite(write_comp_data_fd,$psprintf("FATAL ERROR, exp_queue_size=0,unexpected col frame eth_frame_col_tr.destination_address=%0h time=%0t\n",eth_frame_col_tr.destination_address,$time));   
                     		      	$fclose(write_comp_data_fd);
                     		      	comp_state = COM_FINISH;
									->fatal_event;
          	                   end
          	                else
          	                   begin      	                  
          	                   	eth_frame_exp_tr=eth_exp_que.pop_front();
          	                   	//---------------------------------------------//
/* 								payload_compare(eth_frame_exp_tr,eth_frame_col_tr,match);
								if(~match)
								  begin
								    write_comp_data_fd=$fopen(data_comp_result,"a+");                                               
                     		      	$fwrite(write_comp_data_fd,$psprintf("WARNING, PACKET LOSS, Sequence ID=%0h",eth_frame_exp_tr.frame_data[0]));   
                     		      	$fclose(write_comp_data_fd);
									comp_state = EXP_POP;
									`uvm_info(get_type_name(),{$psprintf("WARNING, PACKET LOSS, Sequence ID=%0h",eth_frame_exp_tr.frame_data[0])},UVM_LOW);
								  end
								else */
								  comp_state = COMPARE;
								  
/* 								if(eth_frame_exp_tr.frame_data[0] != eth_frame_col_tr.frame_data[0])  // indicate collect side packet loss
								   begin
								    write_comp_data_fd=$fopen(data_comp_result,"a+");                                               
                     		      	$fwrite(write_comp_data_fd,$psprintf("WARNING, PACKET LOSS, Sequence ID=%0h",eth_frame_exp_tr.frame_data[0]));   
                     		      	$fclose(write_comp_data_fd);
									comp_state = EXP_POP;
									`uvm_info(get_type_name(),{$psprintf("WARNING, PACKET LOSS, Sequence ID=%0h",eth_frame_exp_tr.frame_data[0])},UVM_LOW);
								   end
								else
          	     	              comp_state = COMPARE; */
          	                   end        	     	            
          	              end
          	      COMPARE:begin
          	      	        if(eth_frame_exp_tr.destination_address == eth_frame_col_tr.destination_address)
                     		      begin
                     		      	write_comp_data_fd=$fopen(data_comp_result,"a+");                                               
                     		      	$fwrite(write_comp_data_fd,$psprintf("COMP_START:comp_destination_address=%0h vlan=%0h time = %0t\n",eth_frame_exp_tr.destination_address,{eth_frame_exp_tr.tagged_data[0].data[0],eth_frame_exp_tr.tagged_data[0].data[1]},$time));                         
                     		      	$fclose(write_comp_data_fd);
									payload_compare(eth_frame_exp_tr,eth_frame_col_tr,match,payload_seq_id);
									if(~match)
									  begin
									    begin
								          write_comp_data_fd=$fopen(data_comp_result,"a+");                                               
                     		      	      $fwrite(write_comp_data_fd,$psprintf("WARNING, PACKET LOSS, Payload Sequence ID=%0h time=%0t\n",payload_seq_id,$time));   
                     		              $fclose(write_comp_data_fd);
									      comp_state = EXP_QUEUE_CHECK;
									      `uvm_info(get_type_name(),{$psprintf("WARNING, PACKET LOSS, Payload Sequence ID=%0h time=%0t\n",payload_seq_id,$time)},UVM_HIGH);
										  
										  if(compare_start_flag[(eth_frame_col_tr.tag_cnt-1)])
										    begin
											write_comp_data_fd=$fopen(data_comp_result,"a+"); 
										    $fwrite(write_comp_data_fd,$psprintf("FATAL, PACKET LOSS, Payload Sequence ID=%0h time=%0t\n",payload_seq_id,$time));   
                     		      	        $fclose(write_comp_data_fd);
											`uvm_info(get_type_name(),{$psprintf("FATAL, PACKET LOSS, Payload Sequence ID=%0h time=%0t\n",payload_seq_id,$time)},UVM_LOW);
											->fatal_event;
									       //`uvm_fatal(get_type_name(),$psprintf("FATAL, PACKET LOSS, Sequence ID=%0h\n",payload_seq_id));
										    end
								       end
									  end
									else
									  begin
									    compare_start_flag[(eth_frame_col_tr.tag_cnt-1)] = 1;
										write_comp_data_fd=$fopen(data_comp_result,"a+"); 
										if(eth_frame_exp_tr.frame_data.size!=eth_frame_col_tr.frame_data.size)
										  begin
										    $fwrite(write_comp_data_fd,$psprintf("FATAL ERROR! packet length mismatch ,payload_seq_id =%0d time=%0t\n",payload_seq_id,$time));
                                            `uvm_info(get_type_name(),$psprintf("FATAL ERROR! packet length mismatch ,payload_seq_id =%0d time=%0t\n",payload_seq_id,$time),UVM_LOW);											
											->fatal_event;
										  end
										  
									    foreach(eth_frame_exp_tr.frame_data[key])
                     		      	      begin
                     		      	      	if(eth_frame_exp_tr.frame_data[key]!=eth_frame_col_tr.frame_data[key])
                     		      	      	   begin $fwrite(write_comp_data_fd,$psprintf("FATAL ERROR!eth_frame_exp_tr.frame_data[%0d]=%0h  != eth_frame_col_tr.frame_data[%0d]=%0h time=%0t\n",
                     		      	      	                                          key,eth_frame_exp_tr.frame_data[key],key,eth_frame_col_tr.frame_data[key],$time)); 
											mismatch = 1;
											`uvm_info(get_type_name(),$psprintf("FATAL ERROR!eth_frame_exp_tr.frame_data[%0d]=%0h  != eth_frame_col_tr.frame_data[%0d]=%0h time=%0t\n",
                     		      	      	                                          key,eth_frame_exp_tr.frame_data[key],key,eth_frame_col_tr.frame_data[key],$time),UVM_LOW);
											->fatal_event;			
                                              end											
                     		      	      end
                     		      	    if(eth_frame_exp_tr.fcs!=eth_frame_col_tr.fcs)
                     		      	        begin
 											 $fwrite(write_comp_data_fd,$psprintf("FCS_ERROR!,eth_frame_exp_tr.fcs=%0h != eth_frame_col_tr.fcs=%0h time=%0t\n",
                     		      	                                                   eth_frame_exp_tr.fcs,eth_frame_col_tr.fcs,$time));  
                                            //->fatal_event;	 																					   
                                            end																					   
                     		      	    $fclose(write_comp_data_fd);             		  	
                     		      	    comp_state = COM_FINISH;
                     		      	    `uvm_info(get_type_name(),{$psprintf("mismatch=%0d,comp_state=COMPARE\n",mismatch)},UVM_LOW);  
                                         if(~mismatch)										
										   -> comp_success;
										mismatch=0;
									  end
                     		      end
                     		    else
                     		      begin
                     		      	write_comp_data_fd=$fopen(data_comp_result,"a+");                                               
                     		      	$fwrite(write_comp_data_fd,$psprintf("ERROR! PACKET LOSS, exp frame eth_frame_exp_tr.destination_address=%0h is MISSING time=%0t\n",eth_frame_exp_tr.destination_address,$time));   
                     		      	$fclose(write_comp_data_fd);
                     		      	comp_state = EXP_QUEUE_CHECK;
                     		      end
          	              end   
          EXP_QUEUE_CHECK:begin
          	                //if(eth_exp_que.size==0)
          	                 if(exp_queue_size==0)  
          	                   begin
          	                   	write_comp_data_fd=$fopen(data_comp_result,"a+");                                               
                     		      	$fwrite(write_comp_data_fd,$psprintf("FATAL ERROR, unexpected col frame eth_frame_col_tr.destination_address=%0h time=%0t\n",eth_frame_col_tr.destination_address,$time));   
                     		      	$fclose(write_comp_data_fd);
									//`uvm_fatal(get_type_name(),$psprintf("FATAL ERROR, unexpected col frame eth_frame_col_tr.destination_address=%0h\n",eth_frame_col_tr.destination_address));
                     		      	comp_state = COM_FINISH;
									`uvm_info(get_type_name(),$psprintf("FATAL ERROR, unexpected col frame eth_frame_col_tr.destination_address=%0h time=%0t\n",eth_frame_col_tr.destination_address,$time),UVM_LOW); 
									->fatal_event;
          	                   end
          	                else
          	                   begin          	                  
          	                   	comp_state = EXP_POP;
          	                   end
                          end
                   COM_FINISH:begin
                   	         break;
                          end
                     endcase   
                end
          `uvm_info(get_type_name(),{$psprintf("comp_state=%0s\n",comp_state)},UVM_LOW);                         	
          end
    endtask: eth_frame_compare

function payload_compare(eth_frame eth_frame_exp_tr,         
                         eth_frame eth_frame_col_tr,
						 output bit match,
						 output int payload_seq_id);

match = 0;						 
//if(eth_frame_exp_tr.tagged_data[1].data[0] != eth_frame_col_tr.tagged_data[1].data[0])  // indicate collect side packet loss	
if(eth_frame_exp_tr.tagged_data[eth_frame_exp_tr.tag_cnt].data[0] != eth_frame_col_tr.tagged_data[eth_frame_col_tr.tag_cnt].data[0])
	match = 0;	
else
   begin
     match = 1;		
	 ->comp_success;
   end

//payload_seq_id	 = eth_frame_exp_tr.tagged_data[1].data[0];
payload_seq_id	 = eth_frame_exp_tr.tagged_data[eth_frame_exp_tr.tag_cnt].data[0];
endfunction

endclass : scoreboard
