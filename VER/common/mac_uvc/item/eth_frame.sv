
`ifndef ETH_FRAME_SV
`define ETH_FRAME_SV

//------------------------------------------------------------------------------
//
// CLASS: eth_frame
//
//------------------------------------------------------------------------------

class eth_frame extends uvm_sequence_item;

//==================== Enum ======================//  
//  typedef enum {RAMDOM_DATA,ETHERNET}     eth_packet_format          ;
//  typedef enum {MAC,PHY}                  eth_agent_kind             ;
//  typedef enum {INJECT,COLLECT}           eth_direction              ;
//  typedef enum {ETHERNET_802_3        ,                              
//  	            ETHERNET_VII          ,                              
//  	            EHTERNET_PAUSE        ,                              
//  	            ETHERNET_MAGIC        ,                              
//  	            ETHERNET_JUMBO        ,                              
//  	            ETHERNET_SNAP}            eth_packet_kind            ;
//  typedef enum {NO_PKT_ERROR          ,                              
//  	            SINGLE_PKT_ERROR      ,                              
//  	            MULTI_PKT_ERROR}          eth_pkt_error_mode         ;
//  typedef enum {NO_PROT_ERROR         ,   
//  	            SINGLE_PROT_ERROR_KIND,   
//  	            MULTI_PROT_ERROR_KIND}    eth_protocol_error_mode    ;
//  typedef enum {RANDOM_PROT_ERROR     ,   
//  	            DIRECTED_PROT_ERROR}      eth_protocol_error_gen_mode;
//  typedef enum {VLAN_TAG,                 
//  	            VLAN_DOUBLE_TAG       ,   
//  	            UNTAGGED}                 eth_tag_kind               ;
//  typedef enum {MII,GMII,RMII,XGMII   ,                              
//  	            SMII,XAUI,TBI,SGMII   ,                              
//  	            XSBI,RGMII,RTBI}          eth_interface_kind         ;
//  typedef enum {HALF,FULL}                eth_duplex_mode            ;  
//  typedef enum {ADD,WRITE,READ        ,   
//  	            READ_INC}                 eth_management_packet_kind ;
//  typedef enum {UNICAST,MULTICAST     ,   
//  	            BROADCAST}                eth_dest_addr_kind         ;  
//  typedef enum {PCS_LAYER,PMA_LAYER}      eth_sub_layer_kind         ;
//  typedef enum {SPEED_MODE_10MBPS     ,                              
//  	            SPEED_MODE_100MBPS    ,                              
//  	            SPEED_MODE_1GBPS      ,                              
//  	            SPEED_MODE_10GBPS}        eth_speed_mode             ;
//  typedef enum {TX_STATION,RX_STATION}    eth_station_kind           ;
//==================== Enum ======================//


//==================== Knob ======================//
  rand eth_protocol_error_gen_mode    protocol_error_gen_mode   ;
  rand eth_protocol_error_mode        protocol_error_mode       ;
  rand eth_pkt_error_mode             pkt_error_mode            ;
  
  rand eth_direction                  direction_kind            ;
  rand eth_packet_kind                packet_kind               ;
  rand eth_tag_kind                   tag_kind                  ;
  rand eth_packet_format              packet_format             ;
  rand eth_dest_addr_kind             dest_addr_kind            ;
  rand bit preemptable   ;
  rand bit start_or_frag ;
//==================== Knob ======================// 


