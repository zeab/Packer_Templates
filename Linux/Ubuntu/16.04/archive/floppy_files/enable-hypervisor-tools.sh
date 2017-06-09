#!/bin/bash -eux

#Grabs the OS name as part of the path to look for the VS
OS_USER=${OS_USERNAME:-vagrant}

#VirtualBox Guest Additios
if [[ $PACKER_BUILDER_TYPE =~ virtualbox ]]; then
	VBOX_VERSION=$(cat /home/${OS_USER}/.vbox_version)
	mount -o loop /home/${OS_USER}/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
	sh /mnt/VBoxLinuxAdditions.run
	umount /mnt
	rm /home/${OS_USER}/VBoxGuestAdditions_$VBOX_VERSION.iso
	rm /home/${OS_USER}/.vbox_version
fi


#if [[ $PACKER_BUILDER_TYPE =~ virtualbox ]]; then
#    echo "==> Installing VirtualBox guest additions"
    # Assuming the following packages are installed
    # apt-get install -y linux-headers-$(uname -r) build-essential perl
    # apt-get install -y dkms

 #   VBOX_VERSION=$(cat /home/${SSH_USER}/.vbox_version)
 #   mount -o loop /home/${SSH_USER}/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
 #   sh /mnt/VBoxLinuxAdditions.run
 #   umount /mnt
 #   rm /home/${SSH_USER}/VBoxGuestAdditions_$VBOX_VERSION.iso
 #   rm /home/${SSH_USER}/.vbox_version

  #  if [[ $VBOX_VERSION = "4.3.10" ]]; then
  #      ln -s /opt/VBoxGuestAdditions-4.3.10/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions
  #  fi
#fi
