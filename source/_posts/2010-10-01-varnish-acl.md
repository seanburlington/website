---
layout: post
title: Varnish ACL
created: 1285943785
comments: true
categories:
- linux
- varnish
---
To setup an IP based access control list so that only allowed users may access the site.


<code>
sub vcl_recv {

  if (!(client.ip ~ testers)) {
    error 403 "Access Denied - server in test mode (IP not in ACL)";
  }

}

acl testers {
    "localhost";
    "www.example.com";
    "192.168.0.1";
}
</code>

In my case I need to be able to test a dev site but don't want to make it public, we tried using password authentication but that made it harder to test varnish as the authentication headers affected caching.


