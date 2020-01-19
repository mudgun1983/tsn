`ifndef OBM_MAC_MONITOR__SV
`define OBM_MAC_MONITOR__SV
class obm_mac_monitor #(type VIF = virtual obm_mac_interface) extends monitor_base #(VIF);
	//0:for emac;1:for pmac
	bit              m_obm_mac_en;
	`uvm_component_utils(obm_mac_monitor)
	function new(string name,uvm_component parent);
		super.new(name,parent);
		m_obm_mac_en = 1'b0;
	endfunction
	extern task run_phase(uvm_phase phase);
endclass

task obm_mac_monitor:: run_phase(uvm_phase phase);
	obm_mac_xaction tmp_xaction;
	int                 byte_sel;
	int                 bp_cnt;
	bit                 rdy_dly[4];
	bit   [7:0]         gate_state_dly[4];
	bit                 check_rdy[2];
	bit   [7:0]         check_state[2];

	super.run_phase(phase);
	`uvm_info(get_type_name(),$psprintf("obm_mac_monitor enter run_phase"),UVM_NONE);
	while(1)begin 
		@bus.mon_cb;
		if(bus.rst_n == 1'b0)begin 
			tmp_xaction = null;
			continue;
		end

		//here is for sop check gate and rdy
		for(int i=0;i<3;i++)begin	
			rdy_dly[3-i] = rdy_dly[2-i];
		end
		rdy_dly[0] = bus.mon_cb.m_mac_obm_rdy;

		for(int i=0;i<3;i++)begin	
			gate_state_dly[3-i] = gate_state_dly[2-i];
		end
		gate_state_dly[0] = bus.mon_cb.m_obm_mac_gate_state;

		//here need adding rdy bp checker
		//if((bus.mon_cb.m_obm_mac_valid == 1'b1)&&(bus.mon_cb.m_mac_obm_rdy == 1'b1))begin 
		if(bus.mon_cb.m_mac_obm_rdy == 1'b1)begin 
			bp_cnt = 0;
		end
		else begin 
			if(bus.mon_cb.m_obm_mac_valid == 1'b1)begin 
				bp_cnt ++;
			end
			if(bp_cnt > obm_mac_dec::OBM_MAC_BP)begin 
				`uvm_error(get_type_name(),$psprintf("bp_cnt is %0d greater than %0d",bp_cnt,obm_mac_dec::OBM_MAC_BP));
			end
		end

		if(bus.mon_cb.m_obm_mac_valid == 1'b1)begin 
			if(bus.mon_cb.m_obm_mac_sop == 1'b1)begin 
				if(tmp_xaction != null)begin 
					`uvm_error(get_type_name(),$psprintf("m_obm_mac_eop miss match"));
			    end
				tmp_xaction = new();
				check_rdy[0] = rdy_dly[2];
				check_rdy[1] = rdy_dly[3];
				check_state[0] = gate_state_dly[2];
				check_state[1] = gate_state_dly[3];
		    end

			if(bus.mon_cb.m_obm_mac_eop == 1'b1)begin 
				if(tmp_xaction == null)begin 
					`uvm_error(get_type_name(),$psprintf("m_obm_mac_eop miss match"));
			    end
				byte_sel = (32 - bus.mon_cb.m_obm_mac_mod);
				for(int i=0;i<byte_sel;i++)begin 
					tmp_xaction.m_obm_mac_data.push_back(bus.mon_cb.m_obm_mac_data[(255-8*i)-:8]);
			    end
				tmp_xaction.m_obm_mac_err    = bus.mon_cb.m_obm_mac_err;
				tmp_xaction.m_obm_mac_en     = this.m_obm_mac_en;
				//for in the first 32byte is descriptor information
				tmp_xaction.m_obm_mac_ophb   = tmp_xaction.m_obm_mac_data[14 + 32][7:5];
				tmp_xaction.m_obm_mac_ptp.push_back(bus.mon_cb.m_obm_mac_ptp);
				this.out_port.write(tmp_xaction);
				`uvm_info(get_type_name(),$psprintf("obm_mac_nonitor got a tmp_xaction"),UVM_NONE);
				//here add sop checker
				if(~((check_rdy[0]&&check_state[0][tmp_xaction.m_obm_mac_ophb]) || (check_rdy[1]&&check_state[1][tmp_xaction.m_obm_mac_ophb])))begin
					tmp_xaction.print();
					`uvm_error(get_type_name(),$psprintf("rdy and gate should be both high"));
				end
				tmp_xaction = null;
	        end
			else begin 
				//for there is a bug in sop ,it will be fixed later;so we don't check it now
				if((bus.mon_cb.m_obm_mac_mod != 5'h0)&&(bus.mon_cb.m_obm_mac_sop == 1'b0))begin 
					`uvm_error(get_type_name(),$psprintf("m_obm_mac_mod should be 0 while it is %0d",bus.mon_cb.m_obm_mac_mod));
				end
				for(int i=0;i<32;i++)begin 
					tmp_xaction.m_obm_mac_data.push_back(bus.mon_cb.m_obm_mac_data[(255-8*i)-:8]);
			    end
			end
		end

		//here maybe add assert for rdy is 0 data should be constant
	end
endtask
`endif
