#!/bin/bash
# Maintenance will run through permissions files, etc and fix any permissions errors
# Usage: make maintenance dir=
source $(dirname $0)/color.sh

out "The following commands are available for use:" 'info'
out "make maintenance dir=%my-absolute-directory"
#out "make restore backup= dir="
out "make create-pressflow7 dir=%my-absolute-directory"
out "make update-pressflow7 dir=%my-absolute-directory"
out "make install-ready-base dir=%my-absolute-directory uri=%myuri"