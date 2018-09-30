#!/bin/bash
#shell练习，批量压缩或解压缩某个目录下的所有文件

if [ $1 == "-d" ];then
  read -p "请输入需要批量解压文件的目录:" path
elif [ $1 == "-c" ];then 
  read -p "请输入需要批量压缩文件的目录:" path
else
  echo "请输入正确的选项"
fi

cd $path

if [ $1 == "-d" ];then
ls *.tar.gz > ls.log

for i in $(cat ls.log)
  do
   #将多余的输出扔到/dev/null
   tar -zxf $i & > /dev/null
  done

rm -rf ls.log
fi
