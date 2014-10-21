---
layout: post
title: Installing Lame on Debian
created: 1248250481
categories:
- linux
- debian
- ubuntu
- lame
- mp3
- install
- ogg vorbis
---
<p>
Debian has a very strict policy on free and legal software. This helps keep everyone honest, but sometimes a pragmatic approach is called for. MP3 is a file format that is patent encumbered - but also in universal use. 
</p>
<p>
I could use the supplied Ogg Vorbis tools but then my music wouldn't work everywhere I want it to.
</p>
<p>
So I want to install Lame which is only available in source.
</p>
<p>
http://sourceforge.net/projects/lame/files/
</p>
<p>
Download and extract 
</p>

<code>
cd lame-398-2/
# install a build environment by pulling in the build dependencies for something useful (I chose php)
sudo apt-get build-dep php5
sudo aptitude install fakeroot
# check build dependencies of lame
cat debian/control
# and install them
sudo aptitude install nasm libsndfile1-dev
chmod 700 debian/rules
dpkg-buildpackage -rfakeroot -uc -b
sudo dpkg -i ../lame_3.98.1_i386.deb ../libmp3lame0_3.98.1_i386.deb
</code>

