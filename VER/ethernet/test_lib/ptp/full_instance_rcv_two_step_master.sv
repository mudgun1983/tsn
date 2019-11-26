class  full_instance_rcv_two_step_master extends full_instance_rcv_one_step_master;
 
   `uvm_component_utils(full_instance_rcv_two_step_master)
    
    function new(string name="full_instance_rcv_two_step_master" ,  uvm_component parent=null);
        super.new(name,parent);
        test_port_index= 5'd7;	
        TIME_OUT_INTERVAL = 10ms;		
		one_two_step=1;
     endfunction : new



endclass	 