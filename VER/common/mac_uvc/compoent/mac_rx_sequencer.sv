//FILE_HEADER------------------------------------------------------------------------------------------
// ZTE  Copyright
// ZTE Company Confidential
//-----------------------------------------------------------------------------------------------------
// FILE NAME:       mac_rx_sequencer.sv
// DEPARTMENT:      Multi-Service Bearer Product ShenZhen Design&Development Dept.
// AUTHOR:          Li Xiangqiong
// AUTHOR'S EMAIL:  li.xiangqiong@zte.com.cn
//-----------------------------------------------------------------------------------------------------
// RELEASE HISTORY: N/A
// VERSION      DATE         AUTHOR       DESCRIPTION
// 1.1         2010-4-12    Li Xiangqiong   UVM
//-----------------------------------------------------------------------------------------------------
// KEYWORDS: mac_rx_sequencer
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

`ifndef MAC_RX_SEQUENCER_SV
`define MAC_RX_SEQUENCER_SV

//------------------------------------------------------------------------------
//
// CLASS: mac_rx_sequencer
//
//------------------------------------------------------------------------------

class mac_rx_sequencer extends uvm_sequencer #(eth_frame);

  protected virtual gmii_rx_if m_gmii_rx_if;

  // Transmission Id
  protected int unsigned mac_rx_sqr_id;
//  pause_if #(eth_frame)  m_pause_if;
//  RSP m_rsp;
  //uvm_seq_item_pull_port #(eth_frame) upper_seq_item_port;
  //uvm_seq_item_pull_imp #(REQ, RSP, pause_if) seq_item_export_p;
  //uvm_seq_item_pull_port #(eth_frame) lower_seq_item_port;
  uvm_put_port      #(eth_frame)      lower_put_port;
  mac_runtime_config_item rt_cfg;
  mac_env_static_config static_cfg;
  
  shortint unsigned cfg_MinFrameSize;
  shortint unsigned cfg_MaxFrameSize;
  shortint unsigned cfg_MaxJumboFrameSize;
  shortint unsigned cfg_MinIPG;
  bit  [31:0]  init_crc;
  bit  long_frame_flag;
  bit  short_frame_flag;
//  bit  pause_flag;
  bit  crc_err;
  
  bit  [47:0]  destination_address;
  bit  [47:0]  source_address;
  bit  [2:0]   priority_code_point;
  bit          canonical_format_indicator;
  bit  [11:0]  vlan_id;
  bit  [15:0]  length_type;
  byte         data[$];
//  bit  [7:0]         data[$];
  bit  [31:0]  fcs;
  int  unsigned  payload_length;
  int  unsigned  inter_frame_gap;
  byte         data_preamble[$];
  
  `uvm_sequencer_utils_begin(mac_rx_sequencer)
    `uvm_field_int(mac_rx_sqr_id, UVM_ALL_ON)
  `uvm_sequencer_utils_end

  //--------------------------------------------------------------------
  // new - constructor
  //--------------------------------------------------------------------
  function new (string name, uvm_component parent);
    super.new(name, parent);
//    m_pause_if = new("m_pause_if");
//    seq_item_export_p = new("seq_item_export_p",this);
//      lower_seq_item_port = new("lower_seq_item_port",this);
      lower_put_port      = new("lower_put_port",this);
    `uvm_update_sequence_lib_and_item(eth_frame)
  endfunction : new

  //--------------------------------------------------------------------
  // build
  //--------------------------------------------------------------------
  function void build();

    uvm_object dummy;
    if(!get_config_object("mac_env_static_config",dummy,0)) begin
    	uvm_report_error("build","no value for mac_env_static_config");
    end
    else begin
    	if(!$cast(static_cfg,dummy)) 
    		uvm_report_error("build","static_cfg is incorrect type");
    	end

    
    set_arbitration(SEQ_ARB_FIFO);
    
//    $display("mac_rx_sequencer m_leaf_name is %s",get_name());
//    $display("mac_rx_sequencer m_inst_id is %d",get_inst_id());
  endfunction : build
  
  //--------------------------------------------------------------------
  // connect
  //--------------------------------------------------------------------
//  function void connect();
//    
//  endfunction : connect
  
  //--------------------------------------------------------------------
  // run
  //--------------------------------------------------------------------
//  virtual task run();
//    fork
//      super.run();
//      get_rt_cfg();
//      //prot_process(m_rsp);
//    join
//  endtask : run
//  
//  virtual protected function void get_rt_cfg();
//    forever begin
//      
//    end
//  endfunction : get_rt_cfg
  
