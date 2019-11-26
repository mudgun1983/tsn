class  ptp_master_slave_two_step_test extends ptp_master_slave_base_test;
  
   `uvm_component_utils(ptp_master_slave_two_step_test)
   
    function new(string name="ptp_master_slave_two_step_test" ,  uvm_component parent=null);
        super.new(name,parent);
        test_port_index= 5'd6;	
		one_two_step = 1;	
        TIME_OUT_INTERVAL = 2ms;		
    endfunction : new
	 
endclass