#!/bin/bash
# test命令：用于检查某个条件是否成立：对数值、字符和文件测试

# 文件判断
if test -e ./bash;then echo "bash文件存在";else echo "不存在";fi

# 数值验证
n1=100;n2=200;if test ${n1} -eq ${n2};then echo "n1 = n2";else echo "n1 != n2";fi

# 字符串比较
s1=abc;s2=efg;if test ${s1} = ${s2};then echo "s1 = s2";else echo "s1 != s2";fi