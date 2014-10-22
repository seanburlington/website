---
layout: post
title: How to use google comments on your blog
created: 1384890611
comments: true
categories:
- google
- comments
- blogging
---
To use google plus comments on your site all you need to do is insert the following code on teh page where you want the comments to appear

url should be the full url to the page, then any comments in google plus with this url will appear to any user who can see them (ie public commnts or those from people in the viewers circles).

width is just how wide you want the comment box

BLOGGER This method is as far as I can see only officially supported for Blogger comments and only this value seems to work

FILTERED_POSTMOD similarly seems to be just what people use - I didn't find docs for this so I'm unsure if other values work 

```html

<script src="https://apis.google.com/js/plusone.js">
</script>

<g:comments
    href="The url of the blog post"
    width="500"
    first_party_property="BLOGGER"
    view_type="FILTERED_POSTMOD">
</g:comments>

```
