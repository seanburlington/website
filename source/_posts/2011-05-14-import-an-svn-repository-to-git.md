---
layout: post
title: Import an svn repository to git
created: 1305372373
comments: true
categories:
- svn
- git
---
You'll need to have git and git-svn installed.

The code samples are run in bash on Linux.
<h2>Initial Import</h2>

The import process can be slow if you have a lot of history to import as git-svn has to pull in every single revision individally. I've found it worthwhile creating a tiny svn repository to practice with as imports are quick and mistakes cheap.

<code>
mkdir mynewgitrepo
cd mynewgitrepo
git svn init <svn repo url>  --tags=tags --branches=branches --trunk=trunk --prefix=svn
git svn fetch  # this takes ages
</code>
 
You can use git-svn rebase to pull in further updates from svn and git-svn dcommit to commit back.

NB - if you are doing a one shot import and abandoning svn the look into the <a href="http://www.au.kernel.org/software/scm/git/docs/git-svn.html">authors-file and no-metadata options</a> - though <a href="http://www.au.kernel.org/software/scm/git/docs/git-filter-branch.html">git-filter-branch</a> may be a better way of cleaning up the history.

<h2>Local and remote Branches</h2>

git-svn creates remote branches that track changes in the svn repository, if you want to work on these branches you will need local copies, I've used the prefix "svn" on importing which will be applied to the remote branches which allows me to create local branches with the same name as is used in svn.

To create a local copy of branch 1.0
<code>
git branch 1.0 svn/1.0
</code>

To create local copies of all svn branches

<code>
for branch in $(git branch -r | grep -v tags | grep -v trunk) ; do echo git branch ${branch#svn/} $branch ; done > local_branches
# review local_branches file
. local_branches
</code>

NB when a new branch is created in svn it won't appear automatically in git - use git svn fetch to achive this and then create a local copy of it if needed.

<h2>Tags</h2>

Subversion doesn't really distinguish between tags and branches - there is just a convention that copies of trunk are stored in "branches" for further commits and in "tags" to be left as a record of a a point in time. But you can in fact continue to work on subversion tags.

What git-svn does is to import tags as branches prefixed with /tags if the tag has commits git-svn creates a branch for each commit named tags/$tagname@$revison_id

If you want to you can make true git tags from these and delete the git branches - though you will (presumably) lose the ability to obtain further updates on these later.

<code>
for tag in $(git branch -r | grep tags) ; do echo "git tag ${tag#tags/} $tag && git branch -r -d $tag "; done > converttags
# review converttags file
. converttags
</code>

<h2>Further git settings</h2>

Migrate svn ignore settings
<code>
git-svn show-ignore > .gitignore 
</code>
