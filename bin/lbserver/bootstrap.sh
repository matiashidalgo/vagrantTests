#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

PROVISIONERS_FOLDER="/vagrant/bin/provisioners/"

mkdir /home/vagrant/log

#Configure misc
if [ ! -f /home/vagrant/log/miscconfiguration ];
then
  sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/g' /home/vagrant/.bashrc
  sed -i "s/#alias ls='ls --color=auto'/alias ls='ls --color=auto'/g" /home/vagrant/.bashrc
  sed -i "s/#alias ll='ls -l'/alias ll='ls -l'/g" /home/vagrant/.bashrc
  sed -i "s/#alias la='ls -A'/alias la='ls -A'/g" /home/vagrant/.bashrc
  sed -i "/#alias l='ls -CF'/alias l='ls -CF'/g" /home/vagrant/.bashrc

  touch /home/vagrant/log/miscconfiguration
fi

#Install Nginx
source ${PROVISIONERS_FOLDER}nginx/install.sh

#Install VIM
source ${PROVISIONERS_FOLDER}vim/install.sh
