#!/bin/bash

for repo in $(cat ./sync-fork.txt)

do
	echo Syncing fork: $repo
  echo ---------------------

  cd $repo

  for BRANCH in `git branch --list|sed 's/\*//g'`;
    do
      git checkout $BRANCH
      sh ./sync-fork.sh
    done

  git checkout dev

  cd ../

done
