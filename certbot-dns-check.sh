#!/bin/bash

if [[ $# -eq 0 ]] ; then
  echo Enter a domain name
  exit
fi

domain=$1

host -t txt _acme-challenge.${domain}
