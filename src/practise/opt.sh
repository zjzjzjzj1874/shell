#!/bin/bash

# 定义帮助函数
show_help() {
    echo "用法: ./script.sh [选项]"
    echo "选项:"
    echo "  --help       显示帮助信息"
    echo "  -e <环境>     指定环境参数[dev/test/pro]"
    echo "  -p <项目>     指定项目参数[pro-a/pro-b/pro-c]"
    echo "  -m <中间件>   指定中间件参数[redis/mongo/mysql]"
}

# 定义默认值
env=""
project=""
middleware=""

# 处理帮助选项
if [[ "$1" == "--help" ]] || [[ "$1" == "-h" ]]; then
    show_help
    exit 0
fi

# 获取命令行参数
while getopts ":e:p:m:" opt; do
  case $opt in
    e)
      env="$OPTARG"
      ;;
    p)
      project="$OPTARG"
      ;;
    m)
      middleware="$OPTARG"
      ;;
    \?)
      echo "!!!无效的选项: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

# 输出获取的参数
echo "环境参数: $env"
echo "项目参数: $project"
echo "中间件参数: $middleware"

# 运行其他命令或操作
# ...

