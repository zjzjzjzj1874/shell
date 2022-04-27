#!/bin/bash

# access-api的dockerfile名称
dockerfile=Dockerfile.access.api

# 内网IP
inner_ip=$1
echo "内网IP :${inner_ip}"
if [ -z ${inner_ip} ]; then
  echo "====================== warning:请传入内网ip ======================"
  return
fi

# 名称
apiName=access-api
# 端口号:也可以以入参传入,也可以从yaml的配置文件中获取.建议从配置文件中获取
port=8009

# 构建access-api镜像
build_access_api() {
  # 拷贝access-api Dockerfile
  sudo cp /data/golang_project/dockerfile/${dockerfile} /data/golang_project/kms_api_v2/Dockerfile

  # 将配置文件中localhost和127域名替换为本机ip
  echo "============================ 配置文件替换 ============================="
  sudo sed -i "s/localhost/${inner_ip}/g" /data/golang_project/kms_api_v2/access/endpoint/api/etc/access-api.yaml
  sudo sed -i "s/127.0.0.1/${inner_ip}/g" /data/golang_project/kms_api_v2/access/endpoint/api/etc/access-api.yaml

  # docker build
  echo "=========================== 构建${apiName}镜像 ======================="
  cd /data/golang_project/kms_api_v2 && sudo docker build -t ${apiName} .
}

# 启动access-api容器
start_access_api() {
  echo "============================ 停止并删除原来${apiName} ================================"
  sudo docker stop ${apiName} && sudo docker rm ${apiName}
  echo " ==================================== 重新启动${apiName} ======================================"
  sudo docker run -itd --name ${apiName} --network kms -p ${port}:${port} ${apiName}
}

# access-api方法
access_api() {
  build_access_api

  start_access_api
}

access_api
