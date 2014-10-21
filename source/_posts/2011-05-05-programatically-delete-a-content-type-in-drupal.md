---
layout: post
title: Programatically Delete a content type in Drupal
created: 1304613296
categories:
- drupal
- snippet
---
<?php

$result = db_query("SELECT nid FROM node where type='mytype'");
while ($row = db_fetch_object($result)) {
    node_delete($row->nid);
}
node_type_delete('mytype');
?>
