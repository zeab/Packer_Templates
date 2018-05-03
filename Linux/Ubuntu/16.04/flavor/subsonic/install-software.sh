#!/bin/sh -x

#Define the user name to be used
OS_USERNAME=${OS_USERNAME:-vagrant}
SUBSONICVERSION=${SUBSONICVERSION:-6.1.3}

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

echo "**********Install OpenJDK 8**********"
sudo apt-get update && sudo apt-get install -y openjdk-8-jdk

#Install Subsonic
echo "Install Subsonic"
#sudo apt-get install -y cifs-utils
wget -O /tmp/subsonic.deb https://s3-eu-west-1.amazonaws.com/subsonic-public/download/subsonic-${SUBSONICVERSION}.deb
sudo dpkg -i /tmp/subsonic.deb

#set up 2nd network card
printf "\nauto enp0s8\niface enp0s8 inet dhcp" >> /etc/network/interfaces

#final updates
echo "final update and upgrade in install-software"
sudo apt update && sudo apt upgrade -y

#Install Firewall
echo "Install Firewall"
sudo apt-get install -y ufw 
echo "Open ssh firewall"
sudo ufw allow ssh
sudo ufw allow 4040/tcp
echo "y" | sudo ufw enable