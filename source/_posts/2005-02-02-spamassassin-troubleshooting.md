---
layout: post
title: Spamassassin troubleshooting
created: 1107360485
categories:
- linux
- email
- spam
---
Having been running spamassassin at home with great success for some time, I have just set it up at work but had a few problems setting up a new Debian Linux box for this from scratch.<br />
<br />
I found that spam was just not being detected nearly as well as at home, and the machine was struggling with the load (load average around 3).<br />
<br />
1.<br />
<br />
I noticed that the blacklists were not being used,<br />
after a bit of digging (wiki.apache.org/spamassassin/DnsBlocklists I discovered I needed to install the package libnet-dns-perl<br />
This package is only recommended by the spamassasin package, not required by it.<br />
2.<br />
<br />
The blacklists stopped working again, it turned out that the IP address of the DNS server had been changed. The docs recommend using a local caching DNS server for speed but I’ll see how things go as they are.<br />
3.<br />
<br />
Spam still wasn’t being detected properly and the machine load was to high, I assume that either some tests or the whole spam checking process was timing out - more memory fixed this (I later found out that I might have been able to just reduce the number of child processes spawned by spamd).<br />
<br />
I hope that fixes it - I haven’t had enough mail yet to tell.<br />
<br />
What has made an immediate and obvious difference is rejecting viruses and executable attachments, we previously relied Windows software which quarantined the attachments but sent the body of the mail on to users. Rejecting this mail has already reduced the number of IT support calls of the ‘have I just got a virus?’ nature.<br />
<br />
It remains to be seen if we end up rejecting any legitimate mail, and how useful whitelisting can be in avoiding this.
