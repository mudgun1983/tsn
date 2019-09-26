
`ifndef CPU_MASTER__SV
`define CPU_MASTER__SV

typedef class cpu_driver;
class cpu_driver_cbs extends uvm_callback;
    virtual task trans_received (cpu_driver xactor , cpu_item cycle);endtask
    virtual task trans_executed (cpu_driver xactor , cpu_item cycle);endtask
endclass

class cpu_driver extends uvm_driver#(cpu_item);
    
  virtual cpu_if            vif;
  cpu_config                cfg;

//==================== Registration ==============//
  `uvm_component_utils_begin(cpu_driver)
    `uvm_field_object   (cfg     ,UVM_ALL_ON) 
  `uvm_component_utils_end
   
//================================================//
//FUNCTION    : new
//================================================//
  function new(string name,uvm_component parent = null);
     super.new(name,parent);
  endfunction
   
//================================================//
//FUNCTION    : build
//================================================//
  virtual function void build();
    super.build();
    //if (!uvm_config_db#(virtual cpu_if)::get(this, "", "vif", vif)) begin
    //   `uvm_fatal(get_type_name(),"No virtual interface specified for this driver instance");
    //end
  endfunction

   virtual protected task run();
      super.run();
      fork
          reset_signals();
          get_and_drive();
      join
   endtask: run

   virtual protected task reset_signals();
      forever begin
          @(negedge vif.rst_n);
          this.vif.mck.cpu_addr <= 'hzzzz_zzzz;
          this.vif.mck.cpu_cs <= '0;
          this.vif.mck.cpu_wr <= '0;
          this.vif.mck.cpu_rd <= '0;
          this.vif.mck.cpu_data <= 'hzzzz_zzzz;
      end
   endtask: reset_signals
       
   virtual protected task get_and_drive();
      //this.vif.mck.cpu_addr <= $random;
      this.vif.mck.cpu_addr <= 'hzzzz_zzzz;
      this.vif.mck.cpu_cs <= '0;
      this.vif.mck.cpu_wr <= '0;
      this.vif.mck.cpu_rd <= '0;
      //this.vif.mck.cpu_data <= $random;
      this.vif.mck.cpu_data <= 'hzzzz_zzzz;

      forever begin
         cpu_item tr;
         @ (negedge vif.cpu_clk iff vif.rst_n);
         seq_item_port.get_next_item(tr);
         $cast(rsp,tr.clone());
         rsp.set_id_info(tr);
         //@ (this.vif.mck);
         this.trans_received(tr);
         `uvm_do_callbacks(cpu_driver,cpu_driver_cbs,trans_received(this,tr))
         //tr.print();
	 case (tr.kind)
           //cpu_item::READ:  this.read(tr.addr, tr.data);  
           READ:  this.read(rsp.addr, rsp.data);  
           //cpu_item::WRITE: this.write(tr.addr, tr.data);
           WRITE: this.write(tr.addr, tr.data);
         endcase
         //rsp.print();
         
         this.trans_executed(tr);
         `uvm_do_callbacks(cpu_driver,cpu_driver_cbs,trans_executed(this,tr))
         seq_item_port.put_response(rsp);
         seq_item_port.item_done();
      end
   endtask: get_and_drive

   virtual protected task read(input  bit   [31:0] addr,
                               output logic [31:0] data);

      this.vif.mck.cpu_addr <= addr;
      this.vif.mck.cpu_wr   <= '0;
      @ (this.vif.mck);
      @ (this.vif.mck);
      this.vif.mck.cpu_cs   <= '1;
      @ (this.vif.mck);
      @ (this.vif.mck);
      @ (this.vif.mck);     
      this.vif.mck.cpu_rd   <= '1;
      @ (this.vif.mck);
      this.vif.mck.cpu_rd   <= '0;
      @ (this.vif.mck);
      @ (this.vif.mck);
      @ (this.vif.mck);
      @ (this.vif.mck);
      @ (this.vif.mck);
      @ (this.vif.mck);
      @ (this.vif.mck);
      @ (this.vif.mck);
      data = this.vif.mck.cpu_data_out;
      this.vif.mck.cpu_rd   <= '0;
      this.vif.mck.cpu_cs   <= '0;
      //this.vif.mck.cpu_addr <= $random();
      this.vif.mck.cpu_addr <= 'hzzzz_zzzz;
   endtask: read

   virtual protected task write(input bit [31:0] addr,
                                input bit [31:0] data);
      this.vif.mck.cpu_addr <= addr;
      this.vif.mck.cpu_data_in <= data;
      this.vif.mck.cpu_rd   <= '0;
      @ (this.vif.mck);
      @ (this.vif.mck);
      this.vif.mck.cpu_cs   <= '1;
      @ (this.vif.mck);
      @ (this.vif.mck);
      @ (this.vif.mck);
      this.vif.mck.cpu_wr   <= '1;      
      @ (this.vif.mck);
      this.vif.mck.cpu_wr   <= '0;
      @ (this.vif.mck);   
      @ (this.vif.mck);      
      @ (this.vif.mck);
      @ (this.vif.mck);  
      @ (this.vif.mck);  
      @ (this.vif.mck);  
      @ (this.vif.mck);  
      @ (this.vif.mck);  
      this.vif.mck.cpu_cs   <= '0;
      //this.vif.mck.cpu_addr <= $random();
      this.vif.mck.cpu_addr <= 'hzzzz_zzzz;
      this.vif.mck.cpu_data_in <= 'hzzzz_zzzz;
   endtask: write

   virtual protected task trans_received(cpu_item tr);
   endtask: trans_received
 
   virtual protected task trans_executed(cpu_item tr);
   endtask
endclass: cpu_driver

`endif


