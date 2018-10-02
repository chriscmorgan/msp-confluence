#!/bin/bash


sudo yum install java-1.8.0 -y
sudo yum remove java-1.7.0-openjdk -y
sudo mkdir /opt/data
sudo chown ec2-user:ec2-user /opt/data
cd /opt

sudo wget https://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-6.12.0.tar.gz
sudo tar -zxvf atlassian-confluence-6.12.0.tar.gz
sudo chown -R ec2-user:ec2-user atlassian-confluence-6.12.0

echo -e "\nconfluence.home=/opt/data"  >> /opt/atlassian-confluence-6.12.0/confluence/WEB-INF/classes/confluence-init.properties

sudo wget http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.34.tar.gz
sudo tar -zxvf mysql-connector-java-5.1.34.tar.gz
sudo chown -R ec2-user:ec2-user mysql-connector-java-5.1.34
cp mysql-connector-java-5.1.34/mysql-connector-java-5.1.34-bin.jar atlassian-confluence-6.12.0/lib

/opt/atlassian-confluence-6.12.0/bin/start-confluence.sh

sudo rm -rf /opt/mysql-connector-java-5.1.34.tar.gz
sudo rm -rf /opt/mysql-connector-java-5.1.34
sudo rm -rf /opt/atlassian-confluence-6.12.0.tar.gz
