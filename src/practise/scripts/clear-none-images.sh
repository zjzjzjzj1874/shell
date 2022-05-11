#!/bin/bash -e

# 清理已退出的容器
clear_exit_container() {
  echo " ----------- cleaning containers start ---------- "
  containers=$(docker ps -a | grep "Exited" | awk '{print $1}')
  for container in $containers; do
    echo "this container id is: ${container}, begin to remove"
    docker rm "${container}"
    break
  done
}

# 清理none的images镜像
clear_none_images() {
  echo " ----------- cleaning images start ---------- "
  images=$(docker images | grep "<none>" | awk '{print $3}')
  for image in ${images}; do
    echo "this image id is: ${image}, begin to remove"
    docker rmi "${image}"
  done
}

clear_exit_container
clear_none_images
echo " ----------- done ---------- "
