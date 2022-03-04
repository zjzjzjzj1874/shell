#!/bin/bash
# 向shell脚本传参
# 脚本内参数格式：$n.n代表一个数字，$1表示脚本的第一个参数,$2第二个。。。 注：$0表示文件名

echo "shell pass argue"

print_func(){ # 定义一个函数
    echo "第1个参数：$1"
    echo "第2个参数：$2"
    echo "第3个参数：$3"
}

print_func "$@" # 把传入的参数全部传给函数,注意：传所有参数需要使用@，不能用*
print_func "$*" # *,以字符串打印所有，所以函数内只有一个有效，第二个第三个都是为空，@就没有问题
print_func "$1" "$2" # 将第1，2个参数传给函数
 
if [ -n "$1" ];then # 注意：[]与中间的代码需要空格隔开，否则会报错
    echo "有参数：第一个为：$1"
else
    echo "没有参数"
fi

echo "执行的文件名：$0"
echo "第1个参数：$1"
echo "第2个参数：$2"

echo "传递的参数个数：$#"
echo "传递所有参数作为字符串显示：$*"
echo "传递所有参数作为字符串显示：$@"
echo "当前进程号：$$"
echo "后台运行的最后一个进程号：$!"
echo "运行shell最后的退出状态：$?"

# chmod +x ./arg.sh
# bash ./arg.sh "hello" "world"
# bash ./arg.sh 1 "world"

