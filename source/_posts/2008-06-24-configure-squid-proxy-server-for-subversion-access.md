---
layout: post
title: Configure Squid proxy server for subversion access
created: 1214318552
categories:
- linux
- programming
---
<p>
To configure the Squid proxy server to work for subversion access you will need to tell it to recognise some non-standard methods.
</p>
<p>
Add the following to squid.conf 
</p>
<code>extension_methods MKACTIVITY CHECKOUT REPORT MERGE</code>
<p>
Without these settings I could browse the repository - but I couldn't commit to it. Now commit works too :-)
</p>
