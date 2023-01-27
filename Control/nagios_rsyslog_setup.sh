#!/bin/bash

sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install -y autoconf bc gawk dc build-essential gcc libc6 make wget unzip apache2 php libapache2-mod-php libgd-dev libmcrypt-dev make libssl-dev snmp libnet-snmp-perl gettext rsyslog ansible
cd ~/
sudo wget https://github.com/NagiosEnterprises/nagioscore/archive/nagios-4.4.6.tar.gz
sudo tar -xf nagios-4.4.6.tar.gz
cd nagioscore-*/
sudo ./configure --with-httpd-conf=/etc/apache2/sites-enabled
sudo make all
sudo make install-groups-users
sudo usermod -a -G nagios www-data
sudo make install
sudo make install-daemoninit
sudo make install-commandmode
sudo make install-config
sudo make install-webconf
sudo a2enmod rewrite cgi
sudo systemctl restart apache2
sudo mv /home/azureuser/2.2-os-final-linux/hosts /etc/ansible/hosts