#!/bin/bash -e

# 服务器内网ip,也可以通过脚本参数传入
inner_ip=10.28.16.49
shell_path=/data/golang_project/shell
kms_path=/data/golang_project/

# 解压
echo "================================ 解压代码 ================================"
sudo unzip -o ~/kms_api_v2.zip -d ${kms_path}

# 启动方法
start_all() {
  cd ${shell_path}
  echo "====================================== starting ======================================="

  echo "====================================== 启动access-rpc服务 ======================================="
  sudo bash access-rpc.sh ${inner_ip}

  echo "====================================== 启动users-rpc服务 ======================================="
  sudo bash users.sh ${inner_ip}

  echo "====================================== 启动access-api服务 ======================================="
  sudo bash access-api.sh ${inner_ip}

  echo "====================================== 启动users-api服务 ======================================="
  sudo bash users-api.sh ${inner_ip}

  echo "====================================== 启动kms-admin-api服务 ======================================="
  sudo bash kms-admin-api.sh ${inner_ip}

  echo "====================================== ending ======================================="
}

start_all
