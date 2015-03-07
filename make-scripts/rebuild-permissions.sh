#!/bin/bash
  
source $(dirname $0)/color.sh
clear

#check to see that we have a directory
if [ -z "$1" ]
  then
    out "No directory supplied, aborting. Please use make maintenance dir=%my-directory. This should be absolute. Do not use a trailing slash!" 'error'
    exit 0
  else
  #If you have added a directory, we need to make sure it is an absolute path, or relative to
  # your user.
  if [[ "$1" = /* ]]
      then
		if [ -z "$2" ]
			then
				out "You must supply a valid uri for drush to work properly." 'error'
				exit 0
			else
				#Start permission rebuild
				out "Starting node permissions rebuild on $1 --uri=$2"
				cd $1
				drush php-eval --uri=$2 'ini_set("max_execution_time", 0); node_access_rebuild();'

			# Make sure nothing went wrong.
			if [ $? -eq 0 ]
				then
					out "node permissions rebuilt." 'success'
				else
					out "Could not rebuild node permissions, please check for errors." 'error'
			fi
		fi
      else
          out "Could not complete task, please use an absolute directory, or start with ~/." 'error'
          exit 0
  fi
fi