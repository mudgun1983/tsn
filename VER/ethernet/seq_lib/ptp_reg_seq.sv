class ptp_reg_seq extends seq_reg_user_macro ;
	  
  `uvm_sequence_utils(ptp_reg_seq, cpu_sequencer)
 
  rand ptp_item::packet_kind c_packet_type;
  ptp_item upper_req;
  
  int write_exp_data_fd        ;
  string tran_exp;
  bit read_data_tmp;
  function new(string name="ptp_reg_seq");
    super.new(name);
	tran_exp = {get_name(),".txt"};
	write_exp_data_fd=$fopen(tran_exp,"w+");                                               
    $fclose(write_exp_data_fd);
  endfunction : new


  
  virtual task body();
      super.body();
	  
      `uvm_info(get_type_name(),$psprintf("\n-----------------ptp_reg_seq set begin---------------",),UVM_LOW);
	
	//file IO
	write_exp_data_fd=$fopen(tran_exp,"a+");   
    $fwrite(write_exp_data_fd,$psprintf("ID0 ptp config class:\n%0s\n",`PTP_CONFIG_CONTENT[0].sprint()));	
	$fclose(write_exp_data_fd);
	
	write_exp_data_fd=$fopen(tran_exp,"a+");   
    $fwrite(write_exp_data_fd,$psprintf("ID0 packed_desc_pad size=%0d\n",`PTP_CONFIG_CONTENT[0].packed_desc_pad.size));	
	foreach(`PTP_CONFIG_CONTENT[0].packed_desc_pad[key])
              $fwrite(write_exp_data_fd,$psprintf("ID0 packed_desc_pad[%0d]=%2h\n",key,`PTP_CONFIG_CONTENT[0].packed_desc_pad[key]));
	$fclose(write_exp_data_fd);
	
	write_exp_data_fd=$fopen(tran_exp,"a+");                                               
	//foreach(`PTP_CONFIG_CONTENT[0].packed_data_pad[key])
              //$fwrite(write_exp_data_fd,$psprintf("ID0 packet[%0d]=%2h\n",key,`PTP_CONFIG_CONTENT[0].packed_data_pad[key]));
	foreach(`PTP_CONFIG_CONTENT[0].packed_data_pad[key])
              $fwrite(write_exp_data_fd,$psprintf("ID0 packet[%0d]=%2h\n",key,`PTP_CONFIG_CONTENT[0].packed_data_pad[key]));
	$fclose(write_exp_data_fd);		
    
	write_exp_data_fd=$fopen(tran_exp,"a+");                                               
	foreach(`PTP_CONFIG_CONTENT[0].descriptor_trans.frame_data[key])
              $fwrite(write_exp_data_fd,$psprintf("ID0 descriptor_trans[%0d]=%2h\n",key,`PTP_CONFIG_CONTENT[0].descriptor_trans.frame_data[key]));
	$fclose(write_exp_data_fd);	
	
    write_exp_data_fd=$fopen(tran_exp,"a+");                                               
	foreach(`PTP_CONFIG_CONTENT[0].sys_trans.frame_data[key])
              $fwrite(write_exp_data_fd,$psprintf("ID0 sys_packet[%0d]=%2h\n",key,`PTP_CONFIG_CONTENT[0].sys_trans.frame_data[key]));
	$fclose(write_exp_data_fd);	
    
	write_exp_data_fd=$fopen(tran_exp,"a+");                                               
	foreach(`PTP_CONFIG_CONTENT[0].ptp_trans.frame_data[key])
              $fwrite(write_exp_data_fd,$psprintf("ID0 ptp_trans[%0d]=%2h\n",key,`PTP_CONFIG_CONTENT[0].ptp_trans.frame_data[key]));
	$fclose(write_exp_data_fd);	
	
    write_exp_data_fd=$fopen(tran_exp,"a+");                                               
	foreach(`PTP_CONFIG_CONTENT[0].eth_trans.frame_data[key])
              $fwrite(write_exp_data_fd,$psprintf("ID0 eth_trans[%0d]=%2h\n",key,`PTP_CONFIG_CONTENT[0].eth_trans.frame_data[key]));
	$fclose(write_exp_data_fd);	
    
	//global static configure
	// `user_rgm_write_with(`EN_REG,{'h7});
	// `user_rgm_read_with(`EN_REG);
	`user_rgm_write_with((`BASE_OFFSET_GE_29+`SYS_HEADER),('h0)); 
    `user_rgm_read_with((`BASE_OFFSET_GE_29+`SYS_HEADER));	
	//ptp static config
	`user_rgm_write_with(`PDLY_REQ_PRO_CONFIG1_REG,{`PTP_CONFIG.two_step});
	`user_rgm_write_with(`PDLY_REQ_PRO_CONFIG2_REG,{`PTP_CONFIG.src_mac[15:0]});
	`user_rgm_write_with(`PDLY_REQ_PRO_CONFIG3_REG,{`PTP_CONFIG.src_mac[31:16]});
	`user_rgm_write_with(`PDLY_REQ_PRO_CONFIG4_REG,{`PTP_CONFIG.src_mac[47:32]});
	`user_rgm_write_with(`PDLY_REQ_PRO_CONFIG_UPDT_REG,{'h0});
	read_data_tmp = 0;
	while(!read_data_tmp)
	  begin
	    `user_rgm_read_with(`RAM_INIT_DONE);
		read_data_tmp = `user_read_data[0];
	  end
	
	//packet ram  
     for(int i=0;i<reg_config.ptp_config.table_size;i++)
	 //for(int i=0;i<1;i++)
	   begin    
        for(bit[15:0] j=0;j<`PTP_CONFIG_CONTENT[i].packed_data_pad.size;j++)	  
          begin		
           `user_rgm_write_with(`PKT_RAM_ADDR_REG    ,{('h800+j+(i*96)) });   //every step means 2Bytes, 96steps means 128bytes for each packet      
           `user_rgm_write_with(`PKT_RAM_WR_DATA_REG ,{`PTP_CONFIG_CONTENT[i].packed_data_pad[j]}) ;
	       `user_rgm_write_with(`PKT_RAM_WR_REG      ,{1'b1});
		   
		   `user_rgm_write_with(`PKT_RAM_ADDR_REG    ,{('h800+j+(i*96)) });   //every step means 2Bytes, 96steps means 128bytes for each packet      
           `user_rgm_write_with(`PKT_RAM_RD_REG      ,{1'b1});
		   `user_rgm_read_with(`PKT_RAM_RD_DATA_REG ) ;
	       
		   if(`PTP_CONFIG_CONTENT[i].packed_data_pad[j]!= `user_read_data)
             `uvm_fatal(get_type_name(),$psprintf("\nEXPCT_DATA=%0h,READ_DATA=%0h",`PTP_CONFIG_CONTENT[i].packed_data_pad[j],`user_read_data));	
		  end
        end
	
    //descriptor
	 for(int i=0;i<reg_config.ptp_config.table_size;i++)
    //for(int i=0;i<1;i++)
	   begin    
        for(bit[15:0] j=1;j<`PTP_CONFIG_CONTENT[i].packed_desc_pad.size;j++)	  
          begin		
           `user_rgm_write_with(`PKT_RAM_ADDR_REG    ,{('h000+j+(i*8)) });   //every step means 2Bytes, 8steps means 16bytes for each packet      
           `user_rgm_write_with(`PKT_RAM_WR_DATA_REG ,{`PTP_CONFIG_CONTENT[i].packed_desc_pad[j]}) ;
	       `user_rgm_write_with(`PKT_RAM_WR_REG      ,{1'b1});
		   
		   `user_rgm_write_with(`PKT_RAM_ADDR_REG    ,{('h000+j+(i*8)) });   //every step means 2Bytes, 8steps means 16bytes for each packet      
           `user_rgm_write_with(`PKT_RAM_RD_REG      ,{1'b1});
		   `user_rgm_read_with(`PKT_RAM_RD_DATA_REG ) ;
	       
		   if(`PTP_CONFIG_CONTENT[i].packed_desc_pad[j]!= `user_read_data)
             `uvm_fatal(get_type_name(),$psprintf("\nEXPCT_DATA=%0h,READ_DATA=%0h",`PTP_CONFIG_CONTENT[i].packed_desc_pad[j],`user_read_data));	
		  end
		  
		  `user_rgm_write_with(`PKT_RAM_ADDR_REG    ,{('h000+0+(i*8)) });   // set the inst valid at the last
          `user_rgm_write_with(`PKT_RAM_WR_DATA_REG ,{`PTP_CONFIG_CONTENT[i].packed_desc_pad[0]}) ;
	      `user_rgm_write_with(`PKT_RAM_WR_REG      ,{1'b1});
        end   	
	`uvm_info(get_type_name(),$psprintf("\n-----------------ptp_reg_seq set end---------------",),UVM_LOW);	
	
	//static configure
	 `user_rgm_write_with(`EN_REG,{'h7});
	 `user_rgm_read_with(`EN_REG);
  endtask
endclass