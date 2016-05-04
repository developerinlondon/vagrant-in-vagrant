#!/usr/bin/env bash

set -ex

apt-get install -y vagrant
apt install lxc -y
apt-get update
apt-get install -y zlib1g-dev
vagrant plugin install vagrant-lxc
cd /vagrant/vagrant-host
vagrant up
