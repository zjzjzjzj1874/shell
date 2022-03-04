#!/bin/bash
# 字符串

# region 引号
# 单引号：single quote
str='this is single quote'
str="plus:${str}"
echo ${str}
str='this is ${str}' 
echo ${str} # 变量不会生效，原样输出
str='world'
str='hello '${str}'!' # 字符串拼接是没有问题的
echo ${str}

# 双引号：double quote
# str="double"
# echo "this is ${str} quote!" # 变量有效=》输出：this is double quote!
# echo "this is \"${str}\" quote!" # 转义生效=》输出带引号的： this is "double" quote

# endregion 引号


# region 拼接字符串
# 双引号拼接
# str="concat"
# str="double quote "${str}"!" 
# echo ${str}

# # 单引号拼接
# str='concat'
# str='single quote '${str}'!'
# echo ${str}

# endregion 拼接字符串


# region 获取字符串长度
str="hello"
# echo ${#str} # 使用#号获取字符串长度，数组也是

# endregion 获取字符串长度


# region 截取子字符串
# str="hello"
# str=${str:1:4} # 输出：ello => 解释：从第二个字符开始，截取4个字符
# echo ${str}

# endregion 截取子字符串


# region 查找子字符串 => 语法：expr index string1 string2;查找string2在string1中最先出现的位置
# string="hello,this is Martin"
# echo `expr index "${string}" io` # 解释：查找i或者o在string中首次出现的位置
# echo `expr index "${string}" o`
# echo `expr index "hello world" o` 


string="hello world"
temp=${string%%or*} # 解释：%%是从右向左截取最有一个or，到左边所有，temp截取后为：'hello w'
echo ${temp}
echo $((${#temp})) #输出7
echo $((${#temp}+1)) #输出8
temp=${string%%o*}
echo ${temp}
echo $((${#temp}+1)) #输出7

# 注：expr index这个表达式在MacOS中执行会报错：expr:syntax error；但是Linux中没有问题,因为MacOS使用BSD expr，没有index指令，Linux通常使用GNU的expr

# endregion 查找子字符串