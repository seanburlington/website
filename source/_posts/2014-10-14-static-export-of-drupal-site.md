---
layout: post
title: Static export of Drupal site
created: 1413324637
comments: true
categories:
- drupal
- mod-rewrite
- static site
- wget
---
I've exported this site from Drupal using wget to create a static html version like

    wget  --mirror -p  -e robots=off --base=./ -k -P ./ http://localhost/

Then rsync to the server and use mod rewrite to retain the paged links like frontpage?page=4

I've had some trouble getting mod rewrite to work, it seems that getting apache to serve content from filenames containing question marks is tricky.

in apache 2.4 this worked

```ApacheConf
<VirtualHost *:80>
   ServerName practicalweb.localhost
   DocumentRoot /home/sean/rescue/localhost
   RewriteEngine on
   LogLevel alert rewrite:trace3
     <Directory /home/sean/rescue/localhost>
       RewriteCond %{QUERY_STRING} !=&quot;&quot;
       RewriteRule ^(.*) /home/sean/rescue/localhost/$1\%3F%{QUERY_STRING}? [L]
  
       Options Indexes FollowSymLinks MultiViews
      AllowOverride All
      Require all granted
   </Directory>
</VirtualHost>
```

But on apache 2.2 (which my server runs I) needed an external redirect


```ApacheConf
<VirtualHost *:80>

  DocumentRoot /var/www/practicalweb
  RewriteEngine on
  RewriteCond %{QUERY_STRING} !=&quot;&quot;
  RewriteRule ^(.*) $1\%3F%{QUERY_STRING}? [last,noescape,R]
	<Directory />
		Options FollowSymLinks
		AllowOverride None
	</Directory>
	<Directory /var/www/practicalweb>

		Options None
		AllowOverride None
		Order allow,deny
		allow from all
	</Directory>
</VirtualHost>
```

It still basically works - but users see a slightly changed URL which isn't quite what I wanted.
