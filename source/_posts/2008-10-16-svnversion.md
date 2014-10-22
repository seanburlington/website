---
layout: post
title: svnversion
created: 1224152740
comments: true
categories:
- programming
- svn
---
<p>
I just discovered a nifty little utility
</p>
<p>
Often working copies are only partially updated, this command gives a very quick command-line summary of the state of the working copy.
</p>
<p>
It's not as rich an output as kdesvn which will colour code all the updateable files, but its a standard part of svn so should always be available. 
</p>

<h2>Name</h2>
<p>
svnversion — Summarize the local revision(s) of a working                    copy.
</p>
<div class="refsect1">
<h2>Synopsis</h2>
<pre class="programlisting">
svnversion [OPTIONS] WC_PATH [TRAIL_URL]
</pre>
</div>
<div class="refsect1">
<h2>Description</h2>
<p>
<span><strong class="command">svnversion</strong></span> is a program for
summarizing the revision mixture of a working copy.  The
resultant revision number, or revision range, is written to
standard output.
</p>
<p>
TRAIL_URL, if present, is the trailing portion of the
URL used to determine if WC_PATH itself is switched
(detection of switches within WC_PATH does not rely on
TRAIL_URL).
</p>
</div>
<strong>Examples</strong><br />
<div class="refsect1">
<p>
If the working copy is all at the same revision (for
example, immediately after an update), then that revision is
printed out:
</p>
<pre class="screen">
$ svnversion .
4168
</pre>
<p>
For a mixed-revision working copy, the range of
revisions present is printed:
</p>
<pre class="screen">
$ svnversion .
4123:4168
</pre>
</div>
