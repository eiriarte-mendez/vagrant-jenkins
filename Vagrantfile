# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.network "forwarded_port", guest: 80, host: 4080
  config.vm.network "forwarded_port", guest: 9000, host: 9100

  config.vm.provision "shell", inline: "echo Patience you must have, my young padawan."
  config.vm.provision "shell", name: "jenkins", path: "jenkins/install.sh"
  config.vm.provision "shell", name: "docker", path: "docker/install.sh", privileged: true
  config.vm.provision "shell", name: "nginx", path: "nginx/install.sh"
  config.vm.provision "shell", name: "sonarqube", path: "sonarqube/start.sh", run: "always"
  config.vm.provision "shell", name: "admin", path: "jenkins/show-admin-pass.sh"
  
end
