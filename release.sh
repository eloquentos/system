#!/bin/bash

sshpass -e sftp -oBatchMode=no -oStrictHostKeyChecking=no -b - nimbusoft@frs.sourceforge.net << !
   cd /home/pfs/project/eloquentos/system/releases
   put out/*.iso ${CI_COMMIT_TAG}.iso
   bye
!
