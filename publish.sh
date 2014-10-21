#!/bin/bash -ex

[ -d public ] && rsync -rv --delete ./public/ practicalweb.co.uk:/var/www/practicalweb/
