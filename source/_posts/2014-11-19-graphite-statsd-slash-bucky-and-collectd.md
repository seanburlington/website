---
layout: post
title: "Graphite statsd/bucky and collectd"
date: 2014-11-19 10:09:23 +0000
comments: true
categories: 
- graphite
- bucky
- statsd
- collectd
- devops
- metrics

---

> Graphite is a highly scalable real-time graphing system.

It took me a while to realise but the data input to graphite is *incredibly* simple 

The message input format is just 

```
metric_path value timestamp\n

So for example, "foo.bar.baz 42 74857843"
```

Wow: just a label the number you want to store and the timestamp it relates to.

That's really basic, there is nothing there about what kind of data it is, no difference between something you want to count (say page hits) and a number you want to average (like load)

[Configuring Graphite for StatsD](https://github.com/etsy/statsd/blob/master/docs/graphite.md) is a *very* important doc to read if you want to use these tools together. 

The default config in graphite keeps data at 1 minute resolution for 1 day **and then discards it** and if you are sending data to graphite every 10 seconds graphite has to figure out how to convert 6 data points (or some nulls and some data) to 1 data point for the minute. 

You really need the statsd specific config to ensure counts are not averaged and infrequent data is not dropped.

I needed to install on Centos using just official and EPEL packages, I wanted to use collected to gather system metrics and while version 5 can log direct to graphite version 4 ships with Centos 6.5 and that can't log direct.

In any case I wanted to use statsd to allow easy logging of custom data from production code, the original written by etsy is a node service and probably doesn't run with stock packages on Centos,

Centos does provide a python-bucky package which acts both as a statsd server and as a bridge to collectd.

The full list of packages I needed is 

 * graphite-web
 * graphite-web-selinux
 * python-carbon
 * python-whisper
 * collectd
 * python-bucky

Apache config


```apache

<VirtualHost *:80>
  ServerName graphite.example.com

  ## Vhost docroot
  DocumentRoot "/var/www/html"
  ## Alias declarations for resources outside the DocumentRoot
  Alias /grafana/ "/var/www/grafana/"
  Alias /media/ "/usr/lib/python2.6/site-packages/django/contrib/admin/media/"



  ## Directories, there should at least be a declaration for /var/www/html


  <Directory "/var/www/html">
    Options Indexes FollowSymLinks MultiViews
    AllowOverride None
    Order allow,deny
    Allow from all
  </Directory>

  ## Load additional static includes


  ## Logging
  ErrorLog "/var/log/httpd/graphite.example.com_error.log"
  ServerSignature Off
  CustomLog "/var/log/httpd/graphite.example.com_access.log" combined



  WSGIImportScript /usr/share/graphite/graphite-web.wsgi application-group=%{GLOBAL} process-group=%{GLOBAL}
  WSGIScriptAlias / "/usr/share/graphite/graphite-web.wsgi"

  ## Custom fragment

    <Location "/content/">
        SetHandler None
    </Location>

    <Location "/media/">
        SetHandler None
    </Location>

</VirtualHost>
```


Graphite Config

Storage-schames.conf

```
[carbon]
pattern = ^carbon\.
retentions = 60:90d

[stats]
pattern = ^stats.*
retentions = 10s:6h,1min:6d,10min:1800d


# unsure if this is redundant - does .* match stats_counts ?
[stats_counts]
pattern = ^stats_counts.*
retentions = 10s:6h,1min:6d,10min:1800d


# collectd 
[com]
pattern = ^com.*
retentions = 10s:6h,1min:6d,10min:1800d

[default_1min_for_1day]
pattern = .*
retentions = 60s:1d
```

storage-aggregation.conf 

```
[min]
pattern = \.lower$
xFilesFactor = 0.1
aggregationMethod = min

[max]
pattern = \.upper(_\d+)?$
xFilesFactor = 0.1
aggregationMethod = max

[sum]
pattern = \.sum$
xFilesFactor = 0
aggregationMethod = sum

[count]
pattern = \.count$
xFilesFactor = 0
aggregationMethod = sum

[count_legacy]
pattern = ^stats_counts.*
xFilesFactor = 0
aggregationMethod = sum

[default_average]
pattern = .*
xFilesFactor = 0.3
aggregationMethod = average

```

Statsd caught me out with a debug mode that *only* prints to stdout and doesn't actually log any data to graphite, I expected debug mode to print out data in addition to regular duties.

I did need to make statsd listen on all networks instead of just localhost, and still need to wrap it properly as a service.


Edit collectd.conf to enable the plugins you want, the only problem I had here was collectd silently dying if I had a config error.

 

You need to setup an initial graphite users database

More details at http://obfuscurity.com/2012/04/Unhelpful-Graphite-Tip-4

```bash
/usr/bin/python /usr/lib/python2.6/site-packages/graphite/manage.py syncdb
```


Writing this up now it all seems quite simple - but I haven't really found it so, I think the main problem has been understanding what graphite is actually doing, and not taking the trouble to optimise that config as a first step.

Pages I found useful 

 * https://kevinmccarthy.org/blog/2013/07/18/10-things-i-learned-deploying-graphite/
 * http://blog.pkhamre.com/2012/07/24/understanding-statsd-and-graphite/
 * http://statsd.readthedocs.org/en/latest/types.html#counters
 * http://code.hootsuite.com/accurate-counting-with-graphite-and-statsd/

