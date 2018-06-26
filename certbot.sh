#!/bin/bash

if [[ $# -eq 0 ]] ; then
  echo Enter a domain name
  exit
fi

domain=$1

sudo certbot certonly -d *.${domain} -d ${domain} --manual --server https://acme-v02.api.letsencrypt.org/directory --preferred-challenges dns
