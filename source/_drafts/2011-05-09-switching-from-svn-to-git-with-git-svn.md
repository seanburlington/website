---
layout: post
title: Switching from SVN to git with git-svn
created: 1304936996
tags:
- svn
- git
---
<p>
I've been working remotely a lot recently and access to the team svn repository is less than ideal - so I've taken the opportunity to start using git and have the benefits of a local repository.
</p>
<p>
Moving to git has been in many ways more of a challenge than adopting CVS or switching to SVN - mainly because you have to unlearn some things - which is always harder than just learning new things.
</p>
<p>
One thing I'd say from the outset is that git-svn is more complex than either git or svn on thier own as you have to keep two compteting systems in mind at once. If you can I'd reccomend learning git in a pure git environment. However if you want to use gt but can't make the whole team switch the git-svn does do its job well.
</p>
<p>
Some big differences 
</p>
<ul>
	<li>the basic unit of svn is a revison</li>
	<li>the basic unit of diff is a changset</li>
	<li>git allows you to change past commits</li>
</ul>
<p>
One of the main reasons that git is better at merging than svn seems to be that svn tries to diff two revisions (or branches) and apply the resulting patch to your working copy - whereas git applies a sequence of changes in order (initially rolling back some commits if required).
</p>
<p>
It is in retaining commit order that git avoids the spurious errors that svn can produce.
</p>
<p>
git-svn requires that you commit work locally before rebasing to merge in team changes from the svn repo. 
</p>
<p>
When pulling in team updates with `git-svn rebase` work you have already committed locally may get rolled back (temporarily) if there are earlier commits in svn - which can now be guarunteed to apply smoothly. Then your commits are re-applied - but this could trigger a conflict. In which case your working copy is left with all team commits applied but your local commits in need of resolving.
</p>
