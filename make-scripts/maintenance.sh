#!/bin/bash
# Maintenance will run through permissions files, etc and fix any permissions errors
# Usage: make maintenance dir=
source $(dirname $0)/init.sh
source $(dirname $0)/update-permissions.sh

#update permissions
updatePermissions $1

# Test for successful completion and notify
if [ $? -eq 0 ]
    then
        out "Maintenance Finished on $1" 'success'
    else
        out "Could not complete maintenance, please check for errors." 'error'
fi