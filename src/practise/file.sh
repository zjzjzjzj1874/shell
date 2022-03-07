#!/bin/bash
# 将/Users/rock/tools/shell中文件复制到/Users/rock/tools/shell1中

copyFile(){
    src=/Users/rock/tools/shell
    tar=/Users/rock/tools/shell1

    if [ ! -e ${tar} ];then
        echo "文件夹不存在"
        mkdir ${tar}
        res=$?
        echo "上一个命令执行结果：${res}."
    fi

    for f in `ls ${src}`;do
        # echo "cp ${src}/""${f}" ${tar}

        # cd ${src} && cp ${f} ${tar}
        # cp "${src}/""${f}" ${tar}
        cp -r ${src}/${f} ${tar} # 兼容文件夹
    done
}

copyFile

