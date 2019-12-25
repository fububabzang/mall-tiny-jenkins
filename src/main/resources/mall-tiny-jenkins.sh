#!/usr/bin/env bash
app_name='mall-tiny-jenkins'
this_name='mall-tiny/mall-tiny-jenkins:1.0-SNAPSHOT'
docker stop ${app_name}
echo '----stop container----'
docker rm ${app_name}
echo '----rm container----'
docker image rm -f ${this_name}
echo '----image rm -f container----'
docker run -p 8088:8088 --name ${app_name} \
--link mysql:db \
-v /etc/localtime:/etc/localtime \
-v /mydata/app/${app_name}/logs:/var/logs \
-d mall-tiny/${app_name}:1.0-SNAPSHOT
echo '----start container----'