---
layout: post
title: Hard Drive Testing using smartmontools
created: 1259835502
categories:
- linux
- smartmontools
- reminder to self
---
<p>Test the hard drive with</p>
<code>
 smartctl -t long /dev/hd?
</code>

<p>This may take hours to run and will do so as a background process.</p>

<p>Once complete run the following to see results</p>

<code>
 smartctl -l selftest /dev/hd?
</code>
