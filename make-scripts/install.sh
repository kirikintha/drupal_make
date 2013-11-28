#!/bin/bash
# Get Ready Base modules and create it
# Usage: make update dir=
source $(dirname $0)/init.sh

#Create Ready Base
git@github.com:kirikintha/drupal_make.git $1

#Move into the directory, and run drush install
if [ $? -eq 0 ]
    then
        out "Install Finished on $1" 'success'
    else
        out "Could not complete install, please check for errors." 'error'
fi

# Test for successful completion and notify
if [ $? -eq 0 ]
    then
        out "Install Finished on $1" 'success'
    else
        out "Could not complete install, please check for errors." 'error'
fi

exit 0