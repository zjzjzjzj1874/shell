#!/bin/bash
# 关系运算符
# 关系运算符只支持数字，不支持字符串(数值型字符串除外)；

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