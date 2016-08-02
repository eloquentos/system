#!/bin/bash

if [ "${TRAVIS_PULL_REQUEST}" = "1" ]; then
    echo "This is a pull request, nothing to deploy"
    exit
fi

sshpass -e sftp -oBatchMode=no -oStrictHostKeyChecking=no -b - nimbusoft@frs.sourceforge.net << !
   cd /home/pfs/project/eloquentos/system/releases
   rm old.iso
   rename current.iso old.iso
   put out/*.iso current.iso
   bye
!
