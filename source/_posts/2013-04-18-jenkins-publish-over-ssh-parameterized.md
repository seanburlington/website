---
layout: post
title: Jenkins publish over ssh - parameterized
created: 1366304591
comments: true
categories:
- jenkins
---
<p>To have a jenkins job which acts on a remote server via ssh - and has a parameter to choose which server(s) to use.</p>

<ol>
<li>check <i>This build is parameterized</i></li>

<li>Make the parameter name something like TARGET_SERVER</li>
<li>add build step <i>Send files or execute commands over SSH</i></li>
<li>Add server</li>
<li>In server details click <i>advanced</i></li>
<li>add a value for <i>Label</i></li>
<li>at the end of the ssh section check <i>Parameterized publishing</i></li>
<li>specify the  <i>Parameter name</i> from earlier (TARGET_SERVER)</li>

</ol>

<p>Now when you run the job supply a value for the TARGET_SERVER parameter that can be a regex, the job will run the ssh sections on any servers that have a matching label.<p>
 
