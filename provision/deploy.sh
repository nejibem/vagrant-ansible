#!/bin/sh

#ansible-playbook provision/deploy.yml -i provision/hosts --private-key=$HOME/.vagrant.d/insecure_private_key
#ansible all -i vagrant_ansible_inventory -u vagrant --private-key ~/.vagrant.d/insecure_private_key -m ping

ansible-playbook -i provision/hosts -u vagrant provision/deploy.yml