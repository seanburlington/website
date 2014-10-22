---
layout: post
title: Drupal is not Test Friendly
created: 1254306836
comments: true
categories:
- drupal
- unit testing
---
<p>
I was originally excited about the embrace that Drupal seemed to have given to testing.
</p>
<p>
However after spending some time with it I've concluded that Drupal really isn't very test friendly.
</p>
<p>
Most tests for Drupal are integration tests not unit tests.
</p>
<p>
That is to say that they test a bunch of components together - not each bit separately.
</p>
<p>
This is because Drupal components (modules or functions) are not well encapsulated, global variables are used, data is cached within functions,  passed via the database etc.  
</p>
<p>
THis makes it much harder for the developer to create tests that validate functional increments, and means the suite of tests run very slowly.
</p>
<p>
A while ago I tried to run the tests for Drupal 7 - but gave up waiting after an hour. I was very surprised to find that both database and web server were being hit hard - when I was running on the command line!
</p>
<p>
Even the integration level testing isn't all that great, it runs in an environment without JavaScript support - so the AJAX functionality can't be tested. 
</p>
<p>
Testing is better than not testing - but having gotten into testing I've found Drupal's environment frustrating. 
</p>
<p>
&nbsp;
</p>
<p>
&nbsp;
</p>
