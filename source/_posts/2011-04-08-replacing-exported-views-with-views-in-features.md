---
layout: post
title: replacing exported views with views in features
created: 1302257131
comments: true
categories:
- drupa
- features
- views
---
We had an old Drupal module which contained exported views, most of our sites uses features to manage view - so when they needed updating we wanted to use features.

So we deleted the old module and added a new one with the required views.

And the views were blank.

In order to have this work smoothly on deployment I reinstated the old module and then


Added an uninstall hook that deleted the modules like
<?php
function my_views_uninstall() {
	$views = array('all_related_content',
                   'customised_search_results',
                   'footer_links',);

	foreach ($views as $view_name) {
		$view = views_get_view($view_name);
		$view->delete();
		views_object_cache_clear('view', $form_state['view']->name);
	}
}

?>

After this module is uninstalled, the new feature module installs and works as expected.

But it is important that these events happen in the correct sequence. 
