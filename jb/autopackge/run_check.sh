#!/bin/sh
ps -ef | grep 10s_check.sh | awk '{ print $2 }' |  xargs kill -9
nohup /opt/10s_check.sh > /opt/run1.sh.log 2>&1 &
