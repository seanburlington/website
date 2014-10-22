---
layout: post
title: Reinstall grub after windows breaks it
created: 1360689034
comments: true
categories:
- linux
- windows
- grub
---
<p>One of those things that happens from time to time on a dual boot system...</p>

<p>Windows breaks grub, usually if I've reinstalled windows, this can lead to a unbootable system.</p>

<p>Boot from a Ubuntu (or other distro) live disk or USB stick.</p>

<p>Figure out which your disks and partitions are.</p>

<code>

    sudo mount /dev/sdXY /mnt
# if there is a boot partition
    sudo mount /dev/sdUV /mnt/boot
    sudo grub-install --recheck --root-directory=/mnt /dev/sdZ 

</code>

<p>When you reboot grub should be back to normal.</p>
