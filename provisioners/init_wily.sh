#!/usr/bin/env bash

set -ex

apt-get update 

apt-get install -y software-properties-common python-software-properties

#rm /var/lib/apt/lists/* -vf 

# install lxc web panel
# wget http://lxc-webpanel.github.io/tools/install.sh -O - | sudo bash

apt-get install -y vagrant git htop
apt-get update
apt-get install -y zlib1g-dev
vagrant plugin install vagrant-lxc
vagrant plugin install vagrant-hostmanager
ln -s  /vagrant/vagrant-in-vagrant /home/vagrant/vagrant-in-vagrant
cd /home/vagrant/vagrant-in-vagrant

# install lxc 2
apt-add-repository ppa:ubuntu-lxc/stable -y
apt-get update -qq
apt-get dist-upgrade -y -qq
apt-get install -y lxc1 -qq

vagrant up
