#!/bin/bash

for repo in $(cat ./ec2-deploy.txt)

do
  if [ -d $repo ]; then
    echo Ec2 deploy: $repo
    echo ---------------------

    cd $repo

    for BRANCH in `git branch --list|sed 's/\*//g'`;
      do
        git checkout $BRANCH
        sh ./ec2.sh deploy
      done

    git checkout dev

    cd ../
  fi
done
