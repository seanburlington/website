---
layout: post
title: ! 'Importing Legacy Data for use as an LDAP Addressbook '
created: 1123430885
comments: true
categories:
- ldap
---
This
is something I played around with ages ago and didn’t make notes on -
now I’m doing a little more work pulling together what I learned then
along with some new stuff.
<div class="post-entry">
<p>
In /etc/ldap/slapd.conf
</p>
<p>
Pull in some standard schemas
</p>
<pre>
include         /etc/ldap/schema/core.schema
include         /etc/ldap/schema/cosine.schema
include         /etc/ldap/schema/nis.schema
include         /etc/ldap/schema/inetorgperson.schema
include         /etc/ldap/schema/mozillaOrgPerson_V0.6.1.schema
</pre>
<p>
define what are effectively the names of your database, the admin username and the admin password, <br />
I’ve used my domain name as the database name as this more or less
guarantees the name is globally unique which can be useful, it’s also
easy to remember<br />
The password is generated with  /usr/bin/ldappasswd (part of the ldap-utils package)
</p>
<pre>
# Define the root suffix you serve.
suffix          &quot;dc=uncertainty,dc=org,dc=uk&quot;
# Define a root DN for superuser privileges.
rootdn                &quot;cn=Manager,dc=uncertainty,dc=org,dc=uk&quot;
# Define the password used with rootdn.
rootpw    ***********
</pre>
<p>
Define read permissions as required for other users, set loglevel to
256 if you want to view queries being sent to the server for debugging
</p>
<p>
Next create an ldif file that defines your first ?container? followed by any entries
</p>
<pre>
# Organization for Example Corporation
dn: dc=uncertainty,dc=org,dc=uk
objectClass: dcObject
objectClass: organization
dc: uncertainty
o: Example Corporation
description: The Example Corporation
dn: cn=someone,dc=uncertainty,dc=org,dc=uk
cn: someone
sn: someone
postalCode: AB12 XQ7
homePostalAddress: a place somewhere
mail: fake@test.bla
objectclass: inetOrgPerson
</pre>
<p>
This can be entered with the command
</p>
<pre>
ldapadd -x -D &quot;cn=Manager,dc=uncertainty,dc=org,dc=uk&quot; -W -f  test.ldif
</pre>
<p>
which will prompt for the password created earlier
</p>
<p>
ldapmodify can be used to add (-a) or  update (default) use option -c to keep going even if errors are encountered
</p>
<p>
Configure your client to use Base DN as specified earlier - in my case dc=uncertainty,dc=org,dc=uk
</p>
<h2>Useful links</h2>
<p>
<a href="https://bugzilla.mozilla.org/show_bug.cgi?id=116692">Bug 116692<br />
Define official Mozilla LDAP schema extension</a><br />
<a href="http://www.yolinux.com/TUTORIALS/LinuxTutorialLDAP-GILSchemaExtension.html">YoLinux: OpenLDAP 2.x Schema Extension to support MS/Outlook, Netscape 4.5+</a>
</p>
<p>
<a href="http://www.openldap.org/faq/data/cache/294.html">OpenLDAP Faq-O-Matic : MS Outlook: How Do LDAP Attributes Map to Address Book Fields?</a>
</p>
</div>
