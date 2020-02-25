#call \$fsdbDumpfile(\"qbv.fsdb\")
#call \$fsdbDumpvars 0 xil_defaultlib.pcs_tb_top
call \$fsdbDumpvars(0,pcs_tb_top)
#call \$fsdbDumpoff
#call \$fsdbDumpon
#run 50000ns
call \$fsdbDumpon
run 50000ns
run
