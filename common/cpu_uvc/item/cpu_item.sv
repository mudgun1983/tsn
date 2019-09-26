
typedef enum {READ, WRITE} kind_e;

class cpu_item extends uvm_sequence_item;
  
   rand bit   [31:0] addr;
   rand logic [31:0] data;
   rand kind_e kind;  
 
   `uvm_object_utils_begin(cpu_item)
     `uvm_field_int(addr, UVM_ALL_ON | UVM_NOPACK);
     `uvm_field_int(data, UVM_ALL_ON | UVM_NOPACK);
     `uvm_field_enum(kind_e,kind, UVM_ALL_ON | UVM_NOPACK);
   `uvm_object_utils_end
   
   function new (string name = "cpu_item");
      super.new(name);
   endfunction

   function string convert2string();
     return $sformatf("kind=%s addr=%0h data=%0h",kind,addr,data);
   endfunction

endclass: cpu_item


//class reg2cpu_adapter extends uvm_reg_adapter;
//
//  `uvm_object_utils(reg2cpu_adapter)
//
//   function new(string name = "reg2cpu_adapter");
//      super.new(name);
//   endfunction 
//
//  virtual function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
//    cpu_item cpu = cpu_item::type_id::create("cpu_item");
//    //cpu.kind = (rw.kind == UVM_READ) ? cpu_item::READ : cpu_item::WRITE;
//    cpu.kind = (rw.kind == UVM_READ) ? READ : WRITE;
//    cpu.addr = rw.addr;
//    //if(cpu.kind == cpu_item::WRITE)
//    if(cpu.kind == WRITE)
//      cpu.data = rw.data;
//    return cpu;
//  endfunction
//
//  virtual function void bus2reg(uvm_sequence_item bus_item,
//                                ref uvm_reg_bus_op rw);
//    cpu_item cpu;
//    if (!$cast(cpu,bus_item)) begin
//      `uvm_fatal("NOT_CPU_TYPE","Provided bus_item is not of the correct type")
//      return;
//    end
//    //rw.kind = (cpu.kind == cpu_item::READ) ? UVM_READ : UVM_WRITE;
//    rw.kind = (cpu.kind == READ) ? UVM_READ : UVM_WRITE;
//    rw.addr = cpu.addr;
//    rw.data = cpu.data;
//    rw.status = UVM_IS_OK;
//  endfunction
//
//endclass
