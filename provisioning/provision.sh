#!/usr/bin/env bash
sudo apt-get update -qq
sudo apt-get install ansible -qqyy

echo "Runing ansible scripts"

sudo ansible-playbook /vagrant/provisioning/playbook.yml --inventory-file=/vagrant/provisioning/inventory --tags=local --connection=local