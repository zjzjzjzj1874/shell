#!/bin/bash
# 初识shell

# 定义变量
define_var(){
    _var="hello world" # shell定义变量
    echo ${_var} # 打印shell变量
    _var="rewrite variable" # 会覆盖_var变量的值
    echo ${_var} # 打印shell变量

    echo "======= 循环定义变量 =======" # 打印shell变量
    for f in `ls /usr`;do 
        echo "this name is ${f}"
    done

    for f in $(ls /usr);do
        echo "repeat ${f}"
    done
}

# 只读变量
readonly_var(){
    url="www.baidu.com"
    readonly url
    # url="google.com" # 会报错 line 20: url: readonly variable
    # 注    1.只读变量不能重复赋值
    #       2.只读变量不能被删除
}

# 删除变量
del_var(){
   var="baidu.com"
    echo "del before:${var}"
    unset var 
    echo "del after:${var}" 
    readonly var
    # unset var # 会报错：line 32: unset: var: cannot unset: readonly variable
    # 注:1.删除变量后，打印的值将为空
    #    2.只读变量不能被删除
}


# region shell变量
:<<!
1.局部变量：shell文件中定义的变量，仅当前shell文件能访问，其他shell文件程序中无法访问；
2.环境变量：所以程序，包含shell启动的程序都能访问到(必要时shell也可以定义环境变量)；
3.全局变量：shell程序设置的特殊变量，shell变量中一部分是环境变量，一部分是局部变量。
!
# endregion shell变量

# sh中使用Linux的普通命令
linux_cmd(){
    path=/Users/rock/sl
    mkdir -p ${path}
    cd ${path}
    touch main.go   
}

# 一些有趣的命令
interest_cmd() {
    echo $(cal)

    echo "$(cal)"

    declare -f

    # declare命令的主要参数（OPTION）如下。
    # -a：声明数组变量。
    # -f：输出所有函数定义。
    # -F：输出所有函数名。
    # -i：声明整数变量。
    # -l：声明变量为小写字母。
    # -p：查看变量信息。
    # -r：声明只读变量。
    # -u：声明变量为大写字母。
    # -x：该变量输出为环境变量

    alias # 在自己系统中输出这个，可以查看所有的别名
}

interest_cmd