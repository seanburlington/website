---
layout: post
title: Log output of a script to a file
created: 1342104408
comments: true
categories:
- bash
---
Nice bit of bash fu I discovered today

Add this snippet to the top of scripts and the output of lines below will be tee'd to a logfile.

Handy for those scripts you always want a log of


<code>
#!/bin/bash

# log all output
[ -d ~/logs/ ] || mkdir ~/logs/
exec > >(tee -a ~/logs/${release}.log)
exec 2> >(tee -a ~/logs/${release}.log)

# do stuff ...
</code>
