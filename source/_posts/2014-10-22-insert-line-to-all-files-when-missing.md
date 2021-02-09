---
layout: post
title: "Insert line to all files when missing"
date: 2014-10-22 16:31:31 +0100
comments: true
categories: 
- one-liners
- blogging
- octopress
---

In this case to turn on comments in all posts for this blog

All files that don't have comments at the start of a line get "comments: true" inserted on the 5th line

```bash
for f in * ; do grep -q "^comments" $f || sed -i '5 i\
comments: true' $f ; done
```

Maybe Octopress has a way to globally enable comments - but I didn't find it and this was quick


