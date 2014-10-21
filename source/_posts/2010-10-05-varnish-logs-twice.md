---
layout: post
title: Varnish logs twice
created: 1286285091
categories:
- linux
- varnish
---
The default configuration of varnish logs every request twice, once for the client and once for the backend communication 

edit the line in /etc/init.d/varnishncsa to something like

<code>
DAEMON_OPTS="-c -a -w $logfile -D -P $pidfile"
</code>

from the varnishncsa man page

<blockquote>
     -c          Include log entries which result from communication with a client.  If neither -b nor -c is specified, varnishncsa acts as if they both were.
</blockquote>
