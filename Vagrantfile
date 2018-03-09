# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.define "docker" do |dock|
    dock.vm.box = "ubuntu/trusty64"
    dock.vm.hostname = "docker"
    dock.ssh.username = "vagrant"
    dock.ssh.password = "vagrant"

    dock.vm.network "forwarded_port", guest: 5000, host: 5000
    dock.vm.network "forwarded_port", guest: 8000, host: 8000
    dock.vm.network :private_network, ip: "192.168.0.100"
    
  # config.vm.provision "shell", inline: <<-SHELL
  #    apt-get update
  #   apt-get install -y apache2
  # SHELL
   dock.vm.provision :docker
   dock.vm.provision :shell, path: "/home/danil/task1/compose.sh"
  #config.vm.provision :shell do |shell|
  #    shell.path="/vagrant/compose.sh"
  # end
  # config.vm.provision :docker
  # dock.vm.provision :docker_compose, rebuild: true, run: "always", yml: "/vagrant/docker-compose.yml"
  end
  config.vm.define "postgres" do |ps|
    ps.vm.box = "ubuntu/trusty64"
    ps.vm.hostname = "postgres"
    ps.ssh.username = "vagrant"
    ps.ssh.password = "vagrant"
    ps.vm.network "forwarded_port", guest: 5432, host: 5432
    ps.vm.network :private_network, ip: "192.168.0.200"
#    ps.vm.synced_folder "/home/danil/task1/", "/vagrant"
    ps.vm.provision :shell, path: "/home/danil/task1/postgres.sh"
#      shell.path="/vagrant/postgres.sh"
  end
  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
     vb.gui = true
  #   # Customize the amount of memory on the VM:
     vb.memory = "512"
  end
  config.vm.synced_folder "/home/danil/task1/", "/vagrant"
end
