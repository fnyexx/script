#!/bin/sh
#10����git��֧�Ƿ��и��£��и�����ִ��run1.sh�Զ��������

RUNSH=run1.sh
SHPATH=/opt/$RUNSH
GITDIR=/opt/aicr-admin

BRANCH=develop

while :
do
    cd $GITDIR
    git fetch
    if [[ $(git rev-list HEAD..origin/$BRANCH --count) -eq 0 ]]; then

      #û�и���
      #echo $(date +%F%n%T) $BRANCH "- The branch is up to date."
      sleep 10

    else
      #�и���
      #echo $BRANCH "The branch is not up to date."

      processNum=`ps -fe | grep $RUNSH | grep -v grep | wc -l`

      #�ж�run.sh�Ƿ����У�������������ȴ�
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

