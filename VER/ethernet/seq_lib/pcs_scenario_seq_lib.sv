
`ifndef PCS_SCENARIO_SEQ_LIB_SV
`define PCS_SCENARIO_SEQ_LIB_SV


//------------------------------------------------------------------------------
//
// CLASS: XXXX
//
//------------------------------------------------------------------------------
class scenario_reg_test extends uvm_sequence;

//==================== Attribute =================//
mac_user_sequence mac_seq;

bit [47:0] local_da_cnt;
bit [47:0] local_sa_cnt;
topology_config       topology_config0;
item_config           item_config0;
string scope_name = "";

//==================== Registration ==============//
`uvm_sequence_utils(scenario_reg_test, pcs_virtual_sequencer)
//==================== Registration ==============//

//================================================//
//FUNCTION    : new
//DESCRIPTION : construct
//================================================//
    function new (string name = "scenario_reg_test");               
        super.new();   
    endfunction:new

 virtual task pre_body();/*{{{*/
       uvm_test_done.raise_objection(this);
       `uvm_info(get_type_name(),"[START_SEQUENCE]",UVM_LOW)
  endtask : pre_body

  virtual task post_body();
      uvm_test_done.drop_objection(this);
      `uvm_info(get_type_name(),"[STOP_SEQUENCE]",UVM_LOW)
  endtask : post_body
  
//================================================//
//TASK        : body
//DESCRIPTION : construct
//================================================//
   virtual task body();
        begin
  
        if( scope_name == "" ) begin
        scope_name = get_full_name(); // this is {       sequencer.get_full_name() , get_name() }
        end

        if( !uvm_config_db #( topology_config )::get( null , scope_name ,
        "topology_config" , topology_config0 ) ) begin
        `uvm_fatal(get_type_name(),"=============NO topology_config==========");
        end
		
	    if( !uvm_config_db #( item_config )::get( null , scope_name ,
        "item_config" , item_config0 ) ) begin
        `uvm_fatal(get_type_name(),"=============NO item_config==========");
        end   
        end
		
		`uvm_info(get_type_name(),{$psprintf("item_config0.e_mac_vlan=%0h ,p_mac_vlan=%0h \n",item_config0.e_mac_vlan,item_config0.p_mac_vlan)},UVM_HIGH);
      endtask    
endclass




`endif // LABEL_FRAME_SV
