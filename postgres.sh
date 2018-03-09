#!/bin/bash
sudo apt-get update
sudo rm /etc/apt/sources.list.d/pgdg.list
sudo apt-get install -y wget
sudo touch /etc/apt/sources.list.d/pgdg.list
echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" >> /etc/apt/sources.list.d/pgdg.list
sudo wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | \
  sudo apt-key add -
sudo apt-get update
#sudo apt-get install -y postgresql-9.6 postgresql-contrib
#sudo apt-get update
sudo apt-get install -y postgresql postgresql-contrib
sudo service postgresql stop
cd /vagrant
cp /vagrant/postgresql_slave.conf /etc/postgresql/10/main/postgresql.conf
#sudo rm -rf /var/lib/postgresql/10/main/*
#su postgres -c "pg_basebackup -h 192.168.0.100 -D /var/lib/postgresql/10/main -R -P -U replication -X stream"
sudo service postgresql start