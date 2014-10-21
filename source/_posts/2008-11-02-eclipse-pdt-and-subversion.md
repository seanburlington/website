---
layout: post
title: Eclipse PDT and Subversion
created: 1225646494
categories:
- php
- eclipse
- ubuntu
- svn
---
<h2>
Version conflicts to be aware of
</h2>
<p>
Ubuntu 8.10 (Intrepid Ibex) now ships with Subversion 1.5 
</p>
<p>
You can't use a svn 1.4 client and a svn 1.5 client on the same working copy.
</p>
<p>
While the subversion integration in Eclipse is great I still prefer to do some things on the command line and some with kdesvn.
</p>
<p>
Then you need to upgrade your subclipse plugin to subclipse 1.4
</p>
<p>
If you can - then upgrade to Eclipse 3.4 
</p>
<p>
But Eclipse 3.4 doesn't run the latest stable version of PDT - and last time I tried to use an Integration build it was unusable - I may try again sometime but right now I want a small upgrade.
</p>
<p>
I followed this instructions here http://subclipse.tigris.org/install.html
</p>
<p>
But Eclipse reported a &quot;Network problem&quot;
</p>
<p>
So I downloaded the zip file<br />
http://subclipse.tigris.org/files/documents/906/43792/site-1.4.5.zip
</p>
<p>
Unpacked it in a folder on my local webserver, pointed Eclipse at this location and the installation worked!
</p>
<p>
Phew - I have a working Eclipse for PHP development on Ubuntu 8.10 
</p>
