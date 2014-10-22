---
layout: post
title: Can't login to Drupal (404)
created: 1335346849
comments: true
categories:
- drupal
- apache
- mod-rewrite
---
<p>
I've been working on a project for a while on my main dev machine, but needed to run it on my laptop too.
</p>
<p>
Usually copying a sitre across is quick but this time I re-installed the OS too, everything wnet OK except for some reason I couldn't log in to my drupal site.
</p>
<p>
Eventually I noticed that while the site appeared to be working, every page was being served with a 404 header.
</p>
<p>
What happpend is that I hadn't enabled mod_rewrite
</p>
<p>
The .htaccess had been configured to serve drupal 404 pages, but in this case Drupal (once started as a 404 handler) correctly processed the URL - but presumably without the form data.
</p>
<p>
&nbsp;
</p>
<p>
&nbsp;
</p>
<p>
&nbsp;
</p>
