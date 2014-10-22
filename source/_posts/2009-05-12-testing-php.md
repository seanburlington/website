---
layout: post
title: Testing PHP
created: 1242146456
comments: true
categories:
- php
- testing
- unit testing
- testfest
- phplondon
---
<p>
I had fun this weekend at the <a href="http://www.phplondon.org/" mce_href="http://www.phplondon.org/">PHP London</a> Test Fest, it was a great opportunity to learn something new and meet some great programmers.
</p>
<p>
The tests our team took on were based around the <a href="http://www.php.net/%7Ehelly/php/ext/spl/main.html" mce_href="http://www.php.net/~helly/php/ext/spl/main.html">SPL</a> <a href="http://uk.php.net/manual/en/spl.iterators.php" mce_href="http://uk.php.net/manual/en/spl.iterators.php">iterators</a> I hadn't used this part of PHP before and it was a great way to learn about it, especially as many of the functions we tested aren't documented yet.
</p>
<p>
What we did was :
</p>
<ol>
	<li>Take a copy of <a href="http://www.php.net/anoncvs.php" mce_href="http://www.php.net/anoncvs.php">PHP source code <br>
	</a></li>
	<li>extract this and run ./configure</li>
	<li> create a short script to run tests</li>
	<li>and another to run the checked out version of PHO</li>
	<li> Check the <a href="http://gcov.php.net/PHP_5_3/lcov_html/spl/spl_iterators.c.gcov.php" mce_href="http://gcov.php.net/PHP_5_3/lcov_html/spl/spl_iterators.c.gcov.php">test coverage reports</a></li>
	<li>Find an untested section of code (in red)</li>
	<li>Figure out what it does</li>
	<li>Write a test to run this part of code</li>
	<li>go to 5 </li>
</ol>
<p>
More details on how to write tests are at http://qa.php.net/write-test.php&nbsp;
</p>
<p>
I found the hardest bit was interpreting the C source code of PHP - this was made much easier by the mentors at the test fest, and once pointed in the right direction we were able to get going easily enough.
</p>
<p>
This does give me another reason to read this book: <br /><a href="/review/extending-and-embedding-php" mce_href="/review/extending-and-embedding-php"><img src="http://ecx.images-amazon.com/images/I/415rN3jdDvL._SL160_.jpg" mce_src="http://ecx.images-amazon.com/images/I/415rN3jdDvL._SL160_.jpg" alt="Extending and Embedding PHP Sara Golemon" width="125" height="160"></a>
</p>
<p>
One thing I didn't figure out on the day - in order to regenerate the coverage reports and check that the new tests do add coverage I needed to&nbsp; 
</p>
<code>
aptitude install lcov

make lcov TESTS=./path-to tests
</code>
<p>
NB you can either run all tests or just a subdirectory
</p>
<p>
The script to run tests was 
</p>
<code>
#!/bin/bash
export TEST_PHP_EXECUTABLE=/path-to/php5.3-200905081030/sapi/cli/php
$TEST_PHP_EXECUTABLE /path-to/php5.3-200905081030/run-tests.php $*
</code>
<p>
I also created an alias to sapi/cli/php so that I could run the tests as simple PHP scripts
</p>
