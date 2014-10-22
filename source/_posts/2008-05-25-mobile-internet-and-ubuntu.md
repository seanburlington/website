---
layout: post
title: Mobile Internet and Ubuntu
created: 1211712241
comments: true
categories:
- linux
- contracting
---
<p>
I just got a new gadget - a mobile internet modem.
</p>
<p>
As ever the manufactures provide little support for us Linux users - but setup was pretty easy anyway.
</p>
<p>
I plugged it in and it was detected OK with full driver support.
</p>
<p>
Once installed it appears as any other modem would.
</p>
<p>
The only snag was that the Windows installer sets up it's own modem setup and doesn't give many clues what the configuration is!
</p>
<p>
A bit of googling later and I have a configuration file.
</p>
<pre>
[Dialer defaults]
Modem = /dev/ttyUSB1
[Dialer three]
Init2 = ATZ
Init3 = ATQ0 V1 E1 S0=0 &amp;C1 &amp;D2 +FCLASS=0
Stupid Mode = 1
Modem Type = Analog Modem
ISDN = 0
Phone = *99\#
Modem = /dev/ttyUSB0
username = username
Password = password
Dial Command = ATDT
Baud =466600
Init4 = AT+CGDCONT=1,&quot;IP&quot;,&quot;three.co.uk&quot;
</pre>
<p>
see also http://ubuntuforums.org/showthread.php?t=633981 
</p>
<p>
Now, I have to confess I don't know what every line above does ...
</p>
<p>
I'm using wvdial to make the connection and this insists on a username/password - but three don't use one so just enter any value. The above is literally what I used.
</p>
<p>
The phone number is '*99#' (# is a comment in wvdial.con so has to be escaped)
</p>
<p>
The <a href="http://www.three.co.uk/threefiles/macdrivers/ConfigGuideUSBModemMac.pdf">Mac guide</a> was helpful - giving me the hint that three.co.uk was required in the init stages.
</p>
<p>
The Baud rate I took from a web post somewhere - I've tried tweaking it but the results are variable.  
</p>
<p>
Details for various services available from: 
</p>
<p>
<a href="http://www.knowyourmobile.com/info/1310/uk_mobile_operators_internet_and_email_settings.html">www.knowyourmobile.com/info/1310/uk_mobile_operators_internet_and_email_settings.html</a> 
</p>
<h2>Service Details</h2>
<p>
The connections is <a href="http://en.wikipedia.org/wiki/Network_address_translation">NAT'ed</a> so wouldn't be suitable for hosting services or running some games.
</p>
<p>
The service is filtered but not heavily - I can access ports for SSH, IMAPS, FTP.
</p>
<p>
All outgoing email (traffic to port 25) gets intercepted by three's email servers, this could be useful but could cause problems if you think you are connecting to a specific mail server.
</p>
<p>
Three also provide an SMTP sever you can configure explicitly at smtp.three.co.uk 
</p>
<p>
I don't see any signs of a transparent HTTP proxy.
</p>
<h2>Conclusion </h2>
<p>
I'm happy :-)
</p>
<p>
Connection speed reports at 1134Kbs up / 52 Kbs down - it's noticably slower than my ADSL line but quite usable. 
</p>
<p>
I got this device primarily as a backup connection so that I can carry on working without interruption even if there is a local network problem. I also expect to be able to do the odd extra bit of work on the train or while away at weekends.
</p>
<p>
At £15 per month it won't take a great deal of extra billable work before I'm making a profit! 
</p>
<h2>
It didn't work on Windows 
</h2>
<p>
<img src="/sites/default/files/u1/doesnt-work-in-windows.gif" title="windows error message" width="348" height="147" />
</p>
<p>
I was dissapointed with the lack of Linux instructions for this device - but interestingly for me as a Linux advocate: installing the device didn't work at all under windows!
</p>
<p>
Not only did instalation require a couple of reboots and install extra software on my machine - but then it wouldn't connect. 
</p>
<p>
One more reason to love Linux <img src="/sites/default/modules/tinymce/tinymce/jscripts/tiny_mce/plugins/emotions/images/smiley-cool.gif" alt="Cool" title="Cool" />
</p>
