#!/bin/bash
source $(dirname $0)/color.sh
clear

#Check for File
if [ -z "$1" ]
  then
    out "Import file missing, you must have an zipped import file to." 'error'
    exit 0
  else
  #Prompt User for information.
  out "Enter database, host, user name and pass." 'info'
  read -p "Enter Database: " DB
  out "Database: $DB"

  if [ -z "$DB" ]
   then
 
   out "You must add a database to make an export" 'error'
 
   else
 
    read -p "Enter Database Host [localhost]: " DB_HOST
    DB_HOST=${DB_HOST:-localhost}
    out "Host: $DB_HOST"
    read -p "Enter Database User Name [root]: " DB_USER
    DB_USER=${DB_USER:-root}
    out "User: $DB_USER"
    read -s -p "Enter Database Password: " DB_PASS

    if [ -z "$DB_PASS" ]
      then
    
      echo ""
      out "You must add a password to make an export" 'error'
    
      else
      
      out "Starting import on $DB with $1" 'info'
  
      #Import Database
      gunzip -q < "$1" | mysql --user=$DB_USER --password=$DB_PASS --host=$DB_HOST $DB

      if [ $? -eq 0 ]
        then
          out "Import Finished." 'success'
          read -p "Press [Enter] key to continue."
          source $(dirname $0)/init.sh
        else
          out "Import Failed." 'error'
      fi

    fi

  fi
fi

exit 0;