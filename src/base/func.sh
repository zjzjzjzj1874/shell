#!/bin/bash
# 函数相关定义

foo=1

# 函数的两种定义
function fn() {
    # 函数内可以修改全局变量，请注意
    foo=2
    echo ${foo}
}

local_fn() {
    local foo=2
    echo ${foo}
}


# fn
local_fn
echo ${foo}