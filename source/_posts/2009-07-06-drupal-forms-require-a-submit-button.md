---
layout: post
title: Drupal forms require a submit button
created: 1246870864
categories:
- drupal
- ajax
- javascript
---
<p>
I'm working on an AJAX heavy site for a defined audience who all have JavaScript - so I have a form with no submit button that gets submitted by an change handler. 
</p>
<p>
Normally I'd make sure the site was fully accessible - but not on this project so I just got rid of the submit button. I got the JavaScript submit working only to find my Drupal form no longer worked.
</p>
<p>
It seems that the Drupal submit handlers are not called if the form doesn't have a submit button. I can't see any reference to this in the Drupal API, but adding the  button back in and hiding it via CSS works fine.
</p>
<p>
&nbsp;
</p>
