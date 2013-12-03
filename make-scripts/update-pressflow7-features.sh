#!/bin/bash
#Install will run an update of the pressflow, from git.
# make update dir=
source $(dirname $0)/init.sh

FEATURES_PRESSFLOW_UPDATE=$(dirname $0)/features_update
rm -rf $FEATURES_PRESSFLOW_UPDATE
DIR=$1sites/all/modules/features_pressflow_7_ready_base
BACKUP_DIR=~/drush-backups/features_update

#Backup to /tmp directory
cp -Rf $DIR $BACKUP_DIR

if [ $? -eq 0 ]
    then
        out "Starting update, backup created at: $BACKUP_DIR" 'info'
    else
        out "Could not start update, backup failed. Please check for errors." 'error'
        exit 0
fi

#Pull latest Pressflow from git.
git clone git@github.com:kirikintha/features_pressflow_7_ready_base.git $FEATURES_PRESSFLOW_UPDATE

# Test for successful completion and notify
if [ $? -eq 0 ]
    then
        #Rsync to the new directory, ignoring sites/
        out "Features downloaded, starting update." 'success'
        out "Starting sync." 'info'
        rsync -rpog --exclude '.git' --exclude '.gitignore' --exclude '.DS_Store' --exclude 'readme.txt' $FEATURES_PRESSFLOW_UPDATE/* $DIR
        # Test for successful completion and notify
        if [ $? -eq 0 ]
            then
                out "Sync completed on $DIR" 'success'
                drush cache-clear --root=$1 --uri=$2
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
        out "Update Finished on $DIR" 'success'
    else
        out "Could not complete update, please check for errors." 'error'
fi

rm -rf $FEATURES_PRESSFLOW_UPDATE
exit 0