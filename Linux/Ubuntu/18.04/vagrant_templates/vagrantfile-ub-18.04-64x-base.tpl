# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 2.0.0"

Vagrant.configure("2") do |config|

    config.vm.provider :virtualbox do |v, override|
        v.gui = false
        v.customize ["modifyvm", :id, "--memory", 1024]
        v.customize ["modifyvm", :id, "--cpus", 2]

		v.customize ["modifyvm", :id, "--nic2", "bridged"]
        v.customize ["modifyvm", :id, "--nictype2", "virtio"]
        v.customize ["modifyvm", :id, "--bridgeadapter2", "Intel(R) Dual Band Wireless-AC 8260"] #Dell Latitude E7470
    end
	
end
