# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 1.6.2"

Vagrant.configure("2") do |config|

    config.vm.provider :virtualbox do |v, override|
        v.gui = false
        v.customize ["modifyvm", :id, "--memory", 2048]
        v.customize ["modifyvm", :id, "--cpus", 2]
        v.customize ["modifyvm", :id, "--vram", "8"]
        v.customize ["setextradata", "global", "GUI/MaxGuestResolution", "any"]
        v.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
		v.customize ["setextradata", :id, "CustomVideoMode1", "1024x768x32"]
		v.customize	["setextradata", :id, "GUI/SuppressMessages", "all" ]
    end

end
