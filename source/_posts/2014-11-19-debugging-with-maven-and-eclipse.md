---
layout: post
title: "Debugging with Maven and Eclipse"
date: 2014-11-19 16:11:44 +0000
comments: true
categories: 
- eclipse
- maven
- debugging
- java
---

To use eclipse with Maven you need to add the maven plugin to eclipse, it seems to be part of the Indigo update site so this should be straightforward.

It's also at http://download.eclipse.org/technology/m2e/releases

More instructions at http://maven.apache.org/guides/mini/guide-ide-eclipse.html

To run the debugger you need to do two things: you need to tell maven to run surefire, and run a remote java debug listening to that surefire

Setup a new "Debug configuration" > "Remote Java Application"

It should look like 
 
![screenshot](/images/eclipse/maven/surefire.png)

Next you need to run your maven code with the -Dmaven.surefire.debug

You can do this by adding it to the debug config like this

![screenshot](/images/eclipse/maven/main-project.png)

I've used the debug mode - but maybe a run configuration would work too

An alternative is to run the maven project on command line 

```bash
mvn test -Dmaven.surefire.debug
```

Generally if I'm using eclipse I prefer to do everything in the IDE (I stands for integrated after all) and it's useful to have the console output in the same place

Either way run the project to debug and maven will stop with output 

```
Listening for transport dt_socket at address: 5005
```

and wait till your debugger is attached

Now you have to start the remote application debug in eclipse

Execution will now stop at breakpoints and you will be able top explore the stack and all variables set


![screenshot](/images/eclipse/maven/debug.png)

This is an incredibly powerful way to explore running code, *especially* if you are unfamiliar with it. Even if you are familiar a debugger session can often be very enlightening.
 
