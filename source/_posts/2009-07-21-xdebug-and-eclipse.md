---
layout: post
title: xdebug and Eclipse
created: 1248184815
comments: true
categories:
- php
- eclipse
- xdebug
- pdt
---
<p>
xdebug is an immensely powerful tool for exploring what your code really does.
</p>
<p>
You can get a long way using print_r  but ultimately this always requires that you predict the path your code will take - and the tricky bit about debugging is you need it when your predications have gone wrong.
</p>
<p>
It's generally pretty easy to set up
</p>
<ul>
	<li> install the php5-xdebug package</li>
	<li>check that the Eclipse PHP preferences have xdebug as an option</li>
	<li>if you're debugging locally the default settings should be OK</li>
	<li>create a site configuration in the debug dialog</li>
	<li>set a break point</li>
	<li>start debugging</li>
</ul>
<p>
If it doesn't work at first restart Eclipse
</p>
<p>
Check that you have a browser configured in Eclipse
</p>
<p>
Not all settings seem to be picked up immediately  
</p>
