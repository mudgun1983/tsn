class PTP_CONFIG_CONTENT extends uvm_object;
parameter [15:0]     VLAN_VALUE0 = 16'd500;
sys_item sys_trans;
ptp_item ptp_trans;
eth_frame_simplify eth_trans;
descriptor_item descriptor_trans;

bit [15:0] packed_data[$];
bit [15:0] packed_desc[$];
bit [15:0] packed_data_pad[];
bit [15:0] packed_desc_pad[];
`uvm_object_utils_begin( PTP_CONFIG_CONTENT );
`uvm_field_object        (sys_trans               , UVM_ALL_ON|UVM_NOPACK)
`uvm_field_object        (ptp_trans               , UVM_ALL_ON|UVM_NOPACK)
`uvm_field_object        (descriptor_trans        , UVM_ALL_ON|UVM_NOPACK)
`uvm_field_sarray_int    (packed_data            , UVM_ALL_ON|UVM_NOPACK)	
`uvm_field_sarray_int    (packed_desc            , UVM_ALL_ON|UVM_NOPACK)	
`uvm_object_utils_end


function new( string name = "" );
super.new( name );
sys_trans = new();
ptp_trans = new();
eth_trans = new();
predefine_ptp_trans();
predefine_sys_trans();
predefine_eth_trans();
// sys_trans.print();
// ptp_trans.print();
// eth_trans.print();
pack();

descriptor_trans=new();
predefine_descriptor_trans();
desc_pack();

packed_data_pad = new[64];
//packed_data_pad = packed_data;
packed_desc_pad = new[8];
//  packed_desc_pad  = packed_desc ;
packed_padding();
endfunction

function predefine_sys_trans();
  // if ( !(sys_trans.randomize() with {sys_trans.pckt_type == 4'b1001;} )) 
       // begin
		 //`uvm_error(get_type_name, "Randomize Failed!") 
		//end
	sys_trans.pckt_type = 4'b1001;
    sys_trans.sub_type	= ptp_trans.messageType;
	sys_trans.destination = 2;//port 1
	sys_trans.timestamp_tc = 'hffff_ffff;
    //sys_trans.pack_bytes(sys_trans.frame_data);
endfunction

function predefine_ptp_trans();
    //if ( !(ptp_trans.randomize() )) 
         //begin
		  //`uvm_error(get_type_name, "Randomize Failed!") 
		 //end
	ptp_trans.packet_type     =    ptp_item::Sync;
	ptp_trans.originTimestamp =    {80{1'b1}};//'hffff_ffff;
		
    //ptp_trans.pack_bytes(ptp_trans.frame_data);
	
endfunction

function predefine_eth_trans();
  ptp_trans.pack_bytes(ptp_trans.frame_data);
  eth_trans.tagged_data[1].c_data_length.constraint_mode(0);
  if ( !(eth_trans.randomize() with {eth_trans.destination_address    == `PTP_NON_PEER_MULTI_DA;//48'h01_1b_19_00_00_00;
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
                   	                 eth_trans.tagged_data[1].tpid   == `PTP_ETYPE;//16'h88F7;
									 foreach(eth_trans.tagged_data[1].data[key])   
                                      {eth_trans.tagged_data[1].data[key]==ptp_trans.frame_data[key];
                                      }
					                } )) 
        begin
		 `uvm_error(get_type_name, "Randomize Failed!") 
		end
		
	//eth_trans.pack_bytes(eth_trans.frame_data);	
endfunction

function predefine_descriptor_trans();
   //if ( !(descriptor_trans.randomize() with {descriptor_trans.pckt_type == 4'b1001;} )) 
   //     begin
  //		 `uvm_error(get_type_name, "Randomize Failed!") 
	//end
	
	descriptor_trans.inst_valid = 1;
	descriptor_trans.pckt_type  = 4'b1001; //4’b1001-ptp
	descriptor_trans.inst_type = 0; //1’b0-master
                                    //1’b1-slave
	descriptor_trans.two_step = 1;
	descriptor_trans.follow_up_tlv = 1;	
	descriptor_trans.send_period = 1;
	descriptor_trans.pckt_len=126;
	descriptor_trans.vlan_num=1;
	
	descriptor_trans.rsv6 = 'hffff_ffff;

    //descriptor_trans.pack_bytes(descriptor_trans.frame_data);
endfunction

function pack();
  int tmp_size;
  bit [7:0] packed_data_tmp[];
  
  sys_trans.pack_bytes(sys_trans.frame_data);
  eth_trans.pack_bytes(eth_trans.frame_data);	
  ptp_trans.pack_bytes(ptp_trans.frame_data);
  packed_data_tmp = {sys_trans.frame_data,eth_trans.frame_data,ptp_trans.frame_data};
  
  tmp_size = packed_data_tmp.size();  
  for(int i=0;i<((tmp_size)/2+tmp_size%2);i++)
    begin
	  if((i*2+1)>tmp_size)
	    packed_data[i]={8'h0,packed_data_tmp[i*2]};  
	  else
	    packed_data[i]={packed_data_tmp[i*2],packed_data_tmp[i*2+1]};  // packed_data[7:0] = packed_data_tmp[0]; packed_data[15:8] = packed_data_tmp[1];
	end
	
endfunction


function desc_pack();
  int tmp_size;
  bit [7:0] packed_data_tmp[];
  
  descriptor_trans.pack_bytes(descriptor_trans.frame_data);
  packed_data_tmp = descriptor_trans.frame_data;
  
  tmp_size = packed_data_tmp.size();  
  for(int i=0;i<((tmp_size)/2+tmp_size%2);i++)
    begin
	  if((i*2+1)>tmp_size)
	    packed_desc[i]={8'h0,packed_data_tmp[i*2]};  
	  else
	    packed_desc[i]={packed_data_tmp[i*2],packed_data_tmp[i*2+1]};  // packed_data[7:0] = packed_data_tmp[0]; packed_data[15:8] = packed_data_tmp[1];
	end
	
	packed_desc.reverse();
endfunction

function packed_padding();
  foreach(packed_data[key])
    packed_data_pad[key] = packed_data[key];
  
  foreach(packed_desc[key])
    packed_desc_pad[key] = packed_desc[key];
	
endfunction

endclass

class PTP_CONFIG extends uvm_object;

bit [5:0]	uncal_pid ;
bit [5:0]	slave_pid ;
bit [7:0]	domain    ;
bit 	    two_step  ;
bit [47:0]  src_mac   ;	

`uvm_object_utils_begin( PTP_CONFIG );
`uvm_field_int        (uncal_pid               , UVM_ALL_ON|UVM_NOPACK)
`uvm_field_int        (slave_pid               , UVM_ALL_ON|UVM_NOPACK)
`uvm_field_int        (domain                  , UVM_ALL_ON|UVM_NOPACK)
`uvm_field_int        (two_step                , UVM_ALL_ON|UVM_NOPACK)
`uvm_field_int        (src_mac                 , UVM_ALL_ON|UVM_NOPACK)
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