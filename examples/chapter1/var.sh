#!/bin/bash
###
 # @Author: zjzjzjzj1874 zjzjzjzj1874@gmail.com
 # @Date: 2025-02-05 15:40:32
 # @LastEditors: zjzjzjzj1874 zjzjzjzj1874@gmail.com
 # @LastEditTime: 2025-02-26 16:09:59
 # @FilePath: /shell/examples/chapter1/var.sh
 # @Description: 变量的定义及使用
### 

NAME=hello # 定义变量
echo $NAME # 使用变量 输出为：hello
NAME=world # 重新赋值
echo $NAME # 输出：world

readonly NAME # 设置变量为只读，此时不能再修改变量
NAME="Hello World." # 再修改会有警告⚠️
echo ${NAME} # 输出仍为：world
name='hello world'
echo $name # 输出：hello world
unset name # 删除变量. 变量被删除后不能再次使用；unset 命令不能删除只读变量
echo $name # 变量已被删除，输出空白

# 变量数组遍历
for skill in C GO PHP Java Swift Python
do
    echo "I am good at ${skill} language."
done

# 特殊的变量
# $0: 当前脚本的文件名
# $n：传递给脚本或函数的参数，n代表数字，表示第几个参数，第一个参数$1, 第二个参数$2;
# $#：传递给脚本或函数的参数个数；
# $*：传递给脚本或函数的所有参数；
# $@：传递给脚本或函数的所有参数，被双引号("")包含。与$*稍微不同；
# $?：上个命令的退出状态或者函数的返回值；0表示正常；
# $$：当前shell进程ID。

echo "File Name: $0"
echo "First Parameter : $1"
echo "Second Parameter : $2"
echo "Total Number of Parameters : $#"
echo "Quoted Values: $@"
echo "Quoted Values: $*"
echo "当前进程ID: $$"

for var in $*
do
    echo this is $var
done

for var in $@
do
    echo "once again $var"
done


# 命令替换 命令替换是指Shell可以先执行命令，将输出结果暂时保存，在适当的地方输出。
# 语法：`command`
DATE=`date`
echo "date is $DATE"

# 把结果保存下来，然后再遍历，可以实现很多比较复杂的功能的shell # 注意，这里还有一些问题，MacOS上无法正常显示，但是Ubuntu上可以显示 'pod ==== '
pods=`kubectl get pods --no-headers | awk '{print $1}'` # Ubuntu，ok; macos !ok
pods=($(kubectl get pods --no-headers | awk '{print $1}')) # macos ok; ubuntu !ok
for pod in $pods
do
    echo "pod ==== $pod"
done

# 
# 变量替换可以根据变量的状态（是否为空、是否定义等）来改变它的值。
# 可以使用的变量替换形式：
# 形式	            说明
# ${var}	        变量本来的值
# ${var:-word}	    如果变量 var 为空或已被删除(unset)，那么返回 word，但不改变 var 的值。
# ${var:=word}	    如果变量 var 为空或已被删除(unset)，那么返回 word，并将 var 的值设置为 word。
# ${var:?message}	如果变量 var 为空或已被删除(unset)，那么将消息 message 送到标准错误输出，可以用来检测变量 var 是否可以被正常赋值。若此替换出现在Shell脚本中，那么脚本将停止运行。
# ${var:+word}	    如果变量 var 被定义，那么返回 word，但不改变 var 的值。

# 遍历当前目录下的所有文件
for file in *
do
    echo $file
done