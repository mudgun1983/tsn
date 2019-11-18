class sub_ptp_reg_seq extends seq_reg_user_macro ;
  `define   SUB sub_
  `define 	SUB_PTP_CONFIG_CONTENT `SUB```PTP_CONFIG_CONTENT
  `define 	SUB_PTP_CONFIG `SUB```PTP_CONFIG 
  `uvm_sequence_utils(sub_ptp_reg_seq, cpu_sequencer)
  register_config sub_reg_config;
  parameter SUB_CPU_ADDR = 32'h8000_0000;
  
  rand ptp_item::packet_kind c_packet_type;
  ptp_item upper_req;
  
  int write_exp_data_fd        ;
  string tran_exp;
  bit read_data_tmp;
  function new(string name="sub_ptp_reg_seq");
    super.new(name);
	tran_exp = {get_name(),".txt"};
	write_exp_data_fd=$fopen(tran_exp,"w+");                                               
    $fclose(write_exp_data_fd);
  endfunction : new

  
  
  virtual task body();
      super.body();
	  
	  if( !uvm_config_db #( register_config )::get( null , scope_name ,
      "sub_register_config" , sub_reg_config ) ) begin
        `uvm_fatal(get_type_name(),"=============NO sub_register_config==========");
      end
	  
      `uvm_info(get_type_name(),$psprintf("\n-----------------sub_ptp_reg_seq set begin---------------",),UVM_LOW);
	
	//file IO
	write_exp_data_fd=$fopen(tran_exp,"a+");   
    $fwrite(write_exp_data_fd,$psprintf("ID0 ptp config class:\n%0s\n",`SUB_PTP_CONFIG_CONTENT[0].sprint()));	
	//$fwrite(write_exp_data_fd,$psprintf("ID0 ptp config class:\n%0s\n",`SUB_PTP_CONFIG_CONTENT[0].sprint()));	
	$fclose(write_exp_data_fd);
	
	write_exp_data_fd=$fopen(tran_exp,"a+");   
    //$fwrite(write_exp_data_fd,$psprintf("ID0 packed_desc_pad size=%0d\n",`SUB_PTP_CONFIG_CONTENT[0].packed_desc_pad.size));	
	$fwrite(write_exp_data_fd,$psprintf("ID0 packed_desc_pad size=%0d\n",`SUB_PTP_CONFIG_CONTENT[0].packed_desc_pad.size));	
	foreach(`SUB_PTP_CONFIG_CONTENT[0].packed_desc_pad[key])
              //$fwrite(write_exp_data_fd,$psprintf("ID0 packed_desc_pad[%0d]=%2h\n",key,`SUB_PTP_CONFIG_CONTENT[0].packed_desc_pad[key]));
			  $fwrite(write_exp_data_fd,$psprintf("ID0 packed_desc_pad[%0d]=%2h\n",key,`SUB_PTP_CONFIG_CONTENT[0].packed_desc_pad[key]));
	$fclose(write_exp_data_fd);
	
	write_exp_data_fd=$fopen(tran_exp,"a+");                                               
	//foreach(`SUB_PTP_CONFIG_CONTENT[0].packed_data_pad[key])
              //$fwrite(write_exp_data_fd,$psprintf("ID0 packet[%0d]=%2h\n",key,`SUB_PTP_CONFIG_CONTENT[0].packed_data_pad[key]));
	foreach(`SUB_PTP_CONFIG_CONTENT[0].packed_data_pad[key])
              //$fwrite(write_exp_data_fd,$psprintf("ID0 packet[%0d]=%2h\n",key,`SUB_PTP_CONFIG_CONTENT[0].packed_data_pad[key]));
			  $fwrite(write_exp_data_fd,$psprintf("ID0 packet[%0d]=%2h\n",key,`SUB_PTP_CONFIG_CONTENT[0].packed_data_pad[key]));
	$fclose(write_exp_data_fd);		
    
	write_exp_data_fd=$fopen(tran_exp,"a+");                                               
	foreach(`SUB_PTP_CONFIG_CONTENT[0].descriptor_trans.frame_data[key])
              //$fwrite(write_exp_data_fd,$psprintf("ID0 descriptor_trans[%0d]=%2h\n",key,`SUB_PTP_CONFIG_CONTENT[0].descriptor_trans.frame_data[key]));
			  $fwrite(write_exp_data_fd,$psprintf("ID0 descriptor_trans[%0d]=%2h\n",key,`SUB_PTP_CONFIG_CONTENT[0].descriptor_trans.frame_data[key]));
	$fclose(write_exp_data_fd);	
	
    write_exp_data_fd=$fopen(tran_exp,"a+");                                               
	foreach(`SUB_PTP_CONFIG_CONTENT[0].sys_trans.frame_data[key])
             // $fwrite(write_exp_data_fd,$psprintf("ID0 sys_packet[%0d]=%2h\n",key,`SUB_PTP_CONFIG_CONTENT[0].sys_trans.frame_data[key]));
			  $fwrite(write_exp_data_fd,$psprintf("ID0 sys_packet[%0d]=%2h\n",key,`SUB_PTP_CONFIG_CONTENT[0].sys_trans.frame_data[key]));
	$fclose(write_exp_data_fd);	
    
	write_exp_data_fd=$fopen(tran_exp,"a+");                                               
	foreach(`SUB_PTP_CONFIG_CONTENT[0].ptp_trans.frame_data[key])
              //$fwrite(write_exp_data_fd,$psprintf("ID0 ptp_trans[%0d]=%2h\n",key,`SUB_PTP_CONFIG_CONTENT[0].ptp_trans.frame_data[key]));
			  $fwrite(write_exp_data_fd,$psprintf("ID0 ptp_trans[%0d]=%2h\n",key,`SUB_PTP_CONFIG_CONTENT[0].ptp_trans.frame_data[key]));
	$fclose(write_exp_data_fd);	
	
    write_exp_data_fd=$fopen(tran_exp,"a+");                                               
	foreach(`SUB_PTP_CONFIG_CONTENT[0].eth_trans.frame_data[key])
              //$fwrite(write_exp_data_fd,$psprintf("ID0 eth_trans[%0d]=%2h\n",key,`SUB_PTP_CONFIG_CONTENT[0].eth_trans.frame_data[key]));
			  $fwrite(write_exp_data_fd,$psprintf("ID0 eth_trans[%0d]=%2h\n",key,`SUB_PTP_CONFIG_CONTENT[0].eth_trans.frame_data[key]));
	$fclose(write_exp_data_fd);	
    
	//global static configure
	// `user_rgm_write_with(`EN_REG,{'h7});
	// `user_rgm_read_with(`EN_REG);
	`user_rgm_write_with((SUB_CPU_ADDR+`BASE_OFFSET_GE_29+`SYS_HEADER),('h0)); 
    `user_rgm_read_with((SUB_CPU_ADDR+`BASE_OFFSET_GE_29+`SYS_HEADER));	
	//ptp static config
	`user_rgm_write_with((SUB_CPU_ADDR+`PDLY_REQ_PRO_CONFIG1_REG),{`SUB_PTP_CONFIG.two_step});
	`user_rgm_write_with((SUB_CPU_ADDR+`PDLY_REQ_PRO_CONFIG2_REG),{`SUB_PTP_CONFIG.src_mac[15:0]});
	`user_rgm_write_with((SUB_CPU_ADDR+`PDLY_REQ_PRO_CONFIG3_REG),{`SUB_PTP_CONFIG.src_mac[31:16]});
	`user_rgm_write_with((SUB_CPU_ADDR+`PDLY_REQ_PRO_CONFIG4_REG),{`SUB_PTP_CONFIG.src_mac[47:32]});
	`user_rgm_write_with((SUB_CPU_ADDR+`PDLY_REQ_PRO_CONFIG_UPDT_REG),{'h1});
	read_data_tmp = 0;
	while(!read_data_tmp)
	  begin
	    `user_rgm_read_with((SUB_CPU_ADDR+`RAM_INIT_DONE));
		read_data_tmp = `user_read_data[0];
	  end
	
	//packet ram  
     for(int i=0;i<`SUB_PTP_CONFIG.table_size;i++)
	 //for(int i=0;i<1;i++)
	   begin    
        for(bit[15:0] j=0;j<`SUB_PTP_CONFIG_CONTENT[i].packed_data_pad.size;j++)	  
          begin		
           `user_rgm_write_with((SUB_CPU_ADDR+`PKT_RAM_ADDR_REG    ),{('h800+j+(i*96)) });   //every step means 2Bytes, 96steps means 128bytes for each packet      
           `user_rgm_write_with((SUB_CPU_ADDR+`PKT_RAM_WR_DATA_REG ),{`SUB_PTP_CONFIG_CONTENT[i].packed_data_pad[j]}) ;
	       `user_rgm_write_with((SUB_CPU_ADDR+`PKT_RAM_WR_REG      ),{1'b1});
		   
		   `user_rgm_write_with((SUB_CPU_ADDR+`PKT_RAM_ADDR_REG)   ,{('h800+j+(i*96)) });   //every step means 2Bytes, 96steps means 128bytes for each packet      
           `user_rgm_write_with((SUB_CPU_ADDR+`PKT_RAM_RD_REG  )   ,{1'b1});
		   `user_rgm_read_with((SUB_CPU_ADDR+`PKT_RAM_RD_DATA_REG) ) ;
	       
		   if(`SUB_PTP_CONFIG_CONTENT[i].packed_data_pad[j]!= `user_read_data)
             `uvm_fatal(get_type_name(),$psprintf("\nEXPCT_DATA=%0h,READ_DATA=%0h",`SUB_PTP_CONFIG_CONTENT[i].packed_data_pad[j],`user_read_data));	
		  end
        end
	
    //descriptor
	 for(int i=0;i<`SUB_PTP_CONFIG.table_size;i++)
    //for(int i=0;i<1;i++)
	   begin    
        for(bit[15:0] j=1;j<`SUB_PTP_CONFIG_CONTENT[i].packed_desc_pad.size;j++)	  
          begin		
           `user_rgm_write_with((SUB_CPU_ADDR+`PKT_RAM_ADDR_REG   ) ,{('h000+j+(i*8)) });   //every step means 2Bytes, 8steps means 16bytes for each packet      
           `user_rgm_write_with((SUB_CPU_ADDR+`PKT_RAM_WR_DATA_REG) ,{`SUB_PTP_CONFIG_CONTENT[i].packed_desc_pad[j]}) ;
	       `user_rgm_write_with((SUB_CPU_ADDR+`PKT_RAM_WR_REG     ) ,{1'b1});
		   
		   `user_rgm_write_with((SUB_CPU_ADDR+`PKT_RAM_ADDR_REG )   ,{('h000+j+(i*8)) });   //every step means 2Bytes, 8steps means 16bytes for each packet      
           `user_rgm_write_with((SUB_CPU_ADDR+`PKT_RAM_RD_REG   )   ,{1'b1});
		   `user_rgm_read_with((SUB_CPU_ADDR+`PKT_RAM_RD_DATA_REG) ) ;
	       
		   if(`SUB_PTP_CONFIG_CONTENT[i].packed_desc_pad[j]!= `user_read_data)
             `uvm_fatal(get_type_name(),$psprintf("\nEXPCT_DATA=%0h,READ_DATA=%0h",`SUB_PTP_CONFIG_CONTENT[i].packed_desc_pad[j],`user_read_data));	
		  end
		  
		  `user_rgm_write_with((SUB_CPU_ADDR+`PKT_RAM_ADDR_REG   ) ,{('h000+0+(i*8)) });   // set the inst valid at the last
          `user_rgm_write_with((SUB_CPU_ADDR+`PKT_RAM_WR_DATA_REG) ,{`SUB_PTP_CONFIG_CONTENT[i].packed_desc_pad[0]}) ;
	      `user_rgm_write_with((SUB_CPU_ADDR+`PKT_RAM_WR_REG     ) ,{1'b1});
        end   	
	`uvm_info(get_type_name(),$psprintf("\n-----------------sub_ptp_reg_seq set end---------------",),UVM_LOW);	
	
	//static configure
	 `user_rgm_write_with((SUB_CPU_ADDR+`EN_REG),{'h7});
	 `user_rgm_read_with((SUB_CPU_ADDR+`EN_REG));
  endtask
endclass