---
layout: post
title: ! 'CSS bugs in MSIE6 '
created: 1107447344
categories:
- css
---

At work we recently redesigned our website:
the old design was created in front page and made heavy use of tables, font tags, fixed size divs and a smattering of css.
The new design is pure CSS using CSS hacks to workaround bugs in various browsers.

The old design had only ever been tested in MSIE and was a little quirky in other browsers, tables based layouts always seem to look more or less the same though. Mind you when there was a problem it would take me hours of trwling through nested tables to find and fix it.

Having lived with this design for a while I have found it to be a little more fragile (in MSIE) in some ways: put an oversized image in the wrong place and the menu which should float to the right drops to the bottom of the page.

The worst problem turned out to be a bug in the way MSIE calculates the size of italic text.

www.positioniseverything.net/explorer/italicbug-ie.html

Now I have found this bug I can easily work around it by avoiding excessive italics (italics tend to look rubbish anyway) or adding the odd bit of white space.

I have also found problems with some divs - if there isn’t enough content -tthe content is all invisible untill you scroll down and then scroll back.

Adding a line-height : 1.1em rule to the containg div fixes it

www.dracos.co.uk/web/css/ie6floatbug/

On the whole I am happy with the CSS design and spend less time fixing layout problems, our site has a much more consistent look and feel, editors don’t have to get involved in layout issues and the whole design can be tweaked accross the site easily.
