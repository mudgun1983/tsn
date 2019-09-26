//FILE_HEADER------------------------------------------------------------------------------------------
// ZTE  Copyright
// ZTE Company Confidential
//-----------------------------------------------------------------------------------------------------
// FILE NAME:       dcn_scb.sv
// DEPARTMENT:      Multi-Service Bearer Product ShenZhen Design&Development Dept.
// AUTHOR:          Song Gaoqian
// AUTHOR'S EMAIL:  song.gaoqian123@zte.com.cn
//-----------------------------------------------------------------------------------------------------
// RELEASE HISTORY: N/A
// VERSION      DATE          AUTHOR        DESCRIPTION
// 1.0          2017-4-26     Song Gaoqian     UVM
//-----------------------------------------------------------------------------------------------------
// KEYWORDS: dcn_scb
//-----------------------------------------------------------------------------------------------------
// PURPOSE: 
//--------------------------------------------------------------------------------------------------
// PARAMETERS
//         PARAM  NAME    RANGE    : DESCRIPTION    :DEFAULT   :UNITS
//-----------------------------------------------------------------------------------------------------


class dcn_scb extends uvm_scoreboard;
    

    uvm_blocking_get_port#(eth_frame)      dcn_to_shim_get_port;  ///< rm to scb
    uvm_blocking_get_port#(eth_frame)      shim_to_dcn_get_port;       ///< rm to scb
    

    uvm_comparer                           comparer;
    
    parameter    SHIM_0_VLAN = 16'd500;
    parameter    SHIM_1_VLAN = 16'd501;
    
    typedef enum {EXP_POP,COMPARE,EXP_QUEUE_CHECK,COM_FINISH}    comp_state_enum           ;
    
    comp_state_enum                        comp_state;
    eth_frame                              eth_exp_que[$];
    eth_frame                              eth_exp_que_shim0[$];
    eth_frame                              eth_exp_que_shim1[$];
    
    eth_frame                              eth_col_que[$];
    eth_frame                              eth_col_que_shim0[$];
    eth_frame                              eth_col_que_shim1[$];
    
    local event                            comp_event;
    local event                            comp_event_shim0;
    local event                            comp_event_shim1;
    local event                            pcs_comp_event;

    `uvm_component_utils_begin(dcn_scb)
    `uvm_component_utils_end
     
    string file_name;
    int write_exp_data_fd        ;
    int write_col_data_fd        ;
    int write_comp_data_fd;
//================================================//
//FUNCTION    : new
//================================================//
    function new (string name ="dcn_scb",uvm_component parent);
        super.new(name,parent);
        comparer = uvm_default_comparer;
        //comparer.policy = UVM_SHALLOW;//UVM_DEEP;UVM_DEFAULT_POLICY;
        write_exp_data_fd=$fopen("dcn_tran_exp.txt","w+");                                               
        $fclose(write_exp_data_fd);
        
        write_col_data_fd=$fopen("dcn_tran_col.txt","w+");                                               
        $fclose(write_col_data_fd);
        
        write_comp_data_fd=$fopen("data_comp_result_shim0.txt","w+");                                               
        $fclose(write_comp_data_fd);
        
        write_comp_data_fd=$fopen("data_comp_result_shim1.txt","w+");                                               
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
        dcn_to_shim_get_port = new("dcn_to_shim_get_port",this);
        shim_to_dcn_get_port = new("shim_to_dcn_get_port",this);
       
    endfunction : build
//================================================//
//TASK    : run
//================================================//
    virtual task run();
        super.run();
        fork
            dcn_to_shim_get_exp_trans();
            shim_to_dcn_get_col_trans();
            //eth_frame_compare();
            eth_frame_compare(0,"shim0");
            eth_frame_compare(1,"shim1");
            
        //    shim5x68_get_act_trans();
        //    shim5x68_compare();
        //    pcs_get_exp_trans();
        //    pcs_get_act_trans();
        //    pcs_compare();
        //    cmac_get_exp_trans();
        //    cmac_get_act_trans();
        //    cmac_compare();
        join
    endtask: run

