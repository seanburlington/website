---
layout: post
title: subversion + three.co.uk = proxy trouble
created: 1212945922
categories:
- eclipse
- linux
- programming
---
If you try to access a subversion repository over http while using a 3G connection from three.co.uk you may receive an error message like.

<blockquote>
svn: PROPFIND request failed on '/repos'
svn: Processing PROPFIND request response failed: Premature end of file. (/repos) 
</blockquote>

This is because three.co.uk uses a <a href="http://en.wikipedia.org/wiki/Proxy_server#Intercepting_proxy_server">proxy</a> to interecept web traffic on their network.

This proxy does not understand all the <a href="http://subversion.tigris.org/faq.html#proxy">commands that are used by subversion</a>.

It is perfectly possible to access subversion repositories through a proxy - just not through the one at three.co.uk.

Three only filter traffic on port 80 - the standard web port. Well, at least as far as I can tell that's all they do.

So if you can set up subversion to access a different proxy - one that does play nice - then you can access your repository over your 3G connection.

Under Linux the subversion proxy settings are in the file: 

<code>
~/.subversion/servers
</code>

Just add settings as below:

<code>
[global]
http-proxy-host = www.exaple.com
http-proxy-port = 3128
http-proxy-username = nobody
http-proxy-password = secret
</code>


