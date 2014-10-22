---
layout: post
title: Make Drush support PHP-5.1
created: 1262178978
comments: true
categories:
- php
- drupal
- drush
- redhat
- json
---
<p>
Drupal has a fairly easy to meet set of requirements http://drupal.org/node/502452 
</p>
<p>
But Drupal projects are free to set their own rules in this area and Drush has used functions only available in PHP 5.2 - as far as I can see this is just the json functions.
</p>
<p>
Frustratingly the latest version of RedHat provides PHP 5.1 and this is the second time I've run into the problem with a client who uses RedHat and understandably wants to stick to the standard packages.
</p>
<p>
Drush provides command line access to Drupal functions and so is incredibly useful - but not quite critical enough for a platform re-evaluation. 
</p>
<p>
Since my project was using a JSON class anyway I decided to get Drush working using this class instead of requiring PHP 5.1  
</p>
<p>
<span class="status-body"><span class="entry-content"><a href="http://drupal.org/node/502452" target="_blank">http://drupal.org/node/502452</a> </span></span>
</p>
