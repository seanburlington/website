#!/bin/bash -ex

cd $( dirname "${BASH_SOURCE[0]}" )
[ -d public ] && rsync -r --delete ./public/ practicalweb.co.uk:/var/www/practicalweb/
