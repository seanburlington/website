---
layout: post
title: Drupal files directory  permissions for continuous integration
created: 1306838736
comments: true
categories:
- drupal
- linux
- hudson
- security
- jenkins
---
I want the drupal user uploaded files to be manageable by both apache and a non-root user

In my case I'm using hudson to rebuild the site with data and "files" from live periodically.

So I have added the apache group to the hudson user

<code>
/usr/sbin/usermod -G hudson,apache hudson
/etc/init.d/hudson restart
</code>

and set the umask for apache so that files are created group writebale

For Redhat
<code>
echo "umask 002" >> /etc/sysconfig/httpd
/etc/init.d/httpd restart
</code>

For Debian/Ubuntu 
<code>
echo "umask 002" >> /etc/apache2/envvars
/etc/init.d/httpd restart
</code>
NB debian based systems use the group www-data for apache

In my build script I can delete my dev files and copy the ones from live - making sure the group for the files is set to apache.

<code>
rm -Rf files
cp -R /tmp/backup/files/ ./
chgrp -R apache files
find files/ -type f -exec chmod 664 '{}' ';'
find files/ -type d -exec chmod 775 '{}' ';'
</code>


Now apache can write the files I have created, and I can create the files apache has created - <b>and</b> they are not world writeable.

see also http://drupal.org/node/244924 

<h2>Update - drush</h2>

I had a cron job running drush as a different user - this created cached files which hudson couldn't delete.

Now I am running the drush cron via hudson and making sure all the 'files' directory stuff is owned correctly afterwards  

NB non-root users don't seem to be able to chgrp files that they don't own

so after running cron I make sure any files created by hudson are chgrp'd 

<code> 
find files -user hudson -exec chgrp apache {} \;
</code>

A simple chgrp -R  caused permission denied errors on those files not owned by hudson - even though they were already group apache so wouldn't have been affected.
