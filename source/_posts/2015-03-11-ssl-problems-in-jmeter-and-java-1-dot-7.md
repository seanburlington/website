---
layout: post
title: "SSL problems in Jmeter and Java 1.7"
date: 2015-03-11 22:10:36 +0000
comments: true
categories: 
 - jmeter
 - java
 - testing
---

When using jmeter on an ssl enabled site I was seeing an error

    SSL handshake alert: unrecognized_name error

But I'd read that since jmeter version 2.4 ssl should work fine 

It turns out that Java 7 introduced a feature (SNI support) and can trigger this error in some circumstances.

As workaround you can disable this feature by setting the property  jsse.enableSNIExtension to false.

and run jmeter like
    
    
```bash
jmeter -Djsse.enableSNIExtension=false -t mytest.jmx
```