#!/bin/bash
cd /etc/yum.repos.d/ && sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*;
cd /;
dnf -y update;
dnf -y install epel-release;
dnf -y install gcc gcc-c++ git make emacs python3 python3-pip python3-devel wget readline-devel unzip;
pip3 install numpy statsmodels pylint;
git clone https://github.com/handong32/peakler.git;
wget https://www.lua.org/ftp/lua-5.1.5.tar.gz;
tar -xf lua-5.1.5.tar.gz;
cd lua-5.1.5;
make linux;
make all test;
make install;
cd /;
wget https://luarocks.org/releases/luarocks-2.4.2.tar.gz;
tar -xf luarocks-2.4.2.tar.gz;
cd luarocks-2.4.2;
./configure && make && make install;
export PATH=$PATH:/usr/local/bin;
luarocks-5.1 install luasocket;
cd /peakler/experiments/cilantro && tar -xf cilantro_awsecr.tar.gz;
ln -s /peakler/experiments/cilantro/cilantro_awsecr/driver/ /driver;
ln -s /peakler/experiments/cilantro/cilantro_awsecr/wrk2/ /wrk2;
cd /;
chmod 777 /wrk2/wrk;
git clone https://github.com/handong32/cilantro.git;
cd /cilantro;
pip3 install -r requirements.txt;
pip3 install -e .;
cd /;
#sleep 30d
#python3 /driver/wrk_runscript.py --wrk-logdir /cilantrologs/ --wrk-qps 3000 --wrk-duration 30 --wrk-num-threads 32 --wrk-num-connections 32 --wrk-url http://frontend.default.svc.cluster.local:5000