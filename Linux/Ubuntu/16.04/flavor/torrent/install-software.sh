#!/bin/sh -x

#Define the user name to be used
OS_USERNAME=${OS_USERNAME:-vagrant}

#Uninstall bloat from desktop install
echo "**********Uninstall Software bloat**********"

#Unisntall Thunderbird
sudo apt-get purge -y --auto-remove thunderbird

#Some photo thing
sudo apt-get purge -y --auto-remove cheese

#The offie suite
sudo apt-get purge -y --auto-remove libreoffice*

#The regular packaged web browser
sudo apt-get purge -y --auto-remove webbrowser-app

#Some photo manager
sudo apt-get purge -y --auto-remove shotwell

#Uninstall games
sudo apt-get purge -y --auto-remove aisleriot gnome-sudoku mahjongg ace-of-penguins gnomine gbrainy

#The music player
sudo apt-get purge -y --auto-remove rhythmbox

#The packaged video player that comes with gnome
sudo apt-get purge -y --auto-remove totem totem-plugins

#Some tablet softwares
sudo apt-get purge -y --auto-remove xserver-xorg-input-wacom wacom-tools

#removes xdiagnoese
sudo apt-get purge -y --auto-remove xdiagnose

#removes simple scan
sudo apt-get purge -y --auto-remove simple-scan

#get rid of the stupid overlay scroll bar
sudo apt-get purge -y --auto-remove overlay-scrollbar

#xterm
#sudo apt-get purge -y --auto-remove xterm

#transmission
sudo apt-get purge -y --auto-remove transmission-gtk

#telnet since why would we need that?
sudo apt-get purge -y --auto-remove telnet

#ubuntu software center
sudo apt-get purge -y --auto-remove ubuntu-software

#weather
sudo apt-get purge -y --auto-remove libgweather*
#baobab
#sudo apt-get purge -y --auto-remove baobab

#sudo apt-get remove imagemagick

sudo apt-get clean
sudo apt-get autoremove

#Install the termainl
echo "Fixing terminal issues"
sed -i 's,LANG="en_US",LANG="en_US.UTF-8",g' /etc/default/locale
sed -i 's,LANGUAGE="en_US:",LANGUAGE="en_US",g' /etc/default/locale

#Install Htop
echo "Install Htop"
sudo apt-get update && sudo apt install htop

#Install Nano
echo "Install Nano"
sudo apt-get update && sudo apt-get install -y nano

#Install Utorrent
echo "Install Utorrent"
sudo wget -O /tmp/utorrent.tar.gz http://download-hr.utorrent.com/track/beta/endpoint/utserver/os/linux-x64-debian-7-0
sudo mkdir /tmp/utorrent
sudo mkdir /usr/share/utorrent
tar xfz /tmp/utorrent.tar.gz -C /tmp/utorrent
mv /tmp/utorrent/utorrent*/* /usr/share/utorrent
sudo chmod -R ugo+wrx /usr/share/utorrent
sudo wget -O /usr/share/utorrent/utorrent.ico http://www.iconarchive.com/download/i75245/cornmanthe3rd/metronome/Media-utorrent.ico
#printf '[Desktop Entry]\n Version=1.0\n Type=Application\n Name=Utorrent\n Icon=/usr/share/utorrent/utorrent.ico\n Exec="/usr/share/utorrent/."\n Comment=downloads!\n Catagories=Torrent;\n Terminal=true' > '/usr/share/applications/utorrent.desktop'

#Install ExpressVPN
echo "Install ExpressVPN"
sudo wget -O /tmp/vpn.deb https://download.expressvpn.xyz/clients/linux/expressvpn_1.3.2_amd64.deb
sudo dpkg -i /tmp/vpn.deb

#final updates
echo "final update and upgrade in install-software"
sudo apt update && sudo apt upgrade -y

#Install Firewall
echo "Install Firewall"
sudo apt-get install -y ufw 
echo "Open ssh firewall"
sudo ufw allow ssh
sudo ufw allow 8080/tcp
echo "y" | sudo ufw enable

echo "Setting Launcher Icons"
#dbus-launch gsettings set com.canonical.Unity.Launcher favorites "['application://ubiquity.desktop', 'application://org.gnome.Nautilus.desktop' ,'application://firefox.desktop']"

dbus-launch gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-minimize-window true
#always show the window menu
dbus-launch gsettings set com.canonical.Unity always-show-menus true

#attach the menu to the window
dbus-launch gsettings set com.canonical.Unity integrated-menus true

#remove sound from task bar
dbus-launch gsettings set com.canonical.indicator.sound visible false

#change and set time stuff
dbus-launch gsettings set com.canonical.indicator.datetime show-day true
dbus-launch gsettings set com.canonical.indicator.datetime time-format "24-hour"
sudo timedatectl set-timezone America/Los_Angeles

#always show the location in the file systme
dbus-launch gsettings set org.gnome.nautilus.preferences always-use-location-entry true 

#enable recursive searching
dbus-launch gsettings set org.gnome.nautilus.preferences enable-interactive-search false

#disable guest login
sudo sh -c 'printf "[Seat:*]\nallow-guest=false\n" >/etc/lightdm/lightdm.conf.d/50-no-guest.conf'

