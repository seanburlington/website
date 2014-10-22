---
layout: post
title: Vagrant / Puppet project to setup a RPM build server and custom yum repository
created: 1353781179
comments: true
categories:
- redhat
- centos
- vagrant
- puppet
- devops
- yum
- rpm
---
<p>I've published a project on github <a href="https://github.com/practicalweb/vagrant-rpmbuild">https://github.com/practicalweb/vagrant-rpmbuild</a></p>



<p>The project contains a Vagrant config file, and Puppet manifests that together with an appropriate basebox will create a VM setup to build RPMS and host them on a Custom Yum repository</p>

<p>To run this</p>

<ol>
<li><p>Install vagrant <a href="http://vagrantup.com/">http://vagrantup.com/</a> (on Ubuntu just <code>apt-get install vagrant</code>)</p></li>
<li><p>Install Virtualbox <a href="https://www.virtualbox.org/wiki/Downloads">https://www.virtualbox.org/wiki/Downloads</a> (again on Ubuntu <code>apt-get install virtualbox</code>)</p></li>
<li><p>Clone this reporitory <code>git clone git@github.com:practicalweb/vagrant-rpmbuild.git</code></p></li>
<li><p>run <code>vagrant up</code> from the root of your cloned repository (NB the first time you do the a 600Mb base image will be downloaded)</p></li>
<li><p>run <code>vagrant ssh</code> to connect to the new VM  </p></li>
<li><p>To build the demo rpm and publish it locally run <code>/vagrant/build-rpm.sh</code> the key password is 'secret'</p></li>
<li><p>To install the demo package on the VM run <code>sudo yum install demo</code></p></li>
</ol><p>There is a Vagrant port forwarding rule, and firewall setup to allow the yum repo to be accessed on the host machine as http://localhos:8088/repo</p>

<p>This project is intended as documentation of how to setup this build environment, and as a starting point for further customisation, I'm sure it isn't perfect, I hope it is useful.</p>

<p>It's all released under GPL with no promise that it is fot for any purpose - see LICENCE.txt </p>

<p>I've tried to group the code logically, there are 4 modules</p>

<dl>
<dt>base</dt>
    <dd>This contains some generic stuff, pulling in a couple of packages not in the minimal centos install but that I find essential.</dd><dd>
    </dd><dd>The idea is that I would use this base module on every server I setup.</dd>

  

<dt>rpmbuild</dt>
    <dd>Just what is needed to actually build the RPMs</dd><dd>
  
  </dd>

<dt>tomyumrepo</dt>
     <dd>Just what is needed to serve a custom yum repository, the packages could be built elsewhere</dd>
  <dt>usemyrepo</dt>
     <dd>Config to setup a machine to consume yum packages.</dd>
     <dd>This could be added to the setup for any machine that needs to use the custom packages</dd>
</dl><p>I've included a minimal RPM project to get things rolling, it just installs a single text file.</p>

<p>I've built a GPG key to sign packages with, and also included a script ( generate-gpg-key.sh ) which shows how to generate a new one, edit this file to make your own key.</p>

<p>The base box I've defined is a minimal install of CentOS 6.3 (64 bit) with the dependencies required for vagrant.</p>

<p>Base boxes are quite a heavy download, but you only need to do it once and then you can have as many VMs as you want based on them, because the base is minimal and all extra config is done in puppet each of these VMs can serve a very differnt purpose - just by changing the Vagrantfile and puppet config.</p>

<p>The Vagrantfile runs puppet in standalone mode, but the modules <em>should</em> work with a client/server Puppet setup - so hopefully migrating the Vagrant setup to any Puppet manged system should be easy.</p>
