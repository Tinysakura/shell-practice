#!/bin/bash
#shell练习，判断分区的占有情况

rate=$(df -h | grep /dev/disk1s1 | awk '{print $5}' | cut -d "%" -f 1)

if [ $rate -ge 70 ];then
  echo "磁盘容量已经使用超过70%,请注意磁盘用量"
else
  echo "磁盘容量充足请放心使用"
fi
