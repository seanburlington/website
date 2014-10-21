---
layout: post
title: ! 'Restoring an old postgresql database '
created: 1200499685
categories:
- postgresql
---
I’ve just had cause to restore a two year old backup of a database I haven’t used in a while
<div class="post-entry">
<p>
Since then postgresql (on Debian at least) has added the option to
have multiple ‘clusters’ and multple versions running on the same
machine.
</p>
<p>
Fortunately the old version (7.4) was still available<br />
</p>
<p>
Steps
</p>
<ul>
	<li>restore /var/lib/postgresql/data</li>
	<li>restore /etc/postgresql</li>
	<li>mkdir /var/lib/postgresql/7.4</li>
	<li>mv /var/lib/postgresql/data /var/lib/postgresql/7.4/</li>
	<li>chown -R postgres.postgres  /var/lib/postgresql/7.4/</li>
	<li>pg_createcluster 7.4 data (this moves the old data into the new structure)</li>
	<li>pg_upgradecluster 7.4 data (upgrade the data to the latest postgres version installed)</li>
</ul>
<p>
Other issues: my old data was in a character set I didn’t have installed as I now use UTF8
</p>
<p>
I had to add en_GB ISO-8859-1 to /etc/locale.gen
</p>
<p>
and run locale-gen
</p>
<p>
But I now have access to my old data in both old and new server
versions (I’ll probably delete the old one but it might be useful for
testing)
</p>
</div>
