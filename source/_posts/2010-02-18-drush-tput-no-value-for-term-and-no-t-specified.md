---
layout: post
title: ! 'Drush "tput: No value for $TERM and no -T specified"'
created: 1266492214
comments: true
categories:
- drupal
- linux
- drush
- bash
---
<p>The drush script which provides comman line acceess to drupal functionality emits an error message when run as a cron job</p>

<code>
tput: No value for $TERM and no -T specified
</code>

<code>
# If it is not exported determine and export the number of columns.
if [ -z $COLUMNS ]; then
  export COLUMNS=$(tput cols)
fi
</code>

<p>I presume drush uses this information to calculate layout of output.</p>


<p>However when running as a cron job COLUMNS is not set and tput gives the above error.</p>

<p>To resolve this specify a COLUMNS value in your cron job, setting an appropriate size for viewing in email</p> 

<p>cron now runs the following for me.

<code>
#!/bin/bash

cd /var/www/mysite/public_html

COLUMNS=80 /home/me/bin/drush cron
</code>
