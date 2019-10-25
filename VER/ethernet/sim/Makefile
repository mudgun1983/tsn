UVM_HOME=/home/wangguobin/project/TSN/verfication/tsn/VER/common/uvm-1.1b
#TEST_NAME= simple_preemptable_packet_test
#TEST_NAME= simple_express_packet_test
#TEST_NAME= simple_e_p_mix_packet_test
#TEST_NAME= simple_e_p_mix_random_test
#TEST_NAME= full_throughput_test
TEST_NAME= full_throughput_switch_test 

all:clean setup compile elaborate run

setup:
	./setup.sh
	
compile:
	 ./compile.sh
	
elaborate:
	./elaborate.sh
	
comp:
	vcs -full64 -work xil_defaultlib \
	-sverilog \
	+define+SVT_UVM_TECHNOLOGY \
	+define+SYNOPSYS_SV  \
	+vpi \
	+define+UVM_PACKER_MAX_BYTES=1500000 \
	+define+UVM_DISABLE_AUTO_ITEM_RECORDING \
	+incdir+${UVM_HOME}/src \
	${UVM_HOME}/src/dpi/uvm_dpi.cc \
    ${UVM_HOME}/src/uvm_pkg.sv \
	-f pcs_env_filelist.f -f dut_filelist.f \
	-timescale=1ns/1ps \
	-debug_access+all \
	+error+10 \
	-l comp.log -CFLAGS -DVCS 

run:
	./simv  +UVM_VERBOSITY=UVM_LOW -l run.log  +UVM_TESTNAME=${TEST_NAME} 
	#./simv  +UVM_VERBOSITY=UVM_LOW -l run.log  +UVM_TESTNAME=simple_express_packet_test 

clean: 
	rm -rf *.log *.txt
#	\rm -rf csrc *.log simv* core ucli.key vcdplus.vpd DVEfiles vc_hdrs.h ucli.key
