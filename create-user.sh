#!/bin/bash

# Make sure only root can run this script
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root (sudo)" 1>&2
    exit 1
fi

if [[ $# -eq 0 ]] ; then
  echo Enter a user name
  exit
fi

username=$1
password=$(openssl rand -base64 16 | tr -d "=+/" | cut -c1-12)

useradd $username --create-home
echo "$username:$password" | chpasswd
usermod -a -G root $username
#chsh -s /bin/bash $username
mkdir /home/$username/.ssh
touch /home/$username/.ssh/authorized_keys
touch /home/$username/.hushlogin
chown -R $username:$username /home/$username/.ssh
chmod 700 /home/$username/.ssh
chmod 600 /home/$username/.ssh/authorized_keys

echo ***SSH***
echo username: $username
echo password: $password
