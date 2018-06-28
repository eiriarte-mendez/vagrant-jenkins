#!/bin/bash

echo ">> Start sonarqube server"
cd /vagrant/sonarqube
docker-compose up --build -d