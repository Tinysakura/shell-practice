# !/bin/bash

STU_PATTERN="^[a-z][a-z]{0,}[a-z]$"

function rand(){
    min=$1
    max=$(($2-$min+1))
    num=$(($RANDOM+1000000000)) #增加一个10位的数再求余
    echo $(($num%$max+$min))
}
 
   if [ "$4" -gt 10 ] 2>/dev/null;then
      echo parameter4 error
      exit 1
   fi

   if [[ !"$3" =~ $STU_PATTERN ]];then
      echo parameter3 error
      echo $3
      exit 1
   fi


   if [ "$1" == add ];then
      #add teacher
      if id -u $2 >/dev/null 2>&1;then
         echo $2:******
      else
        random_pwd=$(rand 100000 999999) 
        $(sudo useradd $2 -p $random_pwd >/dev/null 2>&1) 
        echo $2:$random_pwd
      fi

      #add student
      for((i=1;i<="$4";i=i+1))
         do
           stu="$3"$i
           if id -u $stu >/dev/null 2>&1;then
             echo $stu:******
           else
             random_pwd=$(rand 100000 999999) 
             $(sudo useradd $stu -p $random_pwd >/dev/null 2>&1) 
             echo $stu:$random_pwd
           fi
         done
   fi

   if [ "$1" == del ];then
      #del teacher
      $(sudo userdel -r $2 >/dev/null 2>&1)

      for((i=1;i<="$4";i=i+1))
        do
         stu="$3"$i
         $(sudo userdel -r $stu >dev/null 2>&1)
        done
   fi
