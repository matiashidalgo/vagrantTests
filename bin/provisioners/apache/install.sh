#!/usr/bin/env bash

#Install Apache
apt-get -y install apache2 php5

a2enmod rewrite
a2enmod headers
a2enmod deflate

sed -i '/display_errors = Off/c display_errors = On' /etc/php5/apache2/php.ini
sed -i '/error_reporting = E_ALL & ~E_DEPRECATED/c error_reporting = E_ALL | E_STRICT' /etc/php5/apache2/php.ini
sed -i '/html_errors = Off/c html_errors = On' /etc/php5/apache2/php.ini

#Apache 2.2 or <
bash -c "cat >> /etc/apache2/conf.d/servername.conf <<EOF
ServerName localhost
EOF"

#Apache 2.4 for Ubuntu 14.04
bash -c "cat >> /etc/apache2/apache2.conf <<EOF
ServerName localhost
EOF"