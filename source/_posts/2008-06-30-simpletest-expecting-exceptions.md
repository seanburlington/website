---
layout: post
title: SimpleTest - expecting Exceptions
created: 1214837903
comments: true
categories:
- php
- drupal
- testing
---
SimpleTest is a great testing framework for PHP, with a Drupal module available too.

Many tests are based on assert statements, but this patterns doesn't work for functions which are expected to throw Exceptions. As at the time of writing Drupal's simpletest module doesn't catch exceptions and so the whole test run stalls.

In that case the following patterns are often useful.

<?php 
try {
  foo($good_input);
  pass('Good input didn\'t throw and exeption'); 
} catch (MyException $e) {
  $this->fail($e->getMessage());
}

try {
  foo($bad_input);
  $this->fail($e->getMessage());
} catch (MyException $e) {
  pass('Bad input correctly threw an exception'); 
}
?>
