---
layout: post
title: When to Choose Drupal
created: 1257274330
comments: true
categories:
- drupal
- cms
- framework
---
<p>
Drupal is a very
flexible CMS which can be extended to provide the functionality
needed for may different types of website.
</p>
<p>
I've worked on a few
projects where I was brought in for my Drupal expertise, but in the
end felt that Drupal wasn't a good solution in these particular
circumstances. So I've been pondering what sorts of projects is
Drupal best suited to.
</p>
<p>
I'm not thinking about
small brochureware websites that might be best managed using
Wordpress, Joomla or the like as almost all my experience is of
larger projects where the alternatives are frameworks such as
Symfony, Rails, Struts etc – or pure custom code. 
</p>
<p>
I'm know it's possible
to run a successful Drupal project that doesn't have all the good
points and does have some bad points from the lists below – I've
done it.
</p>
<p>
But if anyone has
successfully delivered a regularly upgraded, high traffic, fully
tested web application with inflexible requirements using a large
team of OO programmers with little prior Drupal experience – well
I'd love to hear about it.
</p>
<h2>Drupal Positives</h2>
<ul>
	<li>
	Small team
	</li>
	<li>
	Drupal experience
	</li>
	<li>
	There is a maintenance plan 
	</li>
	<li>
	A single release
	</li>
	<li>
	Flexible specifications
	</li>
	<li>
	Content Oriented
	</li>
	<li>
	Greenfield project
	</li>
	<li>
	Moderate traffic
	</li>
</ul>
<h2>Drupal Negatives</h2>
<ul>
	<li>
	Large team
	</li>
	<li>
	Minimal Drupal experience
	</li>
	<li>
	OO skills
	</li>
	<li>
	No/low maintenance budget
	</li>
	<li>
	Regular upgrade cycle 
	</li>
	<li>
	Inflexible requirements
	</li>
	<li>
	Web Application
	</li>
	<li>
	AJAX heavy
	</li>
	<li>
	High traffic
	</li>
	<li>
	Testing a high priority
	</li>
	<li>
	Legacy systems integration
	</li>
