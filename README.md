Installing a Goddard Node
=========================

> You will need a USB memory stick with at least 15GB. It will be wiped clean. Everything on there will be gone forever.

Your system needs to be online to build this. You'll be downloading about 1.5GB so you most probably don't want to do this over some R2/MB 3G connection. You'll need the diskspace too. It only downloads things the first time you run it. See the bottom of this file for descriptions of what is being downloaded.

Mounting USB Using Vagrant
--------------------------

Vagrant will be used to spin up a Ubuntu VM to use for provisioning. If you don't have Vagrant, you’ll have to download and install [Vagrant](https://www.vagrantup.com/downloads.html) and [VirtualBox](https://www.virtualbox.org/wiki/Downloads).

You need to make sure that the USB is not mounted in your host OS. In OSX use `diskutil list` to identify the disk and then `diskutil unmountDisk /dev/diskN` to unmount it.

`vagrant up && vagrant ssh` from this repo's root will get the VM running and SSH you into it. The repo will be automatically mounted under /vagrant.

> Vagrant does not support USB3. To circumvent this problem run this install using a USB2 port or use a USB2 hub. A real USB2 disk will make you wait forever while installing.

`lsusb` will show you available USB devices. If you don't see your device under that list, quit the VM `exit` and make sure that the disk is not mounted in your host OS. Then do a `vagrant halt && vagrant up && vagrant ssh` to restart the VM and hopefully it should be there now.

You need to figure out what device your systes uses to refer to the disk. Typically it will be under `/dev/sdb` but that will depend on your system configuration.

Provisioning the USB Disk
-------------------------

> Please make sure that you have not mounted the USB Disk. The install.sh script will be mounting it when needed.

An install script has been provided so provisioning the disk is as simple as:
`cd /vagrant && ./install.sh /dev/sdX`

Be sure to use `/dev/sdX` which references the whole device and not `/dev/sdX1` which references a partition on the device.

Files in this Repo
------------------

* `Vagrantfile` and `provision.sh` are used to provision your VM for installation.
* `install.sh` starts the automated provisioning of your USB disk.
* `/usb` contains files that are to be copied onto your USB disk.
* `/usb/goddard/goddard-config.conf` is the upstart script for the node installation agent
* `/usb/boot/grub/grub.cfg` is the grub config file
* `/usb/preseed/goddard.seed` is used to automate/preseed the ubuntu installation

Additional files that are not in this Repo
------------------------------------------

If these files are not present they will be downloaded/built automatically the first time you run ./install.sh.

* [ubuntu-14.04.2-server-amd64.iso](http://releases.ubuntu.com/14.04.2/ubuntu-14.04.2-server-amd64.iso) the full install iso for ubuntu server which we extract files from.
* `/usb/goddard/images/*` which contains docker images we install up front to save satellite bandwidth:
 * [https://registry.hub.docker.com/u/iodigital/ubuntu-node/]()
 * Maybe more to come ...
* `/usb/goddard/apps/*` which contain Goddard apps that are installed up front to save satellite bandwidth and 
to show something to the installer before provisioning from the hub








