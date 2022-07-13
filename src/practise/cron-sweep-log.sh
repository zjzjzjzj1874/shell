#!/bin/bash
# 使用Linux系统的crontab每天凌晨两点自动清理日志文件:默认保留7天的日志

# 使用规则
# 1.将该文件放入服务器某个文件夹: /home/ubuntu/script/cron-sweep-log.sh
# 2.赋予可执行权限: `chmod +x /home/ubuntu/script/cron-sweep-log.sh`
# 3.开启crontab: `cd /etc && crontab -e` => 然后`0 2 * * * /home/ubuntu/script/cron-sweep-log.sh > /dev/null 2>&1` => 写入crontab中,每天凌晨2点执行脚本

DEFAULT_DAY=7 # 默认保留时间
maxDay=$1     # 手动控制传入天数

if [ -z "${maxDay}" ]; then
  echo "未传入保留天数,系统将自动保留7天日志"
  maxDay=$DEFAULT_DAY
fi

echo "手动控制传入天数:最大保留${maxDay}天"
if [ ${maxDay} -le 0 ]; then
  maxDay=$DEFAULT_DAY
  echo "修正保留日志时间:$maxDay"
fi

# 日志路径
homeLogPath="/home/ubuntu/logs"
logPaths=("$homeLogPath")

for p in ${logPaths[*]}; do
  # 判断日志路径是否存在
  if [[ -d ${p} ]]; then
    find "${p}" -name "*.log*" -mtime +${maxDay} -exec sudo rm -rf {} \;
  else
    echo "路径不存在: ${p}"
  fi
done
