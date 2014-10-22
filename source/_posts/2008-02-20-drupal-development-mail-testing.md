---
layout: post
title: Drupal development mail testing
created: 1203539958
comments: true
categories:
- drupal
- testing
---
<p>
One of the problems I have encountered while developing for Drupal on a laptop is how to test the sending of emails.
</p>
<p>
I've recently come across two solutions.
</p>
<h3>
Devel Module 
</h3>
<p>
This helpful module includes a mail wrapper function which directs all mail to the Drupal logs, perfect for testing volume mail sending or just for getting a password reset link.
</p>
<p>
http://drupal.org/project/devel
</p>
<h3>SSH tunnels</h3>
<p>
This is probably a more specialist solution - but I've recently been using an SSH tunnel to allow me to send and receive email through a firewall. As a bonus this means that all mail on localhost port 25 is redirected to my mailserver and PHP mail functions Just Work
</p>
ssh example.com -L 25:localhost:25
