#!/bin/bash

# Make sure only root can run this script
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root (sudo)" 1>&2
    exit 1
fi

if [[ $# -eq 0 ]] ; then
  echo Enter a domain name
  exit
fi

domain=$1

sudo certbot certonly -d *.${domain} -d ${domain} --manual --server https://acme-v02.api.letsencrypt.org/directory --preferred-challenges dns
