#!/bin/bash

# 删除被驱逐的pod 使用规则 ./del_evicted_by_ns.sh dev => 删除dev空间下被驱逐的pod

ns=$1

if [ -z "${ns}" ]; then
  echo "请传入命名空间"
  exit 1
fi

for each in $(kubectl get pods -n "${ns}" | grep Evicted | awk '{print $1}');

do
	kubectl delete pod "${each}" -n "${ns}";
done

echo "完成删除"