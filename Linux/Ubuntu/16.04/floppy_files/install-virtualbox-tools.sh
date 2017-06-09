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
yes|sh /mnt/VBoxLinuxAdditions.run

echo "Unmounting .iso"
umount /mnt

#Cleanup VirtualBox
echo "Cleaning up installation"
rm $VBOX_ISO
#rm $VBOX_VERSION




################
# Install the VirtualBox guest additions
#OS_USER=${OS_USERNAME:-vagrant}
#VBOX_VERSION=$(cat /home/${OS_USER}/.vbox_version)
#VBOX_ISO=VBoxGuestAdditions_$VBOX_VERSION.iso

#echo "Mounting vbox.iso"
#mount -o loop $VBOX_ISO /mnt

#echo "Running VboxLinuxAdditions.run"
#yes|sh /mnt/VBoxLinuxAdditions.run

#echo "Unmounting .iso"
#umount /mnt

#Cleanup VirtualBox
#echo "Cleaning up installation"
#rm $VBOX_ISO
#rm /home/${OS_USER}/.vbox_version
#################


#echo "Mounting VBoxGuestAdditions.iso"
#mount -o loop /home/${OS_USER}/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt

#echo "Running VBoxLinuxAdditions.run"
#sh /mnt/VBoxLinuxAdditions.run

#echo "Removing the .iso and additional files from home"
#umount /mnt
#rm /home/${OS_USER}/VBoxGuestAdditions_$VBOX_VERSION.iso
#rm /home/${OS_USER}/.vbox_version








##Notes and ScratchPad

#sudo sh /media/${OS_USER}/VBOXADDITIONS_5.1.18_114002/VBoxLinuxAdditions.run



#VBOX_VERSION=$(cat /home/${OS_USER}/.vbox_version)


#umount /mnt
#rm /home/${OS_USER}/VBoxGuestAdditions_$VBOX_VERSION.iso
#rm /home/${OS_USER}/.vbox_version