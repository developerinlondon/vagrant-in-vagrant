Vagrant.configure("2") do |config|
#  config.vm.box = "fgrehm/trusty64-lxc"
  config.vm.define "workstation" do |workstation|
    workstation.vm.box = "https://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-amd64-vagrant.box"
    workstation.vm.provision "shell", path: "provision.sh"
  end
end
