
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


sudo apt-get install -y cifs-utils
wget -O /tmp/plex.deb https://downloads.plex.tv/plex-media-server/1.8.4.4249-3497d6779/plexmediaserver_1.8.4.4249-3497d6779_amd64.deb
sudo dpkg -i /tmp/plex.deb

mkdir /mnt/sik
mkdir /mnt/sik/d
mkdir /mnt/sik/e
mkdir /mnt/sik/f

echo "//10.0.0.11/D  /mnt/sik/d  cifs  username=administrator,password=BodiTree1,iocharset=utf8,sec=ntlm  0  0" | sudo tee -a /etc/fstab
echo "//10.0.0.11/E  /mnt/sik/e  cifs  username=administrator,password=BodiTree1,iocharset=utf8,sec=ntlm  0  0" | sudo tee -a /etc/fstab
echo "//10.0.0.11/F  /mnt/sik/f  cifs  username=administrator,password=BodiTree1,iocharset=utf8,sec=ntlm  0  0" | sudo tee -a /etc/fstab
