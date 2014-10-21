---
layout: post
title: VPN client
created: 1363122943
tags: []
---
install pptp

install dnsmasq


/etc/ppp/peers/examplename

pty "pptp vpn.example.com --nolaunchpppd"
lock
noauth
nobsdcomp
nodeflate
refuse-eap
usepeerdns
defaultroute
connect /etc/ppp/ip-up.preconnect
name username
remotename examplename
ipparam exmplename
require-mppe-128

                     
 
/etc/ppp/ip-up.preconnect

#/bin/bash

#route del default
#logger -t pppd "delete default route "

/etc/ppp/ip-up.local

if [ -n "$USEPEERDNS" -a -f /var/run/ppp/resolv.conf ]; then
   rm -f /etc/ppp/resolv.prev
   cp /etc/resolv.conf /etc/resolv.prev
   grep search /etc/resolv.prev > /etc/resolv.conf
   grep nameserver /etc/resolv.prev >> /etc/resolv.conf
  cat /var/run/ppp/resolv.conf >> /etc/resolv.conf
  logger -t pppd "setup DNS"
fi
chmod 644 /etc/resolv.conf




for net in  192.168.128.0/17 ; do
  /sbin/route -v add -net $net dev ppp0
  logger -t pppd "added route for $net"
done



service dnsmasq restart

/etc/ppp/ip-down.local

#!/bin/bash
  if [ -f /etc/resolv.prev ]; then
    mv -f /etc/resolv.prev /etc/resolv.conf
    logger -t pppd "reset DNS"
  fi
  chmod 644 /etc/resolv.conf

#route add default gw 192.168.1.1 
logger -t pppd "reset gateway"

service dnsmasq restart