//==================== Attribute =================//                                         
  rand bit [47:0]     destination_address         ;
  rand bit [47:0]     source_address              ;         
  rand bit [7:0]      frame_data[]                ;
  rand bit [31:0]     fcs                         ;
  rand int unsigned   frame_data_length           ;
  rand int unsigned   inter_frame_gap             ;
  
  rand int unsigned   tagged_data_size            ;
  rand int unsigned   directed_protocol_error_size;
  rand int unsigned   protocol_error_size         ;
  rand bit            crc_error                   ;
  rand bit            sfd_error                   ;
  rand bit            len_error                   ;
  rand bit            long_frame_error            ;
  rand bit            short_frame_error           ;
  rand bit            alignment_error             ;
  rand bit            pause_opcode_error          ;
  rand bit            len_not_align               ;
  rand int            rmii_phy_decode_time        ;
  rand int            rmii_toggle_nibbles         ;
  rand int            pcs_byte_alignment          ;
  rand bit            tbi_comma_detect_enable     ;
  rand bit            xsbi_signal_indicate_enable ;
  rand bit            smii_invalid_last_nibble    ;  
  rand bit [15:0]     pause_time                  ;
  rand int unsigned   port_num                    ;
  
  rand eth_preamble                   preamble                  ;
  rand eth_tagged_data                tagged_data[]             ;  
  rand eth_protocol_error             protocol_errors[]         ;
  rand eth_directed_protocol_error    directed_protocol_errors[]; 
  
  rand bit [31:0] init_crc;
  rand bit [31:0] xor_value;
  bit no_preamble;
  int tag_cnt;
//==================== Attribute =================//



//==================== Registration ==============//
  `uvm_object_utils_begin(eth_frame)
    `uvm_field_int          (destination_address         , UVM_ALL_ON|UVM_NOPACK)
    `uvm_field_int          (source_address              , UVM_ALL_ON|UVM_NOPACK)
    `uvm_field_array_int    (frame_data                  , UVM_ALL_ON|UVM_NOPACK)
    `uvm_field_int          (fcs                         , UVM_ALL_ON|UVM_NOPACK)
    `uvm_field_int          (frame_data_length           , UVM_ALL_ON|UVM_NOPACK)
    `uvm_field_int          (inter_frame_gap             , UVM_ALL_ON|UVM_NOPACK)
    
    `uvm_field_int          (tagged_data_size            , UVM_ALL_ON|UVM_NOPACK)
    `uvm_field_int          (directed_protocol_error_size, UVM_ALL_ON|UVM_NOPACK)
    `uvm_field_int          (protocol_error_size         , UVM_ALL_ON|UVM_NOPACK)
    `uvm_field_int          (crc_error                   , UVM_ALL_ON|UVM_NOPACK)
    `uvm_field_int          (sfd_error                   , UVM_ALL_ON|UVM_NOPACK)
    `uvm_field_int          (len_error                   , UVM_ALL_ON|UVM_NOPACK)
    `uvm_field_int          (long_frame_error            , UVM_ALL_ON|UVM_NOPACK)
    `uvm_field_int          (short_frame_error           , UVM_ALL_ON|UVM_NOPACK)
    `uvm_field_int          (alignment_error             , UVM_ALL_ON|UVM_NOPACK)
    `uvm_field_int          (pause_opcode_error          , UVM_ALL_ON|UVM_NOPACK)
    `uvm_field_int          (len_not_align               , UVM_ALL_ON|UVM_NOPACK)
    `uvm_field_int          (rmii_phy_decode_time        , UVM_ALL_ON|UVM_NOPACK)
    `uvm_field_int          (rmii_toggle_nibbles         , UVM_ALL_ON|UVM_NOPACK)
    `uvm_field_int          (pcs_byte_alignment          , UVM_ALL_ON|UVM_NOPACK)
    `uvm_field_int          (tbi_comma_detect_enable     , UVM_ALL_ON|UVM_NOPACK)
    `uvm_field_int          (xsbi_signal_indicate_enable , UVM_ALL_ON|UVM_NOPACK)
    `uvm_field_int          (smii_invalid_last_nibble    , UVM_ALL_ON|UVM_NOPACK)    
    `uvm_field_int          (pause_time                  , UVM_ALL_ON|UVM_NOPACK)
    `uvm_field_int          (port_num                    , UVM_ALL_ON|UVM_NOPACK)
	`uvm_field_int          (init_crc                    , UVM_ALL_ON|UVM_NOPACK)
    `uvm_field_int          (xor_value                   , UVM_ALL_ON|UVM_NOPACK)
    `uvm_field_int          (tag_cnt                     , UVM_ALL_ON|UVM_NOPACK)
    `uvm_field_object       (preamble                    , UVM_ALL_ON|UVM_NOPACK)
    `uvm_field_array_object (tagged_data                 , UVM_ALL_ON|UVM_NOPACK)
    `uvm_field_array_object (protocol_errors             , UVM_ALL_ON|UVM_NOPACK|UVM_NOPRINT)
    `uvm_field_array_object (directed_protocol_errors    , UVM_ALL_ON|UVM_NOPACK|UVM_NOPRINT)
    
    
    `uvm_field_enum         (eth_direction,direction_kind, UVM_ALL_ON|UVM_NOPACK)
    `uvm_field_enum         (eth_packet_kind,packet_kind , UVM_ALL_ON|UVM_NOPACK)
    `uvm_field_enum         (eth_tag_kind,tag_kind       , UVM_ALL_ON|UVM_NOPACK)
    `uvm_field_enum         (eth_packet_format           , 
                             packet_format               , UVM_ALL_ON|UVM_NOPACK)
    `uvm_field_enum         (eth_dest_addr_kind,
                             dest_addr_kind              , UVM_ALL_ON|UVM_NOPACK)                             
    `uvm_field_enum         (eth_protocol_error_gen_mode , 
                             protocol_error_gen_mode     , UVM_ALL_ON|UVM_NOPACK)
    `uvm_field_enum         (eth_protocol_error_mode     , 
                             protocol_error_mode         , UVM_ALL_ON|UVM_NOPACK)
    `uvm_field_enum         (eth_pkt_error_mode          , 
                             pkt_error_mode              , UVM_ALL_ON|UVM_NOPACK)
  `uvm_object_utils_end
