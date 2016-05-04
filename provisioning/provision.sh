#!/usr/bin/env bash
# sudo apt-get update -qq
# sudo apt-get install ansible -qqyy

# echo "Runing ansible scripts"
# sudo ansible-playbook /vagrant/provisioning/playbook.yml --inventory-file=/vagrant/provisioning/inventory --tags=osupgrade --connection=local
# sudo ansible-playbook /vagrant/provisioning/playbook.yml --inventory-file=/vagrant/provisioning/inventory --tags=lxc --connection=local
# sudo ansible-playbook /vagrant/provisioning/playbook.yml --inventory-file=/vagrant/provisioning/inventory --tags=vagrant --connection=local
# echo "Executing vagrant up"
# sudo runuser -l root -c 'cd /vagrant/vagrant-host/ && vagrant up'


apt-get install -y vagrant
sudo apt install lxc1 -y
vagrant plugin install vagrant-lxc
wget https://github.com/developerinlondon/vagrant-in-vagrant/archive/latest.tar.gz
tar -zxvf latest.tar.gz
cd vagrant-in-vagrant-latest
vagrant up