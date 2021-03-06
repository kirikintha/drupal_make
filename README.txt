##Overview
This is our set of make files for handling common functionality needed in Drupal when using Pressflow 7. 
If you have not used make files before, be sure that you can use make, and please be careful in 
using any of these scripts. We do not warranty any of these scripts, but they work for us.

Remember: Use this at your own risk, no warranty is implied. Always test first!

##Dependencies
make, git, drush and any other pre-requisites from Drupal and LAMP.
Need help with drush commands? Use this:
https://groups.drupal.org/node/28088

##Limitations
This meant to be used to create a Pressflow 7 site. We use Pressflow 7 exclusively, and do
not plan on supporting earlier versions of Drupal. When Drupal 8 becomes stable enough, we
will update to that, but we are not planning on it any time soon.

##Installation
Get the files from git@github.com:kirikintha/drupal_make.git and move it in your directory of 
choice that can use make and access drush and git. We put it in the root of our development web servers, 
because we use this in development environments and then use other methods to deploy to our production servers. 
We do not encourage you to put this on a production server, we would rather that you use this for ease for development only.

##Usage
As with any make file, we have a number of methods you can use. We do not use many drush commands
here, so this is NOT a replacement for drush. We love drush, use it as it is intended.

##Methods

make help
  This will show you the following methods.

make diag
  This will run drush self-update, and show you the latest version

make maintenance dir=
  This covers fixing files permission on Drupal installs, and also locking down the settings.php file.
  We love using this to fix permission errors.
  
make create-pressflow7 dir=
  This will run a drush make command, that will pull down the latest pressflow 7 and also a
  list of common modules that we use in our Drupal installs. This will NOT install drupal,
  but is a fantastic way to easily get the modules and core libraries you need to make your
  own install. Also note, that we only recommend a few theme, one of them being the "bootstrap" theme. 
  https://drupal.org/project/bootstrap - Bootstrap 3, in our opinion is
  a very very good framework and while it is not perfect for Drupal, it solves more problems then
  it creates. Not that we're telling you what to do, by any means, so this just covers modules
  and of course you can change this however you wish. We do our best to roll our own themes
  whenever possible.

make update-pressflow7 dir= uri=
  drush up drupal (or drush up) AFAWK do not look for a pressflow core. We tried a number of
  different drush make scenarios, but could not get a Pressflow 7 core to update properly. So,
  we created a way to download the latest pressflow core, rsync it to your directory of choice and
  clears the site cache. Just because we are paranoid, we also put a backup under ~/drush-backups/pressflow_7_update so
  you can have a way to restore your core, just in case things blow up in your face. We absolutely
  do NOT guarantee this to work for everyone, but it works for us on our VMs and OSX development
  boxes.

make update-pressflow7-features dir= uri=
  drush up does not include our ready base features module, so this specifically allows you to update
  this module. This does not update the pressflow core, nor is it a substitute to drush up. Just like
  make update-pressflow7, this will rsync to your directory, and then clear the caches of the site.
  Just because we are paranoid, we also put a backup under ~/drush-backups/features_update so
  you can have a way to restore your module, just in case.

make install-ready-base dir= uri=
  This will pull git@github.com:kirikintha/pressflow7_ready_base.git, cd to the directory you
  have specified, and start the install process. You MUST set up your database first, and also
  provide a uri, so that we can make sure that the installation will complete properly. Also,
  as of this version we only allow you use mysql, sorry. NOTE: This also sets the
  admin theme to 'shiny' which is another theme we like. Please follow all the prompts, you are
  really just saying yes to the prompts, so that features are installed, caches are cleared and
  the site builds correctly. You will also have a log file when you are finished, that has your
  admin user with a randomly generated password. 

@TODO
make restore backup= dir=
  This is not working yet, but will restore a backup made from update-pressflow7
