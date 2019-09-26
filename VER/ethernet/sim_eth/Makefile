.PHONY:default help clean 
default:all


##---------------------------------------------------------------
## DIRECTORIS
##---------------------------------------------------------------
#COV_DIR =./cov
#LOG_DIR =./log
#WAVE_DIR =./wave
#
##---------------------------------------------------------------
## DEVICE UNDER TEST
##---------------------------------------------------------------
#DUT_SRC_DIR = $(PROJ_HOME)/RTL/$(DUT)
#DUT_SRC = -f $(DUT_SRC_DIR)/ces_top.h
#DUT_INC +=+incdir+/../../../RTL/pwe3_32e1
#DUT_CMP_OPT +=+libext+.v
#
##---------------------------------------------------------------
## TESTBENCH
##---------------------------------------------------------------

#
##---------------------------------------------------------------
## COVERAGE
##---------------------------------------------------------------
#COV_TREE +='+tree e1_32_tb_top'
#COV_CM_OPT += -cover bcesf 
#
##---------------------------------------------------------------
## TEST TARGETS
##---------------------------------------------------------------
##debug targets
#test_1: comp_1 run_1
#
##regression targets
#regress_test_1: regress_build_1 regress_run_1
#
##---------------------------------------------------------------
## COMPILE AND RUN TIME ARGUMENTS
##---------------------------------------------------------------
#DBG_CMP +=$(COV_CMP_OPT)
#DBG_CMP +=-debug_all
#
##---------------------------------------------------------------
## COMMAND LINE ARGUMENTS
##---------------------------------------------------------------
SEED =0
#OVM_VERBOSITY =OVM_LOW  # OVM_DEBUG,OVM_FULL,OVM_HIGH,OVM_MEDIUM,OVM_LOW,OVM_NONE

#---------------------------------------------------------------
# Define Variables
#---------------------------------------------------------------
VERDI_HOME = /opt/verdi/share/PLI/modelsim_pli_latest/LINUX64
OVM_HOME = $(PROJECT_HOME)/lib/VIP/ovm-2.1
IP_HOME = $(PROJECT_HOME)/lib/IP
VIP_HOME = $(PROJECT_HOME)/lib/VIP
DPI_HOME= /opt/modelsim/modeltech/uvm-1.1b
UVM_HOME= ../../common/uvm-1.1b/
LIBDIR  = $(UVM_HOME)/lib
# Project path
PROJECT_HOME = ~/project/PWE3_sgq
DUT_DIR  = pwe3_32e1
wave_dir = ../../sim/wave     
tb_home  = ../..
# env path
SCRIPT_PATH = $(PROJECT_HOME)/script
RTL_PATH = $(PROJECT_HOME)/RTL/$(DUT_DIR)
BLOCK_VER_PATH = $(PROJECT_HOME)/ver/$(DUT_DIR)
COMMON_VER_PATH = $(PROJECT_HOME)/ver/common
# sim use
MODULE_TB = e1_32
TEST_NAME  = raps_base_test
OVM_VERBOSITY = OVM_LOW  # OVM_DEBUG,OVM_FULL,OVM_HIGH,OVM_MEDIUM,OVM_LOW,OVM_NONE
DUMP_VERDI = TRUE # dump fsdb or not:TRUE down; FALSE not down
COV_OPTS = -cover bcesf 
TC_LIST =

XILIB_DIR=../../../local_project/PCIE_serdes_clk/PCIE_serdes_clk/gtwizard_ultrascale_0_ex/gtwizard_ultrascale_0_ex.sim/sim_1/behav/msim/xil_defaultlib
GTY_DIR=../../../local_project/PCIE_serdes_clk/PCIE_serdes_clk/gtwizard_ultrascale_0_ex/gtwizard_ultrascale_0_ex.sim/sim_1/behav/msim/gtwizard_ultrascale_v1_6_5

#ifeq ($(DUMP_VERDI), TRUE)
#	DEB_SIM_OPTS = -pli $(VERDI_HOME)/libpli.so
#else
#	DEB_SIM_OPTS =
#endif
#DEB_SIM_OPTS = -pli $(VERDI_HOME)/libpli.so
#
#RUN_OPTS = +OVM_TESTNAME=${OVM_TEST} +DEFAULT_VERBOSITY=OVM_LOW -l log/$(OVM_TEST).log# -sv_seed random
#

#all:rmdir mkdir vlib_65 vlog_65 vopt_65 vsim_65
#all:rmdir mkdir vlib vlib1 vlib2 vmap vlog vcom vcom1 vopt vsim
all:clean mkdir vlib vlog_gty vlog_dut vlog_env vsim
#rmdir mkdir vlog_fifo vlog_ddr  vcom  vsim
#
#vlib: 
#	vlib work
#
#comp_verilog: 
#	vlog -timescale "1ns/100ps" -novopt +acc=ram \
#	+define+OVM_RGM_BACKDOOR_DPI+TEST \
#	-f compile_questa_sv.f \
#	-l compile.log
#
#comp_vhd: 
#	vcom ../../../lib/IP/altera_core/ddr2/ddr2_sched_pack_phy_alt_mem_phy_seq.vhd
#
#comp: vlib comp_verilog comp_vhd
#
#vsim_gui:
#	vsim -sv_lib ../../common/rgm_model/dll/rgm_set_hdl \
#	$(DEB_SIM_OPTS) \
#	$(RUN_OPTS) \
#	-do test.do \
#	-suppress 3892 $(MODULE_TB)_tb_top
#
#vsim_com:
#	vsim -sv_lib ../../common/rgm_model/dll/rgm_set_hdl \
#	$(DEB_SIM_OPTS) \
#	$(RUN_OPTS) \
#	-do alias.do \
#	-c -suppress 3892 $(MODULE_TB)_tb_top
#

