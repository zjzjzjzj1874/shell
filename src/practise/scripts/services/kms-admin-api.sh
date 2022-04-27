#!/bin/bash

# kms-admin-api的dockerfile名称
dockerfile=Dockerfile.kms.admin.api

# 内网IP
inner_ip=$1
echo "内网IP :${inner_ip}"
if [ -z ${inner_ip} ]; then
  echo "====================== warning:请传入内网ip ======================"
  return
fi

# 名称
adminName=kms-admin-api
# 端口号:也可以以入参传入,也可以从yaml的配置文件中获取.建议从配置文件中获取
port=8888

# 构建kms-admin-api镜像
build_kms_admin_api() {
  # 拷贝kms admin api Dockerfile
  sudo cp /data/golang_project/dockerfile/${dockerfile} /data/golang_project/kms_api_v2/Dockerfile

  # 将配置文件中localhost和127域名替换为本机ip
  echo "============================ 配置文件替换 ============================="
  sudo sed -i "s/localhost/${inner_ip}/g" /data/golang_project/kms_api_v2/kms_admin/etc/kms-admin-api.yaml
  sudo sed -i "s/127.0.0.1/${inner_ip}/g" /data/golang_project/kms_api_v2/kms_admin/etc/kms-admin-api.yaml

  # docker build
  echo "=========================== 构建${adminName}镜像 ======================="
  cd /data/golang_project/kms_api_v2 && sudo docker build -t ${adminName} .
}

# 启动容器
start_kms_admin_api() {
  echo "============================ 停止并删除原来${adminName} ================================"
  sudo docker stop ${adminName} && sudo docker rm ${adminName}
  echo " ==================================== 重新启动${adminName} ======================================"
  sudo docker run -itd --name ${adminName} --network kms -p ${port}:${port} ${adminName}
}

kms_admin_api() {
  build_kms_admin_api

  start_kms_admin_api
}

kms_admin_api
