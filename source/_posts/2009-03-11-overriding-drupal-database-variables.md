---
layout: post
title: Overriding Drupal database variables
created: 1236760346
categories:
- drupal
---
Tucked away at the bottom of settings.php is the following comment.

<code>
/**
 * Variable overrides:
 *
 * To override specific entries in the 'variable' table for this site,
 * set them here. You usually don't need to use this feature. This is
 * useful in a configuration file for a vhost or directory, rather than
 * the default settings.php. Any configuration setting from the 'variable'
 * table can be given a new value.
 *
 * Remove the leading hash signs to enable.
 */
# $conf = array(
#   'site_name' => 'My Drupal site',
#   'theme_default' => 'minnelli',
#   'anonymous' => 'Visitor',
# );

</code>

What this allows is for you to store Drupal settings in code that override those in the database. 

This is especially useful if you have live and dev sites, load the live database to dev periodically but want to retain some dev specific settings.

It's easy to miss, but very handy.
