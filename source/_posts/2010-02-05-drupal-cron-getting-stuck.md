---
layout: post
title: Drupal Cron getting stuck
created: 1265367726
comments: true
categories:
- drupal
- cron
- error
---
<p>
I've just run into the drupal cron problem again  
</p>
<p>
Cron fails and the error log says 
</p>
<p>
&quot;Attempting 
to re-run cron while it is already running.&quot;
</p>
<p>
&nbsp;
</p>
<ul>
	<li>delete from variable where name='cron_semaphore';</li>
	<li>clear caches</li>
	<li>run cron from the web page </li>
</ul>
<p>That seems to do the trick.</p>

<p>Now cron runs OK fom drush or web.</p>