//==================== Registration ==============// 


//==================== Constraint ================//                             

                             
//  constraint valid_untagged_frame {
//    if (tag_kind == UNTAGGED) {
//      length_type != 16'h8808;
//      length_type != 16'h8100;
//      
//      // If the value in the Length/Type field is less than 0600h, 
//      // the value is representing the length of the data field (in Bytes). 
//      // This value does not include any bytes contained in the Padding field.
//      // If the value in the Length/Type field is greater than or equal to 0600h, 
//      // the value is representing the type of frame being sent/received.
//      min_len == ((length_type >= 'h0600) ? 46 : 0);
//      
//      max_len == 1500;
//
//    }
////    min_len == 48;//only for test
////    max_len == 64;//only for test
//  }
//  
//  constraint valid_tagged_frame {
//    if (tag_kind == VLAN_TAG) {
////    	if ((tag_kind == VLAN_TAG)||(tag_kind == VLAN_DOUBLE_TAG)){
//      length_type != 16'h8808;
//      min_len == ((length_type >= 'h0600) ? 44 : 0);
//      max_len == 1500;
//      
////      min_len == 48;//only for test
////    max_len == 64;//only for test
//    }
//  }
  
  constraint c_frame_data_size
             {
             	 frame_data.size() == frame_data_length;//delete???
             }
             
  constraint c_frame_data_length
             {
             	 frame_data_length inside {[18:9600]} ;
//             	 frame_data_length inside {[18:960]} ;//for Questasim test
             }           
             
  constraint c_tagged_data_size
             {
             	 tagged_data.size() == tagged_data_size;
             }
     
