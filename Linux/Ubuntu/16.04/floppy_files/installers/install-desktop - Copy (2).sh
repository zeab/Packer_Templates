#!/bin/sh -x

if [[ ! "$INSTALL_DESKTOP" =~ ^(true|yes|on|1|TRUE|YES|ON])$ ]]; then
  echo "Skipping Desktop Installation"
  sleep 5
  exit
fi

OS_USERNAME=${OS_USERNAME:-vagrant}

echo "==> Checking version of Ubuntu"
. /etc/lsb-release    
	
echo "==> Installing ubuntu-desktop"
#apt-get install -y ubuntu-desktop


apt-get update

#apt-get install -y gnome-shell
sudo apt-get install -y ubuntu-gnome-desktop
#sudo dpkg-reconfigure lightdm

#apt-get install -y lightdm
#sudo lightdm-set-defaults
#sh -c 'echo "/usr/sbin/lightdm" > /etc/X11/default-display-manager'
#start lightdm

#apt-get install -y ubuntu-gnome-desktop
#

USERNAME=${OS_USERNAME}
LIGHTDM_CONFIG=/etc/lightdm/lightdm.conf
GDM_CUSTOM_CONFIG=/etc/gdm3/custom.conf

mkdir -p $(dirname ${GDM_CUSTOM_CONFIG})
echo "[daemon]" >> $GDM_CUSTOM_CONFIG
echo "# Enabling automatic login" >> $GDM_CUSTOM_CONFIG
echo "AutomaticLoginEnable=True" >> $GDM_CUSTOM_CONFIG
echo "AutomaticLogin=${USERNAME}" >> $GDM_CUSTOM_CONFIG

#echo "==> Configuring lightdm autologin"
#echo "[SeatDefaults]" >> $LIGHTDM_CONFIG
#echo "autologin-user=${USERNAME}" >> $LIGHTDM_CONFIG







