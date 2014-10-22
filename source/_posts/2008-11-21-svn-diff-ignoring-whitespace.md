---
layout: post
title: SVN diff ignoring whitespace
created: 1227265738
comments: true
categories:
- svn
---
<p>
It's often handy to look at the changes made by a commit ignoring whitespace changes.
</p>

<p>This is often required when a dveloper has made some formatting changes and you just want to see the functional differences.
<code>
svn diff --diff-cmd diff -x -uw 
</code>
