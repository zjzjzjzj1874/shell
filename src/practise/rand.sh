#!/bin/bash

num=100
function rand() {
  result=$((RANDOM % num))
  return $result
}
rand
rt=$?
echo $rt


major=$((RANDOM % num))
minor=$((RANDOM % num))
patch=$((RANDOM % num))
tag="v${major}.${minor}.${patch}"
echo ${tag}