#!/bin/bash

sshpass -e sftp -oBatchMode=no -oStrictHostKeyChecking=no -b - nimbusoft@frs.sourceforge.net << !
   cd /home/pfs/project/eloquentos/system
   symlink ci/${CI_PIPELINE_ID}.iso releases/${CI_COMMIT_TAG}.iso
   bye
!
