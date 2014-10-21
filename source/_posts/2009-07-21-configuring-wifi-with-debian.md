---
layout: post
title: Configuring WIFI with Debian
created: 1248214568
categories:
- linux
- debian
- hardware
- wifi
- iwl3945
---
<p>
I've just installed Debian Lenny and generally am impressed with how well things are auto detected and configured - so much easier than a few years ago - and in many ways easier than a Windows install where you have to constantly find 3rd party drivers to get things working.
</p>
<p>
 However getting wifi running was a bit trickier (largely because of FCC regulations  affecting licenses and default settings).
</p>
<p>
This document got me most of the way 
</p>
<p>
http://wiki.debian.org/iwlwifi
</p>
<p>
Additional lines in /etc/.network/interfaces
</p>
<code>
iface wlan0 inet dhcp
  pre-up ip link set wlan0 up
  wpa-driver wext
  wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf

</code>

and wpa_supplicant.conf looks like
<code>
ctrl_interface=/var/run/wpa_supplicant

network={
     ssid="mynetwork"
     psk="mypassword"
}
</code>

<p>And it's all working...</p>

<p>
This old bug seems to be fixed
</p>
<p>
 https://bugs.launchpad.net/ubuntu/+source/linux/+bug/288401
</p>
