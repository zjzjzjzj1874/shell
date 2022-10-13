#!/bin/bash
# 字符串运算符

# 下表列出了常用的字符串运算符，假定变量 a 为 "abc"，变量 b 为 "efg"：

# 运算符     说明	                                    举例
# =	        检测两个字符串是否相等，相等返回 true。	        [ $a = $b ] 返回 false。
# !=	    检测两个字符串是否不相等，不相等返回 true。	     [ $a != $b ] 返回 true。
# -z	    检测字符串长度是否为0，为0返回 true。	        [ -z $a ] 返回 false。
# -n	    检测字符串长度是否不为 0，不为 0 返回 true。    [ -n "$a" ] 返回 true。
# $	        检测字符串是否为空，不为空返回 true。	        [ $a ] 返回 true。

a="abc"
b="efg"

if [ ${a} = ${b} ];then 
    echo "a = b"
fi

if [ ${a} != ${b} ]
then 
    echo "a != b"
fi

if [ -z ${a} ];then
    echo "len(a) = 0"
else 
    echo "len(a) != 0"
fi

# shellcheck disable=SC2058
if [ -ne ${a} ];then
    echo "a长度不为0"
fi
# 上面等价于下面
if [ ${#a} -ne 0 ];then # 这个也可以判断a的长度
    echo "a ne 0"
fi

if [ ${a} ];then 
    echo "a不为空"
fi

# a=""
unset a
if [ ${a} ];then 
    echo "a不为空"
else    
    echo "a为空"
fi


name="pro"
svc="prod"
if [[ ${name} =~ ${svc} ]]; then
  echo "匹配"
fi