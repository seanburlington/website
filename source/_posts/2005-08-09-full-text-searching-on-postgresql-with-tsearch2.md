---
layout: post
title: ! 'Full text searching on PostgreSQL with tsearch2 '
created: 1123603685
comments: true
categories:
- postgresql
- sql
---
I’ve just been experimenting with text searches: <a href="http://www.sai.msu.su/%7Emegera/postgres/gist/tsearch/V2/docs/tsearch-V2-intro.html">http://www.sai.msu.su/~megera/postgres/gist/tsearch/V2/docs/tsearch-V2-intro.html</a>
<div class="post-entry">
<p>
It’s worth noting that most of the commands in the above tutorial
assume you are running as the database superuser, this is required to
run the setup script but then you can grant permission for an ordinary
user for the search tables (in the public schema names starting pg_ts_)
</p>
<p>
The search will only match words that start with the search term,
but is very fast and can search over several columns by maintaining a
combined index.
</p>
</div>