#vlib:vlib_65
#vlog:
#	vlog_65 tb_top.sv -work work $(VERDI_HOME)/novas_vlog.v 
#vopt:
#	vopt tb_top -o tb_top_opt +cover=sbce 
#vsim_com:
#	vsim_65 -pli $(VERDI_HOME)/libpli.so -sv_seed $(SEED) -do vsim.do  -c -suppress 3829 -coverage tb_top_opt 
##func_cov:
##	coverage save cov/$(OVM_TEST).ucdb
#veri_com:
#	vericom -f ~/project/PWE3_sgq/RTL/Coeus_32E1_01.00.08/filelist.f -top  $(MODULE_TB)_tb_top -ssf wave/$(OVM_TEST).fsdb
#
#run: comp vsim_gui
#
#run_com: comp vsim_com
#
#regress: vsim_com

rmdir:
	rm -rf data
mkdir:
	mkdir data
vsim_65:
	'/modelsim_6.5b/modeltech/bin/vsim' -pli $(VERDI_HOME)/libpli.so -sv_seed $(SEED) -do ../vsim.do  -c -suppress 3829 -coverage tb_top_opt
vlib_65:
	'/opt/modelsim_6.5b/modeltech/bin/vlib' work
vlog_65:
	'/modelsim_6.5b/modeltech/bin/vlog' -f ../compile_dir.f -work work $(VERDI_HOME)/novas_vlog.v 
vopt_65:
	'/modelsim_6.5b/modeltech/bin/vopt' tb_top -o tb_top_opt +cover=sbce 

#vsim:
#	vsim -pli $(VERDI_HOME)/libpli.so -sv_seed $(SEED) -L fifo_generator_v13_0_1 -L xil_defaultlib -lib xil_defaultlib xil_defaultlib.fifo_512x72 -L /home/wgb/project/test/secureip -L /home/wgb/project/test/unisims_ver -L /home/wgb/project/test/unimacro_ver -L /home/wgb/project/test/unifast_ver -L /home/wgb/project/test/simprims_ver -do ../vsim.do  -c -suppress 3829 -coverage tb_top
vsim:
	vsim +acc=rmb -sv_seed 0 -c -sv_lib $(LIBDIR)/uvm_dpi  -do vsim.do +UVM_TESTNAME=eth_base_test -pli /opt/verdi/share/PLI/modelsim_pli_latest/LINUX64/libpli.so -voptargs="+acc" -L $(GTY_DIR) -L $(XILIB_DIR) -L /home/wgb/project/test2/unisims_ver -L /home/wgb/project/test2/unimacro_ver -L /home/wgb/project/test2/secureip pcs_tb_top glbl


vlib:
	vlib work
vlib1:
	vlib msim
vlib2:
	vlib msim/fifo_generator_v13_0_1
	vlib msim/xil_defaultlib
vmap:
	vmap fifo_generator_v13_0_1 msim/fifo_generator_v13_0_1
	vmap xil_defaultlib msim/xil_defaultlib

vlog_gty:
	./gtwizard_ultrascale_0_example_top_sim_compile.do | tee -a compile.log
		
vlog_fifo:
	./fifo_top_compile.do   | tee -a compile.log
vlog_ddr:
	./xjc_ddr_tb_compile.do | tee -a compile.log
#+define+ALIGN_MARKER_FAST_SIMULATE
vlog_dut:
	vlog  +define+ALIGN_MARKER_FAST_SIMULATE+SIM_USE -f dut_filelist.f  -work work $(VERDI_HOME)/novas_vlog.v | tee -a compile.log
#+define+ALIGN_MARKER_FAST_SIMULATE	
vlog_env:
	vlog +define+ALIGN_MARKER_FAST_SIMULATE -f pcs_env_filelist.f  -work work $(VERDI_HOME)/novas_vlog.v | tee -a compile.log
vlog:
	vlog -f ../compile_dir.f -work work $(VERDI_HOME)/novas_vlog.v | tee -a compile.log
vopt:
	vopt tb_top -o tb_top_opt +cover=sbce 

vcom:
	vcom -f ../compile_questa_vhdl.f
vcom1:
	vcom -work fifo_generator_v13_0_1 -64 -93 ../../../200G_CODE/XGMAC/fifo_generator_vhdl_beh.vhd ../../../200G_CODE/XGMAC/fifo_generator_v13_0_rfs.vhd
	vcom -work xil_defaultlib -64 -93 ../../../200G_CODE/XGMAC/fifo_512x72.vhd 
	
clean:
	rm -rf *.txt *~ work vsim.wlf* *.log log/*.log transcript *.vstf wave/* cov/* debussy*  msim msim/* data data/*

vcs:
    vcs -sverilog -f ../compile_vcs_sv.f -btb_opts ovm -timescale=1ns/100ps -l vcs.log -lca \
    -P /opt/verdi/share/PLI/VCS/LINUX/novas.tab /opt/verdi/share/PLI/VCS/LINUX/pli.a
#===============================================================


