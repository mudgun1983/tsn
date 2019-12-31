.PHONY:compile run
#export COMP_OPTS := vcs -full64 -sverilog -ntb_opts uvm-1.1 -timescale=1ns/1ps
export COMP_OPTS := vcs -full64 -sverilog -licqueue -timescale=1ns/1ps
export VERDI_PATH := /home/liaoyuan/synopsys/verdi_2016.06-1/share/PLI/VCS/LINUX64
#export UVM_HOME := /home/liaoyuan/synopsys/vcs_2016.06/etc/uvm-1.1
export UVM_HOME := /home/liaoyuan/mac_1588/tsn/VER/common/uvm-1.1b
set_up:
	./setup.sh

lib_vlogan:
	./compile.sh

compile:set_up mk_dir remove_vlogan lib_vlogan
	$(COMP_OPTS) \
	xil_defaultlib.pcs_tb_top xil_defaultlib.glbl \
	+vpi \
	-debug_access+all \
	${UVM_HOME}/src/dpi/uvm_dpi.cc \
	-P ${VERDI_PATH}/novas.tab \
	${VERDI_PATH}/pli.a \
	-o $(EXE_PATH)/simv -l $(LOG_PATH)/uvm_test.log \
	-fsdb xil_defaultlib.pcs_tb_top \
	-CFLAGS -DVCS

export mode := base_fun
export EXE_PATH := $(mode)/exec
export LOG_PATH := $(mode)/log
export WAVE_PATH := $(mode)/wave
export tc := simple_e_p_mix_random_test
export seed := 

ifeq (,$(seed))
	seed := $(shell date +'%Y%m%d')
endif

mk_dir:
	$(shell if [ ! -e $(EXE_PATH) ];then mkdir -p $(EXE_PATH); fi)
	$(shell if [ ! -e $(LOG_PATH) ];then mkdir -p $(LOG_PATH); fi)
	$(shell if [ ! -e $(WAVE_PATH) ];then mkdir -p $(WAVE_PATH); fi)
run:compile
	$(EXE_PATH)/simv +UVM_VERBOSITY=UVM_LOW -l $(LOG_PATH)/$(tc)_$(seed).log +UVM_TESTNAME=$(tc) -ucli -do ./wave.do +fsdbfile+$(WAVE_PATH)/$(tc)_$(seed).fsdb +ntb_random_seed=$(seed)

verdi:
	verdi +v2k -sverilog -f ../cfg/dut_filelist.f -f ../cfg/filelist_hw_engine.f -vcs_assert off -ssf tb_top.fsdb
remove_vlogan:
	`rm -rf ./vlogan.log`
clean_all:
	`rm -rf ./vlogan.log $(mode)`

print_date:
	`date +"%y%m%d"`



#$(EXE_PATH)/simv +UVM_VERBOSITY=UVM_LOW -l $(LOG_PATH)/$(tc).log +UVM_TESTNAME=$(tc)
#./simv +UVM_VERBOSITY=UVM_LOW -l $(LOG_PATH)/$(tc).log +UVM_TESTNAME=$(tc)
#-o $(EXE_PATH)/simv -l $(LOG_PATH)/compile.log \
