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

```java
import com.timgroup.statsd.StatsDClient;
import com.timgroup.statsd.NonBlockingStatsDClient;

StatsDClient statsd = new NonBlockingStatsDClient("jmeter.test", "statsd.exapmle.com", 8125);

props.put("statsd", statsd);

```


Now on the Sampler you want to record data for add a beanshell post processor

```java

import com.timgroup.statsd.StatsDClient;
import com.timgroup.statsd.NonBlockingStatsDClient;

StatsDClient statsd = (StatsDClient) props.get("statsd");
statsd.recordExecutionTime("loadtime", prev.getTime());

```

I've put an example test plan on github https://github.com/practicalweb/jmeter-statsd-demo
