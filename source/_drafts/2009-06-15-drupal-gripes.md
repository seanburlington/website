---
layout: post
title: Drupal Gripes
created: 1245050443
tags:
- php
- drupal
---
<p>
Silent failures
</p>
<p>
Testing noit really possible (can't isolate, core tests run for 45 minutes - then I gave up)
</p>
<p>
how do you test a menu function?  Drupal won't tell you if you have typos  
</p>
<p>
Not invented here syndrome, try to do everything as a module, end up stuck with CVS project/druplicon/api
</p>
<p>
Complex array structures
</p>
<p>
sort of objects (e.g. nodes - but really just adata structure)
</p>
<p>
Lowest common denominator approach (getting worse) date/wysiwyg/php etc- seem to think something iscompatible if it works equally badly on all systems.
</p>
<p>
Aim to support cheap hosted setups, using sqlite - give these users parity - but still claim to be suitable for the enterprise. 
</p>
<p>
No good definition of a drupal hook. Just a general concept with many different definitions of module_invoke etc. The idea of hooks is OK - but by using a home grown solution there is no toolling support for it. can't use doxygen in a meaningful way.  
</p>
<p>
No seperation between configuration/content
</p>
<p>
Hard to deploy cleanly, done it - but Drupal doesn't really help. Even harder to rollback.
</p>
<p>
No upgrade process for custom modules (no backwards compatibility)
</p>
<p>
No backwards compatibility.
</p>
<p>
Lack of distinction between site building tools, admin and end user interface (getting better in Drupal 7 with seperate menus).
</p>
<p>
Particularly with CCK and Views - the line is blurred, the developer loses control over database structure - and often even looses sight of it. A common complaint is that a View that was built in minutes then takes hours to get to look right because theming it is so hard.
</p>
<p>
The form API really sucks, it's not an API in any recognisable sense of the term - there's a monster set of array options and a couple of function calls. You define a form in an array, other modules get to alter thi, and depeing on the order of module priority you may or may not get a chance to alter what they have done (often just unsetting array values to get rid of unwanted elements - such as excessive input format help text). The Form API is very flexible - but it really isn't very developer friendly. There's a good post on how it could be better 
</p>
<p>
No feature updates between major releases - core updates only every 2 years or so. 
</p>
<p>
Things I've hacked core for
</p>
<ul>
	<li>database connection fail (fixed in D7)</li>
	<li>central config for cron jobs</li>
	<li>supporting date type</li>
	<li>fixing a layout bug</li>
</ul>
<p>
&nbsp;
</p>
<p>
Would you believe that for such a big CMS - there's no save as draft option! There are a couple of modules that try and work around this by tweaking revision history or saving serialized data - but draft content is not a core concept.
</p>
<p>
Data stored serialised in several places - even when the data is just an array of strings.
</p>
<p>
Lack of understanding of the motivation of potential contributors
</p>
<p>
little things - but modules don't know thier own names! (no $this) 
</p>
<p>
&nbsp;
</p>
<p>
Patch phobia<br />
http://www.lullabot.com/blog/views-distinct-node-access-problems<br />
</p>
