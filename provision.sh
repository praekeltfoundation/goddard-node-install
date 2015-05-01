# updated system pls
sudo apt-get update -y
sudo apt-get upgrade -y

# install basics used for usb provisioning
sudo apt-get install mbr syslinux mtools p7zip-full grub-efi-amd64-bin git wget build-essential reprepro -y

# we need docker as we're pulling and extracting images
sudo apt-get install docker.iso nodejs nodejs-legacy nodejs-dev npm -y

# create mountpoints
sudo mkdir /mnt/iso && sudo mkdir /mnt/usb

# get additional debs we need to install 
sudo apt-get install -d nginx autossh jq rlwrap -y

# install the debs into reprepro
sudo reprepro -Vb /vagrant/reprepro/. includedeb goddard /var/cache/apt/archives/docker.io*
sudo reprepro -Vb /vagrant/reprepro/. includedeb goddard /var/cache/apt/archives/nginx*
sudo reprepro -Vb /vagrant/reprepro/. includedeb goddard /var/cache/apt/archives/node*
sudo reprepro -Vb /vagrant/reprepro/. includedeb goddard /var/cache/apt/archives/javascript*
sudo reprepro -Vb /vagrant/reprepro/. includedeb goddard /var/cache/apt/archives/libjs*
sudo reprepro -Vb /vagrant/reprepro/. includedeb goddard /var/cache/apt/archives/npm*
sudo reprepro -Vb /vagrant/reprepro/. includedeb goddard /var/cache/apt/archives/libc-ares*
sudo reprepro -Vb /vagrant/reprepro/. includedeb goddard /var/cache/apt/archives/libv8*
sudo reprepro -Vb /vagrant/reprepro/. includedeb goddard /var/cache/apt/archives/autossh*
sudo reprepro -Vb /vagrant/reprepro/. includedeb goddard /var/cache/apt/archives/jq*
sudo reprepro -Vb /vagrant/reprepro/. includedeb goddard /var/cache/apt/archives/rlwrap*
sudo reprepro -Vb /vagrant/reprepro/. includedeb goddard /var/cache/apt/archives/git*
sudo reprepro -Vb /vagrant/reprepro/. includedeb goddard /var/cache/apt/archives/gyp*
sudo reprepro -Vb /vagrant/reprepro/. includedeb goddard /var/cache/apt/archives/lib*
sudo reprepro -Vb /vagrant/reprepro/. includedeb goddard /var/cache/apt/archives/dpkg*
sudo reprepro -Vb /vagrant/reprepro/. includedeb goddard /var/cache/apt/archives/zlib*

# add no strict host key checking when cloning from github
echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config