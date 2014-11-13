---
layout: post
title: "Quick Steps to secure Ubuntu Linux"
date: 2014-11-13 14:41:12 +0000
comments: true
categories: 
- Linux
- Ubuntu
- security
---

Recently I've been reviewing security and realised I've been relying too much on my routers firewall - which isn't even present if I work on an open wifi connection somewhere.

Steps so far

Reinstalled Ubuntu with full disk encryption, apart from the need to back and restore data this was a painless process. I don't see a noticeable performance impact (though I have a fast system with SSD) the biggest drawback I can see is that if I mess around with a custom kernel and break the boot sequence - I don't know if I can boot from a live CD to fix it.

Setup a restrictive local firewall

as root 

```bash 
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -I INPUT 1 -i lo -j ACCEPT
iptables -P INPUT DROP
iptables -S
apt-get install iptables-persistent
```

edit /etc/postfix/main.cf

set

inet_interfaces = 127.0.0.1

and `/etc/init.d/postfix restart`

I will review open ports each time I configure a new service and ensure I don't have services I only need local accessible externally.

By both configuring firewall **and** limiting services I am applying the principle of defence in depth and even if there is a weakness (or I make a mistake) in one place I will still be protected.

Where I do need to share services between systems on my home/office network I have realised my old router is not sophisticated enough and am purchasing one that can separate secure and insecure networks.

All systems are now being configured for automatic updates, since I want patches as soon as possible, small frequent updates are easier to debug than problems with large updates, and generally I only delay updating out of inertia rather than any deliberate action. This way I don't even have to think about it.

from  http://www.richud.com/wiki/Ubuntu_Enable_Automatic_Updates_Unattended_Upgrades

my config files are now

```bash
cat /etc/apt/apt.conf.d/50unattended-upgrades  | grep -v ^//
Unattended-Upgrade::Allowed-Origins {
	"${distro_id}:${distro_codename}-security";
	"${distro_id}:${distro_codename}-updates";
};
Unattended-Upgrade::Package-Blacklist {
};
Unattended-Upgrade::MinimalSteps "true";
Unattended-Upgrade::Mail "root";
Unattended-Upgrade::Remove-Unused-Dependencies "false";
```

```bash
cat /etc/apt/apt.conf.d/10periodic  | grep -v ^//
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Download-Upgradeable-Packages "1";
APT::Periodic::AutocleanInterval "7";
APT::Periodic::Unattended-Upgrade "1";
APT::Periodic::Verbose "2";
APT::Periodic::RandomSleep "1";
```

Also set /root/.forward to ensure I get root mail

I have also realised I rely too much on browser stored passwords, and while this is useful for low-security logins I will not be using it for any important site.

Funnily I've also found I needed to revisit my backup policy and actually delete more stuff **not** backing up code and documents which are business confidential and are already backed up centrally. In this case I realised my own backups were just causing a data management problem just increasing the risk that the data gets accidentally disclosed.


