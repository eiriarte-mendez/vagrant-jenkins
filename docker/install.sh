#!/bin/bash

########################
# Install docker
########################

# apt-get install -y language-pack-en > /dev/null 2>&1
# sudo localedef -i en_US -f UTF-8 en_US.UTF-8

# export LANGUAGE=en_US.UTF-8
# export LC_ALL=en_US.UTF-8
# export LC_ALL=en_US.UTF-8
# export LC_CTYPE=en_US.UTF-8

echo ">> Install docker"
sudo apt-get remove docker docker-engine docker.io > /dev/null 2>&1
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common > /dev/null 2>&1
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-get update > /dev/null 2>&1
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get install -y docker-ce > /dev/null 2>&1

echo ">> Install docker-compose"
sudo apt-get install -y docker-compose > /dev/null 2>&1

sudo usermod -aG docker vagrant

# return 0;