#!/bin/bash


sudo yum install java-1.8.0 -y
sudo yum remove java-1.7.0-openjdk -y
sudo mkdir /opt/data
sudo chown ec2-user:ec2-user /opt/data
cd /opt

sudo wget -O confluence.tar.gz https://product-downloads.atlassian.com/software/confluence/downloads/atlassian-confluence-7.0.4.tar.gz
sudo tar -zxvf confluence.tar.gz
sudo chown -R ec2-user:ec2-user atlassian-confluence-7.0.4

echo -e "\nconfluence.home=/opt/data"  >> /opt/atlassian-confluence-7.0.4/confluence/WEB-INF/classes/confluence-init.properties

sudo mv /opt/atlassian-confluence-7.0.4/conf/server.xml /opt/atlassian-confluence-7.0.4/conf/server.xml.bck
sudo cp /tmp/server.xml /opt/atlassian-confluence-7.0.4/conf/server.xml

sudo cp /tmp/conflunence /etc/init.d/confluence
sudo chmod +e /etc/init.d/confluence
sudo chown ec2-user:ec2-user /opt/data -R
sudo chown ec2-user:ec2-user /opt/atlassian-confluence-7.0.4 -R

sudo /etc/init.d/confluence start

sudo rm -rf /opt/atlassian-confluence-7.0.4.tar.gz
