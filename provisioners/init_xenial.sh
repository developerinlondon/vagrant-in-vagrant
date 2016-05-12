#!/usr/bin/env bash

set -ex


rm -fr /var/lib/apt/lists/lock
rm -fr /var/lib/dpkg/lock

#rm /var/lib/apt/lists/* -vf 
apt-get update 
apt-get install -y software-properties-common python-software-properties



# install lxc web panel
# wget http://lxc-webpanel.github.io/tools/install.sh -O - | sudo bash
# rm /var/lib/apt/lists/* -vf 

apt-get install -y vagrant git htop
apt-get update
apt-get install -y zlib1g-dev

# reinstall vagrant as the one that comes with ubuntu 16.04 has a bug that doesnt let you install plugins properly
wget https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb -O /tmp/vagrant_1.8.1_x86_64.deb
dpkg -i /tmp/vagrant_1.8.1_x86_64.deb

# install the vagrant plugins we need.
vagrant plugin install vagrant-lxc
vagrant plugin install vagrant-hostmanager
ln -s  /vagrant/vagrant-in-vagrant /home/vagrant/vagrant-in-vagrant

# install lxc 2
apt-get update
apt dist-upgrade -y --fix-missing
apt-get install -y lxc1

cd /home/vagrant/vagrant-in-vagrant
vagrant up

