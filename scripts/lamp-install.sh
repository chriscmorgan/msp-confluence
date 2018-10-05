#!/bin/bash

if [[ -z "${PASSWORD}" ]]; then
  echo "password not set, exiting"
  exit 1
else
  CONF_PASS="${PASSWORD}"
fi

sudo mv /etc/sysconfig/clock /etc/sysconfig/clock.bck
sudo mv /tmp/clock /etc/sysconfig/clock
sudo ln -sf /usr/share/zoneinfo/Australia/Victoria /etc/localtime

sudo yum update -y
sudo yum groupinstall -y 'MySQL Database'
sudo yum install -y mysql56-server


sudo mv /etc/my.cnf /etcmy.cnf.bak
sudo mv /tmp/my.cnf /etc/my.cnf

sudo service mysqld start

mysql -u root -e "CREATE DATABASE confluence CHARACTER SET utf8 COLLATE utf8_bin;"

mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'confuser'@'localhost' IDENTIFIED BY '$CONF_PASS';"

mysql -u root -e "FLUSH PRIVILEGES;"

