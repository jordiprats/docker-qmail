#!/bin/bash

mkdir -p /usr/local/src
cd /usr/local/src

mkdir -p /package
cd /package
wget http://cr.yp.to/daemontools/daemontools-0.76.tar.gz
chmod 1755 /package

cd /package
tar xzf daemontools-0.76.tar.gz

cd /usr/local/src
tar xzf netqmail-1.06.tar.gz

cd /package/admin/daemontools-0.76/src
patch < /usr/local/src/netqmail-1.06/other-patches/daemontools-0.76.errno.patch
cd ..
package/install
