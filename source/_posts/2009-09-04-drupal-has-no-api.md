---
layout: post
title: Drupal has no API
created: 1252055826
categories:
- drupal
- api
- framework
---
<p>
I've been using Drupal for a couple of years now, and know my way around it pretty well.
</p>
<p>
One of my biggest frustrations though is that it doesn't really have an API.
</p>
<p>
Much of the functionality is only really available through the application, you can do things pretty easily by pointing and clicking, but try and automate part of this and you have to step through code, find form handlers, copy-paste parts of the functions and work out what parameters are required.
</p>
<p>
The example I found most recently was creating a translated version of a page.
</p>
<p>
My client is using a translation agency, we send them XML, they translate it and return the translated text in XML. 
</p>
<p>
So I start with an English page, send off an XML version, and when I get the XML translation back I need to add a new node related to the original.
</p>
<p>
But Drupal has no function &quot;translation_add()&quot; instead the functionality is embedded in &quot;translation_nodapi()&quot;.
</p>
<p>
If Drupal had an API there would be a well thought out set of functions to add, delete, and update translations of a node.
</p>
<p>
The name of Drupal's documentation site http://api.drupal.org/ is misleading, this is just general documentation of Drupal functions, it isn't an API. 
</p>
<p>
&nbsp;
</p>
