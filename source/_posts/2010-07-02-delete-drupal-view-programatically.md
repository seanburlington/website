---
layout: post
title: Delete Drupal View programatically
created: 1278066157
categories:
- drupal
- api
---
Quick function to delete a view.

This is basically what the UI form submit does.

<?php

function delete_view($name) {

	$view = views_ui_cache_load($name);
	$view->delete();
	views_object_cache_clear('view', $view->name);

}

?>
