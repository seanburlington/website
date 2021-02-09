---
layout: post
title: "Git Integration branch based workflow"
date: 2015-02-16 16:53:30 +0000
comments: true
categories: git "Version Control"

---

The branching strategy I've found most effective and flexible is to use one branch per release version that is used for integration and feature branches off these for everything else.

It's hard to visualise and I've tried drawing graphs but once I build in enough features to make the graph meaningful it is no longer easy to interpret.

At the end of the day there is a degree of complexity in a branching process suited to large teams and large projects - but it does come down to a few basic principles.

If you follow these principles you can maintain maximum release readiness, minimise conflicts, maximise flexibility, minimise bugs.

At the end of the day the goal is to try and make life easier for both the development team and the business team while delivering as much functionality as possible.

## 1 Each release has an Integration branch 

When we start work on a new version the first thing we do is create a new integration branch based on the latest version of the previous release's integration branch.

Releases are made from tags on this branch, no code gets merged to the integration branch until it has passed initial testing.

In theory the integration branch is always release ready - in real life we find some bugs later than we'd like, also sometimes we integrate early when we know a release is still a way off. 

## 2 Every feature or bugfix has a branch 

Developers (almost) never work directly on the integration branch but create a branch for very change from the earliest integration branch this change might be merged back into.

## 3 Merge forwards

Newer integration branches are forks of older integration branches so merging changes made to version x into version x+1 (or x+2 etc) will usually be trivial.

Feature branches are forks of integration branches - again this makes merging the integration code to the feature usually trivial.

I say the merge is usually trivial - occasionally two changes will have a conflict - for example if two developers have edited the same line in different ways. But by maintaining a branch hierarchy and merging frequently these conflicts are amazingly rare. Even when they do happen they will involve recently edited code which makes understanding the conflict much easier.

The thing that git is really really good at is merging two branches with a shared history.

If you do find you make a fix from a later integration branch (maybe you make a bugfix which you only later realise affects older releases too) then you may need to cherry pick commits back to an older branch - but this should be the exception.


## 4 Work in the oldest branch you can

If you don't know for sure which release a feature will be in start it from the oldest one it might be in - since integration branches share heritage you can 

You can always merge a feature branch to a later integration branch (since the later integration branch contains the older one). But the reverse is tricky and you would need to cherry pick. 


## 5 Always merge the Integration branch to the feature branch before merging a feature

Before merging a feature to the integration branch we first make sure that the feature branch has all the latest code for that release, then we test it.

This avoids the risk that our code works OK in isolation but conflicts in some way with another feature that was merged to integration after we started work.

It means that we will deal with any conflicts in the feature branch and that merging to integration will always be a simple fast forward merge with no conflicts.


## 6 Never commit what you can build

Don't put binary files or things like minified css/js in git, also don't commit version numbers. These sorts of files tend to change in multiple branches at once and are very prone to generating conflicts.

The better solution is to have a build script that pulls in any binaries needed from a separate store, builds minified  versions of files, does any compilation etc.

The build script could take the release number as a parameter or read it from a git tag and insert the version number into whatever file is needed.


### Side note on rebasing/squashing commits on feature branches

Take a look at google https://www.google.co.uk/webhp?q=git+to+squash+or+not+to+squash

There are a lot of opinions out there on whether or not to squash commits before merging a feature branch

Personally I prefer when people don't because I find that when they do the commit messages are quite terse "added feature foo"

I prefer to see the individual commits, and which lines were written at 5:30 on a Friday night when maybe someone was in a hurry to get home.

But if people do rebase then doing this on their feature branch just before merging to integration is a good time to do it.

Never rebase on integration.



