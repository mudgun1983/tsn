//FILE_HEADER------------------------------------------------------------------------------------------
// ZTE  Copyright
// ZTE Company Confidential
//-----------------------------------------------------------------------------------------------------
// FILE NAME:       mac_env.sv
// DEPARTMENT:      Multi-Service Bearer Product ShenZhen Design&Development Dept.
// AUTHOR:          Li Xiangqiong
// AUTHOR'S EMAIL:  li.xiangqiong@zte.com.cn
//-----------------------------------------------------------------------------------------------------
// RELEASE HISTORY: N/A
// VERSION      DATE         AUTHOR       DESCRIPTION
// 1.1         2011-9-20    Li Xiangqiong   UVM
//-----------------------------------------------------------------------------------------------------
// KEYWORDS: mac_env
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

`ifndef MAC_ENV_SV
`define MAC_ENV_SV

//------------------------------------------------------------------------------
//
// CLASS: mac_env
//
//------------------------------------------------------------------------------

class mac_env extends uvm_env;
  
  typedef mac_env          this_type     ;
  
  //mac_env_static_config    static_cfg    ;
  //mac_runtime_config_item  runtime_cfg   ;
  
  mac_tx_agent             mac_tx_agent0 ;
  mac_rx_agent             mac_rx_agent0 ;
  
  //bit                      tx_ena        ;
  //bit                      rx_ena        ;
  //bit                      tx_sqr_is_hier;
  //bit                      rx_sqr_is_hier;
  
  `uvm_component_utils_begin(mac_env)
    //`uvm_field_object  (static_cfg    ,  UVM_ALL_ON)
    //`uvm_field_object  (runtime_cfg   ,  UVM_ALL_ON)
    `uvm_field_object  (mac_tx_agent0 ,  UVM_ALL_ON)
    `uvm_field_object  (mac_rx_agent0 ,  UVM_ALL_ON)
    //`uvm_field_int     (tx_ena        ,  UVM_ALL_ON)
    //`uvm_field_int     (rx_ena        ,  UVM_ALL_ON)
    //`uvm_field_int     (tx_sqr_is_hier,  UVM_ALL_ON)
    //`uvm_field_int     (rx_sqr_is_hier,  UVM_ALL_ON)
  `uvm_component_utils_end
  
  //uvm_analysis_imp #(runtime_config_item,this_type) cfg_imp_port;
  
  function new(string name ,  uvm_component parent=null);
    super.new(name,parent);
    //static_cfg   = new();
    //runtime_cfg  = new();       
    //cfg_imp_port = new("cfg_imp_port", this);       
  endfunction : new
  
  function void build();
    //uvm_object dummy;
    //if(!get_config_object("mac_env_static_config",dummy,0)) begin
    //	uvm_report_error("build","no value for mac_env_static_config");
    //end
    //else begin
    //	if(!$cast(static_cfg,dummy))
    //		uvm_report_error("build","static_cfg is incorrect type");
    //	else begin
    //		tx_ena         = static_cfg.tx_ena;
    //		rx_ena         = static_cfg.rx_ena;
    //		tx_sqr_is_hier = static_cfg.tx_sqr_is_hier;
    //		rx_sqr_is_hier = static_cfg.rx_sqr_is_hier;
    //	end
    //end
    //if(tx_ena)	
      mac_tx_agent0 = mac_tx_agent::type_id::create("mac_tx_agent0",this);
    //if(rx_ena)
      mac_rx_agent0 = mac_rx_agent::type_id::create("mac_rx_agent0",this);    
  endfunction : build
  
  //function void connect();  
  //  if(tx_ena) begin
  //  	mac_tx_agent0.rt_cfg           = runtime_cfg;
  //  	mac_tx_agent0.monitor.rt_cfg   = runtime_cfg;
  //  	if((static_cfg.tx_is_active == UVM_ACTIVE)&&(tx_sqr_is_hier == 1'b0))
  //  	  mac_tx_agent0.driver.rt_cfg  = runtime_cfg;    	
  //  end  
  //  if(rx_ena) begin
  //  	mac_rx_agent0.rt_cfg           = runtime_cfg;
  //  	mac_rx_agent0.monitor.rt_cfg   = runtime_cfg;
  //  	if((static_cfg.rx_is_active == UVM_ACTIVE)&&(rx_sqr_is_hier == 1'b0))        
  //      mac_rx_agent0.driver.rt_cfg  = runtime_cfg;    
  //  end   
  //endfunction : connect
  //
  //virtual function void write(input runtime_config_item  t);//implement of the cfg_imp_port;
  //   runtime_cfg.copy(t);   
  //endfunction

endclass

`endif // MAC_ENV_SV
