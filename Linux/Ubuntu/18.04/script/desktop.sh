#!/bin/bash -eu

INSTALL_DESKTOP=${INSTALL_DESKTOP:-no}

if [[ $INSTALL_DESKTOP =~ true || $INSTALL_DESKTOP =~ 1 || $INSTALL_DESKTOP =~ yes ]]; then
    apt-get -y dist-upgrade
	apt update
	#apt -y install ubuntu-desktop 
	apt -y install gnome-session gdm3
fi

exit 0