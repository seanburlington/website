---
layout: post
title: Bug in Trac on Ubuntu Jaunty
created: 1265104161
comments: true
categories:
- ubuntu
- trac
---
<p>
There is a bug in Ubunty Jaunty which cause Trac to have errors.
</p>
<p>
 Attachments do not work, the admin interface for milestones doesn't work properly - and there may be other issues.
</p>
<p>
The bug report is at https://bugs.launchpad.net/ubuntu/+source/trac/+bug/369792
</p>
<p>
And the solution is 
</p>
<p>
&quot;go to <a href="http://packages.ubuntu.com/karmic/trac">http://packages.ubuntu.com/karmic/trac</a>
and scroll all the way down. There you'll find a download link for the 
karmic package which you can download and install via
</p>
<p>
sudo dpkg -i trac_0.11.5-2ubuntu1_all.deb&quot;
</p>
<p>
&nbsp;
</p>
