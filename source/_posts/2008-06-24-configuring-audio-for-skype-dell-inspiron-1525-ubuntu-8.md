---
layout: post
title: Configuring Audio for Skype Dell Inspiron 1525 Ubuntu 8
created: 1214295543
categories:
- linux
- ubuntu
---
<p>
The audio controls for the Dell hardware are less than obvious; I didn't even notice that there is a built in microphone.
</p>
<p>
Below are screen grabs of the settings that work for me - giving audio at the right levels for skype calls.
</p>
<p>
On the settings tab; ensure &quot;capture&quot; is enabled, &quot;digital&quot; seems to control the mic level - I found midway to be about right - higher levels caused distortion. 
</p>
<!--break-->
<p>
<img src="/sites/default/files/u1/inuput_0.png" alt="kmix input tab" title="kmix input tab" width="300" height="247" />
</p>
<p>
Output: &quot;Master&quot; is the main volume control (which is the level affected by the inbuilt volume buttons).  
</p>
<p>
<img src="/sites/default/files/u1/output_0.png" alt="kmix output" title="Kmix output" width="300" height="247" />
</p>
<p>
On the settings tab ensure 'analog loopback' is unchecked or you just get the microphone fed back into your headphones without being picked up by skype. This is the setting I messed at first. 
</p>
<p>
Set &quot;Input Source&quot; to &quot;front Mic&quot; if you have an external microphone, or &quot;Mic&quot; to use the inbuilt one. 
</p>
<p>
<img src="/sites/default/files/u1/settings_0.png" alt="kmix settings tab" title="kmix settings tab" width="300" height="247" /> 
</p>
<p>
There seems to be a Ubuntu bug which is displaying some settings multiple times (like input source). I just used the first one and ignored the others. 
</p>
