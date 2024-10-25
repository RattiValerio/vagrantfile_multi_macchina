# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  BASE_INT_NETWORK = "10.10.20"
  BASE_HOST_ONLY_NETWORK = "192.168.56"
  BOX_IMAGE = "ubuntu/jammy64"

  # Web VM config
  config.vm.define "web" do |web|
    web.vm.box = BOX_IMAGE
    web.vm.hostname = "web.m340"

    web.vm.synced_folder "www/", "/var/www/html/"

    # Network configuration
    web.vm.network "private_network", ip: "#{BASE_INT_NETWORK}.10", virtualbox__intnet: "intnet"
    web.vm.network "private_network", ip: "#{BASE_HOST_ONLY_NETWORK}.10", name: "VirtualBox Host-Only Ethernet Adapter"
    
    # Provisioning
    web.vm.provision "shell", path: "provision-update.sh"
    web.vm.provision "shell", path: "provision-web.sh"

    # Virtual box settings
    web.vm.provider "virtualbox" do |vb|
        vb.name = "web.m340"
        vb.memory = "2048"
        vb.cpus = 2
    end
  end

  # Database VM config
  config.vm.define "db" do |db|
    db.vm.box = BOX_IMAGE
    db.vm.hostname = "db.m340"

    # Network config
    db.vm.network "private_network", ip: "#{BASE_INT_NETWORK}.11", virtualbox__intnet: "intnet"
    
    # Provisioning
    db.vm.provision "shell", path: "provision-update.sh"
    db.vm.provision "shell", path: "provision-db.sh"
    db.vm.provision "shell", path: "provision-db-inserts.sh"
    
    # Virtual box settings
    db.vm.provider "virtualbox" do |vb|
        vb.name = "db.m340"
        vb.memory = "2048"
        vb.cpus = 2
    end
  end
end
