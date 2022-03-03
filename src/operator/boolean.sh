#!/bin/bash
# 布尔运算符

# 下表列出了常用的布尔运算符，假定变量 a 为 10，变量 b 为 20：

# 运算符	 说明	                                            举例
# !	        非运算，表达式为 true 则返回 false，否则返回 true。	     [ ! false ] 返回 true。
# -o	    或运算，有一个表达式为 true 则返回 true。	            [ $a -lt 20 -o $b -gt 100 ] 返回 true。
# -a	    与运算，两个表达式都为 true 才返回 true。	            [ $a -lt 20 -a $b -gt 100 ] 返回 false。

a=10
b=20

if [ ${a} != ${b} ];then
    echo "a != b"
else 
    echo "a == b"
fi

if [ ${a} -gt 10 -o ${b} -gt 10 ];then
    echo "a > 10 or b > 10"
else 
    echo "a <= 10 and b <= 10"
fi

if [ ${a} -lt 100 -a ${b} -lt 100 ]
then
    echo "a < 100 && b < 100"
else 
    echo "not"
fi