---
layout: post
title: Jenkins Build artifacts - subdirectories
created: 1338563076
categories:
- jenkins
- ci
---
<p>
It took me an unreasonable amount of guesswork to figure out how to get jenkins to archive files at multiple folder levels
</p>
<p>
&nbsp;
</p>
<p>
In the end this line worked for me 
</p>
<p>
Webdriver-framework/target/surefire-reports/*,Webdriver-framework/target/surefire-reports/**/*.png 
</p>
<p>
&nbsp;
</p>
<p>
THis grabs a report in one level - and images it references in subdirectories 
</p>
