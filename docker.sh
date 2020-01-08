#!/bin/sh
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
yum makecache fast
rpm --import https://mirrors.aliyun.com/docker-ce/linux/centos/gpg
yum -y install docker-ce
systemctl enable docker
systemctl start docker
docker -v

yum -y install epel-release && yum -y install python-pip && pip install --upgrade pip && pip install docker-compose
docker-compose -v