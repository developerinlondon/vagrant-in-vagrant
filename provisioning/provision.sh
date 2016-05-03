#!/usr/bin/env bash
sudo apt-get update -qq

ANSIBLE_PATH=/usr/local/bin/ansible

if [[ ! -d $ANSIBLE_PATH ]]; then
	sudo DEBIAN_FRONTEND=noninteractive apt-get -yyqq install python-pip python-dev
	sudo pip install ansible -q
fi


sudo ansible-playbook /vagrant/provisioning/playbook.yml --inventory-file=/vagrant/provisioning/inventory --tags=local --connection=local