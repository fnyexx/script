#!/bin/bash
#自动登录ssh
while true; do
  sshpass -p '123' ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -tt fnyexx@s4.serv00.com "exit" &
  sleep 2592000  #30天为2592000秒 60*60*24*30=2592000 记得修改密码和地址
done
