#!/bin/bash
# 功能：批量替换服务中所有go.mod

GITPATH=/Users/rock/GolandProjects/
TARGETVERSION="git.querycap.com/aisys/common v1.2.132-0.20220318090643-440ecae64201"
TARGETFILE=go.mod
TARGETBRANCH=feature/AISA-1064
TARGETLINE=git.querycap.com/aisys/common
KEYWORD="srv-"

failureLog="failure.log"
successLog="success.log"

# 有改动就缓存，然后切换分支，拉取最新的
stash_check_pull_latest() {
  git stash save 'stash last' && git checkout .

  # 切回主分支拉取最新的代码和分支后，再次切换回目标分支 => 主分支可能是main|master  ==》 拿两个main和master的服务做测试
  (git checkout main || git checkout master) && (git pull origin main || git pull origin master) && git checkout ${TARGETBRANCH} && git pull origin ${TARGETBRANCH}
  # git checkout main && git pull origin main && git checkout ${TARGETBRANCH} && git pull origin ${TARGETBRANCH}
  code=$?

  return $code
}

# 检查aisys行号
check_line() {
  # 查看aisys-common的行号
  num=$(cat -n ${TARGETFILE} | grep $TARGETLINE | awk '{print $1}')
  echo "aisys-common在第${num}行。"

  return $num
}

# 整理mod文件
tidy_mod() {
  # 整理go.mod依赖需求并提交
  go mod tidy && git commit -asm "feat:update go.mod" && git push origin ${TARGETBRANCH}
  code=$?

  return $code
}

# 将目标行替换成目标版本
core_replace() {
  gsed -i -e "${num}c ${TARGETVERSION}" ${TARGETFILE}
  code=$?

  return $code
}

# 替换所有go.mod
replace_all() {
  srvs=$(cd $GITPATH && ls | grep $KEYWORD)

  for srv in $srvs; do
    echo "============================================ $srv 分界线 ============================================"
    sleep 1

    cd $GITPATH$srv
    pwd

    stash_check_pull_latest
    code=$?
    if [ $code -ne 0 ]; then
      echo "  -------- ${srv} git操作拉取最新代码或没有对应分支，请检查 -------  "
      echo " ${srv} git操作拉取最新代码或没有对应分支，请检查" >>${GITPATH}${failureLog}
      continue
    fi

    check_line # 检查万一num不存在，是个空串
    num=$?
    if [ $num -eq 0 ]; then
      echo "  -------- ${srv} 不存在common -------  "
      continue
    fi

    core_replace
    code=$?
    if [ $code -ne 0 ]; then
      echo "  -------- ${srv} 替换目标行失败，请重试 -------  "
      echo " ${srv} 替换目标行失败，请重试 " >>${GITPATH}${failureLog}
      continue
    fi

    tidy_mod
    code=$?
    if [ $code -ne 0 ]; then
      echo "  -------- ${srv} 推送到gitlab失败，请重试 -------  "
      echo "${srv} 推送到gitlab失败，请重试" >>${GITPATH}${failureLog}
      continue
    fi

    echo " 恭喜，${srv} 替换成功！！！！！！" >>${GITPATH}${successLog}
  done
}

replace_all

echo "执行完毕!"
echo "--------------------- success services ---------------------"
cat ${GITPATH}${successLog}
echo "--------------------- failure services ---------------------"
cat ${GITPATH}${failureLog}
