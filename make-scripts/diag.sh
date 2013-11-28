#!/bin/bash
# Maintenance will run through permissions files, etc and fix any permissions errors
# Usage: make maintenance dir=
source $(dirname $0)/init.sh

out "Checking Drush" 'info'
drush self-update
drush --version