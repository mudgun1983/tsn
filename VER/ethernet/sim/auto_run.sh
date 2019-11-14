while read LINE
do
#echo $LINE
firstbyte=${LINE:0:1}
#echo $firstbyte
if [ $firstbyte == "#" ]; then
  echo "not valid case"
else
 # echo "valid case"
	./simv  +UVM_VERBOSITY=UVM_LOW -l run.log  +UVM_TESTNAME=$LINE 
fi
done  < test_list
