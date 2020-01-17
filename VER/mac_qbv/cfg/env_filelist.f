
#+incdir+../../common/uvm-1.2/src 
#../../common/uvm-1.2/src/uvm_pkg.sv
+incdir+../../common/cpu_uvc/
+incdir+../../common/cpu_uvc/compoent
+incdir+../../common/cpu_uvc/env
+incdir+../../common/cpu_uvc/interface/
+incdir+../../common/cpu_uvc/item
+incdir+../../common/cpu_uvc/seq_lib
../../common/cpu_uvc/interface/cpu_if.sv

../../common/cpu_uvc/cpu_pkg.svh

#../../common/comps/base_package.sv
+incdir+../../mac_qbv/env
../../mac_qbv/env/obm_dut_cfg_package.sv
-F ../../common/comps/interface_agent_base.list
-F ../../common/scatter_obm_utils/scatter_obm_interface_list.f
-F ../../common/obm_mac_utils/obm_mac_interface_list.f
-F ../../common/crllist_chk_utils/crllist_chk_interface_list.f



+incdir+../../common/mac_uvc
+incdir+../../common/mac_uvc/compoent
+incdir+../../common/mac_uvc/env
+incdir+../../common/mac_uvc/interface
+incdir+../../common/mac_uvc/item
+incdir+../../common/mac_uvc/seq_lib
../../common/mac_uvc/mac_pkg.svh
+incdir+../config
pcs_env_pkg.sv

../uvc/interface/pcs_xilinx_serdes_if.sv
../tb/pcs_tb_top.sv
glbl.v
