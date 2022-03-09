#!/bin/bash
# 逻辑运算符
# 逻辑运算符
# 以下介绍 Shell 的逻辑运算符，假定变量 a 为 10，变量 b 为 20:
# 注意：逻辑运算符需要两个中括号

# 运算符	 说明	         举例
# &&	    逻辑的 AND	    [[ $a -lt 100 && $b -gt 100 ]] 返回 false
# ||	    逻辑的 OR	    [[ $a -lt 100 || $b -gt 100 ]] 返回 true

a=10
b=20

logic_compare(){
    if [[ ${a} -lt 50 && ${b} -lt 50 ]];then
        echo "a和b都小于50"
    else 
        echo "a 和b 不全小于50"
    fi

    if [[ ${a} -lt 50 || ${b} -lt 50 ]]
    then
        echo "a或b小于50"
    else 
        echo "a和b都不小于50"
    fi
}