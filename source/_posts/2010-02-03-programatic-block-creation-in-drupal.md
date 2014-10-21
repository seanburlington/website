---
layout: post
title: ! 'Programatic Block Creation in Drupal '
created: 1265219854
categories:
- drupal
---
<p>To remove static blocks and replace with as custom block.</p>

<p>Implement hook_block specifying the default visibility and so on</p>

<?php
$blocks['random'] = array(
      'info' => t('Random'),
      'weight' => 0,
      'status' => 1,
      'region' => 'sidebar',
      'pages'  => 'offers',
      'visibility' => 0, // all pages except
      'cache' => BLOCK_CACHE_PER_PAGE,
	);

?>

<p>Create an update hook that deletes the old blocks and boxes (I've specified the ID as I know they won't change on my site).</p>

<?php

function mymodule_update_6101(){
	
	$items = array();
	$items[] = update_sql('DELETE FROM {boxes} WHERE bid in (2, 12,13)');
	$items[] = update_sql("DELETE FROM {blocks} WHERE module = 'block' AND delta in (2, 12, 13)");

// Update the 'blocks' DB table with the blocks currently exported by modules.
// It's a "private" function called when you visit 
// the admin/build/block/list/ page
// calling it here causes the rehash which you otherwise have to visit the page to get
	_block_rehash();

// clear the cache
	cache_clear_all();
	return $items;
}

?>

<p>When you run update.php your shiny new blocks should then be immediately available with no manual steps required.</p>

<p>This makes it so much easier to test your upgrades.</p>
