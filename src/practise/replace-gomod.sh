#!/bin/bash
# 功能：批量替换服务中所有go.mod

GITPATH=/Users/rock/GolandProjects/
TARGETVERSION="git.querycap.com/aisys/common v1.2.132-0.20220318090643-440ecae64201"
TARGETFILE=go.mod
TARGETBRANCH=feature/AISA-1064

failureLog="failure.log"
successLog="success.log"

# 替换所有go.mod
replace_all() {
    srvs=`cd $GITPATH && ls | grep "srv-"`

    for srv in $srvs; do
        echo  "============================================ $srv 分界线 ============================================"
        sleep 1
        
        cd $GITPATH$srv
        pwd
        
        git stash save 'stash last'
        git checkout .
        

        # 切回主分支拉取最新的代码和分支后，再次切换回目标分支
        git checkout main && git pull origin main && git checkout ${TARGETBRANCH} && git pull origin ${TARGETBRANCH}
        code=$?
        if [ $code -ne 0 ];then
            echo "  -------- ${srv} 执行失败，请重试 -------  "
            echo "  -------- ${srv} 执行失败，请重试 -------  " >> ${GITPATH}${failureLog}
            continue
        fi
        
        # 查看aisys-common的行号
        num=`cat -n ${TARGETFILE} | grep "git.querycap.com/aisys/common" | awk '{print $1}'` 
        code=$?
        if [ $code -ne 0 ];then
            echo "  -------- ${srv} 不存在common -------  "
            continue
        fi

        echo "aisys-common在第${num}行。"
        # 将目标行替换成目标版本
        gsed -i -e "${num}c ${TARGETVERSION}" ${TARGETFILE}
        code=$?
        if [ $code -ne 0 ];then
            echo "  -------- ${srv} 替换目标行失败，请重试 -------  "
            echo "  -------- ${srv} 替换目标行失败，请重试 -------  " >> ${GITPATH}${failureLog}
            continue
        fi

        # 整理go.mod依赖需求并提交
        go mod tidy && git commit -asm "feat:update go.mod" && git push origin ${TARGETBRANCH}
        code=$?
        if [ $code -ne 0 ];then
            echo "  -------- ${srv} 推送到gitlab失败，请重试 -------  "
            echo "  -------- ${srv} 推送到gitlab失败，请重试 -------  " >> ${GITPATH}${failureLog}
            continue
        fi

        echo "  -------- 恭喜，${srv} 替换成功！！！！！！ -------  " >> ${GITPATH}${successLog}

    done
}

replace_all

echo "执行完毕，请检查${successLog}和${failureLog}"