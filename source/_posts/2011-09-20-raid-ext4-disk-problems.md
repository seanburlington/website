---
layout: post
title: RAID ext4 disk problems
created: 1316524845
categories:
- linux
- note to self
---
One of those posts for myself in case I need to come back to this later

I have a new PC which is very fast apart from problems with disc access seeming slow (and the disks being physically noisy)

The following related links led me to try a solution

http://forums.gentoo.org/viewtopic-t-843292.html

http://marc.info/?l=linux-raid&m=128506852210452&w=2


/etc/fstab
<code>
UUID=317f7912-9956-41f1-9855-7bee69c950b3 /               ext4    errors=remount-ro,barrier=0 0       1
</code>

NB adding barrier=0 here seems to have solved the problem
