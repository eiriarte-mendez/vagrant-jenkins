# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end
  
  config.vm.network "forwarded_port", guest: 4080, host: 4080
  config.vm.network "forwarded_port", guest: 4090, host: 4090

  config.vm.provision "shell", run: "always", inline: "echo Patience you must have, my young padawan."
  config.vm.provision "shell", run: "always", name: "flags", path: "box/init-flags.sh"
  config.vm.provision "shell", run: "always", name: "flags", path: "box/increase-swap.sh"
  config.vm.provision "shell", run: "always", name: "jenkins", path: "jenkins/install.sh"
  config.vm.provision "shell", run: "always", name: "docker", path: "docker/install.sh"
  config.vm.provision "shell", run: "always", name: "nginx", path: "nginx/install.sh"
  config.vm.provision "shell", run: "always", name: "php", path: "php/install.sh"
  config.vm.provision "shell", run: "always", name: "sonarqube", path: "sonarqube/start.sh", privileged: false
  config.vm.provision "shell", run: "always", name: "admin", path: "jenkins/show-admin-pass.sh"
  
end
