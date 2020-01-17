class scatter_obm_monitor #(type VIF = virtual scatter_obm_interface) extends monitor_base #(VIF);
	`uvm_component_utils(scatter_obm_monitor)
	function new(string name,uvm_component parent);
		super.new(name,parent);
		`uvm_info(get_type_name(),$psprintf("scatter_obm_monitor new"),UVM_NONE);
	endfunction
	extern virtual task run_phase(uvm_phase phase);
endclass

task scatter_obm_monitor:: run_phase(uvm_phase phase);
	scatter_obm_xaction tmp_xaction;
	int                 byte_sel;
	super.run_phase(phase);
	#10ns;
	`uvm_info(get_type_name(),$psprintf("enter scatter_obm_monitor run_phase"),UVM_NONE);
	while(1)begin 
		//`uvm_info(get_type_name(),$psprintf("scatter_obm_monitor repeat0 clk"),UVM_NONE);
		@bus.mon_cb;
		//@(posedge bus.clk);
		//`uvm_info(get_type_name(),$psprintf("scatter_obm_monitor repeat1 clk"),UVM_NONE);
		if(bus.rst_n == 1'b0)begin 
			tmp_xaction = null;
			continue;
		end
		//`uvm_info(get_type_name(),$psprintf("scatter_obm_monitor repeat clk"),UVM_NONE);
		//here need adding x state check
		if(bus.mon_cb.m_scatter_obm_valid == 1'b1)begin
			//here is for eop miss
			`uvm_info(get_type_name(),$psprintf("m_scatter_obm_valid is 1"),UVM_NONE);
    		if(bus.mon_cb.m_scatter_obm_sop == 1'b1)begin 
    			if(tmp_xaction != null)begin 
    				`uvm_fatal(get_type_name(),$psprintf(" m_scatter_obm_eop doesn't match"));
    			end
    			tmp_xaction = new();
				`uvm_info(get_type_name(),$psprintf("scatter_obm_ophb is in sop"),UVM_NONE);
    	    end

    		if(bus.mon_cb.m_scatter_obm_eop == 1'b1)begin 
				//here is sop miss
    			if(tmp_xaction == null)begin 
    				`uvm_fatal(get_type_name(),$psprintf("m_scatter_obm_sop  doesn't match"));
    			end

				//if(bus.mon_cb.m_scatter_obm_mod == 5'h1f)begin 
				//	`uvm_error(get_type_name(),$psprintf("m_scatter_obm_mod should not be 5'h1f"));
				//end

				byte_sel = (32 - bus.mon_cb.m_scatter_obm_mod);

				for(int i = 0 ;i<byte_sel;i++)begin 
    				tmp_xaction.m_scatter_obm_data.push_back(bus.mon_cb.m_scatter_obm_data[(255 - 8*i) -:8]);
				end
				tmp_xaction.m_scatter_obm_err  = bus.mon_cb.m_scatter_obm_err;
				tmp_xaction.m_scatter_obm_ophb = bus.mon_cb.m_scatter_obm_ophb;
				`uvm_info(get_type_name(),$psprintf("scatter_obm_ophb has got a xaction"),UVM_NONE);
				if(this.out_port == null)begin 
					`uvm_error(get_type_name(),$psprintf("out_port is null"));
				end
				this.out_port.write(tmp_xaction);
				tmp_xaction = null;
			end
			else begin 
				//here for now dut has bugs we check it later
				if((bus.mon_cb.m_scatter_obm_mod != 5'h0)&&(bus.mon_cb.m_scatter_obm_sop == 1'b0))begin 
					//`uvm_error(get_type_name(),$psprintf("m_scatter_obm_mod should be 0"));
				end
				for(int i = 0 ;i<32;i++)begin 
    				tmp_xaction.m_scatter_obm_data.push_back(bus.mon_cb.m_scatter_obm_data[(255 - 8*i) -:8]);
				end
			end
		end
	end
endtask