////================================================//
////TASK    : dcn_to_shim_get_exp_trans
////================================================//
    task dcn_to_shim_get_exp_trans();
        while(1) begin
            eth_frame eth_frame_exp_tr;
            eth_frame_exp_tr =new();
            dcn_to_shim_get_port.get(eth_frame_exp_tr);
            
            if({eth_frame_exp_tr.tagged_data[0].data[0],eth_frame_exp_tr.tagged_data[0].data[1]}==SHIM_0_VLAN)
               eth_exp_que_shim0.push_back(eth_frame_exp_tr);
            else if({eth_frame_exp_tr.tagged_data[0].data[0],eth_frame_exp_tr.tagged_data[0].data[1]}==SHIM_1_VLAN)
               eth_exp_que_shim1.push_back(eth_frame_exp_tr);
            else
               `uvm_info(get_type_name(),$psprintf("FATAL_ERROR! EXP unexpect VLAN vlaue\n"),UVM_LOW);
            
            `uvm_info(get_type_name(),{$psprintf("get eth_frame_exp_trans:\n"),eth_frame_exp_tr.sprint()},UVM_HIGH);
            
            write_exp_data_fd=$fopen("dcn_tran_exp.txt","a+"); 
            foreach(eth_frame_exp_tr.frame_data[key])
              $fwrite(write_exp_data_fd,$psprintf("eth_frame_exp_trans.data[%0d]=%0h\n",key,eth_frame_exp_tr.frame_data[key]));                                              
            $fclose(write_exp_data_fd);
        end
    endtask:dcn_to_shim_get_exp_trans

//================================================//
//TASK    : shim_to_dcn_get_col_trans
//================================================//
    task shim_to_dcn_get_col_trans();
        while(1) begin
            eth_frame eth_frame_col_tr;
            eth_frame_col_tr =new();
            shim_to_dcn_get_port.get(eth_frame_col_tr);
            
            `uvm_info(get_type_name(),{$psprintf("get eth_frame_col_trans:\n"),eth_frame_col_tr.sprint()},UVM_HIGH);
            
            write_col_data_fd=$fopen("dcn_tran_col.txt","a+"); 
            foreach(eth_frame_col_tr.frame_data[key])
              $fwrite(write_col_data_fd,$psprintf("eth_frame_col_trans.data[%0d]=%0h\n",key,eth_frame_col_tr.frame_data[key]));                                              
            $fclose(write_col_data_fd);
            
            if({eth_frame_col_tr.tagged_data[0].data[0],eth_frame_col_tr.tagged_data[0].data[1]}==SHIM_0_VLAN)
               begin
               	eth_col_que_shim0.push_back(eth_frame_col_tr);
               	->comp_event_shim0;
               end
            else if({eth_frame_col_tr.tagged_data[0].data[0],eth_frame_col_tr.tagged_data[0].data[1]}==SHIM_1_VLAN)
               begin
               	eth_col_que_shim1.push_back(eth_frame_col_tr);
               	->comp_event_shim1;
               end
            else
               `uvm_info(get_type_name(),$psprintf("FATAL_ERROR! COL unexpect VLAN vlaue"),UVM_LOW);
               
           // eth_col_que.push_back(eth_frame_col_tr);

            ->comp_event;
        end
    endtask:shim_to_dcn_get_col_trans
    
