#!/bin/bash
# shell相关命令

# 查看当前运行的shell
echo ${SHELL}

# 查看系统中安装的所有的shell
cat /etc/shells

# ss=`cat /etc/shells`
# echo -e ${ss}

# 查看bash版本
bash --version
echo ${BASH_VERSION} # 通过环境变量查看

# 判断命令是内置还是外部程序命令
type echo
type ls
type type
type -a echo
type -a type


type -t bash # -t返回命令类型：别名(alias)、关键词(keyword)、函数(function)、内置命令(builtin)、文件(file)
type -t if
type -t echo
