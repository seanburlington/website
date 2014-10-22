---
layout: post
title: git files with local changes I don't want committed
created: 1364213713
comments: true
categories:
- git
---
<p>I'm working on a project where I find I want to semi-regularly adjust a config file for local testing, but want to be sure I don't commit that file by mistake.</p>

<p>Seems the best approach is</p>

<code>git update-index --skip-worktree $filename</code>

<p>This tells git to skip this file when I push, if the remote file changes it will warn me </p>

<p>To switch back</p>

<code>git update-index --no-skip-worktree $filename</code>


<p>There is also a assume-unchanged option - but this is aimed more at performance and bug workarounds - it realy does assume the file is unchanged - which in my case is incorrect.</p>
 
