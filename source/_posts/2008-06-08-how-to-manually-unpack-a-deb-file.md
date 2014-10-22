---
layout: post
title: How to manually unpack a .deb file
created: 1212948047
comments : true
categories:
- linux
- packaging
---
Sometimes you want to look at the contents of a package without installing it.

Sometimes you want to compare your installed version with the original package.

Run the following commands

```bash
mkdir ~/temp
dpkg -x somepackage.deb ~/temp/
```

To unpack (without installing) in a temp directory.
