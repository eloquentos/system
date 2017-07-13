#!/bin/bash

sshpass -e sftp -oBatchMode=no -oStrictHostKeyChecking=no -b - nimbusoft@frs.sourceforge.net << !
   cd /home/pfs/project/eloquentos/system/ci
   put out/*.iso ${CI_PIPELINE_ID}.iso
   bye
!
