---
layout: post
title: CVS for subversion users
created: 1262190258
comments: true
categories:
- svn
- cvs
- reminder to self
---
<p>
I've been using version control for a long time, but I haven't used CVS much since the first day I tried Subversion.
</p>
<p>
(Git seems great but isn't the same kind of drop-in upgrade that CVS to Subversion was)
</p>
<p>
Things I forgot
</p>
<ul>
	<li>CVS doesn't do the nice recursive add that subversion does<br />
	At the start of a project you need to run <br />
	cvs import </li>
	<li>CVS expands keywords by default - this is a problem if like me you want to merge in changes from someone else CVS repository as both sites have changes teh keywords<br />
	Disable keyword changing by updating with<br />
	cvs up -d -ko</li>
	<li>CVS doesn't add back deleted directories<br />
	cvs up -d </li>
	<li>CVS doesn't have a nice equivilant of svn status<br />
	cvs -q up <br />
	Not quite the same as it will update stuff - but it does tell you which local files have changed</li>
	<li>Tagging seems OK but doesn't quite do the same thing<br />
	cvs tag</li>
</ul>
