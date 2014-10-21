---
layout: post
title: Upgrading Debian Etch to Lenny
created: 1264086783
categories:
- linux
- debian
- exim
- upgrade
---
Debian Etch has been serving me well for a few years with wonderfully easy and infrequent maintenance.

However it's at the end of its life

http://www.debian.org/News/2010/20100121

So I've upgraded to Lenny following these instructions

http://www.debian.org/releases/lenny/i386/release-notes/ch-upgrading.en.html

It was remarkably painless

One small problem with the mail system.

<code>
Errors were encountered while processing:
 exim4-config
 imapproxy
 exim4-base
 exim4-daemon-light
 courier-imap
 at
 bsd-mailx
 courier-imap-ssl
 mailx
</code>

But scrolling upwards I got a more helpful error message

<code>
A package failed to install.  Trying to recover:
Setting up exim4-config (4.69-9) ...
DEBCONFsomethingDEBCONF found in exim configuration. This is most probably
caused by you upgrading to exim4 4.67-3 or later without accepting the
suggested conffile changes. Please read
/usr/share/doc/exim4-config/NEWS.Debian.gz for 4.67-2 and 4.67-4
</code>

So I purged exim, deleted the config files, reinstalled it and now everything seems good. 
