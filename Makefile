#------------------------------------------------------------------------------
# include platform make defs - so we can override them
#------------------------------------------------------------------------------
SHELL := /bin/bash

#------------------------------------------------------------------------------
# Clean file permissions, and any additional commands.
#  -- dir=
#------------------------------------------------------------------------------
help:
	@bash make-scripts/help.sh
	
#------------------------------------------------------------------------------
# Clean file permissions, and any additional commands.
#  -- dir=
#------------------------------------------------------------------------------
maintenance:
	@bash make-scripts/maintenance.sh $(dir)
	
#------------------------------------------------------------------------------
# Download and install the latest pressflow version.
# Usage: make install %my-absolute-directory
#------------------------------------------------------------------------------
create-pressflow7:
	@bash make-scripts/create-pressflow-7.sh $(dir)
	
#------------------------------------------------------------------------------
# Update the latest pressflow version.
#------------------------------------------------------------------------------
update-pressflow7:
	@bash make-scripts/update-pressflow7.sh $(dir)
	
#------------------------------------------------------------------------------
# Restore A Backed up directory. This is the global nuclear option.
#------------------------------------------------------------------------------
restore:
	@bash make-scripts/restore.sh $(backup) $(dir)
	
#------------------------------------------------------------------------------
# Download and install the latest pressflow version.
# Usage: make install %my-absolute-directory
#------------------------------------------------------------------------------
install:
	@bash make-scripts/install.sh $(dir)