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
apt-get install -y ubuntu-desktop

USERNAME=${OS_USERNAME}
LIGHTDM_CONFIG=/etc/lightdm/lightdm.conf
GDM_CUSTOM_CONFIG=/etc/gdm/custom.conf

mkdir -p $(dirname ${GDM_CUSTOM_CONFIG})
echo "[daemon]" >> $GDM_CUSTOM_CONFIG
echo "# Enabling automatic login" >> $GDM_CUSTOM_CONFIG
echo "AutomaticLoginEnable=True" >> $GDM_CUSTOM_CONFIG
echo "AutomaticLoginEnable=${USERNAME}" >> $GDM_CUSTOM_CONFIG

echo "==> Configuring lightdm autologin"
echo "[SeatDefaults]" >> $LIGHTDM_CONFIG
echo "autologin-user=${USERNAME}" >> $LIGHTDM_CONFIG




#Move the min,max and close icons for each window to the right like windows
#gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'

#sudo apt-get install gnome-tweak-tool

#sudo apt-get install gnome-shell