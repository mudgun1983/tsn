


class scoreboard extends uvm_scoreboard;
    

    uvm_blocking_get_port#(eth_frame)      expect_get_port;  ///< rm to scb
    uvm_blocking_get_port#(eth_frame)      monitor_get_port;       ///< rm to scb
    

    uvm_comparer                           comparer;
	parameter    SHIM_0_VLAN = 16'd500;
    parameter    SHIM_1_VLAN = 16'd501;
    
    typedef enum {EXP_POP,COMPARE,EXP_QUEUE_CHECK,COM_FINISH}    comp_state_enum           ;
    
    comp_state_enum                        comp_state;
    eth_frame                              eth_exp_que[$];
    eth_frame                              eth_exp_que_merge[$];
	eth_frame                              eth_exp_que_shim0[$];
    eth_frame                              eth_exp_que_shim1[$];
    
    eth_frame                              eth_col_que[$];
    eth_frame                              eth_col_que_shim0[$];
    eth_frame                              eth_col_que_shim1[$];
    
    local event                            comp_event;
    local event                            comp_event_shim0;
    local event                            comp_event_shim1;
    local event                            pcs_comp_event;

    `uvm_component_utils_begin(scoreboard)
    `uvm_component_utils_end
     
    string file_name;
    int write_exp_data_fd        ;
    int write_col_data_fd        ;
    int write_comp_data_fd;
//================================================//
//FUNCTION    : new
//================================================//
    function new (string name ="scoreboard",uvm_component parent);
        super.new(name,parent);
        comparer = uvm_default_comparer;
        //comparer.policy = UVM_SHALLOW;//UVM_DEEP;UVM_DEFAULT_POLICY;
        write_exp_data_fd=$fopen("tran_exp.txt","w+");                                               
        $fclose(write_exp_data_fd);
        
        write_col_data_fd=$fopen("tran_col.txt","w+");                                               
        $fclose(write_col_data_fd);
        
        write_comp_data_fd=$fopen("data_comp_result.txt","w+");                                               
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
       
    endfunction : build
//================================================//
//TASK    : run
//================================================//
    virtual task run();
        super.run();
        fork
            get_exp_trans();
            get_col_trans();
            eth_frame_compare();
        join
    endtask: run

////================================================//
////TASK    : get_exp_trans
////================================================//
    task get_exp_trans();
        while(1) begin
            eth_frame eth_frame_exp_tr;
            eth_frame_exp_tr =new();
            expect_get_port.get(eth_frame_exp_tr);
            
			eth_exp_que.push_back(eth_frame_exp_tr);
            
            `uvm_info(get_type_name(),{$psprintf("get eth_frame_exp_trans:\n"),eth_frame_exp_tr.sprint()},UVM_HIGH);
            
            write_exp_data_fd=$fopen("tran_exp.txt","a+"); 
			$fwrite(write_exp_data_fd,$psprintf(" S \n"));	
            foreach(eth_frame_exp_tr.frame_data[key])
              //$fwrite(write_exp_data_fd,$psprintf("eth_frame_exp_trans.data[%0d]=%0h\n",key,eth_frame_exp_tr.frame_data[key])); 
              $fwrite(write_exp_data_fd,$psprintf("%2h\n",eth_frame_exp_tr.frame_data[key]));			  
            $fclose(write_exp_data_fd);
        end
    endtask:get_exp_trans

//================================================//
//TASK    : get_col_trans
//================================================//
    task get_col_trans();
        while(1) begin
            eth_frame eth_frame_col_tr;
            eth_frame_col_tr =new();
            monitor_get_port.get(eth_frame_col_tr);
            eth_col_que.push_back(eth_frame_col_tr);
            `uvm_info(get_type_name(),{$psprintf("get eth_frame_col_trans:\n"),eth_frame_col_tr.sprint()},UVM_HIGH);
            
            write_col_data_fd=$fopen("tran_col.txt","a+"); 
			$fwrite(write_exp_data_fd,$psprintf(" S \n"));
            foreach(eth_frame_col_tr.frame_data[key])
              //$fwrite(write_col_data_fd,$psprintf("eth_frame_col_trans.data[%0d]=%0h\n",key,eth_frame_col_tr.frame_data[key]));     
                $fwrite(write_col_data_fd,$psprintf("%2h\n",eth_frame_col_tr.frame_data[key]));   			  
            $fclose(write_col_data_fd);
            ->comp_event;
        end
    endtask:get_col_trans
    
