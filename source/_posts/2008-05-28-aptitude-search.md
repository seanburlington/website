---
layout: post
title: Aptitude Search
created: 1211979685
comments: true
categories:
- linux
- debian
- ubuntu
---
<p>
The basic search is:
</p>
<p>
aptitude search apache 
</p>
<p>
Returns all packages that match
</p>
<p>
To search only for the installed versions
</p>
<p>
aptitude search ~iapache
</p>
<p>
To search for the packages that aren't installed 
</p>
<p>
aptitude search \!\(~i\)apache2
</p>
<p>
Search Term reference
</p>
<p>
<a href="http://algebraicthunk.net/~dburrows/projects/aptitude/doc/en/ch02s03s05.html ">http://algebraicthunk.net/~dburrows/projects/aptitude/doc/en/ch02s03s05.html
</a>
</p>
