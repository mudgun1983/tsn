class topology_config extends uvm_object;

int mac_number = `MAX_ENV_MAC_NUM;//20;
bit [`MAX_ENV_MAC_NUM-1:0]compare_enable;
`uvm_object_utils_begin( topology_config );
`uvm_object_utils_end

function new( string name = "" );
super.new( name );
compare_enable = {`MAX_ENV_MAC_NUM{1'b1}};
endfunction

endclass

class item_config extends uvm_object;

bit [1:0]  eth_item_payload = `INCREASE_PAYLOAD;//20;
int        tagged_size = 2;
bit [2:0]  p_mac_pri;
bit        p_mac_c;
bit [15:0] p_mac_vlan[`MAX_ENV_MAC_NUM];
bit [2:0]  e_mac_pri;
bit [15:0] e_mac_vlan[`MAX_ENV_MAC_NUM];
int unsigned        packet_ipg[`MAX_ENV_MAC_NUM];
`uvm_object_utils_begin( item_config );
`uvm_object_utils_end

function new( string name = "" );
super.new( name );
foreach(packet_ipg[key])
        packet_ipg[key]=0us;
endfunction

endclass