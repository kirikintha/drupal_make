#!/bin/bash
#Install will run an update of the pressflow, from git.
# make update dir=
source $(dirname $0)/init.sh

PRESSFLOW_UPDATE=$(dirname $0)/pressflow_7_update
BACKUP_DIR=~/drush-backups/pressflow_7_update

#Backup to /tmp directory
cp -Rf $1 $BACKUP_DIR

if [ $? -eq 0 ]
    then
        out "Starting update, backup created at: $BACKUP_DIR" 'info'
    else
        out "Could not start update, backup failed. Please check for errors." 'error'
        exit 0
fi

#Pull latest Pressflow from git.
git clone git@github.com:pressflow/7.git $PRESSFLOW_UPDATE

# Test for successful completion and notify
if [ $? -eq 0 ]
    then
        #Rsync to the new directory, ignoring sites/
        out "Pressflow downloaded, starting update." 'success'
        out "Starting sync." 'info'
        rsync -rpog --exclude 'sites' $PRESSFLOW_UPDATE/* $1
        # Test for successful completion and notify
        if [ $? -eq 0 ]
            then
                out "Sync completed on $1" 'success'
                out "Please navigate to your site, and run: drush up --uri=%mywebsiteurl" 'info'
                out "you may also have to run: drush updatedb --uri=%mywebsiteurl" 'info'
            else
                out "Could not complete sync, please check for errors." 'error'
        fi
        #End of Update
    else
        out "Could not download the latest version of pressflow, please check for errors." 'error'
fi

# Test for successful completion and notify
if [ $? -eq 0 ]
    then
        out "Update Finished on $1" 'success'
        #CD to directory, so you can run Drush properly.
        cd $1
    else
        out "Could not complete update, please check for errors." 'error'
fi

rm -rf $PRESSFLOW_UPDATE
exit 0