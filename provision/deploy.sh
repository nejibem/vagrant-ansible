#!/bin/sh

ansible-playbook -vvv -i provision/hosts -u vagrant provision/deploy.yml