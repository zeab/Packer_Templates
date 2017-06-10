#!/bin/sh
#run the docker image and set restart to always so that it always boots (you can access it on the bridged conncetion IP address)
sudo docker run --name artifactory -d -p 8081:8081 docker.bintray.io/jfrog/artifactory-oss:latest