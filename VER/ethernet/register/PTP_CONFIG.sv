class PTP_CONFIG_CONTENT extends uvm_object;
parameter [15:0]     VLAN_VALUE0 = 16'd500;
sys_item sys_trans;
ptp_item ptp_trans;
eth_frame_simplify eth_trans;
bit [15:0] packed_data[$];

`uvm_object_utils_begin( PTP_CONFIG_CONTENT );
`uvm_object_utils_end


function new( string name = "" );
super.new( name );
sys_trans = new();
ptp_trans = new();
eth_trans = new();
predefine_sys_trans();
predefine_ptp_trans();
predefine_eth_trans();
pack();
endfunction

function predefine_sys_trans();
   if ( !(sys_trans.randomize() with {sys_trans.pckt_type == 4'b1001;} )) 
        begin
		 `uvm_error(get_type_name, "Randomize Failed!") 
		end
    sys_trans.pack_bytes(sys_trans.frame_data);
endfunction

function predefine_ptp_trans();
   if ( !(ptp_trans.randomize() with {ptp_trans.packet_type == ptp_item::Sync;} )) 
        begin
		 `uvm_error(get_type_name, "Randomize Failed!") 
		end
    ptp_trans.pack_bytes(ptp_trans.frame_data);
	
endfunction

function predefine_eth_trans();
  eth_trans.tagged_data[1].c_data_length.constraint_mode(0);
  if ( !(eth_trans.randomize() with {eth_trans.destination_address    == 48'h01_1b_19_00_00_00;
                                     eth_trans.tagged_data_size             == 2    ;//  
                   	                 eth_trans.tagged_data[0].vlan_tag_kind == eth_tagged_data::VLAN_TAG; 					                 
                   	                 {
                   	                  eth_trans.tagged_data[0].data[0] == VLAN_VALUE0[15:8] ;
                                      eth_trans.tagged_data[0].data[1] == VLAN_VALUE0[7:0] ;
                   	                 }
                   	                 eth_trans.tagged_data[1].max_data_len  == 1518   ;//p_sequencer.static_cfg.cfg_max_tagged_data_len;
                                     eth_trans.tagged_data[1].min_data_len  == 46 ;//p_sequencer.static_cfg.cfg_min_tagged_data_len; 
                                     
                   	                 eth_trans.tagged_data[1].data_tag_kind == eth_tagged_data::DATA_TAG;  
					                 eth_trans.tagged_data[1].data_length   == ptp_trans.frame_data.size();
                   	                 eth_trans.tagged_data[1].tpid   == 16'h88F7;
									 foreach(eth_trans.tagged_data[1].data[key])   
                                      {eth_trans.tagged_data[1].data[key]==ptp_trans.frame_data[key];
                                      }
					                } )) 
        begin
		 `uvm_error(get_type_name, "Randomize Failed!") 
		end
		
	eth_trans.pack_bytes(eth_trans.frame_data);	
endfunction

function pack();
  int tmp_size;
  bit [7:0] packed_data_tmp[];
  packed_data_tmp = {sys_trans.frame_data,
                     eth_trans.frame_data};
  
  tmp_size = packed_data_tmp.size();  
  for(int i=0;i<(tmp_size)/2;i++)
    begin
	  if((i+1)>tmp_size)
	    packed_data[i/2]={8'h0,packed_data_tmp[i]};  
	  else
	    packed_data[i/2]={packed_data_tmp[i+1],packed_data_tmp[i]};  // packed_data[7:0] = packed_data_tmp[0]; packed_data[15:8] = packed_data_tmp[1];
	end
	
endfunction
endclass

class PTP_CONFIG extends uvm_object;

`uvm_object_utils_begin( PTP_CONFIG );
`uvm_object_utils_end

int unsigned table_size=32;

PTP_CONFIG_CONTENT table_index[];

function new( string name = "" );
super.new( name );
table_index = new[32];

for(int i=0;i<table_size;i++)
  table_index[i] = new();
 
endfunction

endclass