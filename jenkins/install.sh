#!/bin/bash

########################
# Install java
########################
echo ">> Install Java"
sudo apt-get -y install openjdk-8-jdk > /dev/null 2>&1

########################
# Install jenkins
########################
echo ">> Install Jenkins"
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update > /dev/null 2>&1
sudo apt-get -y install jenkins > /dev/null 2>&1