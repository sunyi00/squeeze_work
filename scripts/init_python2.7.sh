#!/bin/bash

mkdir /home/work/down/ && cd /home/work/down/

wget http://www.python.org/ftp/python/2.7.5/Python-2.7.5.tgz
tar -xzf Python-2.7.5.tgz
cd Python-2.7.5

./configure --prefix=/opt/python27 --enable-shared
make
sudo make install
 
echo "/opt/python27/lib" | sudo tee -a /etc/ld.so.conf.d/python27.conf
sudo ldconfig

# 下载安装easy_install和环境

cd /home/work/down/
wget http://peak.telecommunity.com/dist/ez_setup.py
sudo /opt/python27/bin/python ez_setup.py
sudo /opt/python27/bin/easy_install-2.7 virtualenv
/opt/python27/bin/virtualenv  /home/work/env
 
cat >> ~/.profile << DELIM
if [ -d "\$HOME/env/bin" ] ; then
    PATH="\$HOME/env/bin:\$PATH"
fi
DELIM

cd /home/work

virtualenv env

source /home/work/env/bin/activate

sudo rm -rf /home/work/down
echo 'we are done....'
