#!/bin/bash

for svc in Apache ssh
do
ufw allow $svc
done

ufw allow 514/tcp
ufw allow 514/udp
ufw enable
y
ufw reload
ufw status numbered

apt install monitoring-plugins nagios-nrpe-plugin
cd /usr/local/nagios/etc
mkdir -p /usr/local/nagios/etc/servers