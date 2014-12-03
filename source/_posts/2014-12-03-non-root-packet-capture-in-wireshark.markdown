---
layout: post
title: "non-root packet capture in wireshark"
date: 2014-12-03 12:04:46 +0000
comments: true
categories:
- linux
- network 
---

There are lots of blogs about this already - but I didn't quite understand at first so here's my take ...

Wireshark is a large and somewhat vulnerable program - best not to run it as root (especially as you may be looking a suspicious traffic)

It uses dumpcap for the actual packet capture which is the only bit that needs elevated privileges.

Since linux kernel 2.2 we don't even need root for this bit - we can set file permissions to allow non root user to capture packets. 

If you don't want to allow just any user on your system to do this first make sure only a chosen group can even run dumpcap 

I decided to use the sudo group - but you could make a new one.

```bash
sudo chgrp sudo /usr/bin/dumpcap
sudo chmod 750 /usr/bin/dumpcap
```

Now only members of the sudo group (who are already the users I trust) can run this program.

```bash
sudo setcap cap_net_raw,cap_net_admin=eip /usr/bin/dumpcap
```

This allows the program to gain elevated network rights without being run by root.

Note that any chmod action seems to undo the setcap so perform the changes in this order.

Now I can run wireshark as my regular user and have full functionality. 
