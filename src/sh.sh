#!/bin/bash
# shell相关命令

# 查看当前运行的shell
echo "${SHELL}"

# 查看系统中安装的所有的shell
cat /etc/shells

# ss=`cat /etc/shells`
# echo -e ${ss}

# 查看bash版本
bash --version
echo ${BASH_VERSION} # 通过环境变量查看

# 判断命令是内置还是外部程序命令
type_cmd() {
  type echo
  type ls
  type type
  type -a echo
  type -a type

  type -t bash # -t返回命令类型：别名(alias)、关键词(keyword)、函数(function)、内置命令(builtin)、文件(file)
  type -t if
  type -t echo
}

# 命令组合符&&和||
# cmd1 && cmd2,表示cmd1运行成功则继续cmd2；
# cmd1 || cmd2，表示cmd1运行失败，则继续运行cmd2；
cat file.txt
ls -a file.txt                 # cat命令执行结束，不管成功失败继续运行ls；
cat file.txt && ls -a file.txt # 表示cat运行成功才会执行ls
mkdir foo || mkdir bar         # 表示mkdir foo失败才执行mkdir bar
