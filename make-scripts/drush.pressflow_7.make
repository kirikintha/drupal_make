; Usage
; drush make drush.pressflow_7.make %directory --prepare-install
; 
; I hesitate to add modules in here, because projects fluctuate so much that I do not feel
; there is a catch all for each install.
; http://drush.ws/docs/make.txt
; ------------

; Core version
; ------------
core = 7.x

; API version
; ------------
api = 2

; Pressflow 7.x core
; ---------
projects[pressflow][type] = "core"
projects[pressflow][download][type] = "git"
projects[pressflow][download][url] = "https://github.com/pressflow/7.git"

; Libraries
; You can change this to add others, these are the ones I use on 90% of my installs.
; ---------
libraries[ckeditor][download][type] = "file"
libraries[ckeditor][download][url] = "http://download.cksource.com/CKEditor/CKEditor/CKEditor%203.6.2/ckeditor_3.6.2.tar.gz"
libraries[ckeditor][destination] = "libraries"

libraries[lessphp][download][type] = "git"
libraries[lessphp][download][url] = "git://github.com/leafo/lessphp.git"
libraries[lessphp][destination] = "libraries"

; Modules
projects[admin_menu][version] = "3.0-rc4"

projects[backup_migrate][version] = "2.8"

projects[ctools][version] = "1.3"

projects[devel][version] = "1.3"

projects[entity][version] = "1.2"

projects[features][version] = "2.0"

projects[fpa][version] = "2.3"

projects[jquery_update][version] = "2.3"

projects[memcache][version] = "1.0"

projects[module_filter][version] = "1.8"

projects[panelizer][version] = "3.1"

projects[panels][version] = "3.3"

projects[pathauto][version] = "1.2"

projects[rules][version] = "2.6"

projects[strongarm][version] = "2.0"

projects[token][version] = "1.5"

projects[views][version] = "3.7"