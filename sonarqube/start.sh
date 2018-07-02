#!/bin/bash

echo ">> sonarqube-server: run"
cd /vagrant/sonarqube
docker-compose up --build -d