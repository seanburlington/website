---
layout: post
title: Drupal Live and Dev sync
created: 1248354066
categories:
- drupal
- sql
---
<p>
When developing Drupal one often needs to pull recent copies of the live database into the dev environment.
</p>
<p>
Loading a dump into the dev database will update any existing tables, add any new ones - but it won't remove tables from the dev environment that re not in live.
</p>
<p>
This causes problems with Drupal as module install and update hooks may need to create tables which don't yet exist on live. 
</p>
<p>
My solution which assumes you have .my.cnf set up to provide login locally is below.
</p>
<code>
# dump live db
ssh live "mysqldump livedb | gzip > /tmp/livedb.sql.gz"
# download live db
scp live:/tmp/livedb.sql.gz /tmp
# clean out dev db
mysql -BNe "show tables" devdb | awk '{print "drop table " $1 ";"} | mysql devdb
# copy live db to dev
zcat /tmp/livedb.sql.gz | mysql devdb
# make sure test mails never go to real users!
echo "update users set mail='me@example.com'" | mysql devdb
</code>
