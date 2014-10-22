---
layout: post
title: Resizing an ext3 filesystem on LVM
created: 1270816543
comments: true
categories:
- linux
---
<p>
When I installed my system I wasn't quite happy with the way the installer divided my hard disk - but at the time I was in a hurry...
</p>
<p>
I have since found that repeated loading of databases during development used up all available space in /var and debug files were filling /tmp
</p>
<p>
So I had to figure out how to resize them.
</p>
<p>
&nbsp;
</p>
<p>
Thanks to 
</p>
<p>
http://blog.dhampir.no/content/resizing-an-ext3-filesystem-on-an-lvm
</p>
<code>
reboot # into single user mode
df
umount /tmp
umount /home/
umount /var/
# can't umount var - why not?
lsof | grep var
# OK - need to shut down some services
ifdown eth0
lsof | grep var
/etc/init.d/nfs-common stop
lsof | grep var
/etc/init.d/portmap stop
lsof | grep var
umount /var/
# get some info about my setup and save it
lvs
lvs &gt; maybe_useful_lvs.txt
# check what volume groups I have
vgscan
ls -lh /dev/lonlinpdev01/
# check all filesystems I'm about to change are OK
e2fsck -f /dev/lonlinpdev01/home
e2fsck -f /dev/lonlinpdev01/var
e2fsck -f /dev/lonlinpdev01/tmp
# reduce /home partition
resize2fs -p /dev/lonlinpdev01/home 80G
e2fsck -f /dev/lonlinpdev01/home
# reduce home volume (leaving soem spare space)
lvreduce -L85G /dev/lonlinpdev01/home
# extend /tmp to 20Gb
lvextend -L 20G /dev/lonlinpdev01/tmp
# find out what physical volume I'm using
pvs
# extend /var to use all available space
lvextend  /dev/lonlinpdev01/var /dev/sda2
# check disks
e2fsck -f /dev/lonlinpdev01/tmp
e2fsck -f /dev/lonlinpdev01/var
e2fsck -f /dev/lonlinpdev01/tmp

# now resize all filesystems to match the partitions 
resize2fs -p /dev/lonlinpdev01/var
e2fsck -f /dev/lonlinpdev01/var
resize2fs -p /dev/lonlinpdev01/home
e2fsck -f /dev/lonlinpdev01/home
e2fsck -f /dev/lonlinpdev01/home
reboot
</code>
