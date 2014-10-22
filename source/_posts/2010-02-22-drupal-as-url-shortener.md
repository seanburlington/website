---
layout: post
title: Drupal as URL shortener
created: 1266842622
comments: true
categories:
- drupal
- shorturl
---
Drupal has a couple of modules which allow you to produce your own tinyurl.com type website - complete with your own tracking etc.

This has been extended for use by the US government at http://go.usa.com/ and the code re-released to the community.

This mainly adds statistics gathering and reporting 

Unfortunately the module maintainer has chosen not to integrate these changes back into the module at drupal.org  - issue here : http://drupal.org/node/520588

So now the patch doesn't apply cleanly unless you checkout an old version of the module from CVS like this 

NB the password for anonymous access to CVS is "anonymous"

<code>
cvs -d :pserver:anonymous@cvs.drupal.org:/cvs/drupal-contrib login
cvs -d:pserver:anonymous@cvs.drupal.org:/cvs/drupal-contrib co contributions/modules/shorturl
cd contributions/modules/shorturl/
cvs update -r DRUPAL-6--1  -D 2009-12-01
wget http://drupal.org/files/issues/shorturl_1.patch
patch -p0 < shorturl_1.patch
</code> 

Update:

I've managed to merge both branches of development and the bugfix at http://drupal.org/node/627668 

This module is very much a development version - I've incorporated several people work and the result seems to work OK - but test before using. 
 
Download an updated version of the module
