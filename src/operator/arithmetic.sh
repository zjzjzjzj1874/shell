#!/bin/bash
# 算术运算符

# :<<EOF
# a=10;b=20
# 运算符  说明	                                     举例
# +	   加法	                                        `expr $a + $b` 结果为 30。
# -	   减法	                                        `expr $a - $b` 结果为 -10。
# *	   乘法	                                        `expr $a \* $b` 结果为  200。
# /	   除法	                                        `expr $b / $a` 结果为 2。
# %	   取余	                                        `expr $b % $a` 结果为 0。
# =	   赋值	                                        a=$b 把变量 b 的值赋给 a。
# ==	   相等。用于比较两个数字，相同则返回 true。	     [ $a == $b ] 返回 false。
# !=	   不相等。用于比较两个数字，不相同则返回 true。	  [ $a != $b ] 返回 true。
# 注意：表达式需要放在中括号[]之间，并且要有空格，如：[$a==$b]是错误的，正确的：[ $a == $b ]
# EOF

a=10;b=20

# 运算
operation(){
    val=`expr $a + $b`
    echo "a+b=${val}"
    val=`expr $a - $b`
    echo "a-b = ${val}"
    val=`expr $a \* $b`
    echo "a * b : $val"
    val=`expr $b / $a`
    echo "b / a : $val"
    val=`expr $b % $a`
    echo "b % a : $val"
}

# 比较
compare(){
    if [ $a == $b ];then
        echo "a == b"
    else 
        echo "a != b"
    fi

    if [ $a != $b ];then
        echo "a != b"
    else 
        echo "a == b"
    fi
}

# 乘号(*)前边必须加反斜杠(\)才能实现乘法运算；
# 在 MAC 中 shell 的 expr 语法是：$((表达式))，此处表达式中的 "*" 不需要转义符号 "\" 。
