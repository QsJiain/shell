#!/bin/sh
yum install -y yum-utils device-mapper-persistent-data lvm2 epel-release
yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
yum makecache fast
rpm --import https://mirrors.aliyun.com/docker-ce/linux/centos/gpg
yum -y install docker-ce
#阿里国内加速
curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s https://vveeo4eo.mirror.aliyuncs.com
# "data-root":"/var/lib/docker"
#启动docker
systemctl enable docker
systemctl restart docker

#docker-compose
curl -L https://get.daocloud.io/docker/compose/releases/download/1.29.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
#输出版本
docker -v
docker-compose --version
