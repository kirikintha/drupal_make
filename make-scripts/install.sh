#!/bin/bash
# Get Ready Base modules and create it
# Usage: make update dir=
source $(dirname $0)/init.sh
source $(dirname $0)/update-permissions.sh

DB_URL="mysql://$2:$3@localhost/$4"

FULLDATE=`date`
DATE=`date +%m-%d-%Y-%H%M%S`
LOG=../install-$DATE.log

#Check for DB pre-requisites.
if [ -z "$2" ] || [ -z "$3" ] || [ -z "$4" ]
  then
    out "Invalid db parameters supplied. You must have a user, password and database added." 'error'
    exit 0
  else
    out "DB check complete." 'success'
fi

#Check for URI pre-requisite
if [ -z "$5" ]
  then
    out "URI missing. You must have a functioning web server to make an install." 'error'
    exit 0
  else
    out "Uri check complete." 'success'
fi

#Create Ready Base
out "Starting install, retrieving ready base." 'info'
git clone git@github.com:kirikintha/pressflow7_ready_base.git $1

#Move into the directory, and run drush install
if [ $? -eq 0 ]
    then
        clear
        out "Ready base downloaded, starting install process" 'success'
        cd $1
        out "Using DB: $DB_URL" 'success'
        #This works for mysql on localhost only sorry!
        drush site-install -y minimal --db-url=$DB_URL 2>$LOG
        #If we make it this far, enable, do post install updates, change themes and install pressflow_7_ready_base
        if [ $? -eq 0 ]
            then
                #Go in and update maintenance.
                out "Drupal install completed, check install.log for your username and password." 'success'
                out "Running post install maintenance." 'info'
                updatePermissions $1
                # Test for successful completion and notify
                if [ $? -eq 0 ]
                    then
                      #Change Theme Configuration.
                      out "Install Finished, ready to continue." 'success'
                      out "Updating admin theme to 'shiny'." 'info'
                      drush vset --exact admin_theme shiny
                      #Update Configuration and flush all caches.
                      out "Enable pressflow_7_ready_base by choosing 'yes' (y) to the next prompts." 'info'
                      drush en pressflow_7_ready_base --uri=$5
                      out "Clear All caches by selecting 'all' (1)." 'info'
                      drush cache-clear --uri=$5
                      out "Running cron." 'info'
                      drush core-cron --uri=$5
                      out "Refreshing update list." 'info'
                      drush pm-refresh --uri=$5
                      out "All installation tasks finished for: $1" 'success'
                      out "You are not finished yet!" 'warning'
                      out "1. Make sure that you check $LOG."
                      out "2. Check your installation at: admin/reports/status."
                      out "3. It is not mandatory for installation, but you need to update your settings.php file to include memcache integration."
                      out "4. Start a new git repo with 'git init'."
                      exit 0
                    else
                        out "Could not complete install, please check for errors." 'error'
                        exit 0
                fi
            else
                out "Could not complete install, please check for errors." 'error'
                exit 0
        fi
    else
        out "Could not complete install, please check for errors." 'error'
        exit 0
fi