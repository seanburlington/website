---
layout: post
title: headless VPN on linux with minimal VPN traffic and selective DNS
created: 1363124344
categories:
- linux
- vpn
- dnsmasq
---
<p>I needed to setup a VPN client connection on a headless system where the VPN is slow and so I want to route the minimal amount of traffic through it. I need DNS to use the VPN but only for one domain.</p>

<p>This is my setup using pptp and dnsmasq (tested on centOS)</p>



<p>Basic VPN config is here /etc/ppp/peers/office</p> 
<code>
# written by pptpsetup
pty "pptp vpn.example.com --nolaunchpppd"
lock
noauth
nobsdcomp
nodeflate
refuse-eap
usepeerdns
defaultroute
name sean.burlington
remotename office
ipparam office
require-mppe-128
</code>


<p>Startup script adds a default route for the network I need to access via vpn and adds the DNS server to dnsmasq config</p>
<p>/etc/ppp/ip-up.local </p>

<code>
#!/bin/bash

for net in 192.168.128.0/17 ; do
  /sbin/route -v add -net $net dev $IFNAME
  logger -t pppd "added route for $net"
done


cp -f /etc/dnsmasq.orig /etc/dnsmasq.conf

echo "server=/example.com/${DNS1}" >> /etc/dnsmasq.conf

service dnsmasq restart
</code>
<p>When disconnecting VPN reset dnsmasq, in my case I need the public DNS for example.com when not on VPN</p>

<p>/etc/ppp/ip-down.local </p>
<code>
#!/bin/bash

cp -f /etc/dnsmasq.orig /etc/dnsmasq.conf

service dnsmasq restart
</code>



<p>My /etc/resolv.conf points first to localhost where dnsmaq runs, then to my router which provides the upstream DNS</p>

<code>
nameserver 127.0.0.1
nameserver 192.168.0.1
</code>





