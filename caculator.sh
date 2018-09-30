#!/bin/bash
#shell练习，写一个计算器

case $1 in 
  #加
  "-a")
  c=$(echo "$2+$3"|bc)
  echo $c
  ;;
  #减
  "-s")
  c=$(echo "$2-$3"|bc)
  c2=$(echo $c | cut -d "." -f 1)
  if [ -z $c2 ];then
    c=0"$c"
  fi
  echo $c
  ;;
  #乘
  "-m")
  c=$(echo "$2*$3"|bc)
  echo $c
  ;;
  #除
  "-d")
  c=$(echo "$2/$3"|bc)
  echo $c
  ;;
  *)
  echo 请输入正确的选项
  ;;

esac
