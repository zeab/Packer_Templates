# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 2.0.0"

Vagrant.configure("2") do |config|

	#Networking
	config.vm.network :forwarded_port, guest: 2181, host: 2181, id: "Kafka: Zookeeper"
	config.vm.network :forwarded_port, guest: 9092, host: 9092, id: "Kafka"
	config.vm.network :forwarded_port, guest: 9042, host: 9042, id: "Cassandra"  
	
	#Virtualbox Settings
    config.vm.provider :virtualbox do |v|
        v.gui = false
        v.customize ["modifyvm", :id, "--memory", 2048]
        v.customize ["modifyvm", :id, "--cpus", 2]
    end
	
end
