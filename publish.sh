#!/bin/bash -ex

cd $( dirname "${BASH_SOURCE[0]}" )
[ -d public ] && rsync -rv --delete ./public/ practicalweb.co.uk:/var/www/practicalweb/
