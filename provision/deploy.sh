#!/bin/sh

ansible-playbook -vv -i provision/hosts -u vagrant provision/deploy.yml