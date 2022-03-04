#!/bin/bash

# 文件测试运算符
# 文件测试运算符用于检测 Unix 文件的各种属性。
# 属性检测描述如下：

# 操作符	 说明	                                                                举例
# -b file	检测文件是否是块设备文件，如果是，则返回 true。	                            [ -b $file ] 返回 false。
# -c file	检测文件是否是字符设备文件，如果是，则返回 true。	                        [ -c $file ] 返回 false。
# -d file	检测文件是否是目录，如果是，则返回 true。	                            [ -d $file ] 返回 false。
# -f file	检测文件是否是普通文件（既不是目录，也不是设备文件），如果是，则返回 true。	    [ -f $file ] 返回 true。
# -g file	检测文件是否设置了 SGID 位，如果是，则返回 true。	                    [ -g $file ] 返回 false。
# -k file	检测文件是否设置了粘着位(Sticky Bit)，如果是，则返回 true。	            [ -k $file ] 返回 false。
# -p file	检测文件是否是有名管道，如果是，则返回 true。	                        [ -p $file ] 返回 false。
# -u file	检测文件是否设置了 SUID 位，如果是，则返回 true。	                    [ -u $file ] 返回 false。
# -r file	检测文件是否可读，如果是，则返回 true。	                                [ -r $file ] 返回 true。
# -w file	检测文件是否可写，如果是，则返回 true。	                                [ -w $file ] 返回 true。
# -x file	检测文件是否可执行，如果是，则返回 true。	                            [ -x $file ] 返回 true。
# -s file	检测文件是否为空（文件大小是否大于0），不为空返回 true。	                [ -s $file ] 返回 true。
# -e file	检测文件（包括目录）是否存在，如果是，则返回 true。	                        [ -e $file ] 返回 true。

# 其他检查符：
# -S: 判断某文件是否 socket。
# -L: 检测文件是否存在并且是一个符号链接。

f="/Users/rock/ShellProjects/shell-study/src/operator/file.sh"

if [ -b $f ];then
    echo "块文件"
else
    echo "不是块文件"
fi

if [ -d ${f} ];then
    echo "目录"
fi

if [ -e ${f} ];then
    echo "存在"
fi

if [ -s ${f} ];then # 文件是否大于0
    echo "不为空"
fi

if [ -x ${f} ];then   
    echo "可执行"
fi

if [ -r ${f} ];then
    echo "可读"
fi

if [ -w ${f} ];then
    echo "可写"
fi

if [ -f ${f} ];then 
    echo "普通文件"
fi

if test -e ./bash
then 
    echo "文件存在"
else 
    echo "文件不存在"
fi