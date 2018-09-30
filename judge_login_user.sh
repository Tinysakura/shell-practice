#!/bin/bash
#shell练习，判断当前的登录用户是否为root用户

if [ $(whoami) == "root" ]
  then
    echo "当前登录用户是root用户"
  else
    echo "当前登录用户是普通用户"
fi
