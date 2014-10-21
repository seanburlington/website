---
layout: post
title: Git submodules and subtrees
created: 1353935257
categories:
- git
---
<p>Git has the concept of both submodules and subtrees, there seem to be some problems with each solution, nether being well loved as far as I can see.</p>

<p>Both add significant complexity to a project, and require extra care - but the alternative is monolithic projects or a lot of copy-pasting.</p>

<p>Submodules allow another git repo to be nested inside the main one, you can then commit to either repo from the same filesystem.<br />
The "parent" repo references a specific tag/branch of the child one - it's just this reference which is committed (and can be updated) in the parent.<br />
Commits in the parent relating to changes in subtree just show the ID changing and any message made when committing an updated version of the module. You can see commit history for the submodule when you are in that directory.
</p>
<p>The downside here being that neither a regular checkout nor a github tarball includes the child repo which adds overhead to dev build and server deploys.</p>

<p>Subtrees allow an additional external reference to be added and checked out as a subdirectory, this time the whole subdirectory is committed to the parent - but not the reference.<br />
The local repo does hold a reference and this allows the child repo to be merged in (preserving any local patches).<br />
The downside here is that the external reference has to be added manually to any repo that needs it, you don't see the submodule history in the parent.</p>

<p>There's a good article here <a href="http://codingkilledthecat.wordpress.com/2012/04/28/why-your-company-shouldnt-use-git-submodules/">http://codingkilledthecat.wordpress.com/2012/04/28/why-your-company-shouldnt-use-git-submodules</a> which basically says to use another tool - but that has it's own set of problems.</p>

