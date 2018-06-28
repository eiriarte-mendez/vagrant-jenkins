#!/bin/bash

########################
# Install nginx
########################
echo ">>  Install nginx"
sudo apt-get -y install nginx > /dev/null 2>&1
sudo service nginx start
cd /etc/nginx/sites-available
sudo rm default ../sites-enabled/default
sudo cp /vagrant/nginx/jenkins /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/jenkins /etc/nginx/sites-enabled/
sudo service nginx restart
sudo service jenkins restart