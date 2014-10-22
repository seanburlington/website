---
layout: post
title: Install runkit for unit testing
created: 1216917479
comments: true
categories:
- php
- drupal
- testing
---
<p>
Unit testing Drupal can be pretty challenging as it's hard to isolate parts of the code.
</p>
<p>
It seems :
</p>
<ul>
	<li><a href="http://drupal.org/node/237959?mode=2&amp;sort=2">Unit Testing Plan</a></li>
	<li><a href="http://www.lullabot.com/blog/drupalcon-simpletest-and-future-test-driven-development">Drupalcon: Simpletest and the Future of Test-Driven Development in Drupal</a></li>
	<li>http://groups.drupal.org/node/9412</li>
	<li><a href="http://dhubler.googlepages.com/drupalunittestingusingstandardtools">Drupal Unit Testing</a></li>
	<li><a href="http://groups.drupal.org/node/10957">Unit testing plan</a></li>
	<li><a href="http://www.workhabit.org/mock-function-testing-drupal">Mock function testing in Drupal</a></li>
	<li><a href="http://www.phppatterns.com/docs/develop/simpletest_mock_functions">Mocking Functions in Simple Test</a></li>
</ul>
<p>
that <a href="http://us.php.net/runkit">runkit</a> together with Drupal's implementation of SimpleTest is the way to go..
</p>
<p>
I found it a bit tricky to install on Linux (Ubuntu)
</p>
<p>
Some windows installers seem to have it built in but for those of us who like our dev and live environments to be similar:
</p>
<p>
Download runkit from cvs (I found the beta version to have bugs)
</p>

<code>
sudo aptitude install php-pear
sudo aptitude install php5-dev

mkdir temp
cd temp 

cvs -d:pserver:cvsread@cvs.php.net:/repository co pecl/runkit 
cvs -d:pserver:cvsread@cvs.php.net:/repository co pecl/runkit

cd pecl/runkit
phpize
./configure 
make

sudo  cp /home/sean/temp/pecl/runkit/modules/runkit.so /usr/lib/php5/20060613+lfs/
</code>
<p>
edit /et/php5/apache2/php.ini
</p>
<p>
add the line 
</p>
<code>
extension=runkit.so
</code>
<p>
restart apache 
</p>
<p>
&nbsp;
</p>
<p>
phpinfo() should now show
</p>
<p>
&nbsp;
</p>
<h2><a name="module_runkit">runkit</a></h2>
<table>
	<tbody>
		<tr class="h">
			<th>runkit support</th><th>enabled</th>
		</tr>
		<tr class="h">
			<th>version</th><th>1.0.0-dev</th>
		</tr>
		<tr class="h">
			<th>Custom Superglobal support</th><th>enabled</th>
		</tr>
		<tr class="h">
			<th>Sandbox Support</th><th>disable or unavailable</th>
		</tr>
		<tr class="h">
			<th>Runtime Manipulation</th><th>enabled</th>
		</tr>
	</tbody>
</table>

<p>Now all I've got to do is use it to build some tests...</p>
