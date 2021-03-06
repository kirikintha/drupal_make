#------------------------------------------------------------------------------
# include platform make defs - so we can override them
#------------------------------------------------------------------------------
SHELL := /bin/bash

#------------------------------------------------------------------------------
# Show Methods available.
# Usage: make help
#------------------------------------------------------------------------------
help:
	@bash make-scripts/help.sh
	
#------------------------------------------------------------------------------
# Update drush, and show the current version.
# Usage: make diag
#------------------------------------------------------------------------------
diag:
	@bash make-scripts/diag.sh
	
#------------------------------------------------------------------------------
# Clean file permissions, and any additional commands.
# Usage: make maintenance dir=%my-absolute-directory
#------------------------------------------------------------------------------
maintenance:
	@bash make-scripts/maintenance.sh $(dir)
	
#------------------------------------------------------------------------------
# Download and install the latest pressflow version.
# Usage: make create-pressflow7 dir=%my-absolute-directory
#------------------------------------------------------------------------------
create-pressflow7:
	@bash make-scripts/create-pressflow-7.sh $(dir)
	
#------------------------------------------------------------------------------
# Update the latest pressflow version.
# Usage: make update-pressflow7 dir=%my-absolute-directory
#------------------------------------------------------------------------------
update-pressflow7:
	@bash make-scripts/update-pressflow7.sh $(dir) $(uri)

#------------------------------------------------------------------------------
# Update the latest ready base features module.
# Usage: make update-pressflow7-features dir=%my-absolute-directory
#------------------------------------------------------------------------------
update-pressflow7-features:
	@bash make-scripts/update-pressflow7-features.sh $(dir) $(uri)
	
#------------------------------------------------------------------------------
# Restore A Backed up directory. This is the global nuclear option.
# Usage: make restore backup=%my-absolute-directory dir=%my-absolute-directory
#------------------------------------------------------------------------------
restore:
	@bash make-scripts/restore.sh $(backup) $(dir)
	
#------------------------------------------------------------------------------
# Download and install the latest pressflow version.
# Usage: make install-ready-base dir=%my-absolute-directory uri=%myuri
#------------------------------------------------------------------------------
install-ready-base:
	@bash make-scripts/install.sh $(dir) $(u) $(p) $(db) $(uri)
	
#------------------------------------------------------------------------------
# data import/export
#------------------------------------------------------------------------------
import:
	@sudo make-scripts/import.sh $(gz)

export:
	@sudo make-scripts/export.sh
	
#------------------------------------------------------------------------------
# Update the latest ready base features module.
# Usage: make rebuild-permissions dir=%my-absolute-directory
#------------------------------------------------------------------------------
rebuild-permissions:
	@bash make-scripts/rebuild-permissions.sh $(dir) $(uri)