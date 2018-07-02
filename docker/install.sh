#!/bin/bash

if [ -f /opt/box/.docker ] ; then
    echo ">> docker: installed and configured"
else
    echo ">> docker: install"
    sudo apt-get remove docker docker-engine docker.io > /dev/null 2>&1
    sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common > /dev/null 2>&1
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo apt-get update > /dev/null 2>&1
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
    sudo apt-get install -y docker-ce > /dev/null 2>&1

    echo ">> docker-compose: install"
    sudo apt-get install -y docker-compose > /dev/null 2>&1
    sudo usermod -aG docker vagrant
    
    systemctl enable docker
    service docker restart

    touch /opt/box/.docker
fi
