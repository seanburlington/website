---
layout: post
title: IE6 on VirtualBox - installing the network driver
created: 1225627429
comments: true
categories:
- testing
- linux
- ubuntu
- web development
- virtualbox
---
<p>
One of the trial of web development is ensuring that your site works across a range of browsers.
</p>
<p>
Standards compliance is an important part of this - but testing cannot be avoided.
</p>
<p>
I work on Ubuntu, and use VirtualBox together with a licensed copy of Windows XP to test in a Windows environment, which also allows me to at least test the Windows version of Safari. 
</p>
<p>
Unfortunately Microsoft's decision to tie Internet Explorer closely with the operating system means that it isn't possible to install IE6 alongside IE7.  
</p>
<p>
(<a href="http://tredosoft.com/Multiple_IE">Multiple IEs</a> gets close but doesn't exactly replicate each version, and isn't compatible with the IE developer toolbar)
</p>
<p>
<a href="http://blogs.msdn.com/ie/archive/2006/11/30/ie6-and-ie7-running-on-a-single-machine.aspx%22">Microsoft have recognised the problem</a> and do provide an <a href="http://blogs.msdn.com/ie/archive/2006/11/30/ie6-and-ie7-running-on-a-single-machine.aspx">Internet Explorer Application Compatibility VPC Image</a> which allows you to create a virtual Windows with IE6 installed
</p>
<p>
It is possible to <a href="http://blog.mozmonkey.com/2008/vpc-ie6-ie7-ie8-on-mac-os-x/">convert this image for use in VirtualBox</a>
</p>
<p>
But I couldn't initially get the network working. What I had missed is that you have to
</p>
<ul>
	<li>go into the VirtualBox settings for this virtual machine </li>
	<li>in the to select the network section </li>
	<li>specify the &quot;PCnet-PCI II (am79C970A)&quot; network adpator </li>
	<li>boot up the vitual machine</li>
	<li>Windows will try and install the Driver</li>
	<li>Specify a location manually</li>
	<li>Browse to D:\32Bit\Windows\3rdParty\AMD_PCnet</li>
</ul>
<p>
The above assumes you have already installed the Guest Additions.
</p>
<p>
This should succesfuly install the network driver - it worked for me.
</p>
<p>
I now have a true copy of IE6 on Ubuntu and can test away.
</p>
<p>
&nbsp;
</p>
