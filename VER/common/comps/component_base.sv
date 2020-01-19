class component_base #(IN_NUM = 1,OUT_NUM = 1) extends uvm_component;
	`uvm_component_utils(component_base)
	uvm_blocking_get_port #(uvm_sequence_item) in_port[IN_NUM];
	uvm_blocking_put_port #(uvm_sequence_item) out_port[OUT_NUM];
	function new(string name,uvm_component parent = null);
		super.new(name,parent);
	endfunction
	extern virtual function void build_phase(uvm_phase phase);
endclass
function void component_base::build_phase(uvm_phase phase);
	foreach(in_port[i])begin 
		in_port[i] = new($sformatf("in_port_%0d",i),this);
	end
	foreach(out_port[i])begin 
		out_port[i] = new($sformatf("out_port_%0d",i),this);
	end
endfunction
