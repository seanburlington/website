---
layout: post
title: How to use google comments on your blog
created: 1384890611
categories:
- google
---
<p>To use google plus comments on your site all you need to do is insert the following code on teh page where you want the comments to appear<p>

<p>url should be the full url to the page, then any comments in google plus with this url will appear to any user who can see them (ie public commnts or those from people in the viewers circles).</p>

<p>width is just how wide you want the comment box</p>

<p>BLOGGER This method is as far as I can see only officially supported for Blogger comments and only this value seems to work</p>

<p>FILTERED_POSTMOD similarly seems to be just what people use - I didn't find docs for this so I'm unsure if other values work</p> 

<code>

&lt;script src=&quot;https://apis.google.com/js/plusone.js&quot;&gt;
&lt;/script&gt;

&lt;g:comments
    href=&quot;The url of the blog post&quot;
    width=&quot;500&quot;
    first_party_property=&quot;BLOGGER&quot;
    view_type=&quot;FILTERED_POSTMOD&quot;&gt;
&lt;/g:comments&gt;

</code>
