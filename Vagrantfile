Vagrant.require_version ">= 1.5"

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'

Vagrant.configure("2") do |config|

  config.vm.synced_folder "#{ENV['PWD']}/../ansible", "/ansible"
  config.vm.synced_folder "#{ENV['PWD']}/../artemis", "/artemis"
  config.vm.synced_folder "#{ENV['PWD']}/../devops-non-production", "/devops-non-production"
  config.vm.synced_folder "#{ENV['PWD']}/../terraform", "/terraform"

  config.vm.define "workstation" do |workstation|
    workstation.vm.box = "ubuntu/wily64"
    workstation.vm.provision :shell, path: "provision.sh", args: ["default"]
  end

  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--name", "vagrant-in-vagrant"]
    v.customize ["modifyvm", :id, "--memory", 2048]
    v.customize ["modifyvm", :id, "--cpus", 2]
    v.customize ["modifyvm", :id, "--ioapic", "on"]
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end
end
