set SolveArrayResizeMax 0
set IterationLimit 5000000
onerror resume
onbreak resume
onElabError resume
onfinish final
  
file delete -force PASS_FAIL.txt 

run -all 

#set fileID [open {PASS_FAIL.txt} {RDWR CREAT}]
#if {[gets $fileID]} {file delete -force ../wave} else {file rename -force ../wave ../wave_err}

#exit
