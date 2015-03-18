#!/bin/bash

groupadd -g 1000 work && useradd work -u 1000 -g work -m -d /home/work -s /bin/bash

export DEBIAN_FRONTEND=noninteractive

echo '' >> /etc/apt/sources.list
echo 'deb http://mirrors.aliyun.com/debian/ squeeze main non-free contrib' >> /etc/apt/sources.list
echo 'deb-src http://mirrors.aliyun.com/debian/ squeeze-proposed-updates main non-free contrib' >> /etc/apt/sources.list
echo 'deb  http://mirrors.aliyun.com/debian/ wheezy main non-free contrib' >> /etc/apt/sources.list
echo 'deb-src http://mirrors.aliyun.com/debian/ wheezy-proposed-updates main non-free contrib' >> /etc/apt/sources.list
echo 'deb http://mirrors.163.com/debian squeeze main non-free contrib' >> /etc/apt/sources.list
echo 'deb http://mirrors.163.com/debian squeeze-proposed-updates main contrib non-free' >> /etc/apt/sources.list
echo 'deb-src http://mirrors.163.com/debian squeeze main non-free contrib' >> /etc/apt/sources.list
echo 'deb-src http://mirrors.163.com/debian squeeze-proposed-updates main contrib non-free' >> /etc/apt/sources.list
echo 'deb http://mirrors.163.com/debian-security squeeze/updates main contrib non-free' >> /etc/apt/sources.list
echo 'deb-src http://mirrors.163.com/debian-security squeeze/updates main contrib non-free' >> /etc/apt/sources.list

apt-get update
apt-get -y upgrade 

apt-get -y install wget curl
apt-get -y install git-core
apt-get -y install make
apt-get -y install build-essential

apt-get -y install libsqlite3-dev zlib1g-dev libncurses5-dev
apt-get -y install libgdbm-dev libbz2-dev libreadline5-dev
apt-get -y install libssl-dev libdb-dev
apt-get -y install libbz2-dev
apt-get -y install libcurl4-openssl-dev
apt-get -y install libxml2-dev
apt-get -y install libxslt1-dev

apt-get -y install sudo
echo 'work	ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

sudo -u work /bin/bash /scripts/init_python2.7.sh

apt-get -y autoclean
apt-get -y clean
rm -rf /var/cache/apt/archives/*
rm -rf /var/lib/apt/lists/*
