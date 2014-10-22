---
layout: post
title: ! 'Connecting Tomcat 5 to apache 2 using mod jk 1.2 (in a virtual host and
  using Debian) '
comments: true
created: 1113062885
categories:
- java
- apache
- tomcat
---
This
is fairly well documented on the apache site - but you have to pull
info together from a few pages and the importance of virtual servers is
easy to miss.
<div class="post-entry">
<ol>
	<li>
	<p>
	Make sure you have the development package for apache (you need
	apxs2 installed) taking care to get the right apache2-dev package<br />
	I ran apt-get install apache2-prefork-dev
	</p>
	</li>
	<li>
	<p>
	<a href="http://www.apache.org/dist/jakarta/tomcat-connectors/jk/source/">Download the Source</a> (so that you can compile for your platform and your version of apache)
	</p>
	</li>
	<li>
	<p>
	extract the jk-connector source
	</p>
	</li>
	<li>
	<p>
	Change to the build directory<br />
	cd jakarta-tomcat-connectors-1.2.10-src/jk/native
	</p>
	</li>
	<li>
	<p>
	clean with make clean
	</p>
	</li>
	<li>
	<p>
	Configure for your apache with ./configure --with-apxs=/usr/bin/apxs2
	</p>
	</li>
	<li>
	<p>
	Build the module with make
	</p>
	</li>
	<li>
	<p>
	Switch to root
	</p>
	</li>
	<li>
	<p>
	Copy the module to the apache modules directory cp apache-2.0/mod_jk.so /usr/lib/apache2/modules/
	</p>
	</li>
	<li>
	<p>
	Create a load module file for apache /etc/apache2/mods-available/mod_jk.load<br />
	This file should just contain the line<br />
	LoadModule jk_module   /usr/lib/apache2/modules/mod_jk.so
	</p>
	</li>
	<li>
	<p>
	Create a Conf module /etc/apache2/mods-available/mod_jk.conf<br />
	Mine looks like this (still at the testing stage)
	</p>
	<pre>
		JkWorkersFile /etc/apache2/workers.properties
	# Where to put jk logs
	JkLogFile     /tmp/mod_jk.log
	# Set the jk log level [debug/error/info]
	JkLogLevel  debug
	JkLogStampFormat &quot;[%a %b %d %H:%M:%S %Y] &quot;
	# JkOptions indicate to send SSL KEY SIZE,
	JkOptions     +ForwardKeySize +ForwardURICompat -ForwardDirectories
	# JkRequestLogFormat set the request format
	JkRequestLogFormat     &quot;%w %V %T&quot;
	</pre>
	<p>
	The <a href="http://jakarta.apache.org/tomcat/connectors-doc/howto/apache.html">official howto</a>
	suggests that JkRequestLogFormat and JkMount can be configured on a per
	virtual host basis - the other directives seem to be required in the
	main apache config.
	</p>
	</li>
	<li>
	<p>
	enable these modules in the usual way by creating symlinks from mods-enabled to the files in mods-available
	</p>
	</li>
	<li>
	<p>
	Create a workers file (in the place specified above) /etc/apache2/workers.properties
	</p>
	<pre>
		workers.tomcat_home=/usr/local/jakarta-tomcat-5.0.18/
	workers.java_home=/usr/local/java/j2sdk1.4.2_04/
	ps=/
	# Define 1 real worker using ajp13
	worker.list=worker1
	# Set properties for worker1 (ajp13)
	worker.worker1.type=ajp13
	worker.worker1.host=127.0.0.1
	worker.worker1.port=8009
	worker.worker1.lbfactor=50
	worker.worker1.cachesize=10
	worker.worker1.cache_timeout=600
	worker.worker1.socket_keepalive=1
	worker.worker1.reclycle_timeout=300
	</pre>
	<p>
	I’m not sure if the first 3 lines are required.
	</p>
	</li>
	<li>
	<p>
	Add a line in your Virtual host config such as<br />
	JkMount  /manager/html/* worker1
	</p>
	</li>
	<li>
	<p>
	Restart apache
	</p>
	</li>
	<li>
	<p>
	You should now be able to access your tomcat app as http://yourvirtualhost/manager/html/<br />
	(or whichever apps you have used
	</p>
	</li>
</ol>
<p>
<a href="http://jakarta.apache.org/tomcat/connectors-doc/howto/quick.html">the official quick guide to workers</a>
</p>
<h2>Trouble Shooting</h2>
<p>
I had problems getting this working, it turned out to be because I
hade configured the jk directives in the vitual host sectionm of my
apache config but the error messages were not helpful - I just got <br />
jk_handler::mod_jk.c (1983): Could not find a worker for worker name=worker1
</p>
<h3>Testing the setup</h3>
<p>
Can you telnet to the apj13 port?<br />
telnet 127.0.0.1 8009<br />
You should see something like
</p>
<pre>
Trying 127.0.0.1...
Connected to 127.0.0.1.
Escape character is '^]'
</pre>
<p>
If this works your tomcat setup is OK - if not check your server.xml settings.
</p>
<p>
NB you can restrict tomcat to only listen to localhost by adding an address parameter like
</p>
<pre>
&lt;Connector address=&quot;127.0.0.1&quot; port=&quot;8009&quot; protocol=&quot;AJP/1.3&quot; protocolHandlerClassName=&quot;org.apache.jk.server.JkCoyoteHandler&quot; redirectPort=&quot;8443&quot;&gt;
</pre>
<p>
When I had tomcat running correctly and mod jk configured this is the output in my jk log
</p>
<pre>
[Sat Apr 09 22:21:48 2005] [23190:16512] [debug] do_shm_open::jk_shm.c (213): Using process memory as shared memory
[Sat Apr 09 22:21:48 2005] [23190:16512] [debug] init_jk::mod_jk.c (2341): Initialized shm:memory
[Sat Apr 09 22:21:48 2005] [23190:16512] [debug] uri_worker_map_open::jk_uri_worker_map.c (324): rule map size is 0
[Sat Apr 09 22:21:48 2005] [23190:16512] [debug] build_worker_map::jk_worker.c (219): creating worker worker1
[Sat Apr 09 22:21:48 2005] [23190:16512] [debug] wc_create_worker::jk_worker.c (125): about to create instance worker1 of aj
p13
[Sat Apr 09 22:21:48 2005] [23190:16512] [debug] wc_create_worker::jk_worker.c (138): about to validate and init worker1
[Sat Apr 09 22:21:48 2005] [23190:16512] [debug] ajp_validate::jk_ajp_common.c (1781): worker worker1 contact is '127.0.0.1:
8009'
[Sat Apr 09 22:21:48 2005] [23190:16512] [debug] ajp_init::jk_ajp_common.c (1870): setting socket keepalive to 1
[Sat Apr 09 22:21:48 2005] [23190:16512] [debug] ajp_init::jk_ajp_common.c (1909): setting socket timeout to -1
[Sat Apr 09 22:21:48 2005] [23190:16512] [debug] ajp_init::jk_ajp_common.c (1913): setting socket buffer size to 0
[Sat Apr 09 22:21:48 2005] [23190:16512] [debug] ajp_init::jk_ajp_common.c (1917): setting connection recycle timeout to 0
[Sat Apr 09 22:21:48 2005] [23190:16512] [debug] ajp_init::jk_ajp_common.c (1921): setting cache timeout to 600
[Sat Apr 09 22:21:48 2005] [23190:16512] [debug] ajp_init::jk_ajp_common.c (1925): setting connect timeout to 0
[Sat Apr 09 22:21:48 2005] [23190:16512] [debug] ajp_init::jk_ajp_common.c (1929): setting reply timeout to 0
[Sat Apr 09 22:21:48 2005] [23190:16512] [debug] ajp_init::jk_ajp_common.c (1933): setting prepost timeout to 0
[Sat Apr 09 22:21:48 2005] [23190:16512] [debug] ajp_init::jk_ajp_common.c (1937): setting recovery opts to 0
[Sat Apr 09 22:21:48 2005] [23190:16512] [debug] ajp_init::jk_ajp_common.c (1941): setting number of retries to 3
[Sat Apr 09 22:21:48 2005] [23190:16512] [debug] ajp_create_endpoint_cache::jk_ajp_common.c (1818): setting connection cache
size to 10
[Sat Apr 09 22:21:48 2005] [23190:16512] [debug] build_worker_map::jk_worker.c (231): removing old worker1 worker
[Sat Apr 09 22:21:49 2005] [23190:16512] [debug] jk_cleanup_shmem::mod_jk.c (1735): Shmem cleanup
[Sat Apr 09 22:21:49 2005] [23191:16512] [debug] do_shm_open::jk_shm.c (213): Using process memory as shared memory
[Sat Apr 09 22:21:49 2005] [23191:16512] [debug] init_jk::mod_jk.c (2341): Initialized shm:memory
[Sat Apr 09 22:21:49 2005] [23191:16512] [debug] uri_worker_map_open::jk_uri_worker_map.c (324): rule map size is 0
[Sat Apr 09 22:21:49 2005] [23191:16512] [debug] build_worker_map::jk_worker.c (219): creating worker worker1
[Sat Apr 09 22:21:49 2005] [23191:16512] [debug] wc_create_worker::jk_worker.c (125): about to create instance worker1 of aj
p13
[Sat Apr 09 22:21:49 2005] [23191:16512] [debug] wc_create_worker::jk_worker.c (138): about to validate and init worker1
[Sat Apr 09 22:21:49 2005] [23191:16512] [debug] ajp_validate::jk_ajp_common.c (1781): worker worker1 contact is '127.0.0.1:
8009'
[Sat Apr 09 22:21:49 2005] [23191:16512] [debug] ajp_init::jk_ajp_common.c (1870): setting socket keepalive to 1
[Sat Apr 09 22:21:49 2005] [23191:16512] [debug] ajp_init::jk_ajp_common.c (1909): setting socket timeout to -1
[Sat Apr 09 22:21:49 2005] [23191:16512] [debug] ajp_init::jk_ajp_common.c (1913): setting socket buffer size to 0
[Sat Apr 09 22:21:49 2005] [23191:16512] [debug] ajp_init::jk_ajp_common.c (1917): setting connection recycle timeout to 0
[Sat Apr 09 22:21:49 2005] [23191:16512] [debug] ajp_init::jk_ajp_common.c (1921): setting cache timeout to 600
[Sat Apr 09 22:21:49 2005] [23191:16512] [debug] ajp_init::jk_ajp_common.c (1925): setting connect timeout to 0
[Sat Apr 09 22:21:49 2005] [23191:16512] [debug] ajp_init::jk_ajp_common.c (1929): setting reply timeout to 0
[Sat Apr 09 22:21:49 2005] [23191:16512] [debug] ajp_init::jk_ajp_common.c (1933): setting prepost timeout to 0
[Sat Apr 09 22:21:49 2005] [23191:16512] [debug] ajp_init::jk_ajp_common.c (1937): setting recovery opts to 0
[Sat Apr 09 22:21:49 2005] [23191:16512] [debug] ajp_init::jk_ajp_common.c (1941): setting number of retries to 3
[Sat Apr 09 22:21:49 2005] [23191:16512] [debug] ajp_create_endpoint_cache::jk_ajp_common.c (1818): setting connection cache
size to 10
[Sat Apr 09 22:21:49 2005] [23191:16512] [debug] build_worker_map::jk_worker.c (231): removing old worker1 worker
[Sat Apr 09 22:21:50 2005] [23192:16512] [debug] do_shm_open::jk_shm.c (213): Using process memory as shared memory
[Sat Apr 09 22:21:50 2005] [23192:16512] [debug] jk_child_init::mod_jk.c (2307): Attached shm:memory
[Sat Apr 09 22:21:50 2005] [23192:16512] [debug] jk_child_init::mod_jk.c (2317): Initialized mod_jk/1.2.10
[Sat Apr 09 22:21:50 2005] [23193:16512] [debug] do_shm_open::jk_shm.c (213): Using process memory as shared memory
[Sat Apr 09 22:21:50 2005] [23193:16512] [debug] jk_child_init::mod_jk.c (2307): Attached shm:memory
[Sat Apr 09 22:21:50 2005] [23193:16512] [debug] jk_child_init::mod_jk.c (2317): Initialized mod_jk/1.2.10
[Sat Apr 09 22:21:50 2005] [23194:16512] [debug] do_shm_open::jk_shm.c (213): Using process memory as shared memory
[Sat Apr 09 22:21:50 2005] [23194:16512] [debug] jk_child_init::mod_jk.c (2307): Attached shm:memory
[Sat Apr 09 22:21:50 2005] [23194:16512] [debug] jk_child_init::mod_jk.c (2317): Initialized mod_jk/1.2.10
[Sat Apr 09 22:21:50 2005] [23195:16512] [debug] do_shm_open::jk_shm.c (213): Using process memory as shared memory
[Sat Apr 09 22:21:50 2005] [23195:16512] [debug] jk_child_init::mod_jk.c (2307): Attached shm:memory
[Sat Apr 09 22:21:50 2005] [23195:16512] [debug] jk_child_init::mod_jk.c (2317): Initialized mod_jk/1.2.10
[Sat Apr 09 22:21:50 2005] [23196:16512] [debug] do_shm_open::jk_shm.c (213): Using process memory as shared memory
[Sat Apr 09 22:21:50 2005] [23196:16512] [debug] jk_child_init::mod_jk.c (2307): Attached shm:memory
[Sat Apr 09 22:21:50 2005] [23196:16512] [debug] jk_child_init::mod_jk.c (2317): Initialized mod_jk/1.2.10
</pre>
<p>
The above appeared on apache startup - before any requests were made.
</p>
<p>
Even when it wasn’t working I could see apache trying to map requests to tomcat
</p>
<pre>
[Sat Apr 09 22:24:39 2005] [23193:16512] [debug] map_uri_to_worker::jk_uri_worker_map.c (455): Attempting to map URI '/manager/html/' from 0 maps
</pre>
</div>
