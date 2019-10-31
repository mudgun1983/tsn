class ptp_reg_seq extends seq_reg_user_macro ;
	  
  `uvm_sequence_utils(ptp_reg_seq, cpu_sequencer)
 
  rand ptp_item::packet_kind c_packet_type;
  ptp_item upper_req;
  
  function new(string name="ptp_reg_seq");
    super.new(name);
  endfunction : new


  
  virtual task body();
      super.body();
	  
      `uvm_info(get_type_name(),$psprintf("\n-----------------ptp_reg_seq set begin---------------",),UVM_LOW);
      
	  for(int i=0;i<reg_config.ptp_config.table_size;i++)
	   begin    
        for(bit[15:0] j=0;j<`PTP_CONFIG_CONTENT[i].packed_data.size;j++)	  
          begin		
           `user_rgm_write_with(`PKT_RAM_ADDR_REG    ,{('h800+j+(i*96)) });   //every step means 2Bytes, 96steps means 128bytes for each packet      
           `user_rgm_write_with(`PKT_RAM_WR_DATA_REG ,{`PTP_CONFIG_CONTENT[i].packed_data[j]}) ;
	       `user_rgm_write_with(`PKT_RAM_WR_REG      ,{1'b1});
		  end
        end
		
  endtask
endclass