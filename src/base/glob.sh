#!/bin/bash
# bash的模式扩展

set -o noglob
set -f # 两个命令都是关闭模式扩展

# 打开扩展
set +o noglob
set +f

# 波浪线模式
wavy_line(){
    # 波浪线~自动扩展成当前用户主目录
    echo ~

    # ~/dir ==> 进入主目录的某个子目录 
    cd ~/tools

    # ~user ==> 扩展成用户的主目录
    cd ~rock 

    # ~+:扩展成所在目录 = pwd命令
    echo ~+
}

# 其他的命令初体验
other(){
    env

    myvar=USER
    echo ${myvar}
    echo ${!myvar} # 变量本身也是变量，使用！直接读取最终值
    echo \${date}
}

# 问号星号字符扩展
question_star_mark(){
    # 一个问号？表示匹配单个字符
    res=`cd /Users/rock/ShellProjects/shell-study/src && ls ?.sh`
    echo ${res}
    # 两个问号？表示匹配两个字符的文件
    res=`cd /Users/rock/ShellProjects/shell-study/src && ls ??.sh`
    echo ${res}
    # *表示匹配任意数量字符的文件
    res=`cd /Users/rock/ShellProjects/shell-study/src && ls *.sh`
    echo ${res}
    # st*表示匹配st开头的sh文件
    res=`cd /Users/rock/ShellProjects/shell-study/src && ls st*.sh`
    echo ${res}
    # *h*表示匹配包含h的文件
    res=`cd /Users/rock/ShellProjects/shell-study/src && ls *h*`
    echo ${res}
}

# 方括号扩展
square_bracket(){
    # [abcde] 匹配5个中的一个
   res=`cd /Users/rock/ShellProjects/shell-study/src && ls [sh].sh` # 匹配其中的s.sh或者h.sh
   echo ${res}
    
   res=`cd /Users/rock/ShellProjects/shell-study/src && ls [sh]*.sh` # 匹配所有以s或者h开头的文件名
   echo ${res}
}


# question_star_mark
square_bracket