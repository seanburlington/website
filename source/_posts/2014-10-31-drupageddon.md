---
layout: post
title: "Drupageddon"
date: 2014-10-31 18:30:52 +0000
comments: true
categories: 
- drupal
- security
- sql
- sql injection
- drupageddon
---

Drupal has been in the new today for all the wrong reasons

[Millions of websites hit by Drupal hack attack](http://www.bbc.co.uk/news/technology-29846539)

[Drupal sites had “hours” to patch before attacks started](http://arstechnica.com/security/2014/10/drupal-sites-had-hours-to-patch-before-attacks-started/)

[Drupal users: Assume your site was hacked if you didn't apply Oct. 15 patch immediately](http://www.pcworld.com/article/2841372/drupal-if-you-werent-quick-to-patch-assume-your-site-was-hacked.html)

[Did Drupal Drop The Ball? Users Who Didn't Update Within 7 Hours 'Should Assume They've Been Hacked'](http://www.forbes.com/sites/thomasbrewster/2014/10/30/did-drupal-drop-the-ball-users-who-didnt-update-within-7-hours-should-assume-theyve-been-hacked/)

The biggest headache for me was the Public Service Announcement https://www.drupal.org/PSA-2014-003 which is clearly written to alarm users into updating.

We did update our clients site - within 24 hours which at the time seemed pretty good considering the timezones and chaneg control processes involved.

Fortunately we also reload our entire database and other content on each deploy - so even though we took longer than 7 hours to update we consider we are pretty safe (never say 100%) and beyond that we have a lot of other security in place.

However I find myself wondering what else we could have done.

I wish we had a member on the drupal security team - that seems to have helped some people.

I see now there were a couple of (low key) advance notices https://groups.drupal.org/node/445893 https://twitter.com/drupalsecurity/status/522128826101669888

I will try to pay better attention to those in the future, but we may also have to enhance our out of hours work, the security annoucment came in at the end of the day - perhaps we will ahve to work overnight another time to review, test, and help the client upgrade.

Hopefully good will come from the thread at [Follow up Drupageddon responsibly](https://groups.drupal.org/node/447468) 

Drupal will need to learn and grow from this.
