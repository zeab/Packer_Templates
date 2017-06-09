# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    config.vm.provider :virtualbox do |v, override|
        v.gui = true
        v.customize ["modifyvm", :id, "--memory", 2560]
        v.customize ["modifyvm", :id, "--cpus", 2]
        v.customize ["modifyvm", :id, "--vram", "128"]
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
