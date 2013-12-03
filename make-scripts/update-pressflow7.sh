#!/bin/bash
#Install will run an update of the pressflow, from git.
# make update dir=
source $(dirname $0)/init.sh

PRESSFLOW_UPDATE=$(dirname $0)/pressflow_7_update
rm -rf $PRESSFLOW_UPDATE
BACKUP_DIR=~/drush-backups/pressflow_7_update

#Check for URI pre-requisite
if [ -z "$2" ]
  then
    out "URI missing. You must have a functioning web server to make this update." 'error'
    exit 0
  else
    out "Uri check complete." 'success'
fi

#Backup to /tmp directory
cp -Rf $1 $BACKUP_DIR

if [ $? -eq 0 ]
    then
        out "Starting Pressflow 7 core update, backup created at: $BACKUP_DIR" 'info'
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
        rsync -rpog --exclude 'sites' --exclude '.git' --exclude '.gitignore' --exclude '.DS_Store' $PRESSFLOW_UPDATE/* $1
        # Test for successful completion and notify
        if [ $? -eq 0 ]
            then
                out "Sync completed on $1" 'success'
                out "Clear All caches by selecting 'all' (1)." 'info'
                drush cache-clear --root=$1 --uri=$2
                out "If you need to update modules, please navigate to your site, and run: drush up --uri=%mywebsiteurl" 'info'
                out "you may also have to run: drush updatedb --uri=%mywebsiteurl to complete any updates." 'info'
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
    else
        out "Could not complete update, please check for errors." 'error'
fi

rm -rf $PRESSFLOW_UPDATE
exit 0