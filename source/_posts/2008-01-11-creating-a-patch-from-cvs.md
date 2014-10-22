---
layout: post
title: ! 'creating a patch from cvs '
created: 1200067953
comments: true
categories:
- drupal
- cvs
---
specifically
I wanted to create a patch equal to the changes between two versions of
Drupal - but it turns out that a packaging script adds some info to
releases that isn’t in the cvs version so this doesn’t quite do what I
wanted.
<div class="post-entry">
<p>
it’s still useful though …
</p>
<ul>
	<li>checkout the current version</li>
	<li>generate the patch as a diff between the previos version and this one</li>
	<li>optionally run a diff to compare the two versions (cvs and svn) to check they are the same</li>
</ul>
<p>
<br />
cvs -z6 -d:pserver:anonymous:anonymous@cvs.drupal.org:/cvs/drupal checkout -d drupal5 -r DRUPAL-5-6 drupal
</p>
<p>
cd drupal<br />
cvs diff -N -u -rDRUPAL-5-5 -r DRUPAL-5-6 &gt; ../drupal-5-5-to-5-6.txt<br />
cd ..<br />
diff -r drupal-cvs/ drupal | grep -v .svn | grep -v CVS | less<br />
</p>
<p>
In eclipse open the svn drupal project - go to teams - apply patch
</p>
<p>
and (except for the packaging stuff) you have an updated drupal for your svn repository.
</p>
</div>
