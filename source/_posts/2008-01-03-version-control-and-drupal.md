---
layout: post
title: ! 'Version Control and Drupal '
created: 1199376753
categories:
- drupal
- svn
- cvs
---
I’ve
been using open source software and developing php for a decade or so
now - but until recently the two have been fairly seperate.
<div class="post-entry">
<p>
Now I’m working on Drupal I need to keep track of my work - and merge in the changes from ‘upstream’.
</p>
<p>
here’s the useful info I found …
</p>
<p>
Drupal advise<br />
Drupal.org » Forum » Support » Post installation : Repository setup<br />
<a href="http://drupal.org/node/118936">http://drupal.org/node/118936</a>
</p>
<p>
Vendor Branches<br />
<a href="http://svnbook.red-bean.com/en/1.0/ch07s04.html">http://svnbook.red-bean.com/en/1.0/ch07s04.html</a>
</p>
<p>
Subversion Externals<br />
<a href="http://svnbook.red-bean.com/en/1.0/ch07s03.html">http://svnbook.red-bean.com/en/1.0/ch07s03.html</a>
</p>
<p>
svn load dirs (need for upgrading the vendor release)<br />
<a href="http://docs.ofbiz.org/display/OFBIZ/SVN+Tips+-+svn_load_dirs+Vendor+Branch">http://docs.ofbiz.org/display/OFBIZ/SVN+Tips+-+svn_load_dirs+Vendor+Branch</a>
</p>
<p>
CVS to subversion scripts<br />
<a href="http://drupal.org/node/71232">http://drupal.org/node/71232</a>
</p>
<p>
Update Status (to track new modules)<br />
<a href="http://drupal.org/project/update_status">http://drupal.org/project/update_status</a>
</p>
<p>
In the end I’ve decided to put all my projects in one repository
(I’ll need to upgrade trac 0.11 soon to host project management on a
per project basis)
</p>
<p>
Each project has a copy of drupal core + contrib modules I plan to use svn:externals to link in my own modules
</p>
</div>
