#!/bin/sh

ansible-playbook -v -i provision/hosts -u vagrant provision/deploy.yml