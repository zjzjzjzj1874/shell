#!/bin/bash

# region 关闭docker中的redis服务
closeRedisInDocker(){
    # redis=`docker ps | grep redis | awk '{print $NF}'`
    redis=`docker ps | grep redis | awk '{print $1}'`
    if [ -z ${redis} ];then 
        echo "redis is not exist"
        return
    fi
    
    echo "redis containerID is ${redis}"

    docker stop ${redis}
    code=$? # 上一条命令执行的结果：非0表示失败
    echo "code : ${code}"
    if [ ${code} -ne 0 ];then 
        echo "close redis failure"
        return
    fi

    redis=`docker ps | grep redis | awk '{print $NF}'`
    echo "redis : ${redis}"
    if [ -z ${redis} ];then
        echo "关闭成功"
    else    
        echo "redis关闭失败"
    fi
}
# endregion 关闭docker中的redis服务

# region 关闭docker中所有服务
closeAllDockerService(){
    echo "begin to stop all docker services..."
    s=`docker ps | awk '{if (NR>1){print $NF}}'` # 解释：NR>1：取大于第一行的(即不要第一行)；$NF:取最后一列
    echo "all docker services:${s}"
    for s in ${s};do 
        echo "this service is ${s}"
        echo "docker stop ${s}"
        docker stop ${s}
        code=$?
        if [ code -ne 0 ];then 
            echo "close ${s} failure"
        fi
    done
    echo "close all services done."

    s=`docker ps | awk '{if (NR>1){print $NF}}'`
    echo "all docker services:${s}"
    if [ -z ${s} ];then
        echo "success to close all services in docker"
    fi
}
# endregion 关闭docker中所有服务

# closeAllDockerService
closeRedisInDocker

# TODO 测试一下，awk每次取两列，然后看看for的时候是怎么取值的