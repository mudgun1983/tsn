
`ifndef CPU_AGENT__SV
`define CPU_AGENT__SV


typedef class cpu_agent;


class cpu_agent extends uvm_agent;
   
   uvm_analysis_port #(cpu_item)   aport;///< Aport hand to monitor.aport
   virtual cpu_if                  vif;

   cpu_sequencer                   sequencer;
   cpu_driver                      driver;
   cpu_monitor                     monitor;

   `uvm_component_utils_begin(cpu_agent)
      `uvm_field_object(sequencer, UVM_ALL_ON)
      `uvm_field_object(driver, UVM_ALL_ON)
      `uvm_field_object(monitor, UVM_ALL_ON)
   `uvm_component_utils_end
   
   function new(string name, uvm_component parent = null);
      super.new(name, parent);
   endfunction: new

   virtual function void build();
      super.build();
      sequencer = cpu_sequencer::type_id::create("sequencer", this);
      driver = cpu_driver::type_id::create("driver", this);
      monitor = cpu_monitor::type_id::create("monitor", this);
      
      if(!uvm_config_db#(virtual cpu_if)::get(this, "", "vif", vif)) begin
         `uvm_fatal(get_type_name(),"=============No virtual interface specified for this driver instance==========");
      end
   endfunction: build

   virtual function void connect();
      super.connect();
      if(vif!=null) begin
         driver.vif = vif;
         monitor.vif = vif;
      end
      driver.seq_item_port.connect(sequencer.seq_item_export);
      this.aport = monitor.aport;
   endfunction: connect 

endclass: cpu_agent

`endif
