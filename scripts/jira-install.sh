#!/bin/bash
sudo yum install java-1.8.0 -y
sudo yum remove java-1.7.0-openjdk -y
sudo mkdir /opt/data
sudo chown ec2-user:ec2-user /opt/data
cd /opt

sudo wget -O jira.tar.gz https://product-downloads.atlassian.com/software/jira/downloads/atlassian-jira-software-8.5.1.tar.gz
sudo tar -zxvf jira.tar.gz
sudo chown -R ec2-user:ec2-user atlassian-jira-software-8.5.1
