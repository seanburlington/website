---
layout: post
title: Module to make the Title of node/add pages editable in Drupal
created: 1243248147
comments: true
categories:
- drupal
---
This module makes it possible to customise the title of the pages which add nodes to Drupal site.

By default these pages have the title "Create a $node_type" 

This module was paid for by http://www.consultanddesign.com/ who have asked for it to be contributed back to the community. I'm in the process of applying for a CVS account to do that properly, in the meantime here's the code.



<?php


/**
 * Implementation of hook_form_alter
 * 
 * This contains two cases.
 * 
 * For the form that edits node types it adds a field to record an additional title.
 * 
 * The form used to add a node uses this title if it is available.
 *
 * @param Array $form
 * @param Array $form_state
 * @param String $form_id
 */
function node_add_title_form_alter(&$form, &$form_state, $form_id) {
    global $user;
    
    if ($form_id == 'node_type_form') {
        $form['identity']['add_title'] = array(
		'#title' => t('Title for Add Page'),
        '#description' => t('If populated this field will be used instead of the "Create Blah" default title when adding a new node of this type'),
		'#type' => 'textfield',
        '#weight' => 0,
		'#required' => false,
        '#default_value' => variable_get("node_add_title_". $form['#node_type']->type, ''),
        );
    //    print_r($form);
        $form['#submit'][] = 'node_add_title_save';
        //print_r($form);
    }
     else if (preg_match('/([a-z0-9_]+)_node_form$/', $form_id, $matches)) {
        $new_title = variable_get('node_add_title_'.  $matches[1], '');
        if ($new_title) {
            drupal_set_title(t($new_title));
            // add a validate callback - just as a place to set title on validation
            $form['#validate'][] = 'node_add_title_set_title';
        }
    }
}

/**
 * Form submit handler.
 * 
 * This captures the value of the additional title and saves it as a Drupal variable.
 *
 * @param Array $form
 * @param Array $form_state
 */
function node_add_title_save(&$form, &$form_state) {
    variable_set("node_add_title_". $form_state['values']['type'], $form_state['values']['add_title']);

}

/**
 * Form validation handler.
 * 
 * Override the default title on validation if we have one.
 * 
 * @param array $form
 * @param array $form_state
 */
function node_add_title_set_title(&$form, &$form_state) {
    $new_title = variable_get('node_add_title_'.  $form['type']['#value'], '');
        if ($new_title) {
            drupal_set_title(t($new_title));
        }
}

?>

see also http://drupal.org/node/342750
