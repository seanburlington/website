---
layout: post
title: simpletest vs phpunit
created: 1241610769
comments: true
categories:
- php
- drupal
- testing
---
<p>
There are two main options for unit testing PHP: simpletest and phpunit 
</p>
<p>
They both do a lot of the same stuff, both have the ability to run suites of tests and create mock objects.
</p>
<p>
Simpletest has a built in webTestCase which allows you to perform some integration as well as unit testing.
</p>
<p>An example web test for simpletest is:
<?php
    function testDefaultValue() {
        $this->get('http://www.my-site.com/');
        $this->assertField('a', 'A default');
        $this->setField('a', 'New value');
        $this->click('Go');
    }

?>

<p>Drupal has extended this further to include functions specific for Drupal login, creating users etc.</p>

<p>PHPUnit on the other hand has Selenium integration so that these sorts of integration tests can be run with a real browser (even with multiple browsers).</p>

<p>PHPUnit also has some useful tools to detect copy pasted code, calculate code soverage of tests, and integrates with Cruise Control</p>

<p>Simpletest's fake browser should be a lot faster to run than Selenium, but can't truly test JavaScript although ther is the facility to code in form changes that would normally occur via script.</p>
 
<p>Both projects are actively maintained, and supported.</p>

<p>So far I've mostly used simpletest because it's the default for Drupal; but I'm impressed with Selenium, and I'm tempted to use PHPUnit.</p>
