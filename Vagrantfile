Vagrant.configure("2") do |config|
#  config.vm.box = "fgrehm/trusty64-lxc"
  config.vm.define "xenial" do |xenial|
    xenial.vm.box = "file://output/2016-04-29/vagrant-lxc-xenial-amd64.box"
    xenial.vm.provider :lxc do |lxc|
      lxc.customize 'cgroup.memory.limit_in_bytes', '1024M'
    end
  end

  config.vm.define "wily" do |wily|
    wily.vm.box = "file://output/2016-04-29/vagrant-lxc-wily-amd64.box"
    wily.vm.provider :lxc do |lxc|
    # Same effect as 'customize ["modifyvm", :id, "--memory", "1024"]' for VirtualBox
      lxc.customize 'cgroup.memory.limit_in_bytes', '1024M'
    end
  end
end
