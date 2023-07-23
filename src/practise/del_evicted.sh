#!/bin/bash


# 删除被驱逐的pod 使用规则 ./del_evicted.sh => 删除所有命名空间下被驱逐的pod

kubectl get pods -A | grep "Evi" | awk '{print $1,$2}' | while IFS= read -r each; do
    namespace=$(echo "$each" | awk '{print $1}')
    pod_name=$(echo "$each" | awk '{print $2}')

    echo "delete pod "$pod_name" -n "$namespace""
    kubectl delete pod "$pod_name" -n "$namespace"
done

echo "删除完成"