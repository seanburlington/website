---
layout: post
title: three.co.uk 3G USB modem - filtering
created: 1212767149
comments: true
categories:
- 3g
---
Three are definately putting a transparent proxy between me and the network.

I just got this error message

<blockquote>
Network Error (tcp_error)

A communication error occurred: "Connection refused"
The Web Server may be down, too busy, or experiencing other problems preventing it from responding to requests. You may wish to try again at a later time.

For assistance, contact your network support team. 
</blockquote>

Which isn't coming from my web browser (which has a different error page for this problem).

And it isn't coming from the remote server as the message is that it couldn't connect!

<!--break-->

This is most definately filtering.

I've written a small script that outputs text after a couple of minutes. Over a normal ADSL connection it works fine.

But over three's network I get the following results

(using telnet to ensure there is no other program in the way)

<code>

telnet www.practicalweb.co.uk 80
Trying 80.68.94.158...
Connected to www.practicalweb.co.uk.
Escape character is '^]'.
GET /test.php HTTP/1.1
host: www.practicalweb.co.uk

HTTP/1.1 503 Service Unavailable
Cache-Control: no-cache
Pragma: no-cache
Content-Type: text/html; charset=utf-8
Connection: close
Content-Length: 732

<HTML><HEAD>
<TITLE>Network Error</TITLE>
</HEAD>
<BODY>
<FONT face="Helvetica">
<big><strong></strong></big><BR>
</FONT>
<blockquote>
<TABLE border=0 cellPadding=1 width="80%">
<TR><TD>
<FONT face="Helvetica">
<big>Network Error (tcp_error)</big>
<BR>
<BR>
</FONT>
</TD></TR>
<TR><TD>
<FONT face="Helvetica">
A communication error occurred: ""
</FONT>
</TD></TR>
<TR><TD>
<FONT face="Helvetica">
The Web Server may be down, too busy, or experiencing other problems preventing it from responding to requests. You may wish to try again at a later time.
</FONT>
</TD></TR>
<TR><TD>
<FONT face="Helvetica" SIZE=2>
<BR>
For assistance, contact your network support team.
</FONT>
</TD></TR>
</TABLE>
</blockquote>
</FONT>
</BODY></HTML>
Connection closed by foreign host.
</code>
