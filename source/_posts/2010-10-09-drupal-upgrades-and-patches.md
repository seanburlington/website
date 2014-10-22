---
layout: post
title: Drupal upgrades and patches
created: 1286648495
comments: true
categories:
- drupal
- svn
- drush
- drupal planet
- patches
- upgrading
---
Reading <a href="http://www.drupaler.co.uk/users/gregharvey">Greg</a>'s <a href="http://www.drupaler.co.uk/blog/security-releases-dont-work/504">post on security upgrades</a> and a few mentions of patches in the following discussion got me thinking about upgrade methods.

The standard Drupal method is to delete existing files and unpack a tarball to replace the old version - I find this method unappealing because: I keep my code in subversion so don't want to delete the .svn subdirectories, and sometimes I have patches applied that I don't want to loose.

Drush provides a significant step up for managing updates, it's really easy to use and replaces just files not the directory structure so it plays well with subversion.

So I had a look around for methods to upgrade Drupal via patches (I really don't understand why this isn't the default) and I found

A whole lot of ready made patches
http://fuerstnet.de/en/drupal-upgrade-easier

A handbook page about patch upgrades
http://drupal.org/node/359234 

And a script to generate patch files
http://2bits.com/articles/upgrading-drupal-5-2-installations-to-5-3-security-releases-using-a-single-patch.html

Which is really cool - but all aimed at core - so I've created a modified version which also works for modules (attached)

The main advantage of this method is that when patches have been applied to a live site but these patches haven't been accepted upstream - then it is still easy to upgrade to new releases - and should the patch later be accepted upstream the new release will generate a patch conflict alerting you to the relevant changes - and allowing you to choose how to proceed.

I don't recommend this technique for newbies, for most people drush updates are the way to go.

But if you find yourself maintaining patches on core or contrib modules that aren't moving through the issue queue - then maybe this may be helpful.
 

 
