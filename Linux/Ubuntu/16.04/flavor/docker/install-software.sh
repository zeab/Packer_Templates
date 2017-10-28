#!/bin/sh -x

#Define the user name to be used
OS_USERNAME=${OS_USERNAME:-vagrant}

#REMOVE SOFTWARE
#telnet since why would we need that?
echo "remove software"
sudo apt-get purge -y --auto-remove telnet

sudo apt-get clean
sudo apt-get autoremove

#Install Htop
echo "Install Htop"
sudo apt-get update && sudo apt install htop

#Install Nano
echo "Install Nano"
sudo apt-get update && sudo apt-get install -y nano

#Installing Docker
sudo apt-get update
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update && sudo apt-get install -y docker-ce
#Start and autostart the docker service
sudo systemctl start docker
sudo systemctl enable docker
#Set docker as part of the user group   
sudo usermod -aG docker ${OS_USERNAME}

#set up 2nd network card
echo "Enable 2nd network card for brdiged connections"
printf "\nauto enp0s8\niface enp0s8 inet dhcp" >> /etc/network/interfaces

#final updates
echo "final update and upgrade in install-software"
sudo apt update && sudo apt upgrade -y