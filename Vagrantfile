# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |vconfig|

    vconfig.vm.box = "precise64"
    vconfig.vm.box_url = "http://files.vagrantup.com/precise64.box"

    vconfig.vm.define :site do |config|

        config.vm.provider :virtualbox do |v|
            v.customize [ "modifyvm", :id, "--memory", "1024" ]
        end

        config.vm.provider "vmware_fusion" do |v|
          v.vmx["memsize"] = "1024"
        end

        config.vm.host_name = "sitevagrant"

        config.vm.synced_folder "../", "/var/www/site"

        config.vm.network "forwarded_port", guest: 80, host: 8080

        config.vm.network :private_network, ip: "192.168.100.10"

        config.vm.provision :ansible do |ansible|
            ansible.playbook = "provision/playbook.yml"
            ansible.limit = 'webservers'
            ansible.inventory_path = "provision/hosts"
        end

    end

end