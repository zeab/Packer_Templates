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

#xterm
#sudo apt-get purge -y --auto-remove xterm

#transmission
sudo apt-get purge -y --auto-remove transmission-gtk

#telnet since why would we need that?
sudo apt-get purge -y --auto-remove telnet

#ubuntu software center
sudo apt-get purge -y --auto-remove ubuntu-software

#baobab
#sudo apt-get purge -y --auto-remove baobab

#sudo apt-get remove imagemagick

sudo apt-get clean
sudo apt-get autoremove
