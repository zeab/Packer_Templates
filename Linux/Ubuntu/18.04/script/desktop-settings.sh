
INSTALL_DESKTOP=${INSTALL_DESKTOP:-false}

#if [ $INSTALL_DESKTOP ]
#then
#	echo "Installing Desktop"
	#Set the favorites
	#dbus-launch gsettings set org.gnome.shell favorite-apps "['firefox.desktop', 'org.gnome.Nautilus.desktop', 'intellij-idea-community_intellij-idea-community.desktop', 'org.gnome.Terminal.desktop']"
	#Allow text in the folder viewer
	#dbus-launch gsettings set org.gnome.nautilus.preferences always-use-location-entry true 
	#Set Text size so its just a wee bit bigger
	#dbus-launch gsettings set org.gnome.desktop.interface text-scaling-factor 1.6


	#Makes a template document so I can actually right click and make a new doc
	#touch /home/vagrant/Templates/"Untitled Document"
	#touch /home/vagrant/Templates/"Text Document.txt"
	#touch /home/vagrant/Templates/"YAML Document.yaml"
	#touch /home/vagrant/Templates/"JSON Document.json"
	#touch /home/vagrant/Templates/"XML Document.xml"

	#The offie suite
	#apt-get purge -y --auto-remove remmina 
	#apt-get purge -y --auto-remove libreoffice* 
	#apt-get purge -y --auto-remove thunderbird 
	#apt-get purge -y --auto-remove rhythmbox 
	#apt-get purge -y --auto-remove transmission-gtk 
	#apt-get purge -y --auto-remove telnet 
	#apt-get purge -y --auto-remove cheese 
	#apt-get purge -y --auto-remove gnome-mahjongg
	#apt-get purge -y --auto-remove gnome-mines
	#apt-get purge -y --auto-remove gnome-sudoku
	#apt-get remove --auto-remove aisleriot
	#apt purge -y ubuntu-web-launchers
	#apt-get clean
	#apt-get autoremove
#fi
