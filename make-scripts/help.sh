#!/bin/bash
# Maintenance will run through permissions files, etc and fix any permissions errors
# Usage: make maintenance dir=
source $(dirname $0)/init.sh

out "The following commands are available for use:" 'info'
out "make maintenance dir="
#out "make restore backup= dir="
out "make create-pressflow7 dir="
out "make update-pressflow7 dir="
out "make install-ready-base dir="