#!/usr/bin/env bash
# bootstrap openvpnbox from centos6_32_baseconfig
# this does system configuration
# with some install steps, ok

set -x

/etc/init.d/iptables stop
/vagrant/src/iptables.sh
service iptables save
service iptables restart

# add crontab with logwatch job
cp -f /vagrant/src/crontab /etc/crontab

rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
yum install -y openvpn
# can't copy files into /etc/openvpn like normal people? Copy a directory.
#/bin/cp -f /vagrant/src/server.conf /etc/openvpn
#/bin/cp -f /vagrant/conf/ca.crt /etc/openpvn
#/bin/cp -f /vagrant/conf/server.crt /etc/openpvn
#/bin/cp -f /vagrant/conf/server.key /etc/openpvn
#/bin/cp -f /vagrant/conf/dh1024.pem /etc/openpvn
cd /vagrant
mkdir openvpn
cp src/server.conf openvpn
cp conf/ca.crt openvpn
cp conf/server.crt openvpn
cp conf/server.key openvpn
cp conf/dh1024.pem openvpn
mv /etc/openvpn /etc/openvpn-
mv openvpn /etc
/bin/cp -f /vagrant/src/sysctl.conf /etc
# apply sysctl settings
sysctl -p
chkconfig openvpn on
