---
layout: post
title: Selenium WebDriver annotations and firefox connection trouble
created: 1335958585
comments: true
categories:
- selenium
- webdriver
- maven
---
<p>
I needed to run some selenium tests written by a Java team using maven
</p>
<p>
I ran into a couple of errors
</p>
<p>
&nbsp;
</p>
<p>
<strong>Annotations are not supported in -source 1.3
</strong>
</p>
<p>
This error is because by default maven comples code to be compatible with an older version of Java
</p>
<p>
To fix I had to add the foloowing to then pom.xml file
</p>
<p>
 &lt;groupId&gt;org.apache.maven.plugins&lt;/groupId&gt;<br />
&lt;artifactId&gt;maven-compiler-plugin&lt;/artifactId&gt;<br />
&lt;version&gt;2.3.2&lt;/version&gt;<br />
&lt;configuration&gt;<br />
&lt;source&gt;1.6&lt;/source&gt;<br />
&lt;target&gt;1.6&lt;/target&gt;&lt;/configuration&gt;<br />
&lt;/plugin&gt;
</p>
<p>
This allows the use of more recent code constructs 
</p>
<p>
Next I had a firefox error 
</p>
<p>
<strong>org.openqa.selenium.firefox.NotConnectedException: Unable to connect to host 127.0.0.1 on port 7055 after 45000 ms. Firefox console output:</strong>
</p>
<p>
It seems that maven was targetting an older version of firefox than I am using, this time I changed the selenium version number in the config as below
</p>
<p>
             &lt;dependency&gt;<br />
                 &lt;groupId&gt;org.seleniumhq.selenium&lt;/groupId&gt;<br />
                 &lt;artifactId&gt;selenium-java&lt;/artifactId&gt;<br />
-                &lt;version&gt;2.14.0&lt;/version&gt;<br />
+                &lt;version&gt;2.19.0&lt;/version&gt;<br />
             &lt;/dependency&gt;  
</p>
<p>
&nbsp;
</p>
