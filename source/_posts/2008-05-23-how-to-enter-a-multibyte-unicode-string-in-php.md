---
layout: post
title: How to enter a multibyte Unicode string in PHP
created: 1211559255
categories:
- php
- internationalisation
---
<p>
This has just taken me a suprisingly long time to work out ...
</p>
<p>
I needed to output a file with the follwing as a marker in various places.
</p>
<blockquote>
	♦ U+2666 BLACK DIAMOND SUIT<br />
	<br />
	General Character Properties<br />
	<br />
	Unicode category: Symbol, Other<br />
	<br />
	Various Useful Representations<br />
	<br />
	UTF-8: 0xE2 0x99 0xA6<br />
	UTF-16: 0x2666<br />
	<br />
	C octal escaped UTF-8: \342\231\246<br />
	XML decimal entity: &amp;#9830;
</blockquote>
<p>
OK so I know the hex code I think I'll just use <a href="http://uk.php.net/chr">chr()</a> but no... this only works for ASCII...
</p>

<p>...and the mbstring functions are great for working with multi-byte strings but don't help enter them</p>

<p>
It turns out that you can either copy a literal ♦ into your source code - or use the <a href="http://uk.php.net/pack">pack()</a> function 
</p>

<?php
header('Content-Type: text/plain;charset=utf-8');
echo "♦\n";
 
echo pack("ccc", 0xE2, 0x99, 0xA6) ."\n";

 
?>
