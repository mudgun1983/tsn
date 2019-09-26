`ifndef CPU_MONITOR__SV
`define CPU_MONITOR__SV


typedef class cpu_monitor;

class cpu_monitor_cbs extends uvm_callback;
  virtual function void trans_observed(cpu_monitor xactor,cpu_item cycle);
  endfunction:trans_observed
endclass: cpu_monitor_cbs


class cpu_monitor extends uvm_monitor;
   uvm_analysis_port#(cpu_item)    aport;
   virtual cpu_if                  vif;
   cpu_config                      cfg;

   `uvm_component_utils(cpu_monitor)

   function new(string name, uvm_component parent = null);
      super.new(name, parent);
      aport = new("aport", this);
   endfunction: new

   virtual function void build();
      super.build();
   endfunction

   virtual protected task run();
      cpu_item tr;
      super.run();

      while (1) begin
         @(vif.cpu_addr or vif.cpu_cs or vif.cpu_wr or vif.cpu_rd);
         @(negedge vif.cpu_clk iff vif.rst_n);
         if(vif.cpu_cs && vif.cpu_wr) begin
            tr = new();
            tr.kind = WRITE;
            tr.addr = vif.cpu_addr;
            tr.data = vif.cpu_data_in;
            trans_observed(tr);
            `uvm_do_callbacks(cpu_monitor,cpu_monitor_cbs,trans_observed(this,tr))
            aport.write(tr);
         end
         else if(vif.cpu_cs & vif.cpu_rd) begin
            tr = new();
            tr.kind = READ;
            tr.addr = vif.cpu_addr;
            @(vif.pck);
            @(vif.pck);
            @(vif.pck);
            @(vif.pck);
            @(vif.pck);
            @(vif.pck);
            @(vif.pck);
            @(vif.pck);
            tr.data = vif.cpu_data_out;
            trans_observed(tr);
            `uvm_do_callbacks(cpu_monitor,cpu_monitor_cbs,trans_observed(this,tr))
            aport.write(tr);
         end
      end
   endtask

   virtual protected task trans_observed(cpu_item tr);
   endtask

endclass: cpu_monitor

`endif


