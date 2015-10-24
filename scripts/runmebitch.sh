#!/bin/bash

if [ -f /.hari ];
then
  echo "already deployed, modafuca"
  exit 1
fi

touch /.hari

echo "== installing centos 5 base, bitch =="

/usr/local/src/docker-deploy/basecentos5.sh

echo "== installing qmail stage 1 part 1, bitch =="

/usr/local/src/docker-deploy/qmail_s01p01.sh
