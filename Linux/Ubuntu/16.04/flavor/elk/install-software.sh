
#REMOVE SOFTWARE
#telnet since why would we need that?
sudo apt-get purge -y --auto-remove telnet

sudo apt-get clean
sudo apt-get autoremove

#Fix Install
#Install the termainl
echo "Fixing terminal issues"
sed -i 's,LANG="en_US",LANG="en_US.UTF-8",g' /etc/default/locale
sed -i 's,LANGUAGE="en_US:",LANGUAGE="en_US",g' /etc/default/locale


#Hardening
#Install Firewall
sudo apt-get install -y ufw 
sudo ufw allow ssh
sudo ufw allow http
#sudo ufw enable -y

	 
#Secure shared memory (need to update the root password first sudo passwd root vagrant vagrant)
#sudo echo "# $TFCName Script Entry - Secure Shared Memory - $LogTime" >> /etc/fstab
#sudo echo "tmpfs     /dev/shm     tmpfs     defaults,noexec,nosuid     0     0" >> /etc/fstab

#Install Htop
sudo apt-get update && sudo apt install htop

#INSTALL SOFTWARE
#Install Httpie
sudo apt-get update && sudo apt-get install -y httpie 
				
#Installing Docker
#sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
#sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
#sudo apt-get update
#sudo apt-cache policy docker-engine
#sudo apt-get install -y docker-engine

sudo apt-get install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker

#Install docker compose
sudo apt-get update && sudo apt install -y docker-compose


##INSTALL JAVA8 from an install file rather than have the code here
#sh /media/floppy0/install-java8.sh
#########
echo "Installing Java 8"
apt-get update
apt-get install -y  software-properties-common
add-apt-repository ppa:webupd8team/java -y
apt-get update
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
apt-get install -y oracle-java8-installer
#########


##Add elasticsearch items to the apt-get repo
sudo wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-5.x.list


#Install Elasticsearch
sudo apt-get update && sudo apt-get install -y elasticsearch
##MODIFY CONFIG FILE HERE
#ClusterName
sudo sed -i 's,#cluster.name: my-application,cluster.name: whiskey-monitoring,g' /etc/elasticsearch/elasticsearch.yml
#NodeName
sudo sed -i 's,#node.name: node-1,node.name: whiskey-es,g' /etc/elasticsearch/elasticsearch.yml
#NetworkIp
sudo sed -i 's,#network.host: 192.168.0.1,network.host: 0.0.0.0,g' /etc/elasticsearch/elasticsearch.yml
#up the max map count so it doesnt die
sudo echo "vm.max_map_count = 262144" | tee -a /etc/sysctl.conf
#start and set to start on set up
sudo service elasticsearch start
sudo systemctl enable elasticsearch 


#Logstash
sudo apt-get update && sudo apt-get install -y logstash
#update ip address to a way to grab it on the fly

#I think i need to send in a json instead...?
#sudo /usr/share/logstash/bin/logstash -e 'input { stdin { } } output { elasticsearch { hosts => ["localhost"] } }' --path.data /root/data
#sudo /usr/share/logstash/bin/logstash -e 'input {http {port => 8900}} output {stdout{codec => rubydebug}}'
sudo mv /tmp/beats.conf /etc/logstash/conf.d/beats.conf
sudo mv /tmp/http.conf /etc/logstash/conf.d/http.conf

sudo systemctl enable logstash
sudo service logstash start


#add a curl command about firing a logstash in at this point


#Kibana
#sudo wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
#sudo echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-5.x.list
sudo apt-get update && sudo apt-get install -y kibana
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
sudo apt-get update && sudo apt-get -y install filebeat 

#sudo sed -i 's,/var/log/\*.log,/var/log/syslog\ndocument_type: syslog,g' /etc/filebeat/filebeat.yml
#sudo sed -i 's,output.elasticsearch:,#output.elasticsearch:,g' /etc/filebeat/filebeat.yml
#sudo sed -i 's,hosts: \["localhost:9200"\],#hosts: \["localhost:9200"\],g' /etc/filebeat/filebeat.yml
#sudo sed -i 's,#output.logstash:,output.logstash:,g' /etc/filebeat/filebeat.yml
#sudo sed -i 's,#hosts: \["localhost:5044"\],hosts: \["localhost:5044"\],g' /etc/filebeat/filebeat.yml

curl -H 'Content-Type: application/json' -XPUT 'http://localhost:9200/_template/filebeat' -d@/etc/filebeat/filebeat.template.json
#run the logstash command
curl -XGET 'http://localhost:8900'
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


#HTTP PLUGIN
#/usr/share/logstash/bin ./logstash-plugin install logstash-http-plugin
#then set up the conf
#/etc/logstash/conf.d #make a file here with the config




#set up 2nd network card
printf "\nauto enp0s8\niface enp0s8 inet dhcp" >> /etc/network/interfaces

#final updates
sudo apt update && sudo apt upgrade -y