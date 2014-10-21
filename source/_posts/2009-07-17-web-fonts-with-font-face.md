---
layout: post
title: Web fonts with @font-face
created: 1247834854
categories:
- css
- design
- fonts
---
<p>
When the web first started everything was in Times New Roman, black on grey with few images.
</p>
<p>
Things have moved on a long way since then, but there are still very few fonts. I've worked on many sites that have tried to overcome this by various routes.
</p>
<ul>
	<li>Creating an image of headline text in the desired font<br />
	This can look good but offers poor accessibility and it's hard to update</li>
	<li><a href="http://www.mikeindustries.com/blog/sifr/">SiFR</a> - uses JavaScript and flash to add fonts<br />
	It can work well - but performs badly if overused, and can cause problems with z-ordering on some systems</li>
	<li><a href="http://www.w3.org/TR/css3-fonts/#the-font-face-rule">@font-face</a> Part of the CSS standard which allows you to provide font files for download.</li>
</ul>
<p>
@font-face has a great deal of potential as the end users browser automatically downloads the font definition and renders whatever font you specify without any plug-ins or even JavaScript required.
</p>
<p>
However, this is actually quite old technology - I tried to use it back in the days of Internet Explorer 5 and Netscape Navigator.
</p>
<p>
Then as now there were competing standards for downloadable font files.
</p>
<p>
At the time both browsers only offered a web specific font format which didn't look good enough to use.
</p>
<p>
However; Firefox 3.5 and Safari 4 now support regular TTF and OTF fonts and these look great.
</p>
<p>
There is still the problem that most good fonts are supplied under license - which prevents you providing them for download. 
</p>
<p>
But with two major browsers providing a good implementation for standard font file we can hope that it won't be too much longer before the problem is solved. 
</p>
