#!/bin/sh -x

if [[ ! "$INSTALL_DESKTOP" =~ ^(true|yes|on|1|TRUE|YES|ON])$ ]]; then
  echo "Skipping Desktop Installation"
  sleep 5
  exit
fi
	
echo "==> Installing ubuntu-desktop"
apt-get install -y ubuntu-desktop

apt-get update

OS_USERNAME=${OS_USERNAME:-vagrant}

LIGHTDM_CONFIG=/etc/lightdm/lightdm.conf
GDM_CUSTOM_CONFIG=/etc/gdm/custom.conf

mkdir -p $(dirname ${GDM_CUSTOM_CONFIG})
echo "[daemon]" >> $GDM_CUSTOM_CONFIG
echo "# Enabling automatic login" >> $GDM_CUSTOM_CONFIG
echo "AutomaticLoginEnable=True" >> $GDM_CUSTOM_CONFIG
echo "AutomaticLoginEnable=${OS_USERNAME}" >> $GDM_CUSTOM_CONFIG

echo "==> Configuring lightdm autologin"
echo "[SeatDefaults]" >> $LIGHTDM_CONFIG
echo "autologin-user=${OS_USERNAME}" >> $LIGHTDM_CONFIG










