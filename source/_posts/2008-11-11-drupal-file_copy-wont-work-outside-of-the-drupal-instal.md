---
layout: post
title: Drupal file_copy won't work outside of the Drupal instal
created: 1226436724
categories:
- php
- drupal
---
<p><b>The selected file could not be uploaded, because the destination  is not properly configured</b></p>
<p>
This "feature" has bitten me before. It's one of those annoying Drupal things which would be fine if the error message wasn't so misleading.
</p>
<p>
What's happening is that file_copy() calls file_create_path()
</p>
<?php
function file_copy(&$source, $dest = 0, $replace = FILE_EXISTS_RENAME) {
  $dest = file_create_path($dest);
?>

<p>While file_copy() doesn't declare that it only works in the Drupal folders - file_create_path is clear about this.</p>

<?php

/**
 * Make sure the destination is a complete path and resides in the file system
 * directory, if it is not prepend the file system directory.
 *
 * @param $dest A string containing the path to verify. If this value is
 *   omitted, Drupal's 'files' directory will be used.
 * @return A string containing the path to file, with file system directory
 *   appended if necessary, or FALSE if the path is invalid (i.e. outside the
 *   configured 'files' or temp directories).
 */
function file_create_path($dest = 0) {

?>

<p>
I need to copy files outside of the DocumentRoot to keep them private (yes I could put them in the DocumentRoot and restrict access to the folder but that is just perverse - and easy to get wrong).
</p>
<p>
So I need to avoid these functions.
</p>
 
