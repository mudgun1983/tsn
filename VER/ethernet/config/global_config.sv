class topology_config extends uvm_object;

int mac_number = 20;

`uvm_object_utils_begin( topology_config );
`uvm_object_utils_end

function new( string name = "" );
super.new( name );
endfunction

endclass