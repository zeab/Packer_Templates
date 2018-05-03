# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 2.0.0"

Vagrant.configure("2") do |config|

	#Networking
	config.vm.network :forwarded_port, guest: 32400, host: 32400, id: "Plex Web"
	config.vm.network :forwarded_port, guest: 1900, host: 1900, id: "Plex DLNA Server"  
	config.vm.network :forwarded_port, guest: 3005, host: 3005, id: "Plex Home Theater via Plex Companion"  
	config.vm.network :forwarded_port, guest: 5353, host: 5353, id: "Bonjour/Avahi network discovery"
	config.vm.network :forwarded_port, guest: 8324, host: 8324, id: "Plex for Roku via Plex Companion"
	config.vm.network :forwarded_port, guest: 32410, host: 32410, id: "GDM network discovery1"
	config.vm.network :forwarded_port, guest: 32412, host: 32412, id: "GDM network discovery2"
	config.vm.network :forwarded_port, guest: 32413, host: 32413, id: "GDM network discovery3"
	config.vm.network :forwarded_port, guest: 32414, host: 32414, id: "GDM network discovery4"
	config.vm.network :forwarded_port, guest: 32469, host: 32469, id: "Plex DLNA Server"

	#Virtualbox Settings
    config.vm.provider :virtualbox do |v|
        v.gui = false
        v.customize ["modifyvm", :id, "--memory", 4096]
        v.customize ["modifyvm", :id, "--cpus", 4]
    end
	
end
