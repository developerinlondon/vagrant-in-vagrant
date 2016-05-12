ANSIBLE_VERSION=${ANSIBLE_VERSION:-1.9.4}

apt-get install -y build-essential python-setuptools python-jinja2 python-yaml python-paramiko python-httplib2 python-crypto sshpass
wget https://releases.ansible.com/ansible/ansible-$ANSIBLE_VERSION.tar.gz -O /tmp//ansible.tar.gz
tar -zxvf /tmp/ansible.tar.gz -C /tmp/ && rm -r /tmp/ansible.tar.gz
cd /tmp/ansible-* && make && make install