//================================================//
//TASK    : eth_frame_compare
//================================================//
    task eth_frame_compare();
        int exp_queue_size;
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
          	                    	write_comp_data_fd=$fopen({"data_comp_result.txt"},"a+");                                               
                     		      	$fwrite(write_comp_data_fd,$psprintf("FATAL ERROR, unexpected col frame eth_frame_col_tr.destination_address=%0h\n",eth_frame_col_tr.destination_address));   
                     		      	$fclose(write_comp_data_fd);
                     		      	comp_state = COM_FINISH;
          	                   end
          	                else
          	                   begin      	                  
          	                   	eth_frame_exp_tr=eth_exp_que.pop_front();
          	                   	
          	     	            comp_state = COMPARE;
          	                   end        	     	            
          	              end
          	      COMPARE:begin
          	      	        if(eth_frame_exp_tr.destination_address == eth_frame_col_tr.destination_address)
                     		      begin
                     		      	write_comp_data_fd=$fopen({"data_comp_result.txt"},"a+");                                               
                     		      	$fwrite(write_comp_data_fd,$psprintf("COMP_START:comp_destination_address=%0h vlan=%0h\n",eth_frame_exp_tr.destination_address,{eth_frame_exp_tr.tagged_data[0].data[0],eth_frame_exp_tr.tagged_data[0].data[1]}));                         
                     		      	foreach(eth_frame_exp_tr.frame_data[key])
                     		      	  begin
                     		      	  	if(eth_frame_exp_tr.frame_data[key]!=eth_frame_col_tr.frame_data[key])
                     		      	  	    $fwrite(write_comp_data_fd,$psprintf("ERROR!eth_frame_exp_tr.frame_data[%0d]=%0h  != eth_frame_col_tr.frame_data[%0d]=%0h\n",
                     		      	  	                                          key,eth_frame_exp_tr.frame_data[key],key,eth_frame_col_tr.frame_data[key])); 
                     		      	  end
                     		      	if(eth_frame_exp_tr.fcs!=eth_frame_col_tr.fcs)
                     		      	         $fwrite(write_comp_data_fd,$psprintf("FCS_ERROR!,eth_frame_exp_tr.fcs=%0h != eth_frame_col_tr.fcs=%0h\n\n",
                     		      	                                               eth_frame_exp_tr.fcs,eth_frame_col_tr.fcs));                   		  	
                     		      	$fclose(write_comp_data_fd);             		  	
                     		      	comp_state = COM_FINISH;
                     		      	 `uvm_info(get_type_name(),{$psprintf("comp_state=COMPARE\n")},UVM_LOW);     
                     		      end
                     		    else
                     		      begin
                     		      	write_comp_data_fd=$fopen({"data_comp_result.txt"},"a+");                                               
                     		      	$fwrite(write_comp_data_fd,$psprintf("ERROR! PACKET LOSS, exp frame eth_frame_exp_tr.destination_address=%0h is MISSING\n",eth_frame_exp_tr.destination_address));   
                     		      	$fclose(write_comp_data_fd);
                     		      	comp_state = EXP_QUEUE_CHECK;
                     		      end
          	              end   
          EXP_QUEUE_CHECK:begin
          	                //if(eth_exp_que.size==0)
          	                 if(exp_queue_size==0)  
          	                   begin
          	                   	write_comp_data_fd=$fopen({"data_comp_result.txt"},"a+");                                               
                     		      	$fwrite(write_comp_data_fd,$psprintf("FATAL ERROR, unexpected col frame eth_frame_col_tr.destination_address=%0h\n",eth_frame_col_tr.destination_address));   
                     		      	$fclose(write_comp_data_fd);
                     		      	comp_state = COM_FINISH;
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
          `uvm_info(get_type_name(),{$psprintf("comp_state=%0s\n",comp_state)},UVM_HIGH);                         	
          end
    endtask: eth_frame_compare


endclass : scoreboard
