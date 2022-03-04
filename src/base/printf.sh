#!/bin/bash

# printf的用法：和c语言的标准输出类似
# printf由POSIX标准所定义，因此使用printf的脚本比使用echo移植性好。
# 可移植操作系统接口Portable Operating System Interface，缩写为POSIX。
# printf 命令的语法：
# printf  format-string  [arguments...]
# 参数说明：
# format-string: 为格式控制字符串
# arguments: 为参数列表。

echo "Hello,Shell"
printf "Hello,Shell\n"

printf "%-10s %-8s %-4s\n" 姓名 性别 体重\(kg\)
printf "%-10s %-8s %-4.2f\n" 郭靖 男 66.1234
printf "%-10s %-8s %-4.2f\n" 小龙女 女 50.1234
printf "%-10s %-8s %-4.2f\n" 欧阳南军 男 65.1234
# 解释：
# %s %c %d %f 都是格式替代符，％s(string)输出一个字符串，％d(Decimal)整型输出，％c(char)输出一个字符，％f(float)输出实数，以小数形式输出。
# %-10s 指一个宽度为 10 个字符（- 表示左对齐，没有则表示右对齐），任何字符都会被显示在 10 个字符宽的字符内，如果不足则自动以空格填充，超过也会将内容全部显示出来。
# %-4.2f 指格式化为小数，其中 .2 指保留2位小数。%f默认支持6位小数

printf "%c\n" abc # 如果%c的输入字符串有多个字符，则自动截取第一个字符作为输出结果
printf '%c \n' abc # 单引号双引号效果一样
printf %c abc # 没有引号也可以输出，不过换行不能实现
printf "%f,%.2f,%.10f\n" 4.123456789 4.123 4.12345678901234

printf "%-5s\n" "hello world"
printf "%.2f \n" 4.1235

# 格式只指定了一个参数，但多出的参数仍然会按照该格式输出，format-string 被重用
printf "%-10s\n" abc def

# 如果没有接受参数，那么%s用null替换，%d用0替换
printf "%s and %d \n"

printf "%s \a %s\n" abs efg