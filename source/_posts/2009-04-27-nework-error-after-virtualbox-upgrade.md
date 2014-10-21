---
layout: post
title: Nework Error after VirtualBox Upgrade
created: 1240828545
categories:
- testing
- virtualbox
---
<p>
I decided to upgrade  VirtualBox because the newer versions have much better support for networks that allow virtual computer to be visible on the real network.
</p>
<p>
But after upgrade I encountered the error
</p>
<p>
&quot;HostInterface': The attribute 'name' is required but missing.&quot;
</p>
<p>
It seems others have had similar issues
</p>
<p>
http://forums.virtualbox.org/viewtopic.php?p=58720&amp;sid=f3759d4d938c30120502ad5610833caa
</p>
<p>
I resolved this by deleting this entry: 
</p>
<code>
<HostInterface/>   
</code>
<p>
from the config file, in my case this was 
</p>
<code>
.VirtualBox/Machines/WinXP/WinXP.xml
</code>
<p>
After this the virtual machine worked fine - and the new network settings are great. 
</p>
