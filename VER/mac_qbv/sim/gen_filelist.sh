#!/bin/csh 
if ( "$1" == "" )   then
      printf "\n usage : require the input patameter\n"
      exit 1
endif

#输出文件名
set f_name = filelist.f

#del left $f_name
\rm -rf  $f_name >/dev/null

#遍历所有输入参数

foreach i ( $* )
   if ( -d  $i ) then      #列出目录所有*.v文件   
      echo list dir is $i
      #find $i -name "*.v" -print | tee -a $f_name   #在屏幕显示且输出到文件
      find $i -name "*.*v" > $f_name
      #find $i -name "*.v" > $f_name
   else
      if ( -f  $i ) then   #if $i is file
         echo list file is $i
         printf "%s\n" $i  | tee  -a $f_name  #列出单个文件
      else
         printf "Error : the input path %s not exsit!\n" $i
      endif
   endif
end

