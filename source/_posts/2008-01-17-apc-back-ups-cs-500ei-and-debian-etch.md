---
layout: post
title: ! 'APC Back-UPS CS 500Ei and Debian etch '
created: 1200586353
comments: true
categories:
- linux
- debian
---
Just got a new UPS and it’s working nicely :-) 
<div class="post-entry">
<p>
Running on Debian Etch I had to upgrade the NUT package but this
worked very simply by bringing in the one from Lenny (in testing)
</p>
<p>
added to /etc/apt/sources.list<br />
deb-src http://ftp.uk.debian.org/debian/ lenny main contrib non-free
</p>
<p>
then ran<br />
apt-get build-dep nut
</p>
<p>
as normal user<br />
apt-get source nut<br />
cd to nut dir<br />
dpkg-buildpackage -rfakeroot -uc -b
</p>
<p>
then as root installed the .deb created 
</p>
<p>
After that it was just a case of reading the docs and configuring.
</p>
<p>
I’m using the UPS for my desktop and monitor - it’s drawing 25% load
with a predicted battery runtime of about 45minutes (which I don’t
quite believe)
</p>
</div>
