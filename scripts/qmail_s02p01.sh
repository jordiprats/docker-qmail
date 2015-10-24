#!/bin/bash

grep "$(basename $0)" /.hari

if [ $? -eq 0 ];
then
  echo "i already did that, bitch"
  exit 1
fi

echo $(basename $0) >> /.hari

groupadd -g 89 vchkpw
useradd -g vchkpw -u 89 -d /home/vpopmail vpopmail
cd /usr/local/src
tar xzf vpopmail-5.4.32.tar.gz
cd vpopmail-5.4.32
