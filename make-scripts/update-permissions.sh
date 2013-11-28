#!/bin/bash
# This is the function that runs maintenance.sh and is used in install.
function updatePermissions {
  out "Enter user:group for $1/sites/default/files/ directory" 'info'
  read CHOWNINFO

  sudo chown -R $CHOWNINFO $1/sites/default/files
  sudo chmod -R g+ws $1/sites/default/files

  # Make sure nothing went wrong, and then look for file permissions.
  if [ $? -eq 0 ]
      then
          out "Directory permissions updated." 'success'
          out "Looking for files with orphaned permissions." 'info'
          find $1/sites/default/files -type d -exec sudo chmod g+ws {} \;
          find $1/sites/default/files -type f -exec sudo chmod 664 {} \;
      else
          out "Could not update file permissions, please check for errors." 'error'
  fi

  #Set protect permissions for settings.php
  out "Protecting settings.php" 'info'
  chmod -v -v 444 $1/sites/default/settings.php

}