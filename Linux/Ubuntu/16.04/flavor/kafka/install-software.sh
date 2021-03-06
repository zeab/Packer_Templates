#!/bin/sh -x

#Define the user name to be used
OS_USERNAME=${OS_USERNAME:-vagrant}

#REMOVE SOFTWARE
#telnet since why would we need that?
echo "remove software"
sudo apt-get purge -y --auto-remove telnet

sudo apt-get clean
sudo apt-get autoremove

#Install Zip/Unzip
echo "Install Zip/Unzip"
sudo apt-get update && sudo apt-get install -y zip unzip

#Install Curl
echo "Install Curl"
sudo apt-get update && sudo apt-get install -y curl

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


#Pull the spotify image
sudo docker pull spotify/kafka

#Grab the autostart and service files
wget -O /tmp/floppy_files.zip https://github.com/zeab/Packer_Floppy_Files/archive/master.zip
unzip /tmp/floppy_files.zip -d /tmp/floppy_files/
sudo mv /tmp/floppy_files/Packer_Floppy_Files-master/kafka/auto-start-kafka.sh /home/vagrant/auto-start-kafka.sh
chmod +x /home/vagrant/auto-start-kafka.sh
sudo mv /tmp/floppy_files/Packer_Floppy_Files-master/kafka/kafka.service /etc/systemd/system/kafka.service
sudo chmod 664 /etc/systemd/system/kafka.service
sudo systemctl enable kafka.service


#set up 2nd network card
echo "Enable 2nd network card for brdiged connections"
printf "\nauto enp0s8\niface enp0s8 inet dhcp" >> /etc/network/interfaces

#final updates
echo "final update and upgrade in install-software"
sudo apt update && sudo apt upgrade -y

