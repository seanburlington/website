---
layout: post
title: Monitor filesystem for deletions
created: 1348826442
categories:
- drupal
- linux
- inotify-tools
---
<p>On a project I'm working on at the moment we have a problem, files are going missing.</p>

<p>We don't know which part of the system could be trashing these files (user uploaded images in this case) and they are on a shared filesystem so there are plenty of places to point fingers.</p>

<p>I've discovered a very handy toolset <a href="https://github.com/rvoicilas/inotify-tools/wiki">inotify-tools</a> Which hooks into the linix kernel and allows you to monitor actions like file deletion.</p>

<p>I my case all I need to do right now is monitor the files on each sytem that has access - and I'm hoping to catch which one does the delete</p>

<In my build script is now the code</p>

<code>
# stop monitoring for deletes through the build
[ -f ~/inotifywait.pid ] && kill $(cat ~/inotifywait.pid)

git pull
./build.sh 


# if the tool is installed - monitor file delets
which inotifywait &&
{
 nohup inotifywait -mr --timefmt '%d/%m/%y %H:%M' --format '%T %w %f %e' -e delete /var/www/sites/default/files/ &> ~/build-${JOB_NAME}-$(BUILD_NUMBER)-delete.log  &
 echo $! > ~/inotifywait.pid
}

</code>


This should create a log of any user files that get deleted between builds



