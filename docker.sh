#!/bin/sh
curl https://get.docker.com/ | sh
#阿里国内加速
curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s https://vveeo4eo.mirror.aliyuncs.com

#启动docker
systemctl enable docker
systemctl restart docker

#docker-compose
curl -L https://get.daocloud.io/docker/compose/releases/download/1.25.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
#输出版本
docker -v
docker-compose --version