//================================================//
//TASK    : eth_frame_compare
//================================================//
    task eth_frame_compare(input bit shim_ind,input string path);
        int exp_queue_size;
        while(1)
          begin
          	eth_frame eth_frame_exp_tr;         
            eth_frame eth_frame_col_tr;
            eth_frame_exp_tr =new();
            eth_frame_col_tr =new();
            comp_state=EXP_POP;
            if(shim_ind)
          	@comp_event_shim1;
          	else
          	@comp_event_shim0;   	
          	//============pop col frame=============//
          	if(shim_ind)
          	eth_frame_col_tr=eth_col_que_shim1.pop_front();
          	else
          	eth_frame_col_tr=eth_col_que_shim0.pop_front();
          	
          	`uvm_info(get_type_name(),{$psprintf("COMPARE START eth_frame_col_tr.destination_address=%0h\n",eth_frame_col_tr.destination_address)},UVM_LOW);
          	while(1)begin
          	
          	if(shim_ind)
          	exp_queue_size=eth_exp_que_shim1.size;
          	else
            exp_queue_size=eth_exp_que_shim0.size;
            
          	case(comp_state)
          	      EXP_POP:begin
          	      	        //if(eth_exp_que.size==0)
          	      	        if(exp_queue_size==0)          	      	        
          	                   begin
          	                   	write_comp_data_fd=$fopen({"data_comp_result_",path,".txt"},"a+");                                               
                     		      	$fwrite(write_comp_data_fd,$psprintf("FATAL ERROR, unexpected col frame eth_frame_col_tr.destination_address=%0h\n",eth_frame_col_tr.destination_address));   
                     		      	$fclose(write_comp_data_fd);
                     		      	comp_state = COM_FINISH;
          	                   end
          	                else
          	                   begin   
          	                   	if(shim_ind)       	                  
          	                   	eth_frame_exp_tr=eth_exp_que_shim1.pop_front();
          	                   	else
          	                   	eth_frame_exp_tr=eth_exp_que_shim0.pop_front();
          	                   	
          	     	              comp_state = COMPARE;
          	                   end        	     	            
          	              end
          	      COMPARE:begin
          	      	        if(eth_frame_exp_tr.destination_address == eth_frame_col_tr.destination_address)
                     		      begin
                     		      	write_comp_data_fd=$fopen({"data_comp_result_",path,".txt"},"a+");                                               
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
                     		      	write_comp_data_fd=$fopen({"data_comp_result_",path,".txt"},"a+");                                               
                     		      	$fwrite(write_comp_data_fd,$psprintf("ERROR! PACKET LOSS, exp frame eth_frame_exp_tr.destination_address=%0h is MISSING\n",eth_frame_exp_tr.destination_address));   
                     		      	$fclose(write_comp_data_fd);
                     		      	comp_state = EXP_QUEUE_CHECK;
                     		      end
          	              end   
          EXP_QUEUE_CHECK:begin
          	                //if(eth_exp_que.size==0)
          	                 if(exp_queue_size==0)  
          	                   begin
          	                   	write_comp_data_fd=$fopen({"data_comp_result_",path,".txt"},"a+");                                               
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
          `uvm_info(get_type_name(),{$psprintf("comp_state=%0s\n",comp_state)},UVM_LOW);                         	
          end
    endtask: eth_frame_compare
