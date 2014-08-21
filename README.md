vagrant-ansible
===============


## Setup Instructions

##### Create Vagrant VM
vagrant up

##### Generate Ssh keys (if required)
see https://help.github.com/articles/generating-ssh-keys


## Deploy Instructions

Need to setup ssh access before ansible can deploy to server.

##### OSX Install ssh-copy-id script (only required for osx if missing)
sudo curl https://raw.githubusercontent.com/beautifulcode/ssh-copy-id-for-OSX/master/ssh-copy-id.sh -o /usr/local/bin/ssh-copy-id
sudo chmod +x /usr/local/bin/ssh-copy-id

##### Copy public key to user vagrant on host
ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@192.168.56.10

##### Run deploy Script
./provision/deploy.sh

