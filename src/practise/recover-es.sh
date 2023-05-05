#!/bin/bash

# 这是一个用于删除es索引的脚本,测试环境自己使用
remove() {
  src=~/test/test

  for f in $(ls ${src}); do
    echo "f = ${f}"

    sudo cp -r ${src}/${f}/_state ${src}/${f}/_state.bak && ls -l ${src}/${f} && sudo rm -r ${src}/${f}/_state
  done
}

remove
