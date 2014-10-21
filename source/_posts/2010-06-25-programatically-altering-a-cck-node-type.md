---
layout: post
title: Programatically altering a CCK node type
created: 1277465640
categories:
- drupal
- deployment
---
I've found altering CCK node types as part of a fully scripted deployment phase to be quite challenging.

The best I've come up with is to use features for the main config changes and adding fields, but this won't remove any fields - but CCK provides functions for this.

Oddly installing the features module doesn't make the database schema changes until after caches are cleared.

The following code updates my CCK type, with new fields and settings.

I want to change a text field to a link field - there doesn't seem to be a direct way to do this so I add the new link field in features, copy the data via SQL, then delete the old field.

The one thing I can't see a way to do is to delete a field group.

None of this is fully tested yet - I'm writing up as I go and will update if I hit issues.

<?php

// update CCK type via features module
drupal_install_modules(array( 'features', 'mytype'));

// flush caches to make schema change take effect
drupal_flush_all_caches();

// copy data from old text field to link
$items[] = update_sql("update content_type_mytype set field_mytype_link_url=field_mytype_url_value");


// delete old text field
content_field_instance_delete('field_mytype_url_value', 'mytype', FALSE);

// I'd like to delete a group but THIS DOESN'T WORK!
//  content_field_instance_delete('group_groupname_info', 'mytype', TRUE);


?>
