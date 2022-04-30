#!/bin/bash
# 数组

# 数组定义
define_arr () {
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
}

# 数组访问与读取
access_arr() {
    echo ${arr[0]} # 打印数组第一个元素：注意和其他语言一样，下标从0开始
    # shellcheck disable=SC2068
    echo ${arr[@]} # 打印数组元素使用@或则*
    echo ${arr[*]} # 打印数组元素

    arr=([5]=a [9]=b [23]=c)
    # 返回成员的数组序号：即返回哪些位置的元素是有值的
    # shellcheck disable=SC2068
    echo ${!arr[@]}
    echo ${!arr[*]}
}

# 数组长度
len_arr() {
    echo ${arr[*]}
    echo ${#arr[*]} # 打印数组的长度
    echo ${#arr[3]} # 打印数组某个元素的长度
}

# 数组的遍历
iterator_arr() {
    # shellcheck disable=SC2068
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
        # shellcheck disable=SC2219
        let j++
    done
    # 说明：基于以上试验：可以得出结论：在遍历数组的时候，最好使用for来，while用下标可能不能遍历出所有的数组元素
}

# 数组的追加
append_arr() {
    foo=(a b c)
    # shellcheck disable=SC2068
    echo ${foo[@]}

    foo+=(x y z) # 如果不使用这种方法，那么在追加的时候需要知道数组最大序号，不太友好
    # shellcheck disable=SC2068
    echo ${foo[@]}
}

# 删除数组元素
del_arr() {
    foo=(a b c d f g)
    # shellcheck disable=SC2068
    echo ${foo[@]}
    echo ${#foo[@]}

    # shellcheck disable=SC2184
    unset foo[2] # 这种unset的删除是科学的
    # shellcheck disable=SC2068
    echo ${foo[@]}
    echo ${#foo[@]}

    foo[1]='' # 这种做法并没有删除掉数组的第二个元素，只是将其值隐藏了，但是第二个位置仍然存在
    # shellcheck disable=SC2068
    echo ${foo[@]}
    echo ${#foo[@]}
}

# 关联数组 注：在macOS上又跑不通，Linux上没有问题
associative_arr() {
    declare -A colors
    colors["red"]="#ff0000"
    colors["green"]="#00ff00"
    colors["blue"]="#0000ff"

    # shellcheck disable=SC2068
    echo ${colors[@]}
    echo ${colors["red"]}
}

# access_arr
# append_arr
# del_arr
associative_arr