#!/bin/sh

apt-get install -y sudo

echo 'Defaults env_reset' >> /etc/sudoers
echo 'Defaults secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"' >> /etc/sudoers

adduser ansible --shell /bin/bash --disabled-password --gecos ""

mkdir -p /home/ansible/.ssh/
cat /root/.ssh/authorized_keys2 >> /home/ansible/.ssh/authorized_keys
chown -R ansible /home/ansible/.ssh/
chmod -R go-rwx /home/ansible/.ssh/
echo 'ansible ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
