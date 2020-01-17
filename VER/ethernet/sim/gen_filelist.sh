#!/bin/csh 
if ( "$1" == "" )   then
      printf "\n usage : require the input patameter\n"
      exit 1
endif

#����ļ���
set f_name = filelist.f

#del left $f_name
\rm -rf  $f_name >/dev/null

#���������������

foreach i ( $* )
   if ( -d  $i ) then      #�г�Ŀ¼����*.v�ļ�   
      echo list dir is $i
      #find $i -name "*.v" -print | tee -a $f_name   #����Ļ��ʾ��������ļ�
      find $i -name "*.*v" > $f_name
      #find $i -name "*.v" > $f_name
   else
      if ( -f  $i ) then   #if $i is file
         echo list file is $i
         printf "%s\n" $i  | tee  -a $f_name  #�г������ļ�
      else
         printf "Error : the input path %s not exsit!\n" $i
      endif
   endif
end

