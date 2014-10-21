---
layout: post
title: ! 'Configure Apache SSL and Subversion in Debian in 683 seconds '
created: 1196612144
categories:
- svn
- apache
---
<div class="post-entry">
<p>
Shamelessly copied from:
</p>
<p>
<a href="http://www.geocities.com/arhuaco/doc/subversion/apache-subversion-in-debian.html">www.geocities.com/arhuaco/doc/subversion/apache-subversion-in-debian.html</a>
</p>
<p>
Configure Apache SSL and Subversion in Debian in 683 seconds
</p>
<p>
This just saved me lots of time and I want to keep a copy for later - just in case…
</p>
<p>
Mar 26 2005
</p>
<p>
(The apache2+SSL part was taken from the article Debian, Apache2 and SSL by Ian Miller)
</p>
<p>
Debian Sarge comes with an apache2 package. I thought I’d give this
a go to get it working with a self signed SSL certificate. However, I
had little idea of what I was doing. Eventually I worked it out - and
it’s easy:
</p>
<p>
    * Login or su as root<br />
* Run:
</p>
<p>
apt-get install apache2
</p>
<p>
    * Run the script
</p>
<p>
apache2-ssl-certificate
</p>
<p>
and tell it what it wants to know.
</p>
<p>
    * Make a copy of ‘/etc/apache2/sites-available/default’ - call it something like ’ssl’
</p>
<p>
 * Make a sym-link to this new site configuration from
/etc/apache2/sites-enabled/ You will see this is already done for
‘default’.
</p>
<p>
    * Add a
</p>
<p>
Listen 443
</p>
<p>
to /etc/apache2/ports.conf
</p>
<p>
 * Edit /etc/apache2/sites-available/ssl (or whatever you called
your new ssl site’s config) and change port 80 in the name of the site
to 443. Also change the virtual host setting. Add the lines “SSLEngine
On”, “SSLCertificateFile /etc/apache2/ssl/apache.pem” and “LoadModule
ssl_module /usr/lib/apache2/modules/mod_ssl.so”. My config file reads:
</p>
<p>
NameVirtualHost *:443<br />
<br />
LoadModule ssl_module /usr/lib/apache2/modules/mod_ssl.so<br />
SSLEngine On<br />
SSLCertificateFile /etc/apache2/ssl/apache.pem
</p>
<p>
 …
</p>
<p>
    * Restart apache2
</p>
<p>
/etc/init.d/apache2 restart
</p>
<p>
    * HTTPS should work.
</p>
<p>
Try: https://hostname/
</p>
<p>
    * Now, let’s start with subversion.
</p>
<p>
apt-get install libapache2-svn subversion subversion-tools
</p>
<p>
    * Create a repository.
</p>
<p>
cd /home<br />
mkdir svn<br />
chown www-data svn<br />
su www-data -c “svnadmin create svn/src”
</p>
<p>
    * If you let your users run as www-data they will be able to write to your repository!
</p>
<p>
    * Become root again and add the following lines our apache configuration (ssl), inside of the VirtualHost declaration.
</p>
<p>
 <br />
DAV svn<br />
SVNPath /home/svn/src
</p>
<p>
    AuthType Basic<br />
AuthName “My Subversion Repository”<br />
AuthUserFile /home/svn/.dav_svn.passwd<br />
Require valid-user<br />
</p>
<p>
    * Use this instead of “Require valid-user” if you don’t want to use passwords for read-only access
</p>
<p>
  <br />
Require valid-user<br />
</p>
<p>
    * Let’s add some users.
</p>
<p>
su www-data -c “htpasswd2 -c -m /home/svn/.dav_svn.passwd galactus”
</p>
<p>
    * Add another user (don’t use -c or it will recreate the file)
</p>
<p>
su www-data -c “htpasswd2 -m /home/svn/.dav_svn.passwd ceruno”<br />
su www-data -c “htpasswd2 -m /home/svn/.dav_svn.passwd n”
</p>
<p>
    * Test the repository
</p>
<p>
 1. Using your browser. Load https://hostname/svn/src/ in your
browser. Replace hostname with your host name or ip. You will get
something like:
</p>
<p>
Revision 0: /<br />
Powered by Subversion version 1.1.3 (r12730).
</p>
<p>
   1. From the command line:
</p>
<p>
 svn –username n import checkers https://localhost/svn/src -m “initial import”<br />
Authentication realm:  My Subversion Repository<br />
Password for ‘n’:<br />
Adding         checkers/trunk<br />
Adding         checkers/trunk/gendelta.pl<br />
Adding         checkers/site<br />
Adding         checkers/branches<br />
Adding         checkers/tags
</p>
<p>
Committed revision 1.
</p>
<p>
    * Load from the browser again.
</p>
<p>
Revision 1: /<br />
* branches/<br />
* site/<br />
* tags/<br />
* trunk/<br />
Powered by Subversion version 1.1.3 (r12730).
</p>
<p>
    * And that’s all so far.
</p>
</div>
