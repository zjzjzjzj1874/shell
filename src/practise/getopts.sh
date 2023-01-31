#!/bin/bash

# opts
# 连接中间件脚本
# example ./conn.sh -p zero -m redis -e dev
while getopts p:m:e: flag
do
        case "${flag}" in
                p)      project=${OPTARG};;
                m)      middleware=${OPTARG};;
                e)      env=${OPTARG};;
        esac
done

if [ "$env" = "" ];then
        env='dev'
fi

echo "project:    $project"
echo "middleware: $middleware"
echo "env:        $env"



# 声明配置
declare -A RedisMap
RedisMap["dev"]='localhost,password'
RedisMap["test"]='localhost,password'
RedisMap["pro"]='localhost,password!'

declare -A MongoMap
MongoMap["dev"]='localhost,password'
MongoMap["test"]='localhost,password'
MongoMap["pro"]='localhost,password!'


declare -A MysqlMap
MysqlMap["dev"]='localhost,password'
MysqlMap["test"]='localhost,password'
MysqlMap["pro"]='localhost,password!'


if [ "$middleware" = "redis" ];then
        configStr=${RedisMap["${project}-${env}"]}
        configs=(`echo $configStr | tr ',' ' '` )
        redis-cli -h ${configs[0]} -a ${configs[1]}
elif [ "$middleware" = "mongo" ];then
        configStr=${MongoMap["${project}-${env}"]}
        configs=(`echo $configStr | tr ',' ' '` )
        mongo ${configs[0]} -u ${configs[1]} -p ${configs[2]} --authenticationDatabase admin
elif [ "$middleware" = "mysql" ];then
        configStr=${MysqlMap["${project}-${env}"]}
        configs=(`echo $configStr | tr ',' ' '` )
        mysql -h ${configs[0]} -u ${configs[1]} -p${configs[2]}
else
        echo 'not found'
fi