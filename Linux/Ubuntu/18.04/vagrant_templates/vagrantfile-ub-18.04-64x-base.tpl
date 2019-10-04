# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 2.0.0"

Vagrant.configure("2") do |config|

    config.vm.provider :virtualbox do |v, override|
        v.gui = false
        v.customize ["modifyvm", :id, "--memory", 1024]
        v.customize ["modifyvm", :id, "--cpus", 2]
    end
	
end