</ul>
<h2>Team Size</h2>
<p>
I spent a year working on a Drupal project that
had about 15 developers, plus test team, designers, project
management etc.
</p>
<p>
It's possible, but with this size team we ran into
several problems.
</p>
<p>
In order to compose modules, content types, views,
blocks, menus etc to build useful functionality the developer
effectively works in the database a lot of the time. With small team
it is possible to share a database so that work done there can be
promoted directly to live just by selecting the required tables, with
a large team sharing the database would lead to too much downtime
(introduce a bad configuration and you have 14 people waiting for you
to fix it).
</p>
<p>
Databases aren't easy to version control –
especially when you need to take into account auto increment fields
so you don't get conflicting IDs when merging work from several
developers.
</p>
<p>
Drupal's install and update hooks can be useful
but they are targeted more at distribution than team synchronisation.
</p>
<p>
Generally we fond that the Drupal hook system
provides power without restraint – making it all too easy for a
module to implement something like hook_form_alter() in a way that
subtly breaks the behavior of an unrelated module elsewhere. 
</p>
<h2>Drupal vs OO experience</h2>
<p>
I've worked with some developers that love Drupal
some that didn't know it, and others that hate it. It's all to easy
when selecting a new technology to get carried away by the
possibilities, but don't forget technologies don't build websites –
people do.
</p>
<p>
“<em>For the overwhelming majority of the
bankrupt projects we studied, there was not a single technological
issue to explain the failure.” </em> 
<a href="/review/peopleware">Peopleware</a>
</p>
<p>
If your team
hates Drupal and loves OO then be very careful about selecting it for
your project, conversely if you're  Drupal shop full of experienced
Drupal developers you can probably get away with using Drupal when
it's outrageously unsuited to the task.
</p>
<h2>Maintenance</h2>
<p>
Any website
complex enough to consider using Drupal is going to need some
maintenance, but I am surprised by the frequency of Drupal updates
that need to be applied to keep the site secure.
</p>
<p>
I have written
applications without the benefit of a framework or CMS that after the
first month or two neither needed nor received any development work
for a period of years. I worked for a long time on an application
that has now run for seven years – during which time you might see
three or four incompatible Drupal versions released.
</p>
<p>
Security releases
are in general a good thing, and Drupal support is not short term so
this may not be a major concern for many projects – but Drupal is
not a “fire and forget” solution.
</p>
<h2>Release
Frequency</h2>
<p>
Deployment is
well accepted as being one of Drupal's weaknesses 
</p>
<p>
&quot;<em>Deployment of code, content, and configuration changes continue to be one of the big challenges in Drupal</em>&quot; <a href="http://association.drupal.org/Building-redesign-community-infrastructure-Administrators-wanted">Kieran Lal</a> 
</p>
<p>
If your project
is something you build, test, release, and finish: then deployment
isn't a problem.
</p>
<p>
If you need to
apply verified patches to fix bugs, while rolling out major upgrades
every couple of months: I can tell you from bitter experience that
Drupal can be a challenge.
</p>
<h2>Flexible
Specifications</h2>
<p>
Drupal can help
you develop functionality very quickly by using existing modules. But
these modules will already have an interface and a certain way of
doing things; if you can be flexible in the interpretation of
requirements then Drupal can be great. However if your project has to
meet specific client expectations and Drupal doesn't work quite that
way you may find yourself working very hard to alter Drupal to fit. 
</p>
<p>
See also<a href="http://www.sunlightlabs.com/blog/2009/content-management-systems-just-dont-work/"> http://www.sunlightlabs.com/blog/2009/content-management-systems-just-dont-work/</a>
</p>
<h2>Content Site or Web Application</h2>
<p>
Drupal is a very flexible CMS, and you can build
other things with it, but I don't think it qualifies as a framework
and so I wouldn't use it in that way to create an application.
</p>
<p>
Drupal has a very thin database layer, it doesn't
separate  the MVC components very well (theme, menu and model
functions all in the same module), and there are many holes in the
Drupal API.
</p>
<p>
On the other hand Drupal has a lot of content
oriented tools so if your project needs these it may well save a lot
of development time.
</p>
<h2>Greenfield or Legacy Integration</h2>
<p>
Drupal requires a certain database structure, with
even less flexibility if you use CCK if you already have a database
structure which you can't change it would be difficult to use Drupal.
You can integrate existing databases with Drupal but everyone I've
spoken to who has done this has ended up writing an import routine
that converts existing data into Drupal nodes, even if this involves
loading and submitting thousands of virtual Drupal forms.
</p>
<h2>AJAX</h2>
<p>
I've just finished a project which made heavy use
of AJAX, and I was surprised to find that Drupal did very little to
facilitate this and that I had to <a href="http://www.drupaler.co.uk/blog/naming-form-items-drupal/429">work around some problems</a>.
</p>
<p>
Sure you can do AJAX in Drupal – but if you're
going to be doing a lot of AJAX you might want to use a framework
that targets this.
</p>
<h2>Traffic levels</h2>
<p>
Drupal is resource intensive, CCK and Views can
hit the database pretty hard, Drupal's hook system gives you
flexibility but you pay for this by allowing each module to act
separately on the same event when a single action might be more
efficient.
</p>
<p>
If you throw enough hardware at Drupal you can
make it scale massively as Comic Relief does to notable effect –
but they do have to do a lot of work synchronising data and assets to
make this work.   
</p>
<p>
For sites with a normal amount of traffic Drupal
will be just fine anyway.
</p>
<h2>Testing</h2>
<p>
I've used Drupal's test framework where I can and
it's clearly been important in the development of Drupal 7 – but I
don't see it being used by developers day to day. I think this is
because Drupal isn't very test friendly. Any function may use the
database at any point, functions cache data internally, global
variables are used – tests are hard to isolate and run slowly.
</p>
<p>
For many websites rigorous testing isn't a
priority – but if it is there many frameworks offer strong support
for testing throughout development which may be helpful.
</p>
<h2>Conclusion</h2>
<p>
I hope people find these thoughts useful, they are
only intended as pointers based on my experience.
</p>
<p>
Many Drupal projects will succeed which have some
of the bad points listed above, just as other projects which could be
very good candidates for Drupal will succeed even if built using
other tools.
</p>
<p>
But if anyone has heard of Drupal success stories
that have none of my good points and all of the bad ones – please
do let me know about it.
</p>
