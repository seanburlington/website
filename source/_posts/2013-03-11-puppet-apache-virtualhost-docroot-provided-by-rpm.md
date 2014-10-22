---
layout: post
title: Puppet - apache virtualhost Docroot provided by rpm
created: 1363023616
comments: true
categories:
- puppet
- rpm
---
<p>This has been annoying to work out.</p>


<p>The <a href="https://forge.puppetlabs.com/puppetlabs/apache">puppet apache module</a> will by default create the document root for a virtualhost if it is not already defined. But since I wanted the documentroot to be managed by a custom   RPM I don't have a reference to the actual directory in puppet.</p>

<p>It seems the thing to do is to create file named after the document root - but with an alternate path property. This way puppet/apache knows not to create the documentroot, and the one I make in puppet doesn't then get in the way of the RPM one.</p>

<code>

  apache::vhost { 'www.vagrant':
    priority        => '10',
    port            => '80',
    docroot         => "/var/www/html/foo",
    docroot_owner   => 'root',
    docroot_group   => 'root',
    override        => 'All',
    require         => Package['foo'],
  }

  file {'/var/www/html/foo':
      path => "/usr/share/doc/foo",
      content => "Puppet needs a file with an object name of teh docroot defined, this is that dummy file, the real docroot is defined in an rpm\n ",
      owner => root,
  }

</code>
