apt-get install -y vagrant
sudo apt install lxc1 -y
vagrant plugin install vagrant-lxc
wget https://github.com/developerinlondon/vagrant-in-vagrant/archive/latest.tar.gz
tar -zxvf latest.tar.gz
cd vagrant-in-vagrant-latest
vagrant up