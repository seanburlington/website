---
layout: post
title: Drupal Schema API has problems
created: 1245667238
comments: true
categories:
- php
- drupal
- sql
- orm
- schema api
---
<p>
<a href="http://www.lullabot.com/articles/drupocalypse-now-or-dangerous-integer-handling-drupal-write-record">An interesting post from Lullabot today</a> on problems with Drupal's Schema API and the <a href="http://www.google.co.uk/search?q=Twitpocalypse">Twitpocalypse</a>
</p>
<p>
It turns out that <a href="http://drupal.org/node/333788">the Schema API doesn't properly understand the difference between different types of integers</a> 
</p>
I was already concerned that 
<a href="http://drupal.org/node/200953">Schema API lacks the 'time' and 'date' type</a>
<p>
I don't really understand why the Drupal team has decided to try and roll it's own database abstraction layer, and make it a core part of the system in the current state. 
</p>
<p>
There seem to be <a href="http://drupal.org/project/issues/search/drupal?text=&amp;assigned=&amp;submitted=&amp;participant=&amp;status[]=Open&amp;priorities[]=1&amp;priorities[]=2&amp;categories[]=bug&amp;version[]=6.x&amp;component[]=database+system&amp;issue_tags=">quite a few bugs</a>
</p>
