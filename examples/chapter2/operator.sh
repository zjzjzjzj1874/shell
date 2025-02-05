#!/bin/bash
###
 # @Author: zjzjzjzj1874 zjzjzjzj1874@gmail.com
 # @Date: 2025-02-05 16:13:14
 # @LastEditors: zjzjzjzj1874 zjzjzjzj1874@gmail.com
 # @LastEditTime: 2025-02-05 16:36:26
 # @FilePath: /shell/examples/chapter2/operator.sh
 # @Description: 运算符
### 

# 算术运算符
# 运算符	说明	    举例
# +	    加法	`expr $a + $b` 结果为 30。
# -   	减法	`expr $a - $b` 结果为 10。
# `*`   乘法	`expr $a \* $b` 结果为  200。
# /	    除法	`expr $b / $a` 结果为 2。
# %	    取余	`expr $b % $a` 结果为 0。
# =	    赋值	a=$b 将把变量 b 的值赋给 a。
# ==    相等。用于比较两个数字，相同则返回 true。	[ $a == $b ] 返回 false。
# `!=`  不相等。用于比较两个数字，不相同则返回 true。	[ $a != $b ] 返回 true。
a=20
b=10
c=5
sum=`expr $a + $b`
echo "a + b = $sum"
cheng=`expr $a \* $b` # 需要转义
echo "a * b = $cheng"
divide=`expr $a / $b`
echo "a / b = $divide"

expr 2 + 20 # 也可以这样直接运算

# 关系运算符
# 运算符	说明
# -eq	检测两个数是否相等，相等返回 true。同算数运算符`==`
# -ne	检测两个数是否相等，不相等返回 true
# -gt	检测左边的数是否大于右边的，如果是，则返回 true。
# -lt	检测左边的数是否小于右边的，如果是，则返回 true。
# -ge	检测左边的数是否大等于右边的，如果是，则返回 true。
# -le	检测左边的数是否小于等于右边的，如果是，则返回 true。
if [ $a == $b ]
# if [ $a == $b ] 等价于 if [ $a -eq $b ]
then
    echo "a = b"
else
    echo "a != b"
fi

# 布尔运算符
# 运算符	说明
# `!`	非运算，表达式为 true 则返回 false，否则返回 true。
# -o	或运算(or)，有一个表达式为 true 则返回 true。
# -a	与运算(and)，两个表达式都为 true 才返回 true。
if [ $a -gt $b -a $b -gt $c ]
then
    echo "a > b > c"
else
    echo "a > b > c不成立"
fi

# 字符串运算符
# 运算符	说明	举例
# =	    检测两个字符串是否相等，相等返回 true。	[ $a = $b ] 返回 false。
# `!=`	检测两个字符串是否相等，不相等返回 true。	[ $a != $b ] 返回 true。
# -z	检测字符串长度是否为0，为0返回 true。	[ -z $a ] 返回 false。
# -n	检测字符串长度是否为0，不为0返回 true。	[ -n $a ] 返回 true。
# str	检测字符串是否为空，不为空返回 true。	[ $a ] 返回 true。
x="hello"
y=Hello
if [ $x = $y ]
then 
    echo "x = y"
else 
    echo "x != y"
fi

if [ -z $x ]
then
    echo "x为空"
else
    echo "x不为空"
fi

if [ -n $x ]
then
    echo "x不为空"
else
    echo "x为空"
fi

if [ ! -z $x ] # 注意这种使用方式，！对后面的整体取反
then
    echo "x不为空"
else
    echo "x为空"
fi


# 文件测试运算符
# 操作符	说明	举例
# -b file	检测文件是否是块设备文件，如果是，则返回 true。	[ -b $file ] 返回 false。
# -c file	检测文件是否是字符设备文件，如果是，则返回 true。	[ -c $file ] 返回 false。
# -d file	检测文件是否是目录，如果是，则返回 true。	[ -d $file ] 返回 false。
# -f file	检测文件是否是普通文件（既不是目录，也不是设备文件），如果是，则返回 true。	[ -f $file ] 返回 true。
# -g file	检测文件是否设置了 SGID 位，如果是，则返回 true。	[ -g $file ] 返回 false。
# -k file	检测文件是否设置了粘着位(Sticky Bit)，如果是，则返回 true。	[ -k $file ] 返回 false。
# -p file	检测文件是否是具名管道，如果是，则返回 true。	[ -p $file ] 返回 false。
# -u file	检测文件是否设置了 SUID 位，如果是，则返回 true。	[ -u $file ] 返回 false。
# -r file	检测文件是否可读，如果是，则返回 true。	[ -r $file ] 返回 true。
# -w file	检测文件是否可写，如果是，则返回 true。	[ -w $file ] 返回 true。
# -x file	检测文件是否可执行，如果是，则返回 true。	[ -x $file ] 返回 true。
# -s file	检测文件是否为空（文件大小是否大于0），不为空返回 true。	[ -s $file ] 返回 true。
# -e file	检测文件（包括目录）是否存在，如果是，则返回 true。	[ -e $file ] 返回 true。

pwd
if [ -e "operator.sh" ]
then
    echo "存在这个文件：operator.sh"
else
    echo "文件不存在"
fi