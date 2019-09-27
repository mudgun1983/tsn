

`ifndef GMII_RX_MONITOR_SV
`define GMII_RX_MONITOR_SV

//------------------------------------------------------------------------------
//
// CLASS: gmii_rx_monitor
//
//------------------------------------------------------------------------------

class gmii_rx_monitor extends mac_rx_base_monitor;

  typedef enum {
    IPG_State,Frame_State
  } state_e;  
  local state_e     m_state;
  
  protected virtual       gmii_rx_if         m_gmii_rx_if;
  protected int unsigned  gmii_rx_monitor_id; 
  protected event         cov_transaction;
  
  covergroup cov_trans @cov_transaction;
    option.per_instance = 1;
    trans_data_size : coverpoint trans_collected[0].frame_data.size() {
    	bins min_size    = {64};
      bins other_sizes = {[65:1517]};
      bins max_size    = {1518};
//      bins max_size    = {512};//only for questasim simulation
//      illegal_bins invalid_sizes = default; 
    }
  endgroup : cov_trans
  
  `uvm_component_utils(gmii_rx_monitor)
  
  //--------------------------------------------------------------------
  // new - constructor
  //--------------------------------------------------------------------
  function new (string name, uvm_component parent);
    super.new(name, parent);
    cov_trans=new();
  endfunction : new

  //--------------------------------------------------------------------
  // build
  //--------------------------------------------------------------------
  function void build();
//
//    gmii_rx_vif vif;
//    uvm_object dummy;
//
//    vif = null;
//    if(!get_config_object("m_gmii_rx_vif", dummy, 0)) begin
//      uvm_report_error("build", "no virtual interface available");
//    end
//    else begin
//      if(!$cast(vif, dummy)) begin
//        uvm_report_error("build", "virtual interface is incorrect type");
//      end
//      else begin
//        m_gmii_rx_if = vif.m_gmii_rx_if;
//      end
//    end
   if(!uvm_config_db#(virtual gmii_rx_if)::get(this, "", "m_gmii_rx_if", m_gmii_rx_if)) begin
         `uvm_fatal(get_type_name(),"=============No virtual interface specified for this driver instance==========");
      end
         
    //if(!get_config_object("mac_env_static_config",dummy,0)) begin
    //	uvm_report_error("build","no value for mac_env_static_config");
    //end
    //else begin
    //	if(!$cast(static_cfg,dummy))
    //		uvm_report_error("build","static_cfg is incorrect type");
    //	end  
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
      @(posedge m_gmii_rx_if.clk);
      if(m_gmii_rx_if.reset == 1'b1)
    		continue;
      case(m_state)
        IPG_State: begin
          ipg_cnt++;
          if(m_gmii_rx_if.rx_dv == 1'b1) begin
//          	$display("IPG_state transfer at %t",$time);
          	m_state = Frame_State;
          	trans_collected[0].inter_frame_gap = ipg_cnt;
          	ipg_cnt = 0;
          	mac_rx_data_que[0].data.push_back(m_gmii_rx_if.rxd);//The first frame data
          	if(m_gmii_rx_if.rx_er == 1'b1)
        	    rx_er.push_back(1'b1);
          end
        end
          
        Frame_State: begin
        	if(m_gmii_rx_if.rx_dv == 1'b1) begin
          	mac_rx_data_que[0].data.push_back(m_gmii_rx_if.rxd);
        	  if(m_gmii_rx_if.rx_er == 1'b1)
        	    rx_er.push_back(1'b1);
          end
        	else begin
//        		$display("Frame_state transfer at %t",$time);
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
        		//trans_collected[0].print();
        		`uvm_info(get_type_name(),{$psprintf("get exp eth_frame_exp_trans:\n"),trans_collected[0].sprint()},UVM_LOW);
      	    ->cov_transaction;
      	    item_collected_port.write(trans_collected[0]);
      	    trans_collected[0] = new();
        	end
        end
      endcase 
    end
  endtask : collect_trans
  
endclass : gmii_rx_monitor

`endif // GMII_RX_MONITOR_SV

