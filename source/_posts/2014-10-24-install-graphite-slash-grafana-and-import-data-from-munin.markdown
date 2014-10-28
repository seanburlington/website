---
layout: post
title: "Install graphite/grafana and import data from munin"
date: 2014-10-24 14:09:22 +0100
comments: true
categories: 
- devops
- monitoring
- munin
- graphite
- grafana
- kibana
- graphs

---

[Grafana](http://grafana.org/) is a fork of [kibana](http://www.elasticsearch.org/overview/kibana/) that builds grapshs based on data stored in [graphite](http://graphite.wikidot.com/) (it can pull data from other places too but this blog only looks at graphite)

I'm looking at using it to replace tools like [munin}(http://munin-monitoring.org/) or [cacti}(http://www.cacti.net/) which do a great job of gathering and displaying metrics.

Wwhat Grafana does beyond this is that it allows you to interactivley manipulate the graphs, you can easily create a graph showing related metrics on the same screen (for example add sysem load and apache requestes per second to the same graphic). You can do this in the other tools - but you have to edit config files on the server, in grafana this is all managed via the UI.

It also allows you to look at any period you like - and in any resolution. 

sudo yum install graphite-web python-carbon


