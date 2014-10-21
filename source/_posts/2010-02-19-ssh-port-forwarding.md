---
layout: post
title: ssh port forwarding
created: 1266580442
categories:
- linux
- ssh
- port forwarding
---
Every now and again I find I have ssh access to one server - which has access to somewhere I need to get to - but I want direct access (eg to forward an X session)


<code>

ssh -L 2222:otherserver:22 server

ssh -X -p 2222 localhost

</code>

an now I'm  logged into othersever with forwarded X 
