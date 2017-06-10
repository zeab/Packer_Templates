
#ENABLE 2nd lan card


#REMOVE SOFTWARE
#telnet since why would we need that?
sudo apt-get purge -y --auto-remove telnet

sudo apt-get clean
sudo apt-get autoremove

#Fix Install
#Install the termainl
echo "Fixing terminal issues"
sed -i 's,LANG="en_US",LANG="en_US.UTF-8",g' /etc/default/locale
sed -i 's,LANGUAGE="en_US:",LANGUAGE="en_US",g' /etc/default/locale


#Hardening
#Install Firewall
sudo apt-get install -y ufw 
sudo ufw allow ssh
sudo ufw allow http
#sudo ufw enable -y

	 
#Secure shared memory (need to update the root password first sudo passwd root vagrant vagrant)
sudo echo "# $TFCName Script Entry - Secure Shared Memory - $LogTime" >> /etc/fstab
sudo echo "tmpfs     /dev/shm     tmpfs     defaults,noexec,nosuid     0     0" >> /etc/fstab

#INSTALL SOFTWARE
#Install Httpie
sudo apt-get install -y httpie 
				
#Installing Docker
sudo apt-get install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker

#Install docker compose
sudo apt install -y docker-compose

#Pull the spotify image
sudo docker pull spotify/kafka

#set up 2nd network card
printf "\nauto enp0s8\niface enp0s8 inet dhcp" >> /etc/network/interfaces


#move the auto start shell file
mv -v /tmp/auto-start-kafka.sh /home/vagrant/
chmod +x /home/vagrant/auto-start-kafka.sh


#move the kafka upstart file
mv -v /tmp/kafka.service /etc/systemd/system/kafka.service
sudo chmod 664 /etc/systemd/system/kafka.service

sudo systemctl enable kafka.service


#sudo docker run --restart=always -d spo
#docker run -p 2181:2181 -p 9092:9092 --env ADVERTISED_HOST=`docker-machine ip \`docker-machine active\`` --env ADVERTISED_PORT=9092 spotify/kafka

#Need to enable docker to auto-start

#final updates
sudo apt update && sudo apt upgrade -y