---
layout: post
title: How to create a custom yum repository on Centos 6
created: 1353516364
categories:
- linux
- redhat
- centos
- rhel
- yum
- rpm
- repo
- repository
---
<p>If you want to create custom rpms and install then with the usual automated dependency management you'll need your own yum repository. This is just the RPMS and metadata in the format of static xml files served by a webserver.</p>


<h2>First you need a GPG key to sign your packages.</h2>

<code>
# make some randomness if running headless 
sudo rngd -r /dev/urandom 
# start the agent
gpg-agent --use-standard-socket --daemon
# interactive key generation (accept the defaults for key type, provide your name and email when promted)
gpg --gen-key
# 
gpg --export -a 'My Name' > MY-RPM-GPG-KEY
</code>

<p>You won't need the random generator if you do this on a desktop, but on a headless system I found I needed this. These actions will store a private key in your keyring, and a public key in the specified file.</p>


<h2>Build your rpm</h2>
<p>First configure rpm to use the key you just added to your key ring, checing you don't oveerwrite earlier configuration).</p>
<code>
[ ! -f ~/.rpmmacros ] && echo '%_signature gpg
%_gpg_name  My Name
' > ~/.rpmmacros
</code>
<p>Now build your RPM (assuming you are already setup to do this).</p>
<code>
rpmbuild -bb --sign ~/rpmbuild/SPECS/my-project.spec
</code>

<h2>Setup the Yum Repo</h2>
<p>Setup apache, make the directory structure, with teh repo files. This can be the same or a different server to your build machine.</p>

<code>

# make the repo base url
sudo mkdir -p /var/www/html/myrepo
# make it wrietable by you normal account
sudo chown $(id -un).$(id -gn) /var/www/html/myrepo 
# copy you rpm files
cp *rpm /var/www/html/myrepo
# create the metadata
createrepo /var/www/html/myrepo

# Setup an apache Alias for this directory
echo 'Alias /myrepo/ /var/www/html/myrepo/
' > /etc/httpd/conf.d/my-yum-repo 

# restart Apache to pickup the change
service restart httpd

</code>

<h2>Configure the system that will use the custom repo</h2>

<p>Copy over the GPG key, and import it into the  rpm database.</p>

<code>
sudo rpm --import MY-RPM-GPG-KEY
</code>

<p>Configure yum to use the new repo.</p>

<code>
echo '[my-repo]
name=My Custom Packages
baseurl=http://yum.example.com/myrepo
> /etc/yum.repos.d/my.repo 

</code>

<p>Now you should be able to install your custom packages with regular yum commands. When you update your rpms just re-run the createrepo command to update the metadata.</p>



