# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 2.0.0"

Vagrant.configure("2") do |config|

	#Networking
	config.vm.network :forwarded_port, guest: 4040, host: 4040, id: "Subsonic"
  
	#Virtualbox Settings
    config.vm.provider :virtualbox do |v|
        v.gui = false
        v.customize ["modifyvm", :id, "--memory", 2048]
        v.customize ["modifyvm", :id, "--cpus", 2]
    end
	
end
