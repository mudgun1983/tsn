`ifndef QBV_CNT_SEQ__SV
`define QBV_CNT_SEQ__SV
class qbv_cnt_seq extends seq_reg_user_macro ;

 `uvm_sequence_utils(qbv_cnt_seq, cpu_sequencer)
 obm_dut_cfg              m_obm_dut_cfg; 

 bit [31:0]                      m_obm_reg_rx_pkt[8];
 bit [31:0]                      m_obm_reg_tx_emac_pkt[8];
 bit [31:0]                      m_obm_reg_tx_emac_byte[8];
 bit [31:0]                      m_obm_reg_tx_pmac_pkt[8];
 bit [31:0]                      m_obm_reg_tx_pmac_byte[8];
 bit [31:0]                      m_obm_reg_rx_desc_drop_pkt[8];
 bit [31:0]                      m_obm_reg_rx_data_drop_pkt[8];

  function new(string name="qbv_cnt_seq");
    super.new(name);
	//m_obm_dut_cfg = new("m_obm_dut_cfg");
	m_obm_dut_cfg = obm_dut_cfg::type_id::create("m_obm_dut_cfg");
  endfunction : new

virtual task body();
	bit [31:0]  rd_data;
	int         timeout_cnt;
      super.body();
	  `uvm_info(get_type_name(),$psprintf("start to test qbv_wr_reg qbv_rd_reg"),UVM_NONE);
	  for(int j=0;j<2;j++)begin
	  	  for(int i=0;i<8;i++)begin 
    	  	  //here is cfg list
    		  timeout_cnt = 0;
        	  `user_rgm_write_with((`STATUS_RD_ADDR + `OBM_BASE_ADDR(2)),`STATUS_LIST_RX_PKT(i)); 
        	  `user_rgm_read_with((`STATUS_RD_ADDR + `OBM_BASE_ADDR(2))); 
        	  rd_data = rsp.data;
    		  if(rd_data != (`STATUS_LIST_RX_PKT(i)))begin 
        	  	  `uvm_error(get_type_name(),$psprintf("rd_data is %0d,ref_data is %0d",rd_data,`STATUS_LIST_RX_PKT(i)));
    		  end
        
        	  //here is for check pkt data is ok or not
        	  while(1)begin 
        	      `user_rgm_read_with((`RD_STATUS + `OBM_BASE_ADDR(2)));
        	  	  rd_data = rsp.data;
        	      `uvm_info(get_type_name(),$psprintf("rd_data is 0x%0h",rd_data),UVM_NONE);
        		  if(rd_data[0] == 1'b1)begin 
        		  	  break;
        		  end
        		  #200ns;
    			  timeout_cnt ++;
    			  if(timeout_cnt >= 10)begin 
    			  	  `uvm_fatal(get_type_name(),$psprintf("it's too long to get pkt cnt ready"));
    			  end
        	  end
    
        	  //here is for read rx pkt_cnt
        	  `user_rgm_read_with((`STATUS_DATA_L + `OBM_BASE_ADDR(2)));
    		  if(j == 0)begin 
        	  	  m_obm_reg_rx_pkt[i][15:0] = rsp.data;
    		  end
    		  else begin 
    		  	  rd_data[15:0] = rsp.data;
    		  end
        	  `user_rgm_read_with((`STATUS_DATA_H + `OBM_BASE_ADDR(2)));
    		  if(j == 0)begin 
        	  	  m_obm_reg_rx_pkt[i][31:16] = rsp.data;
    		  end
    		  else begin 
    		  	  rd_data[31:16] = rsp.data;
    		  end
        	  `uvm_info(get_type_name(),$psprintf("m_obm_reg_rx_pkt[%0d] is %0d",i,m_obm_reg_rx_pkt[i]),UVM_NONE);
    
    		  //here is for cnt clear
    		  if(j == 1)begin 
    		  	  if(rd_data != 32'h0)begin 
    		  	  	  `uvm_error(get_type_name(),$psprintf("m_obm_reg_rx_pkt[%0d] is %0d not cleared",i,rd_data));
    		  	  end
    		  end
    
    	  end
	  end
      
	  //here is for m_obm_reg_tx_emac_pkt
	  for(int j=0;j<2;j++)begin
	  	  for(int i=0;i<8;i++)begin 
    	  	  //here is cfg list
    		  timeout_cnt = 0;
        	  `user_rgm_write_with((`STATUS_RD_ADDR + `OBM_BASE_ADDR(2)),`STATUS_LIST_EMAC_PKT(i)); 
        	  `user_rgm_read_with((`STATUS_RD_ADDR + `OBM_BASE_ADDR(2))); 
        	  rd_data = rsp.data;
    		  if(rd_data != (`STATUS_LIST_EMAC_PKT(i)))begin 
        	  	  `uvm_error(get_type_name(),$psprintf("rd_data is %0d,ref_data is %0d",rd_data,`STATUS_LIST_EMAC_PKT(i)));
    		  end
        
        	  //here is for check pkt data is ok or not
        	  while(1)begin 
        	      `user_rgm_read_with((`RD_STATUS + `OBM_BASE_ADDR(2)));
        	  	  rd_data = rsp.data;
        	      `uvm_info(get_type_name(),$psprintf("rd_data is 0x%0h",rd_data),UVM_NONE);
        		  if(rd_data[0] == 1'b1)begin 
        		  	  break;
        		  end
        		  #200ns;
    			  timeout_cnt ++;
    			  if(timeout_cnt >= 10)begin 
    			  	  `uvm_fatal(get_type_name(),$psprintf("it's too long to get pkt cnt ready"));
    			  end
        	  end
    
        	  //here is for read rx pkt_cnt
        	  `user_rgm_read_with((`STATUS_DATA_L + `OBM_BASE_ADDR(2)));
    		  if(j == 0)begin 
        	  	  m_obm_reg_tx_emac_pkt[i][15:0] = rsp.data;
    		  end
    		  else begin 
    		  	  rd_data[15:0] = rsp.data;
    		  end
        	  `user_rgm_read_with((`STATUS_DATA_H + `OBM_BASE_ADDR(2)));
    		  if(j == 0)begin 
        	  	  m_obm_reg_tx_emac_pkt[i][31:16] = rsp.data;
    		  end
    		  else begin 
    		  	  rd_data[31:16] = rsp.data;
    		  end
        	  `uvm_info(get_type_name(),$psprintf("m_obm_reg_tx_emac_pkt[%0d] is %0d",i,m_obm_reg_tx_emac_pkt[i]),UVM_NONE);
    
    		  //here is for cnt clear
    		  if(j == 1)begin 
    		  	  if(rd_data != 32'h0)begin 
    		  	  	  `uvm_error(get_type_name(),$psprintf("m_obm_reg_tx_emac_pkt[%0d] is %0d not cleared",i,rd_data));
    		  	  end
    		  end
    
    	  end
	  end

	  //here is for m_obm_reg_tx_emac_byte
	  for(int j=0;j<2;j++)begin
	  	  for(int i=0;i<8;i++)begin 
    	  	  //here is cfg list
    		  timeout_cnt = 0;
        	  `user_rgm_write_with((`STATUS_RD_ADDR + `OBM_BASE_ADDR(2)),`STATUS_LIST_EMAC_BYTE(i)); 
        	  `user_rgm_read_with((`STATUS_RD_ADDR + `OBM_BASE_ADDR(2))); 
        	  rd_data = rsp.data;
    		  if(rd_data != (`STATUS_LIST_EMAC_BYTE(i)))begin 
        	  	  `uvm_error(get_type_name(),$psprintf("rd_data is %0d,ref_data is %0d",rd_data,`STATUS_LIST_EMAC_BYTE(i)));
    		  end
        
        	  //here is for check pkt data is ok or not
        	  while(1)begin 
        	      `user_rgm_read_with((`RD_STATUS + `OBM_BASE_ADDR(2)));
        	  	  rd_data = rsp.data;
        	      `uvm_info(get_type_name(),$psprintf("rd_data is 0x%0h",rd_data),UVM_NONE);
        		  if(rd_data[0] == 1'b1)begin 
        		  	  break;
        		  end
        		  #200ns;
    			  timeout_cnt ++;
    			  if(timeout_cnt >= 10)begin 
    			  	  `uvm_fatal(get_type_name(),$psprintf("it's too long to get pkt cnt ready"));
    			  end
        	  end
    
        	  //here is for read rx pkt_cnt
        	  `user_rgm_read_with((`STATUS_DATA_L + `OBM_BASE_ADDR(2)));
    		  if(j == 0)begin 
        	  	  m_obm_reg_tx_emac_byte[i][15:0] = rsp.data;
    		  end
    		  else begin 
    		  	  rd_data[15:0] = rsp.data;
    		  end
        	  `user_rgm_read_with((`STATUS_DATA_H + `OBM_BASE_ADDR(2)));
    		  if(j == 0)begin 
        	  	  m_obm_reg_tx_emac_byte[i][31:16] = rsp.data;
    		  end
    		  else begin 
    		  	  rd_data[31:16] = rsp.data;
    		  end
        	  `uvm_info(get_type_name(),$psprintf("m_obm_reg_tx_emac_byte[%0d] is %0d",i,m_obm_reg_tx_emac_byte[i]),UVM_NONE);
    
    		  //here is for cnt clear
    		  if(j == 1)begin 
    		  	  if(rd_data != 32'h0)begin 
    		  	  	  `uvm_error(get_type_name(),$psprintf("m_obm_reg_tx_emac_byte[%0d] is %0d not cleared",i,rd_data));
    		  	  end
    		  end
    
    	  end
	  end

	  //here is for m_obm_reg_tx_pmac_pkt
	  for(int j=0;j<2;j++)begin
	  	  for(int i=0;i<8;i++)begin 
    	  	  //here is cfg list
    		  timeout_cnt = 0;
        	  `user_rgm_write_with((`STATUS_RD_ADDR + `OBM_BASE_ADDR(2)),`STATUS_LIST_PMAC_PKT(i)); 
        	  `user_rgm_read_with((`STATUS_RD_ADDR + `OBM_BASE_ADDR(2))); 
        	  rd_data = rsp.data;
    		  if(rd_data != (`STATUS_LIST_PMAC_PKT(i)))begin 
        	  	  `uvm_error(get_type_name(),$psprintf("rd_data is %0d,ref_data is %0d",rd_data,`STATUS_LIST_PMAC_PKT(i)));
    		  end
        
        	  //here is for check pkt data is ok or not
        	  while(1)begin 
        	      `user_rgm_read_with((`RD_STATUS + `OBM_BASE_ADDR(2)));
        	  	  rd_data = rsp.data;
        	      `uvm_info(get_type_name(),$psprintf("rd_data is 0x%0h",rd_data),UVM_NONE);
        		  if(rd_data[0] == 1'b1)begin 
        		  	  break;
        		  end
        		  #200ns;
    			  timeout_cnt ++;
    			  if(timeout_cnt >= 10)begin 
    			  	  `uvm_fatal(get_type_name(),$psprintf("it's too long to get pkt cnt ready"));
    			  end
        	  end
    
        	  //here is for read rx pkt_cnt
        	  `user_rgm_read_with((`STATUS_DATA_L + `OBM_BASE_ADDR(2)));
    		  if(j == 0)begin 
        	  	  m_obm_reg_tx_pmac_pkt[i][15:0] = rsp.data;
    		  end
    		  else begin 
    		  	  rd_data[15:0] = rsp.data;
    		  end
        	  `user_rgm_read_with((`STATUS_DATA_H + `OBM_BASE_ADDR(2)));
    		  if(j == 0)begin 
        	  	  m_obm_reg_tx_pmac_pkt[i][31:16] = rsp.data;
    		  end
    		  else begin 
    		  	  rd_data[31:16] = rsp.data;
    		  end
        	  `uvm_info(get_type_name(),$psprintf("m_obm_reg_tx_pmac_pkt[%0d] is %0d",i,m_obm_reg_tx_pmac_pkt[i]),UVM_NONE);
    
    		  //here is for cnt clear
    		  if(j == 1)begin 
    		  	  if(rd_data != 32'h0)begin 
    		  	  	  `uvm_error(get_type_name(),$psprintf("m_obm_reg_tx_pmac_pkt[%0d] is %0d not cleared",i,rd_data));
    		  	  end
    		  end
    
    	  end
	  end

	  //here is for m_obm_reg_tx_pmac_byte
	  for(int j=0;j<2;j++)begin
	  	  for(int i=0;i<8;i++)begin 
    	  	  //here is cfg list
    		  timeout_cnt = 0;
        	  `user_rgm_write_with((`STATUS_RD_ADDR + `OBM_BASE_ADDR(2)),`STATUS_LIST_PMAC_BYTE(i)); 
        	  `user_rgm_read_with((`STATUS_RD_ADDR + `OBM_BASE_ADDR(2))); 
        	  rd_data = rsp.data;
    		  if(rd_data != (`STATUS_LIST_PMAC_BYTE(i)))begin 
        	  	  `uvm_error(get_type_name(),$psprintf("rd_data is %0d,ref_data is %0d",rd_data,`STATUS_LIST_PMAC_BYTE(i)));
    		  end
        
        	  //here is for check pkt data is ok or not
        	  while(1)begin 
        	      `user_rgm_read_with((`RD_STATUS + `OBM_BASE_ADDR(2)));
        	  	  rd_data = rsp.data;
        	      `uvm_info(get_type_name(),$psprintf("rd_data is 0x%0h",rd_data),UVM_NONE);
        		  if(rd_data[0] == 1'b1)begin 
        		  	  break;
        		  end
        		  #200ns;
    			  timeout_cnt ++;
    			  if(timeout_cnt >= 10)begin 
    			  	  `uvm_fatal(get_type_name(),$psprintf("it's too long to get pkt cnt ready"));
    			  end
        	  end
    
        	  //here is for read rx pkt_cnt
        	  `user_rgm_read_with((`STATUS_DATA_L + `OBM_BASE_ADDR(2)));
    		  if(j == 0)begin 
        	  	  m_obm_reg_tx_pmac_byte[i][15:0] = rsp.data;
    		  end
    		  else begin 
    		  	  rd_data[15:0] = rsp.data;
    		  end
        	  `user_rgm_read_with((`STATUS_DATA_H + `OBM_BASE_ADDR(2)));
    		  if(j == 0)begin 
        	  	  m_obm_reg_tx_pmac_byte[i][31:16] = rsp.data;
    		  end
    		  else begin 
    		  	  rd_data[31:16] = rsp.data;
    		  end
        	  `uvm_info(get_type_name(),$psprintf("m_obm_reg_tx_pmac_byte[%0d] is %0d",i,m_obm_reg_tx_pmac_byte[i]),UVM_NONE);
    
    		  //here is for cnt clear
    		  if(j == 1)begin 
    		  	  if(rd_data != 32'h0)begin 
    		  	  	  `uvm_error(get_type_name(),$psprintf("m_obm_reg_tx_pmac_byte[%0d] is %0d not cleared",i,rd_data));
    		  	  end
    		  end
    
    	  end
	  end

	  //here is for m_obm_reg_rx_desc_drop_pkt
	  for(int j=0;j<2;j++)begin
	  	  for(int i=0;i<8;i++)begin 
    	  	  //here is cfg list
    		  timeout_cnt = 0;
        	  `user_rgm_write_with((`STATUS_RD_ADDR + `OBM_BASE_ADDR(2)),`STATUS_LIST_RX_DESC_DROP_PKT(i)); 
        	  `user_rgm_read_with((`STATUS_RD_ADDR + `OBM_BASE_ADDR(2))); 
        	  rd_data = rsp.data;
    		  if(rd_data != (`STATUS_LIST_RX_DESC_DROP_PKT(i)))begin 
        	  	  `uvm_error(get_type_name(),$psprintf("rd_data is %0d,ref_data is %0d",rd_data,`STATUS_LIST_RX_DESC_DROP_PKT(i)));
    		  end
        
        	  //here is for check pkt data is ok or not
        	  while(1)begin 
        	      `user_rgm_read_with((`RD_STATUS + `OBM_BASE_ADDR(2)));
        	  	  rd_data = rsp.data;
        	      `uvm_info(get_type_name(),$psprintf("rd_data is 0x%0h",rd_data),UVM_NONE);
        		  if(rd_data[0] == 1'b1)begin 
        		  	  break;
        		  end
        		  #200ns;
    			  timeout_cnt ++;
    			  if(timeout_cnt >= 10)begin 
    			  	  `uvm_fatal(get_type_name(),$psprintf("it's too long to get pkt cnt ready"));
    			  end
        	  end
    
        	  //here is for read rx pkt_cnt
        	  `user_rgm_read_with((`STATUS_DATA_L + `OBM_BASE_ADDR(2)));
    		  if(j == 0)begin 
        	  	  m_obm_reg_rx_desc_drop_pkt[i][15:0] = rsp.data;
    		  end
    		  else begin 
    		  	  rd_data[15:0] = rsp.data;
    		  end
        	  `user_rgm_read_with((`STATUS_DATA_H + `OBM_BASE_ADDR(2)));
    		  if(j == 0)begin 
        	  	  m_obm_reg_rx_desc_drop_pkt[i][31:16] = rsp.data;
    		  end
    		  else begin 
    		  	  rd_data[31:16] = rsp.data;
    		  end
        	  `uvm_info(get_type_name(),$psprintf("m_obm_reg_rx_desc_drop_pkt[%0d] is %0d",i,m_obm_reg_rx_desc_drop_pkt[i]),UVM_NONE);
    
    		  //here is for cnt clear
    		  if(j == 1)begin 
    		  	  if(rd_data != 32'h0)begin 
    		  	  	  `uvm_error(get_type_name(),$psprintf("m_obm_reg_rx_desc_drop_pkt[%0d] is %0d not cleared",i,rd_data));
    		  	  end
    		  end
    
    	  end
	  end

	  //here is for m_obm_reg_rx_data_drop_pkt
	  for(int j=0;j<2;j++)begin
	  	  for(int i=0;i<8;i++)begin 
    	  	  //here is cfg list
    		  timeout_cnt = 0;
        	  `user_rgm_write_with((`STATUS_RD_ADDR + `OBM_BASE_ADDR(2)),`STATUS_LIST_RX_DATA_DROP_PKT(i)); 
        	  `user_rgm_read_with((`STATUS_RD_ADDR + `OBM_BASE_ADDR(2))); 
        	  rd_data = rsp.data;
    		  if(rd_data != (`STATUS_LIST_RX_DATA_DROP_PKT(i)))begin 
        	  	  `uvm_error(get_type_name(),$psprintf("rd_data is %0d,ref_data is %0d",rd_data,`STATUS_LIST_RX_DATA_DROP_PKT(i)));
    		  end
        
        	  //here is for check pkt data is ok or not
        	  while(1)begin 
        	      `user_rgm_read_with((`RD_STATUS + `OBM_BASE_ADDR(2)));
        	  	  rd_data = rsp.data;
        	      `uvm_info(get_type_name(),$psprintf("rd_data is 0x%0h",rd_data),UVM_NONE);
        		  if(rd_data[0] == 1'b1)begin 
        		  	  break;
        		  end
        		  #200ns;
    			  timeout_cnt ++;
    			  if(timeout_cnt >= 10)begin 
    			  	  `uvm_fatal(get_type_name(),$psprintf("it's too long to get pkt cnt ready"));
    			  end
        	  end
    
        	  //here is for read rx pkt_cnt
        	  `user_rgm_read_with((`STATUS_DATA_L + `OBM_BASE_ADDR(2)));
    		  if(j == 0)begin 
        	  	  m_obm_reg_rx_data_drop_pkt[i][15:0] = rsp.data;
    		  end
    		  else begin 
    		  	  rd_data[15:0] = rsp.data;
    		  end
        	  `user_rgm_read_with((`STATUS_DATA_H + `OBM_BASE_ADDR(2)));
    		  if(j == 0)begin 
        	  	  m_obm_reg_rx_data_drop_pkt[i][31:16] = rsp.data;
    		  end
    		  else begin 
    		  	  rd_data[31:16] = rsp.data;
    		  end
        	  `uvm_info(get_type_name(),$psprintf("m_obm_reg_rx_data_drop_pkt[%0d] is %0d",i,m_obm_reg_rx_data_drop_pkt[i]),UVM_NONE);
    
    		  //here is for cnt clear
    		  if(j == 1)begin 
    		  	  if(rd_data != 32'h0)begin 
    		  	  	  `uvm_error(get_type_name(),$psprintf("m_obm_reg_rx_data_drop_pkt[%0d] is %0d not cleared",i,rd_data));
    		  	  end
    		  end
    
    	  end
	  end
	  `uvm_info(get_type_name(),$psprintf("ended to test qbv_wr_reg qbv_rd_reg"),UVM_NONE);
endtask

task qbv_wr_reg(int addr,int wr_data);
	`uvm_info(get_type_name(),$psprintf("qbv_wr_reg addr is 0x%0h",addr),UVM_NONE);
	`user_rgm_write_with(addr,wr_data); 
endtask:qbv_wr_reg

task qbv_rd_reg(int addr,output bit [31:0] rd_data);
	`uvm_info(get_type_name(),$psprintf("qbv_rd_reg addr is 0x%0h",addr),UVM_NONE);
	`user_rgm_read_with(addr); 
	rd_data = rsp.data;
endtask:qbv_rd_reg
	  
endclass
`endif

 
