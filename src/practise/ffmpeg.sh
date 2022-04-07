#!/bin/bash
# ffmpeg测试流地址，正常就保存mp4文件，失败就写失败日志

HOME=/Users/rock/log/ffmpeg/ # 保存的路径
DEVICEFILE=/Users/rock/device.txt # 设备流地址目标文件  格式：deviceID   rtsp_url
FRAMECOUNT=250 # 视频帧
TIMEOUTSec=10 # 超时秒
timeout=`expr $TIMEOUTSec \* 1000000`

failureLog="${HOME}failure.log"
successLog="${HOME}success.log"
timeoutLog="${HOME}timeout.log"
successCount=0 # 失败数量
failureCount=0 # 成功数量
timeoutCount=0 # 超时数量
totalCount=0 # 总数量

# 使用ffmpeg测试，超时：10s；成功截取一段视频；失败：写日志
ffmpeg_check() {
    con=`cat ${DEVICEFILE}| awk '{print $0}'`
    let i=0
    let success=0
    let failure=0    
    let timeout=0
    deviceID=0
    for item in ${con}; do 
        val=`expr $i % 2`
        let i++
        if [ $val == 1 ];then
            echo "============================== 设备ID：${deviceID},流地址：${item} =============================="

            timeout 20s ffmpeg -stimeout $timeout -rtsp_transport tcp -i $item -vframes $FRAMECOUNT -y $HOME${deviceID}.mp4 # 设置超时时间:10s

            code=$?
            if [ $code -ne 0 ];then 
                if [ $code -eq 124 ];then 
                    echo "超时！！！rtsp采集超时，设备ID：${deviceID},流地址：${item}" >> $timeoutLog
                    let timeout++
                    continue
                fi

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
    timeoutCount=$timeout
}

# 使用ffprobe验证 => ffprobe用来检测音频问题
ffprobe_check() {
    con=`cat ${DEVICEFILE}| awk '{print $0}'`
    let i=0
    let success=0
    let failure=0
    let timeout=0
    deviceID=0
    for item in ${con}; do 
        val=`expr $i % 2`
        let i++
        time=$(date "+%Y-%m-%d %H:%M:%S")
        if [ $val == 1 ];then
            echo "============================== 设备ID：${deviceID},流地址：${item} =============================="

            timeout 20s ffprobe -stimeout $timeout -rtsp_transport tcp -i $item # 设置超时时间和连接协议 timeout：macos请先安装：brew install coreutils

            code=$?
            if [ $code -ne 0 ];then 
                if [ $code -eq 124 ];then 
                    echo "$time ==> 超时！！！rtsp采集超时，设备ID：${deviceID},流地址：${item}" >> $timeoutLog
                    let timeout++
                    continue
                fi

                echo "$time ==> rtsp采集失败,code:${code},设备ID：${deviceID},流地址：${item}" >> $failureLog
                let failure++
                continue
            fi
            echo "$time ==> 成功，设备ID：${deviceID},流地址：${item}" >> $successLog
            let success++
        else
            deviceID=$item
        fi
    done
    successCount=$success
    failureCount=$failure
    timeoutCount=$timeout
}

ffprobe_check

time=$(date "+%Y-%m-%d %H:%M:%S")
echo "$time ==> ====================================finish===================================="

totalCount=`expr $successCount + $failureCount + $timeoutCount`
result="$time ==> 总路数：${totalCount},失败数量：${failureCount}，成功数量：$successCount,超时数量：$timeoutCount"
echo $result >> $successLog
echo $result >> $failureLog
echo $result >> $timeoutLog