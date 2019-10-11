//FILE_HEADER------------------------------------------------------------------------------------------
// ZTE  Copyright
// ZTE Company Confidential
//-----------------------------------------------------------------------------------------------------
// FILE NAME:       xgmii64_rx_driver.sv
// DEPARTMENT:      Multi-Service Bearer Product ShenZhen Design&Development Dept.
// AUTHOR:          Li Xiangqiong
// AUTHOR'S EMAIL:  li.xiangqiong@zte.com.cn
//-----------------------------------------------------------------------------------------------------
// RELEASE HISTORY: N/A
// VERSION      DATE         AUTHOR       DESCRIPTION
// 1.1         2011-11-22    Li Xiangqiong   UVM
//-----------------------------------------------------------------------------------------------------
// KEYWORDS: xgmii64_rx_driver
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

`ifndef XGMII64_RX_DRIVER_SV
`define XGMII64_RX_DRIVER_SV

//------------------------------------------------------------------------------
//
// CLASS: xgmii64_rx_driver
//
//------------------------------------------------------------------------------

class xgmii64_rx_driver extends mac_rx_base_driver;
  
  typedef enum {
    IPG_State,TX_PKT_State,TX_ER_State
  } state_e;
  
  protected virtual       xgmii64_rx_if         m_xgmii64_rx_if;
  protected int unsigned  xgmii64_rx_driver_id                 ;  
  local     state_e       m_state                              ;  
  bit [7:0]               frame_data[$]                        ;

  `uvm_component_utils_begin(xgmii64_rx_driver)
    `uvm_field_int       (xgmii64_rx_driver_id , UVM_ALL_ON)
    `uvm_field_enum      (state_e,m_state      , UVM_ALL_ON)
 //   `uvm_field_array_int (frame_data           , UVM_ALL_ON)
  `uvm_component_utils_end
  
  //--------------------------------------------------------------------
  // new - constructor
  //--------------------------------------------------------------------
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

  //--------------------------------------------------------------------
  // build
  //--------------------------------------------------------------------
  function void build();

//    xgmii64_rx_vif vif;
//    uvm_object dummy;
//
//    vif = null;
//    if(!get_config_object("m_xgmii64_rx_vif", dummy, 0)) begin
//      uvm_report_error("build", "no virtual interface available");
//    end
//    else begin
//      if(!$cast(vif, dummy)) begin
//        uvm_report_error("build", "virtual interface is incorrect type");
//      end
//      else begin
//        m_xgmii64_rx_if = vif.m_xgmii64_rx_if;
//      end
//    end
    
    //if(!get_config_object("mac_env_static_config",dummy,0)) begin
    //	uvm_report_error("build","no value for mac_env_static_config");
    //end
    //else begin
    //	if(!$cast(static_cfg,dummy))
    //		uvm_report_error("build","static_cfg is incorrect type");
    //	end  
      if(!uvm_config_db#(virtual xgmii64_rx_if)::get(this, "", "m_xgmii64_rx_if", m_xgmii64_rx_if)) begin
         `uvm_fatal(get_type_name(),"=============No virtual interface specified for this driver instance==========");
      end
  endfunction : build
  
  //--------------------------------------------------------------------
  // start_of_simulation
  //--------------------------------------------------------------------
  function void start_of_simulation();
    m_state = IPG_State;
  endfunction : start_of_simulation
  
  //--------------------------------------------------------------------
  // run
  //--------------------------------------------------------------------
  virtual task run();
      fork
        get_and_drive();
        reset_signals();
      join  
  endtask : run
  
  //--------------------------------------------------------------------
  // get_and_drive
  //--------------------------------------------------------------------
  virtual protected task get_and_drive();
    bit  first_req = 1'b1; 
    forever begin
    	if(first_req) begin
    	  @(posedge m_xgmii64_rx_if.clk);
    	  if(m_xgmii64_rx_if.reset==1'b1)
    		continue;
    	end
      begin
//        seq_item_port.get_next_item(req);
        seq_item_port.try_next_item(req);
        while(req==null) begin
        	xgmii64_rx_idle();
        	seq_item_port.try_next_item(req);
        end
        req.pack_bytes(req.frame_data);
//        req.print();
        xgmii64_rx(req);
        $cast(rsp, req.clone());
        rsp.set_id_info(req);
        seq_item_port.item_done(rsp);
        first_req = 1'b0;
      end
    end
  endtask : get_and_drive

  //--------------------------------------------------------------------
  // reset_signals
  //--------------------------------------------------------------------
  virtual protected task reset_signals();
    forever begin
      @(posedge m_xgmii64_rx_if.reset);
      m_xgmii64_rx_if.rxc <= 8'h0 ;
      m_xgmii64_rx_if.rxd <= 64'h0;
    end
  endtask : reset_signals
  
  //--------------------------------------------------------------------
  // xgmii64_rx_idle
  //--------------------------------------------------------------------  
  virtual protected task xgmii64_rx_idle();
    @(posedge m_xgmii64_rx_if.clk);
    m_xgmii64_rx_if.rxc <= 8'b1111_1111 ;
    m_xgmii64_rx_if.rxd <= 64'h0707_0707_0707_0707; //IDLE CODE
  endtask : xgmii64_rx_idle
  
  //--------------------------------------------------------------------
  // xgmii64_rx
  //--------------------------------------------------------------------  
  virtual protected task xgmii64_rx (eth_frame trans);
    int unsigned  ipg_num;
    int unsigned  frame_data_num;
    bit           start_flag;
    bit [7:0]     frame_data[];
    
    frame_data = trans.frame_data;
    start_flag = 1'b0;
    if(trans.inter_frame_gap%4 != 0)
      ipg_num = trans.inter_frame_gap + (4 - trans.inter_frame_gap%4);
    else
      ipg_num = trans.inter_frame_gap;      
    if(ipg_num == 0)
    	uvm_report_error(get_type_name(),$psprintf(
          	        "ipg_num is equal 0"),UVM_LOW);
      
    forever begin
//      if(rt_cfg.cfg_LinkEN==1'b0) begin
      if(0) begin
      	m_xgmii64_rx_if.rxc <= 8'h0 ;
        m_xgmii64_rx_if.rxd <= 64'h0;
        break;
      end
      else begin
      case(m_state)
        IPG_State : begin    
        	if(ipg_num%8 == 0) begin
        	  repeat(ipg_num/8) begin
        	    @(posedge m_xgmii64_rx_if.clk);
        	    if(m_xgmii64_rx_if.reset==1'b1) 
        	  	  return;
        	    m_xgmii64_rx_if.rxc <= 8'b1111_1111 ;
        	    m_xgmii64_rx_if.rxd <= 64'h0707_0707_0707_0707; //IDLE CODE
        	  end    
        	end
        	else if(ipg_num%8 == 4) begin        		
        	  repeat(ipg_num/8) begin
        	    @(posedge m_xgmii64_rx_if.clk);
        	    if(m_xgmii64_rx_if.reset==1'b1) 
        	  	  return;
        	    m_xgmii64_rx_if.rxc[7 : 0] <= 8'b1111_1111 ;
        	    m_xgmii64_rx_if.rxd[63: 0] <= 64'h0707_0707_0707_0707; //IDLE CODE
        	  end
        	  @(posedge m_xgmii64_rx_if.clk);
        	  if(m_xgmii64_rx_if.reset==1'b1) 
        	    return;
        	  m_xgmii64_rx_if.rxc[3 : 0] <= 4'b1111 ;
        	  m_xgmii64_rx_if.rxd[31: 0] <= 32'h0707_0707; //IDLE CODE
        	  m_xgmii64_rx_if.rxc[7 : 4] <= 4'b0001 ;
        	  m_xgmii64_rx_if.rxd[39:32] <= 8'hFB;//Start
        		m_xgmii64_rx_if.rxd[47:40] <= frame_data[1];
        		m_xgmii64_rx_if.rxd[55:48] <= frame_data[2];
        		m_xgmii64_rx_if.rxd[63:56] <= frame_data[3];
        		for(int n=0;n<=frame_data.size()-5;n++)
        		  frame_data[n] = frame_data[n+4];
        		frame_data = new[frame_data.size()-4](frame_data);
        		start_flag = 1'b1;        	     
        	end
        	else
        		uvm_report_error(get_type_name(),$psprintf(
          	        "ipg_num is not equal multiple of 4"),UVM_LOW);
        	if(frame_data.size()<9) begin
        		uvm_report_error(get_type_name(),$psprintf(
          	        "frame_data size(%0d) is too small",frame_data.size()),UVM_LOW);
            return;
        	end
        	else begin
        	  if(frame_data.size()%8 != 0)
              frame_data_num = frame_data.size()/8 +1;
            else
              frame_data_num = frame_data.size()/8;
        	end        	
        	if(trans.protocol_error_mode==NO_PROT_ERROR) begin
        	  m_state          = TX_PKT_State;
        	end
        	else if((trans.protocol_error_mode == SINGLE_PROT_ERROR_KIND)||
        		      (trans.protocol_error_mode == MULTI_PROT_ERROR_KIND))
        		m_state          = TX_ER_State;
        	else
        		break;
        end
        
        TX_PKT_State : begin
        	for(int i=0; i<frame_data_num; i++) begin
        		@(posedge m_xgmii64_rx_if.clk);
        		if(m_xgmii64_rx_if.reset==1'b1) begin
        			m_state          = IPG_State;
        		  return;
        		end
        		if(i==0) begin//the first eight octets
        			if(start_flag == 1'b0) begin
        			  m_xgmii64_rx_if.rxc        <= 8'b0000_0001 ;
        			  m_xgmii64_rx_if.rxd[7 : 0] <= 8'hFB;//Start
        			  m_xgmii64_rx_if.rxd[15: 8] <= frame_data[i+1];
        			  m_xgmii64_rx_if.rxd[23:16] <= frame_data[i+2];
        			  m_xgmii64_rx_if.rxd[31:24] <= frame_data[i+3];        			  
        			  m_xgmii64_rx_if.rxd[39:32] <= frame_data[i+4];
        			  m_xgmii64_rx_if.rxd[47:40] <= frame_data[i+5];
        			  m_xgmii64_rx_if.rxd[55:48] <= frame_data[i+6];
        			  m_xgmii64_rx_if.rxd[63:56] <= frame_data[i+7];
        			end
        			else begin
        				m_xgmii64_rx_if.rxc        <= 8'b0000_0000   ;
        			  m_xgmii64_rx_if.rxd[7 : 0] <= frame_data[i]  ;
        			  m_xgmii64_rx_if.rxd[15: 8] <= frame_data[i+1];
        			  m_xgmii64_rx_if.rxd[23:16] <= frame_data[i+2];
        			  m_xgmii64_rx_if.rxd[31:24] <= frame_data[i+3];        			  
        			  m_xgmii64_rx_if.rxd[39:32] <= frame_data[i+4];
        			  m_xgmii64_rx_if.rxd[47:40] <= frame_data[i+5];
        			  m_xgmii64_rx_if.rxd[55:48] <= frame_data[i+6];
        			  m_xgmii64_rx_if.rxd[63:56] <= frame_data[i+7];
        			end
        		end
        		else if(i==frame_data_num-1) begin//the last eight octets
        		  if(frame_data.size()%8 == 0) begin
        		    m_xgmii64_rx_if.rxc        <= 8'b0000_0000     ;
        			  m_xgmii64_rx_if.rxd[7 : 0] <= frame_data[8*i]  ;
        			  m_xgmii64_rx_if.rxd[15: 8] <= frame_data[8*i+1];
        			  m_xgmii64_rx_if.rxd[23:16] <= frame_data[8*i+2];
        			  m_xgmii64_rx_if.rxd[31:24] <= frame_data[8*i+3];
        			  m_xgmii64_rx_if.rxd[39:32] <= frame_data[8*i+4];
        			  m_xgmii64_rx_if.rxd[47:40] <= frame_data[8*i+5];
        			  m_xgmii64_rx_if.rxd[55:48] <= frame_data[8*i+6];
        			  m_xgmii64_rx_if.rxd[63:56] <= frame_data[8*i+7];
        			  @(posedge m_xgmii64_rx_if.clk);
        			  m_xgmii64_rx_if.rxc        <= 8'b1111_1111 ;
        			  m_xgmii64_rx_if.rxd[7 : 0] <= 8'hFD;//Terminate
        			  m_xgmii64_rx_if.rxd[15: 8] <= 8'h07;//IDLE
        			  m_xgmii64_rx_if.rxd[23:16] <= 8'h07;//IDLE
        			  m_xgmii64_rx_if.rxd[31:24] <= 8'h07;//IDLE   
        			  m_xgmii64_rx_if.rxd[39:32] <= 8'h07;//IDLE
        			  m_xgmii64_rx_if.rxd[47:40] <= 8'h07;//IDLE
        			  m_xgmii64_rx_if.rxd[55:48] <= 8'h07;//IDLE
        			  m_xgmii64_rx_if.rxd[63:56] <= 8'h07;//IDLE   			  
        		  end
        		  else if(frame_data.size()%8 == 1) begin
        		    m_xgmii64_rx_if.rxc        <= 8'b1111_1110 ;
        			  m_xgmii64_rx_if.rxd[7 : 0] <= frame_data[8*i];
        			  m_xgmii64_rx_if.rxd[15: 8] <= 8'hFD;//Terminate
        			  m_xgmii64_rx_if.rxd[23:16] <= 8'h07;//IDLE
        			  m_xgmii64_rx_if.rxd[31:24] <= 8'h07;//IDLE
        			  m_xgmii64_rx_if.rxd[39:32] <= 8'h07;//IDLE
        			  m_xgmii64_rx_if.rxd[47:40] <= 8'h07;//IDLE
        			  m_xgmii64_rx_if.rxd[55:48] <= 8'h07;//IDLE
        			  m_xgmii64_rx_if.rxd[63:56] <= 8'h07;//IDLE
        		  end
        		  else if(frame_data.size()%8 == 2) begin
        		    m_xgmii64_rx_if.rxc        <= 8'b1111_1100 ; 
        			  m_xgmii64_rx_if.rxd[7 : 0] <= frame_data[8*i];
        			  m_xgmii64_rx_if.rxd[15: 8] <= frame_data[8*i+1];
        			  m_xgmii64_rx_if.rxd[23:16] <= 8'hFD;//Terminate
        			  m_xgmii64_rx_if.rxd[31:24] <= 8'h07;//IDLE
        			  m_xgmii64_rx_if.rxd[39:32] <= 8'h07;//IDLE
        			  m_xgmii64_rx_if.rxd[47:40] <= 8'h07;//IDLE
        			  m_xgmii64_rx_if.rxd[55:48] <= 8'h07;//IDLE
        			  m_xgmii64_rx_if.rxd[63:56] <= 8'h07;//IDLE
        		  end
        		  else if(frame_data.size()%8 == 3) begin
        		    m_xgmii64_rx_if.rxc        <= 8'b1111_1000 ; 
        			  m_xgmii64_rx_if.rxd[7 : 0] <= frame_data[8*i];
        			  m_xgmii64_rx_if.rxd[15: 8] <= frame_data[8*i+1];
        			  m_xgmii64_rx_if.rxd[23:16] <= frame_data[8*i+2];
        			  m_xgmii64_rx_if.rxd[31:24] <= 8'hFD;//Terminate
        			  m_xgmii64_rx_if.rxd[39:32] <= 8'h07;//IDLE
        			  m_xgmii64_rx_if.rxd[47:40] <= 8'h07;//IDLE
        			  m_xgmii64_rx_if.rxd[55:48] <= 8'h07;//IDLE
        			  m_xgmii64_rx_if.rxd[63:56] <= 8'h07;//IDLE
        		  end
        		  else if(frame_data.size()%8 == 4) begin
        		    m_xgmii64_rx_if.rxc        <= 8'b1111_0000 ; 
        			  m_xgmii64_rx_if.rxd[7 : 0] <= frame_data[8*i];
        			  m_xgmii64_rx_if.rxd[15: 8] <= frame_data[8*i+1];
        			  m_xgmii64_rx_if.rxd[23:16] <= frame_data[8*i+2];
        			  m_xgmii64_rx_if.rxd[31:24] <= frame_data[8*i+3];
        			  m_xgmii64_rx_if.rxd[39:32] <= 8'hFD;//Terminate
        			  m_xgmii64_rx_if.rxd[47:40] <= 8'h07;//IDLE
        			  m_xgmii64_rx_if.rxd[55:48] <= 8'h07;//IDLE
        			  m_xgmii64_rx_if.rxd[63:56] <= 8'h07;//IDLE
        		  end
        		  else if(frame_data.size()%8 == 5) begin
        		    m_xgmii64_rx_if.rxc        <= 8'b1110_0000 ; 
        			  m_xgmii64_rx_if.rxd[7 : 0] <= frame_data[8*i];
        			  m_xgmii64_rx_if.rxd[15: 8] <= frame_data[8*i+1];
        			  m_xgmii64_rx_if.rxd[23:16] <= frame_data[8*i+2];
        			  m_xgmii64_rx_if.rxd[31:24] <= frame_data[8*i+3];
        			  m_xgmii64_rx_if.rxd[39:32] <= frame_data[8*i+4];
        			  m_xgmii64_rx_if.rxd[47:40] <= 8'hFD;//Terminate
        			  m_xgmii64_rx_if.rxd[55:48] <= 8'h07;//IDLE
        			  m_xgmii64_rx_if.rxd[63:56] <= 8'h07;//IDLE
        		  end
        		  else if(frame_data.size()%8 == 6) begin
        		    m_xgmii64_rx_if.rxc        <= 8'b1100_0000 ; 
        			  m_xgmii64_rx_if.rxd[7 : 0] <= frame_data[8*i];
        			  m_xgmii64_rx_if.rxd[15: 8] <= frame_data[8*i+1];
        			  m_xgmii64_rx_if.rxd[23:16] <= frame_data[8*i+2];
        			  m_xgmii64_rx_if.rxd[31:24] <= frame_data[8*i+3];
        			  m_xgmii64_rx_if.rxd[39:32] <= frame_data[8*i+4];
        			  m_xgmii64_rx_if.rxd[47:40] <= frame_data[8*i+5];
        			  m_xgmii64_rx_if.rxd[55:48] <= 8'hFD;//Terminate
        			  m_xgmii64_rx_if.rxd[63:56] <= 8'h07;//IDLE
        		  end
        		  else if(frame_data.size()%8 == 7) begin
        		    m_xgmii64_rx_if.rxc        <= 8'b1000_0000 ; 
        			  m_xgmii64_rx_if.rxd[7 : 0] <= frame_data[8*i];
        			  m_xgmii64_rx_if.rxd[15: 8] <= frame_data[8*i+1];
        			  m_xgmii64_rx_if.rxd[23:16] <= frame_data[8*i+2];
        			  m_xgmii64_rx_if.rxd[31:24] <= frame_data[8*i+3];
        			  m_xgmii64_rx_if.rxd[39:32] <= frame_data[8*i+4];
        			  m_xgmii64_rx_if.rxd[47:40] <= frame_data[8*i+5];
        			  m_xgmii64_rx_if.rxd[55:48] <= frame_data[8*i+6];
        			  m_xgmii64_rx_if.rxd[63:56] <= 8'hFD;//Terminate
        		  end
        		end      		      		
        		else begin
        		  m_xgmii64_rx_if.rxc        <= 8'b0000_0000     ;
        			m_xgmii64_rx_if.rxd[7 : 0] <= frame_data[8*i]  ;
        			m_xgmii64_rx_if.rxd[15: 8] <= frame_data[8*i+1];
        			m_xgmii64_rx_if.rxd[23:16] <= frame_data[8*i+2];
        			m_xgmii64_rx_if.rxd[31:24] <= frame_data[8*i+3];
        			m_xgmii64_rx_if.rxd[39:32] <= frame_data[8*i+4];
        			m_xgmii64_rx_if.rxd[47:40] <= frame_data[8*i+5];
        			m_xgmii64_rx_if.rxd[55:48] <= frame_data[8*i+6];
        			m_xgmii64_rx_if.rxd[63:56] <= frame_data[8*i+7];
        		end
        	end
        	m_state          = IPG_State;
        	break;
        end
        
        TX_ER_State : begin
          int timing[$];
        	int length[$];
        	if(trans.protocol_error_gen_mode == RANDOM_PROT_ERROR) begin
        		foreach(trans.protocol_errors[j]) begin
        			timing[j] = {$random} % (frame_data.size()-1);
        			length[j] = {$random} %  5 ;
        		end
        	end
        	if(trans.protocol_error_gen_mode == DIRECTED_PROT_ERROR) begin
        	  foreach(trans.directed_protocol_errors[j]) begin
        	    timing[j] = trans.directed_protocol_errors[j].timing;
        	    length[j] = trans.directed_protocol_errors[j].length;
        	  end
          end
                    
        end
      endcase
      end
    end
  endtask : xgmii64_rx
  
endclass : xgmii64_rx_driver

`endif // XGMII64_RX_DRIVER_SV

