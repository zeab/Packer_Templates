# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 2.0.0"

Vagrant.configure("2") do |config|

	#Networking
	config.vm.network :forwarded_port, guest: 8900, host: 8900, id: "Logstash-Http"
	config.vm.network :forwarded_port, guest: 5043, host: 5043, id: "Logstash-Beats"
	config.vm.network :forwarded_port, guest: 9200, host: 9200, id: "Elasticsearch"  
	config.vm.network :forwarded_port, guest: 5601, host: 5601, id: "Kibana"
	
	#Virtualbox Settings
    config.vm.provider :virtualbox do |v|
        v.gui = false
        v.customize ["modifyvm", :id, "--memory", 2048]
        v.customize ["modifyvm", :id, "--cpus", 2]
    end
	
end
