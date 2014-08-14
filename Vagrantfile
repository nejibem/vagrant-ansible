current_dir = File.dirname(__FILE__)
require 'yaml'
conf = YAML.load_file("#{current_dir}/provision/group_vars/all")

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    config.vm.box = "precise64"
    config.vm.box_url = "http://files.vagrantup.com/precise64.box"

    config.vm.define :devsvr do |dev_config|

        dev_config.vm.provider :virtualbox do |v|
            v.customize [ "modifyvm", :id, "--memory", "1024" ]
        end
        dev_config.vm.provider "vmware_fusion" do |v|
          v.vmx["memsize"] = "1024"
        end

        dev_config.vm.host_name = "dev-vagrant"
        dev_config.vm.synced_folder "./", "/var/www/#{conf['server_hostname']}"
        dev_config.vm.network "forwarded_port", guest: 80, host: 8080
        dev_config.vm.network :private_network, ip: "192.168.100.10"

        dev_config.vm.provision :ansible do |ansible|
            ansible.playbook = "provision/playbook.yml"
            ansible.limit = 'webservers'
            ansible.inventory_path = "provision/hosts"
        end

    end

end