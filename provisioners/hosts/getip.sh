
#!/usr/bin/env bash
cd /vagrant/vagrant-in-vagrant/
for i in $(vagrant status | grep running | awk '{print $1}'); do
	vagrant address $i && echo $i
done
