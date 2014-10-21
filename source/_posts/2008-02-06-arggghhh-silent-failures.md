---
layout: post
title: ! 'ARGGGHHH - Silent failures! '
created: 1202314085
categories:
- drupal
- best practice
---
<div class="post-entry">
<p>
I’ve just spent ages trying to find out why I couldn’t add some default views to drupal
</p>
<p>
I’d set up my views, exported them added them to a module in a hook_views_default_views() function…
</p>
<p>
and nothing happened.
</p>
<p>
First I though this was caching - but much cache clearing and debugging later…
</p>
<p>
I realised that if the view requires categories that don’t exist -
it just gets silently dropped - no error - no warning it just doesn’t
work!!!
</p>
<p>
This seems to be a general Drupal thing - all too often failures are silent - and very hard to track down.
</p>
</div>
