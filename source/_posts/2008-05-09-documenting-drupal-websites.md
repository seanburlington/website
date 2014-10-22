---
layout: post
title: Documenting Drupal Websites
created: 1210333422
comments: true
categories:
- drupal
- documentation
---
<p>
With any sizeable project maintaining good documentation is a challenge - it's all to easy to skimp on documentation, or to start with good intentions but allow the documentation to get out of date.
</p>
<p>
The <a href="http://drupal.org/project/api">Drupal API project</a> allows you to set up a documentation website for your project like <a href="http://api.drupal.org">api.drupal.org</a> that covers all your code.
<br />
The way this works is that you add doc comments to your code, and the Drupal API module extracts these to create the searchable and cross-referenced documentation.
</p>
<p>
Because doc comments are in the code it is easier to remember to update the documentation when you make a change.
To install the API module:
</p>
<ul>
	<li>Install Drupal</li>
	<li>add <a href="http://drupal.org/project/api">the api module</a></li>
	<li>configure the api module<br />
	<ul>
		<li>short name is used in urls</li>
		<li>Long name is displayed as the title</li>
		<li>Directory is the absolute path to the code you want indexed</li>
	</ul>
	</li>
	<li>
	<p>
	Add the special doc comment @mainpage {title} somewhere appropriate, this can either be a dediciated documentation page (with nothing but doc comments) or a doc comment in a logical place within your code.
	</p>
	<p>
	The key thing is that the {title} must be the same as the &quot;long name&quot; you chose earlier.
	</p>
	</li>
	<li>go to the administer blocks page</li>
	<li>enable the API search and API navigation blocks</li>
	<li>run cron a few times to get some pages indexed (by default only 10 pages are indexed at a time)</li>
	<li>That should be it</li>
</ul>
 
