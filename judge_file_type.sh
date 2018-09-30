#!/bin/bash
#shell练习，判断一个文件的类型

read -p "请输入文件的完整路径" filepath

if [ ! -e $filepath ];then
   echo "没有该文件"
  elif [ -f $filepath ];then 
      echo "该文件是普通文件"
  elif [ -r $filepath ];then
      echo "该文件是目录文件"
  else
    echo "该文件是特殊文件"
fi
