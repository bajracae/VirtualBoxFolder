#!/bin/ash

# IP Addresses (NOTE: CHANGE THESE TO YOUR HOSTS' IP ADDRESSES)
HOST1=192.168.1.108
HOST2=192.168.1.109

# Install important packages
apk add ansible
apk add sshpass
apk add curl

# Generate an ssh key
ssh-keygen -t rsa

# NOTE: CHANGE THE IP ADDRESSES TO YOUR HOSTS' IP ADDRESSES
ssh-copy-id -i ~/.ssh/id_rsa $HOST1
ssh-copy-id -i ~/.ssh/id_rsa $HOST2

# Run the playbook
ansible-playbook webserver.yaml -i ./hosts.ini

# Return the contents of "ansible-index.html"
echo "== ${HOST1} content =="
curl $HOST1

echo

echo "== ${HOST2} content =="
curl $HOST2
