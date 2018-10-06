# !/bin/bash

cpu_num=$(grep "cpu cores" /proc/cpuinfo | uniq | cut -d ":" -f 2)
echo cpu num: $cpu_num

memory_total=$(top -b -n 1 | grep "KiB Mem" | awk '{printf $3}' | cut -d "%" -f 1)
memory_total=$(awk 'BEGIN{printf"%.1f\n",'$memory_total'/'1024'/'1024'}')
memory_total="$memory_total"G
echo memory total: $memory_total

memory_free=$(top -b -n 1 | grep "KiB Mem" | awk '{printf $7}' | cut -d "%" -f 1)
memory_free=$(($memory_free/1024))
memory_free="$memory_free"M
echo memory free: $memory_free

$(sudo du -hs / >& temp)
disk_size=$(grep "^[1-9]" temp | cut -f 1)
echo disk size: $disk_size

system_bit=$(getconf LONG_BIT)
echo system bit: $system_bit

process=$(top -b -n 1 | grep Tasks | awk '{printf $2}' | cut -d "%" -f 1 )
echo process: $process

# only attemp to ubantu
software_num=$(dpkg -l | wc -l)
echo software num: $software_num

ip=$(ifconfig eth0 | grep "inet addr" | awk '{printf $2}' | cut -d ":" -f 2)
echo ip: $ip
