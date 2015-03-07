#!/bin/bash
source $(dirname $0)/color.sh
clear

#Date
FULLDATE=`date`
NOW=`date +%m%d%Y%H%M%S`

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
  
    #Create Export Name.
    DB_OUTPUT="$DB-$NOW.sql";

    echo ""
    out "Starting DB export to $DB_OUTPUT" 'info'

    #Dump Database
    mysqldump --user=$DB_USER --password=$DB_PASS --host=$DB_HOST $DB > "$DB_OUTPUT"
    if [ $? -eq 0 ]
      then
        gzip -9 "$DB_OUTPUT"
        if [ $? -eq 0 ]
          then
            out "Export Finished." 'success'
          else
            out "Export Failed." 'error'
        fi
      else
        rm -rf "$DB_OUTPUT"
        out "Export Failed." 'error'
    fi

  fi

fi

exit 0;