#!/bin/bash
# bash的模式扩展

set -o noglob
set -f # 两个命令都是关闭模式扩展

# 打开扩展
set +o noglob
set +f

# 波浪线~自动扩展成当前用户主目录
echo ~
# ~/dir ==> 进入主目录的某个子目录 
cd ~/tools
# ~user ==> 扩展成用户的主目录
cd ~rock 
# ~+:扩展成所在目录 = pwd命令
echo ~+

echo \${date}

env

myvar=USER
echo ${myvar}
echo ${!myvar} # 变量本身也是变量，使用！直接读取最终值