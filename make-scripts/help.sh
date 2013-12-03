#!/bin/bash
# Maintenance will run through permissions files, etc and fix any permissions errors
# Usage: make maintenance dir=
source $(dirname $0)/color.sh

out "The following commands are available for use:" 'info'
out "Run maintenance on a sites files, and protect settings.php" 'info'
out "make maintenance dir=%my-absolute-directory"
#out "make restore backup= dir="
out "Use drupal make to create a bare pressflow 7 site, without installing." 'info'
out "make create-pressflow7 dir=%my-absolute-directory"
out "Update Pressflow 7 core. Use this if your drupal core is out of date before you run drush up" 'info'
out "make update-pressflow7 dir=%my-absolute-directory uri=%myuri"
out "Update Ready Base Features. Since you cannot use drush to update the features module, this replace that functionality." 'info'
out "make update-pressflow7-features dir=%my-absolute-directory uri=%myuri"
out "make install-ready-base dir=%my-absolute-directory uri=%myuri"