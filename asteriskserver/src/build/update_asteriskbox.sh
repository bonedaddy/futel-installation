#!/usr/bin/env bash
# install asterisk source and config

set -x # print commands as executed

conf_version=$1

# this adds ASTARGS="-U asterisk"
#sudo -u asterisk cp /vagrant/src/safe_asterisk /opt/asterisk/sbin
cp /vagrant/src/safe_asterisk /opt/asterisk/sbin

# copy asterisk conf into the asterisk tree
rm -rf /opt/asterisk/etc/asterisk
#sudo -u asterisk cp -r /vagrant/src/etc-asterisk /opt/asterisk/etc/asterisk
cp -r /vagrant/src/etc-asterisk /opt/asterisk/etc/asterisk

# copy asterisk scripts into the asterisk tree
rm -rf /opt/asterisk/var/lib/asterisk/agi-bin
#sudo -u asterisk cp -r /vagrant/src/var-lib-asterisk-agi-bin /opt/asterisk/var/lib/asterisk/agi-bin
cp -r /vagrant/src/var-lib-asterisk-agi-bin /opt/asterisk/var/lib/asterisk/agi-bin

# copy asterisk sounds into the asterisk tree
rm -rf /opt/asterisk/var/lib/asterisk/sounds/futel
#sudo -u asterisk cp -r /vagrant/src/var-lib-asterisk-sounds-futel /opt/asterisk/var/lib/asterisk/sounds/futel
cp -r /vagrant/src/var-lib-asterisk-sounds-futel /opt/asterisk/var/lib/asterisk/sounds/futel

# write the config files that are local or have secrets
# maybe secrets should refer to an /opt/futel/etc conf file for easier setup
# move customized config files into build conf location
cp /vagrant/conf/sip_callcentric.conf.$conf_version /vagrant/conf/sip_callcentric.conf

cp /vagrant/conf/sip_callcentric.conf /opt/asterisk/etc/asterisk/sip_callcentric.conf
cp /vagrant/conf/sip_secret.conf /opt/asterisk/etc/asterisk/sip_secret.conf
cp /vagrant/conf/extensions_secret.conf /opt/asterisk/etc/asterisk/extensions_secret.conf
cp /vagrant/conf/blocklist.yaml /opt/asterisk/etc/asterisk/blocklist.yaml

# fix up issues due to our janky install locallly as root deployment
chown -R asterisk:asterisk /opt/asterisk
# are these necessary?
chmod -R a+r /opt/asterisk
chmod -R a+x /opt/asterisk
