#!/usr/bin/env bash
#第一次写sh 
#创建一个镜像 提取配置文件
#mkdir -p /etc/v2ray
#docker run --rm --name v2temp -d v2ray/official
#docker cp v2temp:/etc/v2ray/config.json /etc/v2ray/config.json
#docker stop v2temp
#!/bin/bash

if [ ! -f "/bin/docker" ];then
	echo "Install Docker"
	curl -s https://shell.jiajin.run/docker.sh | sh
	echo "Install Docker Success"
else
	docker -v
fi

function funWithParam(){
	json='{"v":"2","ps":"","add":"{ip}","port":"{port}","id":"{uuidy}","aid":"64","net":"tcp","type":"none","host":"","path":"","tls":""}'
	json=${json//'{ip}'/"$1"}
	json=${json//'{port}'/"$2"}
	json=${json//'{uuidy}'/"$3"}
	b64=$(base64 <<< "$json")
	echo "vmess://$b64" | awk 'BEGIN{RS="\n";ORS="";}{print $0}'
}
#设置端口 如果有传入则替换
port="8001"
if [ "$1" ]; then
 port=$1
 fi
 
isrun=$(docker ps -aq --filter name=v2ray)
if [ -n "$isrun" ]; then
 temp=$(docker stop v2ray && docker rm v2ray)
 echo '容器已存在->正在删除' $isrun
 fi
 
UUID=$(cat /proc/sys/kernel/random/uuid)
#启动容器
dockerid=$(docker run --name v2ray -p:$port:8001 -d v2fly/v2fly-core:v4.38.3)
#替换uuid
docker exec v2ray sed -i "s/60ca58e9-003e-4c01-98de-c2223ae49153/${UUID}/g" "/etc/v2ray/config.json"
#重启容器
docker restart v2ray
#myip=$(curl -s whatismyip.akamai.com)
myip=$(curl -s ipinfo.io/ip)
echo ------------------------------------------------
echo IP			:		$myip
echo UUID		:		$UUID
echo PORT		:		$port
echo $(funWithParam "$myip" "$port" "$UUID")
echo ------------------------------------------------
