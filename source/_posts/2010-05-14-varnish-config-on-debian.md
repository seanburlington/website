---
layout: post
title: Varnish config on Debian
created: 1273841630
categories:
- debian
- varnish
---
<p>
I've just spent too long being very confused as to why varnish wasn't working
</p>
<p>
I'd forgotten that&nbsp; the Debian version doesn't read the default.vcl config file by default!
</p>
<p>
You have to edit /etc/default/varnish and specify the config type you want.
</p>
<p>
I was getting the error message
</p>
<code>
Error 503 Service Unavailable

Error talking to backend 

Guru Meditation: XID:
</code>
