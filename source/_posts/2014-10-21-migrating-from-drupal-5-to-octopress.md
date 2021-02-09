---
layout: post
title: "Migrating from Drupal 5 to Octopress"
date: 2014-10-21 15:41:17 +0100
comments: true
categories: 
- drupal
- octopress
- blogging
- long-term
---

I've been running this blog (or some version of it) for almost 10 years now.

I write to help clarify my own thoughts, or to note down technical details of a task that I have struggled to figure out. I often found myself coming back and have saved many hours of trying to figure out the same thing again a year or more later.


For a long time this site was running Drupal 5, I set it up at a time when I was getting to know Drupal, starting out as an independant, and had plenty of time to spend on it. At the time this was a very useful excercise, installing lots of modules, and writing some code was good experience. But when Drupal 6 came out and I was busy [it wasnt worth upgrading](/blog/2008/07/18/time-to-upgrade-to-drupal-6}), then when drupal 7 was released and Drupal 5 no longer supported, upgrading was even more difficult as I would have had to upgrade in two steps. Besides Drupal didn't seem like such a good fit for my blog any more.

I don't want to have to apply security updates on a site I'm not getting paid for: so a static html site is a great fit for me.

I lose integrated comments, but spam had already killed those for me - I'll try disqus and see how that goes (the need to enable comments in the yaml for each post threw me at first).

Search was useful - but I can grep the source files myself.

I had all sorts of Drupal plugins before - but really I don't think they were very important.

Jekyll seems great, especially because with github's patronage it seems unlikely to become unsupported; and at the end of the day it is just a bunch of simple files so importing to another system should be easy.

Exporting from Drupal 5 needed a [small patch on the importer](https://github.com/practicalweb/jekyll-import/commit/cfa72281147fd37ce527d2dab1f3ae916e066b04) without this the categories were seen as some kind of binary object in yaml. The import reads direct from the database, so doesn't run all Drupal's filters and I suspect a drupal export module from drupal would do a much better job. I still need to pull over some old comments and formatting could do with a tidy up, but I need to move to a system that gets me writing new content, and not worry too much about the old.

Jekyll itself didn't use tags in the way I wanted - I find the ability to cross link from one post to similar ones very useful so I am using Octopress which seem to do what I want out of the box.

To get the content in Octopress I just did

```bash
cp jekyll/mysite/_posts/* octopress/source/_posts
```

I have switched from pygments highlighter to linguist (this seems to be what github use and supports code highlighting well)

I added a twitter aside for which I just copy pasted the twitter widget into `source/_includes/asides/twitter.html` and enabled this in _config.yml

I'm not a ruby coder, so instaling all the required ruby gems and figuring out how to run a modified version of the jekyll importer took a little while, in the end I think it was just a case of getting all the gems installed that I needed. I didn't blog soon enough!




