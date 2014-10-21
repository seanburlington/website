---
layout: post
title: Hacked server (now restored)
created: 1384885598
categories:
- security
---
<p>A few days ago I was notified by my ISP that my server was &quot;emitting a UDP-based denial of service attack &quot;, as a result the VM had been rebooted and taken off the network.</p>

<p>With console access I was able to verify there was a problem, and the ISP was able to give me a clean VM, with my old system available as a mount, in read-only mode</p>

<p>I had thought that the server was fairly well locked down with minimal users, secure passwords and so on, but to be honest with other commitments I hadn't been keeping on top of patching.</p>

<p>Reviewing logs etc didn't show any clear point of entry, and since the server was rebooted I didn't see any  ongoing activity. I decided the best thing is just a clean rebuild, with better security, better monitoring, and keep on top of those patches.</p>

<p>The site is back up - but the code is based on Drupal 5 which isn't supported and I don't have time for an upgrade right now. What I've done is to run the site  locally (after audit) and put online a static html mirror. As well as leaving less avenue for attack this should make the site a lot faster to load. I keep meaning to revamp the site properly but just never seem to have time, and there are always paid tasks that take priority!</p>


<p>Comments are the main loss - but they were overloaded with spam anyway - so I'm trying out google plus comments instead which I hope will avoid the spam and give a better experience</p>



