#!/bin/bash
# 数组

# region 数组定义
# arr=(
#     1
#     3
#     5
#     7
# )

# arr=("hello" 2 3 "world") # 数组用小括号定义，空格分割元素，元素的类型不是固定的

# 用下标给数组赋值
arr[0]=100
arr[2]=99
arr[5]="hello" # 这个需要注意一下，即使下标为5，整个数组其实也只要三个元素
arr[0]="1"

echo "0 = ${arr[0]}"
echo "1 = ${arr[1]}"
echo "2 = ${arr[2]}"
echo "3 = ${arr[3]}"
echo "4 = ${arr[4]}"
echo "5 = ${arr[5]}" # 不过访问的时候还是正常的
echo ${#arr[*]} # 打印的长度也只有3
echo ${#arr[@]}
# endregion 数组定义


# region 数组访问与读取
# echo ${arr[0]} # 打印数组第一个元素：注意和其他语言一样，下标从0开始
# echo ${arr[@]} # 打印数组元素使用@或则*
# echo ${arr[*]} # 打印数组元素
# endregion 数组访问与读取


# region 数组长度
# echo ${arr[*]}
# echo ${#arr[*]} # 打印数组的长度
# echo ${#arr[3]} # 打印数组某个元素的长度
# endregion 数组长度


# 数组的遍历
for a in ${arr[@]};do
    echo "a == ${a}"
done

echo "===========字符串数组==========="
words="aa bb cc" # 字符串数组
for word in ${words}
do
    echo ${word}
done

echo "==================== while遍历数组 ===================="
j=0
while [ $j -lt ${#arr[@]} ];do
    echo  "j = ${j}:arr = ${arr[j]}"
    let j++
done

# 说明：基于以上试验：可以得出结论：在遍历数组的时候，最好使用for来，while用下标可能不能遍历出所有的数组元素