//  virtual protected function void prot_process(eth_frame t);
    //int num_rsps_received
    //forever begin
      //m_last_rsp_buffer.pop_front(t);
      //num_rsps_received = get_num_rsps_received();
      //wait(num_rsps_received != get_num_rsps_received());//wait put_response() completed
      //t = last_rsp();//Returns the last response item by default
//      pause_process(t);
      //crc_CHK(t);
      //long_frame_detect(t);
      //short_frame_detect(t);
    //end
//  endfunction : prot_process
  
//  virtual protected function void pause_process(eth_frame t);
//    pause_detect(t);
//    if(pause_flag) begin
    	//pause_time[0] = t.data[3];
    	//pause_time[1] = t.data[2];
//    	m_pause_if.put(m_rsp);
//    	pause_flag = 1'b0;
//    end
//  endfunction : pause_process
  
//  virtual protected function void pause_detect(eth_frame t);
//    if((t.destination_address==48'h01_80_C2_00_00_01)&&(t.length_type==16'h8808)
//    	&&(t.data[0]==8'h00)&&(t.data[1]==8'h01)&&(!crc_err))
//    	pause_flag = 1'b1;
   
//  endfunction : pause_detect


//  virtual protected function void pause_process(eth_frame t);
//    if(is_pause(t)) begin
//    	lower_put_port.put(t);
//    end
//    return;
//  endfunction : pause_process

  virtual task prot_process(eth_frame t);
    //int num_rsps_received
    //forever begin
      //m_last_rsp_buffer.pop_front(t);
      //num_rsps_received = get_num_rsps_received();
      //wait(num_rsps_received != get_num_rsps_received());//wait put_response() completed
      //t = last_rsp();//Returns the last response item by default
      data_process(t);
      pause_process(t);
      //crc_CHK(t);
      //long_frame_detect(t);
      //short_frame_detect(t);
    //end
  endtask : prot_process

  virtual task pause_process(eth_frame t);
    //$display("data_payload[0] is %z",t.data_payload[0]);
    //$display("data_payload[1] is %z",t.data_payload[1]);
    if(is_pause(t)) begin
    	$display("is pause at %t",$time);
    	lower_put_port.put(t);
    end
    return;
  endtask : pause_process
  
  function bit is_pause(eth_frame t);
    if((t.destination_address==48'h01_80_C2_00_00_01)&&(t.length_type==16'h8808)
    	&&(t.data_payload[0]==8'h00)&&(t.data_payload[1]==8'h01)&&(!crc_err))
    	return(1);
    else
      return(0);
  endfunction : is_pause
  
