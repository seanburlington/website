---
layout: post
title: Translating Drupal Websites
created: 1211135277
categories:
- internationalisation
- drupal
---
<p>
I've worked on a few internationalised sites in the past and it always raises challenges, Drupal makes some things easy - this post provides some simple tips for planning your translation process.
</p>
<p>
This advice is aimed at sizeable sites with formal release processes.
</p>
 
<!--break-->
<h2>General tips for any website translation project</h2>
<dl>
<dt>Plan</dt>
<dd>
<p>
This is the key for any translation project, talk to all the people involved, make sure you know all the stages, and that everyone is comfortable that they can play their part.
</p>
</dd>
<dt>Check your design</dt>
<dd>
<p>
A common problem with CMS driven websites is that the design if often produced by a designer more familiar with print layout (fixed amounts of content).
</p>
<p>
Translation makes this even more challenging, you have to really check that your design can cope with varying amount of content: compared to English: German words are long, Norwegian words very long - and Korean characters may need a larger font to be legible.
</p>
</dd>
<dt>Introduce standards early</dt>
<dd>
<p>
Make sure the coding team are all doing things the same way - whatever the specifics for your project!
</p>
</dd> 
<dt>Translate late</dt>
<dd>
<p>
Wait as long as possible before starting on translation to ensure all phrases are finalised. It's amazing how late in a project you can find whole extra pages that need writing - error pages especially; but all sorts of pieces of text get revised once you start testing.
</p>
<p>
Ideally I'd translate after testing is complete - and then test the translations separately.
</p>
</dd>
</dl>
<h2>Drupal Specific translation tips</h2>  
<p>
Drupal provides the 't' function ( http://api.drupal.org/api/function/t/5 ) which does a lot of work for you.
</p>
<p>
Generally, in Drupal you write code using literal strings that you want to appear as output but 'wrap' them in the t function. This makes for readable code which hooks into the 'translate strings' interface that Drupal provides.
</p>
<p>
When using the t function:
</p>
<dl>
<dt>
<br />
</dt><dt>
<p>
Don't include leading or trailing whitespace in your strings - it's really easy to miss and this mess up your layout (or if working with exported translation files to miss whitespace differences in the 'original' language and find that your translations don't appear).
</p>
</dt>
<dt>Consider using placeholder text</dt>
<dd>
<p>
(eg 'ENTER_NAME' instead of 'Enter name') as your standard language.<br />
This may make for a slightly harder early proofing process but would make it easy to see which strings are translated, avoid problems with case sensitivity.
</p>
</dd>
<dt>Don't display the default text in any language</dt>
<dd>
<p>
If you're running more than one language anyway it pays to 'translate' English as well: this way you can easily override Drupal defaults.
</p>
</dd><dt>Don't correct the spelling in your code</dt>
<dd>Following on from the point above - just update your translations which are in the database.<br />
This avoids updating your (thoroughly tested) code just to correct a typo.
<p>
&nbsp;
</p>
</dd>
<dt>You can only translate a phase once.</dt>
<dd>
<p>
You can't have an English word translated one way in one place and another way in another place - but if you use placeholder text you could use ENTER and USER_LOGIN_PAGE_ENTER
- translate both to 'Enter' for the English locale and you're still free to differentiate in other languages.
</p>
</dd>
</dl>
<p>
Finally a quick note about the localiser module (http://drupal.org/project/localizer )
- this creates new nodes to hold translations - don't forget to allow for this when planning your database schema. If your database constraints prevent duplication of some content you may end up with a broken schema.
</p>
