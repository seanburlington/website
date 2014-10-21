---
layout: post
title: Squid proxy password authentication
created: 1212948813
categories:
- linux
---
To set up squid to allow password authenticated access add the following to your squid.conf file.

<code>
auth_param basic program /usr/lib/squid3/ncsa_auth /etc/squid3/squid_passwords.txt
auth_param basic children 5
auth_param basic realm Squid proxy-caching web server
auth_param basic credentialsttl 2 hours

acl my_passwords proxy_auth REQUIRED

http_access allow my_password
</code>

Then create passwords with the htpasswd program.

<code>
htpasswd -c /etc/squid3/squid_passwords.txt my_username
</code>


<b>Health Warning</b>
These instructions are for squid3 and provide for Basic authentication which is not encrypted. It will get you up and running but should not be your only security or you may end up running an open proxy.