//  virtual protected function void long_frame_detect(eth_frame t);
//    if(t.length_type>=48'd1500)
//    	long_frame_flag <= 1'b1;
//    else
//    	long_frame_flag <= 1'b0;
//  endfunction : long_frame_detect
//  
//  virtual protected function void short_frame_detect(eth_frame t);
//    if(t.length_type>=48'd1500)
//    	short_frame_flag <= 1'b1;
//    else
//    	short_frame_flag <= 1'b0;
//  endfunction : short_frame_detect
    
  function bit is_long_frame(eth_frame t);
    return (t.length_type>=48'd1500);
  endfunction : is_long_frame
  
  function bit is_short_frame(eth_frame t);
    return (t.length_type>=48'd1500);
  endfunction : is_short_frame
  
  virtual protected function void crc_CHK(eth_frame t);
  
  endfunction : crc_CHK
  
  virtual protected function void data_process(eth_frame t);
    int i;  
    int j;
    bit SFD_flag  = 1'b0;
    bit vlan_flag = 1'b0;
    bit [15:0] bit_Frame_data;
    bit [7:0] Frame_data[];

    Frame_data = t.data_frame;  
    m_clear();
//    destination_address = 48'h0;
//    $display("Frame_data size in sqr is %0d",Frame_data.size());
//    $display("Frame_data[0] is %z",Frame_data[0]); 
//    $display("Frame_data[1] is %z",Frame_data[1]);
//    $display("Frame_data[2] is %z",Frame_data[2]);
//    $display("Frame_data[3] is %z",Frame_data[3]);
    
    for(i=0; i<=Frame_data.size-1; i++) begin
    	if((Frame_data[i]!=8'hd5)&&(!SFD_flag)) begin
//    		$display("data_process:i is %d",i);
//        $display("Frame_data[%0d] is %z",i,Frame_data[i]);
    		data_preamble[i] = Frame_data[i];
    	end
      if((Frame_data[i]==8'hd5)&&(!SFD_flag)) begin
        SFD_flag = 1'b1;
        j = i;
//        $display("j is %d",j);
      end
      if(SFD_flag) begin
//      	$display("receive the sfd");
      	if(i<=j+6) begin
//      	  destination_address[7:0] = Frame_data[j+6];
//      	  destination_address[15:8] = Frame_data[j+5];
//      	  destination_address[23:16] = Frame_data[j+4];
//      	  destination_address[31:24] = Frame_data[j+3];
//      	  destination_address[39:32] = Frame_data[j+2];
//      	  destination_address[47:40] = Frame_data[j+1];
      	    destination_address = {Frame_data[j+1],Frame_data[j+2],Frame_data[j+3],
      	  	                     Frame_data[j+4],Frame_data[j+5],Frame_data[j+6]};
      	end
      	else if(i<=j+12) begin
//      	  source_address[7:0]      = Frame_data[j+12]; 
//      	  source_address[15:8]      = Frame_data[j+11]; 
//      	  source_address[23:16]      = Frame_data[j+10]; 
//      	  source_address[31:24]      = Frame_data[j+9]; 
//      	  source_address[39:32]      = Frame_data[j+8]; 
//      	  source_address[47:40]      = Frame_data[j+7]; 
      	  source_address = {Frame_data[j+7],Frame_data[j+8],Frame_data[j+9],
      	  	                Frame_data[j+10],Frame_data[j+11],Frame_data[j+12]};
      	end  	  
      	else if((i==j+13)&&(Frame_data[i]==8'h81)&&(Frame_data[i+1]==8'h00)) 
      		vlan_flag = 1'b1;
        if(vlan_flag) begin
        	case(i)
        	j+15:   bit_Frame_data[15:8]        = Frame_data[i];
        	j+16: begin
        		      bit_Frame_data[7:0]       = Frame_data[i];
//        		      priority_code_point        = bit_Frame_data[15:13];
//        	        canonical_format_indicator = bit_Frame_data[12];
//        	        vlan_id                    = bit_Frame_data[11:0];
        	        {priority_code_point,canonical_format_indicator,vlan_id} = bit_Frame_data;
        	      end
        	j+17:   length_type[15:8]          = Frame_data[i];
        	j+18:   length_type[7:0]           = Frame_data[i];
          endcase
        	if((i>j+18)&&(i<Frame_data.size-4))
        	  data[i-j-19]      = Frame_data[i];
        end
        else begin
        	if(i==j+13)
        	  length_type[15:8] = Frame_data[i];
        	if(i==j+14)
        	  length_type[7:0]  = Frame_data[i];
        	if((i>j+14)&&(i<Frame_data.size-4))
        	  data[i-j-15]      = Frame_data[i];
        end
        case(i)
          Frame_data.size-4: fcs[31:24]     = Frame_data[i];
          Frame_data.size-3: fcs[23:16]     = Frame_data[i];
          Frame_data.size-2: fcs[15:8]      = Frame_data[i];
          Frame_data.size-1: fcs[7:0]       = Frame_data[i];          
        endcase
//        fcs = {Frame_data[Frame_data.size-4],Frame_data[Frame_data.size-3],
//        	    Frame_data[Frame_data.size-2],Frame_data[Frame_data.size-1]};
//        $display("rx fcs is %z",fcs);
      end
    end
    
    sig_map(t);
    //t.print();
  endfunction : data_process
  
  virtual protected function void sig_map(eth_frame trans);
    trans.destination_address = destination_address;
    trans.source_address      = source_address;
//    trans.vlan_tag            =
    trans.priority_code_point = priority_code_point;
    trans.canonical_format_indicator= canonical_format_indicator;
    trans.vlan_id             = vlan_id;
    trans.length_type         = length_type;
    trans.data_payload        = data;
    trans.fcs                 = fcs;
    trans.payload_length        = payload_length;
    trans.preamble.data_preamble = data_preamble;
    trans.directed_protocol_error_size = 0;
    trans.protocol_error_size          = 0;
//    trans.protocol_errors.size       = 0;
//    trans.directed_protocol_errors.size = 0;
//    trans.print();
//    trans.inter_frame_gap      = inter_frame_gap;
//    trans.direction_kind      =
//    trans.packet_kind         =
//    trans.tag_kind            =
//    trans.packet_format       =
//    trans.dest_addr_kind      =
//    trans.err_timing          =
//    trans.err_length          =
  endfunction : sig_map
  
  virtual protected function void m_clear();
    long_frame_flag     = 0;
    short_frame_flag    = 0;
    crc_err             = 0;
  
    destination_address = 0;
    source_address      = 0;
    priority_code_point = 0;
    canonical_format_indicator = 0;
    vlan_id             = 0;
    length_type         = 0;
    data.delete;
    fcs                 = 0;
    payload_length        = 0;
    inter_frame_gap     = 0;
    data_preamble.delete; 
  endfunction : m_clear
  
endclass : mac_rx_sequencer

`endif // MAC_RX_SEQUENCER_SV
