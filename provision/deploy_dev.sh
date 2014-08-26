#!/bin/sh

ansible-playbook -v -i provision/hosts -u vagrant provision/deploy_dev.yml