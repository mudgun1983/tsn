class topology_config extends uvm_object;

int mac_number = `MAX_ENV_MAC_NUM;//20;

`uvm_object_utils_begin( topology_config );
`uvm_object_utils_end

function new( string name = "" );
super.new( name );
endfunction

endclass

class item_config extends uvm_object;

bit [1:0] eth_item_payload = `INCREASE_PAYLOAD;//20;

`uvm_object_utils_begin( item_config );
`uvm_object_utils_end

function new( string name = "" );
super.new( name );
endfunction

endclass