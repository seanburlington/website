---
layout: post
title: How to create a custom yum repository on Centos 6
created: 1353516364
comments: true
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
If you want to create custom rpms and install then with the usual automated dependency management you'll need your own yum repository. This is just the RPMS and metadata in the format of static xml files served by a webserver.


## First you need a GPG key to sign your packages.

```bash
# make some randomness if running headless 
sudo rngd -r /dev/urandom 
# start the agent
gpg-agent --use-standard-socket --daemon
# interactive key generation (accept the defaults for key type, provide your name and email when promted)
gpg --gen-key
# 
gpg --export -a 'My Name' > MY-RPM-GPG-KEY
```

You won't need the random generator if you do this on a desktop, but on a headless system I found I needed this. These actions will store a private key in your keyring, and a public key in the specified file.


## Build your rpm

First configure rpm to use the key you just added to your key ring, checing you don't oveerwrite earlier configuration).

```bash
[ ! -f ~/.rpmmacros ] && echo '%_signature gpg
%_gpg_name  My Name
' > ~/.rpmmacros
```


Now build your RPM (assuming you are already setup to do this).

```bash
rpmbuild -bb --sign ~/rpmbuild/SPECS/my-project.spec
```

## Setup the Yum Repo
Setup apache, make the directory structure, with teh repo files. This can be the same or a different server to your build machine.

```bash

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

```

## Configure the system that will use the custom repo

Copy over the GPG key, and import it into the  rpm database.

```bash
sudo rpm --import MY-RPM-GPG-KEY
```

Configure yum to use the new repo.

```bash
echo '[my-repo]
name=My Custom Packages
baseurl=http://yum.example.com/myrepo
> /etc/yum.repos.d/my.repo 

```

Now you should be able to install your custom packages with regular yum commands. When you update your rpms just re-run the createrepo command to update the metadata.



