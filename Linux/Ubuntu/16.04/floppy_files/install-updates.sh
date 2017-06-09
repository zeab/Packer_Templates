#!/bin/sh -x
#If udates is turned off we just exit out of this script
if [[ ! "$INSTALL_UPDATES" =~ ^(true|yes|on|1|TRUE|YES|ON])$ ]]; then
  echo "SKIPPING...INSTALL UPDATES is turned off"
  sleep 5
  exit
fi

#disable auto update
echo "Disabling Autoupdate"
sed -i 's,APT::Periodic::Update-Package-Lists "1";,APT::Periodic::Update-Package-Lists "0";,g' /etc/apt/apt.conf.d/10periodic

# Disable the release upgrader
echo "==> Disabling the release upgrader"
sed -i.bak 's/^Prompt=.*$/Prompt=never/' /etc/update-manager/release-upgrades

echo "==> Checking version of Ubuntu"
. /etc/lsb-release


systemctl disable apt-daily.service # disable run when system boot
systemctl disable apt-daily.timer   # disable timer run
  
echo "==> Updating list of repositories"
# apt-get update does not actually perform updates, it just downloads and indexes the list of packages
apt-get -y update


#preform the updates
echo "==> Performing dist-upgrade (all packages and kernel)"
apt-get -y dist-upgrade --force-yes

