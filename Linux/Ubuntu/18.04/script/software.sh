#!/bin/bash -eu

SSH_USERNAME=${SSH_USERNAME:-vagrant}
INSTALL_SOFTWARE=${INSTALL_SOFTWARE:-base}

#Base Install
if [ $INSTALL_SOFTWARE == 'base' ] || [ $INSTALL_SOFTWARE == 'whiskey' ]
then
	#Update
	apt-get update
	#Bash Completion
	apt -y install bash-completion
	#OpenJDK-8
	apt-get update && apt-get install -y openjdk-8-jdk
	#Zip/Unzip
	apt -y install zip unzip
	#Snapd
	apt install -y snapd
	#Nano
	snap install nano
	#Htop
	snap install htop
	#Jq
	snap install jq
	#KubeCtl
	snap install kubectl --classic
	#Go-lang
	snap install go --classic
	#Docker
	apt-get update && apt-get install -y docker.io
	#Set docker as part of the user group   
	usermod -aG docker ${SSH_USERNAME}
	#Start and autostart the docker service
	systemctl start docker
	systemctl enable docker
	#Sbt
	echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
	curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | apt-key add
	apt-get update && apt-get install -y sbt
fi

#Just Whiskey Stuff
if [ $INSTALL_SOFTWARE == 'whiskey' ]
then
	echo "TBD"
	#snap install gnome-terminator --beta

	#snap install firefox

	#Intellij
	#snap install intellij-idea-community --classic --edge

	#Chrome
	#wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
	#sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
	#apt-get update && apt-get install -y google-chrome-stable

	#VS Code
	#snap install code --classic
fi

exit 0