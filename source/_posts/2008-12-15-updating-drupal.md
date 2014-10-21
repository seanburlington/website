---
layout: post
title: Updating Drupal
created: 1229380293
categories:
- drupal
- mysql
- sql
---
<p>
For most of 2008 I've been working on a large Drupal installation (around 10 developers,  something like 100 custom modules, 17 languages, split over 2 sites).
</p>
<p>
This all adds up to a lot of updates, and schema changes.
</p>
<p>
Drupal's hook_install, and hook_update_N functions are pretty good, but not perfect at bringing order to this chaos.
</p>
<p>
These functions provide a basic way for developers to provide database installation and update functions, it's great that these can combine full code functionality (eg for data migration) synchronised with schema changes. 
</p>
<p>
As we have  something like 10 Drupal installs fro various, stage, test and UAT purposes, plus 2 per developer - having these updates scripted is essential. 
</p>
<p>
But all too frequently we have issues 
</p>
<ul>
	<li>Loading a MySQL backup on top of an existing database leaves newly created  tables in place even though they don't exist in the backup (solution - always drop and recreate the database before loading a backup).</li>
	<li>A developer changes an update hook - assuming incorrectly that it hasn't been run yet.</li>
	<li>An update hook misses some functionality that the developer added to their own database - but forgot to put in the hook.</li>
</ul>
<p>
Another problem is that the update interface gives no warning of the changes about to be enacted - you get a list of SQL command run afterwards. 
</p>
<p>
In short I've found that this update system is targeted more at distribution of open source code to the public, and doesn't work so smoothly for rapid development amongst a largish team. 
</p>
<p>
We're still on Drupal 5 and are not likely to upgrade - the benefits just aren't worth the costs for such a large codebase.
</p>
<p>
I'm curious though about Drupal 6's schema API, it seems like it ought to be possible to use this to run an update that doesn't just make changes based on version numbers. It could actually examine the existing schema, compare this to the required one - report changes it suggests and run them after they are approved.
</p>
<p>
It could also be used in development to verify that the developers altered schema is properly recorded in the code. 
</p>
<p>
I expect that level of functionality may be some way off though. 
</p>
<p>
http://drupal.org/project/schema
</p>
<p>
http://drupal.org/node/146843 
</p>
<p>
&nbsp;
</p>
