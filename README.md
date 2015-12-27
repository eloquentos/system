# Eloquent OS System Image

Copyright (c) 2016 Nimbusoft Ltd

Eloquent OS system image (ISO) used for booting.


## Building

You can build the image on an Arch Linux based distro with the archiso package which can be installed with pacman.

```bash
sudo ./build.sh -v
```

The newly build ISO will be built into the ```out``` directory.

Note: Chances are, the built ISO will not be bootable by itself. The ISO is designed to be loop-mounted with GRUB and overlayed with directories on the hard disk in our initramfs.
