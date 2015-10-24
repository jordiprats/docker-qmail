#!/bin/bash

echo "exclude=*.i386 *.i586 *.i686" >> /etc/yum.conf

for i in $(rpm -qa | grep -v glibc); do rpm --nodeps -e $i.{i386,i586,i686}; done

yum install gcc gcc-c++ make wget curl libtermcap-devel -y;

#eliminant merda
rpm -e hal NetworkManager pm-utils kudzu NetworkManager-glib system-config-network-tui apmd firstboot-tui
rpm -e gpm vim-enhanced gpm-devel
rpm -e at redhat-lsb
rpm -e avahi avahi-compat-libdns_sd cups avahi-glib gnome-vfs2 libgnome libbonoboui gnome-mount libgnomeui xulrunner gnome-python2-gnomevfs xulrunner-devel  gnome-python2-bonobo gnome-python2 gnome-python2-gconf dogtail
rpm -e pcsc-lite ccid ifd-egate coolkey coolkey-devel
rpm -e nfs-utils-lib nfs-utils portmap autofs ypbind yp-tools
rpm -e dbus-glib dbus-python dbus dbus-libs notification-daemon libnotify bluez-gnome yum-updatesd bluez-utils oddjob oddjob-libs wpa_supplicant dbus-devel hal NetworkManager NetworkManager-glib pm-utils kudzu system-config-network-tui firstboot-tui
rpm -e audit amtu
rpm -e acpid
rpm -e policycoreutils selinux-policy setools selinux-policy-targeted  xorg-x11-xfs chkfontpath xorg-x11-fonts-base xorg-x11-server-Xvfb

rpm -Uvh http://mirror.uv.es/mirror/fedora-epel/5/x86_64/epel-release-5-4.noarch.rpm

yum install pwgen -y
yum clean all
yum update -y
yum install ntp -y
yum install screen -y
yum install sysstat -y
yum install strace -y
yum install rpm-build -y
sed 's/^LANG=.*$/LANG="en_US.UTF-8"/' -i /etc/sysconfig/i18n

cat >> /etc/profile <<EOF

export HISTFILESIZE=500000000
export HISTSIZE=500000000
export HISTTIMEFORMAT='%d%m%y %H%M%S -> '
export HISTCONTROL='ignoredups'
EOF
