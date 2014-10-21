---
layout: post
title: github Jenkins Hook - multiple endpoints and API
created: 1375869048
categories:
- api
- note to self
- github
- curl
- jenkins
---



I wanted to trigger multiple jenkins servers from a github hook.

I found [this pull request](https://github.com/github/github-services/pull/604M/) which led me to look at the API

useful docs

 * http://developer.github.com/v3/repos/hooks
 * https://gist.github.com/caspyin/2288960

My code

```bash
  curl --user "me:mypassword" --request POST --data @jenkins.json  https://api.github.com/repos/myorg/myproject/hooks
```


here jenkins.json is like

```json

    {
      "name": "jenkins",
      "active": true,
      "events": [
        "push"
      ],
      "config": {
        "jenkins_hook_url": "http://jenkins.mydomain/github-webhook/"
      }
    }
```

What I found was that this just replaces my jenkins hook - which isn't what I wanted.

But the more I looked at the service hooks the more it looked like the jenkins one just passes a standard payload to a url, which is the same as the generic webhook, so I tried adding the jenkins webhook URL as a standard webhook ( you are allowed multiples of these) and that seems to work.



