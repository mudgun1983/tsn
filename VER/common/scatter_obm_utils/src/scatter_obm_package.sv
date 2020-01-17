`include "src/scatter_obm_interface.sv"
package scatter_obm_package;
	import uvm_pkg::*;
	import base_package::*;
	`include "src/scatter_obm_xaction.sv"
	`include "src/scatter_obm_monitor.sv"
	`include "src/scatter_obm_interface_agent.sv"
endpackage

import scatter_obm_package::*;
