---
layout: post
title: Adding more data types to schema API for Drupal 7
created: 1244406129
comments: true
categories:
- drupal
- postgresql
- mysql
- git
- sqlite
---

I've written a patch for Drupal 7 to enable date and time data types to be defined for the schema API.

http://drupal.org/node/200953

Update : [it got removed](https://www.drupal.org/node/866340)

<!--break-->

There seems to be some resistance to this idea due to concerns about compatibility between database versions (Drupal now supports MySQL, PostgreSQL and sqlite).


Personally I don't think Drupal can afford to work at lowest common denominator level if the aim is to be a serious option for the enterprise


Most professionally developed Drupal sites will have some (maybe a lot of) custom coding - this code is written with full awareness of which database will be used - and vendor specific SQL may be appropriate. 


For publicly available modules vendor neutral code is desirable but can't be guaranteed with the current schema API. 


Sqlite is never going to be able to do all the things 'real' databases can do, there may be some cases that some of the work can be done in PHP instead, or it may be that some modules just won't work for all systems.


Having said all this date and time data types are pretty standard stuff and hopefully my patch can be included in Drupal without rocking the boat.


I used a git mirror of the Drupal repository to develop this patch, and I'm pretty impressed with git - it is blazingly fast - it was great to be able to make local commits - and then to 'rebase' these wrapping several small commits into one really cleanup up my repository history. 

