---
layout: post
title: Selenium test for computedStyle
created: 1309246900
comments: true
categories:
- css
- testing
- selenium
---
I wanted to write some automated tests for CSS changes and bugs, these type of issues are quite prone to regression so re-running the tests has a large benefit.

It is possible to add new assertions to selenium via the user-extensions.js file

The following adds a test for computed style, this only works in firefox as far as I know - but some automation is better than none

<code>
//only works in firefox
Selenium.prototype.assertStyle = function(locator, text) { 
    var params = text.split('=', 2);
    
    var propertyName = params[0];
    var expectedValue = params[1];
    
    var element = this.page().findElement(locator);
    var actualValue = this.browserbot.getCurrentWindow().getComputedStyle(element, null).getPropertyValue(propertyName);
    Assert.matches(expectedValue, actualValue);
}; 

</code>


Now I can add a selenium test like
<code>
<table>
<tr>
	<td>assertStyle</td>
	<td>//td[@class='lender'][1]</td>
	<td>text-align=center</td>
</tr>

</table>
</code>
Selenium only lets me pass two parameters and really I want three (locator, css property, expected value). So I've hacked this and put two parameters into one - which is a bit smelly but for now gets the job done - comments on better methods very welcome.

I need to at least check that the 'text' parameter is validated properly - but I figured I'd blog now and update later as I've a deadline to meet today.
