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
