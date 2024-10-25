# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/jammy64"

#  config.vm.provision "ansible" do |ansible|
#    ansible.verbose = "vvv"
#    ansible.playbook = "playbook.yml"
#    ansible.become = "true"
#  end

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end

  config.vm.define "nfss" do |nfss|
    nfss.vm.network "private_network", ip: "192.168.56.10", virtualbox__intnet: "net1"
    nfss.vm.hostname = "nfss"
    #nfss.vbguest.installer_hooks[:before_install] = ["yum install -y epel-release", "sleep 1"]
    #nfss.vbguest.installer_options = { allow_kernel_upgrade: false , enablerepo: true }
    nfss.vm.provision "shell", path: "nfss_script.sh"
  end

  config.vm.define "nfsc" do |nfsc|
    nfsc.vm.network "private_network", ip: "192.168.56.11", virtualbox__intnet: "net1"
    nfsc.vm.hostname = "nfsc"
    #nfsc.vbguest.installer_hooks[:before_install] = ["yum install -y epel-release", "sleep 1"]
    #nfsc.vbguest.installer_options = { allow_kernel_upgrade: false , enablerepo: true }
    nfsc.vm.provision "shell", path: "nfsc_script.sh"
  end

end
