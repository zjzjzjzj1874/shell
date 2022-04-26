#!/bin/bash -e

# 清理none的images镜像

echo " ----------- start ---------- "
images=`docker images | grep "<none>" | awk '{print $3}'`
for image in ${images}; do
        echo "this images id is: ${image}, begin to remove"
        docker rmi ${image}
done

echo " ----------- done ---------- "
