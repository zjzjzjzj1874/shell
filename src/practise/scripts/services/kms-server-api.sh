#!/bin/bash

# kms-server-api的dockerfile名称
dockerfile=Dockerfile.kms.server.api

# 内网IP
inner_ip=$1
echo "内网IP :${inner_ip}"
if [ -z ${inner_ip} ];then
    echo "====================== warning:请传入内网ip ======================"
    return
fi

# 名称
serverName=kms-server-api
# 端口号:也可以以入参传入,也可以从yaml的配置文件中获取.建议从配置文件中获取
port=8899

# 构建kms-server-api镜像
build_kms_server_api() {
  # 拷贝kms server api Dockerfile
  sudo cp /data/golang_project/dockerfile/${dockerfile} /data/golang_project/kms_api_v2/Dockerfile

  # 将配置文件中localhost和127域名替换为本机ip
  echo "============================ 配置文件替换 ============================="
  sudo sed -i "s/localhost/${inner_ip}/g" /data/golang_project/kms_api_v2/kms_server/etc/kms-server-api.yaml
  sudo sed -i "s/127.0.0.1/${inner_ip}/g" /data/golang_project/kms_api_v2/kms_server/etc/kms-server-api.yaml

  # docker build
  echo "=========================== 构建${serverName}镜像 ======================="
  cd /data/golang_project/kms_api_v2 && sudo docker build -t ${serverName} .
}

# 启动容器
start_kms_server_api() {
  echo "============================ 停止并删除原来${serverName} ================================"
  sudo docker stop ${serverName} && sudo docker rm ${serverName}
  echo " ==================================== 重新启动${serverName} ======================================"
  sudo docker run -itd --name ${serverName} --network kms -p ${port}:${port} ${serverName}
}

kms_server_api() {
  build_kms_server_api

  start_kms_server_api
}

kms_server_api
