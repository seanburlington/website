---
layout: post
title: Drupal api module
created: 1212533095
comments: true
categories:
- drupal
- documentation
---
<p>
The Drupal api module is very useful. It's also quite strict in the formats it recognises.
</p>
<p>
If you are having trouble getting it to reconise your doc-comments make sure you are following the Drupal coding standards
</p>
<p>
<a href="http://drupal.org/coding-standards">drupal.org/coding-standards</a>
</p>
<!--break-->
<p>
In particular function declarations must be like
</p>
<?php
function my_function($param) {
?>
<p>
Any missing (or extra) spaces will cause the papi parser to ignore the function.
</p>
<p>
You can also include html files in your documentation (just save them anywhere the api module has been set to index).
</p>
<p>
The &lt;title&gt; will be used as the &quot;docblock title&quot; and the &lt;body&gt; of the html will be displayed formatted within your site template.<br/>I haven't figured out yet where/if the &quot;docblock title&quot; is displayed</p><p>Again the parser is quite strict - you must have an &lt;h1&gt; element in the page.</p><p>Everything up untill the end of the first &lt;h1&gt; element is ignored (which seems odd to me) - and the rest as the body of the documentation.  
</p>
