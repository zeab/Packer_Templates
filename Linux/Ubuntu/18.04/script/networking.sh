#!/bin/bash -eu

#set up 2nd network card
echo "Enable 2nd network card for bridged connections"
printf "\nauto enp0s8\niface enp0s8 inet static\naddress 192.168.56.5\nnetwork 192.168.56.0\nnetmask 255.255.255.0\ngateway 192.168.56.1\ndns-nameservers 8.8.8.8 192.168.56.1" >> /etc/network/interfaces
