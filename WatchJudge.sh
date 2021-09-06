#!/bin/bash

#1.写一个外部参数

#执行后台程序 获取pid
if [ $# -lt 2 ]
then
        echo "输入参数不对"
        exit
fi

#if [ $# -eq 2 ];then
#       if [[ $2 =~ '^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$' ]];then
#               echo "输入没问题"
#       else
#               echo "输入邮箱不对"
#               echo $2
#               exit
#       fi
#fi

./222 "$1" "$2" &
