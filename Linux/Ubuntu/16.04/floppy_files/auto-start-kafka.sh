#!/bin/sh
ip route get 8.8.8.8 | awk '{print $NF; exit}'
external_ip=$?
docker run --rm -p 2181:2181 -p 9092:9092 --env ADVERTISED_HOST=$external_ip  --env ADVERTISED_PORT=9092 spotify/kafka
