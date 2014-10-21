---
layout: post
title: Handy one-liners
created: 1227362978
categories:
- linux
- programming
- perl
comments: true
---

While creating websites I often find the need to manipulate files in all sorts of ad-hoc ways.


Things that are hard to do by hand, but you don't want to write a whole program for - you'll just use it once and throw it away.


Linux/Unix excels at this sort of task - there is a rich selection of tools and plenty of ready made recipes.


From: 


http://www.ibm.com/developerworks/linux/library/l-p101/


I often use

```bash
> cat test
aaa
bbb
ccc
ddd
aaa
> perl -pi -e's/aaa/bbb/' test
> cat test
bbb
bbb
ccc
ddd
bbb
```


http://student.northpark.edu/pemente/sed/sed1line.txt gives me a way to print out just the lines near an error is being generated (handy when there is one error line in a gigabyte of data) 

```bash
sed -n '7560,7570p' my_big_file.txt
```

Though day to day grep, find, locate and thier friends  usually do all I need.


I tried working on Windows a while ago - but found I just couldn't work effectively without these tools. 

