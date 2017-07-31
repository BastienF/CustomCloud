#!/bin/sh

apt-get install -y sudo

adduser ansible --shell /bin/bash --disabled-password --gecos ""
echo 'ansible ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

mkdir -p /home/ansible/.ssh/
cat /root/.ssh/authorized_keys2 >> /home/ansible/.ssh/authorized_keys
chown -R ansible /home/ansible/.ssh/
chmod -R go-rwx /home/ansible/.ssh/