//  constraint c_lenth_error 
//             {
//  	           if(len_error && (tagged_data_size>0)) {
//  	           	 foreach(tagged_data[key]) //foreach can't constrain subclass array???
//  	           	   if(tagged_data[key].tpid <= 1500) 
//  	                tagged_data[key].tpid != tagged_data[key].data_length;}
//  	           else if(!len_error && (tagged_data_size>0)) {
//  	           	 foreach(tagged_data[key]) //foreach can't constrain subclass array???
//  	              tagged_data[key].tpid == tagged_data[key].data_length;}  
//  	         }
  	                     
  constraint c_sfd_error   
             {
  	           if(sfd_error) {
//  	             foreach(preamble.sfd[key]) //foreach can't constrain subclass array???
  	             	 preamble.sfd!=8'hd5;}
  	           else {
//  	             foreach(preamble.sfd[key])
  	             	 preamble.sfd==8'hd5;}                      
  	         }  	                         	                       

  constraint c_drt_pro_err 
             {
             	 directed_protocol_errors.size() == directed_protocol_error_size;
             }
  constraint c_drt_pro_err_size 
             {
             	 directed_protocol_error_size inside {[0:16]};
             }
 
  constraint c_prot_err 
             {
             	  protocol_errors.size() == protocol_error_size;
             }
  constraint c_pro_err_size 
             {
             	 protocol_error_size inside {[0:16]};
             }                          
  
  constraint c_fcs   
             {  	                        	                        	                        	                        	                      
  	           fcs == 32'hffff_ffff;
  	     }
//==================== Constraint ================//


  
//================================================//
//FUNCTION    : new
//DESCRIPTION : construct
//================================================//
  function new (string name = "eth_frame");
    super.new();
    preamble = new("preamble");
    tagged_data = new[8];//16???
    directed_protocol_errors = new[16];
    protocol_errors          = new[16];
    foreach(directed_protocol_errors[key])
      directed_protocol_errors[key] = new();
    foreach(protocol_errors[key])
      protocol_errors[key] = new();
    foreach(tagged_data[key])
      tagged_data[key] = new();
    
  endfunction


//================================================//
//FUNCTION    : do_pack
//DESCRIPTION : pack the pdu units to frame_data
//================================================//
  function void do_pack(uvm_packer packer);
    super.do_pack(packer);
    
    // if(preamble.data_preamble.size() > 0) begin
      // foreach(preamble.data_preamble[key])
        // packer.pack_field_int (preamble.data_preamble[key],8);
    // end
	if(preemptable && (~start_or_frag))
	  begin
	   for(int i=0;i<6;i++)begin
	   packer.pack_field_int (preamble.data_preamble[i],8);
	   end
	   packer.pack_field_int (preamble.smd,8);
	   packer.pack_field_int (preamble.frag_cnt,8);
	  end
	else if(preemptable)
	       begin
		    for(int i=0;i<7;i++)begin
	         packer.pack_field_int (preamble.data_preamble[i],8);
	         end
		     packer.pack_field_int (preamble.smd,8);
		   end
	     else
		   begin
		    for(int i=0;i<7;i++)begin
	         packer.pack_field_int (preamble.data_preamble[i],8);
	         end
           packer.pack_field_int (preamble.sfd,8);
		   end
    
    packer.pack_field_int (destination_address,48);
    packer.pack_field_int (source_address     ,48);
    
    if(tagged_data.size() > 0) begin
    	foreach(tagged_data[i]) begin
    		if(tagged_data[i].data.size() > 0) begin
    		  packer.pack_field_int (tagged_data[i].tpid,16);
    		  foreach(tagged_data[i].data[j])
    		    packer.pack_field_int (tagged_data[i].data[j],8);
    	  end
    	end
    end

    packer.pack_field_int(fcs,32);

  endfunction : do_pack
  

//================================================//
//FUNCTION    : do_unpack
//DESCRIPTION : unpack the frame_data to pdu units
//================================================//
  function void do_unpack(uvm_packer packer);
    int data_cnt;
   // int tag_cnt;
	bit frag_ind;
    super.do_unpack(packer);
    
    preamble.preamble_length = 0;
	if(~no_preamble)begin
    for(int i=0; i<frame_data.size(); i++) begin
    	//if(frame_data[i]!=8'hd5)
		if(frame_data[i]==8'h55)
    	    preamble.preamble_length++;
        else
      	break;
    end    
    preamble.data_preamble = new[preamble.preamble_length];
    for(int i=0;i<preamble.preamble_length;i++)
      preamble.data_preamble[i] = packer.unpack_field_int(8);
    preamble.sfd = packer.unpack_field_int(8);
    if(preamble.sfd !=8'hd5)  
	  begin
	    preamble.smd = preamble.sfd;
		//preamble.frag_cnt = packer.unpack_field_int(8);
	  end
	
    if(preamble.smd == 8'h61 ||
	   preamble.smd == 8'h52 ||
	   preamble.smd == 8'h9E ||
	   preamble.smd == 8'h2A	
	)	
	  frag_ind = 1;
	else
	  frag_ind = 0;
	
	if(frag_ind)
	  preamble.frag_cnt = packer.unpack_field_int(8);
	
	end
	
    destination_address = packer.unpack_field_int(48);
    source_address      = packer.unpack_field_int(48);
    
	if(~no_preamble)begin
	if(~frag_ind)
      data_cnt = preamble.preamble_length+13;//sfd(1)+da(6)+sa(6)
	else
	  data_cnt = preamble.preamble_length+14;//sfd(1)+frag_cnt(1)+da(6)+sa(6) 
	end
    else	
	  data_cnt = 12;//da(6)+sa(6)
	  
    tag_cnt  = 0;
    while(data_cnt < frame_data.size()) begin
//    	if({frame_data[data_cnt],frame_data[data_cnt+1]} == 16'h8100) begin//VLAN_TAG
        if({frame_data[data_cnt],frame_data[data_cnt+1]} == 16'h8100 ||
      	   {frame_data[data_cnt],frame_data[data_cnt+1]} == 16'h9100 ||
      	   {frame_data[data_cnt],frame_data[data_cnt+1]} == 16'h88a8 ||
      	   {frame_data[data_cnt],frame_data[data_cnt+1]} == 16'h88e8) begin//VLAN_TAG
    	    tagged_data[tag_cnt].data_length = 2;
    	    data_cnt = data_cnt + 4;   		
    	end    	
    	else if({frame_data[data_cnt],frame_data[data_cnt+1]} == 16'hFA47) begin//HARD_TAG
    	    tagged_data[tag_cnt].data_length = 6;
    	    data_cnt = data_cnt + 8;  
    	end
    	//-------------- add by ccm 2013-12-18 ----------------------
    	else if({frame_data[data_cnt],frame_data[data_cnt+1]} == 16'h8875) begin
    		  tagged_data[tag_cnt].data_length = 32;
    	    data_cnt = data_cnt + 34; 
    	end
    	//-------------------------------------------------------------
    	else //if( ({frame_data[data_cnt],frame_data[data_cnt+1]} == 16'h8902) ||
//    		       ({frame_data[data_cnt],frame_data[data_cnt+1]} == 16'hFF02) ||
//    		       ({frame_data[data_cnt],frame_data[data_cnt+1]} == 16'hFE02) || //ETH_OAM_TAG
//    		       ({frame_data[data_cnt],frame_data[data_cnt+1]} == 16'h8847) ||
//    		       ({frame_data[data_cnt],frame_data[data_cnt+1]} == 16'hFF47) ||
//    		       ({frame_data[data_cnt],frame_data[data_cnt+1]} == 16'hFE47) || //TP_OAM_TAG    		       
//    		     ) 
    		     begin
    	    tagged_data[tag_cnt].data_length = frame_data.size() - (data_cnt + 2 + 4);    		 
    	    break;
    	end    	    	
    	tag_cnt++;
    	if(tag_cnt > 15) begin
    	    uvm_report_error(get_type_name(),$psprintf("tagged data size has exceeded 16"),UVM_LOW);
    	    tag_cnt = 15;
    	    break;
    	end    		
    end
    
//    tagged_data = new[tag_cnt+1];
    for(int i=0;i<=tag_cnt;i++) begin
        tagged_data[i].data = new[tagged_data[i].data_length];
      	if(tagged_data[i].data_length > 0)
      	    tagged_data[i].tpid = packer.unpack_field_int(16);    	
      	for(int j=0;j<tagged_data[i].data_length;j++) 
      	    tagged_data[i].data[j] = packer.unpack_field_int(8);	
    end

    fcs = packer.unpack_field_int(32);
  endfunction : do_unpack
  
  
  

//================================================//
//FUNCTION    : post_randomize
//DESCRIPTION : 
//================================================//
  function void post_randomize();
    if(crc_error)
//    	fcs = $random;
      fcs = 32'hffff_ffff;//for test
    else 
      fcs = do_crc32();
    
    frame_data_length = 0;
    foreach(tagged_data[key])
      frame_data_length = frame_data_length + tagged_data[key].data_length + 2;
    frame_data_length   = frame_data_length + preamble.preamble_length + 1 +16;//add preamble,sfd,addr and fcs
    
    pack_bytes(frame_data);
    
  endfunction : post_randomize


//================================================//
//FUNCTION    : do_crc32
//DESCRIPTION : 
//================================================//  
  virtual function bit[31:0] do_crc32();
    bit [7:0] data_crc[];
    bit [31:0] temp_crc32;
    crc_cal  crc_cal = new();
    
    this.pack_bytes(data_crc);
	if(preemptable && (~start_or_frag))
	  begin
       foreach(data_crc[i])
        //data_crc[i] = data_crc[i+preamble.data_preamble.size()+1+1];  //SMD and FRAG CNT
       	data_crc[i] = data_crc[i+6+1+1];  //SMD and FRAG CNT,the size of preamble data is tied to 6
	  end
	else
	  begin
	   foreach(data_crc[i])
        //data_crc[i] = data_crc[i+preamble.data_preamble.size()+1];
	   	data_crc[i] = data_crc[i+7+1];//SMD ,the size of preamble data is tied to 7
	  end
	  
//      data_crc[i] = data_crc[i+8];
//    data_crc = new[data_crc.size()-12](data_crc);//delete preamble,sfd and fcs
    if(preemptable && (~start_or_frag))
	 //data_crc = new[data_crc.size()-preamble.data_preamble.size()-1-1-4](data_crc);//delete preamble,smd,frag_cnt and fcs
    	data_crc = new[data_crc.size()-6-1-1-4](data_crc);//delete preamble,smd,frag_cnt and fcs
    else
	 //data_crc = new[data_crc.size()-preamble.data_preamble.size()-1-4](data_crc);//delete preamble,sfd and fcs
    	data_crc = new[data_crc.size()-7-1-4](data_crc);//delete preamble,sfd and fcs
   
   `uvm_info(get_type_name(),{$psprintf("init_crc=%h\n",init_crc)},UVM_HIGH);
	foreach(data_crc[key])
	  `uvm_info(get_type_name(),{$psprintf("data_crc[%0d]=%h\n",key,data_crc[key])},UVM_HIGH);
	if(preemptable)
	  do_crc32 = crc_cal.do_crc32_se(data_crc,init_crc)^ (xor_value);
	else
	  do_crc32 = ~crc_cal.do_crc32_se(data_crc,32'hffff_ffff);
	  
    temp_crc32 = do_crc32;
    do_crc32[31:24] = temp_crc32[7:0]  ;
    do_crc32[23:16] = temp_crc32[15:8] ;
    do_crc32[15:8]  = temp_crc32[23:16];
    do_crc32[7:0]   = temp_crc32[31:24];
    
  endfunction : do_crc32
  
endclass : eth_frame

`endif // ETH_FRAME_SV
