#!/bin/bash

# user-rpc的dockerfile名称
dockerfile=Dockerfile.user.rpc

# 内网IP
inner_ip=$1
echo "内网IP :${inner_ip}"
if [ -z ${inner_ip} ];then
    echo "====================== warning:请传入内网ip ======================"
    return
fi

# 名称
rpcName=users-rpc
# 端口号:也可以以入参传入,也可以从yaml的配置文件中获取.建议从配置文件中获取
port=9001

# 构建镜像
build_users_rpc() {
  # 拷贝user Dockerfile
  sudo cp /data/golang_project/dockerfile/${dockerfile} /data/golang_project/kms_api_v2/Dockerfile

  # 将配置文件中localhost和127域名替换为本机ip
  echo "============================ 配置文件替换 ============================="
  sudo sed -i "s/localhost/${inner_ip}/g" /data/golang_project/kms_api_v2/users/endpoint/rpc/etc/users.yaml
  sudo sed -i "s/127.0.0.1/${inner_ip}/g" /data/golang_project/kms_api_v2/users/endpoint/rpc/etc/users.yaml

  # docker build
  echo "=========================== 构建${rpcName}镜像 ======================="
  cd /data/golang_project/kms_api_v2 && sudo docker build -t ${rpcName} .
}

# 启动容器
start_user_rpc() {
  echo "============================ 停止并删除原来${rpcName} ================================"
  sudo docker stop ${rpcName} && sudo docker rm ${rpcName}
  echo " ==================================== 重新启动${rpcName} ======================================"
  sudo docker run -itd --name ${rpcName} --network kms -p ${port}:${port} ${rpcName}
}

user_rpc() {
  build_users_rpc

  start_user_rpc
}

user_rpc
