---
layout: post
title: node_save tags by term name with auto addition of new tags
created: 1316711548
categories:
- drupal
- programatically
- taxonomy
- drupal 7
---
Drupal lets you add a taxonomy term to a node and if you use the GUI you can have a nice auto-complete widget that takes term name - and iof the term doesn't exist yet you get a new term created when you save the node.

I wanted to access the same functionality on node I am generating from external data.

 
The key is to create the term array with tid = 'autocreate' - this and the vocabulary ID are enough to trigger the taxonomy module to lookup the tid for you - and adda new term is required.



<?php
$node = new stdClass();
$node->type='mytype';
$node-title='foo';
$node->body = 'bar';

$node->field_cat_tag['und'][0]['name'] =  $name;
$node->field_cat_tag['und'][0]['vocabulary_machine_name'] = $vocab_machine_name; // optional - helps performance if in a loop  
$node->field_g4_cat_tag['und'][0]['vid'] = $vid;
$node->field_g4_cat_tag['und'][0]['tid'] = 'autocreate';

$node_save($node);
?>
