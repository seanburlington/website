---
layout: post
title: Jenkins Build script for Drupal - multistep with changelogs
created: 1348827009
categories:
- drupal
- jenkins
- ci
---
<p>My build script has been getting more complex lately and I'm quite pleased with it.<p>

<p>We tend to have several versions of code on the go, 
version x is live, x+1 is in UAT, and x+2 is in development. With all these versions around it's important to keep track of changelogs, and to upgrade correctly x to x+1, and then x+1 to x+2 as we have found that going direct from x to x+2 can fail to uncover some bugs. Specifically this happens if a drupal update hook gets edited after it has been released to the client, but before it has run on live. Our builds always start from a copy of the live site.</p> 

<p>I have also posted a <a href="/blog/12/07/12/check-drupal-update-hook-changes">script to review these update hooks</a> but this two step upgrade fits more easily into a continuous integration setup.</p>

<p>Each release has it's own branch, any hotfixes to branch x get merged forwards to x+1</p>

<p>This code is in jenkins - and is run remotely using the <a href="https://wiki.jenkins-ci.org/display/JENKINS/Publish+Over+SSH+Plugin">publish over ssh plugin</a></p>

<p>The jenkins job has two parameters, the target branch and the intermediate branch (where the HEAD of the intermediate branch is the code in UAT or x+1, and head of the target branch is the latest dev code - x +2</p>

<p>While this might sound complex, I find it easy to use in practice, partly because the complexity is there   anyway, even if you just code direct in master all the time, it's just that this way you can see it all, and see what is going on.</p>

<code>

cd /var/www/

# there should be any changes on the server - but stash them just in case
git stash

# get the latest code from upstream - but don't change our version yet
git fetch

# check what branch we are on - in case this build also changes the test server to a new release
current_branch="$(git symbolic-ref HEAD 2>/dev/null)"
current_branch=${current_branch##refs/heads/}

# get the commit we are on and the one we will be on at the end
current_id=$(git rev-parse --short origin/develop)
new_id=$(git rev-parse --short origin/branch)

# email a nice log to myself (TODO - pull this back into jenkins)
git log --oneline --graph ${current_branch}..origin/$branch | mail -s "updating $(hostname) from $current_branch $current_id to $branch $new_id"   me@example.com

# update the code to the latest on the dev branch
git checkout $branch
git merge origin/branch

# now build
./build.sh ${intermediate}

</code>

<p>The build script itself is used on developer machines as well as on the test server.<p>

<p>We use cronjobs to ensure we always have the latest backup from live available</p>


<code>
#!/bin/bash -ex 


export COLUMNS=80
cd $(dirname $0)/www

# drop and reload the database
drush -y sql-drop 
type -P zcat &>/dev/null && {
  # if we have zcat leave db dump compressed
  zcat ../database_backups/www-latest.sql.gz | drush sqlc 
} || {
  # otherwise unzip
  gunzip ../database_backups/www-latest.sql.gz 
  drush sqlc < ../database_backups/www-latest.sql 

}

# get rid of production watchdog messages - so we can see any new ones easily

drush watchdog-delete all -y

# put site offline
drush -y vset maintenance_mode 1

# delete user files and replace with fresh ones from live - checking user permissions
# NB I use umask and groups to ensure the files remain writable by apache and CLI 
if [ -d ../files_from_live/www ]
  then 
   rm -Rf sites/default/files
 
   cp -R ../files_from_live/www/sites/default/files sites/default
   # cater for debian, ubuntu or mac
   groups | grep www-data > /dev/null && find sites/default/files/ ! -group www-data -exec chgrp www-data {} \;
   groups | grep apache > /dev/null && find sites/default/files/ ! -group apache -exec chgrp apache {} \;
   groups | grep _www > /dev/null && find sites/default/files/ ! -group _www -exec chgrp _www {} \;
fi

   # put code version info online so we can easily check what is in the test site
echo "$(git describe)" > CODE-VERSION.TXT
echo "$(git log --oneline -n 1 | sed 's/ .*//')" > CODE-HASH.TXT

# if this script is passed a intermediate version, check that out - upgrade and then checkout back to where we were
 
if ! [ -z "$1" ]  
  then
  branch_name="$(git symbolic-ref HEAD 2>/dev/null)"
  branch_name=${branch_name##refs/heads/}
  git checkout $1
  drush -y updb
  # 
  git checkout $branch_name
fi
# take site fully offline

mv index.php bak-index.php
drush -y updb

# if the current user is a member of the www-data group we can make the files owned by this group
# as long as apache has umask 002 files should now be writeable by us and apache
groups | grep www-data > /dev/null && find sites/default/files/ ! -group www-data -exec chgrp www-data {} \;
groups | grep apache > /dev/null && find sites/default/files/ ! -group apache -exec chgrp apache {} \;
groups | grep _www > /dev/null && find sites/default/files/ ! -group apache -exec chgrp _www {} \;


drush cc all
# any tasks that have to be done at the end of each deploy go in this drush hook
drush helper-post-deploy
# on dev sites rewrite any user emails so we can't spam  customers by mistake
drush helper-rewrite-emails
#set the admin password to one the devs know
drush upwd admin --password=secret

# put the site online again
drush -y vset maintenance_mode 0
mv bak-index.php index.php
drush cc all

# final permission reset just in case the last commands changed anything 
find sites/default/files/ -user $USER -type d -exec chmod 775 {} \;
find sites/default/files/ -user $USER -type f -exec chmod 664 {} \;


</code>
