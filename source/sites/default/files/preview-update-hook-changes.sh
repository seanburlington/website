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
