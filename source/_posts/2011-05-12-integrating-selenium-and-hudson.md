---
layout: post
title: Integrating Selenium and Hudson
created: 1305196080
categories:
- php
- drupal
- testing
- agile
- selenium
- phpunit
- simpletest
- hudson
---
<p>
Hudson http://hudson-ci.org/ is a continuous integration server - it runs and monitors 'jobs' in a way that is useful to regularly build software and report on any errors.
</p>
<p>
Selenium http://seleniumhq.org/ is a suite of tools specifically for testing web
applications - it tests the full website by automating the running of one or more browsers (so you can test all that pointy clicky ajaxy stuff)
</p>
<p>
You can generate selenium tests with a firefox plugin http://seleniumhq.org/projects/ide/ basic tests can be generated just by recording your actions on a website - and saved as an html test suite.
</p>
<p>
The seleniumhq plugin for hudson http://wiki.hudson-ci.org/display/HUDSON/Seleniumhq+Plugin will start the seleniumrc server, run this test suite, monitor test/failure status and display the selenium report. 
</p>
<p>
Just add this plugin to hudson, ensure you have the seleniumrc jar file available and configured in the global settings page.
</p>
<p>
If you are running hudson on your local development system you may just need to download all the components and configure a job for it to just work. BUT if you want to run these jobs on a machine you are not logged in to you will need to run Xvfb to provide a fake display that the browser can use. 
</p>
<p>
I've done this by 
</p>
<p>
setting the environment variable DISPLAY to :99 
</p>
<p>
running the following shell script before the selenium test suite
</p>
<code>
Xvfb :99 -fp /usr/share/X11/fonts/misc -screen 0 1024x768x24 &gt; xvfb.log 2&>1 &amp;<br />
echo $! &gt; xvfp.pid 
</code>
<p>
The SeleniumHQ testSuite config needs to know which browser to use, the staturl, where to find the tests and where to log the results  
</p>
<code>
kill $(cat xvfp.pid)
rm xvfb.pid
</code>
<p>
and checked the &quot;Publish Selenium Report&quot; option - configured to match the results file as above. 
</p>
<p>
I had hoped that I could export the DISPLAY variable within the script but that didn't work - the environment variable setting is global so I've limited hudson to run one job at a time as they all share a display.
</p>
<p>
I have redirected all output from xvfb to a logfile otherwise hudson complains about leaking file descriptors.
</p>
<p>
So far this is great - my tests get run regularly and reported consistently over time.
</p>
<p>
But these tests are written in selenese (an html table based markup) which while having a great deal to offer does not have the full power of a programming language so my next step is to run tests via phpunit (this way I can access the database, loop over my test suite for a range of browsers, and more)
</p>
<p>
This time I need to manage starting the selenium server as well as xvfb
</p>
<code>
Xvfb :99   -screen 0 1024x768x24 &> xvfb.log &
echo $! > xvfb.pid
export DISPLAY=:99
sleep 10
java -jar /path-to/selenium-server.jar &> selenium.log &
echo $! > selenium.pid
sleep 30

phpunit --log-xml phpunit.xml Example.php

kill $(cat xvfb.pid)
rm xvfb.pid 
kill $(cat selenium.pid)
rm selenium.pid     
</code>
<p>
I have instructed phpunit to log in xml format (aka junit format in more recent versions - but I'm running an old version of debian at the moment) 
</p>
<p>
I added the xunit plugin http://wiki.hudson-ci.org/display/HUDSON/xUnit+Plugin to hudson and configured &quot;Publish JUnit test result report&quot; for my project specifying phpunit.xml as in the above script.
</p>
<p>It's worth noting that Drupals simpletest can also provide output in junit format at least according to http://drupal.org/node/1024426 so it should be possible to mix test types and aggregate the reports.
<p>
So now it all seems to be working an I can run all my tests overnight - all software has bugs - but at least now we should see fewer bugs reoccur as we'll keep adding tests to prevent these things creeping up on us. 
</p>

