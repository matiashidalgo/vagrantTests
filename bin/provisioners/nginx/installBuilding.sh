#!/usr/bin/env bash

NGINX_VERSION="1.8.0"
NGINX_SETTING="--with-http_realip_module --with-http_geoip_module --with-http_stub_status_module"
#Install Nginx
mkdir $HOME/build
cd $HOME/build && wget http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz && tar xzf nginx-${NGINX_VERSION}.tar.gz

#Configure it using the following command:
cd $HOME/build/nginx-${NGINX_VERSION} && ./configure ${NGINX_SETTING}

#And compile it as follows:
cd $HOME/build/nginx-${NGINX_VERSION} && make && make install

apt-get -y install php5-fpm
update-rc.d -f nginx defaults
service nginx start

sed -i '/display_errors = Off/c display_errors = On' /etc/php5/fpm/php.ini
sed -i '/error_reporting = E_ALL & ~E_DEPRECATED/c error_reporting = E_ALL | E_STRICT' /etc/php5/fpm/php.ini
sed -i '/html_errors = Off/c html_errors = On' /etc/php5/fpm/php.ini

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/"
NGINX_FOLDER="/etc/nginx/"
mv ${NGINX_FOLDER}nginx.conf ${NGINX_FOLDER}nginx.conf.orig
cp ${DIR}nginxLB.conf ${NGINX_FOLDER}nginx.conf

mkdir /var/www