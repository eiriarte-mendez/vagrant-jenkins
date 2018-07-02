#!/bin/bash

if [ -f /opt/box/.nginx ] ; then
    echo ">> nginx: installed and configured"
    service nginx restart
else
    echo ">>  nginx: install"
    apt-get -y install nginx > /dev/null 2>&1
    service nginx start

    echo ">> nginx: configure"
    cd /etc/nginx/sites-available
    rm default ../sites-enabled/default

    cp /vagrant/nginx/jenkins /etc/nginx/sites-available/
    cp /vagrant/nginx/sonarqube /etc/nginx/sites-available/
    
    ln -s /etc/nginx/sites-available/jenkins /etc/nginx/sites-enabled/
    ln -s /etc/nginx/sites-available/sonarqube /etc/nginx/sites-enabled/
    
    touch /opt/box/.nginx 
    service nginx restart
fi 
