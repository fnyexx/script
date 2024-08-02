#!/bin/sh
echo =================================
echo  $(date +%F%n%T) auto package run...
echo =================================


#项目名字
APP_NAME=service-

#防止重复运行
processNum=`ps -fe | grep run1.sh | grep -v grep | wc -l`
echo $processNum
if [ $processNum -eq 2 ];then
        echo run1.sh not running
else
        echo run1.sh is running
        echo run1.sh end
        exit
fi



echo pull git start...
cd /opt/aicr-admin
git checkout develop
git pull
echo pull git end...

echo package start...
output=`mvn clean package -Dmaven.test.skip=true`

echo stoping...
#根据APP_NAME变量杀进程

ps -ef | grep $APP_NAME | awk '{ print $2 }' |  xargs kill -9

echo 'Stop Server Success!'

cd /home/aig/java_app/
echo copy package...

cp -u /opt/aicr-admin/service-backend-app/target/service-backend-app.jar ./
cp -u /opt/aicr-admin/service-backend-admin/target/service-backend-admin.jar ./
cp -u /opt/aicr-admin/service-gateway/target/service-gateway.jar ./
cp -u /opt/aicr-admin/service-i18n/target/service-i18n.jar ./
cp -u /opt/aicr-admin/service-jobs/target/service-jobs.jar ./
cp -u /opt/aicr-admin/service-oss/target/service-oss.jar ./
cp -u /opt/aicr-admin/service-quote-dc/target/service-quote-dc.jar ./

echo Start Server...


nohup java -Xms512m -Xmx512m -jar service-gateway.jar --spring.profiles.active=prod --spring.cloud.nacos.discovery.username=aicr_prod --spring.cloud.nacos.discovery.password=aicr_prod > /home/aig/java_app/logs/service-gateway.log 2>&1 &
nohup java -Xms512m -Xmx512m -jar service-backend-app.jar --spring.profiles.active=prod --spring.cloud.nacos.discovery.username=aicr_prod --spring.cloud.nacos.discovery.password=aicr_prod > /home/aig/java_app/logs/service-backend-app.log 2>&1 &
nohup java -Xms512m -Xmx512m -jar service-backend-admin.jar --spring.profiles.active=prod --spring.cloud.nacos.discovery.username=aicr_prod --spring.cloud.nacos.discovery.password=aicr_prod > /home/aig/java_app/logs/service-backend-admin.log 2>&1 &
nohup java -Xms512m -Xmx512m -jar service-i18n.jar --spring.profiles.active=prod --spring.cloud.nacos.discovery.username=aicr_prod --spring.cloud.nacos.discovery.password=aicr_prod > /home/aig/java_app/logs/service-i18n.log 2>&1 &
nohup java -Xms512m -Xmx512m -jar service-jobs.jar --spring.profiles.active=prod --spring.cloud.nacos.discovery.username=aicr_prod --spring.cloud.nacos.discovery.password=aicr_prod > /home/aig/java_app/logs/service-jobs.log 2>&1 &
nohup java -Xms512m -Xmx512m -jar service-oss.jar --spring.profiles.active=prod --spring.cloud.nacos.discovery.username=aicr_prod --spring.cloud.nacos.discovery.password=aicr_prod > /home/aig/java_app/logs/service-oss.log 2>&1 &
nohup java -Xms512m -Xmx512m -jar service-quote-dc.jar --spring.profiles.active=prod --spring.cloud.nacos.discovery.username=aicr_prod --spring.cloud.nacos.discovery.password=aicr_prod > /home/aig/java_app/logs/service-quote-dc.log 2>&1 &

echo $(date +%F%n%T) "- Start End!"
