

`ifndef XGMII64_RX_MONITOR_SV
`define XGMII64_RX_MONITOR_SV

//------------------------------------------------------------------------------
//
// CLASS: xgmii64_rx_monitor
//
//------------------------------------------------------------------------------

class xgmii64_rx_monitor extends mac_rx_base_monitor;

  typedef enum {
    IPG_State,Frame_State
  } state_e;  
  local state_e     m_state;
  
  protected virtual       xgmii64_rx_if         m_xgmii64_rx_if;
  protected int unsigned  xgmii64_rx_monitor_id; 
  protected event         cov_transaction;
  
//  covergroup cov_trans @cov_transaction;
//    option.per_instance = 1;
//    trans_data_size : coverpoint trans_collected[0].frame_data.size() {
//    	bins min_size    = {64};
//      bins other_sizes = {[65:1517]};
//      bins max_size    = {1518};
////      bins max_size    = {512};//only for questasim simulation
////      illegal_bins invalid_sizes = default; 
//    }
//  endgroup : cov_trans
  
  `uvm_component_utils(xgmii64_rx_monitor)
  
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
    super.build();
    // xgmii64_rx_vif vif;
    // uvm_object dummy;

    // vif = null;
    // if(!get_config_object("m_xgmii64_rx_vif", dummy, 0)) begin
      // uvm_report_error("build", "no virtual interface available");
    // end
    // else begin
      // if(!$cast(vif, dummy)) begin
        // uvm_report_error("build", "virtual interface is incorrect type");
      // end
      // else begin
        // m_xgmii64_rx_if = vif.m_xgmii64_rx_if;
      // end
    // end
    
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
  
  function void start_of_simulation();
    m_state = IPG_State;
  endfunction
  
  virtual protected task collect_trans();
   
    bit          rx_er[$];
    int unsigned ipg_cnt   = 0;
    
    trans_collected[0] = new();
    mac_rx_data_que[0] = new();
    forever begin
      @(posedge m_xgmii64_rx_if.clk);
      if(m_xgmii64_rx_if.reset == 1'b1)
    		continue;
      case(m_state)
        IPG_State: begin
        	if(m_xgmii64_rx_if.rxc==8'hFF && m_xgmii64_rx_if.rxd==64'h0707_0707_0707_0707)
            ipg_cnt++;
          else if((m_xgmii64_rx_if.rxc[0]==1'b1)&&(m_xgmii64_rx_if.rxd[7:0]==8'hFB)) begin//Start
//          	$display("IPG_state transfer at %t",$time);
          	m_state = Frame_State;
          	trans_collected[0].inter_frame_gap = ipg_cnt*8;//???not precision
          	ipg_cnt = 0;
          	mac_rx_data_que[0].data.push_back(8'h55);//The first frame data
          	mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[15: 8]);
          	mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[23:16]);
          	mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[31:24]);
          	mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[39:32]);
          	mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[47:40]);
          	mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[55:48]);
          	mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[63:56]);
          	if(m_xgmii64_rx_if.rxc[1]==1'b1 && m_xgmii64_rx_if.rxd[15: 8]==8'hFE)
        	    rx_er.push_back(1'b1);
        	  if(m_xgmii64_rx_if.rxc[2]==1'b1 && m_xgmii64_rx_if.rxd[23:16]==8'hFE)
        	    rx_er.push_back(1'b1);
        	  if(m_xgmii64_rx_if.rxc[3]==1'b1 && m_xgmii64_rx_if.rxd[31:24]==8'hFE)
        	    rx_er.push_back(1'b1);
        	  if(m_xgmii64_rx_if.rxc[4]==1'b1 && m_xgmii64_rx_if.rxd[39:32]==8'hFE)
        	    rx_er.push_back(1'b1);
        	  if(m_xgmii64_rx_if.rxc[5]==1'b1 && m_xgmii64_rx_if.rxd[47:40]==8'hFE)
        	    rx_er.push_back(1'b1);
        	  if(m_xgmii64_rx_if.rxc[6]==1'b1 && m_xgmii64_rx_if.rxd[55:48]==8'hFE)
        	    rx_er.push_back(1'b1);
        	  if(m_xgmii64_rx_if.rxc[7]==1'b1 && m_xgmii64_rx_if.rxd[63:56]==8'hFE)
        	    rx_er.push_back(1'b1);
        	end
        	else if((m_xgmii64_rx_if.rxc[4:0]==5'h1F)&&(m_xgmii64_rx_if.rxd[39:32]==8'hFB)) begin
//          	$display("IPG_state transfer at %t",$time);
          	m_state = Frame_State;
          	trans_collected[0].inter_frame_gap = ipg_cnt*8+4;//???not precision
          	ipg_cnt = 0;
          	mac_rx_data_que[0].data.push_back(8'h55);//The first frame data
          	mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[47:40]);
          	mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[55:48]);
          	mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[63:56]);
          	if(m_xgmii64_rx_if.rxc[5]==1'b1 && m_xgmii64_rx_if.rxd[47:40]==8'hFE)
        	    rx_er.push_back(1'b1);
        	  if(m_xgmii64_rx_if.rxc[6]==1'b1 && m_xgmii64_rx_if.rxd[55:48]==8'hFE)
        	    rx_er.push_back(1'b1);
        	  if(m_xgmii64_rx_if.rxc[7]==1'b1 && m_xgmii64_rx_if.rxd[63:56]==8'hFE)
        	    rx_er.push_back(1'b1);
          end
        end
          
        Frame_State: begin
        	if( (m_xgmii64_rx_if.rxc[0]==1'b1 && m_xgmii64_rx_if.rxd[ 7: 0]==8'hFD) ||
        		  (m_xgmii64_rx_if.rxc[1]==1'b1 && m_xgmii64_rx_if.rxd[15: 8]==8'hFD) ||
        		  (m_xgmii64_rx_if.rxc[2]==1'b1 && m_xgmii64_rx_if.rxd[23:16]==8'hFD) ||
        		  (m_xgmii64_rx_if.rxc[3]==1'b1 && m_xgmii64_rx_if.rxd[31:24]==8'hFD) ||
        		  (m_xgmii64_rx_if.rxc[4]==1'b1 && m_xgmii64_rx_if.rxd[39:32]==8'hFD) ||
        		  (m_xgmii64_rx_if.rxc[5]==1'b1 && m_xgmii64_rx_if.rxd[47:40]==8'hFD) ||
        		  (m_xgmii64_rx_if.rxc[6]==1'b1 && m_xgmii64_rx_if.rxd[55:48]==8'hFD) ||
        		  (m_xgmii64_rx_if.rxc[7]==1'b1 && m_xgmii64_rx_if.rxd[63:56]==8'hFD) ) begin//Terminate
//        		$display("Frame_state transfer at %t",$time);
        		if(m_xgmii64_rx_if.rxc[1]==1'b1 && m_xgmii64_rx_if.rxd[15:8]==8'hFD) begin
        			mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[7:0]);
        		  if(m_xgmii64_rx_if.rxc[0]==1'b1 && m_xgmii64_rx_if.rxd[ 7: 0]==8'hFE)
        	      rx_er.push_back(1'b1);
        		end
        	  else if(m_xgmii64_rx_if.rxc[2]==1'b1 && m_xgmii64_rx_if.rxd[23:16]==8'hFD) begin
        	    mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[ 7: 0]);
          	  mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[15: 8]);
          	  if(m_xgmii64_rx_if.rxc[0]==1'b1 && m_xgmii64_rx_if.rxd[ 7: 0]==8'hFE)
        	      rx_er.push_back(1'b1);
          	  if(m_xgmii64_rx_if.rxc[1]==1'b1 && m_xgmii64_rx_if.rxd[15: 8]==8'hFE)
        	      rx_er.push_back(1'b1);
        	  end
        	  else if(m_xgmii64_rx_if.rxc[3]==1'b1 && m_xgmii64_rx_if.rxd[31:24]==8'hFD) begin
        	    mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[ 7: 0]);
          	  mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[15: 8]);
          	  mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[23:16]);
          	  if(m_xgmii64_rx_if.rxc[0]==1'b1 && m_xgmii64_rx_if.rxd[ 7: 0]==8'hFE)
        	      rx_er.push_back(1'b1);
          	  if(m_xgmii64_rx_if.rxc[1]==1'b1 && m_xgmii64_rx_if.rxd[15: 8]==8'hFE)
        	      rx_er.push_back(1'b1);
        	    if(m_xgmii64_rx_if.rxc[2]==1'b1 && m_xgmii64_rx_if.rxd[23:16]==8'hFE)
        	      rx_er.push_back(1'b1);
        	  end
        	  else if(m_xgmii64_rx_if.rxc[4]==1'b1 && m_xgmii64_rx_if.rxd[39:32]==8'hFD) begin
        	    mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[ 7: 0]);
          	  mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[15: 8]);
          	  mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[23:16]);
          	  mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[31:24]);
          	  if(m_xgmii64_rx_if.rxc[0]==1'b1 && m_xgmii64_rx_if.rxd[ 7: 0]==8'hFE)
        	      rx_er.push_back(1'b1);
          	  if(m_xgmii64_rx_if.rxc[1]==1'b1 && m_xgmii64_rx_if.rxd[15: 8]==8'hFE)
        	      rx_er.push_back(1'b1);
        	    if(m_xgmii64_rx_if.rxc[2]==1'b1 && m_xgmii64_rx_if.rxd[23:16]==8'hFE)
        	      rx_er.push_back(1'b1);
        	    if(m_xgmii64_rx_if.rxc[3]==1'b1 && m_xgmii64_rx_if.rxd[31:24]==8'hFE)
        	      rx_er.push_back(1'b1);
        	  end
        	  else if(m_xgmii64_rx_if.rxc[5]==1'b1 && m_xgmii64_rx_if.rxd[47:40]==8'hFD) begin
        	    mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[ 7: 0]);
          	  mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[15: 8]);
          	  mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[23:16]);
          	  mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[31:24]);
          	  mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[39:32]);
          	  if(m_xgmii64_rx_if.rxc[0]==1'b1 && m_xgmii64_rx_if.rxd[ 7: 0]==8'hFE)
        	      rx_er.push_back(1'b1);
          	  if(m_xgmii64_rx_if.rxc[1]==1'b1 && m_xgmii64_rx_if.rxd[15: 8]==8'hFE)
        	      rx_er.push_back(1'b1);
        	    if(m_xgmii64_rx_if.rxc[2]==1'b1 && m_xgmii64_rx_if.rxd[23:16]==8'hFE)
        	      rx_er.push_back(1'b1);
        	    if(m_xgmii64_rx_if.rxc[3]==1'b1 && m_xgmii64_rx_if.rxd[31:24]==8'hFE)
        	      rx_er.push_back(1'b1);
        	    if(m_xgmii64_rx_if.rxc[4]==1'b1 && m_xgmii64_rx_if.rxd[39:32]==8'hFE)
        	      rx_er.push_back(1'b1);
        	  end
        	  else if(m_xgmii64_rx_if.rxc[6]==1'b1 && m_xgmii64_rx_if.rxd[55:48]==8'hFD) begin
        	    mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[ 7: 0]);
          	  mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[15: 8]);
          	  mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[23:16]);
          	  mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[31:24]);
          	  mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[39:32]);
          	  mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[47:40]);
          	  if(m_xgmii64_rx_if.rxc[0]==1'b1 && m_xgmii64_rx_if.rxd[ 7: 0]==8'hFE)
        	      rx_er.push_back(1'b1);
          	  if(m_xgmii64_rx_if.rxc[1]==1'b1 && m_xgmii64_rx_if.rxd[15: 8]==8'hFE)
        	      rx_er.push_back(1'b1);
        	    if(m_xgmii64_rx_if.rxc[2]==1'b1 && m_xgmii64_rx_if.rxd[23:16]==8'hFE)
        	      rx_er.push_back(1'b1);
        	    if(m_xgmii64_rx_if.rxc[3]==1'b1 && m_xgmii64_rx_if.rxd[31:24]==8'hFE)
        	      rx_er.push_back(1'b1);
        	    if(m_xgmii64_rx_if.rxc[4]==1'b1 && m_xgmii64_rx_if.rxd[39:32]==8'hFE)
        	      rx_er.push_back(1'b1);
        	    if(m_xgmii64_rx_if.rxc[5]==1'b1 && m_xgmii64_rx_if.rxd[47:40]==8'hFE)
        	      rx_er.push_back(1'b1);
        	  end
        	  else if(m_xgmii64_rx_if.rxc[7]==1'b1 && m_xgmii64_rx_if.rxd[63:56]==8'hFD) begin
        	    mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[ 7: 0]);
          	  mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[15: 8]);
          	  mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[23:16]);
          	  mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[31:24]);
          	  mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[39:32]);
          	  mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[47:40]);
          	  mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[55:48]);
          	  if(m_xgmii64_rx_if.rxc[0]==1'b1 && m_xgmii64_rx_if.rxd[ 7: 0]==8'hFE)
        	      rx_er.push_back(1'b1);
          	  if(m_xgmii64_rx_if.rxc[1]==1'b1 && m_xgmii64_rx_if.rxd[15: 8]==8'hFE)
        	      rx_er.push_back(1'b1);
        	    if(m_xgmii64_rx_if.rxc[2]==1'b1 && m_xgmii64_rx_if.rxd[23:16]==8'hFE)
        	      rx_er.push_back(1'b1);
        	    if(m_xgmii64_rx_if.rxc[3]==1'b1 && m_xgmii64_rx_if.rxd[31:24]==8'hFE)
        	      rx_er.push_back(1'b1);
        	    if(m_xgmii64_rx_if.rxc[4]==1'b1 && m_xgmii64_rx_if.rxd[39:32]==8'hFE)
        	      rx_er.push_back(1'b1);
        	    if(m_xgmii64_rx_if.rxc[5]==1'b1 && m_xgmii64_rx_if.rxd[47:40]==8'hFE)
        	      rx_er.push_back(1'b1);
        	    if(m_xgmii64_rx_if.rxc[6]==1'b1 && m_xgmii64_rx_if.rxd[55:48]==8'hFE)
        	      rx_er.push_back(1'b1);
        	  end
        		m_state = IPG_State;
        		trans_collected[0].frame_data = mac_rx_data_que[0].data;
        		mac_rx_data_que[0].data.delete();
        		if(rx_er.size() == 0)
        			trans_collected[0].protocol_error_mode = NO_PROT_ERROR;
        		else if(rx_er.size() == 1)
        			trans_collected[0].protocol_error_mode = SINGLE_PROT_ERROR_KIND;
        		else 
        			trans_collected[0].protocol_error_mode = MULTI_PROT_ERROR_KIND;	
        		rx_er.delete();
        		trans_collected[0].port_num = 0;
        		trans_collected[0].unpack_bytes(trans_collected[0].frame_data);
//        		trans_collected[0].print();
      	    ->cov_transaction;
//      	    trans_collected[0].print();
      	    item_collected_port.write(trans_collected[0]);
      	    trans_collected[0] = new();
        	end
        	else begin
        	  mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[ 7: 0]);
          	mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[15: 8]);
          	mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[23:16]);
          	mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[31:24]);
          	mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[39:32]);
          	mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[47:40]);
          	mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[55:48]);
          	mac_rx_data_que[0].data.push_back(m_xgmii64_rx_if.rxd[63:56]);
          	if(m_xgmii64_rx_if.rxc[0]==1'b1 && m_xgmii64_rx_if.rxd[ 7: 0]==8'hFE)
        	    rx_er.push_back(1'b1);
          	if(m_xgmii64_rx_if.rxc[1]==1'b1 && m_xgmii64_rx_if.rxd[15: 8]==8'hFE)
        	    rx_er.push_back(1'b1);
        	  if(m_xgmii64_rx_if.rxc[2]==1'b1 && m_xgmii64_rx_if.rxd[23:16]==8'hFE)
        	    rx_er.push_back(1'b1);
        	  if(m_xgmii64_rx_if.rxc[3]==1'b1 && m_xgmii64_rx_if.rxd[31:24]==8'hFE)
        	    rx_er.push_back(1'b1);
        	  if(m_xgmii64_rx_if.rxc[4]==1'b1 && m_xgmii64_rx_if.rxd[39:32]==8'hFE)
        	    rx_er.push_back(1'b1);
        	  if(m_xgmii64_rx_if.rxc[5]==1'b1 && m_xgmii64_rx_if.rxd[47:40]==8'hFE)
        	    rx_er.push_back(1'b1);
        	  if(m_xgmii64_rx_if.rxc[6]==1'b1 && m_xgmii64_rx_if.rxd[55:48]==8'hFE)
        	    rx_er.push_back(1'b1);
        	  if(m_xgmii64_rx_if.rxc[7]==1'b1 && m_xgmii64_rx_if.rxd[63:56]==8'hFE)
        	    rx_er.push_back(1'b1);
        	end

        end
      endcase 
    end
  endtask : collect_trans
  
endclass : xgmii64_rx_monitor

`endif // XGMII64_RX_MONITOR_SV

