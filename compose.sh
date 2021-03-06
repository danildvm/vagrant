#!/bin/bash
sudo apt-get update
sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
cd /vagrant
sudo docker container stop $(docker ps -aq)
sudo docker container rm $(docker ps -aq)
sudo docker-compose up -d
