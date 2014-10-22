---
layout: post
title: Nova client for rackspace servers
created: 1372804263
comments: true
categories:
- rackspace
- openstack
- nova
---

This took me a little while to figure out how to get the right parameters

I used password instead of API key and account ID instead of tenant ID which seemed to work<


```bash
nova --username $username --apikey $password --os_tenant_name $accountID --os_auth_url https://auth.api.rackspacecloud.com --os_region_name ORD  list
```
