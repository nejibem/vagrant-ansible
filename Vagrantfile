current_dir = File.dirname(__FILE__)
require 'yaml'
conf = YAML.load_file("#{current_dir}/provision/vars_dev.yml")

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    # use vagrantcloud.com box
    config.vm.box = "puphpet/ubuntu1404-x64"
    config.vm.box_url = "puphpet/ubuntu1404-x64"

    config.vm.define :dev_server do |dev_config|

        dev_config.vm.provider :virtualbox do |v|
            v.customize [ "modifyvm", :id, "--memory", "1024" ]
        end
        dev_config.vm.provider "vmware_fusion" do |v|
          v.vmx["memsize"] = "1024"
        end

        dev_config.vm.host_name = "dev-server"
        dev_config.vm.synced_folder "./", "/var/www/#{conf['site_hostname']}",
            :owner => "vagrant",
            :group => "www-data",
            mount_options: ["dmode=775","fmode=664"]
        dev_config.vm.network "forwarded_port", guest: 80, host: 8080
        dev_config.vm.network :private_network, ip: "192.168.56.100"

        dev_config.vm.provision :ansible do |ansible|
            ansible.playbook = "provision/dev_server.yml"
            ansible.limit = 'dev-server'
            ansible.inventory_path = "provision/hosts"
        end

    end

end