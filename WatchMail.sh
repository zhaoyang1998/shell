#!/bin/bash

# $1为执行任务  $2 为发送的邮件
nohup $1 > ${2}.out 2>&1 & echo $! > ${2}.pid



#通过pid监测
watch=`cat ${2}.pid`

#rm -f  cmd.pid
#监测到任务结束发送邮件
while true
do
        PROC_NAME=${watch}
        ProcNumber=`ps -ef |grep -w $PROC_NAME|grep -v grep|wc -l`
        if [ $ProcNumber -le 0 ];then
                cat ${2}.out| mail -s "${1}任务完成通知"  "${2}"
                break
        else
                sleep 30
        fi
done
rm -f ${2}.out ${2}.pid
