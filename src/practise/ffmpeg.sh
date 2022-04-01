#!/bin/bash
# ffmpeg测试流地址，正常就保存mp4文件，失败就写失败日志

HOME=/Users/rock/log/ffmpeg/ # 保存的路径
DEVICEFILE=/Users/rock/device.txt # 设备流地址目标文件  格式：deviceID   rtsp_url
FRAMECOUNT=250 # 视频帧
TIMEOUTSec=10 # 超时秒
timeout=`expr $TIMEOUTSec \* 1000000`

failureLog="${HOME}failure.log"
successLog="${HOME}success.log"

con=`cat ${DEVICEFILE}| awk '{print $0}'`
let i=0
deviceID=0
for item in ${con}; do 
    val=`expr $i % 2`
    let i++
    if [ $val == 1 ];then
        echo "============================== 设备ID：${deviceID},流地址：${item} =============================="

        ffmpeg -stimeout $timeout -rtsp_transport tcp -i $item -vframes $FRAMECOUNT -y $HOME${deviceID}.mp4 # 设置超时时间:10s

        code=$?
        if [ $code -ne 0 ];then 
            echo "rtsp采集失败，设备ID：${deviceID},流地址：${item}" >> $failureLog
            continue
        fi
        echo "成功，设备ID：${deviceID},流地址：${item}" >> $successLog
    else
        deviceID=$item
    fi
done
