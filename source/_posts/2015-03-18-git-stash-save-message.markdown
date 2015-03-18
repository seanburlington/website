---
layout: post
title: "git stash save message"
date: 2015-03-18 14:36:59 +0000
comments: true
categories: 
  - git
---

git stash is a great way to save work switch branch and then get back your half completed work from earlier

But I work on many projects, am often playing around with something, get pulled onto the next thing - and I often have stashed work kicking around

By default `git stash` saves the work but the `git list` just gives some id for each stash like

```
stash@{0}: WIP on master: 2166e26 foo
stash@{1}: WIP on master: 2166e26 foo
stash@{2}: WIP on master: 2166e26 foo
stash@{3}: WIP on master: 2166e26 foo
stash@{4}: WIP on master: 2166e26 foo
```


better is to do

```bash
git stash save "some description of the work"
```

Then laster `git stash list` can tell you what each stash is

```
stash@{0}: On master: bufix #123
stash@{1}: On master: feature foo
stash@{2}: On master: feature abc
stash@{3}: On master: feature xyz
```

Much better for reminding me what these things were.