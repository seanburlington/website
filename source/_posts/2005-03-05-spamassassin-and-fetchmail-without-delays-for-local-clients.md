---
layout: post
title: Spamassassin and fetchmail without delays for local clients
created: 1110038885
categories:
- email
- spam
---
<p>
Most of my mail is delivered by smtp directly to me, but my
secondary max records cause some mail to be delivered to a POP3
mailbox- this is then retrieved using spamassasin.
</p>
<p>
This works very well generally - I get my mail very quickly and implement spam/virus filtering.<br />
The only problem is that many spammers deliberately target secondary
mail servers as being less likely to have spam filtering, so I still
filter mail received vi fetchmail even though this is seen by my mail
server as local mail.
</p>
<p>
In order to allow my mail client to deliver to the server without
waiting for the spam scan I have configured the server to listen on two
local ip addresses (127.0.0.1 and 127.0.0.17) fetchmail delivers to the
first which is filtered - my mail client delivers to the second - and
mail to this address is accepted without spam scanning
</p>
