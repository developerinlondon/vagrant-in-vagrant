#!/usr/bin/env bash

set -ex

apt-get install -y git htop aptitude grub-pc grub2 dbus ufw ntp
apt-get update

# install lxc 2
apt-add-repository ppa:ubuntu-lxc/stable -y
apt update
apt dist-upgrade
apt install -y lxd
