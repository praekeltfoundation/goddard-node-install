# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  # use official ubuntu trusty 64 
  config.vm.box = "ubuntu/trusty64"
  
  # setup USB
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--usb", "on"]
    vb.customize ["modifyvm", :id, "--usbehci", "on"]
    vb.customize ["usbfilter", "add", "0", 
      "--target", :id, 
      "--name", "Any mass storage"]
  end

  # run provisioning shell script
  config.vm.provision :shell, path: "provision.sh"

end