#!/bin/sh -x
#Intsalls the virtual box guest additions
#must be uploaded 

echo "Installing VirtualBox Guest Additions"

# Install the VirtualBox guest additions
OS_USER=${OS_USERNAME:-vagrant}
VBOX_VERSION=$(cat /home/${OS_USER}/.vbox_version)
VBOX_ISO=VBoxGuestAdditions.iso

echo "Mounting vbox.iso"
mount -o loop $VBOX_ISO /mnt

echo "Running VboxLinuxAdditions.run"
yes|sh /mnt/VBoxLinuxAdditions.run --nox11

echo "Unmounting .iso"
umount /mnt

#Cleanup VirtualBox
echo "Cleaning up installation"
rm $VBOX_ISO