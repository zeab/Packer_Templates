
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

#set up 2nd network card
printf "\nauto enp0s8\niface enp0s8 inet dhcp" >> /etc/network/interfaces


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


##INSTALL JAVA8 from an install file rather than have the code here
#sh /media/floppy0/install-java8.sh
#########
echo "Installing Java 8"
apt-get update
apt-get install -y  software-properties-common
add-apt-repository ppa:webupd8team/java -y
apt-get update
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
apt-get install -y oracle-java8-installer
#########


#Pull the jFrog OSS image
sudo docker pull docker.bintray.io/jfrog/artifactory-oss:latest
sudo docker run --name artifactory -d -p 8081:8081 docker.bintray.io/jfrog/artifactory-oss:latest

mv -v /tmp/artifactory.service /etc/systemd/system/artifactory.service
sudo chmod 664 /etc/systemd/system/artifactory.service

sudo systemctl enable artifactory.service


#final updates
sudo apt update && sudo apt upgrade -y