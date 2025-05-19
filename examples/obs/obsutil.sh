#!/bin/bash

# 检查参数
if [ $# -lt 1 ]; then
    echo "Usage: $0 <obs_path1> [obs_path2 ...]"
    echo "Example: $0 CVAT_data/ frame/ test/"
    exit 1
fi

# 设置日志文件
LOG_DIR="logs"
LOG_FILE="${LOG_DIR}/obs_stats_$(date +%Y%m%d_%H%M%S).log"

# 创建日志目录
mkdir -p "${LOG_DIR}"

# 定义日志函数
log_message() {
    echo "$1" | tee -a "${LOG_FILE}"
}

# 定义表格分隔线函数
print_separator() {
    echo "┌─────────────────┬────────────────────┬────────────────────┬──────────────┬─────────────┬─────────────────┐" | tee -a "${LOG_FILE}"
}

print_middle_separator() {
    echo "├─────────────────┼────────────────────┼────────────────────┼──────────────┼─────────────┼─────────────────┤" | tee -a "${LOG_FILE}"
}

print_header() {
    printf "│ %-15s │ %-16s │ %-16s │ %-12s │ %-11s │ %-15s │\n" "目录" "开始时间" "结束时间" "耗时(秒)" "对象数量" "总占用空间" | tee -a "${LOG_FILE}"
}

BUCKET="obs://ywaq"

# 记录脚本开始执行时间
log_message "脚本执行开始时间: $(date '+%Y-%m-%d %H:%M:%S')"
log_message "统计目录: $*"
log_message ""

# 打印表头
print_separator
printf "│%-83s│\n" "                                    OBS目录统计信息                                        " | tee -a "${LOG_FILE}"
print_separator
print_header
print_middle_separator

# 遍历所有输入的目录
for OBS_PATH in "$@"; do
    # 记录开始时间
    start_time=$(date +%s)
    start_time_str=$(date "+%H:%M:%S")
    
    # log_message "${OBS_PATH}"
    
    # 执行obsutil命令并获取结果
    result=$(obsutil ls ${BUCKET}/${OBS_PATH} -du -limit=0)
    
    # 记录结束时间
    end_time=$(date +%s)
    end_time_str=$(date "+%H:%M:%S")
    
    # 计算耗时（秒）
    duration=$((end_time - start_time))
    
    # 获取对象数量（两种方式）
    object_count_1=$(echo "$result" | grep "Listing objects" | awk -F'[][]' '{print $2}')
    object_count_2=$(echo "$result" | grep -c "^obs://")
    
    # 使用有效的计数结果
    if [ -n "$object_count_1" ]; then
        object_count=$object_count_1
    else
        object_count=$object_count_2
    fi
    
    # 使用awk提取总大小
    total_size=$(echo "$result" | grep "\[DU\]" | awk '{print $6, $7}')
    
    # 如果没有获取到大小信息，显示为"N/A"
    if [ -z "$total_size" ]; then
        total_size="N/A"
    fi
    
    # 打印结果行
    printf "│ %-15s │ %-16s │ %-16s │ %-12s │ %-11s │ %-15s │\n" \
        "${OBS_PATH}" "${start_time_str}" "${end_time_str}" "${duration}" "${object_count}" "${total_size}" | tee -a "${LOG_FILE}"
done

# 打印表格底部
echo "└─────────────────┴────────────────────┴────────────────────┴──────────────┴─────────────┴─────────────────┘" | tee -a "${LOG_FILE}"

# 记录脚本结束时间
log_message ""
log_message "脚本执行结束时间: $(date '+%Y-%m-%d %H:%M:%S')"