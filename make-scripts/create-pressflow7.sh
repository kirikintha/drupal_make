#!/bin/bash
# Get Ready Base modules and create it
# Usage: make update dir=
source $(dirname $0)/init.sh

#Create Ready Base
drush make $(dirname $0)/drush.pressflow_7.make $1 --prepare-install

# Test for successful completion and notify
if [ $? -eq 0 ]
    then
        out "Created Pressflow 7 and modules at: $1" 'success'
    else
        out "Could not complete install, please check for errors." 'error'
fi

exit 0