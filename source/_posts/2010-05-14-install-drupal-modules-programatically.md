---
layout: post
title: Install Drupal Modules Programatically
created: 1273826477
categories:
- drupal
---
In order to make releases repeatable, to be able to test updates and share work will colleagues it is really useful to install new modules (and disable old ones) in update hooks.

This way one just has to update the code, then run update.php and you have the latest version of the site.

It also makes it easy to pull in a copy of the live database and check that the update still works (because it's easy you actually find yourself doing it).

Well that's the logic, but it wasn't entirely obvious to me how to do this. 

The function module_enable() looks handy - but this doesn't run install hooks.

drupal_install_modules() is actually what you need - but you also need to clear the cache after installing.

<?php

function mymodule_update_6103(){
	$items = array();
	drupal_install_modules(array( 'path_redirect', 'tagadelic'));
	module_disable(array('oldmodule'));
	drupal_flush_all_caches();
	return $items;
}

?>

It would be nicer still if I returned something useful in the $items array ...
