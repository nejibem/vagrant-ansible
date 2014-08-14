#!/bin/sh

ansible-playbook -i provision/hosts -u vagrant provision/deploy.yml