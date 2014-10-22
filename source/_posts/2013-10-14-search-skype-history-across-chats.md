---
layout: post
title: Search skype history across chats
created: 1381768039
categories:
- skype
---
I find a lot of clients use skype

For me the biggest frustration is the limited search

But it turns out the data is stored using sqlite - and so you can search using sql directly on the sqlite db files.


{% gist 740d136e58d8b87d057f %}


or for all your chats from a given day


{% gist 85e282537f6f2f631414 %}
