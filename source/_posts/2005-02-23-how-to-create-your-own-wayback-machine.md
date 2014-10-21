---
layout: post
title: ! 'How to create your own Wayback Machine '
created: 1109174885
categories:
- linux
- apache
---
<p>
I’ve long been impressed with the <a href="http://www.archive.org/">wayback machine</a> and found it very useful to find things that have disappeared from the rest of the Internet.
</p>
<p>
I use <a href="http://www.cvshome.org/">cvs</a> a lot in software
development and find it a real life saver to be able to restore any
file I have been working on at any point in it’s history. This really
helps me to find out when and why things went wrong, saving me from
making the same mistakes again.
</p>
<p>
What I wanted was a system that would give me some of this functionality - but for file structures outside of my direct control.
</p>
<p>
Here is my recipe:
</p>
<p>
Install <a href="http://namazu.org/%7Esatoru/pdumpfs/">pdumpfs</a> (you are running Linux/Unix aren’t you?)
</p>
<p>
pdumpfs is a simple daily backup system written in Ruby (ruby(1)),
which is similar to Plan9’s dumpfs that preserves every daily snapshot.
</p>
<p>
Back up your home directory with pdumpfs, and you can retrieve any past day’s snapshot of any file.
</p>
<p>
pdumpfs constructs each day’s snapshot in the directory named YYYY/MM/DD under the destination directory.  All<br />
source files are copied to the snapshot directory for the first time, and on and after the second time, pdumpfs<br />
copies only updated or newly created files and stores unchanged files as hard links to the files of the previous<br />
day’s snapshot to save disk space.
</p>
<p>
Set up a cron job to run pdumpfs /sourcedir /backupdir
</p>
<p>
That gives you the archive to work with - I wanted to back up a website be able to access each days archive directly.<br />
To do this I used Apache’s VirtualDocumentRoot directive together with
a wildcard DNS record so that I access any days archive from a url like
http://20050223.wayback/ (where the number is the date as YYYYMMDD).<br />
My Apache config looks like:
</p>
<pre>
NameVirtualHost *:80
&lt;VirtualHost *:80&gt;
ServerName *.wayback
UseCanonicalName Off
# this log format can be split per-virtual-host based on the first field
LogFormat &quot;%V %h %l %u %t &quot;%r&quot; %s %b&quot; vcommon
CustomLog /var/log/apache2/wayback-access.log vcommon
VirtualDocumentRoot /var/www/wayback/%1.1%1.2%1.3%1.4/%1.5%1.6/%1.7%1.8/origdirname
&lt;/VirtualHost&gt;
</pre>
<p>
My wildcard DNS entry is just <br />
*.wayback  IN A 127.0.0.1<br />
In the zone file for my local domain (if it wasn’t my local domain I’d
need to specify the fully qualified name of the server in the apache
config.
</p>
<p>
Altogether this creates an archive where each days version of the
website is under /somedir/YYYY/MM/DD/website/, the wildcard DNS means
that any request to YYYYMMDD.wayback is sent to the right server,
wildcard server name will always match, the virtual document root reads
the first part of the server name and interprets it in the form needed
to get the right path. Hey presto we’ve gone back in time and see the
website as it was then!
</p>
<p>
More about Apache’s <a href="http://httpd.apache.org/docs-2.0/mod/mod_vhost_alias.html#interpol">Directory Name Interpolation</a>, <a href="http://httpd.apache.org/docs-2.0/vhosts/mass.html">Dynamically configured mass virtual hosting</a>, and <a href="http://httpd.apache.org/docs-2.0/mod/mod_log_config.html#formats">Custom Log Formats</a>.
</p>
