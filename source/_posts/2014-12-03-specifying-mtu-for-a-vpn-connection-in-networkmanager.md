---
layout: post
title: "Specifying MTU for a VPN connection in NetworkManager"
date: 2014-12-03 11:34:35 +0000
comments: true
categories: 
- linux
- ubuntu
- networking

---

I need to use a VPN which was suffering packet fragmentation due to the overhead involved (actually I use a VPN to connect to a network which then has another VPN connection to a third network).

To determine the largest MTU size which didn't lead to fragmentation I just ran variations on

```bash 
ping -M do -s 1327 server.example.com
```

`-M do` prohibits fragmentation so the ping will fail if the packet size is too large

I tried larger/ smaller values till I found the largest number that worked.

Network Manager didn't give me a GUI to set MTU on the VPN connection (it does for ethernet)

So I needed a script in /etc/network/if-up.d/

I called mine like myvpn-mtu (owned by root and executable)

```bash
#! /bin/sh
# set low MTU for my VPN otherwise I get packet fragmentation
set -e


if [ "$CONNECTION_ID" = myvpn ] && [ "$MODE" = start ]; then
  /sbin/ifconfig $IFACE mtu 1327
fi


exit 0
```
Substitute "myvpn" here for your connection name 

The script env has the following variables (I've anonymised some variables)

```
ADDRFAM=NetworkManager
CONNECTION_ID=xxxxxxxxxxxxxx
CONNECTION_UUID=xxxxxxx-xxxxx-xxxxx-xxxx-xxxxx
DEVICE_IFACE=wlan0
DEVICE_IP_IFACE=wlan0
DHCP4_BROADCAST_ADDRESS=192.168.0.255
DHCP4_DHCP_LEASE_TIME=86400
DHCP4_DHCP_MESSAGE_TYPE=5
DHCP4_DHCP_REBINDING_TIME=75600
DHCP4_DHCP_RENEWAL_TIME=43200
DHCP4_DHCP_SERVER_IDENTIFIER=192.168.0.1
DHCP4_DOMAIN_NAME=xxx
DHCP4_DOMAIN_NAME_SERVERS=192.168.0.1
DHCP4_EXPIRY=1417685250
DHCP4_HOST_NAME=xxx
DHCP4_IP_ADDRESS=192.168.0.209
DHCP4_NETWORK_NUMBER=192.168.0.0
DHCP4_ROUTERS=192.168.0.1
DHCP4_SUBNET_MASK=255.255.255.0
IFACE=tun0
IP4_ADDRESS_0=192.168.0.209/24 192.168.0.1
IP4_DOMAINS=xxx
IP4_NAMESERVERS=192.168.0.1
IP4_NUM_ADDRESSES=1
IP4_NUM_ROUTES=0
LOGICAL=tun0
METHOD=NetworkManager
MODE=start
PHASE=post-up
PWD=/
VERBOSITY=0
VPN_IP4_ADDRESS_0=192.168.1.48/24 x.x.x.x
VPN_IP4_NAMESERVERS=x.x.x.x
VPN_IP4_NUM_ADDRESSES=1
VPN_IP4_NUM_ROUTES=28
VPN_IP4_ROUTE_0=192.168.1.0/24 0.0.0.0 0
VPN_IP4_ROUTE_1=192.168.2.0/24 0.0.0.0 0
VPN_IP4_ROUTE_2=192.168.3.0/24 0.0.0.0 0
VPN_IP4_ROUTE_3=192.168.4.0/24 0.0.0.0 0
VPN_IP_IFACE=tun0
```

