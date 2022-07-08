#!/bin/bash -e

testFile=".test"

# shellcheck disable=SC2006
items=$(cat ${testFile})

echo $items
#con=$()

IFS=","
#for item in $con; do
#  echo ${item}
#done
