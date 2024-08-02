#!/bin/sh
#10秒检查git分支是否有更新，有更新则执行run1.sh自动打包发布

RUNSH=run1.sh
SHPATH=/opt/$RUNSH
GITDIR=/opt/aicr-admin

BRANCH=develop

while :
do
    cd $GITDIR
    git fetch
    if [[ $(git rev-list HEAD..origin/$BRANCH --count) -eq 0 ]]; then

      #没有更新
      #echo $(date +%F%n%T) $BRANCH "- The branch is up to date."
      sleep 10

    else
      #有更新
      #echo $BRANCH "The branch is not up to date."

      processNum=`ps -fe | grep $RUNSH | grep -v grep | wc -l`

      #判断run.sh是否运行，若正在运行则等待
        while [ $processNum -gt 0 ]
        do
            #echo $processNum
            echo $(date +%F%n%T) $processNum "- awaiting..."
            sleep 8
            processNum=`ps -fe | grep $RUNSH | grep -v grep | wc -l`

        done

        nohup $SHPATH > $SHPATH.log 2>&1 &
        sleep 2


    fi

done

