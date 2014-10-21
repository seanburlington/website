---
layout: post
title: verbose remote ssh (with echo)
created: 1327078051
categories:
- linux
- bash
- ssh
- sysadmin
---
I usually manage website deployment with bash scripts that run remote commands on the servers


In order that I can see what is going on and debug any errors verbose output is useful.


Running "bash -ex" causes each line to be output as it progresses and halt on any error so that you don't miss it.

within the remote command "set -x" cuase bash to echo all commands

<code>
#!/bin/bash -ex
ssh -T user@server << EOF
set -x
echo foo > /dev/null
EOF
</code>
