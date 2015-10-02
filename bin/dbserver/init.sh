#!/usr/bin/env bash
PROJECT_DB_NAME="magento"


#MYSQL DATABASE
if [ ! -f /vagrant/db/db.sql ];
then
  echo "[$0] Extracting Database..."
  tar -zxvf /vagrant/data/db.tgz -C /vagrant/data
fi

echo "[$0] Importing Database..."
mysql -uroot <<QUERY_INPUT
DROP DATABASE IF EXISTS ${PROJECT_DB_NAME}; CREATE DATABASE ${PROJECT_DB_NAME};USE ${PROJECT_DB_NAME};SOURCE /vagrant/data/db.sql;GRANT ALL PRIVILEGES ON * . * TO 'root'@'%';
QUERY_INPUT
