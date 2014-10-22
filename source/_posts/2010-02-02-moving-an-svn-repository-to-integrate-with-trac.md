---
layout: post
title: Moving an svn repository to integrate with trac
created: 1265102951
comments: true
categories:
- ubuntu
- svn
- trac
---
<p>I just started on a project that was using trac and subversion but they weren't integrated. I love the cross referncing trac provides. It can really help explain changesets and show how an issue was resolved.</p>

<p>The steps to add subversion to trac are</p>

<ul>
<li>Stop people using the old repository</li>
<li>copy the repository files from one server to the other<br />I used tar and scp</li>
<li>edit trac.ini to add the location of the respository <br/>
Trac and svn must be on the same server</li>
<li>run trac-admin resync <br/>
This imports all the svn history.</li>
</ul>

<p>I enabled access to subversion via apache SSL while I could get access via the browser checking out code with different tools gave the follwoing errors


<code>
svn: OPTIONS of 'https://195.99.1.93/svn': 200 OK 

svn: PROPFIND of '/svn': 405 Method Not Allowed 

svn: Server sent unexpected return value (405 Method Not Allowed) in response to PROPFIND request for '/svn'
</code>

<p>Thanks to <a href="http://techpulp.com/2009/01/webdav-405-method-not-allowed-in-porpfind/">techpulp.com/2009/01/webdav-405-method-not-allowed-in-porpfind/</a> I found out that my problem was an extraneous trailing slash in my apache config!</p>

<p>I then ran svn relocate (right click on the repository using eclipse in the subversion perspective).</p>

<p>I moved Trac to SSL for good measure - changing the location on the task repository in eclipse was straightforward.</p>

<p>And as a finishing touch I customised Trac by adding a project logo - it goes in trac/htdocs/mylogo.png and is referenced in trac.ini as site/mylogo.png - I've failed this step before but actuallt read the docs this tim.</p>

