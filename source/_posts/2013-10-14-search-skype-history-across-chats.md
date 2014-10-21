---
layout: post
title: Search skype history across chats
created: 1381768039
categories:
- skype
---
<p>I find a lot of clients use skype</p>

<p>For me the biggest frustration is the limited search</p>

<p>But it turns out the data is stored using sqlite - and so you can search using sql directly on the sqlite db files.</p>


<code>

sqlite3 -column ~/.Skype/$username/main.db "SELECT displayname, from_dispname, datetime(Messages.timestamp, 'unixepoch') as date, body_xml FROM Messages, Conversations where Conversations.id=Messages.convo_id and body_xml like '%$searchterm%' ORDER BY Messages.timestamp;"

</code>

or for all your chats from a given day


<code>
username=skype.name
thedate=$(date +%Y-%m-%d)
sqlite3 ~/.Skype/${username}/main.db "SELECT displayname, datetime(Messages.timestamp, 'unixepoch') as date, body_xml FROM Messages, Conversations where Conversations.id=Messages.convo_id and date(Messages.timestamp, 'unixepoch') == '${thedate}' and author='${username}' ORDER BY Messages.timestamp;"
</code>