////================================================//
////TASK    : shim5x68_compare_path
////================================================//
//    task shim5x68_compare_path(input int path);
//        int success_cnt;
//        int failt_cnt;
//        bit data_err;
//        if(cfg.shim5x68_chk) begin
//            while(1) begin
//                shim5x68_frame shim5x68_exp_tr;
//                shim5x68_frame shim5x68_act_tr;
//                shim5x68_exp_tr =new();
//                shim5x68_act_tr =new();
//                @comp_event;
//                if(shim5x68_act_que[path].size !=0 && shim5x68_exp_que[path].size !=0) begin
//                    shim5x68_act_tr = shim5x68_act_que[path].pop_front();
//                    shim5x68_exp_tr = shim5x68_exp_que[path].pop_front();
//                    //if(comparer.compare_object("shim5x68_frame",shim5x68_exp_tr,shim5x68_act_tr)) begin
//                    foreach(shim5x68_act_tr.shim5x68_data[i]) begin
//                        if(shim5x68_act_tr.shim5x68_data[i] !== shim5x68_exp_tr.shim5x68_data[i]) begin
//                            `uvm_error(get_type_name(),$psprintf("E1[%0d] compare failt:exp_data[%0d]=%0h,act_data[%0d]=%0h",
//                                       path,i,shim5x68_exp_tr.shim5x68_data[i],i,shim5x68_act_tr.shim5x68_data[i]));
//                            data_err = 1'b1;
//                        end
//                    end
//                    if(data_err) begin
//                        `uvm_error(get_type_name(),{$psprintf("\n--------------E1_frame compare failt at path[%0d]-----------\n",path),
//                                   shim5x68_exp_tr.sprint(),shim5x68_act_tr.sprint()});
//                        failt_cnt++;
//                    end
//                    else begin
//                        `uvm_info(get_type_name(),$psprintf("\n--------------E1_frame compare success at path[%0d]-----------\n",path),UVM_HIGH);
//                        success_cnt++;
//                    end
//                    `uvm_info(get_type_name(),$psprintf("E1_frame path[%0d] compare result now: success_cnt=%0d, failtcnt=%0d",
//                              path,success_cnt,failt_cnt),UVM_LOW);
//                    //assert($cast(cov.shim5x68_trans,shim5x68_exp_tr));
//                    //cov.shim5x68_frame_cvg.sample();
//                end
//            end
//        end
//    endtask:shim5x68_compare_path/*}}}*/
////================================================//
////TASK    : pcs_get_exp_trans/*{{{*/
////================================================//
//    task pcs_get_exp_trans();
//        fork
//            pcs_get_exp_trans_path(0);
//            pcs_get_exp_trans_path(1);
//            pcs_get_exp_trans_path(2);
//            pcs_get_exp_trans_path(3);
//            pcs_get_exp_trans_path(4);
//            pcs_get_exp_trans_path(5);
//            pcs_get_exp_trans_path(6);
//            pcs_get_exp_trans_path(9);
//            pcs_get_exp_trans_path(10);
//            pcs_get_exp_trans_path(11);
//            pcs_get_exp_trans_path(12);
//            pcs_get_exp_trans_path(13);
//            pcs_get_exp_trans_path(14);
//            pcs_get_exp_trans_path(15);
//            pcs_get_exp_trans_path(16);
//            pcs_get_exp_trans_path(17);
//        join
//    endtask: pcs_get_exp_trans
////================================================//
////TASK    : pcs_get_exp_trans_path
////================================================//
//    task pcs_get_exp_trans_path(input int path);
//        while(1) begin
//            pcs_frame pcs_exp_tr;
//            pcs_exp_tr =new();
//            pcs_exp_port[path].get(pcs_exp_tr);
//            pcs_exp_que[path].push_back(pcs_exp_tr);
//            `uvm_info(get_type_name(),{$psprintf("path[%0d] get exp pcs_trans:\n",path),pcs_exp_tr.sprint()},UVM_LOW);
//        end
//   endtask: pcs_get_exp_trans_path
////================================================//
////TASK    : pcs_get_act_trans
////================================================//
//    task pcs_get_act_trans();
//        fork
//            pcs_get_act_trans_path(0);
//            pcs_get_act_trans_path(1);
//            pcs_get_act_trans_path(2);
//            pcs_get_act_trans_path(3);
//            pcs_get_act_trans_path(4);
//            pcs_get_act_trans_path(5);
//            pcs_get_act_trans_path(6);
//            pcs_get_act_trans_path(9);
//            pcs_get_act_trans_path(10);
//            pcs_get_act_trans_path(11);
//            pcs_get_act_trans_path(12);
//            pcs_get_act_trans_path(13);
//            pcs_get_act_trans_path(14);
//            pcs_get_act_trans_path(15);
//            pcs_get_act_trans_path(16);
//            pcs_get_act_trans_path(17);
//        join
//    endtask: pcs_get_act_trans
////================================================//
////TASK    : pcs_get_act_trans_path
////================================================//
//    task pcs_get_act_trans_path(input int path);
//        while(1) begin
//            pcs_frame pcs_act_tr;
//            pcs_act_tr =new();
//            pcs_act_port[path].get(pcs_act_tr);
//            pcs_act_que[path].push_back(pcs_act_tr);
//            `uvm_info(get_type_name(),{$psprintf("path[%0d] get act pcs_trans:\n",path),pcs_act_tr.sprint()},UVM_LOW);
//            ->pcs_comp_event;
//        end
//   endtask: pcs_get_act_trans_path
////================================================//
////TASK    : HW process: pcs_compare
////================================================//
//    task pcs_compare();
//        fork
//            pcs_compare_path(0);
//            pcs_compare_path(1);
//            pcs_compare_path(2);
//            pcs_compare_path(3);
//            pcs_compare_path(4);
//            pcs_compare_path(5);
//            pcs_compare_path(6);
//            pcs_compare_path(9);
//            pcs_compare_path(10);
//            pcs_compare_path(11);
//            pcs_compare_path(12);
//            pcs_compare_path(13);
//            pcs_compare_path(14);
//            pcs_compare_path(15);
//            pcs_compare_path(16);
//            pcs_compare_path(17);
//        join
//    endtask: pcs_compare
////================================================//
////TASK    : pcs_compare_path
////================================================//
//    task pcs_compare_path(input int path);
//        int success_cnt;
//        int failt_cnt;
//        bit[2:0] data_err;
//
//        if(cfg.pcs_chk) begin
//            while(1) begin
//                pcs_frame pcs_exp_tr;
//                pcs_frame pcs_act_tr;
//                pcs_exp_tr =new();
//                pcs_act_tr =new();
//                
//                @pcs_comp_event;
//                if(pcs_act_que[path].size !=0 && pcs_exp_que[path].size !=0) begin
//                    pcs_act_tr = pcs_act_que[path].pop_front();
//                    pcs_exp_tr = pcs_exp_que[path].pop_front();
//                    if(path < 7) begin//path0~path6: HW[0]~HW[13]
//                        foreach(pcs_act_tr.pcs1_data[i]) begin
//                            if(pcs_act_tr.pcs1_data[i] !== pcs_exp_tr.pcs1_data[i]) begin
//                                `uvm_error(get_type_name(),$psprintf("HW[%0d] compare failt:exp_data[%0d]=%0h,act_data[%0d]=%0h",
//                                2*path,i,pcs_exp_tr.pcs1_data[i],i,pcs_act_tr.pcs1_data[i]));
//                                data_err[0]=1;
//                            end
//                            if(pcs_act_tr.pcs2_data[i] !== pcs_exp_tr.pcs2_data[i]) begin
//                                `uvm_error(get_type_name(),$psprintf("HW[%0d] compare failt:exp_data[%0d]=%0h,act_data[%0d]=%0h",
//                                2*path+1,i,pcs_exp_tr.pcs2_data[i],i,pcs_act_tr.pcs2_data[i]));
//                                data_err[1]=1;
//                            end
//                        end
//                    end
//                    else if(path < 16) begin//path9~path15: HW[14]~HW[27]
//                        foreach(pcs_act_tr.pcs1_data[i]) begin
//                            if(pcs_act_tr.pcs1_data[i] !== pcs_exp_tr.pcs1_data[i]) begin
//                                `uvm_error(get_type_name(),$psprintf("HW[%0d] compare failt:exp_data[%0d]=%0h,act_data[%0d]=%0h",
//                                2*(path-2),i,pcs_exp_tr.pcs1_data[i],i,pcs_act_tr.pcs1_data[i]));
//                                data_err[0]=1;
//                            end
//                            if(pcs_act_tr.pcs2_data[i] !== pcs_exp_tr.pcs2_data[i]) begin
//                                `uvm_error(get_type_name(),$psprintf("HW[%0d] compare failt:exp_data[%0d]=%0h,act_data[%0d]=%0h",
//                                2*(path-2)+1,i,pcs_exp_tr.pcs2_data[i],i,pcs_act_tr.pcs2_data[i]));
//                                data_err[1]=1;
//                            end
//                        end
//                    end
//                    else if(path == 16) begin//path16
//                        foreach(pcs_act_tr.pcs1_data[i]) begin
//                            if(pcs_act_tr.pcs1_data[i] !== pcs_exp_tr.pcs1_data[i]) begin
//                                `uvm_error(get_type_name(),$psprintf("HW[28] compare failt:exp_data[%0d]=%0h,act_data[%0d]=%0h",
//                                i,pcs_exp_tr.pcs1_data[i],i,pcs_act_tr.pcs1_data[i]));
//                                data_err[0]=1;
//                            end
//                        end
//                    end
//                    else begin//path17
//                        foreach(pcs_act_tr.pcs1_data[i]) begin
//                            if(pcs_act_tr.pcs1_data[i] !== pcs_exp_tr.pcs1_data[i]) begin
//                                `uvm_error(get_type_name(),$psprintf("HW[29] compare failt:exp_data[%0d]=%0h,act_data[%0d]=%0h",
//                                i,pcs_exp_tr.pcs1_data[i],i,pcs_act_tr.pcs1_data[i]));
//                                data_err[0]=1;
//                            end
//                            //if(pcs_act_tr.pcs2_data[i] !== pcs_exp_tr.pcs2_data[i]) begin
//                            //    `uvm_error(get_type_name(),$psprintf("HW[30] compare failt:exp_data[%0d]=%0h,act_data[%0d]=%0h",
//                            //    i,pcs_exp_tr.pcs2_data[i],i,pcs_act_tr.pcs2_data[i]));
//                            //    data_err[1]=1;
//                            //end
//                            //if(pcs_act_tr.pcs3_data[i] !== pcs_exp_tr.pcs3_data[i]) begin
//                            //    `uvm_error(get_type_name(),$psprintf("HW[31] compare failt:exp_data[%0d]=%0h,act_data[%0d]=%0h",
//                            //    i,pcs_exp_tr.pcs3_data[i],i,pcs_act_tr.pcs3_data[i]));
//                            //    data_err[2]=1;
//                            //end
//                        end
//                    end
//                    if(data_err) begin
//                        `uvm_error(get_type_name(),{$psprintf("\n--------------HW_frame compare failt at path[%0d]-----------\n",path),
//                                   pcs_exp_tr.sprint(),pcs_act_tr.sprint()});
//                        failt_cnt++;
//                    end
//                    else begin
//                        `uvm_info(get_type_name(),$psprintf("\n--------------HW_frame compare success at path[%0d]-----------\n",path),UVM_HIGH);
//                        success_cnt++;
//                    end
//                    `uvm_info(get_type_name(),$psprintf("HW_frame path[%0d] compare result now: success_cnt=%0d, failtcnt=%0d",
//                              path,success_cnt,failt_cnt),UVM_LOW);
//                    //assert($cast(cov.pcs_trans,pcs_exp_tr));
//                    //cov.pcs_frame_cvg.sample();
//                end
//            end
//        end
//    endtask: pcs_compare_path/*}}}*/
////================================================//
////FUNCTION    : check_phase
////================================================//
//    virtual function void check();
//        super.check();
//        if(cfg.shim5x68_chk) begin
//            foreach(shim5x68_exp_que[i]) begin
//                if(shim5x68_exp_que[i].size!=0) begin
//                    `uvm_error(get_type_name(),$psprintf("E1_exp_que[%0d] still have trans(num=%0d) not be compared \n",i,shim5x68_exp_que[i].size()));
//                end
//                if(shim5x68_act_que[i].size!=0) begin
//                    `uvm_error(get_type_name(),$psprintf("E1_act_que[%0d] still have trans(num=%0d) not be compared \n",i,shim5x68_act_que[i].size()));
//                end
//            end
//        end
//        if(cfg.pcs_chk) begin
//            foreach(pcs_exp_que[i]) begin
//                if(pcs_exp_que[i].size!=0) begin
//                    `uvm_error(get_type_name(),$psprintf("Hw_exp_que[%0d] still have trans(num=%0d) not be compared \n",i,pcs_exp_que[i].size()));
//                end
//                if(pcs_act_que[i].size!=0) begin
//                    `uvm_error(get_type_name(),$psprintf("Hw_act_que[%0d] still have trans(num=%0d) not be compared \n",i,pcs_act_que[i].size()));
//                end
//            end
//        end
//    endfunction: check

endclass : dcn_scb
