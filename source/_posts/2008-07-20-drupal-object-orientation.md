---
layout: post
title: Drupal Object Orientation
created: 1216561998
comments: true
categories:
- php
- eclipse
- drupal
- enterprise
---
<p>
One of the surprising things about Drupal is that it doesn't use object oriented coding.
</p>
<p>
There's a good page in the Drupal documentation about this
</p>
<p>
<a href="http://api.drupal.org/api/file/developer/topics/oop.html">http://api.drupal.org/api/file/developer/topics/oop.html</a>
</p>
<p>
It makes a good case for the design of Drupal, and goes a long way to explain why Drupal feels more OO than the code looks at first glance.
</p>
<p>
There has been discussion on the mailing list
</p>
<p>
Endless debate:<br />
<a href="http://lists.drupal.org/pipermail/development/2006-July/thread.html#17264">lists.drupal.org/pipermail/development/2006-July/thread.html#17264</a>
</p>
<p>
Objects vs Arrays:<br />
<a href="http://lists.drupal.org/pipermail/development/2007-January/021746.html">lists.drupal.org/pipermail/development/2007-January/021746.html</a>
</p>
<p>
Why use the object notation:<br />
<a href="http://lists.drupal.org/pipermail/development/2005-July/thread.html#7137"> lists.drupal.org/pipermail/development/2005-July/thread.html#7137</a>
</p>
<p>
A lot of that discussion boils down to personal preference - but one of the key issues seems to be that OO support in PHP4 is poor. 
</p>
<p>
As an enterprise CMS I don't believe that Drupal has had any business considering PHP4 for a long time; I'm glad that PHP5 will be required for Drupal 7 - but that's still a long way off.
</p>
<p>
Another oft-quoted argument is that Object performance is worse than array equivalents: this this performance difference seems marginal at best - reducing the number of queries per page is likely to make a far bigger difference. CPU cycles are way cheaper than programmer hours  - and in any case better structures lead to more efficient programming which ends up producing faster code. 
</p>
<p>
There's a great Post from merlinofchaos on how Drupal might look<br />
<a href="http://www.angrydonuts.com/what_if_fapi_were_oo">www.angrydonuts.com/what_if_fapi_were_oo</a>
</p>
<p>
To my mind one of the biggest reasons to use OO constructs would be to define structure in a way that would generate errors when mistakes are made. If you look at the <a href="http://api.drupal.org/api/file/developer/topics/forms_api_reference.html/5">form api page</a> you will see endless comments like &quot;Property names without # signs causes havoc.&quot; this is a direct result of using a complex array to build forms - if objects were used it would be much easier to generate errors when the wrong attribute name was used. Drupal has much to strong a tendency to be silent about errors - making debugging much harder than it needs to be.
</p>
<p>
WebChick wrote a great post about making Drupal E_ALL compliant<br />
<a href="http://drupal.org/node/99625">drupal.org/node/99625</a>
</p>
<p>
Using well defined objects would aid debugging in exactly the same way.
</p>
<p>
But for me the biggest productivity gain of a move to Objects would be auto-completion.
</p>
<p>
I use the Eclipse IDE for development and find auto-completion invaluable (along with the pop-up documentation and &quot;open declaration&quot;). To work this requires that the IDE be able to determine something about the variable in question. The IDE knows the allowed property names and methods of variables when they are a defined object type - but if all you know is that a function returns an array - none of this help is available.
</p>
<p>
The above argument doesn't even touch on the benefits of encapsulation, code re-use, and so on that have revolutionised software development. Even without full-on adoption of OO methodology - just adopting object structures over array structure would provide a huge boost in productivity. 
</p>
