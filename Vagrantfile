# # -*- mode: ruby -*-
# # vi: set ft=ruby :

# ###################################################################################################

# require 'yaml'

# Vagrant.require_version ">= 1.5"

# ###################################################################################################

# ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'

# ###################################################################################################

# NODES_FILE = 'environments/vagrant/nodes.yml'

# ###################################################################################################

# def load_config( config_file)
#   YAML.load_file(config_file)
# end

# ###################################################################################################

# nodes = load_config( NODES_FILE )

# ###################################################################################################

# Vagrant.configure('2') do |config|
#   nodes.each do |node|
#     config.vm.define node[:name] do |config|

#       config.vm.box = node[:box]

#       if node[:synced_folders]
#         node[:synced_folders].to_a.each do |sfolder|
#           config.vm.synced_folder sfolder[:host_dir], sfolder[:vm_dir] , disabled: sfolder[:disabled]
#         end
#       else
#         config.vm.synced_folder '', '/vagrant', disabled: true
#       end

#       # if node[:provisioners]
#       #   node[:provisioners].to_a.each do |provisioner|
#       #     config.vm.provision :shell, path: provisioner[:path], args: ["default"]
#       #   end
#       # end
#      config.vm.provision :shell, path: "provisioners/init.sh", args: ["default"]
#      config.vm.provision :shell, path: "provisioners/install_ansible.sh", args: ["default"]

#       config.vm.provider :virtualbox do |v|
#         v.customize ["modifyvm", :id, "--name", "vagrant-in-vagrant"]
#         v.customize ["modifyvm", :id, "--memory", 2048]
#         v.customize ["modifyvm", :id, "--cpus", 2]
#         v.customize ["modifyvm", :id, "--ioapic", "on"]
#         v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
#       end
#     end
#   end
# end

Vagrant.require_version ">= 1.5"

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'

Vagrant.configure("2") do |config|

  config.vm.synced_folder "#{ENV['PWD']}/../ansible", "/ansible"
  config.vm.synced_folder "#{ENV['PWD']}/../artemis", "/artemis"
  config.vm.synced_folder "#{ENV['PWD']}/../devops-non-production", "/devops-non-production"
  config.vm.synced_folder "#{ENV['PWD']}/../terraform", "/terraform"
  config.vm.synced_folder "#{ENV['PWD']}/provisioners/hosts", "/hosts"

  config.vm.define "workstation" do |workstation|
    workstation.vm.box = "ubuntu/wily64"
    workstation.vm.provision :shell, path: "provisioners/init.sh", args: ["default"]
    workstation.vm.provision :shell, path: "provisioners/install_ansible.sh", args: ["default"]
    workstation.vm.provision :shell, path: "provisioners/hosts/hostsgen.sh", args: ["default"]
  end

  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--name", "vagrant-in-vagrant"]
    v.customize ["modifyvm", :id, "--memory", 2048]
    v.customize ["modifyvm", :id, "--cpus", 2]
    v.customize ["modifyvm", :id, "--ioapic", "on"]
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end
end
