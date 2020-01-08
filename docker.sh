#!/bin/sh
yum install -y yum-utils device-mapper-persistent-data lvm2 epel-release python-pip
yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
yum makecache fast
rpm --import https://mirrors.aliyun.com/docker-ce/linux/centos/gpg
yum -y install docker-ce
systemctl enable docker
systemctl start docker
docker -v

pip install --upgrade pip -i http://mirrors.aliyun.com/pypi/simple
pip install docker-compose -i http://mirrors.aliyun.com/pypi/simple
docker-compose -v
