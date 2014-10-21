---
layout: post
title: ! 'RAID - protecting my data '
created: 1194884144
categories:
- linux
---
<p>
I’ve
had too many hard disk failures over the years and decided to use RAID
to ensure that all my photos, email and work are always copied to two
disks so that if any one of them fails I don’t lose anything. 
</p>
<p>
Recently I was upgrading my system and accidentally unplugged one of
these disks - I didn’t even notice until I got an automatic email
warning me that one of the disks wasn’t working! 
</p>
<p>
Plugging it back in and getting it working was pretty easy!
</p>
<p>
note to future self - the commands were 
</p>
<p>
show what is happening<br />
mdadm --query --detail /dev/md1 
</p>
<p>
add drives back into array<br />
mdadm --manage --add /dev/md0 /dev/hdc1<br />
mdadm --manage --add /dev/md1 /dev/hdc2
</p>
