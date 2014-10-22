---
layout: post
title: Debugging Multiple Concurrent Sessions (AJAX/SOAP)
created: 1204535202
comments: true
categories:
- eclipse
- best practice
- ajax
---
<p>
I've recently been working with AJAX and SOAP which both result in multiple sessions running concurrently.
</p>
<p>
For example if you have an AJAX progress bar for a large file upload one session is uploading the file while a series of shorter sessions check on progress and update the bar.
</p>
<p>
How to track both parts of this cleanly has had me scratching my head a bit - but the solution is fiendishly simple.
</p>
<p>
It turns out that there is a buried configuration setting in Eclipse (my IDE of choice) which allows you to debug multiple sessions.
</p>
<p>
in Eclipse go to:
</p>
<p>
Window | Preferences ... | PHP | Debug | Installed Debuggers | XDebug | Configure
</p>
<p>
Then check the box that says 'Use Multisession'
</p>
<p>
<img src="/sites/default/files/multisession.png" alt="screenshot" />
</p>
<p>
Lo and Behold the debug pane now has a multisession manager and allows you to see what is happening on both sessions.
</p>
<p>
see also
<br />
http://dev.eclipse.org/newslists/news.eclipse.tools.pdt/msg01476.html
</p>
