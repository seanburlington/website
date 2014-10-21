---
layout: post
title: Device eth0 does not seem to be present, delaying initialization.
created: 1335957998
categories:
- linux
- virtualbox
- redhat
- centos
- networking
---
<p>
I had a centos VM that I hadn't used in a while, I think I cloned it from another version.
</p>
<p>
When I came to use it again I had no network andtrying to start the network I got the error message in the title.
</p>
<p>
There seem to be a few issues
</p>
<p>
Firstly netowrking isn't endabled by default 
</p>
<p>
<a href="http://wiki.centos.org/FAQ/CentOS6#head-b67e85d98f0e9f1b599358105c551632c6ff7c90">http://wiki.centos.org/FAQ/CentOS6#head-b67e85d98f0e9f1b599358105c551632c6ff7c90</a> 
</p>
<p>
Secondly the cloned image appears to get a different mac address for the network card, but theconfig doesn't auto detect this
</p>
<p>
Thirdly the new machine seemed to have eth1 instead of eth0
</p>
<p>
and finally I needed to enable dhcp
</p>
<p>
What this meant was copying the new mac address from the virtualbox network settings tab (inserting a colon every second charecter  to match the format required)
</p>
<p>
I placed this in both 
</p>
<p>
/etc/udev/rules.d/70-persistant-net.rules
</p>
<p>
and  
</p>
<p>
/etc/sysconfig/network-scripts/ifcfg-eth0
</p>
<p>
Where I also set 
</p>
<p>
ONBOOT=&quot;yes&quot;  <br />
BOOTPROTO=&quot;dhcp&quot;
</p>
<p>
Finally /etc/init.d/networking restart got my network up 
</p>
<p>
&nbsp;
</p>
<p>
&nbsp;
</p>
<p>
&nbsp;
</p>
<p>
&nbsp;
</p>
<p>
&nbsp;
</p>
