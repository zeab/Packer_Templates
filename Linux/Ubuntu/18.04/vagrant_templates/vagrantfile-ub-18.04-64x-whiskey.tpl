# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 2.0.0"

Vagrant.configure("2") do |config|

    config.vm.provider :virtualbox do |v, override|
        #Configure core options
        v.gui = true
        v.customize ["modifyvm", :id, "--memory", 2560]
        v.customize ["modifyvm", :id, "--cpus", 2]
        
        #Configure visualization
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
        
        #Configures the 2nd network card as bridged
        #vb.customize ["modifyvm", :id, "--nic2", "bridged"]
        #vb.customize ["modifyvm", :id, "--nictype2", "virtio"]
        #Replace the network card named here with your own local network card
        #vb.customize ["modifyvm", :id, "--bridgeadapter2", "Intel(R) Dual Band Wireless-AC 8260"] #Dell Latitude E7470
        #vb.customize ["modifyvm", :id, "--bridgeadapter2", "eno1"] #Linx Server
    end
    
end
