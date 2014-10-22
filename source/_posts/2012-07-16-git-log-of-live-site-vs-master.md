---
layout: post
title: Git log of live site vs master
created: 1342450862
comments: true
categories:
- git
---
One liner to grab a git log summarising what will change when you push teh next release.

For this to work you need to keep the deployed tag in VERSION.TXT


<code>git log --oneline --graph $(GET http://www.example.com/VERSION.TXT)..$(git describe --abbrev=0 --tags origin/master)</code>
