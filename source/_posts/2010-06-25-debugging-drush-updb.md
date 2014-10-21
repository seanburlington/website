---
layout: post
title: Debugging drush updb
created: 1277456208
categories:
- drupal
- xdebug
- debugging
---
If you've ever tried to debug your update hooks via drush you may (like me) have been puzzled as to why your breakpoints don't seem to work.


It seems that proc_open() is used to avoid memory issues http://drupal.org/node/687724 (effectively resetting all the Drupal static variables??) and this separate process isn't available to the debugger.

After stepping though the drush update process I found where this happens and have a bypass that is basically functional (drush reporting seems broken - but I can step through my code).

This patch is the change I've made.

I bypass the patch process and go direct to the update.

<code>

--- commands/core/drupal/update_6.inc   (revision 547)
+++ commands/core/drupal/update_6.inc   (working copy)
@@ -424,10 +424,7 @@
       'error_message' => 'An unrecoverable error has occurred. You can find the error message below. It is advised to copy it to the clipboard for reference.',
       'finished' => 'update_finished',
     );
-    batch_set($batch);
-    $batch =& batch_get();
-    $batch['progressive'] = FALSE;
-    drush_backend_batch_process('updatedb-batch-process');
+    _update_do_one($module, $version, $batch);
   }
   else {
     drush_log(dt("No database updates required"), 'success');

</code>
