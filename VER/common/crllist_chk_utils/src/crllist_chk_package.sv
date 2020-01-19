`include "src/crllist_chk_interface.sv"
`include "src/crllist_chk_dec.sv"
package crllist_chk_package;
	import uvm_pkg::*;
	import base_package::*;
	import obm_dut_cfg_package::*;
	`include "src/crllist_chk_monitor.sv"
endpackage

import crllist_chk_package::*;
