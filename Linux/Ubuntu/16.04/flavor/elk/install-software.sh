#!/bin/sh -x

#Define the user name to be used
OS_USERNAME=${OS_USERNAME:-vagrant}
ELK_VERSION=${ELK_VERSION:-5.6.3}

#REMOVE SOFTWARE
#telnet since why would we need that?
echo "remove software"
sudo apt-get purge -y --auto-remove telnet

sudo apt-get clean
sudo apt-get autoremove

#Install Curl
echo "Install Curl"
sudo apt-get update && sudo apt-get install -y curl

#Install Zip/Unzip
echo "Install Zip/Unzip"
sudo apt-get update && sudo apt-get install -y zip unzip

#Install Htop
echo "Install Htop"
sudo apt-get update && sudo apt install htop

#Install Nano
echo "Install Nano"
sudo apt-get update && sudo apt-get install -y nano

echo "Installing OpenJDK 8"
sudo apt-get update && sudo apt-get install -y openjdk-8-jdk

#Install Elasticsearch
wget -O /tmp/elasticsearch.deb https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-${ELK_VERSION}.deb
sha1sum /tmp/elasticsearch.deb 
sudo dpkg -i /tmp/elasticsearch.deb
##MODIFY CONFIG FILE HERE
#ClusterName
sudo sed -i 's,#cluster.name: my-application,cluster.name: whiskey-monitoring,g' /etc/elasticsearch/elasticsearch.yml
#NodeName
sudo sed -i 's,#node.name: node-1,node.name: whiskey-es,g' /etc/elasticsearch/elasticsearch.yml
#NetworkIp
sudo sed -i 's,#network.host: 192.168.0.1,network.host: 0.0.0.0,g' /etc/elasticsearch/elasticsearch.yml
#up the max map count so it doesnt die
sudo echo "vm.max_map_count = 262144" | sudo tee -a /etc/sysctl.conf
#start and set to start on set up
sudo service elasticsearch start
sudo systemctl enable elasticsearch 


#Install Logstash
wget -O /tmp/logstash.deb https://artifacts.elastic.co/downloads/logstash/logstash-${ELK_VERSION}.deb
sha1sum /tmp/logstash.deb 
sudo dpkg -i /tmp/logstash.deb
#Move the beats and http config files
wget -O /tmp/floppy_files.zip https://github.com/zeab/Packer_Floppy_FIles/archive/master.zip
unzip /tmp/floppy_files.zip -d /tmp/floppy_files/
sudo mv /tmp/floppy_files/Packer_Floppy_FIles-master/elk/beats.conf /etc/logstash/conf.d/beats.conf
sudo mv /tmp/floppy_files/Packer_Floppy_FIles-master/elk/http.conf /etc/logstash/conf.d/http.conf
#Start the logstash service
sudo systemctl enable logstash
sudo service logstash start


#Install Kibana
wget -O /tmp/kibana.deb https://artifacts.elastic.co/downloads/kibana/kibana-${ELK_VERSION}-amd64.deb
sha1sum /tmp/kibana.deb 
sudo dpkg -i /tmp/kibana.deb

##MAKE CONFIG FILE CHANGES HERE
#sed "s|\$ROOT|${HOME}|g" abc.sh

sudo sed -i 's,#server.host: "localhost",server.host: "0.0.0.0",g' /etc/kibana/kibana.yml
sudo sed -i 's,#server.name: "your-hostname",server.name: "whiskey-kib",g' /etc/kibana/kibana.yml
sudo sed -i 's,#elasticsearch.url: "http://localhost:9200",elasticsearch.url: "http://localhost:9200",g' /etc/kibana/kibana.yml
#Start service
sudo service kibana start
sudo systemctl enable kibana

#metricsbeats
#sudo wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
#sudo apt-get install -y apt-transport-https
#sudo echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-5.x.list
#sudo apt-get update && sudo apt-get install -y metricbeat

#sudo curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-5.5.0-amd64.deb
#sudo dpkg -i metricbeat-5.5.0-amd64.deb

#ADD STUFF TO CHANGE THE TAGS AND FIELDS

#sudo sed -i 's,output.elasticsearch:,#output.elasticsearch:,g' /etc/metricbeat/metricbeat.yml
#sudo sed -i 's,hosts: \["localhost:9200"\],#hosts: \["localhost:9200"\],g' /etc/metricbeat/metricbeat.yml
#sudo sed -i 's,#output.logstash:,output.logstash:,g' /etc/metricbeat/metricbeat.yml
#sudo sed -i 's,#hosts: \["localhost:5044"\],hosts: \["localhost:5044"\],g' /etc/metricbeat/metricbeat.yml

#curl -H 'Content-Type: application/json' -XPUT 'http://localhost:9200/_template/metricbeat' -d@/etc/metricbeat/metricbeat.template.json
#sudo update-rc.d metricbeat defaults 95 10
#sudo service metricbeat start
#sudo systemctl enable metricbeat


#Filebeat
#sudo apt-get update && sudo apt-get -y install filebeat 

#sudo sed -i 's,/var/log/\*.log,/var/log/syslog\ndocument_type: syslog,g' /etc/filebeat/filebeat.yml
#sudo sed -i 's,output.elasticsearch:,#output.elasticsearch:,g' /etc/filebeat/filebeat.yml
#sudo sed -i 's,hosts: \["localhost:9200"\],#hosts: \["localhost:9200"\],g' /etc/filebeat/filebeat.yml
#sudo sed -i 's,#output.logstash:,output.logstash:,g' /etc/filebeat/filebeat.yml
#sudo sed -i 's,#hosts: \["localhost:5044"\],hosts: \["localhost:5044"\],g' /etc/filebeat/filebeat.yml

#curl -H 'Content-Type: application/json' -XPUT 'http://localhost:9200/_template/filebeat' -d@/etc/filebeat/filebeat.template.json
#run the logstash command





curl -H 'Content-Type: application/json' -XPOST 'http://127.0.0.1:8900' -d '{"message":"inital log message"}'
#sudo service filebeat start
#sudo systemctl enable filebeat


#packetbeat
#sudo apt-get install -y libpcap0.8
#curl -L -O https://artifacts.elastic.co/downloads/beats/packetbeat/packetbeat-5.5.0-amd64.deb
#sudo dpkg -i packetbeat-5.5.0-amd64.deb

#sudo sed -i 's,output.elasticsearch:,#output.elasticsearch:,g' /etc/packetbeat/packetbeat.yml
#sudo sed -i 's,hosts: \["localhost:9200"\],#hosts: \["localhost:9200"\],g' /etc/packetbeat/packetbeat.yml
#sudo sed -i 's,#output.logstash:,output.logstash:,g' /etc/packetbeat/packetbeat.yml
#sudo sed -i 's,#hosts: \["localhost:5044"\],hosts: \["localhost:5044"\],g' /etc/packetbeat/packetbeat.yml


#curl -H 'Content-Type: application/json' -XPUT 'http://localhost:9200/_template/packetbeat' -d@/etc/packetbeat/packetbeat.template.json

#sudo service packetbeat start
#sudo systemctl enable packetbeat





#set up 2nd network card
printf "\nauto enp0s8\niface enp0s8 inet dhcp" >> /etc/network/interfaces

#final updates
sudo apt update && sudo apt upgrade -y