---
layout: post
title: Show what svn update is about to do
created: 1231932716
comments: true
categories:
- svn
---
When you want to see what svn update is about to do you may try 

<code>svn update --dry-run</code>

But this doesn't work.

You can get the results you need by running

<code>svn status -u </code>
