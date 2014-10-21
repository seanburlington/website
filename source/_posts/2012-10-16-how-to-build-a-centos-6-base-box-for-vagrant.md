---
layout: post
title: How to build a Centos 6 base Box for vagrant
created: 1350398761
categories:
- centos
- ci
- vagrant
- puppet
---
<p>I've been playing with <a href="http://vagrantup.com/">vagrant</a> a bit lately but of course the first thing I wanted was something they say is for advanced users only, creating my own base box.</p>

<p>I'm not sure why this is given such a stark warning, it is perhaps a little long, but it wasn't too difficult, and given that I want to match a client install as closely as possible I want centos 6.2 (client has RHEL6.2) /p>

<p>There is a list of pre-built boxes here <a href="http://www.vagrantbox.es/">www.vagrantbox.es</a> but I personally don't know how trustworthy those urls are.</p>


<p>So here is what I did (as well as I can reconstruct from notes) with a few comments.</p>

<p>I've tried to keep this quite detailed so that it should achievable even if you don't regularly install new OS's</p>

<h2>On your local dev machine</h2>
<p>I'm running Ubuntu 12.04.1 LTS locally</p>

<p>I have installed</p>

<pre>
i A virtualbox                                                                                                                      - x86 virtualization solution - base binaries                                                                                              
i A virtualbox-dkms                                                                                                                 - x86 virtualization solution - kernel module sources for dkms                                                                             
i A virtualbox-fuse                                                                                                                 - x86 virtualization solution - virtual filesystem                                                                                         
i   virtualbox-guest-additions-iso                                                                                                  - guest additions iso image for VirtualBox                                                                                                 
i   virtualbox-ose-dkms                                                                                                             - transitional package for virtualbox-dkms                                                                                                 
i   virtualbox-ose-fuse                                                                                                             - transitional package for virtualbox-fuse                                                                                                 
i   virtualbox-ose-qt                                                                                                               - transitional package for virtualbox-qt                                                                                                   
i A virtualbox-qt                                                                                                                   - x86 virtualization solution - Qt based user interface  


i   vagrant                                                                                                                         - Tool for building and distributing virtualized development environments                                                                  
</pre>

<pre>
wget http://mirrors.ukfast.co.uk/sites/ftp.centos.org/6.3/isos/i386/CentOS-6.3-i386-minimal.iso
</pre>

<h2>In Virtualbox GUI</h2>

