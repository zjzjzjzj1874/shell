#!/bin/bash 
# 指定解释器来解释脚本
###
 # @Author: zjzjzjzj1874 zjzjzjzj1874@gmail.com
 # @Date: 2025-02-05 14:29:42
 # @LastEditors: zjzjzjzj1874 zjzjzjzj1874@gmail.com
 # @LastEditTime: 2025-02-05 15:04:43
 # @FilePath: /shell/examples/chapter1/echo.sh
 # @Description: echo printf
### 

# -e: 对特殊字符进行转义
echo -e "hello \n"
echo -e 'hello \n'
echo 'hello \n' # 这个不会进行转义了

# 注意：echo会自动换行，但是printf不会，必须显示指定\n换行。 不过printf的移植性比echo好。
printf "hello\n"
# printf的使用：printf format-string [arguments...] 功能和语法和C语言的 printf 类似。
# 不过与C语言的printf略有不同
    # printf不用加括号
    # format-string可以不加引号(但最好加上，单双引号均可)
    # 参数比格式控制符多时，格式控制符可重用，可将所有参数都转换
    # arguments使用空格分隔，不用逗号

printf "%d %s\n" 10 "abd"
printf '%d %s\n' 10 "abd" # 单双引号效果一致
printf %s "hello printf"  # 没有引号也可以输出，但是就不能换行了。
# printf %d %s 10 hello # 系统分不清哪个是参数，最好加上引号

printf "\n"
printf "%s\n" a b c # 重用格式控制符%s

printf "%s and %d\n" # 如果没有参数，%s 使用''空字符串替代，%d使用0代替
