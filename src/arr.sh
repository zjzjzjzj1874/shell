#!/bin/bash

# region 数组定义
arr=(
    1
    3
    5
    7
)
arr=("hello" 2 3 "world") # 数组用小括号定义，空格分割元素，元素的类型不是固定的
# endregion 数组定义


# region 数组访问与读取
echo ${arr[0]} # 打印数组第一个元素：注意和其他语言一样，下标从0开始
echo ${arr[@]} # 打印数组元素使用@或则*
echo ${arr[*]} # 打印数组元素
# endregion 数组访问与读取


# region 数组长度
echo ${arr[*]}
echo ${#arr[*]} # 打印数组的长度
echo ${#arr[3]} # 打印数组某个元素的长度
# endregion 数组长度