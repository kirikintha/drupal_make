#!/bin/bash
# Maintenance will run through permissions files, etc and fix any permissions errors
# Usage: make maintenance dir=
source $(dirname $0)/init.sh

out "Enter user:group for $1/sites/default/files/ directory" 'info'
read CHOWNINFO

chown -R $CHOWNINFO $1/sites/default/files
chmod -R g+ws $1/sites/default/files

# Make sure nothing went wrong, and then look for file permissions.
if [ $? -eq 0 ]
    then
        out "Directory permissions updated." 'success'
        out "Looking for files with orphaned permissions." 'info'
        find $1/sites/default/files -type d -exec chmod g+ws {} \;
        find $1/sites/default/files -type f -exec chmod 664 {} \;
    else
        out "Could not update file permissions, please check for errors." 'error'
fi

#Set protect permissions for settings.php
out "Protecting settings.php" 'info'
chmod -v -v 444 $1/sites/default/settings.php

# Test for successful completion and notify
if [ $? -eq 0 ]
    then
        out "Maintenance Finished on $1" 'success'
    else
        out "Could not complete maintenance, please check for errors." 'error'
fi

exit 0