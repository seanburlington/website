---
layout: post
title: Drupal and Change Management
created: 1203930395
comments: true
categories:
- drupal
- best practice
- cms
---
<p>
Any complex website that needs updating has to be tested without affecting the users of the live site.
</p>
<p>
The challenge then is how to replicate the changes made on your test site on the live site.
</p>
<p>
If all the changes are in code then version control systems such as svn and cvs solve this problem very neatly. 
</p>
<p>
But with a CMS such as Drupal some changes are inevitably required in the database. 
</p>
<p>
Managing these changes without affecting the site content can be tricky.
</p>
<p>
This isn't just a Drupal problem - I've encountered in on most web applications and CMS's I have worked on.
</p>
<p>
My current solution is based on very careful documentation of the database changes - but I'm always on the lookout for more automated solutions.
</p>
<p>
 
Three useful Threads on Drupal:
</p>
<ul>
	<li>http://groups.drupal.org/change-management-systems
	</li>
	<li>http://drupal.org/node/140430
	</li>
	<li>http://groups.drupal.org/node%252F786
	</li>
</ul>
<p>
There is also a macro recording facility in the devel module
http://drupal.org/project/devel
</p>
<p>
Also interesting is this work calculating the dependency diagram for Drupal modules
http://drupal.org/node/220945#comment-738292
</p>
