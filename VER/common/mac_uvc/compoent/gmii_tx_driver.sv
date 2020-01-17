`ifndef GMII_TX_DRIVER_SV
`define GMII_TX_DRIVER_SV

//------------------------------------------------------------------------------
//
// CLASS: gmii_tx_driver
//
//------------------------------------------------------------------------------

class gmii_tx_driver extends mac_tx_base_driver;
  
  typedef enum {
    IPG_State,TX_PKT_State,TX_ER_State
  } state_e;
  
  protected virtual       gmii_tx_if         m_gmii_tx_if;
  protected int unsigned  gmii_tx_driver_id              ;  
  local     state_e       m_state                        ;  
  bit [7:0]               frame_data[$]                  ;

  `uvm_component_utils_begin(gmii_tx_driver)
    `uvm_field_int       (gmii_tx_driver_id , UVM_ALL_ON)
    `uvm_field_enum      (state_e,m_state   , UVM_ALL_ON)
   // `uvm_field_array_int (frame_data        , UVM_ALL_ON)
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

    gmii_tx_vif vif;
    uvm_object dummy;

    vif = null;
    if(!get_config_object("m_gmii_tx_vif", dummy, 0)) begin
      uvm_report_error("build", "no virtual interface available");
    end
    else begin
      if(!$cast(vif, dummy)) begin
        uvm_report_error("build", "virtual interface is incorrect type");
      end
      else begin
        m_gmii_tx_if = vif.m_gmii_tx_if;
      end
    end
    
    //if(!get_config_object("mac_env_static_config",dummy,0)) begin
    //	uvm_report_error("build","no value for mac_env_static_config");
    //end
    //else begin
    //	if(!$cast(static_cfg,dummy))
    //		uvm_report_error("build","static_cfg is incorrect type");
    //	end  
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
    forever begin
    	@(posedge m_gmii_tx_if.clk);
    	if(m_gmii_tx_if.reset==1'b1)
    		continue;
    	else begin
        seq_item_port.get_next_item(req);
        req.pack_bytes(req.frame_data);
//        req.print();
        gmii_tx(req);
        $cast(rsp, req.clone());
        rsp.set_id_info(req);
        seq_item_port.item_done(rsp);
      end
    end
  endtask : get_and_drive

  //--------------------------------------------------------------------
  // reset_signals
  //--------------------------------------------------------------------
  virtual protected task reset_signals();
    forever begin
      @(posedge m_gmii_tx_if.reset);
      m_gmii_tx_if.tx_en <= 1'b0;
      m_gmii_tx_if.txd   <= 8'h00;
      m_gmii_tx_if.tx_er <= 1'b0;
    end
  endtask : reset_signals

  //--------------------------------------------------------------------
  // gmii_tx
  //--------------------------------------------------------------------  
  virtual protected task gmii_tx (eth_frame trans);
    forever begin
//    if(rt_cfg.cfg_LinkEN==1'b0) begin
    if(0) begin
    	m_gmii_tx_if.tx_en <= 1'b0;
      m_gmii_tx_if.txd   <= 8'h00;
      m_gmii_tx_if.tx_er <= 1'b0;
      break;
    end
    else begin
    case(m_state)
      IPG_State : begin     	
      	repeat(trans.inter_frame_gap-2) begin
      	  @(posedge m_gmii_tx_if.clk);
      	  if(m_gmii_tx_if.reset==1'b1)
      		  return;
      	  m_gmii_tx_if.tx_en <= 1'b0;
      	  m_gmii_tx_if.txd   <= 8'h00;
      	  m_gmii_tx_if.tx_er <= 1'b0;
      	end
      	if(trans.frame_data.size()==0) begin
      		break;
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
      	for(int i=0; i<=trans.frame_data.size(); i++) begin
      		@(posedge m_gmii_tx_if.clk);
      		if(m_gmii_tx_if.reset==1'b1) begin
      			m_state          = IPG_State;
      		  return;
      		end
      		if(i==trans.frame_data.size()) begin
      			m_gmii_tx_if.tx_en <= 1'b0;
      	    m_gmii_tx_if.txd   <= 8'h00;
      	    m_gmii_tx_if.tx_er <= 1'b0;
      	    break;
      		end
      		m_gmii_tx_if.tx_en <= 1'b1;
      	  m_gmii_tx_if.tx_er <= 1'b0;
      		m_gmii_tx_if.txd   <= trans.frame_data[i];  		
      	end
      	m_state          = IPG_State;
      	break;
      end
      
      TX_ER_State : begin
      	int timing[$];
      	int length[$];
      	int j;
      	if(trans.protocol_error_gen_mode == RANDOM_PROT_ERROR) begin
      		foreach(trans.protocol_errors[j]) begin
      			timing[j] = {$random} % (trans.frame_data.size()-1);
      			length[j] = {$random} %  5 ;
      		end
      	end
      	if(trans.protocol_error_gen_mode == DIRECTED_PROT_ERROR) begin
      	  foreach(trans.directed_protocol_errors[j]) begin
      	    timing[j] = trans.directed_protocol_errors[j].timing;
      	    length[j] = trans.directed_protocol_errors[j].length;
      	  end
        end
      	for(int i=0; i<=trans.frame_data.size(); i++) begin
      		@(posedge m_gmii_tx_if.clk);
      		if(m_gmii_tx_if.reset==1'b1) begin
      			m_state          = IPG_State;
      		  return;
      		end
      		if(i==trans.frame_data.size()) begin
      			m_gmii_tx_if.tx_en <= 1'b0;
      	    m_gmii_tx_if.txd   <= 8'h00;
      	    m_gmii_tx_if.tx_er <= 1'b0;
      	    break;
      		end
      		m_gmii_tx_if.tx_en <= 1'b1;
      	  m_gmii_tx_if.txd   <= trans.frame_data[i];
      	  foreach(timing[j]) begin
      	    if((i>=timing[j])&&(i<timing[j]+length[j])) begin
      	  	  m_gmii_tx_if.tx_er <= 1'b1;
      	  	  break;
      	  	end
      	    else
      	  	  m_gmii_tx_if.tx_er <= 1'b0;
      	  	end      	  
      	end
      	m_state          = IPG_State;
      	break;
      end
      endcase
      end
    end
  endtask : gmii_tx
  
endclass : gmii_tx_driver

`endif // GMII_TX_DRIVER_SV

