---
layout: post
title: Using Exceptions in PHP
created: 1238076605
comments: true
categories:
- php
- drupal
---
<p>
The Drupal project I've been working on for the last year involved some fairly heavy file processing, with lot's of validation.
</p>
<p>
To simplify the code I made extensive use of Exceptions, I didn't create that many different Exception classes - but I made sure that any errors which affect the flow of the logic were handled by Exceptions.
</p>
<p>
This succeeded in making the code much more legible.
</p>
<p>
And now several months later I'm updating documentation - and it's just great to be able to spot all the error handling code so easily.
</p>
<p>
It's  a shame Drupal doesn't use exception handling more in the core. 
</p>
