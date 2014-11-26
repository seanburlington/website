---
layout: post
title: "how to log from jmeter to statsd"
date: 2014-11-25 19:57:40 +0000
comments: true
categories: 
- jmeter
- statsd
- logging
- devops
- testing

---

In order to log from Jmeter to statsd you need to add [a statsd library](https://github.com/tim-group/java-statsd-client/releases/download/v3.0.1/java-statsd-client-3.0.1.jar) to the jmeter /lib path 

Then have a beanshell on the thread group setup a statsd object for use by the threads

store this in the props variable - JMeterProperties (class java.util.Properties)

Note that [the docs](https://docs.oracle.com/javase/7/docs/api/java/util/Properties.html) say 

> Because Properties inherits from Hashtable, the put and putAll methods can be applied to a Properties object. Their use is strongly discouraged as they allow the caller to insert entries whose keys or values are not Strings. The setProperty method should be used instead. If the store or save method is called on a "compromised" Properties object that contains a non-String key or value, the call will fail. Similarly, the call to the propertyNames or list method will fail if it is called on a "compromised" Properties object that contains a non-String key.

However I didn't find a better place to put the statsd object yet since the ctx variable is thread specific

```java
import com.timgroup.statsd.StatsDClient;
import com.timgroup.statsd.NonBlockingStatsDClient;

StatsDClient statsd = new NonBlockingStatsDClient("jmeter.test", "statsd.exapmle.com", 8125);

props.put("statsd", statsd);

```


Now on the Sampler you want to record data for add a beanshell post processor

You can retrieve the statsd connection from the props variable, and obtain the request time taken from the prev variable which is a org.apache.jmeter.samplers.SampleResult 

Onve we have the pieces together logging teh request time to statsd is simple

```java

import com.timgroup.statsd.StatsDClient;
import com.timgroup.statsd.NonBlockingStatsDClient;

StatsDClient statsd = (StatsDClient) props.get("statsd");
statsd.recordExecutionTime("loadtime", prev.getTime());

```

I've put an example test plan on github https://github.com/practicalweb/jmeter-statsd-demo
