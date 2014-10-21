---
layout: post
title: ! 'Check Drupal for update hook changes '
created: 1342111276
categories:
- drupal
- drupal planet
---
In a busy team, with ongoing testing I often find we have a production version of the site, a version under test, and another version being actively developed.

In fact it can be less clear than this if release planning isn't a priority, some teams simply churn out releases some of which get tested and eventually released.

This can lead to developers being unsure which update hooks have actually run on production (or will have run by the time the next release goes live).

In this case it's important for somebody to manually review all install files that have been edited and check that we don't end up releasing update hooks that have been edited after they have been run.

This script fires up a visual diff tool for the changed files.

test_tag = the tag of the release currently under test and close to being launched

future_release_tag = the tag of the subsequent expected release



<code>
#!/bin/bash

test_tag=$1
future_release_tag=$2


git checkout ${test_tag}
./download-database.sh
./build.sh

# make a note of update hooks run

for f in $(git log --oneline --name-only ${test_tag}..${future_release_tag}  | sort | uniq | grep \\.install | sed "s/.*\/\(.*\).install/\1/") ; do echo "select name, schema_version from system where name ='$f'" | drush sqlc  ; done

# this tells you the schema version at the end of the first update for modules that have edited install files

for f in $(git log --oneline --name-only ${test_tag}..${future_release_tag}  | sort | uniq | grep \\.install) ; do git difftool -y ${test_tag} ${future_release_tag} -- $f ; done

# review update hook edits

</code>
