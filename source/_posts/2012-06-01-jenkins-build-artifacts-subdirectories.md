---
layout: post
title: Jenkins Build artifacts - subdirectories
created: 1338563076
comments: true
categories:
- jenkins
- ci
---

It took me an unreasonable amount of guesswork to figure out how to get jenkins to archive files at multiple folder levels

In the end this line worked for me 

```
Webdriver-framework/target/surefire-reports/*,Webdriver-framework/target/surefire-reports/**/*.png 
```

This grabs a report in one level - and images it references in subdirectories 

