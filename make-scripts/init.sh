#!/bin/bash
#Initialize shell.
#include color for output
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
          out "Starting task on $1" 'info'
      else
          out "Could not complete task, please use an absolute directory, or start with ~/." 'error'
          exit 0
  fi
fi