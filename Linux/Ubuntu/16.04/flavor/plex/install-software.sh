#!/bin/sh -x

#Define the user name to be used
OS_USERNAME=${OS_USERNAME:-vagrant}

#REMOVE SOFTWARE
#telnet since why would we need that?
sudo apt-get purge -y --auto-remove telnet

sudo apt-get clean
sudo apt-get autoremove

#Install Firewall
echo "Install Firewall"
sudo apt-get install -y ufw 
echo "Open ssh firewall"
sudo ufw allow ssh
sudo ufw allow 32400/tcp
echo "y" | sudo ufw enable

#Install Htop
echo "Install Htop"
sudo apt-get update && sudo apt install htop

#Install Nano
echo "Install Nano"
sudo apt-get update && sudo apt-get install -y nano

#Install Plex
echo "Install Plex"
#sudo apt-get install -y cifs-utils
wget -O /tmp/plex.deb https://downloads.plex.tv/plex-media-server/1.9.4.4325-1bf240a65/plexmediaserver_1.9.4.4325-1bf240a65_amd64.deb
sudo dpkg -i /tmp/plex.deb

#set up 2nd network card
printf "\nauto enp0s8\niface enp0s8 inet dhcp" >> /etc/network/interfaces

#final updates
echo "final update and upgrade in install-software"
sudo apt update && sudo apt upgrade -y