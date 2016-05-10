#!/usr/bin/env bash

set -ex

wget http://lxc-webpanel.github.io/tools/install.sh -O - | sudo bash

apt-get install -y vagrant git htop
apt install lxc -y
apt-get update
apt-get install -y zlib1g-dev
vagrant plugin install vagrant-lxc
vagrant plugin install vagrant-hostmanager
ln -s  /vagrant/vagrant-in-vagrant /home/vagrant/vagrant-in-vagrant
cd /home/vagrant/vagrant-in-vagrant
vagrant up
