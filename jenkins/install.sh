#!/bin/bash

if type -p java; then
    echo ">> java: installed and configured"
elif [[ -n "$JAVA_HOME" ]] && [[ -x "$JAVA_HOME/bin/java" ]];  then
    echo ">> java: installed and configured"
else
    echo ">> java: install"
    sudo apt-get -y install openjdk-8-jdk > /dev/null 2>&1
fi

if [ -f /opt/box/.jenkins ] ; then
    echo ">> jenkins: installed and configured"
    service jenkins restart
else
    echo ">> jenkins: install"
    wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
    sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
    sudo apt-get update > /dev/null 2>&1
    sudo apt-get -y install jenkins > /dev/null 2>&1
    touch /opt/box/.jenkins
fi
