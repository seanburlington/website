---
layout: post
title: "Creating new Vagrant base boxes with Veewee"
date: 2014-10-28 16:08:14 +0000
comments: true
categories: 
- vagrant
- veewee
- virtualbox 
---

Creating your own base box for vagrant is a great thing to do, you get to undestand exactly what is on that box and to choose exactly what base OS you use.

After all one of the big draws of vagrant is keeping your dev environment close to what production looks like - and for that you need to know what is in the base box.

When I first started using vagrant I wrote a post [How to build a Centos 6 base Box for vagrant](/blog/2012/10/16/how-to-build-a-centos-6-base-box-for-vagrant/) whcih details the manual steps needed. At the time I was busy learning puppet, vagrant and related tools - veewee was just one tool too many and a manual build seemed the best way to get my head around what a base box was.

While the base box isn't something I have needed to repeat much, it is beneficial to update the base image from time to time and here veewee is brilliant. It also makes shareing the reponnsbibility for the base box within a team easy.

Here's what I did

 * fork https://github.com/jedi4ever/veewee (in my case to a private repo)
 * check that out
 * install veewee according to its install notes
 

```bash
veewee vbox tenplates | grep -i centos
```
This told me that the template I wanted was CentOS-6.5-x86_64-minimal


```bash 
veewee vbox define centos65 CentOS-6.5-x86_64-minimal

```

Now I made some edits to customise the base box how I wanted

```bash
vim definitions/centos65/definition.rb # comment out the chef line
vim definitions/centos65/cleanup.sh # remove build packages like gcc
vim definitions/centos65/vagrant.sh # remove insecure vagrant key and add your own public key
```


Build

```bash
veewee vbox build centos65
veewee vbox export centos65
```

add to my local vagrant so I can test

```bash
vagrant box add centos65 ./centos65.box
```

Now I can copy the base box to a team-accessible server

And push my custom definition to my veewee fork so anyone from the team can build an updated box.


```bash
vim .gitignore # remove definitions/*
git add .gitignore 
git add definitions/
git commit -m "added my definition"
git push
```


