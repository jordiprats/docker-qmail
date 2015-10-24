#!/bin/bash

groupadd -g 89 vchkpw
useradd -g vchkpw -u 89 -d /home/vpopmail vpopmail
cd /usr/local/src
tar xzf vpopmail-5.4.32.tar.gz
cd vpopmail-5.4.32
