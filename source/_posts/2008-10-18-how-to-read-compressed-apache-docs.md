---
layout: post
title: ! 'How to read compressed Apache docs '
created: 1224325598
comments: true
categories:
- documentation
- linux
- debian
- ubuntu
---
<p>
One of the great things about Debian/Ubuntu is the consistency with which system documentation is placed in /usr/share/doc/
</p>
<p>
Assuming you have a web server installed this documentation is then available at http://localhost/doc/
</p>
<p>
But to keep filesize down - many files are compressed and have to be decompressed before you can read them.
</p>
<p>
The browser can actually do that compression on the fly - if it receives the right headers - what it needs to be told is that the content is compressed plain text. 
</p>
<p>
To achieve this add the following lines to your default apache config for the docs directory (there should already be a docs section)
</p>
<p>
&lt;Directory &quot;/usr/share/doc/&quot;&gt;<br />
AddEncoding x-gzip gz tgz<br />
AddType text/plain .gz<br />
&lt;/Direcory&gt;
</p>
