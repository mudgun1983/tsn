`ifndef QBV_TEST_CASE0__SV
`define QBV_TEST_CASE0__SV
//in the case0,we aim to test that ,firstly we send one pkt,after 
//a certain time the gate open,so the pkt can send out,repeately
class qbv_test_case0 extends qbv_base_test;
	`uvm_component_utils(qbv_test_case0)
	extern function new(string name = "qbv_test_case0",uvm_component parent);
	extern virtual function set_port_stimulus_value();
	extern virtual function void build_phase(uvm_phase phase);
endclass:qbv_test_case0
function qbv_test_case0::new(string name = "qbv_test_case0",uvm_component parent);
	super.new(name,parent);
endfunction
function qbv_test_case0::set_port_stimulus_value();
    int dut_max_port;
    dut_max_port = `DUT_MAX_PORT-1;
     for(int i=0; i<20;i++)
       begin
        port_stimulus_s[i] = 0;
       end

 port_stimulus_s[source_port].port_en = 1;
 port_stimulus_s[dmac].port_en = 1;

 port_stimulus_s[dmac].packet_count = 1;  //0: forever
 port_stimulus_s[source_port].packet_count = 21;

 port_stimulus_s[source_port].sa_index = source_port;
 port_stimulus_s[dmac].sa_index = dmac;

 port_stimulus_s[source_port].da_index =  dmac;
 port_stimulus_s[dmac].da_index =  source_port;
 endfunction

 function void qbv_test_case0::build_phase(uvm_phase phase);
 	obm_dut_cfg test_cfg;
 	super.build_phase(phase);
	set_type_override_by_type(obm_dut_cfg::get_type(),obm_case0_cfg::get_type());
	/*test_cfg = obm_dut_cfg::type_id::create("test_cfg");
	test_cfg.randomize();
	`uvm_info(get_type_name(),$psprintf("start to test obm_dut_cfg"),UVM_NONE);
	test_cfg.print();*/
 endfunction:build_phase
`endif
