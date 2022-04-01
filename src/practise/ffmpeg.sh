#!/bin/bash
# ffmpeg测试流地址，正常就保存mp4文件，失败就写失败日志

HOME=/Users/rock/log/ffmpeg/ # 保存的路径
DEVICEFILE=/Users/rock/device.txt # 设备流地址目标文件  格式：deviceID   rtsp_url
FRAMECOUNT=250 # 视频帧
TIMEOUTSec=10 # 超时秒
timeout=`expr $TIMEOUTSec \* 1000000`

failureLog="${HOME}failure.log"
successLog="${HOME}success.log"
successCount=0 # 失败数量
failureCount=0 # 成功数量
totalCount=0 # 总数量

# 使用ffmpeg测试，超时：10s；成功截取一段视频；失败：写日志
ffmpeg_check() {
    con=`cat ${DEVICEFILE}| awk '{print $0}'`
    let i=0
    let success=0
    let failure=0
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
                let failure++
                continue
            fi
            echo "成功，设备ID：${deviceID},流地址：${item}" >> $successLog
            let success++
        else
            deviceID=$item
        fi
    done
    successCount=$success
    failureCount=$failure
}

# 使用ffprobe验证
ffprobe_check() {
    con=`cat ${DEVICEFILE}| awk '{print $0}'`
    let i=0
    let success=0
    let failure=0
    deviceID=0
    for item in ${con}; do 
        val=`expr $i % 2`
        let i++
        if [ $val == 1 ];then
            echo "============================== 设备ID：${deviceID},流地址：${item} =============================="

            ffprobe -stimeout $timeout -rtsp_transport tcp -i $item # 设置超时时间和连接协议

            code=$?
            if [ $code -ne 0 ];then 
                echo "rtsp采集失败，设备ID：${deviceID},流地址：${item}" >> $failureLog
                let failure++
                continue
            fi
            echo "成功，设备ID：${deviceID},流地址：${item}" >> $successLog
            let success++
        else
            deviceID=$item
        fi
    done
    successCount=$success
    failureCount=$failure
}

ffprobe_check


echo "====================================finish===================================="

totalCount=`expr $successCount + $failureCount`
echo "总路数：${totalCount},失败数量：${failureCount}，成功数量：$successCount"