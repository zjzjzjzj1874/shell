#!/bin/bash
# 关系运算符
# 关系运算符只支持数字，不支持字符串(数值型字符串除外)；

# 运算符     说明	                                         举例
# -eq	    检测两个数是否相等，相等返回 true。	                [ $a -eq $b ] 返回 false。
# -ne	    检测两个数是否不相等，不相等返回 true。	             [ $a -ne $b ] 返回 true。
# -gt	    检测左边的数是否大于右边的，如果是，则返回 true。	  [ $a -gt $b ] 返回 false。
# -lt	    检测左边的数是否小于右边的，如果是，则返回 true。	   [ $a -lt $b ] 返回 true。
# -ge	    检测左边的数是否大于等于右边的，如果是，则返回 true。	[ $a -ge $b ] 返回 false。
# -le	    检测左边的数是否小于等于右边的，如果是，则返回 true。	[ $a -le $b ] 返回 true。

a=10;b=20

if [ ${a} -eq ${b} ]
then    
    echo "a = b : ${a}"
else   
    echo "a(${a}) != b(${b})"
fi

if [ ${a} -ne ${b} ];then
    echo "a != b"
else
    echo "a = b"
fi

if [ ${a} -gt ${b} ];then
    echo "a > b"
else 
    echo "a <= b"
fi

if [ ${a} -ge ${b} ];then
    echo "a >= b"
else 
    echo "a < b"
fi

if [ ${a} -lt ${b} ];then
    echo "a<b"
else    
    echo "a>=b"
fi

if [ ${a} -le ${b} ];then
    echo "a<=b"
else 
    echo "a > b"
fi