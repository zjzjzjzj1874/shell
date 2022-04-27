#!/bin/bash

# 求1-100相加之和
sum100() {
  sum=0
  i=0
  while [ ${i} -le 100 ]; do
    sum=$((${sum} + ${i}))
    let i++
  done

  printf "sum is %d\n" ${sum}
}

# 输入一个数，求1-n的和
sumn() {
  read -p "please input a number:" num

  while ((num < 1)); do
    read -p "please input a number:" num
  done
  echo "num is ${num}"

  sum=0
  for i in $(seq 1 ${num}); do
    sum=$((${sum} + ${i}))
  done
  echo "sum is ${sum}"
}

sum100

sumn
