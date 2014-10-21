---
layout: post
title: Changing default port of memcache on Centos 6
created: 1352724704
categories:
- sysadmin
- centos
- rhel
- selinux
---
<p>One of those things that just took me a lot longer than I expected...</p>


<p>Changing memcache port sdeems simple enough - just edit 
/etc/sysconfig/memcached and change the PORT value</p>

<p>BUT on a new centOS install memecache failed to start on any non-standard port.</p>

To see any error message I had to edit the file /etc/init.d/memcached</p>

<p>and change the start line to </p>

<code>

daemon --pidfile ${pidfile} memcached -d -v -p $PORT -u $USER  -m $CACHESIZE -c $MAXCONN -P ${pidfile} $OPTIONS
</code>

<p>Just adding the -v makes output verbose and I could see an error like </p>

<code>
memcache failed to listen on TCP port 11311 : Permission denied
</code>

<p>At this point I realised selinux was enabled by default, I tend to forget about this as it is so common for it to be disabled.</p>

<p>In order to add a new allowed port I added the following packages to edit selinux rules<p>

<code>policycoreutils-python
setroubleshoot-server</code>


<p>To check the name of the memcache port</p>
<code>
semanage port -l | grep memcache
</code>
<p>Then to allow the new port</p>
<code>
sudo semanage port -a -t memcache_port_t -p tcp 11311
</code>

<p>And now memcache works on the port I need for this project.</p>

<p>Sadly I don't see any good puppet modules to help with this, and it still seems selinux is very commonly disabled as it is tricky to work with.</p>


