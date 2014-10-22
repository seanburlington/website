---
layout: post
title: Export from Git for Drupal site releases
created: 1321355695
comments: true
categories:
- drupal
- svn
- git
- version control
---
I'm used to how svn export works, and have used this in a number of release scripts.

Git doesn't quite have an equivalent

There is 

<code>git archive</code>

Which creates a tarball rather than a set of files, and while you can export a subset of the repository you still get the full path in the tarball.


and 

<code>git checkout-index</code>

Which creates a set of files (these can be locate outside the working copy) but requires a local repository.

Also I'm using github which doesn't support the remote repository option of git archive and their ready made tarball doesn't seem to work via wget on a private project (P.S. I since discovered the githaub tarbal works with wget if you pass params on the query string like ?login=${user}&token=${token} )

What I really wanted was a script I could hand to the sysadmin, that he could run on any server without needing a local git repository. 

In the end I have instead written a script that packages the tarball I want and uploads that to a server he can access it from.

<?php

#!/bin/bash -ex

# pass a valid release tag as a parameter to this script to create an release tarball and upload to skunkworks

# this works on the local git repo - which must be up to date!
 
git archive   $1 www > /tmp/${1}.tar
cd /tmp
tar -xf ${1}.tar
rm ${1}.tar
rm -Rf www/sites/default/
mv www $1
tar -czf ${1}.tar.gz $1 
rm -Rf $1

scp ${1}.tar.gz dev.server.foo:/var/www/releases

?>

 Then there is another script that downloads and unpacks this to upgrade our site.


<?php
#!/bin/bash -ex

# parameter is release tag

# tag has been released and uploaded to skunkworks

# live site is backed up

# live site docroot is /var/www/public_html

# each release is at /var/www/$release

# symlink points /var/www/public_html to current release

# sites/default is common to every release - stored as /var/www/sites-default
# symlink added to each release to point to this

export COLUMNS=80

release=$1


cd /var/www/

wget http://dev.server.foo/releases/${release}.tar.gz

tar -xzf ${release}.tar.gz

cd ${release}

ln -s /var/www/sites-default sites/default


drush -y vset site_offline_message "<p>Site offline for upgrade</p>" 
drush -y vset site_offline 1 

drush -y updb

drush cc all

# if the current user is a member of the www-data or apache group we can make the files owned by this group
# as long as apache has umask 002 files should now be writable by us and apache
groups | grep www-data > /dev/null && find sites/default/files/ ! -group www-data -exec chgrp www-data {} \;
groups | grep apache > /dev/null && find sites/default/files/ ! -group apache -exec chgrp apache {} \;


cd ..

rm public_html

ln -s ${release} public_html

cd ${release}

drush -y --uri=www.foo.com vset site_offline 0


?>
