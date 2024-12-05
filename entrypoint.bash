#!/bin/bash
su -

# create user
useradd -F -m -s /bin/bash ansible
usermod -aG  sudo ansible
# don't require password for sudo
echo 'ansible ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

su ansible

# install ssh server
apt-get update
apt-get install -y openssh-server
systemctl start sshd

# create .ssh dir if not exists
mkdir -p /home/ansible/.ssh
chmod 700 /home/ansible/.ssh

# create authorized_keys file if not exists
touch /home/ansible/.ssh/authorized_keys
chmod 700 /home/ansible/.ssh/authorized_keys

# add ssh key
read -s -p "SSH public key: " ssh_public_key
echo "$ssh_public_key" >> /home/ansible/.ssh/authorized_keys

# disable root login
sed -i 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config

# disable password login
sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config

# restart sshd
systemctl restart sshd