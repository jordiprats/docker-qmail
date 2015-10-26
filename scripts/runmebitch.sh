#!/bin/bash

#echo "== installing centos 5 base, bitch =="
#/bin/bash /usr/local/src/docker-deploy/basecentos5.sh

echo "== installing qmail (netqmail) stage 1 part 1, bitch =="
/bin/bash /usr/local/src/docker-deploy/qmail_s01p01.sh

echo "== installing qmail (vpopmail) stage 2 part 1, bitch =="
/bin/bash /usr/local/src/docker-deploy/qmail_s02p01.sh

echo "== installing mysql stage 1 part 1, bitch =="

#setup MySQL


# a veure com ho fem per les daemontools i l'arranc
