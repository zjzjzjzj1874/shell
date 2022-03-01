#!/bin/bash
# 读取输入的参数
read -p "input a:" a
read -p "input b:" b

r=$[a+b]
echo "result:${a} + ${b} = ${r}"