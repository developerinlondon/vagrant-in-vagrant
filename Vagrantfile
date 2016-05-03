# If your Vagrant version is lower than 1.5, you can still use this provisioning
# by commenting or removing the line below and providing the config.vm.box_url parameter,
# if it's not already defined in this Vagrantfile. Keep in mind that you won't be able
# to use the Vagrant Cloud and other newer Vagrant features.
Vagrant.require_version ">= 1.5"

# Set default provider
ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'

# Check to determine whether we're on a windows or linux/os-x host,
# later on we use this to launch ansible in the supported way
# source: https://stackoverflow.com/questions/2108727/which-in-ruby-checking-if-program-exists-in-path-from-ruby
def which(cmd)
    exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
    ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
        exts.each { |ext|
            exe = File.join(path, "#{cmd}#{ext}")
            return exe if File.executable? exe
        }
    end
    return nil
end

Vagrant.configure("2") do |config|
  config.vm.define "workstation" do |workstation|
    workstation.vm.box = "ubuntu/wily64"
  end

  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--memory", 2048]
    v.customize ["modifyvm", :id, "--cpus", 2]
    v.customize ["modifyvm", :id, "--ioapic", "on"]
  end

# Ansible provisioning (you need to have ansible installed)    
  if which('ansible-playbook')
    config.vm.provision "ansible" do |ansible|
      ansible.playbook = "provisioning/playbook.yml"
      ansible.inventory_path = "provisioning/inventory"
      ansible.limit = 'all'
      # Run commands as root.
      ansible.sudo = true
      # ansible.raw_arguments = ['-v']
      # run only local enviroment
      ansible.tags = 'local'
    end
  else
    config.vm.provision :shell, path: "provisioning/provision.sh", args: ["default"]
  end

end
