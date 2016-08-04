# Eloquent OS System Image

[![Build Status](https://travis-ci.org/eloquentos/system.svg)](https://travis-ci.org/eloquentos/system)  [![SourceForge](https://img.shields.io/sourceforge/dm/eloquentos.svg?maxAge=2592000)](https://sourceforge.net/projects/eloquentos/files/system/releases/)

Copyright (c) 2016 Nimbusoft Ltd

Eloquent OS system image (ISO) used for booting.


## Building

You can build the image on an Arch Linux based distro with the archiso package which can be installed with pacman.

```bash
sudo ./build.sh -v
```

The newly build ISO will be built into the ```out``` directory.

Note: Chances are, the built ISO will not be bootable by itself. The ISO is designed to be loop-mounted with GRUB and overlayed with directories on the hard disk in our initramfs.

## Installing Manually

Eloquent OS is pretty easy to install manually. The following instructions will guide you through the process.

### Downloading the base iso

You can download the base iso from [here](https://sourceforge.net/projects/eloquentos/files/iso/releases/current.iso/download). Once you've downloaded the iso, you'll need to write it to a USB stick. There is a great guide [here](https://www.linux.com/blog/how-burn-iso-usb-drive) on how to do that under Windows and Linux.

Once you've written the iso file to a USB stick, reboot your computer and boot from the USB stick.

### Partitioning and formatting your hard disk

Now you've booted into the Eloquent OS install iso, launch the Terminal and type the following commands.

```
cfdisk
```

This will launch the cfdisk interface. Make a note of the your drive path, it will look something like this ```/dev/sda``` Delete all the current partitions, then create a new one for the full size of your disk, mark it bootable and write the partition table to the disk, then quit ```cfdisk```.

Now you've partitioned your drive, you'll need to format it. Eloquent OS uses [btrfs](https://btrfs.wiki.kernel.org/index.php/Main_Page) by default, so to format your drive, run the following command, replacing ```/dev/sda1``` with your drives partition path.

```
mkfs.btrfs /dev/sda1
```

You can now mount your drive by running the following command, again replacing ```/dev/sda1``` with your drive path.

```
mount /dev/sda1 /mnt
```

### Setup your filesystem structure

Eloquent OS uses a very unique filesystem structure, so we first have to setup this structure by downloading our [structure](https://github.com/eloquentos/structure) repository into your drives mount point. You can do this by running the following commands.

```
wget https://github.com/eloquentos/structure/archive/master.tar.gz
tar xf master.tar.gz
mv structure-master/* /mnt
```

### Downloading the Eloquent OS system image

Eloquent OS runs from an iso image that contains everything the system needs to run. To download the latest system image into place, run the following command.

```
wget https://sourceforge.net/projects/eloquentos/files/system/releases/current.iso/download -O /mnt/System/Images/eloquentos.iso
```

### Install the grub bootloader

We now need to install a bootloader to the MBR, you can do this by running the following command, remember to replace ```/dev/sda``` with your drive path.

```
grub-install --boot-directory=/mnt/System/Boot /dev/sda
```

### Generating the grub config

Eloquent OS can now generate the grub config for you, to do this, run the following command.

```
/mnt/System/Boot/bin/detect
```

### Reboot and enjoy!

You should now be ready to boot into Eloquent OS. Reboot your machine and you should now be greeted by Eloquent OS. If you have any issues or feedback, then please open an issue.
