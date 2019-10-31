class eth_frame_simplify extends eth_frame;

 `uvm_object_utils_begin(eth_frame_simplify)
 `uvm_object_utils_end
//================================================//
//FUNCTION    : do_pack
//DESCRIPTION : pack the pdu units to frame_data
//================================================//
  function void do_pack(uvm_packer packer);
    super.do_pack(packer);
    
      
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


  endfunction : do_pack
endclass