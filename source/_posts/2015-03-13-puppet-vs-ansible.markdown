---
layout: post
title: "Puppet vs Ansible"
date: 2015-03-13 13:58:04 +0000
comments: true
categories: 
  - puppet
  - ansible
---

Some thoughts - I've used puppet for a while and ansible more recently. 

Ansible is easier to get started with

Puppet sequencing can be hard - and occasionally you get bugs appearing in odd places where there was a dependency that you hadn't noticed - but things happened to work OK untill some change

Puppet is faster - especially for a long set of config with a single change to apply.

Much nicer audit trail pushing puppet code to a branch - nice having a branch per env, hiera allows easy separation of data and code

Puppet has good logs - which can show the diff of any config change and are easy to centralise. 

Puppet requires software on the server and a service or cronjob, Ansible needs ssh and full sudo access: it doesn't run commands in quite the regular way and the only way to allow it to work seems to be to allow unrestricted sudo access (a password may be used)

I really don't like running ansible from a local dev env, too easy to run uncommitted code that others can't see, no central audit trail, and easy to accidentally use the wrong inventory and push chnages to teh wrong place

I get the impression that it is harder with puppet than with ansible to reuse code quite as well - I feel like I'm going to be bitten by Ansible's strict sequencing - but so far it's OK 

Ansible gives you the ability run run a multi-machine deploy which puppet doesn't (you'd use mcollective for this)

Much richer ecosystem of puppet modules than ansible ones at the time of writing.

I haven't used ansible tower, 





