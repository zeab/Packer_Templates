#!/bin/sh -x

#Set Env Vars
#########
OS_USERNAME=${OS_USERNAME:-vagrant}
#########

#Begin clean-up phase

#########
echo "**********Uninstall Software bloat**********"

#Unisntall Thunderbird
#sudo apt-get purge -y --auto-remove thunderbird

#Some photo thing
#sudo apt-get purge -y --auto-remove cheese

#The offie suite
#sudo apt-get purge -y --auto-remove libreoffice*

#The regular packaged web browser
#sudo apt-get purge -y --auto-remove webbrowser-app

#Some photo manager
#sudo apt-get purge -y --auto-remove shotwell

#Uninstall games
#sudo apt-get purge -y --auto-remove aisleriot gnome-sudoku mahjongg ace-of-penguins gnomine gbrainy

#The music player
#sudo apt-get purge -y --auto-remove rhythmbox

#The packaged video player that comes with gnome
#sudo apt-get purge -y --auto-remove totem totem-plugins

#Some tablet softwares
#sudo apt-get purge -y --auto-remove xserver-xorg-input-wacom wacom-tools

#removes xdiagnoese
#sudo apt-get purge -y --auto-remove xdiagnose

#removes simple scan
#sudo apt-get purge -y --auto-remove simple-scan

#get rid of the stupid overlay scroll bar
#sudo apt-get purge -y --auto-remove overlay-scrollbar

#xterm
#sudo apt-get purge -y --auto-remove xterm

#transmission
#sudo apt-get purge -y --auto-remove transmission-gtk

#telnet since why would we need that?
#sudo apt-get purge -y --auto-remove telnet

#ubuntu software center
#sudo apt-get purge -y --auto-remove ubuntu-software

#weather
#sudo apt-get purge -y --auto-remove libgweather*

#baobab
#sudo apt-get purge -y --auto-remove baobab

#imagejack
#sudo apt-get remove imagemagick

#final clean up
sudo apt-get clean
sudo apt-get autoremove
#########

#End clean-up phase

#Install the termainl
#########
#echo "Fixing terminal issues"
#sed -i 's,LANG="en_US",LANG="en_US.UTF-8",g' /etc/default/locale
#sed -i 's,LANGUAGE="en_US:",LANGUAGE="en_US",g' /etc/default/locale
#########


#Install Zip/Unzip
#########
echo "**********Install Zip/Unzip**********"
sudo apt-get update && sudo apt-get install -y zip unzip
#########

#Install Curl
#########
echo "**********Install Curl**********"
sudo apt-get update && sudo apt-get install -y curl
#########

#Install Htop
#########
echo "**********Install Htop**********"
sudo apt-get update && sudo apt install htop
#########

#Install Nano
#########
echo "**********Install Nano**********"
sudo apt-get update && sudo apt-get install -y nano
#########

#Install Kafka
#########
echo "**********Install Kafka**********"
#download kafka
#wget -O /tmp/kafka.tar.gz http://www-us.apache.org/dist/kafka/0.11.0.0/kafka_2.12-0.11.0.1.tgz
#unzip from tmp to usr/share
#tar xfz /tmp/kafka.tar.gz -C /usr/share/
#make new kafka dir
#mkdir /usr/share/kafka/
#move the interior unziped folder to new versionless kafka 
#mv /usr/share/kafka*/* /usr/share/kafka
#remove the old folder
#rm -r /usr/share/kafka_2.12-0.11.0.1
#give that folder excution rights
#sudo chmod -R +x /usr/share/kafka/bin
#add to paths
#sudo echo "export PATH=$PATH:/usr/share/kafka/bin" >> /home/vagrant/.profile
#sed -i 's,PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games",PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/share/fly:/usr/share/kafka/bin",g' /etc/environment
#########

#Install Java8
#########
echo "**********Install OpenJDK 8**********"
sudo apt-get update && sudo apt-get install -y openjdk-8-jdk
#########

#Install Golang
#########
#wget -O /tmp/go.tar.gz https://storage.googleapis.com/golang/go1.9.linux-amd64.tar.gz
#tar xfz /tmp/go.tar.gz -C /tmp/
#sudo mv -v /tmp/go/ /home/vagrant/go/
#printf "\nexport PATH=\$PATH:/home/vagrant/go/bin" >> /home/vagrant/.profile
#########

#Installing Docker
#########
echo "**********Install Docker**********"
sudo apt-get update && sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update && sudo apt-get install -y docker-ce
#Set docker as part of the user group   
sudo usermod -aG docker ${OS_USERNAME}
#Start and autostart the docker service
sudo systemctl start docker
sudo systemctl enable docker
#########

#Cassandra
docker run -d --name=cassandra --network=host --restart unless-stopped --log-opt max-size=25m -e DS_LICENSE=accept datastax/dse-server

#Kafka
docker run -d --name=kafka --restart unless-stopped --log-opt max-size=25m -p 2181:2181 -p 9092:9092 --env ADVERTISED_HOST=localhost --env ADVERTISED_PORT=9092 spotify/kafka

#Final update and upgrade
sudo apt update && sudo apt upgrade -y

#set up 2nd network card
echo "Enable 2nd network card for brdiged connections"
printf "\nauto enp0s8\niface enp0s8 inet dhcp" >> /etc/network/interfaces

