WIP - Vagrant in Vagrant to allow you to run a full application stack inside.

Please clone this repo to first make the box:

https://github.com/developerinlondon/vagrant-lxc-base-boxes/tree/feature/add-ansible

(note the above includes an ansible installer)

1) First setup a empty ubuntu vagrant box on your workstation.

2) Login to the vagrantbox and clone the repo above so you can create an image.

3) Create the image by running:

  `ANSIBLE_VERSION=1.9.4 ANSIBLE=1 make xenial`

  The above will create a vagrant box file in the output folder.

4) Import the vagrant box file by running:

  `vagrant box add xenial output/<path to your box file>`

5) Now edit the vagrantfile here as needed to reflect the new file (xenial for example) then run `vagrant up xenial`

This will give a vagrant-lxc container that is running our custom lxc container.

running ansible locally:
------------------------
sudo ansible-playbook /vagrant/provisioning/playbook.yml --inventory-file=/vagrant/provisioning/inventory --tags=local --connection=local