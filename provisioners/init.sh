#!/usr/bin/env bash

set -ex

apt-get install -y vagrant git htop
apt install lxc -y
apt-get update
apt-get install -y zlib1g-dev
vagrant plugin install vagrant-lxc
vagrant plugin install vagrant-address
ln -s  /vagrant/vagrant-in-vagrant /home/vagrant/vagrant-in-vagrant
cd /home/vagrant/vagrant-in-vagrant
vagrant up
