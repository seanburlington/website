---
layout: post
title: Drupal multisite with shared tables
created: 1218109341
comments: true
categories:
- drupal
- sql
---
Drupal allows you to create multiple sites sharing some or all of the same code and optionally sharing some database tables.

The documentation for the Drupal settings file 
http://api.drupal.org/api/file/sites/default/settings.php/5/source

includes the following 

<?php
/*
 * To have all database names prefixed, set $db_prefix as a string:
 *
 *   $db_prefix = 'main_';
 *
 * To provide prefixes for specific tables, set $db_prefix as an array.
 * The array's keys are the table names and the values are the prefixes.
 * The 'default' element holds the prefix for any tables not specified
 * elsewhere in the array. Example:
 *
 *   $db_prefix = array(
 *     'default'   => 'main_',
 *     'users'     => 'shared_',
 *     'sessions'  => 'shared_',
 *     'role'      => 'shared_',
 *     'authmap'   => 'shared_',
 *     'sequences' => 'shared_',
 *   );
 */
?>

This allows you to have several related sites which might (for example) share user tables so that users have single sign on, while having different tables for content.

Note that to get this functionality the sites have to share a single database.

I've never quite seen the point of multi site Drupal installs for unrelated projects, in theory this could save on upgrade work - but in practice I'd rather have the greater control that separate install gives you.

For a family of websites I can see a multi site install with some shared data being a really powerful and effective solution.
