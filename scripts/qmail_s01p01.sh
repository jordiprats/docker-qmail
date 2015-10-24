#!/bin/bash

grep "$(basename $0)" /.hari

if [ $? -eq 0 ];
then
  echo "i already did that, bitch"
  exit 1
fi

echo $(basename $0) >> /.hari

yum install groff -y

umask 022
mkdir -p /usr/local/src
cd /usr/local/src
wget http://www.qmail.org/netqmail-1.06.tar.gz
wget http://cr.yp.to/ucspi-tcp/ucspi-tcp-0.88.tar.gz
mkdir -p /package
cd /package
wget http://cr.yp.to/daemontools/daemontools-0.76.tar.gz
chmod 1755 /package
cd /usr/local/src
tar xzf netqmail-1.06.tar.gz
tar xzf ucspi-tcp-0.88.tar.gz
cd /package
tar xzf daemontools-0.76.tar.gz


mkdir /var/qmail


cd /usr/local/src/netqmail-1.06
export TMP=$(mktemp /tmp/lol.XXXXXXXXXXXXXXXXXXXXXXXXXXXXX)
echo '#!/bin/bash' >$TMP
cat /usr/local/src/netqmail-1.06/INSTALL.ids | grep -i Linux -A 11 | grep "#" | sed 's/$/;/ig' | sed 's/#//ig' >>$TMP
bash $TMP
rm $TMP
unset TMP
sed -i 's#::/var/qmail/alias:/bin/bash#::/var/qmail/alias:/bin/true#' /etc/passwd
sed -i 's#::/var/qmail:/bin/bash#::/var/qmail:/bin/true#' /etc/passwd


cd /package/admin/daemontools-0.76/src
patch < /usr/local/src/netqmail-1.06/other-patches/daemontools-0.76.errno.patch
cd ..
package/install


cd /usr/local/src/netqmail-1.06
make setup check


./config-fast $REVERSE_NAME
