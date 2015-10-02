#!/usr/bin/env bash
PROJECT_URL="local.magento.test.com"

sudo cp /vagrant/conf/nginx/lbserver.conf /etc/nginx/sites-available/${PROJECT_URL}
sudo sed -i "s|\$PROJECT_URL|${PROJECT_URL}|g" /etc/nginx/sites-available/${PROJECT_URL}
sudo ln -s /etc/nginx/sites-available/${PROJECT_URL} /etc/nginx/sites-enabled/${PROJECT_URL}
sudo service nginx restart