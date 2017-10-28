#!/bin/sh -x

#Define the user name to be used
OS_USERNAME=${OS_USERNAME:-vagrant}

#Install Zip/Unzip
echo "Install Zip/Unzip"
sudo apt-get update && sudo apt-get install -y zip unzip

#Install Htop
echo "Install Htop"
sudo apt-get update && sudo apt install htop

#Install Nano
echo "Install Nano"
sudo apt-get update && sudo apt-get install -y nano

#set up 2nd network card
echo "Enable 2nd network card for brdiged connections"
printf "\nauto enp0s8\niface enp0s8 inet dhcp" >> /etc/network/interfaces

#final updates
echo "final update and upgrade in install-software"
sudo apt update && sudo apt upgrade -y