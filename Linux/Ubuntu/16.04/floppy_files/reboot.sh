#!/bin/sh -x

echo "====> Shutting down the SSHD service and rebooting..."
systemctl stop sshd.service
nohup shutdown -r now < /dev/null > /dev/null 2>&1 &
exit 0