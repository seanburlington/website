---
layout: post
title: Eclipse 3.4 (Ganymede) First Impressions
created: 1215361202
comments: true
categories:
- php
- eclipse
- programming
---
<p>
Well the new version of Eclipse (3.4 or Ganymede) is out and I've been trying it out. So far I've just installed it, adding in the components I want; and generally trying to see what's new. 
</p>
<p>
&nbsp;
</p>
<div style="text-align: center">
<img src="/sites/default/files/u1/eclipse-splash_0.png" alt="Eclipse Splash Screen" width="300" height="195" />
</div>
<h2>
Installation 
</h2>
<p>
I'm running Linux (Ubuntu 8.04) 
</p>
<p>
Installing Eclipse 3.4 was a pain: it turns out that Eclipse requires web browser components form Firefox - and didn't work with the default Ubuntu package that I had.  Once I found out that I needed to upgrade my xulrunner-1.9 package things were OK.
</p>
<p>
If you have these problems see
</p>
<ul>
	<li><a href="http://www.eclipse.org/swt/faq.php#browserlinux">www.eclipse.org/swt/faq.php</a></li>
	<li><a href="https://bugs.eclipse.org/bugs/show_bug.cgi?id=213194">bug 213194</a> (and it's duplicates)</li>
</ul>
<p>
Then I needed to install various components, the Eclipse  software updates management is much improved on earlier version, dependencies are resolved automatically. But I still found it hard to work out which packages provide which features. There was quite a lot of back and forth - install, test, install some more ...
</p>
<p>
Particularly tricky was the subversive svn connector. 
</p>
<h2>Core Eclipse</h2>
<p>
While there appear to be lots of small improvements (better updates UI, case preserving search and replace regex...) there doesn't seem to be anything here to get me to upgrade in itself.
</p>
<h2>PDT - PHP Development</h2>
<p>
This isn't actually part of Ganymede, but I downloaded and installed a nightly build as this is the part of Eclipse that I use the most heavily.
</p>
<p>
Again the changes are incremental - but as this is stuff I use so much small changes can make a big difference.
</p>
<p>
See <a href="http://wiki.eclipse.org/PDT/1.1_Plan">PDT 1.1 Plan</a>
</p>
<dl><dt>Mark Occurrences</dt>
<dd>Select a variable or function and all other occurrences of this in the current editor are highlighted (those offscreen are shown in the 'ruler'</dd>
<dt>Better OO support</dt>
<dd>I haven't tested this out enough yet - but there seems to be better support for showing the relationship between classes</dd>
<dt>Code Completion</dt><dt>
<br />
</dt><dd>Previous versions of PDT have relied almost entirely on doc comments for code completion, it looks like this version does a better job where there are no doc comments</dd>
</dl>
<p>
This doesn't look like a whole heap of changes, I'd really hoped for some better refactoring support, but what is there is welcome.
</p>
<h2>Subversive</h2>
<p>
I've always used subclipse before - after reading <a href="http://www.barneyb.com/barneyblog/2006/10/26/subclipse-vs-subversive/">subclipse-vs-subversive</a> and going with the recommendation - but that was a couple of years ago.
</p>
<p>
Now subversive is a standard part of Eclipse - but annoyingly you do have to download the SVN connectors separately - and the documentation is clearly written by a non-english speaker.
</p>
<p>
Adding the SVNKit component from Polarion finally got things working for me.
</p>
<p>
It doesn't look all that different so far - except it does recognise the trunk/tags/branches convention which is nice.
</p>
<h2>Mylyn</h2>
<p>
This does appear to have major advances with far deeper integration to Eclipse.
</p>
<blockquote>
	Mylyn is a Task-Focused Interface for Eclipse that reduces information overload and makes multi-tasking easy.
</blockquote>
<p>
If you haven't used Mylyn yet - you're missing out.
</p>
<p>
Mylyn integrates with your task list or ticketing system, keeps track of the files you open for a task, filters out irrelevant info, reopens the right files if you re-open a task, and fills out half the ticket comment for you when you commit work.
</p>
<p>
There's too long a list of great stuff - see <a href="http://www.eclipse.org/mylyn/new/">Mylyn 3.0 new and noteworthy</a>
</p>
<h2>Communication Framework</h2>
<p>
This part of eclipse is completely new to me; I love the idea of being able to jointly edit a file with a colleague.
</p>
<p>
&nbsp;
</p>
<ul>
	<li><a href="http://codesurgeonblog.com/2008/06/cola-real-time-shared-editing.html">screencast</a></li>
	<li><a href="http://wiki.eclipse.org/RT_Shared_Editing">Real Time Shared Editing</a></li>
	<li><a href="http://wiki.eclipse.org/DocShare_Plugin">Doc Share Plugin</a></li>
	<li><a href="http://wiki.eclipse.org/ECF_Servers">ECF Servers</a></li>
</ul>
<p>
I have yet to get this working (requires a suitable colleague and server).
</p>
<p>
It's also possible to run an IRC client inside eclipse (and several proprietary chat protocols) - though I'm less convinced this is useful.
</p>
<h2>Datatools</h2>
<p>
So far this seems like a step backwards, there is an SQL query builder (but I'm happy on the command line); but I found the new connection wizard really confusing, and while I have connected to a database - I can't seem to browse the tables.
</p>
<h2>Web Tools</h2>
<p>
Seems like more incremental improvements, lots of little productivity gains.
</p>
<p>
<a href="http://www.eclipse.org/webtools/releases/3.0.0/newandnoteworthy/sourceediting.php">webtools source code editing new and noteworthy</a>
</p>
<h2>Summary</h2>
<p>
So far it doesn't seem like there are any compelling reasons to upgrade: if you're happy with Eclipse as you have it - stay with it. If the upgrade path was easier maybe I'd have a different answer.
</p>
<p>
Having got this far though the improvements look generally useful; I'll go ahead and start using Ganymede for day-to-day use.
</p>
