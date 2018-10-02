#!/bin/bash

sudo yum update -y
sudo yum groupinstall -y 'Web Server' 'MySQL Database' 'PHP Support'
sudo yum install -y httpd mysql56-server
sudo service httpd start
sudo chkconfig httpd on
chkconfig -list httpd

sudo mv /etc/my.cnf /etcmy.cnf.bak
sudo cp ../files/my.cnf /etc/my.cnf

sudo service mysqld start

mysql -u root -e "CREATE DATABASE confluence CHARACTER SET utf8 COLLATE utf8_bin;"

mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'confuser'@'localhost' IDENTIFIED BY 'confpass';"

mysql -u root -e "FLUSH PRIVILEGES;"

