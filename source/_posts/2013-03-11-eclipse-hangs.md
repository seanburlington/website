---
layout: post
title: Eclipse hangs
created: 1363012155
categories:
- eclipse
- note to self
---

<p>This worked for me today - saving it here so I can find it again</p>

<p><a href="http://off-topic.biz/en/eclipse-hangs-at-startup-showing-only-the-splash-screen/">http://off-topic.biz/en/eclipse-hangs-at-startup-showing-only-the-splash-screen/</a></p>

<pre>
cd .metadata/.plugins
mv org.eclipse.core.resources org.eclipse.core.resources.bak
Start eclipse. (It should show an error message or an empty workspace because no project is found.)
Close all open editors tabs.
Exit eclipse.
rm -rf org.eclipse.core.resources (Delete the newly created directory.)
mv org.eclipse.core.resources.bak/ org.eclipse.core.resources (Restore the original directory.)
Start eclipse and start working. :-)
</pre>
