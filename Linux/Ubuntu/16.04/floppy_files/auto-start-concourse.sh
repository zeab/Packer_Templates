#!/bin/sh
ip route get 8.8.8.8 | awk '{print $NF; exit}'
external_ip=$?
export CONCOURSE_EXTERNAL_URL=http://$external_ip:8080
sudo docker-compose -f /home/vagrant/docker-compose.yml up

