---
layout: post
title: "Add annotations to grafana via Elasticsearch"
date: 2015-04-27 21:43:55 +0100
comments: true
categories: 
 - graphite
 - grafana
 - elasticsearch
 - javascript
---

It took me a while to figure out how to setup elasticsearch for grafana annotations, and I wanted a small page to allow me to add annotations

Mostly I figure we'll add a line to deploy scripts to track versions - but I'd like to be able to manually annotate outages

{% gist 29af780a56e09e3055ed grafana-elasticsearch-annotations.html %}
