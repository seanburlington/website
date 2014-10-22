---
layout: post
title: SQL Greatest and Least
created: 1248179499
comments: true
categories:
- postgresql
- mysql
- sql
---
<p>
Most of the time I can get what I want out of SQL using the standard aggregate functions, but today I needed to find the latest timestamp from any one of three columns.
</p>
<p>
I achieved this using the GREATEST() function, it's not party of the SQL standard but is commonly available.
</p>
<p>
GREATEST(<em>value</em> [<span class="OPTIONAL">, ...</span>])<br />
</p>
<pre class="SYNOPSIS">
LEAST(<em>value</em> [<span class="OPTIONAL">, ...</span>])
</pre>
<p>
The GREATEST and LEAST
functions select the largest or smallest value from a list of any
number of expressions. 
</p>
<br />
