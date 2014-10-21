---
layout: post
title: MySQL restore is very slow
created: 1217855511
categories:
- mysql
- ubuntu
---
<p>
It seems there is a bug in MySQL which is causing restores to run very slowly (hours instead of minutes)
</p>
<p>
<a href="http://bugs.mysql.com/bug.php?id=33057">http://bugs.mysql.com/bug.php?id=33057</a>
</p>
<p>
The bug is fixed in <a href="http://dev.mysql.com/doc/refman/5.0/en/releasenotes-cs-5-0-67.html">release 5.0.67</a>
</p>
<p>
But Ubuntu hasn't updated yet....
</p>
<p>
Fortunately this bug is specific to the command line client. 
</p>
<p>
Workaround: use the MySQL Administrator GUI instead. 
</p>
