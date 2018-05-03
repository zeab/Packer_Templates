# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 2.0.0"

Vagrant.configure("2") do |config|

	#Networking
	config.vm.network :forwarded_port, guest: 8080, host: 8080, id: "Utorrent GUI"

	#Virtualbox Settings
  config.vm.provider :virtualbox do |v|
      v.gui = true
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--cpus", 2]
      v.customize ["modifyvm", :id, "--vram", "64"]
      v.customize ["modifyvm", :id, "--ioapic", "on"]
      v.customize ["modifyvm", :id, "--rtcuseutc", "on"]
      v.customize ["modifyvm", :id, "--accelerate3d", "on"]
      v.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
      v.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
      v.customize ["modifyvm", :id, "--audio", "none"]
      v.customize ["modifyvm", :id,  "--vrde", "off"]
      v.customize ["setextradata", :id, "CustomVideoMode1", "1024x768x32"]
      v.customize	["setextradata", "global", "GUI/SuppressMessages", "all" ]
      v.customize ["setextradata", "global", "GUI/MaxGuestResolution", "any"]
  end
    
end
