---
layout: post
title: "Local yum cache repo"
date: 2015-03-03 21:17:31 +0000
comments: true
categories: 
   - yum
   - offline
---

When I'm working on ansible or docker with machine images that get rebuilt regularly it's a pain waiting for slow downloads

Also if I want to work on teh train

I'm working on a process to setup a local repo with the stuff that I need

This script downloads the rpms I have installed

```bash
yum install yum-utils && sudo yumdownloader --destdir=./ $(rpm -qa --qf "%{NAME} ")
```

Next I need to drop them in a web dir, run createrepo and finally make sure this repo is enabled and prioritised in my test envs

Writing this part up now even though I haven't finished - as I don't want to loose this info.