#!/bin/bash

#精确当前时间
curr=$(date +'%Y-%m-%d %H:%M:%S')
echo $curr
##把当前时间做成时间戳
#
## shellcheck disable=SC2006
#timestamp=`date -d "${curr}" + %s`
#
#curTs=$((timestamp*1000+`date "+%N"`/1000000))
#
#echo $curTs

cur_sec=$(date '+%s')
echo $cur_sec

# shell时间相关操作 => https://blog.csdn.net/AQ931752921/article/details/85071221
