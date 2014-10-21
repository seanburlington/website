---
layout: post
title: Cookie Law and Do not Track
created: 1309164476
tags:
- cookie law
- privacy
- headers
- legal
---
<CODE>
GET /modules/system/defaults.css HTTP/1.1

Host: practicalweb

User-Agent: Mozilla/5.0 (X11; Linux i686; rv:5.0) Gecko/20100101 Firefox/5.0

Accept: text/css,*/*;q=0.1

Accept-Language: en-gb,en;q=0.5

Accept-Encoding: gzip, deflate

Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7

DNT: 1

Connection: keep-alive

Referer: http://practicalweb/

Cookie: AWSUSER_ID=awsuser_id1267039784500r3952; SESS1a1d5db3dbc3664c4c64eae6683efec0=1rjma31k4gio0bmfu3cjjag9o5



HTTP/1.1 200 OK

Date: Sun, 26 Jun 2011 14:02:55 GMT

Server: Apache/2.2.9 (Debian) PHP/5.3.3-0.dotdeb.1 with Suhosin-Patch mod_python/3.3.1 Python/2.5.2 mod_ssl/2.2.9 OpenSSL/0.9.8g mod_wsgi/2.5

Last-Modified: Sun, 17 Jan 2010 15:13:55 GMT

ETag: "3c418b-2e1-47d5daf6672c0"

Accept-Ranges: bytes

Content-Length: 737

Keep-Alive: timeout=15, max=100

Connection: Keep-Alive

Content-Type: text/css



/* $Id: defaults.css,v 1.2 2006/08/25 09:01:12 drumm Exp $ */

/*
** HTML elements
*/
fieldset {
  margin-bottom: 1em;
  padding: .5em;
}
form {
  margin: 0;
  padding: 0;
}
hr {
  height: 1px;
  border: 1px solid gray;
}
img {
  border: 0;
}
table {
  border-collapse: collapse;
}
th {
  text-align: left;
  padding-right: 1em;
  border-bottom: 3px solid #ccc;
}

/*
** Markup free clearing
** Details: http://www.positioniseverything.net/easyclearing.html
*/
.clear-block:after {
  content: ".";
  display: block;
  height: 0;
  clear: both;
  visibility: hidden;
}

.clear-block {
  display: inline-block;
}

/* Hides from IE-mac \*/
* html .clear-block {
  height: 1%;
}
.clear-block {
  display: block;
}
/* End hide from IE-mac */
</CODE>

http://www.ico.gov.uk/Global/privacy_statement.aspx
http://dnt.mozilla.org/
http://www.ico.gov.uk/~/media/documents/library/Privacy_and_electronic/Practical_application/advice_on_the_new_cookies_regulations.pdf
