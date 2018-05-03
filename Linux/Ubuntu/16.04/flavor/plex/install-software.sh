#!/bin/sh -x

#Define the user name to be used
OS_USERNAME=${OS_USERNAME:-vagrant}

#REMOVE SOFTWARE
#telnet since why would we need that?
sudo apt-get purge -y --auto-remove telnet

sudo apt-get clean
sudo apt-get autoremove

#Install Htop
echo "Install Htop"
sudo apt-get update && sudo apt install htop

#Install Nano
echo "Install Nano"
sudo apt-get update && sudo apt-get install -y nano

#Install Plex
echo "Install Plex"
wget -O /tmp/plex.deb https://downloads.plex.tv/plex-media-server/1.12.1.4885-1046ba85f/plexmediaserver_1.12.1.4885-1046ba85f_amd64.deb
sudo dpkg -i /tmp/plex.deb

#set up 2nd network card
echo "Enable 2nd network card"
printf "\nauto enp0s8\niface enp0s8 inet dhcp" >> /etc/network/interfaces

#final updates
echo "final update and upgrade in install-software"
sudo apt update && sudo apt upgrade -y

#Install Firewall
echo "Install Firewall"
sudo apt-get install -y ufw 
echo "Open ssh firewall"
sudo ufw allow ssh
sudo ufw allow 32400/tcp
sudo ufw allow 1900/udp
sudo ufw allow 3005/tcp
sudo ufw allow 5353/udp
sudo ufw allow 8324/tcp
sudo ufw allow 32410/udp
sudo ufw allow 32412:32414/udp
sudo ufw allow 32469 /tcp
echo "y" | sudo ufw enable
