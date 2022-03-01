#!/bin/bash
# 向shell脚本传参
# 脚本内参数格式：$n.n代表一个数字，$1表示脚本的第一个参数,$2第二个。。。 注：$0表示文件名

echo "shell pass argue"
echo "执行的文件名：$0"
echo "第1个参数：$1"
echo "第2个参数：$2"

echo "传递的参数个数：$#"
echo "传递所有参数：$*"
echo "传递所有参数：$@"
echo "当前进程号：$$"
echo "后台运行的最后一个进程号：$!"
echo "运行shell最后的退出状态：$?"

# chmod +x ./arg.sh
# bash ./arg.sh "hello" "world"
# bash ./arg.sh 1 "world"

