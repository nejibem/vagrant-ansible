#!/bin/sh

ansible-playbook -vvvv -i provision/hosts -u vagrant provision/deploy.yml