<p><img src="/sites/default/files/step-1.jpeg" alt="step 1"><br />
Create a new VM</p>
<p><img src="/sites/default/files/step-2.jpeg" alt="step 2"><br />
Set OS to Linux and version to Red Hat<br />
Call it "vagrant-centos62" (ie vagrant-${osname}</p>
<p><img src="/sites/default/files/step-3.jpeg" alt="step 3">
Set memory to 512Mb (this is just a default and can be altered later)</p>
<p><img src="/sites/default/files/step-4.jpeg" alt="step 4"><br />
Create a new virtual hard disk 
</p>
<p><img src="/sites/default/files/step-5.jpeg" alt="step 5"><br />
Use the default virtualbox format
</p>
<p><img src="/sites/default/files/step-6.jpeg" alt="step 6"><br />
Choose dynamically sized (This means the VM will see a large disk - but the space won't be used on your real hard disk - unless the virtual one has actual data on it)</p>
<p><img src="/sites/default/files/step-7.jpeg" alt="step 7"><br />
Make it 32Gb in size (which should be big enough for most tasks)
</p>
<p><img src="/sites/default/files/step-8.jpeg" alt="step 8"><br />
Click create</p>

<h3>Virtualbox settings for this new VM</h3>


<p><img src="/sites/default/files/step-9.jpeg" alt="step 9"><br />
Disable audio support (not normally needed for a development VM)</p>
<p><img src="/sites/default/files/step-10.jpeg" alt="step 10"><br />
Same for USB</p>
<p><img src="/sites/default/files/step-11.jpeg" alt="step 11"><br />
In Storage settings choose a virtual CD - and broswe to the iso you downloaded earlier.
</p>
<p>Start the new VM<br />
</p>

<h2>In the Install process</h2>
<p>NB I don't show every single step here, as I got bored with all the confirmation screens. Hopefully the ones I mised are obvious enough.</p>
<p><img src="/sites/default/files/step-13.jpeg" alt="step 13"><br />
Select to install a new OS
</p>
<p><img src="/sites/default/files/step-14.jpeg" alt="step 14"><br />
Re-initialize the hard drive (this is just the one on the VM that has never been used)
</p>
<p><img src="/sites/default/files/step-15.jpeg" alt="step 15"><br />
Set the root password to "vagrant" (and remember it for later)
</p>
<p><img src="/sites/default/files/step-16.jpeg" alt="step 16"><br />
Accept defaults for partitioning the disk, "replace linux system"
</p>
<p><img src="/sites/default/files/step-17.jpeg" alt="step 17"><br />
Write changes to disk</p>
<p><img src="/sites/default/files/step-18.jpeg" alt="step 18"><br />
Reboot the VM
</p>

<h2>In the VM</h2>

<p>So now thew new VM is up and running, we just need to prepare it for vagrant</h2>

<p>Oddly centOS/RHEL network interfaces are not enabled by default, we need to change this.</p>

<pre>
vi /etc/sysconfig/network-scripts/ifcfg-eth0 
</pre>

<p>set ONBOOT="yes' and BOOTPROTO=dhcp</p> 

<p>Start the network</p>
<pre>ifup eth0</pre>


<p>Install some packages we need to get Virtualbox additions to work (do this before rebooting). ALso it is important to update - to ensure the kernel in use matches the kernel-devel package</p>

<pre>
yum update
yum install gcc make kernel-devel kernel-headers perl
</pre>

<p>Now shut down the VM a moment, and <b>in your local system</b> run


<pre>
VBoxManage modifyvm "vagrant-centos62" --natpf1 "guestssh,tcp,,2222,,22"
</pre>

<p>This will open an ssh port on localhost to the new VM (NB this can also be done via the GUI in advanced options on the network config).</p>

<p>Now start the VM again, and once booted, in the VM window menu, click "Devices" and "Install guest additions"</p>




<p>back in your local system again run</p>
<pre>ssh -p2222 root@localhost</pre>

<p>Great so now we have root on the new machine, in your normal terminal and it should be possible to copy-paste the following commands</p>

<pre>


mount /dev/cdrom /mnt/
sh /mnt/VBoxLinuxAdditions.run
</pre>

<p>errors related to KERN_DIR mean you don't have a matching running kernel and kerne-devel versions - check the update, install reboot steps above</p>

<p>Errors building openGL and windows drivers are expected (there is no windows system) these error messages don't mean the process failed.</p>

<p>Test that the additions are installed, the following command should run and print out some system facts</p>

<pre>VBoxControl  guestproperty enumerate</pre>

<p>Create vagrant user, group vagrant, password vagrant.</p>

<pre>
groupadd admin
useradd -G admin -p $(openssl passwd -1 vagrant) vagrant
</pre>

<p>Install and configure sudo for vagrant user to have passwordless sudo powers</p>
<pre>
yum -y install sudo

echo '
Defaults    env_keep += SSH_AUTH_SOCK 
%admin ALL=NOPASSWD: ALL
Defaults:vagrant !requiretty
' &gt; /etc/sudoers.d/vagrant

chmod 0440 /etc/sudoers.d/vagrant

# the above for copy-paste convenience NEVER do this on a remote machine - use visudo instead
</pre>
<p>ssh with sudo commands should work, only asking a password for login (not again for sudo) from you local system try </p>
<pre>
ssh -p2222 vagrant@localhost "sudo ls /"
</pre>

<p>Add vagrant's public key so vagrant user can ssh without password.</p>
<pre>
sudo -u vagrant mkdir /home/vagrant/.ssh 
sudo -u vagrant curl -k https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub > /home/vagrant/.ssh/authorized_keys
chmod 0755 /home/vagrant/.ssh
chmod 0644 /home/vagrant/.ssh/authorized_keys
</pre>
<p>These keys are reccomended for publically distributable base boxes, the keys are included in the vargant programs and so login 'just works' for anyone using vagrant. However this is not secure and these keys should only be allowed if your vagrant systems will be secured by a private network. If the boxes will be public use secure keys and and then specify the private key you created by setting config.ssh.private_key_path.</p>




<p>Install the Puppet Repository</p>

<p>According to the <a href="http://vagrantup.com/v1/docs/base_boxes.html">official documentation</a> 
<blockquote>Chef and Puppet for provisioning support
... are absolutely required of a base box in order to work properly with Vagrant.</blockquote> 

However this appears to me to be talking about a requirment for base boxes to be publically distributed, if you are building a base box for your own team I can't see why you would need either puppet or chef unless you will actually use them, but I may be wrong on this. The following instrcutions detail how to install both (on centos) </p>

<pre>
echo '[puppetlabs]
name=Puppet Labs Packages
baseurl=http://yum.puppetlabs.com/el/$releasever/products/$basearch/
enabled=1
gpgcheck=1
gpgkey=http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs
' >  /etc/yum.repos.d/puppet.repo


# Install the EPEL x86_64 YUM Repository

rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-7.noarch.rpm


# Install the Puppet Master packages (I'm not 100% sure if this is striclty required if you don't use the puppet master provisioner)

yum -y install puppet-server

#Install the Puppet Client packages

yum -y install puppet

</pre>

<p>If you want to use chef</p>

<pre>
rpm -Uvh http://rbel.frameos.org/rbel6

# Install Ruby and other development tools:
yum install ruby ruby-devel ruby-ri ruby-rdoc ruby-shadow gcc gcc-c++ automake autoconf make curl dmidecode

# On RHEL 6 you will need to add the "RHEL Server Optional" channel subscription for this command to succeed without missing dependencies.

#We prefer to install RubyGems from source rather than use the OS-provided version (if any), as it is cross platform, so we know what to expect.
Install RubyGems
cd /tmp
curl -O http://production.cf.rubygems.org/rubygems/rubygems-1.8.10.tgz
tar zxf rubygems-1.8.10.tgz
cd rubygems-1.8.10
ruby setup.rb --no-format-executable

# Install Chef Gem

gem install chef --no-ri --no-rdoc

</pre>

<p>Clean up (freeing up space to make the final box smaller)</p>
<pre>
yum remove gcc make kernel-devel kernel-headers perl
yum clean all
# TODO add more cleanup steps eg ruby tarballs, kernel-devel probably isn't needed after vbox additions is built etc
</pre>



<p>Finally shut down the VM, package the box and add it to your vagrant boxes.</p>
<p>On your local dev machine</p>
<pre>
vagrant package --output centos62.box --base vagrant-centos62
vagrant box add centos62 centos62.box
vagrant box list # this should show the new box
</pre>


<p>Now you can quickly create a Vagrant VM</p>
<pre>
mkdir vagrant_test
cd vagrant_test
vagrant init centos62
vagrant up
# wait while it boots
vagrant ssh
</code>

