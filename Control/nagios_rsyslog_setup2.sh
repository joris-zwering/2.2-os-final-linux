#!/bin/bash

for svc in Apache ssh
do
sudo ufw allow $svc
done

sudo ufw allow 514/tcp
sudo ufw allow 514/udp
sudo ufw enable -y
sudo ufw reload
sudo ufw status numbered

sudo apt install -y monitoring-plugins nagios-nrpe-plugin
cd /usr/local/nagios/etc
sudo mkdir -p /usr/local/nagios/etc/servers
sudo rm /usr/local/nagios/etc/nagios.cfg
sudo rm /usr/local/nagios/etc/resource.cfg
sudo rm /usr/local/nagios/etc/objects/commands.cfg
sudo rm /usr/local/nagios/etc/objects/contacts.cfg
sudo mv /home/azureuser/2.2-os-final-linux/nagios.cfg /usr/local/nagios/etc/nagios.cfg
sudo mv /home/azureuser/2.2-os-final-linux/resource.cfg /usr/local/nagios/etc/resource.cfg
sudo mv /home/azureuser/2.2-os-final-linux/commands.cfg /usr/local/nagios/etc/objects/commands.cfg
sudo mv /home/azureuser/2.2-os-final-linux/contacts.cfg /usr/local/nagios/etc/objects/contacts.cfg
sudo mv /home/azureuser/2.2-os-final-linux/dockernode.cfg /usr/local/nagios/etc/servers/dockernode.cfg
sudo mv /home/azureuser/2.2-os-final-linux/wordpressnode.cfg /usr/local/nagios/etc/servers/wordpressnode.cfg
sudo systemctl start nagios
sudo systemctl enable nagios
sudo systemctl restart apache2
sudo systemctl restart nagios