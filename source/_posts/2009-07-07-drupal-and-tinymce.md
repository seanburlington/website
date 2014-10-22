---
layout: post
title: Drupal and TinyMCE
created: 1247000401
comments: true
categories:
- drupal
- javascript
- tinymce
- jquery
---
<p>
I've been working on a Drupal project to build a CMS for the production and management of very specific content.
</p>
<p>
The emphasis is all on the  backend system, with tight field size limits (character count including markup) and restricted input (specified tags only).
</p>
<p>
Becuase of this I needed to use TinyMCE fully - restricting the  valid_elements set, and adding event handlers for paste, and keyup.
</p>
<p>
I also had to do this in a moderately deeply nested form.
</p>
<p>
While I tried quite hard to do this within the Drupal WYSIWYG module  http://drupal.org/node/488034 it became clear that the project developer and I had incompatible goals. He wanted all features to be available only where they work on all Rich Text Editors, I wanted to use a feature only available in one.
</p>
<p>
Initially I tried just patching the module, but in the end I just couldn't get it working with multiple tinyMCE configurations in one form. This is supposed to be possible but the documentation is limited  http://drupal.org/node/358316 http://api.drupal.org/api/function/filter_form/6 http://groups.drupal.org/node/8911
</p>
<p>
Part of the problem is that WYSIWYG works by detecting input filters which requires you to use them (I didn't want to) and using filters means you get 'help text' - using multiple filters means users get to choose which one. 
</p>
<p>
You can theme some of this cruft away - but then where's the benefit   of the easy to use GUI?  
</p>
<p>
So I fell back to using TinyMCE directly, found out there is a nice jquery plugin http://tinymce.moxiecode.com/examples/example_23.php
</p>
<p>
And got my form up and running exactly as I wanted it in short order.
</p>
<p>
All I had to do was assign a class to the fields I wanted to be rich text editable,  create my settings, and adapt an existing character counter.
</p>
<p>
The settings look like
</p>
<p>
<code>

var single = {
    valid_elements                    : 'b,i',
    theme_advanced_buttons1           : "bold,italic,cleanup",
    theme_advanced_buttons2           : "",
    theme_advanced_buttons3           : "",
    theme_advanced_statusbar_location : "bottom",
    theme_advanced_toolbar_location   : "top",
    theme                             : "advanced",
    theme_advanced_resizing           : true,
    plugins                           : "maxlength,safari",
};
</code>
<p>
 TinyMCE is enabled by the lines
</p>
<code>
 $().ready(function() {
        $('textarea.mceSingle').tinymce(single);
        $('textarea.mceEditor').tinymce(welcome);
});
</code><p>
No filters, no cruft in the user interface, and it was quicker to develop!
</p>
<p>
&nbsp;
</p>
<p>
<br />
</p>
