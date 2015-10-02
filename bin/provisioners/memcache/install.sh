#!/usr/bin/env bash

sudo apt-get install -y memcached libmemcached-tools

yes | sudo pecl install memcache

sudo touch /etc/php5/conf.d/memcache.ini
sudo echo "extension=memcache.so" >> /etc/php5/conf.d/memcache.ini
sudo echo "memcache.hash_strategy=\"consistent\"" >> /etc/php5/conf.d/memcache.ini