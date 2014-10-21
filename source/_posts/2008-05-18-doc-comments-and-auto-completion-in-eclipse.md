---
layout: post
title: Doc-comments and auto-completion in Eclipse
created: 1211135599
categories:
- php
- eclipse
- drupal
- documentation
---
<p>
Using <a href="http://manual.phpdoc.org/HTMLSmartyConverter/HandS/phpDocumentor/tutorial_tags.pkg.html">doc-comments</a> in Eclipse really helps productivity by providing lots of tool-tip help and auto completion.
</p>
<p>
A colleague recently pointed out that Eclipse can auto-complete object properties (as long as you use the @property tag). I've found this really helpful and have been creating objects to return pass around - and found it a vwery neat way of working.
</p>
<p>
I've also been writing functions that may be used on the command line via <a href="http://drupal.org/project/drush">drush</a>, Drupal cron, or via pages.
</p>
<p>
A pleasant side effect of this is that the MVC pattern is starting to appear much clearer within Drupal. The Controller may be cron, drush, or the menu system, this calls the Model, and triggers a theme function for the View.
</p>
<p>
Thanks to <a href="http://www.nobleprog.co.uk/">Bernard at NobelProg</a>
</p>
