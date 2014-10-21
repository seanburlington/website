---
layout: post
title: How to manually unpack a .deb file
created: 1212948047
categories:
- linux
---
Sometimes you want to look at the contents of a package without installing it.

Sometimes you want to compare your installed version with the original package.

Run the following commands

<code>
mkdir ~/temp
dpkg -x somepackage.deb ~/temp/
</code>

To unpack (without installing) in a temp directory.
