#!/bin/sh

#修改源需要root权限
if [ $(id -u) -ne 0 ]; then
    echo "Need Root!"
    exit 0
fi
#备份文件
cp /etc/apt/sources.list /etc/apt/sources.list.bak
#替换服务器
sed -i 's/http:\/\/archive.ubuntu.com/http:\/\/mirrors.aliyun.com/g' /etc/apt/sources.list
sed -i 's/http:\/\/security.ubuntu.com/http:\/\/mirrors.aliyun.com/g' /etc/apt/sources.list
#更新源
apt-get update
